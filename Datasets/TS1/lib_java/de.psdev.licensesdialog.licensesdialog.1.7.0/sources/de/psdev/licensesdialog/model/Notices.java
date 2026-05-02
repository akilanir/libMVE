package de.psdev.licensesdialog.model;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.List;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.7.0.jar:de/psdev/licensesdialog/model/Notices.class */
public class Notices implements Parcelable {
    private final List<Notice> mNotices = new ArrayList();
    public static Parcelable.Creator<Notices> CREATOR = new Parcelable.Creator<Notices>() { // from class: de.psdev.licensesdialog.model.Notices.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Notices createFromParcel(Parcel source) {
            return new Notices(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Notices[] newArray(int size) {
            return new Notices[size];
        }
    };

    public Notices() {
    }

    public void addNotice(Notice notice) {
        this.mNotices.add(notice);
    }

    public List<Notice> getNotices() {
        return this.mNotices;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeList(this.mNotices);
    }

    protected Notices(Parcel in) {
        in.readList(this.mNotices, Notice.class.getClassLoader());
    }
}
