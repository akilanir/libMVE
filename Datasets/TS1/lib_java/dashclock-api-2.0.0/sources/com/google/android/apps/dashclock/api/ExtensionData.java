package com.google.android.apps.dashclock.api;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import java.net.URISyntaxException;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: dashclock-api-2.0.0.jar:com/google/android/apps/dashclock/api/ExtensionData.class */
public class ExtensionData implements Parcelable {
    public static final int PARCELABLE_VERSION = 2;
    private static final String KEY_VISIBLE = "visible";
    private static final String KEY_ICON = "icon";
    private static final String KEY_ICON_URI = "icon_uri";
    private static final String KEY_STATUS = "status";
    private static final String KEY_EXPANDED_TITLE = "title";
    private static final String KEY_EXPANDED_BODY = "body";
    private static final String KEY_CLICK_INTENT = "click_intent";
    private static final String KEY_CONTENT_DESCRIPTION = "content_description";
    public static final int MAX_STATUS_LENGTH = 32;
    public static final int MAX_EXPANDED_TITLE_LENGTH = 100;
    public static final int MAX_EXPANDED_BODY_LENGTH = 1000;
    public static final int MAX_CONTENT_DESCRIPTION_LENGTH = 1164;
    private boolean mVisible;
    private int mIcon;
    private Uri mIconUri;
    private String mStatus;
    private String mExpandedTitle;
    private String mExpandedBody;
    private Intent mClickIntent;
    private String mContentDescription;
    public static final Parcelable.Creator<ExtensionData> CREATOR = new Parcelable.Creator<ExtensionData>() { // from class: com.google.android.apps.dashclock.api.ExtensionData.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ExtensionData createFromParcel(Parcel in) {
            return new ExtensionData(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public ExtensionData[] newArray(int size) {
            return new ExtensionData[size];
        }
    };

    public ExtensionData() {
        this.mVisible = false;
        this.mIcon = 0;
        this.mIconUri = null;
        this.mStatus = null;
        this.mExpandedTitle = null;
        this.mExpandedBody = null;
        this.mClickIntent = null;
        this.mContentDescription = null;
    }

    public boolean visible() {
        return this.mVisible;
    }

    public ExtensionData visible(boolean visible) {
        this.mVisible = visible;
        return this;
    }

    public int icon() {
        return this.mIcon;
    }

    public ExtensionData icon(int icon) {
        this.mIcon = icon;
        return this;
    }

    public Uri iconUri() {
        return this.mIconUri;
    }

    public ExtensionData iconUri(Uri iconUri) {
        this.mIconUri = iconUri;
        return this;
    }

    public String status() {
        return this.mStatus;
    }

    public ExtensionData status(String status) {
        this.mStatus = status;
        return this;
    }

    public String expandedTitle() {
        return this.mExpandedTitle;
    }

    public ExtensionData expandedTitle(String expandedTitle) {
        this.mExpandedTitle = expandedTitle;
        return this;
    }

    public String expandedBody() {
        return this.mExpandedBody;
    }

    public ExtensionData expandedBody(String expandedBody) {
        this.mExpandedBody = expandedBody;
        return this;
    }

    public Intent clickIntent() {
        return this.mClickIntent;
    }

    public ExtensionData clickIntent(Intent clickIntent) {
        this.mClickIntent = clickIntent;
        return this;
    }

    public String contentDescription() {
        return this.mContentDescription;
    }

    public ExtensionData contentDescription(String contentDescription) {
        this.mContentDescription = contentDescription;
        return this;
    }

    public JSONObject serialize() throws JSONException {
        JSONObject data = new JSONObject();
        data.put(KEY_VISIBLE, this.mVisible);
        data.put(KEY_ICON, this.mIcon);
        data.put(KEY_ICON_URI, this.mIconUri == null ? null : this.mIconUri.toString());
        data.put(KEY_STATUS, this.mStatus);
        data.put(KEY_EXPANDED_TITLE, this.mExpandedTitle);
        data.put(KEY_EXPANDED_BODY, this.mExpandedBody);
        data.put(KEY_CLICK_INTENT, this.mClickIntent == null ? null : this.mClickIntent.toUri(0));
        data.put(KEY_CONTENT_DESCRIPTION, this.mContentDescription);
        return data;
    }

    public void deserialize(JSONObject data) throws JSONException {
        this.mVisible = data.optBoolean(KEY_VISIBLE);
        this.mIcon = data.optInt(KEY_ICON);
        String iconUriString = data.optString(KEY_ICON_URI);
        this.mIconUri = TextUtils.isEmpty(iconUriString) ? null : Uri.parse(iconUriString);
        this.mStatus = data.optString(KEY_STATUS);
        this.mExpandedTitle = data.optString(KEY_EXPANDED_TITLE);
        this.mExpandedBody = data.optString(KEY_EXPANDED_BODY);
        try {
            this.mClickIntent = Intent.parseUri(data.optString(KEY_CLICK_INTENT), 0);
        } catch (URISyntaxException e) {
        }
        this.mContentDescription = data.optString(KEY_CONTENT_DESCRIPTION);
    }

    public Bundle toBundle() {
        Bundle data = new Bundle();
        data.putBoolean(KEY_VISIBLE, this.mVisible);
        data.putInt(KEY_ICON, this.mIcon);
        data.putString(KEY_ICON_URI, this.mIconUri == null ? null : this.mIconUri.toString());
        data.putString(KEY_STATUS, this.mStatus);
        data.putString(KEY_EXPANDED_TITLE, this.mExpandedTitle);
        data.putString(KEY_EXPANDED_BODY, this.mExpandedBody);
        data.putString(KEY_CLICK_INTENT, this.mClickIntent == null ? null : this.mClickIntent.toUri(0));
        data.putString(KEY_CONTENT_DESCRIPTION, this.mContentDescription);
        return data;
    }

    public void fromBundle(Bundle src) {
        this.mVisible = src.getBoolean(KEY_VISIBLE, true);
        this.mIcon = src.getInt(KEY_ICON);
        String iconUriString = src.getString(KEY_ICON_URI);
        this.mIconUri = TextUtils.isEmpty(iconUriString) ? null : Uri.parse(iconUriString);
        this.mStatus = src.getString(KEY_STATUS);
        this.mExpandedTitle = src.getString(KEY_EXPANDED_TITLE);
        this.mExpandedBody = src.getString(KEY_EXPANDED_BODY);
        try {
            this.mClickIntent = Intent.parseUri(src.getString(KEY_CLICK_INTENT), 0);
        } catch (URISyntaxException e) {
        }
        this.mContentDescription = src.getString(KEY_CONTENT_DESCRIPTION);
    }

    private ExtensionData(Parcel in) {
        this.mVisible = false;
        this.mIcon = 0;
        this.mIconUri = null;
        this.mStatus = null;
        this.mExpandedTitle = null;
        this.mExpandedBody = null;
        this.mClickIntent = null;
        this.mContentDescription = null;
        int parcelableVersion = in.readInt();
        int parcelableSize = in.readInt();
        int startPosition = in.dataPosition();
        if (parcelableVersion >= 1) {
            this.mVisible = in.readInt() != 0;
            this.mIcon = in.readInt();
            this.mStatus = in.readString();
            if (TextUtils.isEmpty(this.mStatus)) {
                this.mStatus = null;
            }
            this.mExpandedTitle = in.readString();
            if (TextUtils.isEmpty(this.mExpandedTitle)) {
                this.mExpandedTitle = null;
            }
            this.mExpandedBody = in.readString();
            if (TextUtils.isEmpty(this.mExpandedBody)) {
                this.mExpandedBody = null;
            }
            try {
                this.mClickIntent = Intent.parseUri(in.readString(), 0);
            } catch (URISyntaxException e) {
            }
        }
        if (parcelableVersion >= 2) {
            this.mContentDescription = in.readString();
            if (TextUtils.isEmpty(this.mContentDescription)) {
                this.mContentDescription = null;
            }
            String iconUriString = in.readString();
            this.mIconUri = TextUtils.isEmpty(iconUriString) ? null : Uri.parse(iconUriString);
        }
        if (parcelableVersion >= 2) {
            in.setDataPosition(startPosition + parcelableSize);
        }
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(2);
        int sizePosition = parcel.dataPosition();
        parcel.writeInt(0);
        int startPosition = parcel.dataPosition();
        parcel.writeInt(this.mVisible ? 1 : 0);
        parcel.writeInt(this.mIcon);
        parcel.writeString(TextUtils.isEmpty(this.mStatus) ? "" : this.mStatus);
        parcel.writeString(TextUtils.isEmpty(this.mExpandedTitle) ? "" : this.mExpandedTitle);
        parcel.writeString(TextUtils.isEmpty(this.mExpandedBody) ? "" : this.mExpandedBody);
        parcel.writeString(this.mClickIntent == null ? "" : this.mClickIntent.toUri(0));
        parcel.writeString(TextUtils.isEmpty(this.mContentDescription) ? "" : this.mContentDescription);
        parcel.writeString(this.mIconUri == null ? "" : this.mIconUri.toString());
        int parcelableSize = parcel.dataPosition() - startPosition;
        parcel.setDataPosition(sizePosition);
        parcel.writeInt(parcelableSize);
        parcel.setDataPosition(startPosition + parcelableSize);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        }
        try {
            ExtensionData other = (ExtensionData) o;
            if (other.mVisible == this.mVisible && other.mIcon == this.mIcon && objectEquals(other.mIconUri, this.mIconUri) && TextUtils.equals(other.mStatus, this.mStatus) && TextUtils.equals(other.mExpandedTitle, this.mExpandedTitle) && TextUtils.equals(other.mExpandedBody, this.mExpandedBody) && objectEquals(other.mClickIntent, this.mClickIntent)) {
                if (TextUtils.equals(other.mContentDescription, this.mContentDescription)) {
                    return true;
                }
            }
            return false;
        } catch (ClassCastException e) {
            return false;
        }
    }

    private static boolean objectEquals(Object x, Object y) {
        if (x == null || y == null) {
            return x == y;
        }
        return x.equals(y);
    }

    public static boolean equals(ExtensionData x, ExtensionData y) {
        if (x == null || y == null) {
            return x == y;
        }
        return x.equals(y);
    }

    public int hashCode() {
        throw new UnsupportedOperationException();
    }

    public void clean() {
        if (!TextUtils.isEmpty(this.mStatus) && this.mStatus.length() > 32) {
            this.mStatus = this.mStatus.substring(0, 32);
        }
        if (!TextUtils.isEmpty(this.mExpandedTitle) && this.mExpandedTitle.length() > 100) {
            this.mExpandedTitle = this.mExpandedTitle.substring(0, 100);
        }
        if (!TextUtils.isEmpty(this.mExpandedBody) && this.mExpandedBody.length() > 1000) {
            this.mExpandedBody = this.mExpandedBody.substring(0, MAX_EXPANDED_BODY_LENGTH);
        }
        if (!TextUtils.isEmpty(this.mContentDescription) && this.mContentDescription.length() > 1000) {
            this.mContentDescription = this.mContentDescription.substring(0, MAX_CONTENT_DESCRIPTION_LENGTH);
        }
    }
}
