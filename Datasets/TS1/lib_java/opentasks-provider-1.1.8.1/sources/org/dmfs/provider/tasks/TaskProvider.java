package org.dmfs.provider.tasks;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.OnAccountsUpdateListener;
import android.annotation.SuppressLint;
import android.content.ComponentName;
import android.content.ContentProviderResult;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.OperationApplicationException;
import android.content.UriMatcher;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.handler.PropertyHandlerFactory;
import org.dmfs.provider.tasks.model.ContentValuesListAdapter;
import org.dmfs.provider.tasks.model.ContentValuesTaskAdapter;
import org.dmfs.provider.tasks.model.ListAdapter;
import org.dmfs.provider.tasks.model.TaskAdapter;
import org.dmfs.provider.tasks.processors.EntityProcessor;
import org.dmfs.provider.tasks.processors.lists.ListExecutionProcessor;
import org.dmfs.provider.tasks.processors.lists.ListValidatorProcessor;
import org.dmfs.provider.tasks.processors.tasks.AutoUpdateProcessor;
import org.dmfs.provider.tasks.processors.tasks.ChangeListProcessor;
import org.dmfs.provider.tasks.processors.tasks.FtsProcessor;
import org.dmfs.provider.tasks.processors.tasks.RelationProcessor;
import org.dmfs.provider.tasks.processors.tasks.TaskExecutionProcessor;
import org.dmfs.provider.tasks.processors.tasks.TaskInstancesProcessor;
import org.dmfs.provider.tasks.processors.tasks.TaskValidatorProcessor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskProvider.class */
public final class TaskProvider extends SQLiteContentProvider implements OnAccountsUpdateListener, TaskDatabaseHelper.OnDatabaseOperationListener {
    private static final int LISTS = 1;
    private static final int LIST_ID = 2;
    private static final int TASKS = 101;
    private static final int TASK_ID = 102;
    private static final int INSTANCES = 103;
    private static final int INSTANCE_ID = 104;
    private static final int CATEGORIES = 1001;
    private static final int CATEGORY_ID = 1002;
    private static final int PROPERTIES = 1003;
    private static final int PROPERTY_ID = 1004;
    private static final int ALARMS = 1005;
    private static final int ALARM_ID = 1006;
    private static final int SEARCH = 1007;
    private static final int SYNCSTATE = 1008;
    private static final int SYNCSTATE_ID = 1009;
    private static final int OPERATIONS = 100000;
    private static final Set<String> TASK_LIST_SYNC_COLUMNS = new HashSet(Arrays.asList(TaskContract.TaskLists.SYNC_ADAPTER_COLUMNS));
    String mAuthority;
    private UriMatcher mUriMatcher;
    Handler mAsyncHandler;
    private List<EntityProcessor<TaskAdapter>> mTaskProcessors = new ArrayList(16);
    private List<EntityProcessor<ListAdapter>> mListProcessors = new ArrayList(8);
    private ProviderOperationsLog mOperationsLog = new ProviderOperationsLog();

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider, android.content.ContentProvider
    public boolean onCreate() {
        this.mAuthority = getProviderInfo().authority;
        this.mTaskProcessors.add(new TaskValidatorProcessor());
        this.mTaskProcessors.add(new AutoUpdateProcessor());
        this.mTaskProcessors.add(new RelationProcessor());
        this.mTaskProcessors.add(new TaskInstancesProcessor());
        this.mTaskProcessors.add(new FtsProcessor());
        this.mTaskProcessors.add(new ChangeListProcessor());
        this.mTaskProcessors.add(new TaskExecutionProcessor());
        this.mListProcessors.add(new ListValidatorProcessor());
        this.mListProcessors.add(new ListExecutionProcessor());
        this.mUriMatcher = new UriMatcher(-1);
        this.mUriMatcher.addURI(this.mAuthority, "tasklists", 1);
        this.mUriMatcher.addURI(this.mAuthority, "tasklists/#", 2);
        this.mUriMatcher.addURI(this.mAuthority, "tasks", TASKS);
        this.mUriMatcher.addURI(this.mAuthority, "tasks/#", TASK_ID);
        this.mUriMatcher.addURI(this.mAuthority, "instances", INSTANCES);
        this.mUriMatcher.addURI(this.mAuthority, "instances/#", INSTANCE_ID);
        this.mUriMatcher.addURI(this.mAuthority, "properties", PROPERTIES);
        this.mUriMatcher.addURI(this.mAuthority, "properties/#", PROPERTY_ID);
        this.mUriMatcher.addURI(this.mAuthority, "categories", CATEGORIES);
        this.mUriMatcher.addURI(this.mAuthority, "categories/#", CATEGORY_ID);
        this.mUriMatcher.addURI(this.mAuthority, "alarms", ALARMS);
        this.mUriMatcher.addURI(this.mAuthority, "alarms/#", ALARM_ID);
        this.mUriMatcher.addURI(this.mAuthority, "tasks_search", SEARCH);
        this.mUriMatcher.addURI(this.mAuthority, "syncstate", SYNCSTATE);
        this.mUriMatcher.addURI(this.mAuthority, "syncstate/#", SYNCSTATE_ID);
        ContentOperation.register(this.mUriMatcher, this.mAuthority, OPERATIONS);
        boolean onCreate = super.onCreate();
        HandlerThread handlerThread = new HandlerThread("backgroundHandler");
        handlerThread.start();
        this.mAsyncHandler = new Handler(handlerThread.getLooper());
        AccountManager.get(getContext()).addOnAccountsUpdatedListener(this, this.mAsyncHandler, true);
        updateNotifications();
        return onCreate;
    }

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider
    public boolean isCallerSyncAdapter(Uri uri) {
        String queryParameter = uri.getQueryParameter(TaskContract.CALLER_IS_SYNCADAPTER);
        return (queryParameter == null || "false".equals(queryParameter)) ? false : true;
    }

    public boolean shouldLoadProperties(Uri uri) {
        String queryParameter = uri.getQueryParameter(TaskContract.LOAD_PROPERTIES);
        return (queryParameter == null || "false".equals(queryParameter)) ? false : true;
    }

    protected String getAccountName(Uri uri) {
        return uri.getQueryParameter("account_name");
    }

    protected String getAccountType(Uri uri) {
        return uri.getQueryParameter("account_type");
    }

    private long getId(Uri uri) {
        return Long.parseLong(uri.getPathSegments().get(1));
    }

    protected StringBuilder selectAccount(Uri uri) {
        return selectAccount(new StringBuilder(256), uri);
    }

    protected StringBuilder selectAccount(StringBuilder sb, Uri uri) {
        String accountName = getAccountName(uri);
        String accountType = getAccountType(uri);
        if (accountName != null || accountType != null) {
            if (accountName != null) {
                if (sb.length() > 0) {
                    sb.append(" AND ");
                }
                sb.append("account_name");
                sb.append("=");
                DatabaseUtils.appendEscapedSQLString(sb, accountName);
            }
            if (accountType != null) {
                if (sb.length() > 0) {
                    sb.append(" AND ");
                }
                sb.append("account_type");
                sb.append("=");
                DatabaseUtils.appendEscapedSQLString(sb, accountType);
            }
        }
        return sb;
    }

    protected void selectAccount(SQLiteQueryBuilder sQLiteQueryBuilder, Uri uri) {
        String accountName = getAccountName(uri);
        String accountType = getAccountType(uri);
        if (accountName != null) {
            sQLiteQueryBuilder.appendWhere(" AND ");
            sQLiteQueryBuilder.appendWhere("account_name");
            sQLiteQueryBuilder.appendWhere("=");
            sQLiteQueryBuilder.appendWhereEscapeString(accountName);
        }
        if (accountType != null) {
            sQLiteQueryBuilder.appendWhere(" AND ");
            sQLiteQueryBuilder.appendWhere("account_type");
            sQLiteQueryBuilder.appendWhere("=");
            sQLiteQueryBuilder.appendWhereEscapeString(accountType);
        }
    }

    private StringBuilder _selectId(StringBuilder sb, long j, String str) {
        if (sb.length() > 0) {
            sb.append(" AND ");
        }
        sb.append(str);
        sb.append("=");
        sb.append(j);
        return sb;
    }

    protected StringBuilder selectId(Uri uri) {
        return selectId(new StringBuilder(128), uri);
    }

    protected StringBuilder selectId(StringBuilder sb, Uri uri) {
        return _selectId(sb, getId(uri), "_id");
    }

    protected StringBuilder selectTaskId(Uri uri) {
        return selectTaskId(new StringBuilder(128), uri);
    }

    protected StringBuilder selectTaskId(long j) {
        return selectTaskId(new StringBuilder(128), j);
    }

    protected StringBuilder selectTaskId(StringBuilder sb, Uri uri) {
        return selectTaskId(sb, getId(uri));
    }

    protected StringBuilder selectTaskId(StringBuilder sb, long j) {
        return _selectId(sb, j, "task_id");
    }

    protected StringBuilder selectPropertyId(Uri uri) {
        return selectPropertyId(new StringBuilder(128), uri);
    }

    protected StringBuilder selectPropertyId(StringBuilder sb, Uri uri) {
        return selectPropertyId(sb, getId(uri));
    }

    protected StringBuilder selectPropertyId(long j) {
        return selectPropertyId(new StringBuilder(128), j);
    }

    protected StringBuilder selectPropertyId(StringBuilder sb, long j) {
        return _selectId(sb, j, "property_id");
    }

    protected void selectId(SQLiteQueryBuilder sQLiteQueryBuilder, String str, Uri uri) {
        sQLiteQueryBuilder.appendWhere(" AND ");
        sQLiteQueryBuilder.appendWhere(str);
        sQLiteQueryBuilder.appendWhere("=");
        sQLiteQueryBuilder.appendWhere(String.valueOf(getId(uri)));
    }

    protected String updateSelection(StringBuilder sb, String str) {
        if (str != null) {
            if (sb.length() > 0) {
                sb.append("AND ( ").append(str).append(" ) ");
            } else {
                sb.append(" ( ").append(str).append(" ) ");
            }
        }
        return sb.toString();
    }

    @Override // android.content.ContentProvider
    public Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        SQLiteDatabase writableDatabase = getDatabaseHelper().getWritableDatabase();
        SQLiteQueryBuilder sQLiteQueryBuilder = new SQLiteQueryBuilder();
        sQLiteQueryBuilder.appendWhere(" 1=1 ");
        boolean isCallerSyncAdapter = isCallerSyncAdapter(uri);
        switch (this.mUriMatcher.match(uri)) {
            case 1:
                selectAccount(sQLiteQueryBuilder, uri);
                sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.LISTS);
                if (str2 == null || str2.length() == 0) {
                    str2 = TaskContract.TaskLists.DEFAULT_SORT_ORDER;
                    break;
                }
                break;
            case 2:
                selectAccount(sQLiteQueryBuilder, uri);
                sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.LISTS);
                selectId(sQLiteQueryBuilder, "_id", uri);
                if (str2 == null || str2.length() == 0) {
                    str2 = TaskContract.TaskLists.DEFAULT_SORT_ORDER;
                    break;
                }
                break;
            case TASKS /* 101 */:
                if (shouldLoadProperties(uri)) {
                    sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.TASKS_PROPERTY_VIEW);
                } else {
                    sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.TASKS_VIEW);
                }
                if (!isCallerSyncAdapter) {
                    sQLiteQueryBuilder.appendWhere(" AND ");
                    sQLiteQueryBuilder.appendWhere(TaskContract.TaskSyncColumns._DELETED);
                    sQLiteQueryBuilder.appendWhere("=0");
                }
                if (str2 == null || str2.length() == 0) {
                    str2 = "due";
                    break;
                }
                break;
            case TASK_ID /* 102 */:
                if (shouldLoadProperties(uri)) {
                    sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.TASKS_PROPERTY_VIEW);
                } else {
                    sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.TASKS_VIEW);
                }
                selectId(sQLiteQueryBuilder, "_id", uri);
                if (!isCallerSyncAdapter) {
                    sQLiteQueryBuilder.appendWhere(" AND ");
                    sQLiteQueryBuilder.appendWhere(TaskContract.TaskSyncColumns._DELETED);
                    sQLiteQueryBuilder.appendWhere("=0");
                }
                if (str2 == null || str2.length() == 0) {
                    str2 = "due";
                    break;
                }
                break;
            case INSTANCES /* 103 */:
                if (shouldLoadProperties(uri)) {
                    sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.INSTANCE_PROPERTY_VIEW);
                } else {
                    sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.INSTANCE_VIEW);
                }
                if (!isCallerSyncAdapter) {
                    sQLiteQueryBuilder.appendWhere(" AND ");
                    sQLiteQueryBuilder.appendWhere(TaskContract.TaskSyncColumns._DELETED);
                    sQLiteQueryBuilder.appendWhere("=0");
                }
                if (str2 == null || str2.length() == 0) {
                    str2 = "instance_due_sorting";
                    break;
                }
                break;
            case INSTANCE_ID /* 104 */:
                if (shouldLoadProperties(uri)) {
                    sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.INSTANCE_PROPERTY_VIEW);
                } else {
                    sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.INSTANCE_VIEW);
                }
                selectId(sQLiteQueryBuilder, "_id", uri);
                if (!isCallerSyncAdapter) {
                    sQLiteQueryBuilder.appendWhere(" AND ");
                    sQLiteQueryBuilder.appendWhere(TaskContract.TaskSyncColumns._DELETED);
                    sQLiteQueryBuilder.appendWhere("=0");
                }
                if (str2 == null || str2.length() == 0) {
                    str2 = "instance_due_sorting";
                    break;
                }
                break;
            case CATEGORIES /* 1001 */:
                selectAccount(sQLiteQueryBuilder, uri);
                sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.CATEGORIES);
                if (str2 == null || str2.length() == 0) {
                    str2 = "name";
                    break;
                }
                break;
            case CATEGORY_ID /* 1002 */:
                selectAccount(sQLiteQueryBuilder, uri);
                sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.CATEGORIES);
                selectId(sQLiteQueryBuilder, "_id", uri);
                if (str2 == null || str2.length() == 0) {
                    str2 = "name";
                    break;
                }
                break;
            case PROPERTIES /* 1003 */:
                sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.PROPERTIES);
                break;
            case PROPERTY_ID /* 1004 */:
                sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.PROPERTIES);
                selectId(sQLiteQueryBuilder, "property_id", uri);
                break;
            case SEARCH /* 1007 */:
                Cursor taskSearchCursor = FTSDatabaseHelper.getTaskSearchCursor(writableDatabase, Uri.decode(uri.getQueryParameter("q")), strArr, str, strArr2, str2);
                if (taskSearchCursor != null) {
                    taskSearchCursor.setNotificationUri(getContext().getContentResolver(), TaskContract.Tasks.getContentUri(this.mAuthority));
                }
                return taskSearchCursor;
            case SYNCSTATE /* 1008 */:
            case SYNCSTATE_ID /* 1009 */:
                if (!TextUtils.isEmpty(getAccountName(uri)) && !TextUtils.isEmpty(getAccountType(uri))) {
                    selectAccount(sQLiteQueryBuilder, uri);
                    sQLiteQueryBuilder.setTables(TaskDatabaseHelper.Tables.SYNCSTATE);
                    break;
                } else {
                    throw new IllegalArgumentException("uri must contain an account when accessing syncstate");
                }
                break;
            default:
                throw new IllegalArgumentException("Unknown URI " + uri);
        }
        Cursor query = sQLiteQueryBuilder.query(writableDatabase, strArr, str, strArr2, null, null, str2);
        if (query != null) {
            query.setNotificationUri(getContext().getContentResolver(), uri);
        }
        return query;
    }

    /* JADX WARN: Removed duplicated region for block: B:77:0x02e6  */
    @Override // org.dmfs.provider.tasks.SQLiteContentProvider
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int deleteInTransaction(android.database.sqlite.SQLiteDatabase r11, android.net.Uri r12, java.lang.String r13, java.lang.String[] r14, boolean r15) {
        /*
            Method dump skipped, instructions count: 772
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.dmfs.provider.tasks.TaskProvider.deleteInTransaction(android.database.sqlite.SQLiteDatabase, android.net.Uri, java.lang.String, java.lang.String[], boolean):int");
    }

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider
    public Uri insertInTransaction(SQLiteDatabase sQLiteDatabase, Uri uri, ContentValues contentValues, boolean z) {
        long insert;
        Uri contentUri;
        String accountName = getAccountName(uri);
        String accountType = getAccountType(uri);
        switch (this.mUriMatcher.match(uri)) {
            case 1:
                ContentValuesListAdapter contentValuesListAdapter = new ContentValuesListAdapter(contentValues);
                contentValuesListAdapter.set(ListAdapter.ACCOUNT_NAME, accountName);
                contentValuesListAdapter.set(ListAdapter.ACCOUNT_TYPE, accountType);
                ProviderOperation.INSERT.execute(sQLiteDatabase, this.mListProcessors, contentValuesListAdapter, z, this.mOperationsLog, this.mAuthority);
                insert = contentValuesListAdapter.id();
                contentUri = TaskContract.TaskLists.getContentUri(this.mAuthority);
                break;
            case TASKS /* 101 */:
                ContentValuesTaskAdapter contentValuesTaskAdapter = new ContentValuesTaskAdapter(contentValues);
                ProviderOperation.INSERT.execute(sQLiteDatabase, this.mTaskProcessors, contentValuesTaskAdapter, z, this.mOperationsLog, this.mAuthority);
                insert = contentValuesTaskAdapter.id();
                contentUri = TaskContract.Tasks.getContentUri(this.mAuthority);
                postNotifyUri(TaskContract.Instances.getContentUri(this.mAuthority));
                postNotifyUri(TaskContract.Tasks.getContentUri(this.mAuthority));
                break;
            case PROPERTIES /* 1003 */:
                String asString = contentValues.getAsString(TaskContract.PropertyColumns.MIMETYPE);
                if (asString != null) {
                    Long asLong = contentValues.getAsLong("task_id");
                    if (asLong != null) {
                        if (!contentValues.containsKey("property_id")) {
                            insert = PropertyHandlerFactory.get(asString).insert(sQLiteDatabase, asLong.longValue(), contentValues, z);
                            contentUri = TaskContract.Properties.getContentUri(this.mAuthority);
                            if (insert >= 0) {
                                postNotifyUri(TaskContract.Tasks.getContentUri(this.mAuthority));
                                postNotifyUri(TaskContract.Instances.getContentUri(this.mAuthority));
                                break;
                            }
                        } else {
                            throw new IllegalArgumentException("property id can not be written");
                        }
                    } else {
                        throw new IllegalArgumentException("missing task id in property values");
                    }
                } else {
                    throw new IllegalArgumentException("missing mimetype in property values");
                }
                break;
            case SYNCSTATE /* 1008 */:
                if (!z) {
                    throw new IllegalAccessError("only sync adapters may access syncstate");
                }
                if (!TextUtils.isEmpty(accountName) && !TextUtils.isEmpty(accountType)) {
                    contentValues.put("account_name", accountName);
                    contentValues.put("account_type", accountType);
                    insert = sQLiteDatabase.replace(TaskDatabaseHelper.Tables.SYNCSTATE, null, contentValues);
                    contentUri = TaskContract.SyncState.getContentUri(this.mAuthority);
                    break;
                } else {
                    throw new IllegalArgumentException("uri must contain an account when accessing syncstate");
                }
                break;
            default:
                throw new IllegalArgumentException("Unknown URI " + uri);
        }
        if (insert <= 0 || contentUri == null) {
            throw new SQLException("Failed to insert row into " + uri);
        }
        Uri withAppendedId = ContentUris.withAppendedId(contentUri, insert);
        postNotifyUri(withAppendedId);
        postNotifyUri(uri);
        return withAppendedId;
    }

    /* JADX WARN: Removed duplicated region for block: B:91:0x0379  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x03b8  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x03cb  */
    @Override // org.dmfs.provider.tasks.SQLiteContentProvider
    @android.annotation.TargetApi(11)
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int updateInTransaction(android.database.sqlite.SQLiteDatabase r12, android.net.Uri r13, android.content.ContentValues r14, java.lang.String r15, java.lang.String[] r16, boolean r17) {
        /*
            Method dump skipped, instructions count: 979
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.dmfs.provider.tasks.TaskProvider.updateInTransaction(android.database.sqlite.SQLiteDatabase, android.net.Uri, android.content.ContentValues, java.lang.String, java.lang.String[], boolean):int");
    }

    private void updateNotifications() {
        this.mAsyncHandler.post(new Runnable() { // from class: org.dmfs.provider.tasks.TaskProvider.1
            @Override // java.lang.Runnable
            public void run() {
                ContentOperation.UPDATE_NOTIFICATION_ALARM.fire(TaskProvider.this.getContext(), null);
            }
        });
    }

    private void validateCategoryValues(ContentValues contentValues, boolean z, boolean z2) {
        if (contentValues.containsKey("_id")) {
            throw new IllegalArgumentException("_ID can not be set manually");
        }
        if (z != contentValues.containsKey("account_name") && (!z || contentValues.get("account_name") != null)) {
            throw new IllegalArgumentException("ACCOUNT_NAME is write-once and required on INSERT");
        }
        if (z != contentValues.containsKey("account_type")) {
            if (!z || contentValues.get("account_type") != null) {
                throw new IllegalArgumentException("ACCOUNT_TYPE is write-once and required on INSERT");
            }
        }
    }

    private void validateAlarmValues(ContentValues contentValues, boolean z, boolean z2) {
        if (contentValues.containsKey(TaskContract.AlarmsColumns.ALARM_ID)) {
            throw new IllegalArgumentException("ALARM_ID can not be set manually");
        }
    }

    @Override // android.content.ContentProvider
    public String getType(Uri uri) {
        switch (this.mUriMatcher.match(uri)) {
            case 1:
                return "vnd.android.cursor.dir/org.dmfs.tasks.tasklists";
            case 2:
                return "vnd.android.cursor.item/org.dmfs.tasks.tasklists";
            case TASKS /* 101 */:
                return "vnd.android.cursor.dir/org.dmfs.tasks.tasks";
            case TASK_ID /* 102 */:
                return "vnd.android.cursor.item/org.dmfs.tasks.tasks";
            case INSTANCES /* 103 */:
                return "vnd.android.cursor.dir/org.dmfs.tasks.instances";
            default:
                throw new IllegalArgumentException("Unsupported URI: " + uri);
        }
    }

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider
    protected void onEndTransaction(boolean z) {
        super.onEndTransaction(z);
        Intent intent = new Intent("android.intent.action.PROVIDER_CHANGED", TaskContract.getContentUri(this.mAuthority));
        if (!this.mOperationsLog.isEmpty()) {
            updateNotifications();
        }
        intent.putExtras(this.mOperationsLog.toBundle(true));
        getContext().sendBroadcast(intent);
    }

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider
    public SQLiteOpenHelper getDatabaseHelper(Context context) {
        return new TaskDatabaseHelper(context, this);
    }

    @Override // org.dmfs.provider.tasks.TaskDatabaseHelper.OnDatabaseOperationListener
    public void onDatabaseCreated(SQLiteDatabase sQLiteDatabase) {
        Intent intent = new Intent(TaskContract.ACTION_DATABASE_INITIALIZED);
        intent.setDataAndType(TaskContract.getContentUri(this.mAuthority), TaskContract.MIMETYPE_AUTHORITY);
        getContext().sendBroadcast(intent);
    }

    @Override // org.dmfs.provider.tasks.TaskDatabaseHelper.OnDatabaseOperationListener
    public void onDatabaseUpdate(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        if (i < 15) {
            this.mAsyncHandler.post(new Runnable() { // from class: org.dmfs.provider.tasks.TaskProvider.2
                @Override // java.lang.Runnable
                public void run() {
                    ContentOperation.UPDATE_TIMEZONE.fire(TaskProvider.this.getContext(), null);
                }
            });
        }
    }

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider
    protected boolean syncToNetwork(Uri uri) {
        return true;
    }

    @SuppressLint({"NewApi"})
    private ProviderInfo getProviderInfo() {
        Context context = getContext();
        PackageManager packageManager = context.getPackageManager();
        Class<?> cls = getClass();
        if (Build.VERSION.SDK_INT > 8) {
            try {
                return packageManager.getProviderInfo(new ComponentName(context, cls), 136);
            } catch (PackageManager.NameNotFoundException e) {
                throw new RuntimeException("Could not find Provider!", e);
            }
        }
        try {
            for (ProviderInfo providerInfo : packageManager.getPackageInfo(context.getPackageName(), 136).providers) {
                try {
                    if (Class.forName(providerInfo.name).equals(cls)) {
                        return providerInfo;
                    }
                } catch (ClassNotFoundException e2) {
                    throw new RuntimeException("Missing provider class '" + providerInfo.name + "'");
                }
            }
            throw new RuntimeException("Could not find Provider!");
        } catch (PackageManager.NameNotFoundException e3) {
            throw new RuntimeException("Could not find Provider!", e3);
        }
    }

    @Override // android.accounts.OnAccountsUpdateListener
    public void onAccountsUpdated(Account[] accountArr) {
        Utils.cleanUpLists(getContext(), getDatabaseHelper().getWritableDatabase(), accountArr, this.mAuthority);
    }

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider, android.content.ContentProvider
    public /* bridge */ /* synthetic */ ContentProviderResult[] applyBatch(ArrayList arrayList) throws OperationApplicationException {
        return super.applyBatch(arrayList);
    }

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider, android.content.ContentProvider
    public /* bridge */ /* synthetic */ int delete(Uri uri, String str, String[] strArr) {
        return super.delete(uri, str, strArr);
    }

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider, android.content.ContentProvider
    public /* bridge */ /* synthetic */ int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        return super.update(uri, contentValues, str, strArr);
    }

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider, android.content.ContentProvider
    public /* bridge */ /* synthetic */ int bulkInsert(Uri uri, ContentValues[] contentValuesArr) {
        return super.bulkInsert(uri, contentValuesArr);
    }

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider, android.content.ContentProvider
    public /* bridge */ /* synthetic */ Uri insert(Uri uri, ContentValues contentValues) {
        return super.insert(uri, contentValues);
    }

    @Override // org.dmfs.provider.tasks.SQLiteContentProvider
    public /* bridge */ /* synthetic */ SQLiteOpenHelper getDatabaseHelper() {
        return super.getDatabaseHelper();
    }
}
