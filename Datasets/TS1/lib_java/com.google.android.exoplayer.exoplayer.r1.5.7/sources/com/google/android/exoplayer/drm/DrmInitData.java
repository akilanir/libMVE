package com.google.android.exoplayer.drm;

import com.google.android.exoplayer.util.Assertions;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/drm/DrmInitData.class */
public interface DrmInitData {
    SchemeInitData get(UUID uuid);

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/drm/DrmInitData$Mapped.class */
    public static final class Mapped implements DrmInitData {
        private final Map<UUID, SchemeInitData> schemeData = new HashMap();

        @Override // com.google.android.exoplayer.drm.DrmInitData
        public SchemeInitData get(UUID schemeUuid) {
            return this.schemeData.get(schemeUuid);
        }

        public void put(UUID schemeUuid, SchemeInitData schemeInitData) {
            this.schemeData.put(schemeUuid, schemeInitData);
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/drm/DrmInitData$Universal.class */
    public static final class Universal implements DrmInitData {
        private SchemeInitData data;

        public Universal(SchemeInitData data) {
            this.data = data;
        }

        @Override // com.google.android.exoplayer.drm.DrmInitData
        public SchemeInitData get(UUID schemeUuid) {
            return this.data;
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/drm/DrmInitData$SchemeInitData.class */
    public static final class SchemeInitData {
        public final String mimeType;
        public final byte[] data;

        public SchemeInitData(String mimeType, byte[] data) {
            this.mimeType = (String) Assertions.checkNotNull(mimeType);
            this.data = (byte[]) Assertions.checkNotNull(data);
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof SchemeInitData)) {
                return false;
            }
            if (obj == this) {
                return true;
            }
            SchemeInitData other = (SchemeInitData) obj;
            return this.mimeType.equals(other.mimeType) && Arrays.equals(this.data, other.data);
        }

        public int hashCode() {
            return this.mimeType.hashCode() + (31 * Arrays.hashCode(this.data));
        }
    }
}
