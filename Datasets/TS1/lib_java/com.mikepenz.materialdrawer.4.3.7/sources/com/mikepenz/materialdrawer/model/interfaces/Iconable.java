package com.mikepenz.materialdrawer.model.interfaces;

import android.graphics.drawable.Drawable;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.materialdrawer.holder.ImageHolder;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/interfaces/Iconable.class */
public interface Iconable<T> {
    T withIcon(Drawable drawable);

    T withIcon(IIcon iIcon);

    T withIcon(ImageHolder imageHolder);

    ImageHolder getIcon();
}
