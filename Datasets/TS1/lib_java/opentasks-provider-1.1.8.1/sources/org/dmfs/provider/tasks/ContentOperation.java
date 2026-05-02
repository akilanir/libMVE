package org.dmfs.provider.tasks;

import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.util.Log;
import java.util.TimeZone;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.CursorContentValuesTaskAdapter;
import org.dmfs.provider.tasks.model.TaskAdapter;
import org.dmfs.provider.tasks.processors.tasks.TaskInstancesProcessor;
import org.dmfs.rfc5545.DateTime;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/ContentOperation.class */
public enum ContentOperation {
    UPDATE_TIMEZONE(new OperationHandler() { // from class: org.dmfs.provider.tasks.ContentOperation.1
        @Override // org.dmfs.provider.tasks.ContentOperation.OperationHandler
        public void handleOperation(Context context, Uri uri, SQLiteDatabase sQLiteDatabase, ContentValues contentValues) {
            long currentTimeMillis = System.currentTimeMillis();
            ContentValues contentValues2 = new ContentValues(1);
            TaskInstancesProcessor.addUpdateRequest(contentValues2);
            Log.i("TaskProvider", "time to update " + context.getContentResolver().update(TaskContract.Tasks.getContentUri(uri.getAuthority()).buildUpon().appendQueryParameter(TaskContract.CALLER_IS_SYNCADAPTER, "true").build(), contentValues2, null, null) + " tasks: " + (System.currentTimeMillis() - currentTimeMillis) + " ms");
            ContentOperation.UPDATE_NOTIFICATION_ALARM.fire(context, null);
        }
    }),
    POST_NOTIFICATIONS(new OperationHandler() { // from class: org.dmfs.provider.tasks.ContentOperation.2
        @Override // org.dmfs.provider.tasks.ContentOperation.OperationHandler
        public void handleOperation(Context context, Uri uri, SQLiteDatabase sQLiteDatabase, ContentValues contentValues) {
            TimeZone timeZone = TimeZone.getDefault();
            DateTime lastAlarmTimestamp = getLastAlarmTimestamp(context);
            DateTime nowAndHere = DateTime.nowAndHere();
            String l = Long.toString(lastAlarmTimestamp.getInstance());
            String l2 = Long.toString(nowAndHere.getInstance());
            Cursor query = sQLiteDatabase.query(TaskDatabaseHelper.Tables.INSTANCE_VIEW, null, "((instance_due_sorting>? and instance_due_sorting<=?) or (instance_start_sorting>? and instance_start_sorting<=?)) and is_closed = 0 and _deleted=0", new String[]{l, l2, l, l2}, null, null, null);
            while (query.moveToNext()) {
                try {
                    CursorContentValuesTaskAdapter cursorContentValuesTaskAdapter = new CursorContentValuesTaskAdapter(TaskAdapter.INSTANCE_TASK_ID.getFrom(query).longValue(), query, null);
                    DateTime dateTime = (DateTime) cursorContentValuesTaskAdapter.valueOf(TaskAdapter.INSTANCE_DUE);
                    if (dateTime != null && !dateTime.isFloating()) {
                        dateTime = dateTime.shiftTimeZone(timeZone);
                    }
                    DateTime dateTime2 = (DateTime) cursorContentValuesTaskAdapter.valueOf(TaskAdapter.INSTANCE_START);
                    if (dateTime2 != null && !dateTime2.isFloating()) {
                        dateTime2 = dateTime2.shiftTimeZone(timeZone);
                    }
                    if (dateTime != null && lastAlarmTimestamp.getInstance() < dateTime.getInstance() && dateTime.getInstance() <= nowAndHere.getInstance()) {
                        sendBroadcast(context, TaskContract.ACTION_BROADCAST_TASK_DUE, cursorContentValuesTaskAdapter.uri(uri.getAuthority()), dateTime, (String) cursorContentValuesTaskAdapter.valueOf(TaskAdapter.TITLE));
                    } else if (dateTime2 != null && lastAlarmTimestamp.getInstance() < dateTime2.getInstance() && dateTime2.getInstance() <= nowAndHere.getInstance()) {
                        sendBroadcast(context, TaskContract.ACTION_BROADCAST_TASK_STARTING, cursorContentValuesTaskAdapter.uri(uri.getAuthority()), dateTime2, (String) cursorContentValuesTaskAdapter.valueOf(TaskAdapter.TITLE));
                    }
                } finally {
                    query.close();
                }
            }
            saveLastAlarmTime(context, nowAndHere);
            ContentOperation.UPDATE_NOTIFICATION_ALARM.fire(context, null);
        }

        @SuppressLint({"NewApi"})
        private void saveLastAlarmTime(Context context, DateTime dateTime) {
            SharedPreferences.Editor edit = context.getSharedPreferences(ContentOperation.PREFS_NAME, 0).edit();
            edit.putLong(ContentOperation.PREFS_KEY_LAST_ALARM_TIMESTAMP, dateTime.getTimestamp());
            if (Build.VERSION.SDK_INT >= 9) {
                edit.apply();
            } else {
                edit.commit();
            }
        }

        private DateTime getLastAlarmTimestamp(Context context) {
            return new DateTime(TimeZone.getDefault(), context.getSharedPreferences(ContentOperation.PREFS_NAME, 0).getLong(ContentOperation.PREFS_KEY_LAST_ALARM_TIMESTAMP, System.currentTimeMillis()));
        }

        private void sendBroadcast(Context context, String str, Uri uri, DateTime dateTime, String str2) {
            Intent intent = new Intent(str);
            intent.setData(uri);
            intent.putExtra(TaskContract.EXTRA_TASK_TIMESTAMP, dateTime.getTimestamp());
            intent.putExtra(TaskContract.EXTRA_TASK_ALLDAY, dateTime.isAllDay());
            if (!dateTime.isFloating()) {
                intent.putExtra(TaskContract.EXTRA_TASK_TIMEZONE, dateTime.getTimeZone().getID());
            }
            intent.putExtra(TaskContract.EXTRA_TASK_TITLE, str2);
            context.sendBroadcast(intent);
        }
    }),
    UPDATE_NOTIFICATION_ALARM(new OperationHandler() { // from class: org.dmfs.provider.tasks.ContentOperation.3
        /* JADX WARN: Removed duplicated region for block: B:27:0x0112  */
        @Override // org.dmfs.provider.tasks.ContentOperation.OperationHandler
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void handleOperation(android.content.Context r11, android.net.Uri r12, android.database.sqlite.SQLiteDatabase r13, android.content.ContentValues r14) {
            /*
                Method dump skipped, instructions count: 322
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: org.dmfs.provider.tasks.ContentOperation.AnonymousClass3.handleOperation(android.content.Context, android.net.Uri, android.database.sqlite.SQLiteDatabase, android.content.ContentValues):void");
        }

        @SuppressLint({"NewApi"})
        private void saveLastAlarmTime(Context context, DateTime dateTime) {
            SharedPreferences.Editor edit = context.getSharedPreferences(ContentOperation.PREFS_NAME, 0).edit();
            edit.putLong(ContentOperation.PREFS_KEY_LAST_ALARM_TIMESTAMP, dateTime.getTimestamp());
            if (Build.VERSION.SDK_INT >= 9) {
                edit.apply();
            } else {
                edit.commit();
            }
        }

        private DateTime getLastAlarmTimestamp(Context context) {
            return new DateTime(TimeZone.getDefault(), context.getSharedPreferences(ContentOperation.PREFS_NAME, 0).getLong(ContentOperation.PREFS_KEY_LAST_ALARM_TIMESTAMP, System.currentTimeMillis()));
        }
    });

    private static final Object mLock = new Object();
    private static final String BASE_PATH = "content_operation";
    private final OperationHandler mHandler;
    private static final String PREFS_NAME = "org.dmfs.provider.tasks";
    private static final String PREFS_KEY_LAST_ALARM_TIMESTAMP = "org.dmfs.provider.tasks.prefs.LAST_ALARM_TIMESTAMP";

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/ContentOperation$OperationHandler.class */
    public interface OperationHandler {
        void handleOperation(Context context, Uri uri, SQLiteDatabase sQLiteDatabase, ContentValues contentValues);
    }

    ContentOperation(OperationHandler operationHandler) {
        this.mHandler = operationHandler;
    }

    public void fire(Context context, ContentValues contentValues) {
        context.getContentResolver().update(uri(TaskContract.taskAuthority(context)), contentValues == null ? new ContentValues() : contentValues, null, null);
    }

    void run(final Context context, Handler handler, final Uri uri, final SQLiteDatabase sQLiteDatabase, final ContentValues contentValues) {
        handler.post(new Runnable() { // from class: org.dmfs.provider.tasks.ContentOperation.4
            @Override // java.lang.Runnable
            public void run() {
                synchronized (ContentOperation.mLock) {
                    ContentOperation.this.mHandler.handleOperation(context, uri, sQLiteDatabase, contentValues);
                }
            }
        });
    }

    private Uri uri(String str) {
        return new Uri.Builder().scheme("content").authority(str).path(BASE_PATH).appendPath(toString()).build();
    }

    public static void register(UriMatcher uriMatcher, String str, int i) {
        for (ContentOperation contentOperation : values()) {
            uriMatcher.addURI(str, contentOperation.uri(str).getPath().substring(1), i + contentOperation.ordinal());
        }
    }

    public static ContentOperation get(int i, int i2) {
        if (i >= i2 && i - i2 < values().length) {
            return values()[i - i2];
        }
        return null;
    }
}
