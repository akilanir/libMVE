package com.mikepenz.materialdrawer.model.interfaces;

import com.mikepenz.materialdrawer.holder.StringHolder;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/interfaces/Nameable.class */
public interface Nameable<T> {
    T withName(String str);

    T withName(int i);

    T withName(StringHolder stringHolder);

    StringHolder getName();
}
