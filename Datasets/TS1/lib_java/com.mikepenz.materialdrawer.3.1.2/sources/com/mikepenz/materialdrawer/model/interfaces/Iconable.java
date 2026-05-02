package com.mikepenz.materialdrawer.model.interfaces;

import android.graphics.drawable.Drawable;
import com.mikepenz.iconics.typeface.IIcon;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/interfaces/Iconable.class */
public interface Iconable<T> {
    T withIcon(Drawable drawable);

    T withIcon(IIcon iIcon);

    Drawable getIcon();

    IIcon getIIcon();

    void setIcon(Drawable drawable);

    void setIIcon(IIcon iIcon);
}
