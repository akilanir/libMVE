package org.openintents.openpgp;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/OpenPgpMetadata.class */
public class OpenPgpMetadata implements Parcelable {
    public static final int PARCELABLE_VERSION = 2;
    String filename;
    String mimeType;
    String charset;
    long modificationTime;
    long originalSize;
    public static final Parcelable.Creator<OpenPgpMetadata> CREATOR = new Parcelable.Creator<OpenPgpMetadata>() { // from class: org.openintents.openpgp.OpenPgpMetadata.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public OpenPgpMetadata createFromParcel(Parcel source) {
            int version = source.readInt();
            int parcelableSize = source.readInt();
            int startPosition = source.dataPosition();
            OpenPgpMetadata vr = new OpenPgpMetadata();
            vr.filename = source.readString();
            vr.mimeType = source.readString();
            vr.modificationTime = source.readLong();
            vr.originalSize = source.readLong();
            if (version >= 2) {
                vr.charset = source.readString();
            }
            source.setDataPosition(startPosition + parcelableSize);
            return vr;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public OpenPgpMetadata[] newArray(int size) {
            return new OpenPgpMetadata[size];
        }
    };

    public String getFilename() {
        return this.filename;
    }

    public String getMimeType() {
        return this.mimeType;
    }

    public long getModificationTime() {
        return this.modificationTime;
    }

    public long getOriginalSize() {
        return this.originalSize;
    }

    public String getCharset() {
        return this.charset;
    }

    public OpenPgpMetadata() {
    }

    public OpenPgpMetadata(String filename, String mimeType, long modificationTime, long originalSize, String charset) {
        this.filename = filename;
        this.mimeType = mimeType;
        this.modificationTime = modificationTime;
        this.originalSize = originalSize;
        this.charset = charset;
    }

    public OpenPgpMetadata(String filename, String mimeType, long modificationTime, long originalSize) {
        this.filename = filename;
        this.mimeType = mimeType;
        this.modificationTime = modificationTime;
        this.originalSize = originalSize;
    }

    public OpenPgpMetadata(OpenPgpMetadata b) {
        this.filename = b.filename;
        this.mimeType = b.mimeType;
        this.modificationTime = b.modificationTime;
        this.originalSize = b.originalSize;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(2);
        int sizePosition = dest.dataPosition();
        dest.writeInt(0);
        int startPosition = dest.dataPosition();
        dest.writeString(this.filename);
        dest.writeString(this.mimeType);
        dest.writeLong(this.modificationTime);
        dest.writeLong(this.originalSize);
        dest.writeString(this.charset);
        int parcelableSize = dest.dataPosition() - startPosition;
        dest.setDataPosition(sizePosition);
        dest.writeInt(parcelableSize);
        dest.setDataPosition(startPosition + parcelableSize);
    }

    public String toString() {
        String out = "\nfilename: " + this.filename;
        return (((out + "\nmimeType: " + this.mimeType) + "\nmodificationTime: " + this.modificationTime) + "\noriginalSize: " + this.originalSize) + "\ncharset: " + this.charset;
    }
}
