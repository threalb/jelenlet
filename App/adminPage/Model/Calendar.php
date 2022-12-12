<?php

namespace App\adminPage\Model;

use Carbon\Carbon;


class Calendar {
    /**
     * @var Carbon
     */
    private $monthDate;

    /**
     * @var array
     */
    private $nonWorkdays;

    /**
     * @var array
     */
    private $weekends;

    /**
     * @var array
     */
    private $feastdays;

    /**
     * @var array
     */
    private $calendar;

    /**
     * @var array
     */
    private $calendarByWeek;

    /**
     * @var array
     */
    private $allKeys;

    /**
     * @param Carbon $date
     * @return static
     */
    public static function createByDate(Carbon $date) {
        $date = $date->copy();
        $date->day = 1;

        $instance = new static;
        $instance->monthDate = $date;

        return $instance;
    }

    /**
     * @param int $year
     * @param int $month
     * @return static
     */
    public static function createByYearAndMonth($year, $month) {
        $instance = new static;
        $instance->monthDate = (new Carbon())->setDate((int)$year, (int)$month, 1);

        return $instance;
    }

    /**
     * @return array
     */
    public function getNonWorkdays() {
        if (!isset($this->calendar)) {
            $this->generateCalendar();
        }

        return $this->nonWorkdays;
    }

    /**
     * @return array
     */
    public function getWeekends() {
        if (!isset($this->calendar)) {
            $this->generateCalendar();
        }

        return $this->weekends;
    }

    /**
     * @return array
     */
    public function getFeastDays() {
        if (!isset($this->calendar)) {
            $this->generateCalendar();
        }

        return $this->feastdays;
    }

    /**
     * @return array
     */
    public function getCalendar() {
        if (!isset($this->calendar)) {
            $this->generateCalendar();
        }

        return $this->calendar;
    }

    /**
     * @return array
     */
    public function getCalendarByWeek() {
        if (!isset($this->calendar)) {
            $this->generateCalendar();
        }

        return $this->calendarByWeek;
    }

    /**
     * @return array
     */
    public function getAllKeys() {
        if (!isset($this->calendar)) {
            $this->generateCalendar();
        }

        return $this->allKeys;
    }

    /**
     * @return int
     */
    public function getMonthLength() {
        return (int)$this->monthDate->format('t');
    }

    /**
     *
     */
    private function generateCalendar() {
        $start = $this->monthDate->copy();

        $this->nonWorkdays = [];
        $this->weekends = [];
        $this->feastdays = [];
        $this->calendar = [];
        $this->calendarByWeek = [];

        while ($start->month == $this->monthDate->month) {
            $date = $start->copy();

            $this->calendar[] = $this->calendarByWeek[$date->weekOfYear][$date->format('N')] = $date;

            $key = $date->format('Ymd');
            $this->allKeys[] = $key;

            if (in_array($date->dayOfWeek, [6, 0])) {
                $this->weekends[$key] = $this->nonWorkdays[$key] = true;
            }

            $start->addDays(1);
        }

        $this->generateFeastDays();
    }

    private function generateFeastDays() {
        $feastdayCollection = FeastDay::query()
            ->where('FeastD_IsActive', '=', 1)
            ->get(['FeastD_Year', 'FeastD_Month', 'FeastD_Day']);

        foreach ($feastdayCollection as $feastday) {
            if ($feastday->FeastD_Year) {
                $key = $feastday->FeastD_Year . str_pad($feastday->FeastD_Month, 2, '0', STR_PAD_LEFT) . str_pad($feastday->FeastD_Day, 2, '0', STR_PAD_LEFT);
            } else {
                $key = $this->monthDate->year .
                    str_pad($feastday->FeastD_Month, 2, '0', STR_PAD_LEFT) .
                    str_pad($feastday->FeastD_Day, 2, '0', STR_PAD_LEFT);
            }

            if (!isset($this->weekends[$key])) {
                $this->feastdays[$key] = $this->nonWorkdays[$key] = true;
            }
        }
    }

    /**
     * Calendar constructor.
     */
    private function __construct() {
    }
}