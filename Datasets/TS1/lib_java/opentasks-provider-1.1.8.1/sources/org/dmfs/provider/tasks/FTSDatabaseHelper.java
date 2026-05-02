package org.dmfs.provider.tasks;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import java.util.HashSet;
import java.util.Set;
import org.dmfs.ngrams.NGramGenerator;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.TaskAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/FTSDatabaseHelper.class */
public class FTSDatabaseHelper {
    private static final float SEARCH_RESULTS_MIN_SCORE = 0.4f;
    private static final NGramGenerator TRIGRAM_GENERATOR = new NGramGenerator(3, 1).setAddSpaceInFront(true);
    private static final NGramGenerator TETRAGRAM_GENERATOR = new NGramGenerator(4, 3).setAddSpaceInFront(true);
    public static final String FTS_CONTENT_TABLE = "FTS_Content";
    public static final String FTS_NGRAM_TABLE = "FTS_Ngram";
    public static final String FTS_TASK_VIEW = "FTS_Task_View";
    public static final String FTS_TASK_PROPERTY_VIEW = "FTS_Task_Property_View";
    private static final String SQL_CREATE_SEARCH_CONTENT_TABLE = "CREATE TABLE FTS_Content( fts_task_id Integer, fts_ngram_id Integer, fts_property_id Integer, fts_type Integer, FOREIGN KEY(fts_task_id) REFERENCES Tasks(_id),FOREIGN KEY(fts_task_id) REFERENCES Tasks(_id) UNIQUE (fts_task_id, fts_type, fts_property_id) ON CONFLICT IGNORE )";
    private static final String SQL_CREATE_NGRAM_TABLE = "CREATE TABLE FTS_Ngram( ngram_id Integer PRIMARY KEY AUTOINCREMENT, ngram_text Text)";
    private static final String SQL_RAW_QUERY_SEARCH_TASK = "SELECT %s , min(1.0*count(*)/?, 1.0) as score from FTS_Ngram join FTS_Content on (FTS_Ngram.ngram_id=FTS_Content.fts_ngram_id) join Instance_View on (Instance_View._id = FTS_Content.fts_task_id) where %s group by _id having score >= 0.4 order by %s;";
    private static final String SQL_RAW_QUERY_SEARCH_TASK_DEFAULT_PROJECTION = "Instance_View.* ,FTS_Ngram.ngram_text";
    private static final String SQL_CREATE_SEARCH_TASK_DELETE_TRIGGER = "CREATE TRIGGER search_task_delete_trigger AFTER DELETE ON Tasks BEGIN  DELETE FROM FTS_Content WHERE fts_task_id =  old._id; END";
    private static final String SQL_CREATE_SEARCH_TASK_DELETE_PROPERTY_TRIGGER = "CREATE TRIGGER search_task_delete_property_trigger AFTER DELETE ON Properties BEGIN  DELETE FROM FTS_Content WHERE fts_task_id =  old.task_id AND fts_property_id = old.property_id; END";

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/FTSDatabaseHelper$FTSContentColumns.class */
    public interface FTSContentColumns {
        public static final String TASK_ID = "fts_task_id";
        public static final String PROPERTY_ID = "fts_property_id";
        public static final String TYPE = "fts_type";
        public static final String NGRAM_ID = "fts_ngram_id";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/FTSDatabaseHelper$NGramColumns.class */
    public interface NGramColumns {
        public static final String NGRAM_ID = "ngram_id";
        public static final String TEXT = "ngram_text";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/FTSDatabaseHelper$SearchableTypes.class */
    public interface SearchableTypes {
        public static final int TITLE = 1;
        public static final int DESCRIPTION = 2;
        public static final int LOCATION = 3;
        public static final int PROPERTY = 4;
    }

    public static void onCreate(SQLiteDatabase sQLiteDatabase) {
        initializeFTS(sQLiteDatabase);
    }

    public static void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        if (i < 8) {
            initializeFTS(sQLiteDatabase);
            initializeFTSContent(sQLiteDatabase);
        }
        if (i < 16) {
            sQLiteDatabase.execSQL(TaskDatabaseHelper.createIndexString(FTS_CONTENT_TABLE, true, FTSContentColumns.TYPE, FTSContentColumns.TASK_ID, FTSContentColumns.PROPERTY_ID));
        }
    }

    private static void initializeFTS(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL(SQL_CREATE_SEARCH_CONTENT_TABLE);
        sQLiteDatabase.execSQL(SQL_CREATE_NGRAM_TABLE);
        sQLiteDatabase.execSQL(SQL_CREATE_SEARCH_TASK_DELETE_TRIGGER);
        sQLiteDatabase.execSQL(SQL_CREATE_SEARCH_TASK_DELETE_PROPERTY_TRIGGER);
        sQLiteDatabase.execSQL(TaskDatabaseHelper.createIndexString(FTS_NGRAM_TABLE, true, NGramColumns.TEXT));
        sQLiteDatabase.execSQL(TaskDatabaseHelper.createIndexString(FTS_CONTENT_TABLE, false, FTSContentColumns.NGRAM_ID));
        sQLiteDatabase.execSQL(TaskDatabaseHelper.createIndexString(FTS_CONTENT_TABLE, false, FTSContentColumns.TASK_ID));
        sQLiteDatabase.execSQL(TaskDatabaseHelper.createIndexString(FTS_CONTENT_TABLE, true, FTSContentColumns.PROPERTY_ID, FTSContentColumns.TASK_ID, FTSContentColumns.NGRAM_ID));
        sQLiteDatabase.execSQL(TaskDatabaseHelper.createIndexString(FTS_CONTENT_TABLE, true, FTSContentColumns.TYPE, FTSContentColumns.TASK_ID, FTSContentColumns.PROPERTY_ID));
    }

    private static void initializeFTSContent(SQLiteDatabase sQLiteDatabase) {
        Cursor query = sQLiteDatabase.query(TaskDatabaseHelper.Tables.TASKS_PROPERTY_VIEW, new String[]{"_id", TaskContract.TaskColumns.TITLE, TaskContract.TaskColumns.DESCRIPTION, TaskContract.TaskColumns.LOCATION}, null, null, null, null, null);
        while (query.moveToNext()) {
            insertTaskFTSEntries(sQLiteDatabase, query.getLong(0), query.getString(1), query.getString(2), query.getString(3));
        }
        query.close();
    }

    private static void insertTaskFTSEntries(SQLiteDatabase sQLiteDatabase, long j, String str, String str2, String str3) {
        if (str != null && str.length() > 0) {
            updateEntry(sQLiteDatabase, j, -1L, 1, str);
        }
        if (str3 != null && str3.length() > 0) {
            updateEntry(sQLiteDatabase, j, -1L, 3, str3);
        }
        if (str2 == null || str2.length() <= 0) {
            return;
        }
        updateEntry(sQLiteDatabase, j, -1L, 2, str2);
    }

    public static void updateTaskFTSEntries(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter) {
        if (taskAdapter.isUpdated(TaskAdapter.TITLE)) {
            updateEntry(sQLiteDatabase, taskAdapter.id(), -1L, 1, (String) taskAdapter.valueOf(TaskAdapter.TITLE));
        }
        if (taskAdapter.isUpdated(TaskAdapter.LOCATION)) {
            updateEntry(sQLiteDatabase, taskAdapter.id(), -1L, 3, (String) taskAdapter.valueOf(TaskAdapter.LOCATION));
        }
        if (taskAdapter.isUpdated(TaskAdapter.DESCRIPTION)) {
            updateEntry(sQLiteDatabase, taskAdapter.id(), -1L, 2, (String) taskAdapter.valueOf(TaskAdapter.DESCRIPTION));
        }
    }

    public static void updatePropertyFTSEntry(SQLiteDatabase sQLiteDatabase, long j, long j2, String str) {
        updateEntry(sQLiteDatabase, j, j2, 4, str);
    }

    private static Set<Long> insertNGrams(SQLiteDatabase sQLiteDatabase, Set<String> set) {
        HashSet hashSet = new HashSet(set.size());
        ContentValues contentValues = new ContentValues(1);
        for (String str : set) {
            contentValues.put(NGramColumns.TEXT, str);
            long insertWithOnConflict = sQLiteDatabase.insertWithOnConflict(FTS_NGRAM_TABLE, null, contentValues, 4);
            if (insertWithOnConflict == -1) {
                Cursor query = sQLiteDatabase.query(FTS_NGRAM_TABLE, new String[]{NGramColumns.NGRAM_ID}, "ngram_text=?", new String[]{str}, null, null, null);
                try {
                    if (query.moveToFirst()) {
                        insertWithOnConflict = query.getLong(0);
                    }
                } finally {
                    query.close();
                }
            }
            hashSet.add(Long.valueOf(insertWithOnConflict));
        }
        return hashSet;
    }

    private static void updateEntry(SQLiteDatabase sQLiteDatabase, long j, long j2, int i, String str) {
        deleteNGramRelations(sQLiteDatabase, j, j2, i);
        if (str == null || str.length() <= 0) {
            return;
        }
        Set<String> ngrams = TRIGRAM_GENERATOR.getNgrams(str);
        TETRAGRAM_GENERATOR.getNgrams(ngrams, str);
        insertNGramRelations(sQLiteDatabase, insertNGrams(sQLiteDatabase, ngrams), j, Long.valueOf(j2), i);
    }

    private static void insertNGramRelations(SQLiteDatabase sQLiteDatabase, Set<Long> set, long j, Long l, int i) {
        ContentValues contentValues = new ContentValues(4);
        for (Long l2 : set) {
            contentValues.put(FTSContentColumns.TASK_ID, Long.valueOf(j));
            contentValues.put(FTSContentColumns.NGRAM_ID, l2);
            contentValues.put(FTSContentColumns.TYPE, Integer.valueOf(i));
            if (i == 4) {
                contentValues.put(FTSContentColumns.PROPERTY_ID, l);
            } else {
                contentValues.putNull(FTSContentColumns.PROPERTY_ID);
            }
            sQLiteDatabase.insertWithOnConflict(FTS_CONTENT_TABLE, null, contentValues, 4);
        }
    }

    private static int deleteNGramRelations(SQLiteDatabase sQLiteDatabase, long j, long j2, int i) {
        StringBuilder append = new StringBuilder(FTSContentColumns.TASK_ID).append(" = ").append(j);
        append.append(" AND ").append(FTSContentColumns.TYPE).append(" = ").append(i);
        if (i == 4) {
            append.append(" AND ").append(FTSContentColumns.PROPERTY_ID).append(" = ").append(j2);
        }
        return sQLiteDatabase.delete(FTS_CONTENT_TABLE, append.toString(), null);
    }

    public static Cursor getTaskSearchCursor(SQLiteDatabase sQLiteDatabase, String str, String[] strArr, String str2, String[] strArr2, String str3) {
        String[] strArr3;
        StringBuilder sb = new StringBuilder(1024);
        if (TextUtils.isEmpty(str2)) {
            sb.append(" (");
        } else {
            sb.append(" (");
            sb.append(str2);
            sb.append(") AND (");
        }
        Set<String> ngrams = TRIGRAM_GENERATOR.getNgrams(str);
        TETRAGRAM_GENERATOR.getNgrams(ngrams, str);
        if (str == null || str.length() <= 1) {
            sb.append(NGramColumns.TEXT);
            sb.append(" like ?");
            if (strArr2 == null || strArr2.length <= 0) {
                strArr3 = new String[]{String.valueOf(ngrams.size()), " " + str + "%"};
            } else {
                strArr3 = new String[strArr2.length + 2];
                strArr3[0] = String.valueOf(ngrams.size());
                System.arraycopy(strArr2, 0, strArr3, 1, strArr2.length);
                strArr3[strArr3.length - 1] = " " + str + "%";
            }
        } else {
            sb.append(NGramColumns.TEXT);
            sb.append(" in (");
            int size = ngrams.size();
            for (int i = 0; i < size; i++) {
                if (i > 0) {
                    sb.append(",");
                }
                sb.append("?");
            }
            if (strArr2 == null || strArr2.length <= 0) {
                String[] strArr4 = (String[]) ngrams.toArray(new String[ngrams.size()]);
                strArr3 = new String[strArr4.length + 1];
                strArr3[0] = String.valueOf(ngrams.size());
                System.arraycopy(strArr4, 0, strArr3, 1, strArr4.length);
            } else {
                strArr3 = new String[strArr2.length + ngrams.size() + 1];
                strArr3[0] = String.valueOf(ngrams.size());
                System.arraycopy(strArr2, 0, strArr3, 1, strArr2.length);
                String[] strArr5 = (String[]) ngrams.toArray(new String[ngrams.size()]);
                System.arraycopy(strArr5, 0, strArr3, strArr2.length + 1, strArr5.length);
            }
            sb.append(" ) ");
        }
        sb.append(") AND ");
        sb.append(TaskContract.TaskSyncColumns._DELETED);
        sb.append(" = 0");
        return sQLiteDatabase.rawQueryWithFactory(null, String.format(SQL_RAW_QUERY_SEARCH_TASK, SQL_RAW_QUERY_SEARCH_TASK_DEFAULT_PROJECTION, sb.toString(), str3 == null ? "score desc" : "score desc, " + str3), strArr3, null);
    }
}
