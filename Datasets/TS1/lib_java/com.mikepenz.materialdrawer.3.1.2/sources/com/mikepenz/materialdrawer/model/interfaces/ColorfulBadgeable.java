package com.mikepenz.materialdrawer.model.interfaces;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/interfaces/ColorfulBadgeable.class */
public interface ColorfulBadgeable<T> extends Badgeable<T> {
    T withBadgeTextColor(int i);

    int getBadgeTextColor();

    void setBadgeTextColor(int i);

    void setBadgeBackgroundResource(int i);

    int getBadgeBackgroundResource();

    T withBadgeBackgroundResource(int i);
}
