.class public Lorg/dmfs/provider/tasks/handler/CategoryHandler;
.super Lorg/dmfs/provider/tasks/handler/PropertyHandler;


# static fields
.field private static final CATEGORY_ID_PROJECTION:[Ljava/lang/String;

.field private static final CATEGORY_ID_SELECTION:Ljava/lang/String; = "_id=? and account_name=? and account_type=?"

.field private static final CATEGORY_NAME_SELECTION:Ljava/lang/String; = "name=? and account_name=? and account_type=?"

.field public static final IS_NEW_CATEGORY:Ljava/lang/String; = "is_new_category"


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "name"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "color"

    aput-object v2, v0, v1

    sput-object v0, Lorg/dmfs/provider/tasks/handler/CategoryHandler;->CATEGORY_ID_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;-><init>()V

    return-void
.end method

.method private getOrInsertCategory(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .registers 6

    const-string v0, "is_new_category"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_4f

    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "account_name"

    const-string v2, "account_name"

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "account_type"

    const-string v2, "account_type"

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "name"

    const-string v2, "data1"

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "color"

    const-string v2, "data2"

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "Categories"

    const-string v2, ""

    invoke-virtual {p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    const-string v2, "data0"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p2, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :cond_4f
    const-string v0, "is_new_category"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    const-string v0, "account_name"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    const-string v0, "account_type"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    return-object p2
.end method

.method private insertRelation(Landroid/database/sqlite/SQLiteDatabase;JJJ)J
    .registers 11

    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "task_id"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "category_id"

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "property_id"

    invoke-static {p6, p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "Categories_Mapping"

    const-string v2, ""

    invoke-virtual {p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method public insert(Landroid/database/sqlite/SQLiteDatabase;JLandroid/content/ContentValues;Z)J
    .registers 20

    const-wide/16 v4, -0x1

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide/from16 v2, p2

    move-object/from16 v7, p4

    move/from16 v8, p5

    invoke-virtual/range {v0 .. v8}, Lorg/dmfs/provider/tasks/handler/CategoryHandler;->validateValues(Landroid/database/sqlite/SQLiteDatabase;JJZLandroid/content/ContentValues;Z)Landroid/content/ContentValues;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/dmfs/provider/tasks/handler/CategoryHandler;->getOrInsertCategory(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move-wide/from16 v2, p2

    move/from16 v5, p5

    invoke-super/range {v0 .. v5}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;->insert(Landroid/database/sqlite/SQLiteDatabase;JLandroid/content/ContentValues;Z)J

    move-result-wide v11

    const-string v0, "data0"

    invoke-virtual {v4, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    move-object v5, p0

    move-object v6, p1

    move-wide/from16 v7, p2

    invoke-direct/range {v5 .. v12}, Lorg/dmfs/provider/tasks/handler/CategoryHandler;->insertRelation(Landroid/database/sqlite/SQLiteDatabase;JJJ)J

    const-string v0, "data1"

    invoke-virtual {v4, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object v7, p0

    move-object v8, p1

    move-wide/from16 v9, p2

    invoke-virtual/range {v7 .. v13}, Lorg/dmfs/provider/tasks/handler/CategoryHandler;->updateFTSEntry(Landroid/database/sqlite/SQLiteDatabase;JJLjava/lang/String;)V

    return-wide v11
.end method

.method public update(Landroid/database/sqlite/SQLiteDatabase;JJLandroid/content/ContentValues;Landroid/database/Cursor;Z)I
    .registers 18

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-object v7, p6

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Lorg/dmfs/provider/tasks/handler/CategoryHandler;->validateValues(Landroid/database/sqlite/SQLiteDatabase;JJZLandroid/content/ContentValues;Z)Landroid/content/ContentValues;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/dmfs/provider/tasks/handler/CategoryHandler;->getOrInsertCategory(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v7

    const-string v0, "data1"

    invoke-virtual {v7, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_25

    const-string v0, "data1"

    invoke-virtual {v7, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-virtual/range {v0 .. v6}, Lorg/dmfs/provider/tasks/handler/CategoryHandler;->updateFTSEntry(Landroid/database/sqlite/SQLiteDatabase;JJLjava/lang/String;)V

    :cond_25
    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-object v6, v7

    move-object/from16 v7, p7

    move/from16 v8, p8

    invoke-super/range {v0 .. v8}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;->update(Landroid/database/sqlite/SQLiteDatabase;JJLandroid/content/ContentValues;Landroid/database/Cursor;Z)I

    move-result v0

    return v0
.end method

.method public validateValues(Landroid/database/sqlite/SQLiteDatabase;JJZLandroid/content/ContentValues;Z)Landroid/content/ContentValues;
    .registers 17

    const-string v0, "data0"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "data1"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_18

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Neiter an id nor a category name was supplied for the category property."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_18
    const-string v0, "task_id"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_28

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No task id was supplied for the category property"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_28
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "task_id"

    invoke-virtual {p7, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "account_name"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "account_type"

    aput-object v1, v2, v0

    const-string v3, "_id=?"

    const-string v1, "Task_View"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    const/4 v1, 0x0

    const/4 v0, 0x0

    :try_start_4f
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_69

    const/4 v0, 0x0

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v0, 0x1

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v3, "account_name"

    invoke-virtual {p7, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "account_type"

    invoke-virtual {p7, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_69
    .catchall {:try_start_4f .. :try_end_69} :catchall_dd

    :cond_69
    if-eqz v2, :cond_6e

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_6e
    if-eqz v1, :cond_dc

    if-eqz v0, :cond_dc

    const-string v2, "_id"

    invoke-virtual {p7, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e4

    const/4 v2, 0x3

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "data0"

    invoke-virtual {p7, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v2

    const/4 v2, 0x1

    aput-object v1, v4, v2

    const/4 v1, 0x2

    aput-object v0, v4, v1

    const-string v1, "Categories"

    sget-object v2, Lorg/dmfs/provider/tasks/handler/CategoryHandler;->CATEGORY_ID_PROJECTION:[Ljava/lang/String;

    const-string v3, "_id=? and account_name=? and account_type=?"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    move-object v1, v0

    :goto_9b
    if-eqz v1, :cond_106

    :try_start_9d
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_106

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const-string v4, "data0"

    invoke-virtual {p7, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "data1"

    invoke-virtual {p7, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "data2"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p7, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "is_new_category"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {p7, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V
    :try_end_d7
    .catchall {:try_start_9d .. :try_end_d7} :catchall_111

    :goto_d7
    if-eqz v1, :cond_dc

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_dc
    return-object p7

    :catchall_dd
    move-exception v0

    if-eqz v2, :cond_e3

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_e3
    throw v0

    :cond_e4
    const/4 v2, 0x3

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "data1"

    invoke-virtual {p7, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v2

    const/4 v2, 0x1

    aput-object v1, v4, v2

    const/4 v1, 0x2

    aput-object v0, v4, v1

    const-string v1, "Categories"

    sget-object v2, Lorg/dmfs/provider/tasks/handler/CategoryHandler;->CATEGORY_ID_PROJECTION:[Ljava/lang/String;

    const-string v3, "name=? and account_name=? and account_type=?"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    move-object v1, v0

    goto :goto_9b

    :cond_106
    :try_start_106
    const-string v0, "is_new_category"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {p7, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V
    :try_end_110
    .catchall {:try_start_106 .. :try_end_110} :catchall_111

    goto :goto_d7

    :catchall_111
    move-exception v0

    if-eqz v1, :cond_117

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_117
    throw v0
.end method
