.class Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;
.super Lcom/octo/android/robospice/request/listener/SpiceServiceAdapter;
.source "SpiceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/SpiceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PendingRequestHandlerSpiceServiceListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/SpiceManager;


# direct methods
.method private constructor <init>(Lcom/octo/android/robospice/SpiceManager;)V
    .registers 2

    .prologue
    .line 1118
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;->this$0:Lcom/octo/android/robospice/SpiceManager;

    invoke-direct {p0}, Lcom/octo/android/robospice/request/listener/SpiceServiceAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/octo/android/robospice/SpiceManager;Lcom/octo/android/robospice/SpiceManager$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/octo/android/robospice/SpiceManager;
    .param p2, "x1"    # Lcom/octo/android/robospice/SpiceManager$1;

    .prologue
    .line 1118
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;-><init>(Lcom/octo/android/robospice/SpiceManager;)V

    return-void
.end method


# virtual methods
.method public onRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 5
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1121
    .local p1, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;
    invoke-static {v1}, Lcom/octo/android/robospice/SpiceManager;->access$400(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 1122
    .local v0, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    if-eqz v0, :cond_17

    .line 1123
    iget-object v1, p0, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;
    invoke-static {v1}, Lcom/octo/android/robospice/SpiceManager;->access$600(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1125
    :cond_17
    return-void
.end method

.method public onRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 7
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1129
    .local p1, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;
    invoke-static {v2}, Lcom/octo/android/robospice/SpiceManager;->access$600(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 1130
    .local v0, "listeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    if-nez v0, :cond_20

    .line 1131
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-static {v2}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    .line 1132
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;
    invoke-static {v2}, Lcom/octo/android/robospice/SpiceManager;->access$600(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1134
    :cond_20
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;
    invoke-static {v2}, Lcom/octo/android/robospice/SpiceManager;->access$400(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    .line 1135
    .local v1, "listenersToLaunch":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    if-eqz v1, :cond_39

    .line 1136
    iget-object v2, p0, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;
    invoke-static {v2}, Lcom/octo/android/robospice/SpiceManager;->access$600(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;

    move-result-object v3

    monitor-enter v3

    .line 1137
    :try_start_35
    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 1138
    monitor-exit v3

    .line 1140
    :cond_39
    return-void

    .line 1138
    :catchall_3a
    move-exception v2

    monitor-exit v3
    :try_end_3c
    .catchall {:try_start_35 .. :try_end_3c} :catchall_3a

    throw v2
.end method

.method public onRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 4
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1144
    .local p1, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->mapRequestToLaunchToRequestListener:Ljava/util/Map;
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceManager;->access$400(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1145
    return-void
.end method

.method public onRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 4
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1149
    .local p1, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener;->this$0:Lcom/octo/android/robospice/SpiceManager;

    # getter for: Lcom/octo/android/robospice/SpiceManager;->mapPendingRequestToRequestListener:Ljava/util/Map;
    invoke-static {v0}, Lcom/octo/android/robospice/SpiceManager;->access$600(Lcom/octo/android/robospice/SpiceManager;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1150
    return-void
.end method
