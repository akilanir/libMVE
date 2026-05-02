package com.mikepenz.materialdrawer.model.interfaces;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/interfaces/Identifyable.class */
public interface Identifyable<T> {
    T withIdentifier(int i);

    int getIdentifier();

    void setIdentifier(int i);
}
