.class Lorg/dmfs/provider/tasks/ContentOperation$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/dmfs/provider/tasks/ContentOperation;->run(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/dmfs/provider/tasks/ContentOperation;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$db:Landroid/database/sqlite/SQLiteDatabase;

.field final synthetic val$uri:Landroid/net/Uri;

.field final synthetic val$values:Landroid/content/ContentValues;


# direct methods
.method constructor <init>(Lorg/dmfs/provider/tasks/ContentOperation;Landroid/content/Context;Landroid/net/Uri;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)V
    .registers 6

    iput-object p1, p0, Lorg/dmfs/provider/tasks/ContentOperation$4;->this$0:Lorg/dmfs/provider/tasks/ContentOperation;

    iput-object p2, p0, Lorg/dmfs/provider/tasks/ContentOperation$4;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lorg/dmfs/provider/tasks/ContentOperation$4;->val$uri:Landroid/net/Uri;

    iput-object p4, p0, Lorg/dmfs/provider/tasks/ContentOperation$4;->val$db:Landroid/database/sqlite/SQLiteDatabase;

    iput-object p5, p0, Lorg/dmfs/provider/tasks/ContentOperation$4;->val$values:Landroid/content/ContentValues;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    # getter for: Lorg/dmfs/provider/tasks/ContentOperation;->mLock:Ljava/lang/Object;
    invoke-static {}, Lorg/dmfs/provider/tasks/ContentOperation;->access$000()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_5
    iget-object v0, p0, Lorg/dmfs/provider/tasks/ContentOperation$4;->this$0:Lorg/dmfs/provider/tasks/ContentOperation;

    # getter for: Lorg/dmfs/provider/tasks/ContentOperation;->mHandler:Lorg/dmfs/provider/tasks/ContentOperation$OperationHandler;
    invoke-static {v0}, Lorg/dmfs/provider/tasks/ContentOperation;->access$100(Lorg/dmfs/provider/tasks/ContentOperation;)Lorg/dmfs/provider/tasks/ContentOperation$OperationHandler;

    move-result-object v0

    iget-object v2, p0, Lorg/dmfs/provider/tasks/ContentOperation$4;->val$context:Landroid/content/Context;

    iget-object v3, p0, Lorg/dmfs/provider/tasks/ContentOperation$4;->val$uri:Landroid/net/Uri;

    iget-object v4, p0, Lorg/dmfs/provider/tasks/ContentOperation$4;->val$db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v5, p0, Lorg/dmfs/provider/tasks/ContentOperation$4;->val$values:Landroid/content/ContentValues;

    invoke-interface {v0, v2, v3, v4, v5}, Lorg/dmfs/provider/tasks/ContentOperation$OperationHandler;->handleOperation(Landroid/content/Context;Landroid/net/Uri;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)V

    monitor-exit v1

    return-void

    :catchall_18
    move-exception v0

    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_5 .. :try_end_1a} :catchall_18

    throw v0
.end method
