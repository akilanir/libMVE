.class Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier;
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
    name = "RequestProcessedNotifier"
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
    .line 357
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "spiceServiceListenerList":Ljava/util/List;, "Ljava/util/List<Lcom/octo/android/robospice/request/listener/SpiceServiceListener;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 359
    iput-object p2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier;->spiceServiceListenerList:Ljava/util/List;

    .line 360
    iput-object p1, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier;->request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    .line 361
    iput-object p3, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier;->requestProcessingContext:Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    .line 362
    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 366
    iget-object v3, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier;->spiceServiceListenerList:Ljava/util/List;

    monitor-enter v3

    .line 367
    :try_start_3
    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier;->spiceServiceListenerList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .line 368
    .local v1, "listener":Lcom/octo/android/robospice/request/listener/SpiceServiceListener;
    iget-object v2, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier;->request:Lcom/octo/android/robospice/request/CachedSpiceRequest;

    iget-object v4, p0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier$RequestProcessedNotifier;->requestProcessingContext:Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;

    invoke-interface {v1, v2, v4}, Lcom/octo/android/robospice/request/listener/SpiceServiceListener;->onRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V

    goto :goto_9

    .line 370
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/octo/android/robospice/request/listener/SpiceServiceListener;
    :catchall_1d
    move-exception v2

    monitor-exit v3
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_20
    :try_start_20
    monitor-exit v3
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1d

    .line 371
    return-void
.end method
