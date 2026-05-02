package org.dmfs.provider.tasks;

import android.accounts.Account;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.TaskDatabaseHelper;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/Utils.class */
public class Utils {
    public static void sendActionProviderChangedBroadCast(Context context, String str) {
        context.sendBroadcast(new Intent("android.intent.action.PROVIDER_CHANGED", TaskContract.getContentUri(str)));
    }

    /* JADX WARN: Finally extract failed */
    public static void cleanUpLists(Context context, SQLiteDatabase sQLiteDatabase, Account[] accountArr, String str) {
        List asList = Arrays.asList(accountArr);
        sQLiteDatabase.beginTransaction();
        try {
            Cursor query = sQLiteDatabase.query(TaskDatabaseHelper.Tables.LISTS, new String[]{"_id", "account_name", "account_type"}, null, null, null, null, null);
            ArrayList<Long> arrayList = new ArrayList();
            while (query.moveToNext()) {
                try {
                    String string = query.getString(2);
                    if (!TaskContract.LOCAL_ACCOUNT_TYPE.equals(string)) {
                        Account account = new Account(query.getString(1), string);
                        if (!asList.contains(account)) {
                            arrayList.add(Long.valueOf(query.getLong(0)));
                            sQLiteDatabase.delete(TaskDatabaseHelper.Tables.SYNCSTATE, "account_name=? and account_type=?", new String[]{account.name, account.type});
                        }
                    }
                } catch (Throwable th) {
                    query.close();
                    throw th;
                }
            }
            query.close();
            if (arrayList.size() == 0) {
                return;
            }
            for (Long l : arrayList) {
                if (l != null) {
                    sQLiteDatabase.delete(TaskDatabaseHelper.Tables.LISTS, "_id=" + l, null);
                }
            }
            sQLiteDatabase.setTransactionSuccessful();
            sQLiteDatabase.endTransaction();
            ContentResolver contentResolver = context.getContentResolver();
            contentResolver.notifyChange(TaskContract.TaskLists.getContentUri(str), null);
            contentResolver.notifyChange(TaskContract.Tasks.getContentUri(str), null);
            contentResolver.notifyChange(TaskContract.Instances.getContentUri(str), null);
            sendActionProviderChangedBroadCast(context, str);
        } finally {
            sQLiteDatabase.endTransaction();
        }
    }
}
