package org.dmfs.android.colorpicker.palettes;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/palettes/RandomPalette.class */
public class RandomPalette extends AbstractPalette {
    private String mName;
    private String mPaletteId;
    private int[] mValues;
    public static final Parcelable.Creator<RandomPalette> CREATOR = new Parcelable.Creator<RandomPalette>() { // from class: org.dmfs.android.colorpicker.palettes.RandomPalette.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public RandomPalette createFromParcel(Parcel in) {
            RandomPalette state = new RandomPalette();
            state.readFromParcel(in);
            return state;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public RandomPalette[] newArray(int size) {
            return new RandomPalette[size];
        }
    };

    private RandomPalette() {
    }

    public RandomPalette(String id, String name, int count) {
        this.mPaletteId = id;
        this.mName = name;
        int[] values = new int[count];
        for (int i = 0; i < count; i++) {
            values[i] = (-16777216) | ((int) (Math.random() * 1.6777216E7d));
        }
        this.mValues = values;
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
        return (int) Math.floor(Math.sqrt(this.mValues.length));
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.mName);
        dest.writeIntArray(this.mValues);
    }

    public void readFromParcel(Parcel in) {
        this.mName = in.readString();
        this.mValues = in.createIntArray();
    }
}
