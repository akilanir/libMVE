.class public Lorg/dmfs/provider/tasks/processors/tasks/RelationProcessor;
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

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/RelationProcessor;->afterDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public afterDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 10

    if-nez p3, :cond_3

    :goto_2
    return-void

    :cond_3
    const-string v0, "Properties"

    const-string v1, "mimetype= ? AND data1=?"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "vnd.android.cursor.item/relation"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_2
.end method

.method public bridge synthetic afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/RelationProcessor;->afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public afterInsert(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 12

    const/4 v7, 0x1

    if-nez p3, :cond_4

    :cond_3
    :goto_3
    return-void

    :cond_4
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->_UID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_3

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1, v7}, Landroid/content/ContentValues;-><init>(I)V

    const-string v2, "data1"

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v2, "Properties"

    const-string v3, "mimetype= ? AND data3=?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "vnd.android.cursor.item/relation"

    aput-object v6, v4, v5

    aput-object v0, v4, v7

    invoke-virtual {p1, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_3
.end method

.method public bridge synthetic afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 4

    check-cast p2, Lorg/dmfs/provider/tasks/model/TaskAdapter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/processors/tasks/RelationProcessor;->afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V

    return-void
.end method

.method public afterUpdate(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/TaskAdapter;Z)V
    .registers 11

    const/4 v6, 0x1

    if-nez p3, :cond_4

    :cond_3
    :goto_3
    return-void

    :cond_4
    sget-object v0, Lorg/dmfs/provider/tasks/model/TaskAdapter;->_UID:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {p2, v0}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_3

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1, v6}, Landroid/content/ContentValues;-><init>(I)V

    const-string v2, "data3"

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Properties"

    const-string v2, "mimetype= ? AND data1=?"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "vnd.android.cursor.item/relation"

    aput-object v5, v3, v4

    invoke-interface {p2}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_3
.end method
