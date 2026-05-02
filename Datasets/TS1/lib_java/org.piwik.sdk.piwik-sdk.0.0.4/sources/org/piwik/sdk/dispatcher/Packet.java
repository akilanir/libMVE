package org.piwik.sdk.dispatcher;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.net.URL;
import org.json.JSONObject;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.4.jar:org/piwik/sdk/dispatcher/Packet.class */
public class Packet {
    private final URL mTargetURL;
    private final JSONObject mJSONObject;
    private final long mTimeStamp;

    public Packet(@NonNull URL targetURL) {
        this(targetURL, null);
    }

    public Packet(@NonNull URL targetURL, @Nullable JSONObject JSONObject) {
        this.mTargetURL = targetURL;
        this.mJSONObject = JSONObject;
        this.mTimeStamp = System.currentTimeMillis();
    }

    @NonNull
    public URL getTargetURL() {
        return this.mTargetURL;
    }

    @Nullable
    public JSONObject getJSONObject() {
        return this.mJSONObject;
    }

    public long getTimeStamp() {
        return this.mTimeStamp;
    }
}
