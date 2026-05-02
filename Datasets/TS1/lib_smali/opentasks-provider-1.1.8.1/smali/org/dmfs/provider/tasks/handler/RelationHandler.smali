.class public Lorg/dmfs/provider/tasks/handler/RelationHandler;
.super Lorg/dmfs/provider/tasks/handler/PropertyHandler;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;-><init>()V

    return-void
.end method

.method private clearParentId(Landroid/database/sqlite/SQLiteDatabase;JLandroid/database/Cursor;)V
    .registers 12

    const/4 v6, 0x0

    const/4 v2, 0x1

    const-string v0, "data2"

    invoke-interface {p4, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p4, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->PARENT:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    invoke-virtual {v1}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->ordinal()I

    move-result v1

    if-ne v0, v1, :cond_37

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "parent_id"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v1, "Tasks"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v0, v2, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_36
    :goto_36
    return-void

    :cond_37
    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->CHILD:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    invoke-virtual {v1}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->ordinal()I

    move-result v1

    if-ne v0, v1, :cond_72

    const-string v0, "data1"

    invoke-interface {p4, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p4, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-nez v1, :cond_36

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v2, "parent_id"

    invoke-virtual {v1, v2}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v2, "Tasks"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p4, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v2, v1, v0, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_36

    :cond_72
    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->SIBLING:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    invoke-virtual {v1}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->ordinal()I

    move-result v1

    if-ne v0, v1, :cond_36

    goto :goto_36
.end method

.method private resolveFields(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)V
    .registers 7

    const-string v0, "data1"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    const-string v1, "data3"

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_20

    const-string v1, "data3"

    const-string v2, "_id"

    invoke-virtual {v0}, Ljava/lang/Long;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "_uid"

    invoke-direct {p0, p1, v2, v0, v3}, Lorg/dmfs/provider/tasks/handler/RelationHandler;->resolveTaskStringField(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1f
    :goto_1f
    return-void

    :cond_20
    if-eqz v1, :cond_1f

    const-string v0, "data1"

    const-string v2, "_uid"

    const-string v3, "_id"

    invoke-direct {p0, p1, v2, v1, v3}, Lorg/dmfs/provider/tasks/handler/RelationHandler;->resolveTaskLongField(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1f
.end method

.method private resolveTaskLongField(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Long;
    .registers 7

    invoke-direct {p0, p1, p2, p3, p4}, Lorg/dmfs/provider/tasks/handler/RelationHandler;->resolveTaskStringField(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private resolveTaskStringField(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 13

    const/4 v4, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    const-string v1, "Tasks"

    new-array v2, v4, [Ljava/lang/String;

    aput-object p4, v2, v6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "=?"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-array v4, v4, [Ljava/lang/String;

    aput-object p3, v4, v6

    move-object v0, p1

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_37

    :try_start_29
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_38

    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_33
    .catchall {:try_start_29 .. :try_end_33} :catchall_3c

    move-result-object v5

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_37
    :goto_37
    return-object v5

    :cond_38
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_37

    :catchall_3c
    move-exception v0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method private updateParentId(Landroid/database/sqlite/SQLiteDatabase;JLandroid/content/ContentValues;Landroid/database/Cursor;)V
    .registers 11

    const/4 v4, 0x0

    const/4 v3, 0x1

    const-string v0, "data2"

    invoke-virtual {p4, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4d

    const-string v0, "data2"

    invoke-virtual {p4, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_14
    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->PARENT:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    invoke-virtual {v1}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->ordinal()I

    move-result v1

    if-ne v0, v1, :cond_58

    const-string v0, "data1"

    invoke-virtual {p4, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4c

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, v3}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "parent_id"

    const-string v2, "data1"

    invoke-virtual {p4, v2}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "Tasks"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v0, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_4c
    :goto_4c
    return-void

    :cond_4d
    const-string v0, "data2"

    invoke-interface {p5, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    goto :goto_14

    :cond_58
    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->CHILD:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    invoke-virtual {v1}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->ordinal()I

    move-result v1

    if-ne v0, v1, :cond_95

    const-string v0, "data1"

    invoke-virtual {p4, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_4c

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, v3}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "parent_id"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "Tasks"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "data1"

    invoke-virtual {p4, v3}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v0, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_4c

    :cond_95
    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->SIBLING:Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;

    invoke-virtual {v1}, Lorg/dmfs/provider/tasks/TaskContract$Property$Relation$RelType;->ordinal()I

    move-result v1

    if-ne v0, v1, :cond_4c

    const-string v0, "data1"

    invoke-virtual {p4, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_4c

    const-string v0, "_id"

    const-string v1, "data1"

    invoke-virtual {p4, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "parent_id"

    invoke-direct {p0, p1, v0, v1, v2}, Lorg/dmfs/provider/tasks/handler/RelationHandler;->resolveTaskLongField(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1, v3}, Landroid/content/ContentValues;-><init>(I)V

    const-string v2, "parent_id"

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "Tasks"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_4c
.end method


# virtual methods
.method public delete(Landroid/database/sqlite/SQLiteDatabase;JJLandroid/database/Cursor;Z)I
    .registers 9

    invoke-direct {p0, p1, p2, p3, p6}, Lorg/dmfs/provider/tasks/handler/RelationHandler;->clearParentId(Landroid/database/sqlite/SQLiteDatabase;JLandroid/database/Cursor;)V

    invoke-super/range {p0 .. p7}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;->delete(Landroid/database/sqlite/SQLiteDatabase;JJLandroid/database/Cursor;Z)I

    move-result v0

    return v0
.end method

.method public insert(Landroid/database/sqlite/SQLiteDatabase;JLandroid/content/ContentValues;Z)J
    .registers 15

    const-wide/16 v4, -0x1

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v7, p4

    move v8, p5

    invoke-virtual/range {v0 .. v8}, Lorg/dmfs/provider/tasks/handler/RelationHandler;->validateValues(Landroid/database/sqlite/SQLiteDatabase;JJZLandroid/content/ContentValues;Z)Landroid/content/ContentValues;

    invoke-direct {p0, p1, p4}, Lorg/dmfs/provider/tasks/handler/RelationHandler;->resolveFields(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)V

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/provider/tasks/handler/RelationHandler;->updateParentId(Landroid/database/sqlite/SQLiteDatabase;JLandroid/content/ContentValues;Landroid/database/Cursor;)V

    invoke-super/range {p0 .. p5}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;->insert(Landroid/database/sqlite/SQLiteDatabase;JLandroid/content/ContentValues;Z)J

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

    invoke-virtual/range {v0 .. v8}, Lorg/dmfs/provider/tasks/handler/RelationHandler;->validateValues(Landroid/database/sqlite/SQLiteDatabase;JJZLandroid/content/ContentValues;Z)Landroid/content/ContentValues;

    invoke-direct {p0, p1, p6}, Lorg/dmfs/provider/tasks/handler/RelationHandler;->resolveFields(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)V

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p6

    move-object/from16 v5, p7

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/provider/tasks/handler/RelationHandler;->updateParentId(Landroid/database/sqlite/SQLiteDatabase;JLandroid/content/ContentValues;Landroid/database/Cursor;)V

    invoke-super/range {p0 .. p8}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;->update(Landroid/database/sqlite/SQLiteDatabase;JJLandroid/content/ContentValues;Landroid/database/Cursor;Z)I

    move-result v0

    return v0
.end method

.method public validateValues(Landroid/database/sqlite/SQLiteDatabase;JJZLandroid/content/ContentValues;Z)Landroid/content/ContentValues;
    .registers 12

    const-string v0, "data5"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "setting of RELATED_CONTENT_URI not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    const-string v0, "data1"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    const-string v1, "data3"

    invoke-virtual {p7, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "data4"

    invoke-virtual {p7, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v0, :cond_33

    if-nez v2, :cond_33

    if-eqz v1, :cond_33

    const-string v0, "data1"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v0, "data4"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    :goto_32
    return-object p7

    :cond_33
    if-nez v0, :cond_44

    if-nez v1, :cond_44

    if-eqz v2, :cond_44

    const-string v0, "data1"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v0, "data3"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_32

    :cond_44
    if-eqz v0, :cond_55

    if-nez v1, :cond_55

    if-nez v2, :cond_55

    const-string v0, "data4"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v0, "data3"

    invoke-virtual {p7, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_32

    :cond_55
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "exactly one of RELATED_ID, RELATED_UID and RELATED_URI must be non-null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
