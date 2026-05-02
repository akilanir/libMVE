.class Lcom/octo/android/robospice/request/RequestProcessor$1;
.super Ljava/lang/Object;
.source "RequestProcessor.java"

# interfaces
.implements Lcom/octo/android/robospice/request/listener/RequestCancellationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/request/RequestProcessor;->addRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/request/RequestProcessor;

.field final synthetic val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/request/RequestProcessor;Lcom/octo/android/robospice/request/CachedSpiceRequest;)V
    .registers 3

    .prologue
    .line 116
    iput-object p1, p0, Lcom/octo/android/robospice/request/RequestProcessor$1;->this$0:Lcom/octo/android/robospice/request/RequestProcessor;

    iput-object p2, p0, Lcom/octo/android/robospice/request/RequestProcessor$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequestCancelled()V
    .registers 3

    .prologue
    .line 120
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor$1;->this$0:Lcom/octo/android/robospice/request/RequestProcessor;

    # getter for: Lcom/octo/android/robospice/request/RequestProcessor;->requestProgressManager:Lcom/octo/android/robospice/request/RequestProgressManager;
    invoke-static {v0}, Lcom/octo/android/robospice/request/RequestProcessor;->access$000(Lcom/octo/android/robospice/request/RequestProcessor;)Lcom/octo/android/robospice/request/RequestProgressManager;

    move-result-object v0

    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProcessor$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/RequestProgressManager;->notifyListenersOfRequestCancellation(Lcom/octo/android/robospice/request/CachedSpiceRequest;)V

    .line 121
    iget-object v0, p0, Lcom/octo/android/robospice/request/RequestProcessor$1;->this$0:Lcom/octo/android/robospice/request/RequestProcessor;

    # getter for: Lcom/octo/android/robospice/request/RequestProcessor;->mapRequestToRequestListener:Ljava/util/Map;
    invoke-static {v0}, Lcom/octo/android/robospice/request/RequestProcessor;->access$100(Lcom/octo/android/robospice/request/RequestProcessor;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/octo/android/robospice/request/RequestProcessor$1;->val$request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    return-void
.end method
