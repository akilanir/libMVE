package org.dmfs.provider.tasks;

import android.content.ContentProvider;
import android.content.ContentProviderOperation;
import android.content.ContentProviderResult;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.OperationApplicationException;
import android.database.ContentObserver;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/SQLiteContentProvider.class */
abstract class SQLiteContentProvider extends ContentProvider {
    private static final String TAG = "SQLiteContentProvider";
    private SQLiteOpenHelper mOpenHelper;
    private Set<Uri> mChangedUris;
    private final ThreadLocal<Boolean> mApplyingBatch = new ThreadLocal<>();
    private static final int SLEEP_AFTER_YIELD_DELAY = 4000;
    private static final int MAX_OPERATIONS_PER_YIELD_POINT = 500;

    SQLiteContentProvider() {
    }

    @Override // android.content.ContentProvider
    public boolean onCreate() {
        this.mOpenHelper = getDatabaseHelper(getContext());
        this.mChangedUris = new HashSet();
        return true;
    }

    protected abstract SQLiteOpenHelper getDatabaseHelper(Context context);

    public abstract Uri insertInTransaction(SQLiteDatabase sQLiteDatabase, Uri uri, ContentValues contentValues, boolean z);

    public abstract int updateInTransaction(SQLiteDatabase sQLiteDatabase, Uri uri, ContentValues contentValues, String str, String[] strArr, boolean z);

    public abstract int deleteInTransaction(SQLiteDatabase sQLiteDatabase, Uri uri, String str, String[] strArr, boolean z);

    protected void postNotifyUri(Uri uri) {
        synchronized (this.mChangedUris) {
            this.mChangedUris.add(uri);
        }
    }

    public boolean isCallerSyncAdapter(Uri uri) {
        return false;
    }

    public SQLiteOpenHelper getDatabaseHelper() {
        return this.mOpenHelper;
    }

    private boolean applyingBatch() {
        return this.mApplyingBatch.get() != null && this.mApplyingBatch.get().booleanValue();
    }

    @Override // android.content.ContentProvider
    public Uri insert(Uri uri, ContentValues contentValues) {
        Uri insertInTransaction;
        boolean isCallerSyncAdapter = isCallerSyncAdapter(uri);
        boolean applyingBatch = applyingBatch();
        SQLiteDatabase writableDatabase = this.mOpenHelper.getWritableDatabase();
        if (applyingBatch) {
            insertInTransaction = insertInTransaction(writableDatabase, uri, contentValues, isCallerSyncAdapter);
        } else {
            writableDatabase.beginTransaction();
            try {
                insertInTransaction = insertInTransaction(writableDatabase, uri, contentValues, isCallerSyncAdapter);
                writableDatabase.setTransactionSuccessful();
                writableDatabase.endTransaction();
                onEndTransaction(isCallerSyncAdapter);
            } catch (Throwable th) {
                writableDatabase.endTransaction();
                throw th;
            }
        }
        return insertInTransaction;
    }

    @Override // android.content.ContentProvider
    public int bulkInsert(Uri uri, ContentValues[] contentValuesArr) {
        int length = contentValuesArr.length;
        boolean isCallerSyncAdapter = isCallerSyncAdapter(uri);
        SQLiteDatabase writableDatabase = this.mOpenHelper.getWritableDatabase();
        writableDatabase.beginTransaction();
        for (ContentValues contentValues : contentValuesArr) {
            try {
                insertInTransaction(writableDatabase, uri, contentValues, isCallerSyncAdapter);
                writableDatabase.yieldIfContendedSafely();
            } catch (Throwable th) {
                writableDatabase.endTransaction();
                throw th;
            }
        }
        writableDatabase.setTransactionSuccessful();
        writableDatabase.endTransaction();
        onEndTransaction(isCallerSyncAdapter);
        return length;
    }

    @Override // android.content.ContentProvider
    public int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        int updateInTransaction;
        boolean isCallerSyncAdapter = isCallerSyncAdapter(uri);
        boolean applyingBatch = applyingBatch();
        SQLiteDatabase writableDatabase = this.mOpenHelper.getWritableDatabase();
        if (applyingBatch) {
            updateInTransaction = updateInTransaction(writableDatabase, uri, contentValues, str, strArr, isCallerSyncAdapter);
        } else {
            writableDatabase.beginTransaction();
            try {
                updateInTransaction = updateInTransaction(writableDatabase, uri, contentValues, str, strArr, isCallerSyncAdapter);
                writableDatabase.setTransactionSuccessful();
                writableDatabase.endTransaction();
                onEndTransaction(isCallerSyncAdapter);
            } catch (Throwable th) {
                writableDatabase.endTransaction();
                throw th;
            }
        }
        return updateInTransaction;
    }

    @Override // android.content.ContentProvider
    public int delete(Uri uri, String str, String[] strArr) {
        int deleteInTransaction;
        boolean isCallerSyncAdapter = isCallerSyncAdapter(uri);
        boolean applyingBatch = applyingBatch();
        SQLiteDatabase writableDatabase = this.mOpenHelper.getWritableDatabase();
        if (applyingBatch) {
            deleteInTransaction = deleteInTransaction(writableDatabase, uri, str, strArr, isCallerSyncAdapter);
        } else {
            writableDatabase.beginTransaction();
            try {
                deleteInTransaction = deleteInTransaction(writableDatabase, uri, str, strArr, isCallerSyncAdapter);
                writableDatabase.setTransactionSuccessful();
                writableDatabase.endTransaction();
                onEndTransaction(isCallerSyncAdapter);
            } catch (Throwable th) {
                writableDatabase.endTransaction();
                throw th;
            }
        }
        return deleteInTransaction;
    }

    @Override // android.content.ContentProvider
    public ContentProviderResult[] applyBatch(ArrayList<ContentProviderOperation> arrayList) throws OperationApplicationException {
        int i = 0;
        int i2 = 0;
        boolean z = false;
        SQLiteDatabase writableDatabase = this.mOpenHelper.getWritableDatabase();
        writableDatabase.beginTransaction();
        try {
            this.mApplyingBatch.set(true);
            int size = arrayList.size();
            ContentProviderResult[] contentProviderResultArr = new ContentProviderResult[size];
            for (int i3 = 0; i3 < size; i3++) {
                i2++;
                if (i2 >= MAX_OPERATIONS_PER_YIELD_POINT) {
                    throw new OperationApplicationException("Too many content provider operations between yield points. The maximum number of operations per yield point is 500", i);
                }
                ContentProviderOperation contentProviderOperation = arrayList.get(i3);
                if (!z && isCallerSyncAdapter(contentProviderOperation.getUri())) {
                    z = true;
                }
                if (i3 > 0 && contentProviderOperation.isYieldAllowed()) {
                    i2 = 0;
                    if (writableDatabase.yieldIfContendedSafely(4000L)) {
                        i++;
                    }
                }
                contentProviderResultArr[i3] = contentProviderOperation.apply(this, contentProviderResultArr, i3);
            }
            writableDatabase.setTransactionSuccessful();
            this.mApplyingBatch.set(false);
            writableDatabase.endTransaction();
            onEndTransaction(z);
            return contentProviderResultArr;
        } catch (Throwable th) {
            this.mApplyingBatch.set(false);
            writableDatabase.endTransaction();
            onEndTransaction(false);
            throw th;
        }
    }

    protected void onEndTransaction(boolean z) {
        HashSet<Uri> hashSet;
        synchronized (this.mChangedUris) {
            hashSet = new HashSet(this.mChangedUris);
            this.mChangedUris.clear();
        }
        ContentResolver contentResolver = getContext().getContentResolver();
        for (Uri uri : hashSet) {
            contentResolver.notifyChange(uri, (ContentObserver) null, !z && syncToNetwork(uri));
        }
    }

    protected boolean syncToNetwork(Uri uri) {
        return false;
    }
}
