.class public Lorg/dmfs/provider/tasks/processors/tasks/TestProcessor;
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


# virtual methods
.method public bridge synthetic afterDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TestProcessor;->afterDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public afterDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 8

    const-string v0, "TestProcessor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "after delete processor called for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TestProcessor;->afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 8

    const-string v0, "TestProcessor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "after insert processor called for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TestProcessor;->afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 8

    const-string v0, "TestProcessor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "after update processor called for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic beforeDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TestProcessor;->beforeDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public beforeDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 8

    const-string v0, "TestProcessor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "before delete processor called for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TestProcessor;->beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public beforeInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 6

    const-string v0, "TestProcessor"

    const-string v1, "before insert processor called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/TestProcessor;->beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public beforeUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 8

    const-string v0, "TestProcessor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "before update processor called for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
