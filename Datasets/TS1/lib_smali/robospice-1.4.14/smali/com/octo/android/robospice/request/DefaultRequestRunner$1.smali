.class Lcom/octo/android/robospice/request/DefaultRequestRunner$1;
.super Ljava/lang/Object;
.source "DefaultRequestRunner.java"

# interfaces
.implements Lcom/octo/android/robospice/priority/PriorityRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/request/DefaultRequestRunner;->planRequestExecution(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
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
    .line 213
    iput-object p1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$1;->this$0:Lcom/octo/android/robospice/request/DefaultRequestRunner;

    iput-object p2, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getPriority()I
    .registers 2

    .prologue
    .line 227
    iget-object v0, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->getPriority()I

    move-result v0

    return v0
.end method

.method public run()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 217
    :try_start_1
    iget-object v1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$1;->this$0:Lcom/octo/android/robospice/request/DefaultRequestRunner;

    iget-object v2, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v1, v2}, Lcom/octo/android/robospice/request/DefaultRequestRunner;->processRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_8} :catch_e
    .catchall {:try_start_1 .. :try_end_8} :catchall_26

    .line 221
    iget-object v1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v1, v5}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setRequestCancellationListener(Lcom/octo/android/robospice/request/listener/RequestCancellationListener;)V

    .line 223
    :goto_d
    return-void

    .line 218
    :catch_e
    move-exception v0

    .line 219
    .local v0, "t":Ljava/lang/Throwable;
    :try_start_f
    const-string v1, "An unexpected error occurred when processsing request %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v4}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I
    :try_end_20
    .catchall {:try_start_f .. :try_end_20} :catchall_26

    .line 221
    iget-object v1, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v1, v5}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setRequestCancellationListener(Lcom/octo/android/robospice/request/listener/RequestCancellationListener;)V

    goto :goto_d

    .end local v0    # "t":Ljava/lang/Throwable;
    :catchall_26
    move-exception v1

    iget-object v2, p0, Lcom/octo/android/robospice/request/DefaultRequestRunner$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v2, v5}, Lcom/octo/android/robospice/request/CachedSpiceRequest;->setRequestCancellationListener(Lcom/octo/android/robospice/request/listener/RequestCancellationListener;)V

    throw v1
.end method
