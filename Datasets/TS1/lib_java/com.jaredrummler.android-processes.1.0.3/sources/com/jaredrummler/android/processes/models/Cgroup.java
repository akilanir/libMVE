package com.jaredrummler.android.processes.models;

import android.os.Parcel;
import android.os.Parcelable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: com.jaredrummler.android-processes.1.0.3.jar:com/jaredrummler/android/processes/models/Cgroup.class */
public final class Cgroup extends ProcFile {
    public final ArrayList<ControlGroup> groups;
    public static final Parcelable.Creator<Cgroup> CREATOR = new Parcelable.Creator<Cgroup>() { // from class: com.jaredrummler.android.processes.models.Cgroup.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Cgroup createFromParcel(Parcel source) {
            return new Cgroup(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Cgroup[] newArray(int size) {
            return new Cgroup[size];
        }
    };

    public static Cgroup get(int pid) throws IOException {
        return new Cgroup(String.format("/proc/%d/cgroup", Integer.valueOf(pid)));
    }

    private Cgroup(String path) throws IOException {
        super(path);
        String[] lines = this.content.split("\n");
        this.groups = new ArrayList<>();
        for (String line : lines) {
            try {
                this.groups.add(new ControlGroup(line));
            } catch (Exception e) {
            }
        }
    }

    private Cgroup(Parcel in) {
        super(in);
        this.groups = in.createTypedArrayList(ControlGroup.CREATOR);
    }

    public ControlGroup getGroup(String subsystem) {
        Iterator<ControlGroup> it = this.groups.iterator();
        while (it.hasNext()) {
            ControlGroup group = it.next();
            String[] systems = group.subsystems.split(",");
            for (String name : systems) {
                if (name.equals(subsystem)) {
                    return group;
                }
            }
        }
        return null;
    }

    @Override // com.jaredrummler.android.processes.models.ProcFile, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeTypedList(this.groups);
    }
}
