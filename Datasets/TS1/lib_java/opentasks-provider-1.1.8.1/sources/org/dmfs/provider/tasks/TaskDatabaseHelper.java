package org.dmfs.provider.tasks;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import org.dmfs.provider.tasks.TaskContract;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskDatabaseHelper.class */
public class TaskDatabaseHelper extends SQLiteOpenHelper {
    private static final String TAG = "TaskDatabaseHelper";
    private static final String DATABASE_NAME = "tasks.db";
    static final int DATABASE_VERSION = 16;
    private static final String SQL_CREATE_TASK_VIEW = "create view Task_View as select Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible from Tasks join Lists on (Tasks.list_id=Lists._id);";
    private static final String SQL_CREATE_TASK_PROPERTY_VIEW = "create view Task_Property_View as select Tasks.*, Properties.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible from Tasks join Lists on (Tasks.list_id=Lists._id) left join Properties on (Tasks._id=Properties.task_id);";
    private static final String SQL_DROP_TASK_VIEW = "DROP VIEW Task_View;";
    private static final String SQL_CREATE_INSTANCE_VIEW = "CREATE VIEW Instance_View AS SELECT Instances.*, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id);";
    private static final String SQL_CREATE_INSTANCE_PROPERTY_VIEW = "CREATE VIEW Instance_Property_View AS SELECT Instances.*, Properties.*, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id) LEFT JOIN Properties ON (Tasks._id=Properties.task_id);";
    private static final String SQL_CREATE_INSTANCE_CATEGORY_VIEW = "CREATE VIEW Instance_Cagetory_View AS SELECT Instances.*, Categories_Mapping.category_id, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id) LEFT JOIN Categories_Mapping ON (Categories_Mapping.task_id=Instances.task_id);";
    private static final String SQL_DROP_INSTANCE_VIEW = "DROP VIEW Instance_View;";
    private static final String SQL_CREATE_SYNCSTATE_TABLE = "CREATE TABLE SyncState ( _id INTEGER PRIMARY KEY AUTOINCREMENT, account_name TEXT, account_type TEXT, data TEXT );";
    private static final String SQL_CREATE_INSTANCES_TABLE = "CREATE TABLE Instances ( _id INTEGER PRIMARY KEY AUTOINCREMENT, task_id INTEGER NOT NULL, instance_start INTEGER, instance_due INTEGER, instance_start_sorting INTEGER, instance_due_sorting INTEGER, instance_duration INTEGER);";
    private static final String SQL_CREATE_TASKS_CLEANUP_TRIGGER = "CREATE TRIGGER task_cleanup_trigger AFTER DELETE ON Tasks BEGIN  DELETE FROM Properties WHERE task_id= old._id; DELETE FROM Instances WHERE task_id=old._id; END;";
    private static final String SQL_CREATE_LISTS_CLEANUP_TRIGGER = "CREATE TRIGGER list_cleanup_trigger AFTER DELETE ON Lists BEGIN  DELETE FROM Tasks WHERE list_id= old._id; END;";
    private static final String SQL_DROP_TASKS_CLEANUP_TRIGGER = "DROP TRIGGER task_cleanup_trigger;";
    private static final String SQL_COUNT_ALARMS_ON_DELETE = " BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = 'vnd.android.cursor.item/alarm' AND data3 <> 0 AND task_id = OLD.task_id) WHERE _id = OLD.task_id; END;";
    private static final String SQL_COUNT_ALARMS = " BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = 'vnd.android.cursor.item/alarm' AND data3 <> 0 AND task_id = NEW.task_id) WHERE _id = NEW.task_id; END;";
    private static final String SQL_CREATE_ALARM_COUNT_CREATE_TRIGGER = "CREATE TRIGGER alarm_count_create_trigger AFTER INSERT ON Properties WHEN NEW.mimetype = 'vnd.android.cursor.item/alarm' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = 'vnd.android.cursor.item/alarm' AND data3 <> 0 AND task_id = NEW.task_id) WHERE _id = NEW.task_id; END;";
    private static final String SQL_CREATE_ALARM_COUNT_UPDATE_TRIGGER = "CREATE TRIGGER alarm_count_update_trigger AFTER UPDATE ON Properties WHEN NEW.mimetype = 'vnd.android.cursor.item/alarm' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = 'vnd.android.cursor.item/alarm' AND data3 <> 0 AND task_id = NEW.task_id) WHERE _id = NEW.task_id; END;";
    private static final String SQL_CREATE_ALARM_COUNT_DELETE_TRIGGER = "CREATE TRIGGER alarm_count_delete_trigger AFTER DELETE ON Properties WHEN OLD.mimetype = 'vnd.android.cursor.item/alarm' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = 'vnd.android.cursor.item/alarm' AND data3 <> 0 AND task_id = OLD.task_id) WHERE _id = OLD.task_id; END;";
    private static final String SQL_CREATE_ALARM_PROPERTY_CLEANUP_TRIGGER = "CREATE TRIGGER alarm_property_cleanup_trigger AFTER DELETE ON Properties WHEN OLD.mimetype = 'vnd.android.cursor.item/alarm' BEGIN  DELETE FROM Alarms WHERE alarm_id= OLD.property_id; END;";
    private static final String SQL_CREATE_CATEGORY_PROPERTY_CLEANUP_TRIGGER = "CREATE TRIGGER category_property_cleanup_trigger AFTER DELETE ON Properties WHEN OLD.mimetype = 'vnd.android.cursor.item/category' BEGIN  DELETE FROM Categories_Mapping WHERE property_id= OLD.property_id; END;";
    private static final String SQL_CREATE_TASK_PROPERTY_CLEANUP_TRIGGER = "CREATE TRIGGER task_property_cleanup_trigger AFTER DELETE ON Tasks BEGIN  DELETE FROM Properties WHERE task_id= OLD._id; END;";
    private static final String SQL_CREATE_LISTS_TABLE = "CREATE TABLE Lists ( _id INTEGER PRIMARY KEY AUTOINCREMENT,account_name TEXT,account_type TEXT,list_name TEXT,list_color INTEGER,list_access_level INTEGER,visible INTEGER,sync_enabled INTEGER,list_owner TEXT,_dirty INTEGER DEFAULT 0,_sync_id TEXT,sync_version TEXT,sync1 TEXT,sync2 TEXT,sync3 TEXT,sync4 TEXT,sync5 TEXT,sync6 TEXT,sync7 TEXT,sync8 TEXT);";
    private static final String SQL_CREATE_TASKS_TABLE = "CREATE TABLE Tasks ( _id INTEGER PRIMARY KEY AUTOINCREMENT,list_id INTEGER NOT NULL, title TEXT,location TEXT,geo TEXT,description TEXT,url TEXT,organizer TEXT,priority INTEGER, task_color INTEGER,class INTEGER,completed INTEGER,completed_is_allday INTEGER,percent_complete INTEGER,status INTEGER DEFAULT 0,is_new INTEGER,is_closed INTEGER,dtstart INTEGER,created INTEGER,last_modified INTEGER,is_allday INTEGER,tz TEXT,due INTEGER,duration TEXT,rdate TEXT,exdate TEXT,rrule TEXT,parent_id INTEGER,sorting TEXT,has_alarms INTEGER,has_properties INTEGER,pinned INTEGER,original_instance_sync_id TEXT,original_instance_id INTEGER,original_instance_time INTEGER,original_instance_allday INTEGER,_dirty INTEGER DEFAULT 1,_deleted INTEGER DEFAULT 0,_sync_id TEXT,_uid TEXT,sync_version TEXT,sync1 TEXT,sync2 TEXT,sync3 TEXT,sync4 TEXT,sync5 TEXT,sync6 TEXT,sync7 TEXT,sync8 TEXT);";
    private static final String SQL_CREATE_CATEGORIES_TABLE = "CREATE TABLE Categories ( _id INTEGER PRIMARY KEY AUTOINCREMENT,account_name TEXT,account_type TEXT,name TEXT,color INTEGER);";
    private static final String SQL_CREATE_CATEGORIES_MAPPING_TABLE = "CREATE TABLE Categories_Mapping ( task_id INTEGER,category_id INTEGER,property_id INTEGER,FOREIGN KEY (task_id) REFERENCES Tasks(_id),FOREIGN KEY (property_id) REFERENCES Properties(property_id),FOREIGN KEY (category_id) REFERENCES Categories(_id));";
    private static final String SQL_CREATE_ALARMS_TABLE = "CREATE TABLE Alarms ( alarm_id INTEGER,last_trigger TEXT,next_trigger TEXT);";
    private static final String SQL_CREATE_PROPERTIES_TABLE = "CREATE TABLE Properties ( property_id INTEGER PRIMARY KEY AUTOINCREMENT,task_id INTEGER,mimetype INTEGER,prop_version INTEGER,data0 TEXT,data1 TEXT,data2 TEXT,data3 TEXT,data4 TEXT,data5 TEXT,data6 TEXT,data7 TEXT,data8 TEXT,data9 TEXT,data10 TEXT,data11 TEXT,data12 TEXT,data13 TEXT,data14 TEXT,data15 TEXT,prop_sync1 TEXT,prop_sync2 TEXT,prop_sync3 TEXT,prop_sync4 TEXT,prop_sync5 TEXT,prop_sync6 TEXT,prop_sync7 TEXT,prop_sync8 TEXT);";
    private static final String SQL_DROP_PROPERTIES_TABLE = "DROP TABLE Properties;";
    private final OnDatabaseOperationListener mListener;

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskDatabaseHelper$CategoriesMapping.class */
    public interface CategoriesMapping {
        public static final String TASK_ID = "task_id";
        public static final String CATEGORY_ID = "category_id";
        public static final String PROPERTY_ID = "property_id";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener.class */
    public interface OnDatabaseOperationListener {
        void onDatabaseCreated(SQLiteDatabase sQLiteDatabase);

        void onDatabaseUpdate(SQLiteDatabase sQLiteDatabase, int i, int i2);
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskDatabaseHelper$Tables.class */
    public interface Tables {
        public static final String LISTS = "Lists";
        public static final String WRITEABLE_LISTS = "Writeable_Lists";
        public static final String TASKS = "Tasks";
        public static final String TASKS_VIEW = "Task_View";
        public static final String TASKS_PROPERTY_VIEW = "Task_Property_View";
        public static final String INSTANCES = "Instances";
        public static final String INSTANCE_VIEW = "Instance_View";
        public static final String INSTANCE_PROPERTY_VIEW = "Instance_Property_View";
        public static final String INSTANCE_CATEGORY_VIEW = "Instance_Cagetory_View";
        public static final String CATEGORIES = "Categories";
        public static final String CATEGORIES_MAPPING = "Categories_Mapping";
        public static final String PROPERTIES = "Properties";
        public static final String ALARMS = "Alarms";
        public static final String SYNCSTATE = "SyncState";
    }

    public static final String createIndexString(String str, boolean z, String... strArr) {
        if (strArr == null || strArr.length < 1) {
            throw new IllegalArgumentException("need at least one field to build an index!");
        }
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("CREATE ");
        if (z) {
            stringBuffer.append(" UNIQUE ");
        }
        stringBuffer.append("INDEX ");
        stringBuffer.append(str).append("_").append(strArr[0]).append("_idx ON ");
        stringBuffer.append(str).append(" (");
        stringBuffer.append(strArr[0]);
        for (int i = 1; i < strArr.length; i++) {
            stringBuffer.append(", ").append(strArr[i]);
        }
        stringBuffer.append(");");
        return stringBuffer.toString();
    }

    TaskDatabaseHelper(Context context, OnDatabaseOperationListener onDatabaseOperationListener) {
        super(context, DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, DATABASE_VERSION);
        this.mListener = onDatabaseOperationListener;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL(SQL_CREATE_LISTS_TABLE);
        sQLiteDatabase.execSQL("CREATE TRIGGER task_list_cleanup_trigger AFTER DELETE ON Lists BEGIN DELETE FROM Tasks WHERE list_id= old._id; END");
        sQLiteDatabase.execSQL(SQL_CREATE_TASKS_TABLE);
        sQLiteDatabase.execSQL("CREATE TRIGGER task_list_make_dirty_on_update AFTER UPDATE ON Tasks BEGIN UPDATE Lists SET _dirty=_dirty + new._dirty + new._deleted WHERE _id= new.list_id; END");
        sQLiteDatabase.execSQL("CREATE TRIGGER task_list_make_dirty_on_insert AFTER INSERT ON Tasks BEGIN UPDATE Lists SET _dirty=_dirty + new._dirty + new._deleted WHERE _id= new.list_id; END");
        sQLiteDatabase.execSQL(SQL_CREATE_INSTANCES_TABLE);
        sQLiteDatabase.execSQL(SQL_CREATE_CATEGORIES_TABLE);
        sQLiteDatabase.execSQL(SQL_CREATE_CATEGORIES_MAPPING_TABLE);
        sQLiteDatabase.execSQL(SQL_CREATE_ALARMS_TABLE);
        sQLiteDatabase.execSQL(SQL_CREATE_PROPERTIES_TABLE);
        sQLiteDatabase.execSQL(SQL_CREATE_SYNCSTATE_TABLE);
        sQLiteDatabase.execSQL(SQL_CREATE_TASK_VIEW);
        sQLiteDatabase.execSQL(SQL_CREATE_TASK_PROPERTY_VIEW);
        sQLiteDatabase.execSQL(SQL_CREATE_INSTANCE_VIEW);
        sQLiteDatabase.execSQL(SQL_CREATE_INSTANCE_PROPERTY_VIEW);
        sQLiteDatabase.execSQL(SQL_CREATE_INSTANCE_CATEGORY_VIEW);
        sQLiteDatabase.execSQL(createIndexString(Tables.INSTANCES, false, "task_id", TaskContract.InstanceColumns.INSTANCE_START, TaskContract.InstanceColumns.INSTANCE_DUE));
        sQLiteDatabase.execSQL(createIndexString(Tables.INSTANCES, false, TaskContract.InstanceColumns.INSTANCE_START_SORTING));
        sQLiteDatabase.execSQL(createIndexString(Tables.INSTANCES, false, "instance_due_sorting"));
        sQLiteDatabase.execSQL(createIndexString(Tables.LISTS, false, "account_name", "account_type"));
        sQLiteDatabase.execSQL(createIndexString(Tables.TASKS, false, TaskContract.TaskColumns.STATUS, TaskContract.TaskColumns.LIST_ID, TaskContract.CommonSyncColumns._SYNC_ID));
        sQLiteDatabase.execSQL(createIndexString(Tables.PROPERTIES, false, TaskContract.PropertyColumns.MIMETYPE, "task_id"));
        sQLiteDatabase.execSQL(createIndexString(Tables.PROPERTIES, false, "task_id"));
        sQLiteDatabase.execSQL(createIndexString(Tables.CATEGORIES, false, "account_name", "account_type", "name"));
        sQLiteDatabase.execSQL(createIndexString(Tables.CATEGORIES, false, "name"));
        sQLiteDatabase.execSQL(createIndexString(Tables.SYNCSTATE, true, "account_name", "account_type"));
        sQLiteDatabase.execSQL(SQL_CREATE_TASKS_CLEANUP_TRIGGER);
        sQLiteDatabase.execSQL(SQL_CREATE_ALARM_PROPERTY_CLEANUP_TRIGGER);
        sQLiteDatabase.execSQL(SQL_CREATE_LISTS_CLEANUP_TRIGGER);
        sQLiteDatabase.execSQL(SQL_CREATE_ALARM_COUNT_CREATE_TRIGGER);
        sQLiteDatabase.execSQL(SQL_CREATE_ALARM_COUNT_UPDATE_TRIGGER);
        sQLiteDatabase.execSQL(SQL_CREATE_ALARM_COUNT_DELETE_TRIGGER);
        sQLiteDatabase.execSQL(SQL_CREATE_TASK_PROPERTY_CLEANUP_TRIGGER);
        FTSDatabaseHelper.onCreate(sQLiteDatabase);
        if (this.mListener != null) {
            this.mListener.onDatabaseCreated(sQLiteDatabase);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        Log.i(TAG, "updgrading db from " + i + " to " + i2);
        if (i < 2) {
            sQLiteDatabase.execSQL("ALTER TABLE Tasks ADD COLUMN is_new INTEGER");
            sQLiteDatabase.execSQL("ALTER TABLE Tasks ADD COLUMN is_closed INTEGER");
            sQLiteDatabase.execSQL("UPDATE Tasks SET is_new = 1 WHERE status = 0");
            sQLiteDatabase.execSQL("UPDATE Tasks SET is_new = 0 WHERE status != 0");
            sQLiteDatabase.execSQL("UPDATE Tasks SET is_closed = 1 WHERE status > 1");
            sQLiteDatabase.execSQL("UPDATE Tasks SET is_closed = 0 WHERE status <= 1");
        }
        if (i < 3) {
            sQLiteDatabase.execSQL("ALTER TABLE Instances ADD COLUMN instance_start_sorting INTEGER");
            sQLiteDatabase.execSQL("ALTER TABLE Instances ADD COLUMN instance_due_sorting INTEGER");
            sQLiteDatabase.execSQL("UPDATE Instances SET instance_start_sorting = instance_start, instance_due_sorting = instance_due");
        }
        if (i < 4) {
            sQLiteDatabase.execSQL(SQL_DROP_TASK_VIEW);
            sQLiteDatabase.execSQL(SQL_DROP_INSTANCE_VIEW);
            sQLiteDatabase.execSQL(SQL_DROP_TASKS_CLEANUP_TRIGGER);
            sQLiteDatabase.execSQL(SQL_DROP_PROPERTIES_TABLE);
            sQLiteDatabase.execSQL(SQL_CREATE_PROPERTIES_TABLE);
            sQLiteDatabase.execSQL(SQL_CREATE_TASKS_CLEANUP_TRIGGER);
            sQLiteDatabase.execSQL(SQL_CREATE_CATEGORIES_MAPPING_TABLE);
            sQLiteDatabase.execSQL(SQL_CREATE_ALARMS_TABLE);
            sQLiteDatabase.execSQL(SQL_CREATE_TASK_VIEW);
            sQLiteDatabase.execSQL(SQL_CREATE_TASK_PROPERTY_VIEW);
            sQLiteDatabase.execSQL(SQL_CREATE_INSTANCE_VIEW);
            sQLiteDatabase.execSQL(SQL_CREATE_INSTANCE_PROPERTY_VIEW);
            sQLiteDatabase.execSQL(SQL_CREATE_INSTANCE_CATEGORY_VIEW);
            sQLiteDatabase.execSQL(createIndexString(Tables.PROPERTIES, false, TaskContract.PropertyColumns.MIMETYPE, "task_id"));
            sQLiteDatabase.execSQL(createIndexString(Tables.PROPERTIES, false, "task_id"));
            sQLiteDatabase.execSQL(createIndexString(Tables.CATEGORIES, false, "account_name", "account_type", "name"));
            sQLiteDatabase.execSQL(createIndexString(Tables.CATEGORIES, false, "name"));
            sQLiteDatabase.execSQL(SQL_CREATE_ALARM_PROPERTY_CLEANUP_TRIGGER);
            sQLiteDatabase.execSQL(SQL_CREATE_ALARM_COUNT_CREATE_TRIGGER);
            sQLiteDatabase.execSQL(SQL_CREATE_ALARM_COUNT_UPDATE_TRIGGER);
            sQLiteDatabase.execSQL(SQL_CREATE_ALARM_COUNT_DELETE_TRIGGER);
        }
        if (i < 6) {
            sQLiteDatabase.execSQL("alter table Tasks add column parent_id integer;");
            sQLiteDatabase.execSQL("alter table Tasks add column has_alarms integer;");
            sQLiteDatabase.execSQL("alter table Tasks add column sorting text;");
        }
        if (i < 7) {
            sQLiteDatabase.execSQL(SQL_CREATE_LISTS_CLEANUP_TRIGGER);
        }
        if (i < 8) {
            sQLiteDatabase.execSQL("update Tasks set priority=null where priority=0;");
        }
        if (i < 9) {
            sQLiteDatabase.execSQL("alter table Tasks add column _uid integer;");
            sQLiteDatabase.execSQL(SQL_CREATE_TASK_PROPERTY_CLEANUP_TRIGGER);
        }
        if (i < 10) {
            sQLiteDatabase.execSQL("drop table Categories_Mapping");
            sQLiteDatabase.execSQL(SQL_CREATE_CATEGORIES_MAPPING_TABLE);
            sQLiteDatabase.execSQL(SQL_CREATE_CATEGORY_PROPERTY_CLEANUP_TRIGGER);
        }
        if (i < 11) {
            sQLiteDatabase.execSQL("alter table Tasks add column pinned integer;");
            sQLiteDatabase.execSQL("alter table Tasks add column has_properties integer;");
        }
        if (i < 12) {
            ContentValues contentValues = new ContentValues(1);
            contentValues.put("account_type", TaskContract.LOCAL_ACCOUNT_TYPE);
            sQLiteDatabase.update(Tables.LISTS, contentValues, "account_type=?", new String[]{"LOCAL"});
        }
        if (i < 13) {
            sQLiteDatabase.execSQL(SQL_CREATE_SYNCSTATE_TABLE);
        }
        if (i < 14) {
            sQLiteDatabase.execSQL(createIndexString(Tables.SYNCSTATE, true, "account_name", "account_type"));
        }
        if (i < DATABASE_VERSION) {
            sQLiteDatabase.execSQL(createIndexString(Tables.INSTANCES, false, TaskContract.InstanceColumns.INSTANCE_START_SORTING));
            sQLiteDatabase.execSQL(createIndexString(Tables.INSTANCES, false, "instance_due_sorting"));
        }
        FTSDatabaseHelper.onUpgrade(sQLiteDatabase, i, i2);
        if (this.mListener != null) {
            this.mListener.onDatabaseUpdate(sQLiteDatabase, i, i2);
        }
    }
}
