package org.alexd.jsonrpc;

import android.util.Log;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolVersion;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedHttpClient.class */
public class JSONRPCThreadedHttpClient extends JSONRPCThreadedClient {
    private HttpClient httpClient;
    private String serviceUri;
    private static final ProtocolVersion PROTOCOL_VERSION = new ProtocolVersion("HTTP", 1, 0);

    public JSONRPCThreadedHttpClient(HttpClient cleint, String uri) {
        this.httpClient = cleint;
        this.serviceUri = uri;
    }

    public JSONRPCThreadedHttpClient(String uri) {
        this(new DefaultHttpClient(), uri);
    }

    @Override // org.alexd.jsonrpc.JSONRPCThreadedClient
    protected JSONObject doJSONRequest(JSONObject jsonRequest) throws JSONRPCException {
        if (this._debug) {
            Log.d(JSONRPCThreadedHttpClient.class.toString(), "Request: " + jsonRequest.toString());
        }
        HttpPost request = new HttpPost(this.serviceUri);
        HttpParams params = new BasicHttpParams();
        HttpConnectionParams.setConnectionTimeout(params, getConnectionTimeout());
        HttpConnectionParams.setSoTimeout(params, getSoTimeout());
        HttpProtocolParams.setVersion(params, PROTOCOL_VERSION);
        request.setParams(params);
        try {
            HttpEntity entity = new JSONEntity(jsonRequest);
            request.setEntity(entity);
            try {
                long t = System.currentTimeMillis();
                HttpResponse response = this.httpClient.execute(request);
                long currentTimeMillis = System.currentTimeMillis() - t;
                String responseString = EntityUtils.toString(response.getEntity());
                if (this._debug) {
                    Log.d(JSONRPCThreadedHttpClient.class.toString(), "Response: " + responseString);
                }
                JSONObject jsonResponse = new JSONObject(responseString.trim());
                if (jsonResponse.has("error")) {
                    Object jsonError = jsonResponse.get("error");
                    if (!jsonError.equals(null)) {
                        throw new JSONRPCException(jsonResponse.get("error"));
                    }
                    return jsonResponse;
                }
                return jsonResponse;
            } catch (ClientProtocolException e) {
                throw new JSONRPCException("HTTP error", e);
            } catch (IOException e2) {
                throw new JSONRPCException("IO error", e2);
            } catch (JSONException e3) {
                throw new JSONRPCException("Invalid JSON response", e3);
            }
        } catch (UnsupportedEncodingException e1) {
            throw new JSONRPCException("Unsupported encoding", e1);
        }
    }
}
