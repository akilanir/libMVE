package com.jaredrummler.android.processes.models;

import android.os.Parcel;
import android.os.Parcelable;
import java.io.IOException;

/* loaded from: com.jaredrummler.android-processes.1.0.3.jar:com/jaredrummler/android/processes/models/Statm.class */
public final class Statm extends ProcFile {
    public final String[] fields;
    public static final Parcelable.Creator<Statm> CREATOR = new Parcelable.Creator<Statm>() { // from class: com.jaredrummler.android.processes.models.Statm.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Statm createFromParcel(Parcel source) {
            return new Statm(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Statm[] newArray(int size) {
            return new Statm[size];
        }
    };

    public static Statm get(int pid) throws IOException {
        return new Statm(String.format("/proc/%d/statm", Integer.valueOf(pid)));
    }

    private Statm(String path) throws IOException {
        super(path);
        this.fields = this.content.split("\\s+");
    }

    private Statm(Parcel in) {
        super(in);
        this.fields = in.createStringArray();
    }

    public long getSize() {
        return Long.parseLong(this.fields[0]) * 1024;
    }

    public long getResidentSetSize() {
        return Long.parseLong(this.fields[1]) * 1024;
    }

    @Override // com.jaredrummler.android.processes.models.ProcFile, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeStringArray(this.fields);
    }
}
