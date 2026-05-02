package com.jaredrummler.android.processes.models;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Parcel;
import android.os.Parcelable;
import java.io.IOException;

/* loaded from: com.jaredrummler.android-processes.1.0.3.jar:com/jaredrummler/android/processes/models/AndroidAppProcess.class */
public class AndroidAppProcess extends AndroidProcess {
    public boolean foreground;
    public int uid;
    private final Cgroup cgroup;
    public static final Parcelable.Creator<AndroidAppProcess> CREATOR = new Parcelable.Creator<AndroidAppProcess>() { // from class: com.jaredrummler.android.processes.models.AndroidAppProcess.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public AndroidAppProcess createFromParcel(Parcel source) {
            return new AndroidAppProcess(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public AndroidAppProcess[] newArray(int size) {
            return new AndroidAppProcess[size];
        }
    };

    public AndroidAppProcess(int pid) throws IOException, NotAndroidAppProcessException {
        super(pid);
        this.cgroup = super.cgroup();
        ControlGroup cpuacct = this.cgroup.getGroup("cpuacct");
        ControlGroup cpu = this.cgroup.getGroup("cpu");
        if (cpu == null || cpuacct == null || !cpuacct.group.contains("pid_")) {
            throw new NotAndroidAppProcessException(pid);
        }
        this.foreground = !cpu.group.contains("bg_non_interactive");
        try {
            this.uid = Integer.parseInt(cpuacct.group.split("/")[1].replace("uid_", ""));
        } catch (Exception e) {
            this.uid = status().getUid();
        }
    }

    public String getPackageName() {
        return this.name.split(":")[0];
    }

    public PackageInfo getPackageInfo(Context context, int flags) throws PackageManager.NameNotFoundException {
        return context.getPackageManager().getPackageInfo(getPackageName(), flags);
    }

    @Override // com.jaredrummler.android.processes.models.AndroidProcess
    public Cgroup cgroup() {
        return this.cgroup;
    }

    @Override // com.jaredrummler.android.processes.models.AndroidProcess, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeParcelable(this.cgroup, flags);
        dest.writeByte((byte) (this.foreground ? 1 : 0));
    }

    protected AndroidAppProcess(Parcel in) {
        super(in);
        this.cgroup = (Cgroup) in.readParcelable(Cgroup.class.getClassLoader());
        this.foreground = in.readByte() != 0;
    }

    /* loaded from: com.jaredrummler.android-processes.1.0.3.jar:com/jaredrummler/android/processes/models/AndroidAppProcess$NotAndroidAppProcessException.class */
    public static final class NotAndroidAppProcessException extends Exception {
        public NotAndroidAppProcessException(int pid) {
            super(String.format("The process %d does not belong to any application", Integer.valueOf(pid)));
        }
    }
}
