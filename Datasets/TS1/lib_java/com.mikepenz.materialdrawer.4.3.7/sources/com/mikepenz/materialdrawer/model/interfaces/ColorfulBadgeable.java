package com.mikepenz.materialdrawer.model.interfaces;

import com.mikepenz.materialdrawer.holder.BadgeStyle;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/interfaces/ColorfulBadgeable.class */
public interface ColorfulBadgeable<T> extends Badgeable<T> {
    T withBadgeStyle(BadgeStyle badgeStyle);

    BadgeStyle getBadgeStyle();
}
