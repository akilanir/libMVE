package org.alexd.jsonrpc;

import java.util.UUID;
import org.alexd.jsonrpc.JSONRPCParams;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCClient.class */
public abstract class JSONRPCClient {
    protected JSONRPCParams.Versions version;
    protected String encoding = "UTF-8";
    protected boolean _debug = false;
    protected int soTimeout = 0;
    protected int connectionTimeout = 0;

    protected abstract JSONObject doJSONRequest(JSONObject jSONObject) throws JSONRPCException;

    public static JSONRPCClient create(String uri, JSONRPCParams.Versions version) {
        JSONRPCClient client = new JSONRPCHttpClient(uri);
        client.version = version;
        return client;
    }

    public void setDebug(boolean _debug) {
        this._debug = _debug;
    }

    public boolean isDebug() {
        return this._debug;
    }

    public void setEncoding(String encoding) {
        this.encoding = encoding;
    }

    public void delEncoding() {
        this.encoding = "";
    }

    protected static JSONArray getJSONArray(Object[] array) {
        JSONArray arr = new JSONArray();
        for (Object item : array) {
            if (item.getClass().isArray()) {
                arr.put(getJSONArray((Object[]) item));
            } else {
                arr.put(item);
            }
        }
        return arr;
    }

    protected JSONObject doRequest(String method, Object[] params) throws JSONRPCException {
        JSONArray jsonParams = new JSONArray();
        for (int i = 0; i < params.length; i++) {
            if (params[i].getClass().isArray()) {
                jsonParams.put(getJSONArray((Object[]) params[i]));
            }
            jsonParams.put(params[i]);
        }
        JSONObject jsonRequest = new JSONObject();
        try {
            jsonRequest.put("id", UUID.randomUUID().hashCode());
            jsonRequest.put("method", method);
            jsonRequest.put("params", jsonParams);
            return doJSONRequest(jsonRequest);
        } catch (JSONException e1) {
            throw new JSONRPCException("Invalid JSON request", e1);
        }
    }

    protected JSONObject doRequest(String method, JSONObject params) throws JSONRPCException, JSONException {
        JSONObject jsonRequest = new JSONObject();
        try {
            jsonRequest.put("id", UUID.randomUUID().hashCode());
            jsonRequest.put("method", method);
            jsonRequest.put("params", params);
            jsonRequest.put("jsonrpc", "2.0");
            return doJSONRequest(jsonRequest);
        } catch (JSONException e1) {
            throw new JSONRPCException("Invalid JSON request", e1);
        }
    }

    public int getSoTimeout() {
        return this.soTimeout;
    }

    public void setSoTimeout(int soTimeout) {
        this.soTimeout = soTimeout;
    }

    public int getConnectionTimeout() {
        return this.connectionTimeout;
    }

    public void setConnectionTimeout(int connectionTimeout) {
        this.connectionTimeout = connectionTimeout;
    }

    public Object call(String method, Object... params) throws JSONRPCException {
        try {
            return doRequest(method, params).get("result");
        } catch (JSONException e) {
            throw new JSONRPCException("Cannot convert result", e);
        }
    }

    public Object call(String method, JSONObject params) throws JSONRPCException {
        try {
            return doRequest(method, params).get("result");
        } catch (JSONException e) {
            throw new JSONRPCException("Cannot convert result to String", e);
        }
    }

    public String callString(String method, Object... params) throws JSONRPCException {
        try {
            return doRequest(method, params).getString("result");
        } catch (JSONRPCException e) {
            throw new JSONRPCException("Cannot convert result to String", e);
        } catch (JSONException e2) {
            throw new JSONRPCException("Cannot convert result to String", e2);
        }
    }

    public String callString(String method, JSONObject params) throws JSONRPCException {
        try {
            return doRequest(method, params).getString("result");
        } catch (JSONRPCException e) {
            throw new JSONRPCException("Cannot convert result to String", e);
        } catch (JSONException e2) {
            throw new JSONRPCException("Cannot convert result to String", e2);
        } catch (Exception e3) {
            throw new JSONRPCException("Cannot convert result to String", e3);
        }
    }

    public int callInt(String method, Object... params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return response2.getInt("result");
        } catch (JSONException e) {
            try {
                return Integer.parseInt(response.getString("result"));
            } catch (NumberFormatException e1) {
                throw new JSONRPCException("Cannot convert result to int", e1);
            } catch (JSONException e12) {
                throw new JSONRPCException("Cannot convert result to int", e12);
            }
        }
    }

    public Object callInt(String method, JSONObject params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return Integer.valueOf(response2.getInt("result"));
        } catch (JSONException e) {
            try {
                return Integer.valueOf(Integer.parseInt(response.getString("result")));
            } catch (NumberFormatException e1) {
                throw new JSONRPCException("Cannot convert result to int", e1);
            } catch (JSONException e12) {
                throw new JSONRPCException("Cannot convert result to int", e12);
            }
        }
    }

    public long callLong(String method, Object... params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return response2.getLong("result");
        } catch (JSONException e) {
            try {
                return Long.parseLong(response.getString("result"));
            } catch (NumberFormatException e2) {
                throw new JSONRPCException("Cannot convert result to long", e);
            } catch (JSONException e3) {
                throw new JSONRPCException("Cannot convert result to long", e);
            }
        }
    }

    public long callLong(String method, JSONObject params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return response2.getLong("result");
        } catch (JSONException e) {
            try {
                return Long.parseLong(response.getString("result"));
            } catch (NumberFormatException e2) {
                throw new JSONRPCException("Cannot convert result to long", e);
            } catch (JSONException e3) {
                throw new JSONRPCException("Cannot convert result to long", e);
            }
        }
    }

    public boolean callBoolean(String method, Object... params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return response2.getBoolean("result");
        } catch (JSONException e) {
            try {
                return Boolean.parseBoolean(response.getString("result"));
            } catch (NumberFormatException e1) {
                throw new JSONRPCException("Cannot convert result to boolean", e1);
            } catch (JSONException e12) {
                throw new JSONRPCException("Cannot convert result to boolean", e12);
            }
        }
    }

    public boolean callBoolean(String method, JSONObject params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return response2.getBoolean("result");
        } catch (JSONException e) {
            try {
                return Boolean.parseBoolean(response.getString("result"));
            } catch (NumberFormatException e2) {
                throw new JSONRPCException("Cannot convert result to boolean", e);
            } catch (JSONException e3) {
                throw new JSONRPCException("Cannot convert result to boolean", e);
            }
        }
    }

    public double callDouble(String method, Object... params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return response2.getDouble("result");
        } catch (JSONException e) {
            try {
                return Double.parseDouble(response.getString("result"));
            } catch (NumberFormatException e2) {
                throw new JSONRPCException("Cannot convert result to double", e);
            } catch (JSONException e3) {
                throw new JSONRPCException("Cannot convert result to double", e);
            }
        }
    }

    public double callDouble(String method, JSONObject params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return response2.getDouble("result");
        } catch (JSONException e) {
            try {
                return Double.parseDouble(response.getString("result"));
            } catch (NumberFormatException e2) {
                throw new JSONRPCException("Cannot convert result to double", e);
            } catch (JSONException e3) {
                throw new JSONRPCException("Cannot convert result to double", e);
            }
        }
    }

    public JSONObject callJSONObject(String method, JSONObject params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return response2.getJSONObject("result");
        } catch (JSONException e) {
            try {
                return new JSONObject(response.getString("result"));
            } catch (NumberFormatException e2) {
                throw new JSONRPCException("Cannot convert result to JSONObject", e);
            } catch (JSONException e3) {
                throw new JSONRPCException("Cannot convert result to JSONObject", e);
            }
        }
    }

    public JSONObject callJSONObject(String method, Object... params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return response2.getJSONObject("result");
        } catch (JSONException e) {
            try {
                return new JSONObject(response.getString("result"));
            } catch (NumberFormatException e2) {
                throw new JSONRPCException("Cannot convert result to JSONObject", e);
            } catch (JSONException e3) {
                throw new JSONRPCException("Cannot convert result to JSONObject", e);
            }
        }
    }

    public JSONArray callJSONArray(String method, Object... params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return response2.getJSONArray("result");
        } catch (JSONException e) {
            try {
                return new JSONArray(response.getString("result"));
            } catch (NumberFormatException e2) {
                throw new JSONRPCException("Cannot convert result to JSONArray", e);
            } catch (JSONException e3) {
                throw new JSONRPCException("Cannot convert result to JSONArray", e);
            }
        }
    }

    public JSONArray callJSONArray(String method, JSONObject params) throws JSONRPCException {
        JSONObject response = null;
        try {
            JSONObject response2 = doRequest(method, params);
            if (response2 == null) {
                throw new JSONRPCException("Cannot call method: " + method);
            }
            return response2.getJSONArray("result");
        } catch (JSONException e) {
            try {
                return new JSONArray(response.getString("result"));
            } catch (NumberFormatException e2) {
                throw new JSONRPCException("Cannot convert result to JSONArray", e);
            } catch (JSONException e3) {
                throw new JSONRPCException("Cannot convert result to JSONArray", e);
            }
        }
    }
}
