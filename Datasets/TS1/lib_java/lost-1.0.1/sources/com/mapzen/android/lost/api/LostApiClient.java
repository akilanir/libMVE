package com.mapzen.android.lost.api;

import android.content.Context;
import com.mapzen.android.lost.internal.LostApiClientImpl;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/api/LostApiClient.class */
public interface LostApiClient {
    void connect();

    void disconnect();

    boolean isConnected();

    /* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/api/LostApiClient$Builder.class */
    public static final class Builder {
        private final Context context;

        public Builder(Context context) {
            this.context = context;
        }

        public LostApiClient build() {
            return new LostApiClientImpl(this.context);
        }
    }
}
