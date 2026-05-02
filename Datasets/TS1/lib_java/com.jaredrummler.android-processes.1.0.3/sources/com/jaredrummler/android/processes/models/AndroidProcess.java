package com.jaredrummler.android.processes.models;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import java.io.IOException;

/* loaded from: com.jaredrummler.android-processes.1.0.3.jar:com/jaredrummler/android/processes/models/AndroidProcess.class */
public class AndroidProcess implements Parcelable {
    public final String name;
    public final int pid;
    public static final Parcelable.Creator<AndroidProcess> CREATOR = new Parcelable.Creator<AndroidProcess>() { // from class: com.jaredrummler.android.processes.models.AndroidProcess.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public AndroidProcess createFromParcel(Parcel source) {
            return new AndroidProcess(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public AndroidProcess[] newArray(int size) {
            return new AndroidProcess[size];
        }
    };

    static String getProcessName(int pid) throws IOException {
        String cmdline = null;
        try {
            cmdline = ProcFile.readFile(String.format("/proc/%d/cmdline", Integer.valueOf(pid))).trim();
        } catch (IOException e) {
        }
        if (TextUtils.isEmpty(cmdline)) {
            return Stat.get(pid).getComm();
        }
        return cmdline;
    }

    public AndroidProcess(int pid) throws IOException {
        this.pid = pid;
        this.name = getProcessName(pid);
    }

    public String read(String filename) throws IOException {
        return ProcFile.readFile(String.format("/proc/%d/%s", Integer.valueOf(this.pid), filename));
    }

    public String attr_current() throws IOException {
        return read("attr/current");
    }

    public String cmdline() throws IOException {
        return read("cmdline");
    }

    public Cgroup cgroup() throws IOException {
        return Cgroup.get(this.pid);
    }

    public int oom_adj() throws IOException {
        return Integer.parseInt(read("oom_adj"));
    }

    public int oom_score_adj() throws IOException {
        return Integer.parseInt(read("oom_score_adj"));
    }

    public Stat stat() throws IOException {
        return Stat.get(this.pid);
    }

    public Statm statm() throws IOException {
        return Statm.get(this.pid);
    }

    public Status status() throws IOException {
        return Status.get(this.pid);
    }

    public String wchan() throws IOException {
        return read("wchan");
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.name);
        dest.writeInt(this.pid);
    }

    protected AndroidProcess(Parcel in) {
        this.name = in.readString();
        this.pid = in.readInt();
    }
}
