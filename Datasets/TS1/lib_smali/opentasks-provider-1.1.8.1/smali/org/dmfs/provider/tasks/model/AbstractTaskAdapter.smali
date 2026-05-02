.class public abstract Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/provider/tasks/model/TaskAdapter;


# instance fields
.field private final mState:Landroid/content/ContentValues;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/content/ContentValues;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->mState:Landroid/content/ContentValues;

    return-void
.end method


# virtual methods
.method public getState(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;",
            "Lorg/dmfs/provider/tasks/model/TaskAdapter;",
            ">;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->mState:Landroid/content/ContentValues;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->getFrom(Landroid/content/ContentValues;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isRecurring()Z
    .registers 2

    sget-object v0, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->RRULE:Lorg/dmfs/provider/tasks/model/adapters/RRuleFieldAdapter;

    invoke-virtual {p0, v0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_10

    sget-object v0, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->RDATE:Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;

    invoke-virtual {p0, v0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public recurrenceUpdated()Z
    .registers 2

    sget-object v0, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->RRULE:Lorg/dmfs/provider/tasks/model/adapters/RRuleFieldAdapter;

    invoke-virtual {p0, v0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_30

    sget-object v0, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->DTSTART:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-virtual {p0, v0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_30

    sget-object v0, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->DUE:Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;

    invoke-virtual {p0, v0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_30

    sget-object v0, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->DURATION:Lorg/dmfs/provider/tasks/model/adapters/DurationFieldAdapter;

    invoke-virtual {p0, v0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_30

    sget-object v0, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->RDATE:Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;

    invoke-virtual {p0, v0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-nez v0, :cond_30

    sget-object v0, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->EXDATE:Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;

    invoke-virtual {p0, v0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z

    move-result v0

    if-eqz v0, :cond_32

    :cond_30
    const/4 v0, 0x1

    :goto_31
    return v0

    :cond_32
    const/4 v0, 0x0

    goto :goto_31
.end method

.method public setState(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;",
            "Lorg/dmfs/provider/tasks/model/TaskAdapter;",
            ">;TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->mState:Landroid/content/ContentValues;

    invoke-interface {p1, v0, p2}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->setIn(Landroid/content/ContentValues;Ljava/lang/Object;)V

    return-void
.end method

.method public uri(Ljava/lang/String;)Landroid/net/Uri;
    .registers 5

    invoke-static {p1}, Lorg/dmfs/provider/tasks/TaskContract$Tasks;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;->id()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method
