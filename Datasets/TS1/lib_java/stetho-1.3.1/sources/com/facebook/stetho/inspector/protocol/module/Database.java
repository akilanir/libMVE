package com.facebook.stetho.inspector.protocol.module;

import android.annotation.TargetApi;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.helper.ChromePeerManager;
import com.facebook.stetho.inspector.helper.PeerRegistrationListener;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcException;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.jsonrpc.protocol.JsonRpcError;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.json.ObjectMapper;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.facebook.stetho.websocket.Frame;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.json.JSONObject;

@TargetApi(DatabaseConstants.MIN_API_LEVEL)
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Database.class */
public class Database implements ChromeDevtoolsDomain {
    private static final int MAX_EXECUTE_RESULTS = 250;
    private static final int MAX_BLOB_LENGTH = 512;
    private static final String UNKNOWN_BLOB_LABEL = "{blob}";
    private List<DatabaseDriver> mDatabaseDrivers = new ArrayList();
    private final ChromePeerManager mChromePeerManager = new ChromePeerManager();
    private final DatabasePeerRegistrationListener mPeerListener = new DatabasePeerRegistrationListener(this.mDatabaseDrivers);
    private final ObjectMapper mObjectMapper;

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Database$AddDatabaseEvent.class */
    public static class AddDatabaseEvent {

        @JsonProperty(required = true)
        public DatabaseObject database;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Database$DatabaseObject.class */
    public static class DatabaseObject {

        @JsonProperty(required = true)
        public String id;

        @JsonProperty(required = true)
        public String domain;

        @JsonProperty(required = true)
        public String name;

        @JsonProperty(required = true)
        public String version;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Database$Error.class */
    public static class Error {

        @JsonProperty(required = true)
        public String message;

        @JsonProperty(required = true)
        public int code;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest.class */
    public static class ExecuteSQLRequest {

        @JsonProperty(required = true)
        public String databaseId;

        @JsonProperty(required = true)
        public String query;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse.class */
    public static class ExecuteSQLResponse implements JsonRpcResult {

        @JsonProperty
        public List<String> columnNames;

        @JsonProperty
        public List<String> values;

        @JsonProperty
        public Error sqlError;
    }

    public Database() {
        this.mChromePeerManager.setListener(this.mPeerListener);
        this.mObjectMapper = new ObjectMapper();
    }

    public void add(DatabaseDriver databaseDriver) {
        this.mDatabaseDrivers.add(databaseDriver);
    }

    @ChromeDevtoolsMethod
    public void enable(JsonRpcPeer peer, JSONObject params) {
        this.mChromePeerManager.addPeer(peer);
    }

    @ChromeDevtoolsMethod
    public void disable(JsonRpcPeer peer, JSONObject params) {
        this.mChromePeerManager.removePeer(peer);
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getDatabaseTableNames(JsonRpcPeer peer, JSONObject params) throws JsonRpcException {
        GetDatabaseTableNamesRequest request = (GetDatabaseTableNamesRequest) this.mObjectMapper.convertValue(params, GetDatabaseTableNamesRequest.class);
        String databaseId = request.databaseId;
        DatabaseDriver databaseDriver = getDatabasePeer(databaseId);
        try {
            GetDatabaseTableNamesResponse response = new GetDatabaseTableNamesResponse();
            response.tableNames = databaseDriver.getTableNames(request.databaseId);
            return response;
        } catch (SQLiteException e) {
            throw new JsonRpcException(new JsonRpcError(JsonRpcError.ErrorCode.INVALID_REQUEST, e.toString(), null));
        }
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult executeSQL(JsonRpcPeer peer, JSONObject params) {
        ExecuteSQLRequest request = (ExecuteSQLRequest) this.mObjectMapper.convertValue(params, ExecuteSQLRequest.class);
        String databaseId = request.databaseId;
        String str = request.query;
        DatabaseDriver databaseDriver = getDatabasePeer(databaseId);
        try {
            return databaseDriver.executeSQL(request.databaseId, request.query, new DatabaseDriver.ExecuteResultHandler<ExecuteSQLResponse>() { // from class: com.facebook.stetho.inspector.protocol.module.Database.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.facebook.stetho.inspector.protocol.module.Database.DatabaseDriver.ExecuteResultHandler
                public ExecuteSQLResponse handleRawQuery() throws SQLiteException {
                    ExecuteSQLResponse response = new ExecuteSQLResponse();
                    response.columnNames = Collections.singletonList("success");
                    response.values = Collections.singletonList("true");
                    return response;
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.facebook.stetho.inspector.protocol.module.Database.DatabaseDriver.ExecuteResultHandler
                public ExecuteSQLResponse handleSelect(Cursor result) throws SQLiteException {
                    ExecuteSQLResponse response = new ExecuteSQLResponse();
                    response.columnNames = Arrays.asList(result.getColumnNames());
                    response.values = Database.flattenRows(result, Database.MAX_EXECUTE_RESULTS);
                    return response;
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.facebook.stetho.inspector.protocol.module.Database.DatabaseDriver.ExecuteResultHandler
                public ExecuteSQLResponse handleInsert(long insertedId) throws SQLiteException {
                    ExecuteSQLResponse response = new ExecuteSQLResponse();
                    response.columnNames = Collections.singletonList("ID of last inserted row");
                    response.values = Collections.singletonList(String.valueOf(insertedId));
                    return response;
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.facebook.stetho.inspector.protocol.module.Database.DatabaseDriver.ExecuteResultHandler
                public ExecuteSQLResponse handleUpdateDelete(int count) throws SQLiteException {
                    ExecuteSQLResponse response = new ExecuteSQLResponse();
                    response.columnNames = Collections.singletonList("Modified rows");
                    response.values = Collections.singletonList(String.valueOf(count));
                    return response;
                }
            });
        } catch (SQLiteException e) {
            Error error = new Error();
            error.code = 0;
            error.message = e.getMessage();
            ExecuteSQLResponse response = new ExecuteSQLResponse();
            response.sqlError = error;
            return response;
        }
    }

    private DatabaseDriver getDatabasePeer(String databaseId) {
        for (DatabaseDriver databaseDriver : this.mDatabaseDrivers) {
            List<String> databaseNames = databaseDriver.getDatabaseNames();
            if (databaseNames != null && databaseNames.contains(databaseId)) {
                return databaseDriver;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static ArrayList<String> flattenRows(Cursor cursor, int limit) {
        Util.throwIfNot(limit >= 0);
        ArrayList<String> flatList = new ArrayList<>();
        int numColumns = cursor.getColumnCount();
        for (int row = 0; row < limit && cursor.moveToNext(); row++) {
            for (int column = 0; column < numColumns; column++) {
                switch (cursor.getType(column)) {
                    case 0:
                        flatList.add(null);
                        break;
                    case 1:
                        flatList.add(String.valueOf(cursor.getLong(column)));
                        break;
                    case Frame.OPCODE_BINARY_FRAME /* 2 */:
                        flatList.add(String.valueOf(cursor.getDouble(column)));
                        break;
                    case 3:
                    default:
                        flatList.add(cursor.getString(column));
                        break;
                    case 4:
                        flatList.add(blobToString(cursor.getBlob(column)));
                        break;
                }
            }
        }
        if (!cursor.isAfterLast()) {
            for (int column2 = 0; column2 < numColumns; column2++) {
                flatList.add("{truncated}");
            }
        }
        return flatList;
    }

    private static String blobToString(byte[] blob) {
        if (blob.length <= MAX_BLOB_LENGTH && fastIsAscii(blob)) {
            try {
                return new String(blob, "US-ASCII");
            } catch (UnsupportedEncodingException e) {
                return UNKNOWN_BLOB_LABEL;
            }
        }
        return UNKNOWN_BLOB_LABEL;
    }

    private static boolean fastIsAscii(byte[] blob) {
        for (byte b : blob) {
            if ((b & Byte.MIN_VALUE) != 0) {
                return false;
            }
        }
        return true;
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener.class */
    private static class DatabasePeerRegistrationListener implements PeerRegistrationListener {
        private final List<DatabaseDriver> mDatabaseDrivers;

        private DatabasePeerRegistrationListener(List<DatabaseDriver> databaseDrivers) {
            this.mDatabaseDrivers = databaseDrivers;
        }

        @Override // com.facebook.stetho.inspector.helper.PeerRegistrationListener
        public void onPeerRegistered(JsonRpcPeer peer) {
            for (DatabaseDriver databaseDriver : this.mDatabaseDrivers) {
                databaseDriver.onRegistered(peer);
            }
        }

        @Override // com.facebook.stetho.inspector.helper.PeerRegistrationListener
        public void onPeerUnregistered(JsonRpcPeer peer) {
            for (DatabaseDriver databaseDriver : this.mDatabaseDrivers) {
                databaseDriver.onUnregistered(peer);
            }
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest.class */
    private static class GetDatabaseTableNamesRequest {

        @JsonProperty(required = true)
        public String databaseId;

        private GetDatabaseTableNamesRequest() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse.class */
    private static class GetDatabaseTableNamesResponse implements JsonRpcResult {

        @JsonProperty(required = true)
        public List<String> tableNames;

        private GetDatabaseTableNamesResponse() {
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver.class */
    public static abstract class DatabaseDriver {
        protected Context mContext;

        /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler.class */
        public interface ExecuteResultHandler<T> {
            T handleRawQuery() throws SQLiteException;

            T handleSelect(Cursor cursor) throws SQLiteException;

            T handleInsert(long j) throws SQLiteException;

            T handleUpdateDelete(int i) throws SQLiteException;
        }

        public abstract List<String> getDatabaseNames();

        public abstract List<String> getTableNames(String str);

        public abstract ExecuteSQLResponse executeSQL(String str, String str2, ExecuteResultHandler<ExecuteSQLResponse> executeResultHandler) throws SQLiteException;

        public DatabaseDriver(Context context) {
            this.mContext = context;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final void onRegistered(JsonRpcPeer peer) {
            List<String> databaseNames = getDatabaseNames();
            for (String database : databaseNames) {
                DatabaseObject databaseParams = new DatabaseObject();
                databaseParams.id = database;
                databaseParams.name = database;
                databaseParams.domain = this.mContext.getPackageName();
                databaseParams.version = "N/A";
                AddDatabaseEvent eventParams = new AddDatabaseEvent();
                eventParams.database = databaseParams;
                peer.invokeMethod("Database.addDatabase", eventParams, null);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final void onUnregistered(JsonRpcPeer peer) {
        }
    }
}
