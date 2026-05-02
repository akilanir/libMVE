package com.luckycatlabs.sunrisesunset;

import java.math.BigDecimal;

/* loaded from: SunriseSunsetCalculator-1.2.jar:com/luckycatlabs/sunrisesunset/Zenith.class */
public class Zenith {
    public static final Zenith ASTRONOMICAL = new Zenith(108.0d);
    public static final Zenith NAUTICAL = new Zenith(102.0d);
    public static final Zenith CIVIL = new Zenith(96.0d);
    public static final Zenith OFFICIAL = new Zenith(90.8333d);
    private final BigDecimal degrees;

    public Zenith(double degrees) {
        this.degrees = BigDecimal.valueOf(degrees);
    }

    public BigDecimal degrees() {
        return this.degrees;
    }
}
