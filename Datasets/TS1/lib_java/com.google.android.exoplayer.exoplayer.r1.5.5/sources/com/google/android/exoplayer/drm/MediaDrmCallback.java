package com.google.android.exoplayer.drm;

import android.annotation.TargetApi;
import android.media.MediaDrm;
import java.util.UUID;

@TargetApi(18)
/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/drm/MediaDrmCallback.class */
public interface MediaDrmCallback {
    byte[] executeProvisionRequest(UUID uuid, MediaDrm.ProvisionRequest provisionRequest) throws Exception;

    byte[] executeKeyRequest(UUID uuid, MediaDrm.KeyRequest keyRequest) throws Exception;
}
