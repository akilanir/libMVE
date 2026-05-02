.class public Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;
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


# static fields
.field private static final SYNC_ID_SELECTION:Ljava/lang/String; = "_sync_id=?"

.field private static final TASK_ID_PROJECTION:[Ljava/lang/String;

.field private static final TASK_ID_SELECTION:Ljava/lang/String; = "_id=?"

.field private static final TASK_SYNC_ID_PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v2

    sput-object v0, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;->TASK_ID_PROJECTION:[Ljava/lang/String;

    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "_sync_id"

    aput-object v1, v0, v2

    sput-object v0, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;->TASK_SYNC_ID_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor;-><init>()V

    return-void
.end method

.method private updateFields(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 16

    const/16 v11, 0x64

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v5, 0x0

    if-nez p3, :cond_38

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->_DIRTY:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LAST_MODIFIED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    new-instance v1, Lorg/dmfs/rfc5545/DateTime;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lorg/dmfs/rfc5545/DateTime;-><init>(J)V

    invoke-interface {p2, v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->COMPLETED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_38

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->STATUS:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_38

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->STATUS:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    :cond_38
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->PRIORITY:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_55

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->PRIORITY:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_55

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_55

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->PRIORITY:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p2, v0, v5}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    :cond_55
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_14e

    new-array v4, v9, [Ljava/lang/String;

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    aput-object v0, v4, v8

    const-string v1, "Tasks"

    sget-object v2, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;->TASK_ID_PROJECTION:[Ljava/lang/String;

    const-string v3, "_sync_id=?"

    move-object v0, p1

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    :try_start_76
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_8a

    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {p2, v2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V
    :try_end_8a
    .catchall {:try_start_76 .. :try_end_8a} :catchall_147

    :cond_8a
    if-eqz v1, :cond_8f

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_8f
    :goto_8f
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->PERCENT_COMPLETE:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_d0

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->PERCENT_COMPLETE:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez p3, :cond_195

    if-eqz v0, :cond_195

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v11, :cond_195

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->STATUS:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_ba

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->STATUS:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    :cond_ba
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->COMPLETED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_d0

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->COMPLETED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    new-instance v1, Lorg/dmfs/rfc5545/DateTime;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lorg/dmfs/rfc5545/DateTime;-><init>(J)V

    invoke-interface {p2, v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    :cond_d0
    :goto_d0
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->STATUS:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_e2

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_146

    :cond_e2
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->STATUS:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_f5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Lorg/dmfs/provider/tasks/model/TaskAdapter;->STATUS:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p2, v1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    :cond_f5
    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->IS_NEW:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    if-eqz v0, :cond_ff

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_1a8

    :cond_ff
    move v1, v9

    :goto_100
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p2, v2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v1, Lorg/dmfs/provider/tasks/model/TaskAdapter;->IS_CLOSED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    if-eqz v0, :cond_1ab

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v2, v10, :cond_118

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1ab

    :cond_118
    :goto_118
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {p2, v1, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v10, :cond_1ae

    if-nez p3, :cond_1ae

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->PERCENT_COMPLETE:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->COMPLETED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_146

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->COMPLETED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    new-instance v1, Lorg/dmfs/rfc5545/DateTime;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lorg/dmfs/rfc5545/DateTime;-><init>(J)V

    invoke-interface {p2, v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    :cond_146
    :goto_146
    return-void

    :catchall_147
    move-exception v0

    if-eqz v1, :cond_14d

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_14d
    throw v0

    :cond_14e
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_8f

    new-array v4, v9, [Ljava/lang/String;

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v8

    const-string v1, "Tasks"

    sget-object v2, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;->TASK_SYNC_ID_PROJECTION:[Ljava/lang/String;

    const-string v3, "_id=?"

    move-object v0, p1

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    :try_start_177
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_187

    const/4 v0, 0x0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V
    :try_end_187
    .catchall {:try_start_177 .. :try_end_187} :catchall_18e

    :cond_187
    if-eqz v1, :cond_8f

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto/16 :goto_8f

    :catchall_18e
    move-exception v0

    if-eqz v1, :cond_194

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_194
    throw v0

    :cond_195
    if-nez p3, :cond_d0

    if-eqz v0, :cond_d0

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->COMPLETED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_d0

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->COMPLETED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p2, v0, v5}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    goto/16 :goto_d0

    :cond_1a8
    move v1, v8

    goto/16 :goto_100

    :cond_1ab
    move v9, v8

    goto/16 :goto_118

    :cond_1ae
    if-nez p3, :cond_146

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->COMPLETED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p2, v0, v5}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    goto :goto_146
.end method


# virtual methods
.method public bridge synthetic afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;->afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 10

    const/4 v4, 0x1

    if-eqz p3, :cond_2f

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isRecurring()Z

    move-result v0

    if-eqz v0, :cond_2f

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1, v4}, Landroid/content/ContentValues;-><init>(I)V

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;->setIn(Landroid/content/ContentValues;Ljava/lang/Long;)V

    const-string v2, "Tasks"

    const-string v3, "original_instance_sync_id=? and original_instance_id is null"

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    aput-object v0, v4, v5

    invoke-virtual {p1, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_2f
    return-void
.end method

.method public bridge synthetic afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;->afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 9

    if-eqz p3, :cond_40

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isRecurring()Z

    move-result v0

    if-eqz v0, :cond_40

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_40

    new-instance v1, Landroid/content/ContentValues;

    const/4 v0, 0x1

    invoke-direct {v1, v0}, Landroid/content/ContentValues;-><init>(I)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;->setIn(Landroid/content/ContentValues;Ljava/lang/String;)V

    const-string v0, "Tasks"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "original_instance_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_40
    return-void
.end method

.method public bridge synthetic beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;->beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 8

    invoke-direct {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;->updateFields(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    if-nez p3, :cond_13

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->CREATED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    new-instance v1, Lorg/dmfs/rfc5545/DateTime;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lorg/dmfs/rfc5545/DateTime;-><init>(J)V

    invoke-interface {p2, v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    :cond_13
    return-void
.end method

.method public bridge synthetic beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;->beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;->updateFields(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method
