package com.github.mrengineer13.snackbar;

import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: com.github.mrengineer13.snackbar.1.2.0.jar:com/github/mrengineer13/snackbar/Snack.class */
class Snack implements Parcelable {
    final String mMessage;
    final String mActionMessage;
    final int mActionIcon;
    final Parcelable mToken;
    final short mDuration;
    final ColorStateList mBtnTextColor;
    final ColorStateList mBackgroundColor;
    final int mHeight;
    Typeface mTypeface;
    public static final Parcelable.Creator<Snack> CREATOR = new Parcelable.Creator<Snack>() { // from class: com.github.mrengineer13.snackbar.Snack.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Snack createFromParcel(Parcel in) {
            return new Snack(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Snack[] newArray(int size) {
            return new Snack[size];
        }
    };

    Snack(String message, String actionMessage, int actionIcon, Parcelable token, short duration, ColorStateList textColor, ColorStateList backgroundColor, int height, Typeface typeFace) {
        this.mMessage = message;
        this.mActionMessage = actionMessage;
        this.mActionIcon = actionIcon;
        this.mToken = token;
        this.mDuration = duration;
        this.mBtnTextColor = textColor;
        this.mBackgroundColor = backgroundColor;
        this.mHeight = height;
        this.mTypeface = typeFace;
    }

    Snack(Parcel p) {
        this.mMessage = p.readString();
        this.mActionMessage = p.readString();
        this.mActionIcon = p.readInt();
        this.mToken = p.readParcelable(p.getClass().getClassLoader());
        this.mDuration = (short) p.readInt();
        this.mBtnTextColor = (ColorStateList) p.readParcelable(p.getClass().getClassLoader());
        this.mBackgroundColor = (ColorStateList) p.readParcelable(p.getClass().getClassLoader());
        this.mHeight = p.readInt();
        this.mTypeface = (Typeface) p.readValue(p.getClass().getClassLoader());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        out.writeString(this.mMessage);
        out.writeString(this.mActionMessage);
        out.writeInt(this.mActionIcon);
        out.writeParcelable(this.mToken, 0);
        out.writeInt(this.mDuration);
        out.writeParcelable(this.mBtnTextColor, 0);
        out.writeParcelable(this.mBackgroundColor, 0);
        out.writeInt(this.mHeight);
        out.writeValue(this.mTypeface);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }
}
