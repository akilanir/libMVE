package org.dmfs.android.colorpicker.palettes;

import android.annotation.SuppressLint;
import android.os.Parcelable;

@SuppressLint({"ParcelCreator"})
/* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/palettes/AbstractPalette.class */
public abstract class AbstractPalette implements Parcelable {
    public abstract String getName();

    public abstract String getId();

    public abstract int getNumberOfColors();

    public abstract int getColor(int i);

    public abstract String getColorName(int i);

    public abstract int getNumberOfColumns();
}
