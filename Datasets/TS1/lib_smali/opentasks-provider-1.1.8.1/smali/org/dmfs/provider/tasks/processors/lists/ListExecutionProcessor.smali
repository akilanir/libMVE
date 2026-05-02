.class public Lorg/dmfs/provider/tasks/processors/lists/ListExecutionProcessor;
.super Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor",
        "<",
        "Lorg/dmfs/provider/tasks/model/ListAdapter;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/processors/AbstractEntityProcessor;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic beforeDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/ListAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/lists/ListExecutionProcessor;->beforeDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V

    return-void
.end method

.method public beforeDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V
    .registers 8

    const-string v0, "Lists"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/ListAdapter;->id()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/ListAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/lists/ListExecutionProcessor;->beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V

    return-void
.end method

.method public beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V
    .registers 4

    invoke-interface {p2, p1}, Lorg/dmfs/provider/tasks/model/ListAdapter;->commit(Landroid/database/sqlite/SQLiteDatabase;)I

    return-void
.end method

.method public bridge synthetic beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/ListAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/lists/ListExecutionProcessor;->beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V

    return-void
.end method

.method public beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/ListAdapter;Z)V
    .registers 4

    invoke-interface {p2, p1}, Lorg/dmfs/provider/tasks/model/ListAdapter;->commit(Landroid/database/sqlite/SQLiteDatabase;)I

    return-void
.end method
