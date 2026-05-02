.class Lcom/octo/android/robospice/request/RequestProgressManager$1;
.super Ljava/lang/Object;
.source "RequestProgressManager.java"

# interfaces
.implements Lcom/octo/android/robospice/request/listener/RequestProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/request/RequestProgressManager;->createProgressListener(Lcom/octo/android/robospice/request/CachedSpiceRequest;)Lcom/octo/android/robospice/request/listener/RequestProgressListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/request/RequestProgressManager;

.field final synthetic val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/request/RequestProgressManager;Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 3

    .prologue
    .line 175
    iput-object p1, p0, Lcom/octo/android/robospice/request/RequestProgressManager$1;->this$0:Lcom/octo/android/robospice/request/RequestProgressManager;

    iput-object p2, p0, Lcom/octo/android/robospice/request/RequestProgressManager$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequestProgressUpdate(Lcom/octo/android/robospice/request/listener/RequestProgress;)V
    .registers 5
    .param p1, "progress"    # Lcom/octo/android/robospice/request/listener/RequestProgress;

    .prologue
    .line 178
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager$1;->this$0:Lcom/octo/android/robospice/request/RequestProgressManager;

    # getter for: Lcom/octo/android/robospice/request/RequestProgressManager;->mapRequestToRequestListener:Ljava/util/Map;
    invoke-static {v1}, Lcom/octo/android/robospice/request/RequestProgressManager;->access$000(Lcom/octo/android/robospice/request/RequestProgressManager;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/request/RequestProgressManager$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 179
    .local v0, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProgressManager$1;->this$0:Lcom/octo/android/robospice/request/RequestProgressManager;

    iget-object v2, p0, Lcom/octo/android/robospice/request/RequestProgressManager$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v1, v2, v0, p1}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestProgress(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;Lcom/octo/android/robospice/request/listener/RequestProgress;)V

    .line 180
    return-void
.end method
