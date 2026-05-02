.class abstract Lzmq/PollerBase;
.super Ljava/lang/Object;
.source "PollerBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/PollerBase$TimerInfo;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final addingTimers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lzmq/PollerBase$TimerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final load:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final timers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lzmq/PollerBase$TimerInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    const-class v0, Lzmq/PollerBase;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/PollerBase;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected constructor <init>()V
    .registers 3

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lzmq/PollerBase;->load:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 50
    new-instance v0, Lzmq/MultiMap;

    invoke-direct {v0}, Lzmq/MultiMap;-><init>()V

    iput-object v0, p0, Lzmq/PollerBase;->timers:Ljava/util/Map;

    .line 51
    new-instance v0, Lzmq/MultiMap;

    invoke-direct {v0}, Lzmq/MultiMap;-><init>()V

    iput-object v0, p0, Lzmq/PollerBase;->addingTimers:Ljava/util/Map;

    .line 52
    return-void
.end method


# virtual methods
.method public addTimer(JLzmq/IPollEvents;I)V
    .registers 10
    .param p1, "timeout"    # J
    .param p3, "sink"    # Lzmq/IPollEvents;
    .param p4, "id"    # I

    .prologue
    .line 72
    invoke-static {}, Lzmq/Clock;->nowMS()J

    move-result-wide v3

    add-long v0, v3, p1

    .line 73
    .local v0, "expiration":J
    new-instance v2, Lzmq/PollerBase$TimerInfo;

    invoke-direct {v2, p0, p3, p4}, Lzmq/PollerBase$TimerInfo;-><init>(Lzmq/PollerBase;Lzmq/IPollEvents;I)V

    .line 74
    .local v2, "info":Lzmq/PollerBase$TimerInfo;
    iget-object v3, p0, Lzmq/PollerBase;->addingTimers:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    return-void
.end method

.method protected adjustLoad(I)V
    .registers 3
    .param p1, "amount"    # I

    .prologue
    .line 64
    iget-object v0, p0, Lzmq/PollerBase;->load:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 65
    return-void
.end method

.method public cancelTimer(Lzmq/IPollEvents;I)V
    .registers 7
    .param p1, "sink"    # Lzmq/IPollEvents;
    .param p2, "id"    # I

    .prologue
    .line 83
    iget-object v2, p0, Lzmq/PollerBase;->addingTimers:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_14

    .line 84
    iget-object v2, p0, Lzmq/PollerBase;->timers:Ljava/util/Map;

    iget-object v3, p0, Lzmq/PollerBase;->addingTimers:Ljava/util/Map;

    invoke-interface {v2, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 85
    iget-object v2, p0, Lzmq/PollerBase;->addingTimers:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 88
    :cond_14
    iget-object v2, p0, Lzmq/PollerBase;->timers:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 89
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Lzmq/PollerBase$TimerInfo;>;>;"
    :cond_1e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 90
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzmq/PollerBase$TimerInfo;

    .line 91
    .local v1, "v":Lzmq/PollerBase$TimerInfo;
    iget-object v2, v1, Lzmq/PollerBase$TimerInfo;->sink:Lzmq/IPollEvents;

    if-ne v2, p1, :cond_1e

    iget v2, v1, Lzmq/PollerBase$TimerInfo;->id:I

    if-ne v2, p2, :cond_1e

    .line 92
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 99
    .end local v1    # "v":Lzmq/PollerBase$TimerInfo;
    :cond_3b
    return-void

    .line 98
    :cond_3c
    sget-boolean v2, Lzmq/PollerBase;->$assertionsDisabled:Z

    if-nez v2, :cond_3b

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method

.method protected executeTimers()J
    .registers 10

    .prologue
    const-wide/16 v5, 0x0

    .line 105
    iget-object v4, p0, Lzmq/PollerBase;->addingTimers:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_16

    .line 106
    iget-object v4, p0, Lzmq/PollerBase;->timers:Ljava/util/Map;

    iget-object v7, p0, Lzmq/PollerBase;->addingTimers:Ljava/util/Map;

    invoke-interface {v4, v7}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 107
    iget-object v4, p0, Lzmq/PollerBase;->addingTimers:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->clear()V

    .line 110
    :cond_16
    iget-object v4, p0, Lzmq/PollerBase;->timers:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_20

    move-wide v4, v5

    .line 141
    :goto_1f
    return-wide v4

    .line 115
    :cond_20
    invoke-static {}, Lzmq/Clock;->nowMS()J

    move-result-wide v0

    .line 118
    .local v0, "current":J
    iget-object v4, p0, Lzmq/PollerBase;->timers:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 119
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Lzmq/PollerBase$TimerInfo;>;>;"
    :goto_2e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6b

    .line 120
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 126
    .local v3, "o":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lzmq/PollerBase$TimerInfo;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    cmp-long v4, v7, v0

    if-lez v4, :cond_54

    .line 127
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long/2addr v4, v0

    goto :goto_1f

    .line 131
    :cond_54
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lzmq/PollerBase$TimerInfo;

    iget-object v7, v4, Lzmq/PollerBase$TimerInfo;->sink:Lzmq/IPollEvents;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lzmq/PollerBase$TimerInfo;

    iget v4, v4, Lzmq/PollerBase$TimerInfo;->id:I

    invoke-interface {v7, v4}, Lzmq/IPollEvents;->timerEvent(I)V

    .line 133
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_2e

    .line 136
    .end local v3    # "o":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lzmq/PollerBase$TimerInfo;>;"
    :cond_6b
    iget-object v4, p0, Lzmq/PollerBase;->addingTimers:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_78

    .line 137
    invoke-virtual {p0}, Lzmq/PollerBase;->executeTimers()J

    move-result-wide v4

    goto :goto_1f

    :cond_78
    move-wide v4, v5

    .line 141
    goto :goto_1f
.end method

.method public final getLoad()I
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lzmq/PollerBase;->load:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method
