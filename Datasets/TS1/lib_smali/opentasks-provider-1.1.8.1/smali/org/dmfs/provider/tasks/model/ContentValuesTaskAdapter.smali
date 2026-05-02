.class public Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;
.super Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;


# instance fields
.field private mId:J

.field private final mValues:Landroid/content/ContentValues;


# direct methods
.method public constructor <init>(JLandroid/content/ContentValues;)V
    .registers 4

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;-><init>()V

    iput-wide p1, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mId:J

    iput-object p3, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    return-void
.end method

.method public constructor <init>(Landroid/content/ContentValues;)V
    .registers 4

    const-wide/16 v0, -0x1

    invoke-direct {p0, v0, v1, p1}, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;-><init>(JLandroid/content/ContentValues;)V

    return-void
.end method


# virtual methods
.method public commit(Landroid/database/sqlite/SQLiteDatabase;)I
    .registers 8

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v1}, Landroid/content/ContentValues;->size()I

    move-result v1

    if-nez v1, :cond_d

    :cond_c
    :goto_c
    return v0

    :cond_d
    iget-wide v1, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mId:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_25

    const-string v1, "Tasks"

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-virtual {p1, v1, v5, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    iput-wide v1, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mId:J

    iget-wide v1, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mId:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_c

    const/4 v0, 0x1

    goto :goto_c

    :cond_25
    const-string v0, "Tasks"

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    goto :goto_c
.end method

.method public bridge synthetic duplicate()Lorg/dmfs/provider/tasks/model/EntityAdapter;
    .registers 2

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->duplicate()Lorg/dmfs/provider/tasks/model/TaskAdapter;

    move-result-object v0

    return-object v0
.end method

.method public duplicate()Lorg/dmfs/provider/tasks/model/TaskAdapter;
    .registers 4

    new-instance v0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;

    new-instance v1, Landroid/content/ContentValues;

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    invoke-direct {v0, v1}, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;-><init>(Landroid/content/ContentValues;)V

    return-object v0
.end method

.method public hasUpdates()Z
    .registers 2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v0}, Landroid/content/ContentValues;->size()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public id()J
    .registers 3

    iget-wide v0, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mId:J

    return-wide v0
.end method

.method public isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;",
            "Lorg/dmfs/provider/tasks/model/TaskAdapter;",
            ">;)Z"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->isSetIn(Landroid/content/ContentValues;)Z

    move-result v0

    return v0
.end method

.method public isWriteable()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public oldValueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;
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

    const/4 v0, 0x0

    return-object v0
.end method

.method public set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-interface {p1, v0, p2}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->setIn(Landroid/content/ContentValues;Ljava/lang/Object;)V

    return-void
.end method

.method public unset(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;",
            "Lorg/dmfs/provider/tasks/model/TaskAdapter;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->removeFrom(Landroid/content/ContentValues;)V

    return-void
.end method

.method public valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;
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

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->getFrom(Landroid/content/ContentValues;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
