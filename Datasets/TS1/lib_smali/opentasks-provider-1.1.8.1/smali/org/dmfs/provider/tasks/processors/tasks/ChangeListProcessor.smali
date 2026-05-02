.class public Lorg/dmfs/provider/tasks/processors/tasks/ChangeListProcessor;
.super Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor",
        "<",
        "Lorg/dmfs/provider/tasks/model/TaskAdapter;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor;-><init>()V

    return-void
.end method

.method private moveTask(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;JJLjava/lang/Long;Z)Ljava/lang/Long;
    .registers 14

    const/4 v4, 0x1

    const/4 v1, 0x0

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1a

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1a

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC_VERSION:Lorg/dmfs/provider/tasks/model/adapters/BinaryFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_b2

    :cond_1a
    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->duplicate()Lorg/dmfs/provider/tasks/model/TaskAdapter;

    move-result-object v0

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {v0, v2, p7}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->_DELETED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_COLOR:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {v0, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->unset(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_NAME:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {v0, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->unset(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ACCOUNT_NAME:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {v0, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->unset(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ACCOUNT_TYPE:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {v0, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->unset(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_OWNER:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {v0, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->unset(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_ACCESS_LEVEL:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {v0, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->unset(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_VISIBLE:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {v0, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->unset(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)V

    invoke-interface {v0, p1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->commit(Landroid/database/sqlite/SQLiteDatabase;)I

    invoke-interface {v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :goto_63
    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->_DIRTY:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC1:Lorg/dmfs/provider/tasks/model/adapters/BinaryFieldAdapter;

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC2:Lorg/dmfs/provider/tasks/model/adapters/BinaryFieldAdapter;

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC3:Lorg/dmfs/provider/tasks/model/adapters/BinaryFieldAdapter;

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC4:Lorg/dmfs/provider/tasks/model/adapters/BinaryFieldAdapter;

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC5:Lorg/dmfs/provider/tasks/model/adapters/BinaryFieldAdapter;

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC6:Lorg/dmfs/provider/tasks/model/adapters/BinaryFieldAdapter;

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC7:Lorg/dmfs/provider/tasks/model/adapters/BinaryFieldAdapter;

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC8:Lorg/dmfs/provider/tasks/model/adapters/BinaryFieldAdapter;

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC_VERSION:Lorg/dmfs/provider/tasks/model/adapters/BinaryFieldAdapter;

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    if-eqz p8, :cond_b1

    invoke-interface {p2, p1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->commit(Landroid/database/sqlite/SQLiteDatabase;)I

    :cond_b1
    return-object v0

    :cond_b2
    move-object v0, v1

    goto :goto_63
.end method


# virtual methods
.method public bridge synthetic beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/ChangeListProcessor;->beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 20

    if-eqz p3, :cond_3

    :cond_2
    :goto_2
    return-void

    :cond_3
    sget-object v1, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    move-object/from16 v0, p2

    invoke-interface {v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v1, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    move-object/from16 v0, p2

    invoke-interface {v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->oldValueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    sget-object v1, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    move-object/from16 v0, p2

    invoke-interface {v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    cmp-long v1, v11, v13

    if-eqz v1, :cond_2

    const/4 v9, 0x0

    sget-object v1, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    move-object/from16 v0, p2

    invoke-interface {v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_42

    sget-object v1, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    move-object/from16 v0, p2

    invoke-interface {v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_111

    :cond_42
    sget-object v1, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    move-object/from16 v0, p2

    invoke-interface {v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Ljava/lang/Long;

    if-eqz v10, :cond_133

    const-string v2, "Tasks"

    const/4 v3, 0x0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    :try_start_6f
    invoke-interface {v15}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_130

    new-instance v3, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;

    new-instance v1, Landroid/content/ContentValues;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    invoke-direct {v3, v15, v1}, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;-><init>(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    const/4 v8, 0x0

    const/4 v9, 0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-wide v4, v11

    move-wide v6, v13

    invoke-direct/range {v1 .. v9}, Lorg/dmfs/provider/tasks/processors/tasks/ChangeListProcessor;->moveTask(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;JJLjava/lang/Long;Z)Ljava/lang/Long;
    :try_end_8c
    .catchall {:try_start_6f .. :try_end_8c} :catchall_10c

    move-result-object v1

    :goto_8d
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    move-object v8, v1

    :goto_91
    const/4 v9, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-wide v4, v11

    move-wide v6, v13

    invoke-direct/range {v1 .. v9}, Lorg/dmfs/provider/tasks/processors/tasks/ChangeListProcessor;->moveTask(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;JJLjava/lang/Long;Z)Ljava/lang/Long;

    move-object v1, v10

    move-object v10, v8

    :goto_9f
    invoke-interface/range {p2 .. p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isRecurring()Z

    move-result v2

    if-nez v2, :cond_af

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    move-object/from16 v0, p2

    invoke-interface {v0, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    :cond_af
    const-string v2, "Tasks"

    const/4 v3, 0x0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "original_instance_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " and "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "_id"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "!="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface/range {p2 .. p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    :goto_e9
    :try_start_e9
    invoke-interface {v15}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_12b

    new-instance v3, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;

    new-instance v1, Landroid/content/ContentValues;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    invoke-direct {v3, v15, v1}, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;-><init>(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    const/4 v9, 0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-wide v4, v11

    move-wide v6, v13

    move-object v8, v10

    invoke-direct/range {v1 .. v9}, Lorg/dmfs/provider/tasks/processors/tasks/ChangeListProcessor;->moveTask(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;JJLjava/lang/Long;Z)Ljava/lang/Long;
    :try_end_106
    .catchall {:try_start_e9 .. :try_end_106} :catchall_107

    goto :goto_e9

    :catchall_107
    move-exception v1

    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    throw v1

    :catchall_10c
    move-exception v1

    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    throw v1

    :cond_111
    invoke-interface/range {p2 .. p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-wide v4, v11

    move-wide v6, v13

    invoke-direct/range {v1 .. v9}, Lorg/dmfs/provider/tasks/processors/tasks/ChangeListProcessor;->moveTask(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;JJLjava/lang/Long;Z)Ljava/lang/Long;

    move-result-object v8

    move-object v1, v10

    move-object v10, v8

    goto/16 :goto_9f

    :cond_12b
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    goto/16 :goto_2

    :cond_130
    move-object v1, v9

    goto/16 :goto_8d

    :cond_133
    move-object v8, v9

    goto/16 :goto_91
.end method
