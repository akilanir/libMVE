package com.mikepenz.materialdrawer.model.interfaces;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/model/interfaces/IProfile.class */
public interface IProfile<T> {
    T withName(String str);

    String getName();

    void setName(String str);

    T withEmail(String str);

    String getEmail();

    void setEmail(String str);

    T withIcon(Drawable drawable);

    T withIcon(Bitmap bitmap);

    T withIcon(String str);

    T withIcon(Uri uri);

    Drawable getIcon();

    Bitmap getIconBitmap();

    Uri getIconUri();

    void setIcon(Drawable drawable);

    void setIconBitmap(Bitmap bitmap);

    void setIcon(String str);

    void setIcon(Uri uri);

    T withSelectable(boolean z);

    boolean isSelectable();

    T setSelectable(boolean z);

    int getIdentifier();
}
