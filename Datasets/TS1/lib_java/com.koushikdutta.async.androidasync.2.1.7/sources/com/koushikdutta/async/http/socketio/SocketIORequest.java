package com.koushikdutta.async.http.socketio;

import android.net.Uri;
import com.koushikdutta.async.BuildConfig;
import com.koushikdutta.async.http.AsyncHttpPost;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/socketio/SocketIORequest.class */
public class SocketIORequest extends AsyncHttpPost {
    Config config;
    String endpoint;
    String query;

    public SocketIORequest(String uri) {
        this(uri, BuildConfig.FLAVOR);
    }

    public Config getConfig() {
        return this.config;
    }

    public String getEndpoint() {
        return this.endpoint;
    }

    public String getQuery() {
        return this.query;
    }

    public SocketIORequest(String uri, String endpoint) {
        this(uri, endpoint, null);
    }

    public SocketIORequest(String uri, String endpoint, String query) {
        this(uri, endpoint, query, null);
    }

    public SocketIORequest(String uri, String endpoint, String query, Config config) {
        super(Uri.parse(uri + (query == null ? BuildConfig.FLAVOR : "?" + query)).buildUpon().encodedPath("/socket.io/1/").build().toString());
        this.config = config != null ? config : new Config();
        this.endpoint = endpoint;
        this.query = query;
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/socketio/SocketIORequest$Config.class */
    public static class Config {
        boolean randomizeReconnectDelay = false;
        long reconnectDelay = 1000;
        long reconnectDelayMax = 0;

        public void setRandomizeReconnectDelay(boolean randomizeReconnectDelay) {
            this.randomizeReconnectDelay = randomizeReconnectDelay;
        }

        public boolean isRandomizeReconnectDelay() {
            return this.randomizeReconnectDelay;
        }

        public void setReconnectDelay(long reconnectDelay) {
            if (reconnectDelay < 0) {
                throw new IllegalArgumentException("reconnectDelay must be >= 0");
            }
            this.reconnectDelay = reconnectDelay;
        }

        public long getReconnectDelay() {
            return this.reconnectDelay;
        }

        public void setReconnectDelayMax(long reconnectDelayMax) {
            if (this.reconnectDelay < 0) {
                throw new IllegalArgumentException("reconnectDelayMax must be >= 0");
            }
            this.reconnectDelayMax = reconnectDelayMax;
        }

        public long getReconnectDelayMax() {
            return this.reconnectDelayMax;
        }
    }
}
