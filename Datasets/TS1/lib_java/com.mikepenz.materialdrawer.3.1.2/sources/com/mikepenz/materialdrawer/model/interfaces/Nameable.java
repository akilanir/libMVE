package com.mikepenz.materialdrawer.model.interfaces;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/interfaces/Nameable.class */
public interface Nameable<T> {
    T withName(String str);

    T withName(int i);

    String getName();

    int getNameRes();

    void setName(String str);

    void setNameRes(int i);
}
