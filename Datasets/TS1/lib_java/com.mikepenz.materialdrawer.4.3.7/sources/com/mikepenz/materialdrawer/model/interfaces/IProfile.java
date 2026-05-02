package com.mikepenz.materialdrawer.model.interfaces;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.DrawableRes;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.materialdrawer.holder.ImageHolder;
import com.mikepenz.materialdrawer.holder.StringHolder;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/model/interfaces/IProfile.class */
public interface IProfile<T> extends Identifyable<T> {
    T withName(String str);

    StringHolder getName();

    T withEmail(String str);

    StringHolder getEmail();

    T withIcon(Drawable drawable);

    T withIcon(Bitmap bitmap);

    T withIcon(@DrawableRes int i);

    T withIcon(String str);

    T withIcon(Uri uri);

    T withIcon(IIcon iIcon);

    ImageHolder getIcon();

    T withSelectable(boolean z);

    boolean isSelectable();
}
