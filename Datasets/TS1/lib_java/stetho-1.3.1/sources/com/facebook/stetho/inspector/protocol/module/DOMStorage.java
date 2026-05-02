package com.facebook.stetho.inspector.protocol.module;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.SharedPreferences;
import com.facebook.stetho.inspector.console.CLog;
import com.facebook.stetho.inspector.domstorage.DOMStoragePeerManager;
import com.facebook.stetho.inspector.domstorage.SharedPreferencesHelper;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcException;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.inspector.protocol.module.Console;
import com.facebook.stetho.json.ObjectMapper;
import com.facebook.stetho.json.annotation.JsonProperty;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/DOMStorage.class */
public class DOMStorage implements ChromeDevtoolsDomain {
    private final Context mContext;
    private final DOMStoragePeerManager mDOMStoragePeerManager;
    private final ObjectMapper mObjectMapper = new ObjectMapper();

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemAddedParams.class */
    public static class DomStorageItemAddedParams {

        @JsonProperty(required = true)
        public StorageId storageId;

        @JsonProperty(required = true)
        public String key;

        @JsonProperty(required = true)
        public String newValue;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemRemovedParams.class */
    public static class DomStorageItemRemovedParams {

        @JsonProperty(required = true)
        public StorageId storageId;

        @JsonProperty(required = true)
        public String key;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemUpdatedParams.class */
    public static class DomStorageItemUpdatedParams {

        @JsonProperty(required = true)
        public StorageId storageId;

        @JsonProperty(required = true)
        public String key;

        @JsonProperty(required = true)
        public String oldValue;

        @JsonProperty(required = true)
        public String newValue;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemsClearedParams.class */
    public static class DomStorageItemsClearedParams {

        @JsonProperty(required = true)
        public StorageId storageId;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId.class */
    public static class StorageId {

        @JsonProperty(required = true)
        public String securityOrigin;

        @JsonProperty(required = true)
        public boolean isLocalStorage;
    }

    public DOMStorage(Context context) {
        this.mContext = context;
        this.mDOMStoragePeerManager = new DOMStoragePeerManager(context);
    }

    @ChromeDevtoolsMethod
    public void enable(JsonRpcPeer peer, JSONObject params) {
        this.mDOMStoragePeerManager.addPeer(peer);
    }

    @ChromeDevtoolsMethod
    public void disable(JsonRpcPeer peer, JSONObject params) {
        this.mDOMStoragePeerManager.removePeer(peer);
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getDOMStorageItems(JsonRpcPeer peer, JSONObject params) throws JSONException {
        StorageId storage = (StorageId) this.mObjectMapper.convertValue(params.getJSONObject("storageId"), StorageId.class);
        ArrayList<List<String>> entries = new ArrayList<>();
        String prefTag = storage.securityOrigin;
        if (storage.isLocalStorage) {
            SharedPreferences prefs = this.mContext.getSharedPreferences(prefTag, 0);
            for (Map.Entry<String, ?> prefsEntry : prefs.getAll().entrySet()) {
                ArrayList<String> entry = new ArrayList<>(2);
                entry.add(prefsEntry.getKey());
                entry.add(SharedPreferencesHelper.valueToString(prefsEntry.getValue()));
                entries.add(entry);
            }
        }
        GetDOMStorageItemsResult result = new GetDOMStorageItemsResult();
        result.entries = entries;
        return result;
    }

    @ChromeDevtoolsMethod
    public void setDOMStorageItem(JsonRpcPeer peer, JSONObject params) throws JSONException, JsonRpcException {
        StorageId storage = (StorageId) this.mObjectMapper.convertValue(params.getJSONObject("storageId"), StorageId.class);
        String key = params.getString("key");
        String value = params.getString("value");
        if (storage.isLocalStorage) {
            SharedPreferences prefs = this.mContext.getSharedPreferences(storage.securityOrigin, 0);
            Object existingValue = prefs.getAll().get(key);
            try {
                if (existingValue == null) {
                    throw new DOMStorageAssignmentException("Unsupported: cannot add new key " + key + " due to lack of type inference");
                }
                SharedPreferences.Editor editor = prefs.edit();
                try {
                    assignByType(editor, key, SharedPreferencesHelper.valueFromString(value, existingValue));
                    editor.apply();
                } catch (IllegalArgumentException e) {
                    throw new DOMStorageAssignmentException(String.format(Locale.US, "Type mismatch setting %s to %s (expected %s)", key, value, existingValue.getClass().getSimpleName()));
                }
            } catch (DOMStorageAssignmentException e2) {
                CLog.writeToConsole(this.mDOMStoragePeerManager, Console.MessageLevel.ERROR, Console.MessageSource.STORAGE, e2.getMessage());
                if (prefs.contains(key)) {
                    this.mDOMStoragePeerManager.signalItemUpdated(storage, key, value, SharedPreferencesHelper.valueToString(existingValue));
                } else {
                    this.mDOMStoragePeerManager.signalItemRemoved(storage, key);
                }
            }
        }
    }

    @ChromeDevtoolsMethod
    public void removeDOMStorageItem(JsonRpcPeer peer, JSONObject params) throws JSONException {
        StorageId storage = (StorageId) this.mObjectMapper.convertValue(params.getJSONObject("storageId"), StorageId.class);
        String key = params.getString("key");
        if (storage.isLocalStorage) {
            SharedPreferences prefs = this.mContext.getSharedPreferences(storage.securityOrigin, 0);
            prefs.edit().remove(key).apply();
        }
    }

    private static void assignByType(SharedPreferences.Editor editor, String key, Object value) throws IllegalArgumentException {
        if (value instanceof Integer) {
            editor.putInt(key, ((Integer) value).intValue());
            return;
        }
        if (value instanceof Long) {
            editor.putLong(key, ((Long) value).longValue());
            return;
        }
        if (value instanceof Float) {
            editor.putFloat(key, ((Float) value).floatValue());
            return;
        }
        if (value instanceof Boolean) {
            editor.putBoolean(key, ((Boolean) value).booleanValue());
        } else if (value instanceof String) {
            editor.putString(key, (String) value);
        } else {
            if (value instanceof Set) {
                putStringSet(editor, key, (Set) value);
                return;
            }
            throw new IllegalArgumentException("Unsupported type=" + value.getClass().getName());
        }
    }

    @TargetApi(DatabaseConstants.MIN_API_LEVEL)
    private static void putStringSet(SharedPreferences.Editor editor, String key, Set<String> value) {
        editor.putStringSet(key, value);
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/DOMStorage$GetDOMStorageItemsResult.class */
    private static class GetDOMStorageItemsResult implements JsonRpcResult {

        @JsonProperty(required = true)
        public List<List<String>> entries;

        private GetDOMStorageItemsResult() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException.class */
    private static class DOMStorageAssignmentException extends Exception {
        public DOMStorageAssignmentException(String message) {
            super(message);
        }
    }
}
