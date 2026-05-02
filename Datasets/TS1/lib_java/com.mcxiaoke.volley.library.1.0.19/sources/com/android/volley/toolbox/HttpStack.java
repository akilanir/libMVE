package com.android.volley.toolbox;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import java.io.IOException;
import java.util.Map;
import org.apache.http.HttpResponse;

/* loaded from: com.mcxiaoke.volley.library.1.0.19.jar:com/android/volley/toolbox/HttpStack.class */
public interface HttpStack {
    HttpResponse performRequest(Request<?> request, Map<String, String> map) throws IOException, AuthFailureError;
}
