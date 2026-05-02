.class final Lorg/dmfs/provider/tasks/ContentOperation$2;
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

.method private sendBroadcast(Landroid/content/Context;Ljava/lang/String;Landroid/net/Uri;Lorg/dmfs/rfc5545/DateTime;Ljava/lang/String;)V
    .registers 10

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string v1, "org.dmfs.provider.tasks.extra.TIMESTAMP"

    invoke-virtual {p4}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v1, "org.dmfs.provider.tasks.extra.ALLDAY"

    invoke-virtual {p4}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p4}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v1

    if-nez v1, :cond_2d

    const-string v1, "org.dmfs.provider.tasks.extra.TIMEZONE"

    invoke-virtual {p4}, Lorg/dmfs/rfc5545/DateTime;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_2d
    const-string v1, "org.dmfs.provider.tasks.extra.TITLE"

    invoke-virtual {v0, v1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public handleOperation(Landroid/content/Context;Landroid/net/Uri;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)V
    .registers 18

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v8

    invoke-direct {p0, p1}, Lorg/dmfs/provider/tasks/ContentOperation$2;->getLastAlarmTimestamp(Landroid/content/Context;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v9

    invoke-static {}, Lorg/dmfs/rfc5545/DateTime;->nowAndHere()Lorg/dmfs/rfc5545/DateTime;

    move-result-object v10

    invoke-virtual {v9}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    const-string v1, "Instance_View"

    const/4 v2, 0x0

    const-string v3, "((instance_due_sorting>? and instance_due_sorting<=?) or (instance_start_sorting>? and instance_start_sorting<=?)) and is_closed = 0 and _deleted=0"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v0, v4, v6

    const/4 v6, 0x1

    aput-object v5, v4, v6

    const/4 v6, 0x2

    aput-object v0, v4, v6

    const/4 v0, 0x3

    aput-object v5, v4, v0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v0, p3

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    :cond_39
    :goto_39
    :try_start_39
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_e4

    new-instance v1, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->INSTANCE_TASK_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-virtual {v0, v7}, Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;->getFrom(Landroid/database/Cursor;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/4 v0, 0x0

    invoke-direct {v1, v2, v3, v7, v0}, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;-><init>(JLandroid/database/Cursor;Landroid/content/ContentValues;)V

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->INSTANCE_DUE:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {v1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/DateTime;

    if-eqz v0, :cond_f3

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v2

    if-nez v2, :cond_f3

    invoke-virtual {v0, v8}, Lorg/dmfs/rfc5545/DateTime;->shiftTimeZone(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    move-object v4, v0

    :goto_64
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->INSTANCE_START:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {v1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/DateTime;

    if-eqz v0, :cond_f1

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v2

    if-nez v2, :cond_f1

    invoke-virtual {v0, v8}, Lorg/dmfs/rfc5545/DateTime;->shiftTimeZone(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    move-object v6, v0

    :goto_79
    if-eqz v4, :cond_b0

    invoke-virtual {v9}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v2

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v11

    cmp-long v0, v2, v11

    if-gez v0, :cond_b0

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v2

    invoke-virtual {v10}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v11

    cmp-long v0, v2, v11

    if-gtz v0, :cond_b0

    const-string v2, "org.dmfs.android.tasks.TASK_DUE"

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->uri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->TITLE:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {v1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/provider/tasks/ContentOperation$2;->sendBroadcast(Landroid/content/Context;Ljava/lang/String;Landroid/net/Uri;Lorg/dmfs/rfc5545/DateTime;Ljava/lang/String;)V
    :try_end_aa
    .catchall {:try_start_39 .. :try_end_aa} :catchall_ab

    goto :goto_39

    :catchall_ab
    move-exception v0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_b0
    if-eqz v6, :cond_39

    :try_start_b2
    invoke-virtual {v9}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v2

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-gez v0, :cond_39

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v2

    invoke-virtual {v10}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v4

    cmp-long v0, v2, v4

    if-gtz v0, :cond_39

    const-string v2, "org.dmfs.android.tasks.TASK_START"

    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->uri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->TITLE:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {v1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move-object v4, v6

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/provider/tasks/ContentOperation$2;->sendBroadcast(Landroid/content/Context;Ljava/lang/String;Landroid/net/Uri;Lorg/dmfs/rfc5545/DateTime;Ljava/lang/String;)V
    :try_end_e2
    .catchall {:try_start_b2 .. :try_end_e2} :catchall_ab

    goto/16 :goto_39

    :cond_e4
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    invoke-direct {p0, p1, v10}, Lorg/dmfs/provider/tasks/ContentOperation$2;->saveLastAlarmTime(Landroid/content/Context;Lorg/dmfs/rfc5545/DateTime;)V

    sget-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->UPDATE_NOTIFICATION_ALARM:Lorg/dmfs/provider/tasks/ContentOperation;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/dmfs/provider/tasks/ContentOperation;->fire(Landroid/content/Context;Landroid/content/ContentValues;)V

    return-void

    :cond_f1
    move-object v6, v0

    goto :goto_79

    :cond_f3
    move-object v4, v0

    goto/16 :goto_64
.end method
