.class public Lorg/dmfs/provider/tasks/handler/AlarmHandler;
.super Lorg/dmfs/provider/tasks/handler/PropertyHandler;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public insert(Landroid/database/sqlite/SQLiteDatabase;JLandroid/content/ContentValues;Z)J
    .registers 15

    const-wide/16 v4, -0x1

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v7, p4

    move v8, p5

    invoke-virtual/range {v0 .. v8}, Lorg/dmfs/provider/tasks/handler/AlarmHandler;->validateValues(Landroid/database/sqlite/SQLiteDatabase;JJZLandroid/content/ContentValues;Z)Landroid/content/ContentValues;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v5, p5

    invoke-super/range {v0 .. v5}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;->insert(Landroid/database/sqlite/SQLiteDatabase;JLandroid/content/ContentValues;Z)J

    move-result-wide v0

    return-wide v0
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

    invoke-virtual/range {v0 .. v8}, Lorg/dmfs/provider/tasks/handler/AlarmHandler;->validateValues(Landroid/database/sqlite/SQLiteDatabase;JJZLandroid/content/ContentValues;Z)Landroid/content/ContentValues;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-object/from16 v7, p7

    move/from16 v8, p8

    invoke-super/range {v0 .. v8}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;->update(Landroid/database/sqlite/SQLiteDatabase;JJLandroid/content/ContentValues;Landroid/database/Cursor;Z)I

    move-result v0

    return v0
.end method

.method public validateValues(Landroid/database/sqlite/SQLiteDatabase;JJZLandroid/content/ContentValues;Z)Landroid/content/ContentValues;
    .registers 11

    const-string v0, "property_id"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "_ID can not be set manually"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    const-string v0, "data0"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_20

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "alarm property requires a time offset"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_20
    const-string v0, "data1"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_34

    const-string v0, "data1"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-gez v0, :cond_3c

    :cond_34
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "alarm property requires a valid reference date "

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3c
    const-string v0, "data3"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "alarm property requires an alarm type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4c
    return-object p7
.end method
