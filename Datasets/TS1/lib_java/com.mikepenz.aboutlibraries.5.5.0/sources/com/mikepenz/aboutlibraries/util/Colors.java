package com.mikepenz.aboutlibraries.util;

import android.os.Parcel;
import java.io.Serializable;

/* loaded from: com.mikepenz.aboutlibraries.5.5.0.jar:com/mikepenz/aboutlibraries/util/Colors.class */
public class Colors implements Serializable {
    public int appBarColor;
    public int statusBarColor;

    public Colors(int toolbarColor, int statusBarColor) {
        this.appBarColor = toolbarColor;
        this.statusBarColor = statusBarColor;
    }

    private Colors(Parcel in) {
        this.appBarColor = in.readInt();
        this.statusBarColor = in.readInt();
    }
}
