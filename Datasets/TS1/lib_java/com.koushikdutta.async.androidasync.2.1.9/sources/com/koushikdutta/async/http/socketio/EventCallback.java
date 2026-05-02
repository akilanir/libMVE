package com.koushikdutta.async.http.socketio;

import org.json.JSONArray;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/socketio/EventCallback.class */
public interface EventCallback {
    void onEvent(JSONArray jSONArray, Acknowledge acknowledge);
}
