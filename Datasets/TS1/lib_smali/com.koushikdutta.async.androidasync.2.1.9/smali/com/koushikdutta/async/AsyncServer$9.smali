.class Lcom/koushikdutta/async/AsyncServer$9;
.super Ljava/lang/Object;
.source "AsyncServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/AsyncServer;->getAllByName(Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/AsyncServer;

.field final synthetic val$host:Ljava/lang/String;

.field final synthetic val$ret:Lcom/koushikdutta/async/future/SimpleFuture;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/String;Lcom/koushikdutta/async/future/SimpleFuture;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/async/AsyncServer;

    .prologue
    .line 444
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$9;->this$0:Lcom/koushikdutta/async/AsyncServer;

    iput-object p2, p0, Lcom/koushikdutta/async/AsyncServer$9;->val$host:Ljava/lang/String;

    iput-object p3, p0, Lcom/koushikdutta/async/AsyncServer$9;->val$ret:Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 448
    :try_start_0
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer$9;->val$host:Ljava/lang/String;

    invoke-static {v2}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v1

    .line 449
    .local v1, "result":[Ljava/net/InetAddress;
    # getter for: Lcom/koushikdutta/async/AsyncServer;->ipSorter:Ljava/util/Comparator;
    invoke-static {}, Lcom/koushikdutta/async/AsyncServer;->access$600()Ljava/util/Comparator;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 450
    if-eqz v1, :cond_12

    array-length v2, v1

    if-nez v2, :cond_26

    .line 451
    :cond_12
    new-instance v2, Lcom/koushikdutta/async/HostnameResolutionException;

    const-string v3, "no addresses for host"

    invoke-direct {v2, v3}, Lcom/koushikdutta/async/HostnameResolutionException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1a} :catch_1a

    .line 458
    .end local v1    # "result":[Ljava/net/InetAddress;
    :catch_1a
    move-exception v0

    .line 459
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer$9;->this$0:Lcom/koushikdutta/async/AsyncServer;

    new-instance v3, Lcom/koushikdutta/async/AsyncServer$9$2;

    invoke-direct {v3, p0, v0}, Lcom/koushikdutta/async/AsyncServer$9$2;-><init>(Lcom/koushikdutta/async/AsyncServer$9;Ljava/lang/Exception;)V

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;

    .line 466
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_25
    return-void

    .line 452
    .restart local v1    # "result":[Ljava/net/InetAddress;
    :cond_26
    :try_start_26
    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer$9;->this$0:Lcom/koushikdutta/async/AsyncServer;

    new-instance v3, Lcom/koushikdutta/async/AsyncServer$9$1;

    invoke-direct {v3, p0, v1}, Lcom/koushikdutta/async/AsyncServer$9$1;-><init>(Lcom/koushikdutta/async/AsyncServer$9;[Ljava/net/InetAddress;)V

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/AsyncServer;->post(Ljava/lang/Runnable;)Ljava/lang/Object;
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_30} :catch_1a

    goto :goto_25
.end method
