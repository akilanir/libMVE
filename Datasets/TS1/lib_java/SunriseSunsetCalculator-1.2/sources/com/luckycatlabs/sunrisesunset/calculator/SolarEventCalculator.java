package com.luckycatlabs.sunrisesunset.calculator;

import com.luckycatlabs.sunrisesunset.Zenith;
import com.luckycatlabs.sunrisesunset.dto.Location;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.Calendar;
import java.util.TimeZone;

/* loaded from: SunriseSunsetCalculator-1.2.jar:com/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator.class */
public class SolarEventCalculator {
    private final Location location;
    private final TimeZone timeZone;

    public SolarEventCalculator(Location location, String timeZoneIdentifier) {
        this.location = location;
        this.timeZone = TimeZone.getTimeZone(timeZoneIdentifier);
    }

    public SolarEventCalculator(Location location, TimeZone timeZone) {
        this.location = location;
        this.timeZone = timeZone;
    }

    public String computeSunriseTime(Zenith solarZenith, Calendar date) {
        return getLocalTimeAsString(computeSolarEventTime(solarZenith, date, true));
    }

    public Calendar computeSunriseCalendar(Zenith solarZenith, Calendar date) {
        return getLocalTimeAsCalendar(computeSolarEventTime(solarZenith, date, true), date);
    }

    public String computeSunsetTime(Zenith solarZenith, Calendar date) {
        return getLocalTimeAsString(computeSolarEventTime(solarZenith, date, false));
    }

    public Calendar computeSunsetCalendar(Zenith solarZenith, Calendar date) {
        return getLocalTimeAsCalendar(computeSolarEventTime(solarZenith, date, false), date);
    }

    private BigDecimal computeSolarEventTime(Zenith solarZenith, Calendar date, boolean isSunrise) {
        date.setTimeZone(this.timeZone);
        BigDecimal longitudeHour = getLongitudeHour(date, Boolean.valueOf(isSunrise));
        BigDecimal meanAnomaly = getMeanAnomaly(longitudeHour);
        BigDecimal sunTrueLong = getSunTrueLongitude(meanAnomaly);
        BigDecimal cosineSunLocalHour = getCosineSunLocalHour(sunTrueLong, solarZenith);
        if (cosineSunLocalHour.doubleValue() < -1.0d || cosineSunLocalHour.doubleValue() > 1.0d) {
            return null;
        }
        BigDecimal sunLocalHour = getSunLocalHour(cosineSunLocalHour, Boolean.valueOf(isSunrise));
        BigDecimal localMeanTime = getLocalMeanTime(sunTrueLong, longitudeHour, sunLocalHour);
        BigDecimal localTime = getLocalTime(localMeanTime, date);
        return localTime;
    }

    private BigDecimal getBaseLongitudeHour() {
        return divideBy(this.location.getLongitude(), BigDecimal.valueOf(15L));
    }

    private BigDecimal getLongitudeHour(Calendar date, Boolean isSunrise) {
        int offset = 18;
        if (isSunrise.booleanValue()) {
            offset = 6;
        }
        BigDecimal dividend = BigDecimal.valueOf(offset).subtract(getBaseLongitudeHour());
        BigDecimal addend = divideBy(dividend, BigDecimal.valueOf(24L));
        BigDecimal longHour = getDayOfYear(date).add(addend);
        return setScale(longHour);
    }

    private BigDecimal getMeanAnomaly(BigDecimal longitudeHour) {
        BigDecimal meanAnomaly = multiplyBy(new BigDecimal("0.9856"), longitudeHour).subtract(new BigDecimal("3.289"));
        return setScale(meanAnomaly);
    }

    private BigDecimal getSunTrueLongitude(BigDecimal meanAnomaly) {
        BigDecimal sinMeanAnomaly = new BigDecimal(Math.sin(convertDegreesToRadians(meanAnomaly).doubleValue()));
        BigDecimal sinDoubleMeanAnomaly = new BigDecimal(Math.sin(multiplyBy(convertDegreesToRadians(meanAnomaly), BigDecimal.valueOf(2L)).doubleValue()));
        BigDecimal firstPart = meanAnomaly.add(multiplyBy(sinMeanAnomaly, new BigDecimal("1.916")));
        BigDecimal secondPart = multiplyBy(sinDoubleMeanAnomaly, new BigDecimal("0.020")).add(new BigDecimal("282.634"));
        BigDecimal trueLongitude = firstPart.add(secondPart);
        if (trueLongitude.doubleValue() > 360.0d) {
            trueLongitude = trueLongitude.subtract(BigDecimal.valueOf(360L));
        }
        return setScale(trueLongitude);
    }

    private BigDecimal getRightAscension(BigDecimal sunTrueLong) {
        BigDecimal tanL = new BigDecimal(Math.tan(convertDegreesToRadians(sunTrueLong).doubleValue()));
        BigDecimal innerParens = multiplyBy(convertRadiansToDegrees(tanL), new BigDecimal("0.91764"));
        BigDecimal rightAscension = setScale(convertRadiansToDegrees(new BigDecimal(Math.atan(convertDegreesToRadians(innerParens).doubleValue()))));
        if (rightAscension.doubleValue() < 0.0d) {
            rightAscension = rightAscension.add(BigDecimal.valueOf(360L));
        } else if (rightAscension.doubleValue() > 360.0d) {
            rightAscension = rightAscension.subtract(BigDecimal.valueOf(360L));
        }
        BigDecimal ninety = BigDecimal.valueOf(90L);
        BigDecimal longitudeQuadrant = sunTrueLong.divide(ninety, 0, RoundingMode.FLOOR);
        BigDecimal longitudeQuadrant2 = longitudeQuadrant.multiply(ninety);
        BigDecimal rightAscensionQuadrant = rightAscension.divide(ninety, 0, RoundingMode.FLOOR);
        BigDecimal augend = longitudeQuadrant2.subtract(rightAscensionQuadrant.multiply(ninety));
        return divideBy(rightAscension.add(augend), BigDecimal.valueOf(15L));
    }

    private BigDecimal getCosineSunLocalHour(BigDecimal sunTrueLong, Zenith zenith) {
        BigDecimal sinSunDeclination = getSinOfSunDeclination(sunTrueLong);
        BigDecimal cosineSunDeclination = getCosineOfSunDeclination(sinSunDeclination);
        BigDecimal zenithInRads = convertDegreesToRadians(zenith.degrees());
        BigDecimal cosineZenith = BigDecimal.valueOf(Math.cos(zenithInRads.doubleValue()));
        BigDecimal sinLatitude = BigDecimal.valueOf(Math.sin(convertDegreesToRadians(this.location.getLatitude()).doubleValue()));
        BigDecimal cosLatitude = BigDecimal.valueOf(Math.cos(convertDegreesToRadians(this.location.getLatitude()).doubleValue()));
        BigDecimal sinDeclinationTimesSinLat = sinSunDeclination.multiply(sinLatitude);
        BigDecimal dividend = cosineZenith.subtract(sinDeclinationTimesSinLat);
        BigDecimal divisor = cosineSunDeclination.multiply(cosLatitude);
        return setScale(divideBy(dividend, divisor));
    }

    private BigDecimal getSinOfSunDeclination(BigDecimal sunTrueLong) {
        BigDecimal sinTrueLongitude = BigDecimal.valueOf(Math.sin(convertDegreesToRadians(sunTrueLong).doubleValue()));
        BigDecimal sinOfDeclination = sinTrueLongitude.multiply(new BigDecimal("0.39782"));
        return setScale(sinOfDeclination);
    }

    private BigDecimal getCosineOfSunDeclination(BigDecimal sinSunDeclination) {
        BigDecimal arcSinOfSinDeclination = BigDecimal.valueOf(Math.asin(sinSunDeclination.doubleValue()));
        BigDecimal cosDeclination = BigDecimal.valueOf(Math.cos(arcSinOfSinDeclination.doubleValue()));
        return setScale(cosDeclination);
    }

    private BigDecimal getSunLocalHour(BigDecimal cosineSunLocalHour, Boolean isSunrise) {
        BigDecimal arcCosineOfCosineHourAngle = getArcCosineFor(cosineSunLocalHour);
        BigDecimal localHour = convertRadiansToDegrees(arcCosineOfCosineHourAngle);
        if (isSunrise.booleanValue()) {
            localHour = BigDecimal.valueOf(360L).subtract(localHour);
        }
        return divideBy(localHour, BigDecimal.valueOf(15L));
    }

    private BigDecimal getLocalMeanTime(BigDecimal sunTrueLong, BigDecimal longitudeHour, BigDecimal sunLocalHour) {
        BigDecimal rightAscension = getRightAscension(sunTrueLong);
        BigDecimal innerParens = longitudeHour.multiply(new BigDecimal("0.06571"));
        BigDecimal localMeanTime = sunLocalHour.add(rightAscension).subtract(innerParens).subtract(new BigDecimal("6.622"));
        if (localMeanTime.doubleValue() < 0.0d) {
            localMeanTime = localMeanTime.add(BigDecimal.valueOf(24L));
        } else if (localMeanTime.doubleValue() > 24.0d) {
            localMeanTime = localMeanTime.subtract(BigDecimal.valueOf(24L));
        }
        return setScale(localMeanTime);
    }

    private BigDecimal getLocalTime(BigDecimal localMeanTime, Calendar date) {
        BigDecimal utcTime = localMeanTime.subtract(getBaseLongitudeHour());
        BigDecimal utcOffSet = getUTCOffSet(date);
        BigDecimal utcOffSetTime = utcTime.add(utcOffSet);
        return adjustForDST(utcOffSetTime, date);
    }

    private BigDecimal adjustForDST(BigDecimal localMeanTime, Calendar date) {
        BigDecimal localTime = localMeanTime;
        if (this.timeZone.inDaylightTime(date.getTime())) {
            localTime = localTime.add(BigDecimal.ONE);
        }
        if (localTime.doubleValue() > 24.0d) {
            localTime = localTime.subtract(BigDecimal.valueOf(24L));
        }
        return localTime;
    }

    private String getLocalTimeAsString(BigDecimal localTimeParam) {
        if (localTimeParam == null) {
            return "99:99";
        }
        BigDecimal localTime = localTimeParam;
        if (localTime.compareTo(BigDecimal.ZERO) == -1) {
            localTime = localTime.add(BigDecimal.valueOf(24.0d));
        }
        String[] timeComponents = localTime.toPlainString().split("\\.");
        int hour = Integer.parseInt(timeComponents[0]);
        BigDecimal minutes = new BigDecimal("0." + timeComponents[1]).multiply(BigDecimal.valueOf(60L)).setScale(0, RoundingMode.HALF_EVEN);
        if (minutes.intValue() == 60) {
            minutes = BigDecimal.ZERO;
            hour++;
        }
        if (hour == 24) {
            hour = 0;
        }
        String minuteString = minutes.intValue() < 10 ? "0" + minutes.toPlainString() : minutes.toPlainString();
        String hourString = hour < 10 ? "0" + String.valueOf(hour) : String.valueOf(hour);
        return hourString + ":" + minuteString;
    }

    protected Calendar getLocalTimeAsCalendar(BigDecimal localTimeParam, Calendar date) {
        if (localTimeParam == null) {
            return null;
        }
        Calendar resultTime = (Calendar) date.clone();
        BigDecimal localTime = localTimeParam;
        if (localTime.compareTo(BigDecimal.ZERO) == -1) {
            localTime = localTime.add(BigDecimal.valueOf(24.0d));
            resultTime.add(11, -24);
        }
        String[] timeComponents = localTime.toPlainString().split("\\.");
        int hour = Integer.parseInt(timeComponents[0]);
        BigDecimal minutes = new BigDecimal("0." + timeComponents[1]).multiply(BigDecimal.valueOf(60L)).setScale(0, RoundingMode.HALF_EVEN);
        if (minutes.intValue() == 60) {
            minutes = BigDecimal.ZERO;
            hour++;
        }
        if (hour == 24) {
            hour = 0;
        }
        resultTime.set(11, hour);
        resultTime.set(12, minutes.intValue());
        resultTime.set(13, 0);
        resultTime.set(14, 0);
        resultTime.setTimeZone(date.getTimeZone());
        return resultTime;
    }

    private BigDecimal getDayOfYear(Calendar date) {
        return new BigDecimal(date.get(6));
    }

    private BigDecimal getUTCOffSet(Calendar date) {
        BigDecimal offSetInMillis = new BigDecimal(date.get(15));
        BigDecimal offSet = offSetInMillis.divide(new BigDecimal(3600000), new MathContext(2));
        return offSet;
    }

    private BigDecimal getArcCosineFor(BigDecimal radians) {
        BigDecimal arcCosine = BigDecimal.valueOf(Math.acos(radians.doubleValue()));
        return setScale(arcCosine);
    }

    private BigDecimal convertRadiansToDegrees(BigDecimal radians) {
        return multiplyBy(radians, new BigDecimal(57.29577951308232d));
    }

    private BigDecimal convertDegreesToRadians(BigDecimal degrees) {
        return multiplyBy(degrees, BigDecimal.valueOf(0.017453292519943295d));
    }

    private BigDecimal multiplyBy(BigDecimal multiplicand, BigDecimal multiplier) {
        return setScale(multiplicand.multiply(multiplier));
    }

    private BigDecimal divideBy(BigDecimal dividend, BigDecimal divisor) {
        return dividend.divide(divisor, 4, RoundingMode.HALF_EVEN);
    }

    private BigDecimal setScale(BigDecimal number) {
        return number.setScale(4, RoundingMode.HALF_EVEN);
    }
}
