.class final Lorg/dmfs/provider/tasks/ContentOperation$3;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/provider/tasks/ContentOperation$OperationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/provider/tasks/ContentOperation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getLastAlarmTimestamp(Landroid/content/Context;)Lorg/dmfs/rfc5545/DateTime;
    .registers 8

    const-string v0, "org.dmfs.provider.tasks"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Lorg/dmfs/rfc5545/DateTime;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v2

    const-string v3, "org.dmfs.provider.tasks.prefs.LAST_ALARM_TIMESTAMP"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-direct {v1, v2, v3, v4}, Lorg/dmfs/rfc5545/DateTime;-><init>(Ljava/util/TimeZone;J)V

    return-object v1
.end method

.method private saveLastAlarmTime(Landroid/content/Context;Lorg/dmfs/rfc5545/DateTime;)V
    .registers 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    const-string v0, "org.dmfs.provider.tasks"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "org.dmfs.provider.tasks.prefs.LAST_ALARM_TIMESTAMP"

    invoke-virtual {p2}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-lt v1, v2, :cond_1e

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_1d
    return-void

    :cond_1e
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_1d
.end method


# virtual methods
.method public handleOperation(Landroid/content/Context;Landroid/net/Uri;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)V
    .registers 18

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v11

    invoke-direct {p0, p1}, Lorg/dmfs/provider/tasks/ContentOperation$3;->getLastAlarmTimestamp(Landroid/content/Context;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    invoke-static {}, Lorg/dmfs/rfc5545/DateTime;->nowAndHere()Lorg/dmfs/rfc5545/DateTime;

    move-result-object v9

    invoke-virtual {v9, v0}, Lorg/dmfs/rfc5545/DateTime;->before(Lorg/dmfs/rfc5545/DateTime;)Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-direct {p0, p1, v9}, Lorg/dmfs/provider/tasks/ContentOperation$3;->saveLastAlarmTime(Landroid/content/Context;Lorg/dmfs/rfc5545/DateTime;)V

    move-object v0, v9

    :cond_16
    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v12

    const/4 v10, 0x0

    const-string v1, "Instance_View"

    const/4 v2, 0x0

    const-string v3, "instance_start_sorting>? and is_closed = 0 and _deleted=0"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object v12, v4, v0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "instance_start_sorting"

    const-string v8, "1"

    move-object/from16 v0, p3

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    :try_start_36
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_5f

    new-instance v0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->INSTANCE_TASK_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-virtual {v2, v1}, Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;->getFrom(Landroid/database/Cursor;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/4 v4, 0x0

    invoke-direct {v0, v2, v3, v1, v4}, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;-><init>(JLandroid/database/Cursor;Landroid/content/ContentValues;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->INSTANCE_START:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {v0, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/DateTime;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v2

    if-nez v2, :cond_c7

    invoke-virtual {v0, v11}, Lorg/dmfs/rfc5545/DateTime;->shiftTimeZone(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;
    :try_end_5d
    .catchall {:try_start_36 .. :try_end_5d} :catchall_b9

    move-result-object v0

    move-object v10, v0

    :cond_5f
    :goto_5f
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    const-string v1, "Instance_View"

    const/4 v2, 0x0

    const-string v3, "instance_due_sorting>? and is_closed = 0 and _deleted=0"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object v12, v4, v0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "instance_due_sorting"

    const-string v8, "1"

    move-object/from16 v0, p3

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    :try_start_79
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_b0

    new-instance v0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->INSTANCE_TASK_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-virtual {v2, v1}, Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;->getFrom(Landroid/database/Cursor;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/4 v4, 0x0

    invoke-direct {v0, v2, v3, v1, v4}, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;-><init>(JLandroid/database/Cursor;Landroid/content/ContentValues;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->INSTANCE_DUE:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {v0, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/DateTime;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v2

    if-nez v2, :cond_a1

    invoke-virtual {v0, v11}, Lorg/dmfs/rfc5545/DateTime;->shiftTimeZone(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    :cond_a1
    if-eqz v10, :cond_af

    invoke-virtual {v10}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v2

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J
    :try_end_aa
    .catchall {:try_start_79 .. :try_end_aa} :catchall_be

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_b0

    :cond_af
    move-object v10, v0

    :cond_b0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    if-eqz v10, :cond_c3

    invoke-static {p1, v10}, Lorg/dmfs/provider/tasks/TaskProviderBroadcastReceiver;->planNotificationUpdate(Landroid/content/Context;Lorg/dmfs/rfc5545/DateTime;)V

    :goto_b8
    return-void

    :catchall_b9
    move-exception v0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw v0

    :catchall_be
    move-exception v0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_c3
    invoke-direct {p0, p1, v9}, Lorg/dmfs/provider/tasks/ContentOperation$3;->saveLastAlarmTime(Landroid/content/Context;Lorg/dmfs/rfc5545/DateTime;)V

    goto :goto_b8

    :cond_c7
    move-object v10, v0

    goto :goto_5f
.end method
