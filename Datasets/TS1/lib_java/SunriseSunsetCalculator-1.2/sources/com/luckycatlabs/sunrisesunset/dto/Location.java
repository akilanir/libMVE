package com.luckycatlabs.sunrisesunset.dto;

import java.math.BigDecimal;

/* loaded from: SunriseSunsetCalculator-1.2.jar:com/luckycatlabs/sunrisesunset/dto/Location.class */
public class Location {
    private BigDecimal latitude;
    private BigDecimal longitude;

    public Location(String latitude, String longitude) {
        this.latitude = new BigDecimal(latitude);
        this.longitude = new BigDecimal(longitude);
    }

    public Location(double latitude, double longitude) {
        this.latitude = new BigDecimal(latitude);
        this.longitude = new BigDecimal(longitude);
    }

    public BigDecimal getLatitude() {
        return this.latitude;
    }

    public BigDecimal getLongitude() {
        return this.longitude;
    }

    public void setLocation(String latitude, String longitude) {
        this.latitude = new BigDecimal(latitude);
        this.longitude = new BigDecimal(longitude);
    }

    public void setLocation(double latitude, double longitude) {
        this.latitude = new BigDecimal(latitude);
        this.longitude = new BigDecimal(longitude);
    }
}
