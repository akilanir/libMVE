package com.jaredrummler.android.processes.models;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: com.jaredrummler.android-processes.1.0.3.jar:com/jaredrummler/android/processes/models/ControlGroup.class */
public class ControlGroup implements Parcelable {
    public final int id;
    public final String subsystems;
    public final String group;
    public static final Parcelable.Creator<ControlGroup> CREATOR = new Parcelable.Creator<ControlGroup>() { // from class: com.jaredrummler.android.processes.models.ControlGroup.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ControlGroup createFromParcel(Parcel source) {
            return new ControlGroup(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ControlGroup[] newArray(int size) {
            return new ControlGroup[size];
        }
    };

    protected ControlGroup(String line) throws NumberFormatException, IndexOutOfBoundsException {
        String[] fields = line.split(":");
        this.id = Integer.parseInt(fields[0]);
        this.subsystems = fields[1];
        this.group = fields[2];
    }

    protected ControlGroup(Parcel in) {
        this.id = in.readInt();
        this.subsystems = in.readString();
        this.group = in.readString();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.id);
        dest.writeString(this.subsystems);
        dest.writeString(this.group);
    }
}
