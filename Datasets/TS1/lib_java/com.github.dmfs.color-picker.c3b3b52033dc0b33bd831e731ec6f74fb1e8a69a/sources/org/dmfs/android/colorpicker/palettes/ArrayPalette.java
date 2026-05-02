package org.dmfs.android.colorpicker.palettes;

import android.content.Context;
import android.content.res.Resources;
import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/palettes/ArrayPalette.class */
public class ArrayPalette extends AbstractPalette implements Parcelable {
    private String mPaletteName;
    private String mPaletteId;
    private int[] mColors;
    private String[] mColorNames;
    private int mColumns;
    public static final Parcelable.Creator<ArrayPalette> CREATOR = new Parcelable.Creator<ArrayPalette>() { // from class: org.dmfs.android.colorpicker.palettes.ArrayPalette.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ArrayPalette createFromParcel(Parcel in) {
            ArrayPalette state = new ArrayPalette();
            state.readFromParcel(in);
            return state;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ArrayPalette[] newArray(int size) {
            return new ArrayPalette[size];
        }
    };

    public static ArrayPalette fromResources(Resources resources, String id, int paletteName, int colorArray, int columns, int colorNameArray) {
        return new ArrayPalette(id, resources.getString(paletteName), resources.getIntArray(colorArray), columns, resources.getStringArray(colorNameArray));
    }

    public static ArrayPalette fromResources(Resources resources, String id, int paletteName, int colorArray, int colorNameArray) {
        return new ArrayPalette(id, resources.getString(paletteName), resources.getIntArray(colorArray), resources.getStringArray(colorNameArray));
    }

    public static ArrayPalette fromResources(Resources resources, String id, int paletteName, int colorArray) {
        return new ArrayPalette(id, resources.getString(paletteName), resources.getIntArray(colorArray));
    }

    public static ArrayPalette fromResources(Context context, String id, int paletteName, int colorArray, int columns, int colorNameArray) {
        return fromResources(context.getResources(), id, paletteName, colorArray, columns, colorNameArray);
    }

    public static ArrayPalette fromResources(Context context, String id, int paletteName, int colorArray, int colorNameArray) {
        return fromResources(context.getResources(), id, paletteName, colorArray, colorNameArray);
    }

    public static ArrayPalette fromResources(Context context, String id, int paletteName, int colorArray) {
        return fromResources(context.getResources(), id, paletteName, colorArray);
    }

    private ArrayPalette() {
    }

    public ArrayPalette(String id, String paletteName, int[] colors, int columns, String[] names) {
        this.mPaletteId = id;
        this.mPaletteName = paletteName;
        this.mColors = colors;
        this.mColorNames = names;
        this.mColumns = columns;
    }

    public ArrayPalette(String id, String paletteName, int[] colors, String[] names) {
        this(id, paletteName, colors, (int) Math.floor(Math.sqrt(colors.length)), names);
    }

    public ArrayPalette(String id, String paletteName, int[] colors, int columns) {
        this(id, paletteName, colors, columns, null);
    }

    public ArrayPalette(String id, String paletteName, int[] colors) {
        this(id, paletteName, colors, (int) Math.floor(Math.sqrt(colors.length)), null);
    }

    @Override // org.dmfs.android.colorpicker.palettes.AbstractPalette
    public String getName() {
        return this.mPaletteName;
    }

    @Override // org.dmfs.android.colorpicker.palettes.AbstractPalette
    public String getId() {
        return this.mPaletteId;
    }

    @Override // org.dmfs.android.colorpicker.palettes.AbstractPalette
    public int getNumberOfColors() {
        return this.mColors.length;
    }

    @Override // org.dmfs.android.colorpicker.palettes.AbstractPalette
    public int getColor(int index) {
        return this.mColors[index];
    }

    @Override // org.dmfs.android.colorpicker.palettes.AbstractPalette
    public String getColorName(int index) {
        if (this.mColorNames != null) {
            return this.mColorNames[index];
        }
        return null;
    }

    @Override // org.dmfs.android.colorpicker.palettes.AbstractPalette
    public int getNumberOfColumns() {
        return this.mColumns;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.mPaletteName);
        dest.writeIntArray(this.mColors);
        dest.writeStringArray(this.mColorNames);
        dest.writeInt(this.mColumns);
    }

    public void readFromParcel(Parcel in) {
        this.mPaletteName = in.readString();
        this.mColors = in.createIntArray();
        this.mColorNames = in.createStringArray();
        this.mColumns = in.readInt();
    }
}
