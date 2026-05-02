package org.openintents.openpgp;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import org.openintents.openpgp.util.OpenPgpUtils;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/OpenPgpSignatureResult.class */
public class OpenPgpSignatureResult implements Parcelable {
    public static final int PARCELABLE_VERSION = 2;
    public static final int RESULT_NO_SIGNATURE = -1;
    public static final int RESULT_INVALID_SIGNATURE = 0;
    public static final int RESULT_VALID_CONFIRMED = 1;
    public static final int RESULT_KEY_MISSING = 2;
    public static final int RESULT_VALID_UNCONFIRMED = 3;
    public static final int RESULT_INVALID_KEY_REVOKED = 4;
    public static final int RESULT_INVALID_KEY_EXPIRED = 5;
    public static final int RESULT_INVALID_INSECURE = 6;
    int result;
    boolean signatureOnly;
    String primaryUserId;
    ArrayList<String> userIds;
    long keyId;
    public static final Parcelable.Creator<OpenPgpSignatureResult> CREATOR = new Parcelable.Creator<OpenPgpSignatureResult>() { // from class: org.openintents.openpgp.OpenPgpSignatureResult.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public OpenPgpSignatureResult createFromParcel(Parcel source) {
            source.readInt();
            int parcelableSize = source.readInt();
            int startPosition = source.dataPosition();
            OpenPgpSignatureResult vr = new OpenPgpSignatureResult();
            vr.result = source.readInt();
            vr.signatureOnly = source.readByte() == 1;
            vr.primaryUserId = source.readString();
            vr.keyId = source.readLong();
            vr.userIds = new ArrayList<>();
            source.readStringList(vr.userIds);
            source.setDataPosition(startPosition + parcelableSize);
            return vr;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public OpenPgpSignatureResult[] newArray(int size) {
            return new OpenPgpSignatureResult[size];
        }
    };

    public int getResult() {
        return this.result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public boolean isSignatureOnly() {
        return this.signatureOnly;
    }

    public void setSignatureOnly(boolean signatureOnly) {
        this.signatureOnly = signatureOnly;
    }

    public String getPrimaryUserId() {
        return this.primaryUserId;
    }

    public void setPrimaryUserId(String primaryUserId) {
        this.primaryUserId = primaryUserId;
    }

    public ArrayList<String> getUserIds() {
        return this.userIds;
    }

    public void setUserIds(ArrayList<String> userIds) {
        this.userIds = userIds;
    }

    public long getKeyId() {
        return this.keyId;
    }

    public void setKeyId(long keyId) {
        this.keyId = keyId;
    }

    public OpenPgpSignatureResult() {
    }

    public OpenPgpSignatureResult(int signatureStatus, String signatureUserId, boolean signatureOnly, long keyId, ArrayList<String> userIds) {
        this.result = signatureStatus;
        this.signatureOnly = signatureOnly;
        this.primaryUserId = signatureUserId;
        this.keyId = keyId;
        this.userIds = userIds;
    }

    public OpenPgpSignatureResult(OpenPgpSignatureResult b) {
        this.result = b.result;
        this.primaryUserId = b.primaryUserId;
        this.signatureOnly = b.signatureOnly;
        this.keyId = b.keyId;
        this.userIds = b.userIds;
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
        dest.writeInt(this.result);
        dest.writeByte((byte) (this.signatureOnly ? 1 : 0));
        dest.writeString(this.primaryUserId);
        dest.writeLong(this.keyId);
        dest.writeStringList(this.userIds);
        int parcelableSize = dest.dataPosition() - startPosition;
        dest.setDataPosition(sizePosition);
        dest.writeInt(parcelableSize);
        dest.setDataPosition(startPosition + parcelableSize);
    }

    public String toString() {
        String out = "\nresult: " + this.result;
        return (((out + "\nprimaryUserId: " + this.primaryUserId) + "\nuserIds: " + this.userIds) + "\nsignatureOnly: " + this.signatureOnly) + "\nkeyId: " + OpenPgpUtils.convertKeyIdToHex(this.keyId);
    }
}
