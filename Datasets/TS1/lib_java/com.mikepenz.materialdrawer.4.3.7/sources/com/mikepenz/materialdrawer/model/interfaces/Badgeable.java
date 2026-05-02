package com.mikepenz.materialdrawer.model.interfaces;

import com.mikepenz.materialdrawer.holder.StringHolder;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/interfaces/Badgeable.class */
public interface Badgeable<T> {
    T withBadge(String str);

    T withBadge(int i);

    T withBadge(StringHolder stringHolder);

    StringHolder getBadge();
}
