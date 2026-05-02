.class Lcom/koushikdutta/async/AsyncServer$3;
.super Ljava/lang/Object;
.source "AsyncServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/AsyncServer;->run(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/AsyncServer;

.field final synthetic val$runnable:Ljava/lang/Runnable;

.field final synthetic val$semaphore:Ljava/util/concurrent/Semaphore;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/Runnable;Ljava/util/concurrent/Semaphore;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/async/AsyncServer;

    .prologue
    .line 207
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$3;->this$0:Lcom/koushikdutta/async/AsyncServer;

    iput-object p2, p0, Lcom/koushikdutta/async/AsyncServer$3;->val$runnable:Ljava/lang/Runnable;

    iput-object p3, p0, Lcom/koushikdutta/async/AsyncServer$3;->val$semaphore:Ljava/util/concurrent/Semaphore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 210
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer$3;->val$runnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 211
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer$3;->val$semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 212
    return-void
.end method
