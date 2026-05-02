.class final enum Lorg/dmfs/provider/tasks/ProviderOperation$3;
.super Lorg/dmfs/provider/tasks/ProviderOperation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/provider/tasks/ProviderOperation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/dmfs/provider/tasks/ProviderOperation;-><init>(Ljava/lang/String;ILorg/dmfs/provider/tasks/ProviderOperation$1;)V

    return-void
.end method


# virtual methods
.method executeAfterProcessor(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/processors/EntityProcessor;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/dmfs/provider/tasks/model/EntityAdapter",
            "<*>;>(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lorg/dmfs/provider/tasks/processors/EntityProcessor",
            "<TT;>;TT;Z)V"
        }
    .end annotation

    invoke-interface {p2, p1, p3, p4}, Lorg/dmfs/provider/tasks/processors/EntityProcessor;->afterDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V

    return-void
.end method

.method executeBeforeProcessor(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/processors/EntityProcessor;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/dmfs/provider/tasks/model/EntityAdapter",
            "<*>;>(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lorg/dmfs/provider/tasks/processors/EntityProcessor",
            "<TT;>;TT;Z)V"
        }
    .end annotation

    invoke-interface {p2, p1, p3, p4}, Lorg/dmfs/provider/tasks/processors/EntityProcessor;->beforeDelete(Landroid/database/sqlite/SQLiteDatabase;Lorg/dmfs/provider/tasks/model/EntityAdapter;Z)V

    return-void
.end method
