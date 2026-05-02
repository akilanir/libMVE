package cyanogenmod.app;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;

/* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/StatusBarPanelCustomTile.class */
public class StatusBarPanelCustomTile implements Parcelable {
    private final String pkg;
    private final int id;
    private final String tag;
    private final String key;
    private final int uid;
    private final String opPkg;
    private final int initialPid;
    private final CustomTile customTile;
    private final UserHandle user;
    private final long postTime;
    public static final Parcelable.Creator<StatusBarPanelCustomTile> CREATOR = new Parcelable.Creator<StatusBarPanelCustomTile>() { // from class: cyanogenmod.app.StatusBarPanelCustomTile.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public StatusBarPanelCustomTile createFromParcel(Parcel parcel) {
            return new StatusBarPanelCustomTile(parcel);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public StatusBarPanelCustomTile[] newArray(int size) {
            return new StatusBarPanelCustomTile[size];
        }
    };

    public StatusBarPanelCustomTile(String pkg, String opPkg, int id, String tag, int uid, int initialPid, CustomTile customTile, UserHandle user) {
        this(pkg, opPkg, id, tag, uid, initialPid, customTile, user, System.currentTimeMillis());
    }

    public StatusBarPanelCustomTile(String pkg, String opPkg, int id, String tag, int uid, int initialPid, CustomTile customTile, UserHandle user, long postTime) {
        if (pkg == null) {
            throw new NullPointerException();
        }
        if (customTile == null) {
            throw new NullPointerException();
        }
        this.pkg = pkg;
        this.opPkg = opPkg;
        this.id = id;
        this.tag = tag;
        this.uid = uid;
        this.initialPid = initialPid;
        this.customTile = customTile;
        this.user = user;
        this.postTime = postTime;
        this.key = key();
    }

    public StatusBarPanelCustomTile(Parcel in) {
        int parcelableVersion = in.readInt();
        int parcelableSize = in.readInt();
        int startPosition = in.dataPosition();
        String tmpPkg = null;
        String tmpOpPkg = null;
        int tmpId = -1;
        String tmpTag = null;
        int tmpUid = -1;
        int tmpPid = -1;
        CustomTile tmpCustomTile = null;
        UserHandle tmpUser = null;
        long tmpPostTime = -1;
        if (parcelableVersion >= 1) {
            tmpPkg = in.readString();
            tmpOpPkg = in.readString();
            tmpId = in.readInt();
            if (in.readInt() != 0) {
                tmpTag = in.readString();
            } else {
                tmpTag = null;
            }
            tmpUid = in.readInt();
            tmpPid = in.readInt();
            tmpCustomTile = new CustomTile(in);
            tmpUser = UserHandle.readFromParcel(in);
            tmpPostTime = in.readLong();
        }
        this.pkg = tmpPkg;
        this.opPkg = tmpOpPkg;
        this.id = tmpId;
        this.tag = tmpTag;
        this.uid = tmpUid;
        this.initialPid = tmpPid;
        this.customTile = tmpCustomTile;
        this.user = tmpUser;
        this.postTime = tmpPostTime;
        this.key = key();
        in.setDataPosition(startPosition + parcelableSize);
    }

    private String key() {
        return this.user.getIdentifier() + "|" + this.pkg + "|" + this.id + "|" + this.tag + "|" + this.uid;
    }

    public CustomTile getCustomTile() {
        return this.customTile;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        out.writeInt(1);
        int sizePosition = out.dataPosition();
        out.writeInt(0);
        int startPosition = out.dataPosition();
        out.writeString(this.pkg);
        out.writeString(this.opPkg);
        out.writeInt(this.id);
        if (this.tag != null) {
            out.writeInt(1);
            out.writeString(this.tag);
        } else {
            out.writeInt(0);
        }
        out.writeInt(this.uid);
        out.writeInt(this.initialPid);
        this.customTile.writeToParcel(out, flags);
        this.user.writeToParcel(out, flags);
        out.writeLong(this.postTime);
        int parcelableSize = out.dataPosition() - startPosition;
        out.setDataPosition(sizePosition);
        out.writeInt(parcelableSize);
        out.setDataPosition(startPosition + parcelableSize);
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public StatusBarPanelCustomTile m6clone() {
        return new StatusBarPanelCustomTile(this.pkg, this.opPkg, this.id, this.tag, this.uid, this.initialPid, this.customTile.m2clone(), this.user, this.postTime);
    }

    public int getUserId() {
        return this.user.getIdentifier();
    }

    public String getPackage() {
        return this.pkg;
    }

    public int getId() {
        return this.id;
    }

    public String getTag() {
        return this.tag;
    }

    public String getKey() {
        return this.key;
    }

    public int getUid() {
        return this.uid;
    }

    public String getOpPkg() {
        return this.opPkg;
    }

    public int getInitialPid() {
        return this.initialPid;
    }

    public UserHandle getUser() {
        return this.user;
    }

    public long getPostTime() {
        return this.postTime;
    }
}
