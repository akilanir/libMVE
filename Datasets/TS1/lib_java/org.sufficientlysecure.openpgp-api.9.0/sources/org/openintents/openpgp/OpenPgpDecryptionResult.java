package org.openintents.openpgp;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/OpenPgpDecryptionResult.class */
public class OpenPgpDecryptionResult implements Parcelable {
    public static final int PARCELABLE_VERSION = 1;
    public static final int RESULT_NOT_ENCRYPTED = -1;
    public static final int RESULT_INSECURE = 0;
    public static final int RESULT_ENCRYPTED = 1;
    int result;
    public static final Parcelable.Creator<OpenPgpDecryptionResult> CREATOR = new Parcelable.Creator<OpenPgpDecryptionResult>() { // from class: org.openintents.openpgp.OpenPgpDecryptionResult.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public OpenPgpDecryptionResult createFromParcel(Parcel source) {
            source.readInt();
            int parcelableSize = source.readInt();
            int startPosition = source.dataPosition();
            OpenPgpDecryptionResult vr = new OpenPgpDecryptionResult();
            vr.result = source.readInt();
            source.setDataPosition(startPosition + parcelableSize);
            return vr;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public OpenPgpDecryptionResult[] newArray(int size) {
            return new OpenPgpDecryptionResult[size];
        }
    };

    public int getResult() {
        return this.result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public OpenPgpDecryptionResult() {
    }

    public OpenPgpDecryptionResult(int result) {
        this.result = result;
    }

    public OpenPgpDecryptionResult(OpenPgpDecryptionResult b) {
        this.result = b.result;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(1);
        int sizePosition = dest.dataPosition();
        dest.writeInt(0);
        int startPosition = dest.dataPosition();
        dest.writeInt(this.result);
        int parcelableSize = dest.dataPosition() - startPosition;
        dest.setDataPosition(sizePosition);
        dest.writeInt(parcelableSize);
        dest.setDataPosition(startPosition + parcelableSize);
    }

    public String toString() {
        return "\nresult: " + this.result;
    }
}
