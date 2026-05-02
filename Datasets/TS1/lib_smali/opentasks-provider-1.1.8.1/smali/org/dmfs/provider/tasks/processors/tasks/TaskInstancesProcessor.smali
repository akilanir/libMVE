.class public Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;
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
.field private static final UPDATE_REQUESTED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter",
            "<",
            "Lorg/dmfs/provider/tasks/model/TaskAdapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    const-string v1, "org.dmfs.tasks.TaskInstanceProcessor.UPDATE_REQUESTED"

    invoke-direct {v0, v1}, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->UPDATE_REQUESTED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor;-><init>()V

    return-void
.end method

.method public static addUpdateRequest(Landroid/content/ContentValues;)V
    .registers 3

    sget-object v0, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->UPDATE_REQUESTED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;->setIn(Landroid/content/ContentValues;Ljava/lang/Boolean;)V

    return-void
.end method

.method private createInstances(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;)V
    .registers 7

    invoke-direct {p0, p2}, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->generateInstanceValues(Lorg/dmfs/provider/tasks/model/TaskAdapter;)Landroid/content/ContentValues;

    move-result-object v0

    const-string v1, "task_id"

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "Instances"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    return-void
.end method

.method private generateInstanceValues(Lorg/dmfs/provider/tasks/model/TaskAdapter;)Landroid/content/ContentValues;
    .registers 11

    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->DTSTART:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/DateTime;

    sget-object v1, Lorg/dmfs/provider/tasks/model/TaskAdapter;->DUE:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p1, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/dmfs/rfc5545/DateTime;

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->DURATION:Lorg/dmfs/provider/tasks/model/adapters/DurationFieldAdapter;

    invoke-interface {p1, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/dmfs/rfc5545/Duration;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    if-eqz v0, :cond_84

    const-string v3, "instance_start"

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v5, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v7, "instance_start_sorting"

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v3

    if-eqz v3, :cond_7b

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v3

    :goto_3c
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v5, v7, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :goto_43
    if-eqz v1, :cond_9e

    const-string v2, "instance_due"

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v5, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v4, "instance_due_sorting"

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v2

    if-eqz v2, :cond_8f

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v2

    :goto_5e
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v5, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    if-eqz v0, :cond_98

    const-string v2, "instance_duration"

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v3

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v0

    sub-long v0, v3, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v5, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :goto_7a
    return-object v5

    :cond_7b
    invoke-virtual {v0, v6}, Lorg/dmfs/rfc5545/DateTime;->shiftTimeZone(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v3

    invoke-virtual {v3}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v3

    goto :goto_3c

    :cond_84
    const-string v3, "instance_start"

    invoke-virtual {v5, v3}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v3, "instance_start_sorting"

    invoke-virtual {v5, v3}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_43

    :cond_8f
    invoke-virtual {v1, v6}, Lorg/dmfs/rfc5545/DateTime;->shiftTimeZone(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v2

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v2

    goto :goto_5e

    :cond_98
    const-string v0, "instance_duration"

    invoke-virtual {v5, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_7a

    :cond_9e
    if-eqz v2, :cond_f2

    if-eqz v0, :cond_e2

    invoke-virtual {v0, v2}, Lorg/dmfs/rfc5545/DateTime;->addDuration(Lorg/dmfs/rfc5545/Duration;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v3

    const-string v1, "instance_due"

    invoke-virtual {v3}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v5, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v4, "instance_due_sorting"

    invoke-virtual {v3}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v1

    if-eqz v1, :cond_d9

    invoke-virtual {v3}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v1

    :goto_bf
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v5, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "instance_duration"

    invoke-virtual {v3}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v6

    sub-long/2addr v2, v6

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v5, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_7a

    :cond_d9
    invoke-virtual {v3, v6}, Lorg/dmfs/rfc5545/DateTime;->shiftTimeZone(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v1

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v1

    goto :goto_bf

    :cond_e2
    const-string v0, "instance_duration"

    invoke-virtual {v5, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v0, "instance_due"

    invoke-virtual {v5, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v0, "instance_due_sorting"

    invoke-virtual {v5, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_7a

    :cond_f2
    const-string v0, "instance_duration"

    invoke-virtual {v5, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v0, "instance_due"

    invoke-virtual {v5, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v0, "instance_due_sorting"

    invoke-virtual {v5, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto/16 :goto_7a
.end method

.method private updateInstances(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;)V
    .registers 8

    invoke-direct {p0, p2}, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->generateInstanceValues(Lorg/dmfs/provider/tasks/model/TaskAdapter;)Landroid/content/ContentValues;

    move-result-object v0

    const-string v1, "Instances"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "task_id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public bridge synthetic afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->createInstances(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;)V

    return-void
.end method

.method public bridge synthetic afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 5

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->DTSTART:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_27

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->DUE:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_27

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->DURATION:Lorg/dmfs/provider/tasks/model/adapters/DurationFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_27

    sget-object v0, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->UPDATE_REQUESTED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->getState(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_27

    :goto_26
    return-void

    :cond_27
    invoke-direct {p0, p1, p2}, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->updateInstances(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;)V

    goto :goto_26
.end method

.method public bridge synthetic beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 6

    sget-object v0, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->UPDATE_REQUESTED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_18

    sget-object v0, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->UPDATE_REQUESTED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    sget-object v1, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->UPDATE_REQUESTED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {p2, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->setState(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v0, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;->UPDATE_REQUESTED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->unset(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)V

    :cond_18
    return-void
.end method
