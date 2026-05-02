package com.luckycatlabs.sunrisesunset;

import com.luckycatlabs.sunrisesunset.calculator.SolarEventCalculator;
import com.luckycatlabs.sunrisesunset.dto.Location;
import java.util.Calendar;
import java.util.TimeZone;

/* loaded from: SunriseSunsetCalculator-1.2.jar:com/luckycatlabs/sunrisesunset/SunriseSunsetCalculator.class */
public class SunriseSunsetCalculator {
    private Location location;
    private SolarEventCalculator calculator;

    public SunriseSunsetCalculator(Location location, String timeZoneIdentifier) {
        this.location = location;
        this.calculator = new SolarEventCalculator(location, timeZoneIdentifier);
    }

    public SunriseSunsetCalculator(Location location, TimeZone timeZone) {
        this.location = location;
        this.calculator = new SolarEventCalculator(location, timeZone);
    }

    public String getAstronomicalSunriseForDate(Calendar date) {
        return this.calculator.computeSunriseTime(Zenith.ASTRONOMICAL, date);
    }

    public Calendar getAstronomicalSunriseCalendarForDate(Calendar date) {
        return this.calculator.computeSunriseCalendar(Zenith.ASTRONOMICAL, date);
    }

    public String getAstronomicalSunsetForDate(Calendar date) {
        return this.calculator.computeSunsetTime(Zenith.ASTRONOMICAL, date);
    }

    public Calendar getAstronomicalSunsetCalendarForDate(Calendar date) {
        return this.calculator.computeSunsetCalendar(Zenith.ASTRONOMICAL, date);
    }

    public String getNauticalSunriseForDate(Calendar date) {
        return this.calculator.computeSunriseTime(Zenith.NAUTICAL, date);
    }

    public Calendar getNauticalSunriseCalendarForDate(Calendar date) {
        return this.calculator.computeSunriseCalendar(Zenith.NAUTICAL, date);
    }

    public String getNauticalSunsetForDate(Calendar date) {
        return this.calculator.computeSunsetTime(Zenith.NAUTICAL, date);
    }

    public Calendar getNauticalSunsetCalendarForDate(Calendar date) {
        return this.calculator.computeSunsetCalendar(Zenith.NAUTICAL, date);
    }

    public String getCivilSunriseForDate(Calendar date) {
        return this.calculator.computeSunriseTime(Zenith.CIVIL, date);
    }

    public Calendar getCivilSunriseCalendarForDate(Calendar date) {
        return this.calculator.computeSunriseCalendar(Zenith.CIVIL, date);
    }

    public String getCivilSunsetForDate(Calendar date) {
        return this.calculator.computeSunsetTime(Zenith.CIVIL, date);
    }

    public Calendar getCivilSunsetCalendarForDate(Calendar date) {
        return this.calculator.computeSunsetCalendar(Zenith.CIVIL, date);
    }

    public String getOfficialSunriseForDate(Calendar date) {
        return this.calculator.computeSunriseTime(Zenith.OFFICIAL, date);
    }

    public Calendar getOfficialSunriseCalendarForDate(Calendar date) {
        return this.calculator.computeSunriseCalendar(Zenith.OFFICIAL, date);
    }

    public String getOfficialSunsetForDate(Calendar date) {
        return this.calculator.computeSunsetTime(Zenith.OFFICIAL, date);
    }

    public Calendar getOfficialSunsetCalendarForDate(Calendar date) {
        return this.calculator.computeSunsetCalendar(Zenith.OFFICIAL, date);
    }

    public static Calendar getSunrise(double latitude, double longitude, TimeZone timeZone, Calendar date, double degrees) {
        SolarEventCalculator solarEventCalculator = new SolarEventCalculator(new Location(latitude, longitude), timeZone);
        return solarEventCalculator.computeSunriseCalendar(new Zenith(90.0d - degrees), date);
    }

    public static Calendar getSunset(double latitude, double longitude, TimeZone timeZone, Calendar date, double degrees) {
        SolarEventCalculator solarEventCalculator = new SolarEventCalculator(new Location(latitude, longitude), timeZone);
        return solarEventCalculator.computeSunsetCalendar(new Zenith(90.0d - degrees), date);
    }

    public Location getLocation() {
        return this.location;
    }
}
