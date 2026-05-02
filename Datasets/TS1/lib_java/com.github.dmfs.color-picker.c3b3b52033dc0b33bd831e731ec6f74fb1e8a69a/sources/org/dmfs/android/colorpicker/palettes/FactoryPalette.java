package org.dmfs.android.colorpicker.palettes;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/palettes/FactoryPalette.class */
public class FactoryPalette extends AbstractPalette implements Parcelable {
    private String mName;
    private String mPaletteId;
    private int[] mValues;
    private int mColumns;
    public static final Parcelable.Creator<FactoryPalette> CREATOR = new Parcelable.Creator<FactoryPalette>() { // from class: org.dmfs.android.colorpicker.palettes.FactoryPalette.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public FactoryPalette createFromParcel(Parcel in) {
            FactoryPalette state = new FactoryPalette();
            state.readFromParcel(in);
            return state;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public FactoryPalette[] newArray(int size) {
            return new FactoryPalette[size];
        }
    };

    private FactoryPalette() {
    }

    public FactoryPalette(String id, String name, ColorFactory colorProvider, int count, int columns) {
        this.mPaletteId = id;
        this.mName = name;
        int[] values = new int[count];
        for (int i = 0; i < count; i++) {
            values[i] = colorProvider.getColor(i, count);
        }
        this.mValues = values;
        this.mColumns = columns;
    }

    public FactoryPalette(String id, String name, ColorFactory colorProvider, int count) {
        this(id, name, colorProvider, count, (int) Math.floor(Math.sqrt(count)));
    }

    @Override // org.dmfs.android.colorpicker.palettes.AbstractPalette
    public String getName() {
        return this.mName;
    }

    @Override // org.dmfs.android.colorpicker.palettes.AbstractPalette
    public String getId() {
        return this.mPaletteId;
    }

    @Override // org.dmfs.android.colorpicker.palettes.AbstractPalette
    public int getNumberOfColors() {
        return this.mValues.length;
    }

    @Override // org.dmfs.android.colorpicker.palettes.AbstractPalette
    public int getColor(int index) {
        return this.mValues[index];
    }

    @Override // org.dmfs.android.colorpicker.palettes.AbstractPalette
    public String getColorName(int index) {
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
        dest.writeString(this.mName);
        dest.writeIntArray(this.mValues);
        dest.writeInt(this.mColumns);
    }

    public void readFromParcel(Parcel in) {
        this.mName = in.readString();
        this.mValues = in.createIntArray();
        this.mColumns = in.readInt();
    }
}
