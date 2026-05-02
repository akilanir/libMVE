package com.mikepenz.materialdrawer.model.interfaces;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/interfaces/Badgeable.class */
public interface Badgeable<T> {
    T withBadge(String str);

    String getBadge();

    void setBadge(String str);
}
