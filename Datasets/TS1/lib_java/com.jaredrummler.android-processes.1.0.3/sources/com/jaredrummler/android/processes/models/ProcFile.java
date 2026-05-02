package com.jaredrummler.android.processes.models;

import android.os.Parcel;
import android.os.Parcelable;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

/* loaded from: com.jaredrummler.android-processes.1.0.3.jar:com/jaredrummler/android/processes/models/ProcFile.class */
public class ProcFile extends File implements Parcelable {
    public final String content;
    public static final Parcelable.Creator<ProcFile> CREATOR = new Parcelable.Creator<ProcFile>() { // from class: com.jaredrummler.android.processes.models.ProcFile.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ProcFile createFromParcel(Parcel in) {
            return new ProcFile(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ProcFile[] newArray(int size) {
            return new ProcFile[size];
        }
    };

    protected static String readFile(String path) throws IOException {
        BufferedReader reader = null;
        try {
            StringBuilder output = new StringBuilder();
            reader = new BufferedReader(new FileReader(path));
            String newLine = "";
            for (String line = reader.readLine(); line != null; line = reader.readLine()) {
                output.append(newLine).append(line);
                newLine = "\n";
            }
            String sb = output.toString();
            if (reader != null) {
                reader.close();
            }
            return sb;
        } catch (Throwable th) {
            if (reader != null) {
                reader.close();
            }
            throw th;
        }
    }

    protected ProcFile(String path) throws IOException {
        super(path);
        this.content = readFile(path);
    }

    protected ProcFile(Parcel in) {
        super(in.readString());
        this.content = in.readString();
    }

    @Override // java.io.File
    public long length() {
        return this.content.length();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(getAbsolutePath());
        dest.writeString(this.content);
    }
}
