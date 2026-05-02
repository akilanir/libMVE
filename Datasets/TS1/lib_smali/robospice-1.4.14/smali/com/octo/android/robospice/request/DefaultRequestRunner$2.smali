.class Lcom/octo/android/robospice/request/DefaultRequestRunner$2;
.super Ljava/lang/Object;
.source "DefaultRequestRunner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/request/DefaultRequestRunner;->handleRetry(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/persistence/exception/SpiceException;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/request/DefaultRequestRunner;

.field final synthetic val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/request/DefaultRequestRunner;Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 3

    .prologue
    .line 273
    iput-object p1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$2;->this$0:Lcom/octo/android/robospice/request/DefaultRequestRunner;

    iput-object p2, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$2;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 277
    :try_start_0
    iget-object v1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$2;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v1}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getRetryPolicy()Lcom/octo/android/robospice/retry/RetryPolicy;

    move-result-object v1

    invoke-interface {v1}, Lcom/octo/android/robospice/retry/RetryPolicy;->getDelayBeforeRetry()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 278
    iget-object v1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$2;->this$0:Lcom/octo/android/robospice/request/DefaultRequestRunner;

    iget-object v2, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$2;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v1, v2}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->executeRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    :try_end_14
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_14} :catch_15

    .line 282
    :goto_14
    return-void

    .line 279
    :catch_15
    move-exception v0

    .line 280
    .local v0, "e":Ljava/lang/InterruptedException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Retry attempt failed for request "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$2;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_14
.end method
