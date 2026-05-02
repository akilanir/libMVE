.class public Lorg/dmfs/provider/tasks/TaskDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/provider/tasks/TaskDatabaseHelper$CategoriesMapping;,
        Lorg/dmfs/provider/tasks/TaskDatabaseHelper$Tables;,
        Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;
    }
.end annotation


# static fields
.field private static final DATABASE_NAME:Ljava/lang/String; = "tasks.db"

.field static final DATABASE_VERSION:I = 0x10

.field private static final SQL_COUNT_ALARMS:Ljava/lang/String; = " BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = \'vnd.android.cursor.item/alarm\' AND data3 <> 0 AND task_id = NEW.task_id) WHERE _id = NEW.task_id; END;"

.field private static final SQL_COUNT_ALARMS_ON_DELETE:Ljava/lang/String; = " BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = \'vnd.android.cursor.item/alarm\' AND data3 <> 0 AND task_id = OLD.task_id) WHERE _id = OLD.task_id; END;"

.field private static final SQL_CREATE_ALARMS_TABLE:Ljava/lang/String; = "CREATE TABLE Alarms ( alarm_id INTEGER,last_trigger TEXT,next_trigger TEXT);"

.field private static final SQL_CREATE_ALARM_COUNT_CREATE_TRIGGER:Ljava/lang/String; = "CREATE TRIGGER alarm_count_create_trigger AFTER INSERT ON Properties WHEN NEW.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = \'vnd.android.cursor.item/alarm\' AND data3 <> 0 AND task_id = NEW.task_id) WHERE _id = NEW.task_id; END;"

.field private static final SQL_CREATE_ALARM_COUNT_DELETE_TRIGGER:Ljava/lang/String; = "CREATE TRIGGER alarm_count_delete_trigger AFTER DELETE ON Properties WHEN OLD.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = \'vnd.android.cursor.item/alarm\' AND data3 <> 0 AND task_id = OLD.task_id) WHERE _id = OLD.task_id; END;"

.field private static final SQL_CREATE_ALARM_COUNT_UPDATE_TRIGGER:Ljava/lang/String; = "CREATE TRIGGER alarm_count_update_trigger AFTER UPDATE ON Properties WHEN NEW.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = \'vnd.android.cursor.item/alarm\' AND data3 <> 0 AND task_id = NEW.task_id) WHERE _id = NEW.task_id; END;"

.field private static final SQL_CREATE_ALARM_PROPERTY_CLEANUP_TRIGGER:Ljava/lang/String; = "CREATE TRIGGER alarm_property_cleanup_trigger AFTER DELETE ON Properties WHEN OLD.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN  DELETE FROM Alarms WHERE alarm_id= OLD.property_id; END;"

.field private static final SQL_CREATE_CATEGORIES_MAPPING_TABLE:Ljava/lang/String; = "CREATE TABLE Categories_Mapping ( task_id INTEGER,category_id INTEGER,property_id INTEGER,FOREIGN KEY (task_id) REFERENCES Tasks(_id),FOREIGN KEY (property_id) REFERENCES Properties(property_id),FOREIGN KEY (category_id) REFERENCES Categories(_id));"

.field private static final SQL_CREATE_CATEGORIES_TABLE:Ljava/lang/String; = "CREATE TABLE Categories ( _id INTEGER PRIMARY KEY AUTOINCREMENT,account_name TEXT,account_type TEXT,name TEXT,color INTEGER);"

.field private static final SQL_CREATE_CATEGORY_PROPERTY_CLEANUP_TRIGGER:Ljava/lang/String; = "CREATE TRIGGER category_property_cleanup_trigger AFTER DELETE ON Properties WHEN OLD.mimetype = \'vnd.android.cursor.item/category\' BEGIN  DELETE FROM Categories_Mapping WHERE property_id= OLD.property_id; END;"

.field private static final SQL_CREATE_INSTANCES_TABLE:Ljava/lang/String; = "CREATE TABLE Instances ( _id INTEGER PRIMARY KEY AUTOINCREMENT, task_id INTEGER NOT NULL, instance_start INTEGER, instance_due INTEGER, instance_start_sorting INTEGER, instance_due_sorting INTEGER, instance_duration INTEGER);"

.field private static final SQL_CREATE_INSTANCE_CATEGORY_VIEW:Ljava/lang/String; = "CREATE VIEW Instance_Cagetory_View AS SELECT Instances.*, Categories_Mapping.category_id, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id) LEFT JOIN Categories_Mapping ON (Categories_Mapping.task_id=Instances.task_id);"

.field private static final SQL_CREATE_INSTANCE_PROPERTY_VIEW:Ljava/lang/String; = "CREATE VIEW Instance_Property_View AS SELECT Instances.*, Properties.*, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id) LEFT JOIN Properties ON (Tasks._id=Properties.task_id);"

.field private static final SQL_CREATE_INSTANCE_VIEW:Ljava/lang/String; = "CREATE VIEW Instance_View AS SELECT Instances.*, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id);"

.field private static final SQL_CREATE_LISTS_CLEANUP_TRIGGER:Ljava/lang/String; = "CREATE TRIGGER list_cleanup_trigger AFTER DELETE ON Lists BEGIN  DELETE FROM Tasks WHERE list_id= old._id; END;"

.field private static final SQL_CREATE_LISTS_TABLE:Ljava/lang/String; = "CREATE TABLE Lists ( _id INTEGER PRIMARY KEY AUTOINCREMENT,account_name TEXT,account_type TEXT,list_name TEXT,list_color INTEGER,list_access_level INTEGER,visible INTEGER,sync_enabled INTEGER,list_owner TEXT,_dirty INTEGER DEFAULT 0,_sync_id TEXT,sync_version TEXT,sync1 TEXT,sync2 TEXT,sync3 TEXT,sync4 TEXT,sync5 TEXT,sync6 TEXT,sync7 TEXT,sync8 TEXT);"

.field private static final SQL_CREATE_PROPERTIES_TABLE:Ljava/lang/String; = "CREATE TABLE Properties ( property_id INTEGER PRIMARY KEY AUTOINCREMENT,task_id INTEGER,mimetype INTEGER,prop_version INTEGER,data0 TEXT,data1 TEXT,data2 TEXT,data3 TEXT,data4 TEXT,data5 TEXT,data6 TEXT,data7 TEXT,data8 TEXT,data9 TEXT,data10 TEXT,data11 TEXT,data12 TEXT,data13 TEXT,data14 TEXT,data15 TEXT,prop_sync1 TEXT,prop_sync2 TEXT,prop_sync3 TEXT,prop_sync4 TEXT,prop_sync5 TEXT,prop_sync6 TEXT,prop_sync7 TEXT,prop_sync8 TEXT);"

.field private static final SQL_CREATE_SYNCSTATE_TABLE:Ljava/lang/String; = "CREATE TABLE SyncState ( _id INTEGER PRIMARY KEY AUTOINCREMENT, account_name TEXT, account_type TEXT, data TEXT );"

.field private static final SQL_CREATE_TASKS_CLEANUP_TRIGGER:Ljava/lang/String; = "CREATE TRIGGER task_cleanup_trigger AFTER DELETE ON Tasks BEGIN  DELETE FROM Properties WHERE task_id= old._id; DELETE FROM Instances WHERE task_id=old._id; END;"

.field private static final SQL_CREATE_TASKS_TABLE:Ljava/lang/String; = "CREATE TABLE Tasks ( _id INTEGER PRIMARY KEY AUTOINCREMENT,list_id INTEGER NOT NULL, title TEXT,location TEXT,geo TEXT,description TEXT,url TEXT,organizer TEXT,priority INTEGER, task_color INTEGER,class INTEGER,completed INTEGER,completed_is_allday INTEGER,percent_complete INTEGER,status INTEGER DEFAULT 0,is_new INTEGER,is_closed INTEGER,dtstart INTEGER,created INTEGER,last_modified INTEGER,is_allday INTEGER,tz TEXT,due INTEGER,duration TEXT,rdate TEXT,exdate TEXT,rrule TEXT,parent_id INTEGER,sorting TEXT,has_alarms INTEGER,has_properties INTEGER,pinned INTEGER,original_instance_sync_id TEXT,original_instance_id INTEGER,original_instance_time INTEGER,original_instance_allday INTEGER,_dirty INTEGER DEFAULT 1,_deleted INTEGER DEFAULT 0,_sync_id TEXT,_uid TEXT,sync_version TEXT,sync1 TEXT,sync2 TEXT,sync3 TEXT,sync4 TEXT,sync5 TEXT,sync6 TEXT,sync7 TEXT,sync8 TEXT);"

.field private static final SQL_CREATE_TASK_PROPERTY_CLEANUP_TRIGGER:Ljava/lang/String; = "CREATE TRIGGER task_property_cleanup_trigger AFTER DELETE ON Tasks BEGIN  DELETE FROM Properties WHERE task_id= OLD._id; END;"

.field private static final SQL_CREATE_TASK_PROPERTY_VIEW:Ljava/lang/String; = "create view Task_Property_View as select Tasks.*, Properties.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible from Tasks join Lists on (Tasks.list_id=Lists._id) left join Properties on (Tasks._id=Properties.task_id);"

.field private static final SQL_CREATE_TASK_VIEW:Ljava/lang/String; = "create view Task_View as select Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible from Tasks join Lists on (Tasks.list_id=Lists._id);"

.field private static final SQL_DROP_INSTANCE_VIEW:Ljava/lang/String; = "DROP VIEW Instance_View;"

.field private static final SQL_DROP_PROPERTIES_TABLE:Ljava/lang/String; = "DROP TABLE Properties;"

.field private static final SQL_DROP_TASKS_CLEANUP_TRIGGER:Ljava/lang/String; = "DROP TRIGGER task_cleanup_trigger;"

.field private static final SQL_DROP_TASK_VIEW:Ljava/lang/String; = "DROP VIEW Task_View;"

.field private static final TAG:Ljava/lang/String; = "TaskDatabaseHelper"


# instance fields
.field private final mListener:Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;


# direct methods
.method constructor <init>(Landroid/content/Context;Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;)V
    .registers 6

    const-string v0, "tasks.db"

    const/4 v1, 0x0

    const/16 v2, 0x10

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    iput-object p2, p0, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->mListener:Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;

    return-void
.end method

.method public static final varargs createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    const/4 v0, 0x1

    const/4 v4, 0x0

    if-eqz p2, :cond_7

    array-length v1, p2

    if-ge v1, v0, :cond_f

    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "need at least one field to build an index!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "CREATE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    if-eqz p1, :cond_20

    const-string v2, " UNIQUE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_20
    const-string v2, "INDEX "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    aget-object v3, p2, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "_idx ON "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    aget-object v2, p2, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_48
    array-length v2, p2

    if-ge v0, v2, :cond_59

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    aget-object v3, p2, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_48

    :cond_59
    const-string v0, ");"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 9

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const-string v0, "CREATE TABLE Lists ( _id INTEGER PRIMARY KEY AUTOINCREMENT,account_name TEXT,account_type TEXT,list_name TEXT,list_color INTEGER,list_access_level INTEGER,visible INTEGER,sync_enabled INTEGER,list_owner TEXT,_dirty INTEGER DEFAULT 0,_sync_id TEXT,sync_version TEXT,sync1 TEXT,sync2 TEXT,sync3 TEXT,sync4 TEXT,sync5 TEXT,sync6 TEXT,sync7 TEXT,sync8 TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER task_list_cleanup_trigger AFTER DELETE ON Lists BEGIN DELETE FROM Tasks WHERE list_id= old._id; END"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE Tasks ( _id INTEGER PRIMARY KEY AUTOINCREMENT,list_id INTEGER NOT NULL, title TEXT,location TEXT,geo TEXT,description TEXT,url TEXT,organizer TEXT,priority INTEGER, task_color INTEGER,class INTEGER,completed INTEGER,completed_is_allday INTEGER,percent_complete INTEGER,status INTEGER DEFAULT 0,is_new INTEGER,is_closed INTEGER,dtstart INTEGER,created INTEGER,last_modified INTEGER,is_allday INTEGER,tz TEXT,due INTEGER,duration TEXT,rdate TEXT,exdate TEXT,rrule TEXT,parent_id INTEGER,sorting TEXT,has_alarms INTEGER,has_properties INTEGER,pinned INTEGER,original_instance_sync_id TEXT,original_instance_id INTEGER,original_instance_time INTEGER,original_instance_allday INTEGER,_dirty INTEGER DEFAULT 1,_deleted INTEGER DEFAULT 0,_sync_id TEXT,_uid TEXT,sync_version TEXT,sync1 TEXT,sync2 TEXT,sync3 TEXT,sync4 TEXT,sync5 TEXT,sync6 TEXT,sync7 TEXT,sync8 TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER task_list_make_dirty_on_update AFTER UPDATE ON Tasks BEGIN UPDATE Lists SET _dirty=_dirty + new._dirty + new._deleted WHERE _id= new.list_id; END"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER task_list_make_dirty_on_insert AFTER INSERT ON Tasks BEGIN UPDATE Lists SET _dirty=_dirty + new._dirty + new._deleted WHERE _id= new.list_id; END"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE Instances ( _id INTEGER PRIMARY KEY AUTOINCREMENT, task_id INTEGER NOT NULL, instance_start INTEGER, instance_due INTEGER, instance_start_sorting INTEGER, instance_due_sorting INTEGER, instance_duration INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE Categories ( _id INTEGER PRIMARY KEY AUTOINCREMENT,account_name TEXT,account_type TEXT,name TEXT,color INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE Categories_Mapping ( task_id INTEGER,category_id INTEGER,property_id INTEGER,FOREIGN KEY (task_id) REFERENCES Tasks(_id),FOREIGN KEY (property_id) REFERENCES Properties(property_id),FOREIGN KEY (category_id) REFERENCES Categories(_id));"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE Alarms ( alarm_id INTEGER,last_trigger TEXT,next_trigger TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE Properties ( property_id INTEGER PRIMARY KEY AUTOINCREMENT,task_id INTEGER,mimetype INTEGER,prop_version INTEGER,data0 TEXT,data1 TEXT,data2 TEXT,data3 TEXT,data4 TEXT,data5 TEXT,data6 TEXT,data7 TEXT,data8 TEXT,data9 TEXT,data10 TEXT,data11 TEXT,data12 TEXT,data13 TEXT,data14 TEXT,data15 TEXT,prop_sync1 TEXT,prop_sync2 TEXT,prop_sync3 TEXT,prop_sync4 TEXT,prop_sync5 TEXT,prop_sync6 TEXT,prop_sync7 TEXT,prop_sync8 TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE SyncState ( _id INTEGER PRIMARY KEY AUTOINCREMENT, account_name TEXT, account_type TEXT, data TEXT );"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "create view Task_View as select Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible from Tasks join Lists on (Tasks.list_id=Lists._id);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "create view Task_Property_View as select Tasks.*, Properties.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible from Tasks join Lists on (Tasks.list_id=Lists._id) left join Properties on (Tasks._id=Properties.task_id);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE VIEW Instance_View AS SELECT Instances.*, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE VIEW Instance_Property_View AS SELECT Instances.*, Properties.*, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id) LEFT JOIN Properties ON (Tasks._id=Properties.task_id);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE VIEW Instance_Cagetory_View AS SELECT Instances.*, Categories_Mapping.category_id, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id) LEFT JOIN Categories_Mapping ON (Categories_Mapping.task_id=Instances.task_id);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Instances"

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "task_id"

    aput-object v2, v1, v3

    const-string v2, "instance_start"

    aput-object v2, v1, v4

    const-string v2, "instance_due"

    aput-object v2, v1, v5

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Instances"

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "instance_start_sorting"

    aput-object v2, v1, v3

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Instances"

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "instance_due_sorting"

    aput-object v2, v1, v3

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Lists"

    new-array v1, v5, [Ljava/lang/String;

    const-string v2, "account_name"

    aput-object v2, v1, v3

    const-string v2, "account_type"

    aput-object v2, v1, v4

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Tasks"

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "status"

    aput-object v2, v1, v3

    const-string v2, "list_id"

    aput-object v2, v1, v4

    const-string v2, "_sync_id"

    aput-object v2, v1, v5

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Properties"

    new-array v1, v5, [Ljava/lang/String;

    const-string v2, "mimetype"

    aput-object v2, v1, v3

    const-string v2, "task_id"

    aput-object v2, v1, v4

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Properties"

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "task_id"

    aput-object v2, v1, v3

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Categories"

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "account_name"

    aput-object v2, v1, v3

    const-string v2, "account_type"

    aput-object v2, v1, v4

    const-string v2, "name"

    aput-object v2, v1, v5

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Categories"

    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "name"

    aput-object v2, v1, v3

    invoke-static {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "SyncState"

    new-array v1, v5, [Ljava/lang/String;

    const-string v2, "account_name"

    aput-object v2, v1, v3

    const-string v2, "account_type"

    aput-object v2, v1, v4

    invoke-static {v0, v4, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER task_cleanup_trigger AFTER DELETE ON Tasks BEGIN  DELETE FROM Properties WHERE task_id= old._id; DELETE FROM Instances WHERE task_id=old._id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER alarm_property_cleanup_trigger AFTER DELETE ON Properties WHEN OLD.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN  DELETE FROM Alarms WHERE alarm_id= OLD.property_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER list_cleanup_trigger AFTER DELETE ON Lists BEGIN  DELETE FROM Tasks WHERE list_id= old._id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER alarm_count_create_trigger AFTER INSERT ON Properties WHEN NEW.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = \'vnd.android.cursor.item/alarm\' AND data3 <> 0 AND task_id = NEW.task_id) WHERE _id = NEW.task_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER alarm_count_update_trigger AFTER UPDATE ON Properties WHEN NEW.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = \'vnd.android.cursor.item/alarm\' AND data3 <> 0 AND task_id = NEW.task_id) WHERE _id = NEW.task_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER alarm_count_delete_trigger AFTER DELETE ON Properties WHEN OLD.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = \'vnd.android.cursor.item/alarm\' AND data3 <> 0 AND task_id = OLD.task_id) WHERE _id = OLD.task_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER task_property_cleanup_trigger AFTER DELETE ON Tasks BEGIN  DELETE FROM Properties WHERE task_id= OLD._id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    invoke-static {p1}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->mListener:Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;

    if-eqz v0, :cond_13d

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->mListener:Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;

    invoke-interface {v0, p1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;->onDatabaseCreated(Landroid/database/sqlite/SQLiteDatabase;)V

    :cond_13d
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 12

    const/4 v3, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    const-string v0, "TaskDatabaseHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updgrading db from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-ge p2, v7, :cond_46

    const-string v0, "ALTER TABLE Tasks ADD COLUMN is_new INTEGER"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "ALTER TABLE Tasks ADD COLUMN is_closed INTEGER"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "UPDATE Tasks SET is_new = 1 WHERE status = 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "UPDATE Tasks SET is_new = 0 WHERE status != 0"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "UPDATE Tasks SET is_closed = 1 WHERE status > 1"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "UPDATE Tasks SET is_closed = 0 WHERE status <= 1"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_46
    if-ge p2, v3, :cond_57

    const-string v0, "ALTER TABLE Instances ADD COLUMN instance_start_sorting INTEGER"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "ALTER TABLE Instances ADD COLUMN instance_due_sorting INTEGER"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "UPDATE Instances SET instance_start_sorting = instance_start, instance_due_sorting = instance_due"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_57
    const/4 v0, 0x4

    if-ge p2, v0, :cond_f7

    const-string v0, "DROP VIEW Task_View;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "DROP VIEW Instance_View;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "DROP TRIGGER task_cleanup_trigger;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "DROP TABLE Properties;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE Properties ( property_id INTEGER PRIMARY KEY AUTOINCREMENT,task_id INTEGER,mimetype INTEGER,prop_version INTEGER,data0 TEXT,data1 TEXT,data2 TEXT,data3 TEXT,data4 TEXT,data5 TEXT,data6 TEXT,data7 TEXT,data8 TEXT,data9 TEXT,data10 TEXT,data11 TEXT,data12 TEXT,data13 TEXT,data14 TEXT,data15 TEXT,prop_sync1 TEXT,prop_sync2 TEXT,prop_sync3 TEXT,prop_sync4 TEXT,prop_sync5 TEXT,prop_sync6 TEXT,prop_sync7 TEXT,prop_sync8 TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER task_cleanup_trigger AFTER DELETE ON Tasks BEGIN  DELETE FROM Properties WHERE task_id= old._id; DELETE FROM Instances WHERE task_id=old._id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE Categories_Mapping ( task_id INTEGER,category_id INTEGER,property_id INTEGER,FOREIGN KEY (task_id) REFERENCES Tasks(_id),FOREIGN KEY (property_id) REFERENCES Properties(property_id),FOREIGN KEY (category_id) REFERENCES Categories(_id));"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE Alarms ( alarm_id INTEGER,last_trigger TEXT,next_trigger TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "create view Task_View as select Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible from Tasks join Lists on (Tasks.list_id=Lists._id);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "create view Task_Property_View as select Tasks.*, Properties.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible from Tasks join Lists on (Tasks.list_id=Lists._id) left join Properties on (Tasks._id=Properties.task_id);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE VIEW Instance_View AS SELECT Instances.*, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE VIEW Instance_Property_View AS SELECT Instances.*, Properties.*, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id) LEFT JOIN Properties ON (Tasks._id=Properties.task_id);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE VIEW Instance_Cagetory_View AS SELECT Instances.*, Categories_Mapping.category_id, Tasks.*, Lists.account_name, Lists.account_type, Lists.list_owner, Lists.list_name, Lists.list_access_level, Lists.list_color, Lists.visible FROM Tasks JOIN Lists ON (Tasks.list_id=Lists._id) JOIN Instances ON (Tasks._id=Instances.task_id) LEFT JOIN Categories_Mapping ON (Categories_Mapping.task_id=Instances.task_id);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Properties"

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "mimetype"

    aput-object v2, v1, v5

    const-string v2, "task_id"

    aput-object v2, v1, v6

    invoke-static {v0, v5, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Properties"

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "task_id"

    aput-object v2, v1, v5

    invoke-static {v0, v5, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Categories"

    new-array v1, v3, [Ljava/lang/String;

    const-string v2, "account_name"

    aput-object v2, v1, v5

    const-string v2, "account_type"

    aput-object v2, v1, v6

    const-string v2, "name"

    aput-object v2, v1, v7

    invoke-static {v0, v5, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Categories"

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "name"

    aput-object v2, v1, v5

    invoke-static {v0, v5, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER alarm_property_cleanup_trigger AFTER DELETE ON Properties WHEN OLD.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN  DELETE FROM Alarms WHERE alarm_id= OLD.property_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER alarm_count_create_trigger AFTER INSERT ON Properties WHEN NEW.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = \'vnd.android.cursor.item/alarm\' AND data3 <> 0 AND task_id = NEW.task_id) WHERE _id = NEW.task_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER alarm_count_update_trigger AFTER UPDATE ON Properties WHEN NEW.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = \'vnd.android.cursor.item/alarm\' AND data3 <> 0 AND task_id = NEW.task_id) WHERE _id = NEW.task_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER alarm_count_delete_trigger AFTER DELETE ON Properties WHEN OLD.mimetype = \'vnd.android.cursor.item/alarm\' BEGIN UPDATE Tasks SET has_alarms = (SELECT COUNT (*) FROM Properties WHERE mimetype = \'vnd.android.cursor.item/alarm\' AND data3 <> 0 AND task_id = OLD.task_id) WHERE _id = OLD.task_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_f7
    const/4 v0, 0x6

    if-ge p2, v0, :cond_109

    const-string v0, "alter table Tasks add column parent_id integer;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "alter table Tasks add column has_alarms integer;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "alter table Tasks add column sorting text;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_109
    const/4 v0, 0x7

    if-ge p2, v0, :cond_111

    const-string v0, "CREATE TRIGGER list_cleanup_trigger AFTER DELETE ON Lists BEGIN  DELETE FROM Tasks WHERE list_id= old._id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_111
    const/16 v0, 0x8

    if-ge p2, v0, :cond_11a

    const-string v0, "update Tasks set priority=null where priority=0;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_11a
    const/16 v0, 0x9

    if-ge p2, v0, :cond_128

    const-string v0, "alter table Tasks add column _uid integer;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER task_property_cleanup_trigger AFTER DELETE ON Tasks BEGIN  DELETE FROM Properties WHERE task_id= OLD._id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_128
    const/16 v0, 0xa

    if-ge p2, v0, :cond_13b

    const-string v0, "drop table Categories_Mapping"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE Categories_Mapping ( task_id INTEGER,category_id INTEGER,property_id INTEGER,FOREIGN KEY (task_id) REFERENCES Tasks(_id),FOREIGN KEY (property_id) REFERENCES Properties(property_id),FOREIGN KEY (category_id) REFERENCES Categories(_id));"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TRIGGER category_property_cleanup_trigger AFTER DELETE ON Properties WHEN OLD.mimetype = \'vnd.android.cursor.item/category\' BEGIN  DELETE FROM Categories_Mapping WHERE property_id= OLD.property_id; END;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_13b
    const/16 v0, 0xb

    if-ge p2, v0, :cond_149

    const-string v0, "alter table Tasks add column pinned integer;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "alter table Tasks add column has_properties integer;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_149
    const/16 v0, 0xc

    if-ge p2, v0, :cond_166

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, v6}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "account_type"

    const-string v2, "org.dmfs.account.LOCAL"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Lists"

    const-string v2, "account_type=?"

    new-array v3, v6, [Ljava/lang/String;

    const-string v4, "LOCAL"

    aput-object v4, v3, v5

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_166
    const/16 v0, 0xd

    if-ge p2, v0, :cond_16f

    const-string v0, "CREATE TABLE SyncState ( _id INTEGER PRIMARY KEY AUTOINCREMENT, account_name TEXT, account_type TEXT, data TEXT );"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_16f
    const/16 v0, 0xe

    if-ge p2, v0, :cond_186

    const-string v0, "SyncState"

    new-array v1, v7, [Ljava/lang/String;

    const-string v2, "account_name"

    aput-object v2, v1, v5

    const-string v2, "account_type"

    aput-object v2, v1, v6

    invoke-static {v0, v6, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_186
    const/16 v0, 0x10

    if-ge p2, v0, :cond_1a8

    const-string v0, "Instances"

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "instance_start_sorting"

    aput-object v2, v1, v5

    invoke-static {v0, v5, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "Instances"

    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "instance_due_sorting"

    aput-object v2, v1, v5

    invoke-static {v0, v5, v1}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->createIndexString(Ljava/lang/String;Z[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_1a8
    invoke-static {p1, p2, p3}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->mListener:Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;

    if-eqz v0, :cond_1b4

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;->mListener:Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;

    invoke-interface {v0, p1, p2, p3}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;->onDatabaseUpdate(Landroid/database/sqlite/SQLiteDatabase;II)V

    :cond_1b4
    return-void
.end method
