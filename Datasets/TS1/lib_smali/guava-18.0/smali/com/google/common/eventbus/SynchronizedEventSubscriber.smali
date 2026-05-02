.class final Lcom/google/common/eventbus/SynchronizedEventSubscriber;
.super Lcom/google/common/eventbus/EventSubscriber;
.source "SynchronizedEventSubscriber.java"


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/reflect/Method;)V
    .registers 3
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/google/common/eventbus/EventSubscriber;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Method;)V

    .line 41
    return-void
.end method


# virtual methods
.method public handleEvent(Ljava/lang/Object;)V
    .registers 3
    .param p1, "event"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 46
    monitor-enter p0

    .line 47
    :try_start_1
    invoke-super {p0, p1}, Lcom/google/common/eventbus/EventSubscriber;->handleEvent(Ljava/lang/Object;)V

    .line 48
    monitor-exit p0

    .line 49
    return-void

    .line 48
    :catchall_6
    move-exception v0

    monitor-exit p0
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_6

    throw v0
.end method
