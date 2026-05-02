.class public Lorg/dmfs/provider/tasks/processors/tasks/TaskValidatorProcessor;
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
.field private static final TASKLISTS_ID_SELECTION:Ljava/lang/String; = "_id="

.field private static final TASKLIST_ID_PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    sput-object v0, Lorg/dmfs/provider/tasks/processors/tasks/TaskValidatorProcessor;->TASKLIST_ID_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor;-><init>()V

    return-void
.end method

.method private verifyCommon(Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 9

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_10

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "_ID can not be set manually"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ACCOUNT_NAME:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_20

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ACCOUNT_NAME can not be set on a tasks"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_20
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ACCOUNT_TYPE:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_30

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ACCOUNT_TYPE can not be set on a tasks"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_30
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_COLOR:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_40

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "LIST_COLOR can not be set on a tasks"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_40
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->_DELETED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_50

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "modification of _DELETE is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_50
    if-nez p2, :cond_62

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->_UID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_62

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "modification of _UID is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_62
    if-nez p2, :cond_74

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->_DIRTY:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_74

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "modification of _DIRTY is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_74
    if-nez p2, :cond_86

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->CREATED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_86

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "modification of CREATED is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_86
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->IS_NEW:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_96

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "modification of IS_NEW is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_96
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->IS_CLOSED:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_a6

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "modification of IS_CLOSED is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a6
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->HAS_PROPERTIES:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_b6

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "modification of HAS_PROPERTIES is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_b6
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->HAS_ALARMS:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_c6

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "modification of HAS_ALARMS is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c6
    if-nez p2, :cond_d8

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LAST_MODIFIED:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_d8

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "modification of MODIFICATION_TIME is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d8
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_f0

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_f0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ORIGINAL_INSTANCE_SYNC_ID and ORIGINAL_INSTANCE_ID must not be specified at the same time"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f0
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->CLASSIFICATION:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_117

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->CLASSIFICATION:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_117

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ltz v1, :cond_10f

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_117

    :cond_10f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "CLASSIFICATION must be an integer between 0 and 2"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_117
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->PRIORITY:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_13f

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->PRIORITY:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_13f

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ltz v1, :cond_137

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x9

    if-le v0, v1, :cond_13f

    :cond_137
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "PRIORITY must be an integer between 0 and 9"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13f
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->PERCENT_COMPLETE:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_167

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->PERCENT_COMPLETE:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_167

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ltz v1, :cond_15f

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x64

    if-le v0, v1, :cond_167

    :cond_15f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "PERCENT_COMPLETE must be null or an integer between 0 and 100"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_167
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->STATUS:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_19f

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->STATUS:Lorg/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_19f

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ltz v1, :cond_186

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x3

    if-le v1, v2, :cond_19f

    :cond_186
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid STATUS: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_19f
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->DTSTART_RAW:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    sget-object v1, Lorg/dmfs/provider/tasks/model/TaskAdapter;->DUE_RAW:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {p1, v1}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    sget-object v2, Lorg/dmfs/provider/tasks/model/TaskAdapter;->DURATION:Lorg/dmfs/provider/tasks/model/adapters/DurationFieldAdapter;

    invoke-interface {p1, v2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/dmfs/rfc5545/Duration;

    if-eqz v0, :cond_1ec

    if-eqz v1, :cond_1c5

    if-eqz v2, :cond_1c5

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Only one of DUE or DURATION must be supplied."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1c5
    if-eqz v1, :cond_1db

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gez v2, :cond_1f6

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "DUE must not be < DTSTART"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1db
    if-eqz v2, :cond_1f6

    invoke-virtual {v2}, Lorg/dmfs/rfc5545/Duration;->getSign()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1f6

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "DURATION must not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1ec
    if-eqz v2, :cond_1f6

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "DURATION must not be supplied without DTSTART"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1f6
    if-nez v0, :cond_1fa

    if-eqz v1, :cond_218

    :cond_1fa
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->IS_ALLDAY:Lorg/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_218

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->TIMEZONE_RAW:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_218

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "TIMEZONE must be supplied if one of DTSTART or DUE is not null and not all-day"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_218
    return-void
.end method


# virtual methods
.method public bridge synthetic beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TaskValidatorProcessor;->beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 12

    const/4 v4, 0x0

    invoke-direct {p0, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TaskValidatorProcessor;->verifyCommon(Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->LIST_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-nez v0, :cond_16

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "LIST_ID is required on INSERT"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_16
    const-string v1, "Lists"

    sget-object v2, Lorg/dmfs/provider/tasks/processors/tasks/TaskValidatorProcessor;->TASKLIST_ID_PROJECTION:[Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v0, p1

    move-object v5, v4

    move-object v6, v4

    move-object v7, v4

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_3e

    :try_start_37
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_4d

    :cond_3e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "LIST_ID must refer to an existing TaskList"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_46
    .catchall {:try_start_37 .. :try_end_46} :catchall_46

    :catchall_46
    move-exception v0

    if-eqz v1, :cond_4c

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_4c
    throw v0

    :cond_4d
    if-eqz v1, :cond_52

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_52
    return-void
.end method

.method public bridge synthetic beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TaskValidatorProcessor;->beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 6

    invoke-direct {p0, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TaskValidatorProcessor;->verifyCommon(Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    if-nez p3, :cond_1d

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_15

    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->ORIGINAL_INSTANCE_SYNC_ID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_1d

    :cond_15
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ORIGINAL_INSTANCE_SYNC_ID and ORIGINAL_INSTANCE_ID can be modified by sync adapters only"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1d
    return-void
.end method
