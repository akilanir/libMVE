.class public Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;
.super Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;


# instance fields
.field private final mCursor:Landroid/database/Cursor;

.field private final mId:J

.field private final mValues:Landroid/content/ContentValues;


# direct methods
.method public constructor <init>(JLandroid/database/Cursor;Landroid/content/ContentValues;)V
    .registers 5

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;-><init>()V

    iput-wide p1, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mId:J

    iput-object p3, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mCursor:Landroid/database/Cursor;

    iput-object p4, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;Landroid/content/ContentValues;)V
    .registers 5

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/model/AbstractTaskAdapter;-><init>()V

    if-nez p1, :cond_16

    sget-object v0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-virtual {v0, p2}, Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;->existsIn(Landroid/content/ContentValues;)Z

    move-result v0

    if-nez v0, :cond_16

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mId:J

    :goto_11
    iput-object p1, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mCursor:Landroid/database/Cursor;

    iput-object p2, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    return-void

    :cond_16
    sget-object v0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-virtual {v0, p1}, Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;->getFrom(Landroid/database/Cursor;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mId:J

    goto :goto_11
.end method


# virtual methods
.method public commit(Landroid/database/sqlite/SQLiteDatabase;)I
    .registers 7

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v0}, Landroid/content/ContentValues;->size()I

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_9
    return v0

    :cond_a
    const-string v0, "Tasks"

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    goto :goto_9
.end method

.method public bridge synthetic duplicate()Lorg/dmfs/provider/tasks/model/EntityAdapter;
    .registers 2

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->duplicate()Lorg/dmfs/provider/tasks/model/TaskAdapter;

    move-result-object v0

    return-object v0
.end method

.method public duplicate()Lorg/dmfs/provider/tasks/model/TaskAdapter;
    .registers 6

    new-instance v1, Landroid/content/ContentValues;

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-direct {v1, v0}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    const/4 v0, 0x0

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->getColumnCount()I

    move-result v2

    :goto_e
    if-ge v0, v2, :cond_30

    iget-object v3, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2d

    const-string v4, "_id"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2d

    iget-object v4, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v4, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2d
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_30
    new-instance v0, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;

    invoke-direct {v0, v1}, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;-><init>(Landroid/content/ContentValues;)V

    return-object v0
.end method

.method public hasUpdates()Z
    .registers 2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v0}, Landroid/content/ContentValues;->size()I

    move-result v0

    if-lez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public id()J
    .registers 3

    iget-wide v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mId:J

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

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->isSetIn(Landroid/content/ContentValues;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isWriteable()Z
    .registers 2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
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

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->getFrom(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v0

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

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

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

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->removeFrom(Landroid/content/ContentValues;)V

    return-void
.end method

.method public valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;
    .registers 4
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

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    if-nez v0, :cond_b

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->getFrom(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mCursor:Landroid/database/Cursor;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;->mValues:Landroid/content/ContentValues;

    invoke-interface {p1, v0, v1}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->getFrom(Landroid/database/Cursor;Landroid/content/ContentValues;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_a
.end method
