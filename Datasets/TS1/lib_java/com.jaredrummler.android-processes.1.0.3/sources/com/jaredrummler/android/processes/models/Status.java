package com.jaredrummler.android.processes.models;

import android.os.Parcel;
import android.os.Parcelable;
import java.io.IOException;

/* loaded from: com.jaredrummler.android-processes.1.0.3.jar:com/jaredrummler/android/processes/models/Status.class */
public final class Status extends ProcFile {
    public static final Parcelable.Creator<Status> CREATOR = new Parcelable.Creator<Status>() { // from class: com.jaredrummler.android.processes.models.Status.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Status createFromParcel(Parcel source) {
            return new Status(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Status[] newArray(int size) {
            return new Status[size];
        }
    };

    public static Status get(int pid) throws IOException {
        return new Status(String.format("/proc/%d/status", Integer.valueOf(pid)));
    }

    private Status(String path) throws IOException {
        super(path);
    }

    private Status(Parcel in) {
        super(in);
    }

    public String getValue(String fieldName) {
        String[] lines = this.content.split("\n");
        for (String line : lines) {
            if (line.startsWith(fieldName + ":")) {
                return line.split(fieldName + ":")[1].trim();
            }
        }
        return null;
    }

    public int getUid() {
        try {
            return Integer.parseInt(getValue("Uid").split("\\s+")[0]);
        } catch (Exception e) {
            return -1;
        }
    }

    public int getGid() {
        try {
            return Integer.parseInt(getValue("Gid").split("\\s+")[0]);
        } catch (Exception e) {
            return -1;
        }
    }
}
