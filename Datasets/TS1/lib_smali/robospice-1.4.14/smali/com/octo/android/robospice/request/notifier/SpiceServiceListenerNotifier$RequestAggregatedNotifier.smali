.class Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;
.super Ljava/lang/Object;
.source "SpiceServiceListenerNotifier.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RequestAggregatedNotifier"
.end annotation


# instance fields
.field private request:Lcom/octo/android/robospice/request/CachedSpiceRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;"
        }
    .end annotation
.end field

.field private requestProcessingContext:Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

.field private spiceServiceListenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/List;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 4
    .param p3, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/List",
            "<",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener;",
            ">;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 194
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "spiceServiceListenerList":Ljava/util/List;, "Ljava/util/List<Lcom/octo/android/robospice/request/listener/SpiceServiceListener;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 196
    iput-object p2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;->spiceServiceListenerList:Ljava/util/List;

    .line 197
    iput-object p1, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;->request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    .line 198
    iput-object p3, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;->requestProcessingContext:Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    .line 199
    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 203
    const-string v2, "Processing request added: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;->request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 205
    iget-object v3, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;->spiceServiceListenerList:Ljava/util/List;

    monitor-enter v3

    .line 206
    :try_start_10
    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .line 207
    .local v1, "listener":Lcom/octo/android/robospice/request/listener/SpiceServiceListener;
    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;->request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    iget-object v4, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestAggregatedNotifier;->requestProcessingContext:Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    invoke-interface {v1, v2, v4}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener;->onRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V

    goto :goto_16

    .line 209
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/octo/android/robospice/request/listener/SpiceServiceListener;
    :catchall_2a
    move-exception v2

    monitor-exit v3
    :try_end_2c
    .catchall {:try_start_10 .. :try_end_2c} :catchall_2a

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_2d
    :try_start_2d
    monitor-exit v3
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_2a

    .line 210
    return-void
.end method
