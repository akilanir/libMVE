package org.openintents.openpgp;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/OpenPgpError.class */
public class OpenPgpError implements Parcelable {
    public static final int PARCELABLE_VERSION = 1;
    public static final int CLIENT_SIDE_ERROR = -1;
    public static final int GENERIC_ERROR = 0;
    public static final int INCOMPATIBLE_API_VERSIONS = 1;
    public static final int NO_OR_WRONG_PASSPHRASE = 2;
    public static final int NO_USER_IDS = 3;
    int errorId;
    String message;
    public static final Parcelable.Creator<OpenPgpError> CREATOR = new Parcelable.Creator<OpenPgpError>() { // from class: org.openintents.openpgp.OpenPgpError.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public OpenPgpError createFromParcel(Parcel source) {
            source.readInt();
            int parcelableSize = source.readInt();
            int startPosition = source.dataPosition();
            OpenPgpError error = new OpenPgpError();
            error.errorId = source.readInt();
            error.message = source.readString();
            source.setDataPosition(startPosition + parcelableSize);
            return error;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public OpenPgpError[] newArray(int size) {
            return new OpenPgpError[size];
        }
    };

    public OpenPgpError() {
    }

    public OpenPgpError(int errorId, String message) {
        this.errorId = errorId;
        this.message = message;
    }

    public OpenPgpError(OpenPgpError b) {
        this.errorId = b.errorId;
        this.message = b.message;
    }

    public int getErrorId() {
        return this.errorId;
    }

    public void setErrorId(int errorId) {
        this.errorId = errorId;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
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
        dest.writeInt(this.errorId);
        dest.writeString(this.message);
        int parcelableSize = dest.dataPosition() - startPosition;
        dest.setDataPosition(sizePosition);
        dest.writeInt(parcelableSize);
        dest.setDataPosition(startPosition + parcelableSize);
    }
}
