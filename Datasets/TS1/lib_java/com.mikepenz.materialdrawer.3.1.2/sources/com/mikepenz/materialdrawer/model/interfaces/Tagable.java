package com.mikepenz.materialdrawer.model.interfaces;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/interfaces/Tagable.class */
public interface Tagable<T> {
    T withTag(Object obj);

    Object getTag();

    void setTag(Object obj);
}
