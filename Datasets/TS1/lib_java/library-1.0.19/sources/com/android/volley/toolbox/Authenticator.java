package com.android.volley.toolbox;

import com.android.volley.AuthFailureError;

/* loaded from: library-1.0.19.jar:com/android/volley/toolbox/Authenticator.class */
public interface Authenticator {
    String getAuthToken() throws AuthFailureError;

    void invalidateAuthToken(String str);
}
