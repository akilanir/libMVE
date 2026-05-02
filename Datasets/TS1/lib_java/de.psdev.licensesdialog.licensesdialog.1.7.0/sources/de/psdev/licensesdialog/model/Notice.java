package de.psdev.licensesdialog.model;

import android.os.Parcel;
import android.os.Parcelable;
import de.psdev.licensesdialog.licenses.License;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.7.0.jar:de/psdev/licensesdialog/model/Notice.class */
public class Notice implements Parcelable {
    private String mName;
    private String mUrl;
    private String mCopyright;
    private License mLicense;
    public static Parcelable.Creator<Notice> CREATOR = new Parcelable.Creator<Notice>() { // from class: de.psdev.licensesdialog.model.Notice.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Notice createFromParcel(Parcel source) {
            return new Notice(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public Notice[] newArray(int size) {
            return new Notice[size];
        }
    };

    public Notice() {
    }

    public Notice(String name, String url, String copyright, License license) {
        this.mName = name;
        this.mUrl = url;
        this.mCopyright = copyright;
        this.mLicense = license;
    }

    public void setName(String name) {
        this.mName = name;
    }

    public void setUrl(String url) {
        this.mUrl = url;
    }

    public void setCopyright(String copyright) {
        this.mCopyright = copyright;
    }

    public void setLicense(License license) {
        this.mLicense = license;
    }

    public String getName() {
        return this.mName;
    }

    public String getUrl() {
        return this.mUrl;
    }

    public String getCopyright() {
        return this.mCopyright;
    }

    public License getLicense() {
        return this.mLicense;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.mName);
        dest.writeString(this.mUrl);
        dest.writeString(this.mCopyright);
        dest.writeSerializable(this.mLicense);
    }

    private Notice(Parcel in) {
        this.mName = in.readString();
        this.mUrl = in.readString();
        this.mCopyright = in.readString();
        this.mLicense = (License) in.readSerializable();
    }
}
