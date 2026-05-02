package org.alexd.jsonrpc;

import android.os.Handler;
import android.os.Message;
import java.util.UUID;
import org.alexd.jsonrpc.JSONRPCParams;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedClient.class */
public abstract class JSONRPCThreadedClient {
    protected static final String JSON_RESULT = "result";
    protected JSONRPCParams.Versions version;
    protected boolean _debug = false;
    protected int soTimeout = 0;
    protected int connectionTimeout = 0;

    /* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedClient$Description.class */
    protected enum Description {
        NORMAL_RESPONSE,
        ERROR;

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static Description[] valuesCustom() {
            Description[] valuesCustom = values();
            int length = valuesCustom.length;
            Description[] descriptionArr = new Description[length];
            System.arraycopy(valuesCustom, 0, descriptionArr, 0, length);
            return descriptionArr;
        }
    }

    /* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedClient$OnBooleanResultListener.class */
    public interface OnBooleanResultListener extends OnObjectResultListener {
        void manageResult(boolean z);
    }

    /* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedClient$OnDoubleResultListener.class */
    public interface OnDoubleResultListener extends OnObjectResultListener {
        void manageResult(double d);
    }

    /* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedClient$OnIntResultListener.class */
    public interface OnIntResultListener extends OnObjectResultListener {
        void manageResult(int i);
    }

    /* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONArrayResultListener.class */
    public interface OnJSONArrayResultListener extends OnObjectResultListener {
        void manageResult(JSONArray jSONArray);
    }

    /* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedClient$OnJSONObjectResultListener.class */
    public interface OnJSONObjectResultListener extends OnObjectResultListener {
        void manageResult(JSONObject jSONObject);
    }

    /* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedClient$OnLongResultListener.class */
    public interface OnLongResultListener extends OnObjectResultListener {
        void manageResult(long j);
    }

    /* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedClient$OnObjectResultListener.class */
    public interface OnObjectResultListener {
        void manageResult(Object obj);

        void sendErrorMessageNull();

        void sendError(Exception exc);
    }

    /* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedClient$OnStringResultListener.class */
    public interface OnStringResultListener extends OnObjectResultListener {
        void manageResult(String str);
    }

    protected abstract JSONObject doJSONRequest(JSONObject jSONObject) throws JSONRPCException;

    /* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONRPCThreadedClient$MessageObject.class */
    protected class MessageObject {
        public Description description;
        public Object content;

        public MessageObject(Description description, Object content) {
            this.description = description;
            this.content = content;
        }
    }

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

    public void call(final String method, final OnObjectResultListener listener, final Object... params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.1
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg.obj != null) {
                    MessageObject object = (MessageObject) msg.obj;
                    if (object.description == Description.ERROR) {
                        listener.sendError((Exception) object.content);
                        return;
                    } else {
                        listener.manageResult(object.content);
                        return;
                    }
                }
                listener.sendErrorMessageNull();
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.2
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                try {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, JSONRPCThreadedClient.this.doRequest(method, params).get(JSONRPCThreadedClient.JSON_RESULT));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e2);
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void call(final String method, final OnObjectResultListener onResultListener, final JSONObject params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.3
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg.obj != null) {
                    MessageObject object = (MessageObject) msg.obj;
                    if (object.description == Description.ERROR) {
                        onResultListener.sendError((Exception) object.content);
                        return;
                    } else {
                        onResultListener.manageResult(object.content);
                        return;
                    }
                }
                onResultListener.sendErrorMessageNull();
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.4
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                try {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, JSONRPCThreadedClient.this.doRequest(method, params).get(JSONRPCThreadedClient.JSON_RESULT));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e2);
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callString(final String method, final OnStringResultListener listener, final Object... params) throws JSONRPCException {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.5
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg.obj != null) {
                    MessageObject object = (MessageObject) msg.obj;
                    if (object.description == Description.ERROR) {
                        listener.sendError((Exception) object.content);
                        return;
                    } else {
                        listener.manageResult((String) object.content);
                        return;
                    }
                }
                listener.sendErrorMessageNull();
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.6
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                try {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, JSONRPCThreadedClient.this.doRequest(method, params).getString(JSONRPCThreadedClient.JSON_RESULT));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e2);
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callString(final String method, final OnStringResultListener listener, final JSONObject params) throws JSONRPCException {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.7
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg.obj != null) {
                    MessageObject object = (MessageObject) msg.obj;
                    if (object.description == Description.ERROR) {
                        listener.sendError((Exception) object.content);
                        return;
                    } else {
                        listener.manageResult((String) object.content);
                        return;
                    }
                }
                listener.sendErrorMessageNull();
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.8
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                try {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, JSONRPCThreadedClient.this.doRequest(method, params).getString(JSONRPCThreadedClient.JSON_RESULT));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e2);
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callInt(final String method, final OnIntResultListener listener, final Object... params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.9
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg.obj != null) {
                    MessageObject object = (MessageObject) msg.obj;
                    if (object.description == Description.ERROR) {
                        listener.sendError((Exception) object.content);
                        return;
                    } else {
                        listener.manageResult(((Integer) object.content).intValue());
                        return;
                    }
                }
                listener.sendErrorMessageNull();
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.10
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                JSONObject response = null;
                try {
                    response = JSONRPCThreadedClient.this.doRequest(method, params);
                    if (response == null) {
                        JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, new JSONRPCException("Cannot call method: " + method));
                    }
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Integer(response.getInt(JSONRPCThreadedClient.JSON_RESULT)));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    try {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Integer(response.getString(JSONRPCThreadedClient.JSON_RESULT)));
                    } catch (NumberFormatException e3) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e2);
                    } catch (JSONException e4) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e2);
                    }
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callInt(final String method, final OnIntResultListener listener, final JSONObject params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.11
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg.obj == null) {
                    listener.sendErrorMessageNull();
                    return;
                }
                MessageObject mo = (MessageObject) msg.obj;
                if (mo.description == Description.ERROR) {
                    listener.sendError((Exception) mo.content);
                } else {
                    listener.manageResult(((Integer) mo.content).intValue());
                }
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.12
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                JSONObject response = null;
                try {
                    response = JSONRPCThreadedClient.this.doRequest(method, params);
                    if (response == null) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, new JSONRPCException("Cannot call method: " + method));
                    } else {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Integer(response.getInt(JSONRPCThreadedClient.JSON_RESULT)));
                    }
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    try {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Integer(response.getString(JSONRPCThreadedClient.JSON_RESULT)));
                    } catch (NumberFormatException e1) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e1);
                    } catch (JSONException e12) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e12);
                    }
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callLong(final String method, final OnLongResultListener listener, final Object... params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.13
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg.obj == null) {
                    listener.sendErrorMessageNull();
                    return;
                }
                MessageObject mo = (MessageObject) msg.obj;
                if (mo.description == Description.ERROR) {
                    listener.sendError((Exception) mo.content);
                } else {
                    listener.manageResult(((Long) mo.content).longValue());
                }
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.14
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                JSONObject response = null;
                try {
                    response = JSONRPCThreadedClient.this.doRequest(method, params);
                    if (response == null) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, new JSONRPCException("Cannot call method: " + method));
                    } else {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Long(response.getLong(JSONRPCThreadedClient.JSON_RESULT)));
                    }
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    try {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, Long.valueOf(Long.parseLong(response.getString(JSONRPCThreadedClient.JSON_RESULT))));
                    } catch (NumberFormatException e1) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e1);
                    } catch (JSONException e22) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e22);
                    }
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callLong(final String method, final OnLongResultListener listener, final JSONObject params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.15
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg == null || msg.obj == null) {
                    listener.sendErrorMessageNull();
                    return;
                }
                MessageObject mo = (MessageObject) msg.obj;
                if (mo.description == Description.ERROR) {
                    listener.sendError((Exception) mo.content);
                } else {
                    listener.manageResult(((Long) mo.content).longValue());
                }
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.16
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                JSONObject response = null;
                try {
                    response = JSONRPCThreadedClient.this.doRequest(method, params);
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Long(response.getLong(JSONRPCThreadedClient.JSON_RESULT)));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    try {
                        JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Long(response.getString(JSONRPCThreadedClient.JSON_RESULT)));
                    } catch (NumberFormatException e1) {
                        JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e1);
                    } catch (JSONException e12) {
                        JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e12);
                    }
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e2);
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callBoolean(final String method, final OnBooleanResultListener listener, final Object... params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.17
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg == null || msg.obj == null) {
                    listener.sendErrorMessageNull();
                    return;
                }
                MessageObject mo = (MessageObject) msg.obj;
                if (mo.description == Description.ERROR) {
                    Exception e = (Exception) mo.content;
                    listener.sendError(e);
                } else {
                    listener.manageResult(((Boolean) mo.content).booleanValue());
                }
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.18
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                JSONObject response = null;
                try {
                    response = JSONRPCThreadedClient.this.doRequest(method, params);
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Boolean(response.getBoolean(JSONRPCThreadedClient.JSON_RESULT)));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    try {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Boolean(response.getString(JSONRPCThreadedClient.JSON_RESULT)));
                    } catch (JSONException e1) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e1);
                    }
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callBoolean(final String method, final OnBooleanResultListener listener, final JSONObject params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.19
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg == null || msg.obj == null) {
                    listener.sendErrorMessageNull();
                    return;
                }
                MessageObject mo = (MessageObject) msg.obj;
                if (mo.description == Description.ERROR) {
                    listener.sendError((Exception) mo.content);
                } else {
                    listener.manageResult(((Boolean) mo.content).booleanValue());
                }
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.20
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                JSONObject response = null;
                try {
                    response = JSONRPCThreadedClient.this.doRequest(method, params);
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Boolean(response.getBoolean(JSONRPCThreadedClient.JSON_RESULT)));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    try {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Boolean(response.getString(JSONRPCThreadedClient.JSON_RESULT)));
                    } catch (JSONException e1) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e1);
                    }
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callDouble(final String method, final OnDoubleResultListener listener, final Object... params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.21
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg == null || msg.obj == null) {
                    listener.sendErrorMessageNull();
                    return;
                }
                MessageObject mo = (MessageObject) msg.obj;
                if (mo.description == Description.ERROR) {
                    listener.sendError((Exception) mo.content);
                } else {
                    listener.manageResult(((Double) mo.content).doubleValue());
                }
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.22
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                JSONObject response = null;
                try {
                    response = JSONRPCThreadedClient.this.doRequest(method, params);
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Double(response.getDouble(JSONRPCThreadedClient.JSON_RESULT)));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    try {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Double(response.getString(JSONRPCThreadedClient.JSON_RESULT)));
                    } catch (NumberFormatException e1) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e1);
                    } catch (JSONException e12) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e12);
                    }
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callDouble(final String method, final OnDoubleResultListener listener, final JSONObject params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.23
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg == null || msg.obj == null) {
                    listener.sendErrorMessageNull();
                    return;
                }
                MessageObject mo = (MessageObject) msg.obj;
                if (mo.description == Description.ERROR) {
                    listener.sendError((Exception) mo.content);
                } else {
                    listener.manageResult(((Double) mo.content).doubleValue());
                }
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.24
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                JSONObject response = null;
                try {
                    response = JSONRPCThreadedClient.this.doRequest(method, params);
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Double(response.getDouble(JSONRPCThreadedClient.JSON_RESULT)));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    try {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, new Double(response.getString(JSONRPCThreadedClient.JSON_RESULT)));
                    } catch (NumberFormatException e1) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e1);
                    } catch (JSONException e12) {
                        mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e12);
                    }
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callJSONObject(final String method, final OnJSONObjectResultListener listener, final JSONObject params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.25
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg == null || msg.obj == null) {
                    listener.sendErrorMessageNull();
                    return;
                }
                MessageObject mo = (MessageObject) msg.obj;
                if (mo.description == Description.ERROR) {
                    listener.sendError((Exception) mo.content);
                } else {
                    listener.manageResult((JSONObject) mo.content);
                }
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.26
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                try {
                    JSONObject response = JSONRPCThreadedClient.this.doRequest(method, params);
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, response.getJSONObject(JSONRPCThreadedClient.JSON_RESULT));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e2);
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callJSONObject(final String method, final OnJSONObjectResultListener listener, final Object... params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.27
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg == null || msg.obj == null) {
                    listener.sendErrorMessageNull();
                    return;
                }
                MessageObject mo = (MessageObject) msg.obj;
                if (mo.description == Description.ERROR) {
                    listener.sendError((Exception) mo.content);
                } else {
                    listener.manageResult((JSONObject) mo.content);
                }
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.28
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                try {
                    JSONObject response = JSONRPCThreadedClient.this.doRequest(method, params);
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, response.getJSONObject(JSONRPCThreadedClient.JSON_RESULT));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e2);
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callJSONArray(final String method, final OnJSONArrayResultListener listener, final Object... params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.29
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg == null || msg.obj == null) {
                    listener.sendErrorMessageNull();
                    return;
                }
                MessageObject mo = (MessageObject) msg.obj;
                if (mo.description == Description.ERROR) {
                    listener.sendError((Exception) mo.content);
                } else {
                    listener.manageResult((JSONArray) mo.content);
                }
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.30
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                try {
                    JSONObject response = JSONRPCThreadedClient.this.doRequest(method, params);
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, response.getJSONArray(JSONRPCThreadedClient.JSON_RESULT));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e2);
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }

    public void callJSONArray(final String method, final OnJSONArrayResultListener listener, final JSONObject params) {
        final Handler handler = new Handler() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.31
            @Override // android.os.Handler
            public void handleMessage(Message msg) {
                if (msg == null || msg.obj == null) {
                    listener.sendErrorMessageNull();
                    return;
                }
                MessageObject mo = (MessageObject) msg.obj;
                if (mo.description == Description.ERROR) {
                    listener.sendError((Exception) mo.content);
                } else {
                    listener.manageResult((JSONArray) mo.content);
                }
            }
        };
        Thread thread = new Thread() { // from class: org.alexd.jsonrpc.JSONRPCThreadedClient.32
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                MessageObject mo;
                try {
                    JSONObject response = JSONRPCThreadedClient.this.doRequest(method, params);
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.NORMAL_RESPONSE, response.getJSONArray(JSONRPCThreadedClient.JSON_RESULT));
                } catch (JSONRPCException e) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e);
                } catch (JSONException e2) {
                    mo = JSONRPCThreadedClient.this.new MessageObject(Description.ERROR, e2);
                }
                handler.sendMessage(handler.obtainMessage(5, mo));
            }
        };
        thread.start();
    }
}
