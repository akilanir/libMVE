package com.google.android.exoplayer.dash.mpd;

import com.google.android.exoplayer.drm.DrmInitData;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.util.UUID;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/ContentProtection.class */
public class ContentProtection {
    public final String schemeUriId;
    public final UUID uuid;
    public final DrmInitData.SchemeInitData data;

    public ContentProtection(String schemeUriId, UUID uuid, DrmInitData.SchemeInitData data) {
        this.schemeUriId = (String) Assertions.checkNotNull(schemeUriId);
        this.uuid = uuid;
        this.data = data;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof ContentProtection)) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        ContentProtection other = (ContentProtection) obj;
        return this.schemeUriId.equals(other.schemeUriId) && Util.areEqual(this.uuid, other.uuid) && Util.areEqual(this.data, other.data);
    }

    public int hashCode() {
        int hashCode = this.schemeUriId.hashCode();
        return (37 * ((37 * hashCode) + (this.uuid != null ? this.uuid.hashCode() : 0))) + (this.data != null ? this.data.hashCode() : 0);
    }
}
