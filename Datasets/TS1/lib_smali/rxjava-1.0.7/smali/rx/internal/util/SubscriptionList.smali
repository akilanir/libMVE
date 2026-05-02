.class public final Lrx/internal/util/SubscriptionList;
.super Ljava/lang/Object;
.source "SubscriptionList.java"

# interfaces
.implements Lrx/Subscription;


# instance fields
.field private subscriptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lrx/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field private volatile unsubscribed:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method

.method public varargs constructor <init>([Lrx/Subscription;)V
    .registers 4
    .param p1, "subscriptions"    # [Lrx/Subscription;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/LinkedList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/List;

    .line 42
    return-void
.end method

.method private static unsubscribeFromAll(Ljava/util/Collection;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lrx/Subscription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "subscriptions":Ljava/util/Collection;, "Ljava/util/Collection<Lrx/Subscription;>;"
    if-nez p0, :cond_3

    .line 110
    :goto_2
    return-void

    .line 98
    :cond_3
    const/4 v1, 0x0

    .line 99
    .local v1, "es":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_24

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrx/Subscription;

    .line 101
    .local v3, "s":Lrx/Subscription;
    :try_start_14
    invoke-interface {v3}, Lrx/Subscription;->unsubscribe()V
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_17} :catch_18

    goto :goto_8

    .line 102
    :catch_18
    move-exception v0

    .line 103
    .local v0, "e":Ljava/lang/Throwable;
    if-nez v1, :cond_20

    .line 104
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "es":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .restart local v1    # "es":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_20
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 109
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v3    # "s":Lrx/Subscription;
    :cond_24
    invoke-static {v1}, Lrx/exceptions/Exceptions;->throwIfAny(Ljava/util/List;)V

    goto :goto_2
.end method


# virtual methods
.method public add(Lrx/Subscription;)V
    .registers 3
    .param p1, "s"    # Lrx/Subscription;

    .prologue
    .line 58
    iget-boolean v0, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v0, :cond_1c

    .line 59
    monitor-enter p0

    .line 60
    :try_start_5
    iget-boolean v0, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v0, :cond_1b

    .line 61
    iget-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/List;

    if-nez v0, :cond_14

    .line 62
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/List;

    .line 64
    :cond_14
    iget-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    monitor-exit p0

    .line 71
    :goto_1a
    return-void

    .line 67
    :cond_1b
    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_5 .. :try_end_1c} :catchall_20

    .line 70
    :cond_1c
    invoke-interface {p1}, Lrx/Subscription;->unsubscribe()V

    goto :goto_1a

    .line 67
    :catchall_20
    move-exception v0

    :try_start_21
    monitor-exit p0
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_20

    throw v0
.end method

.method public clear()V
    .registers 3

    .prologue
    .line 113
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v1, :cond_e

    .line 115
    monitor-enter p0

    .line 116
    :try_start_5
    iget-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/List;

    .line 117
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lrx/Subscription;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/List;

    .line 118
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_5 .. :try_end_b} :catchall_f

    .line 119
    invoke-static {v0}, Lrx/internal/util/SubscriptionList;->unsubscribeFromAll(Ljava/util/Collection;)V

    .line 121
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/Subscription;>;"
    :cond_e
    return-void

    .line 118
    :catchall_f
    move-exception v1

    :try_start_10
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_f

    throw v1
.end method

.method public hasSubscriptions()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 127
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v1, :cond_18

    .line 128
    monitor-enter p0

    .line 129
    :try_start_6
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v1, :cond_17

    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/List;

    if-eqz v1, :cond_17

    iget-object v1, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_17

    const/4 v0, 0x1

    :cond_17
    monitor-exit p0

    .line 132
    :cond_18
    return v0

    .line 130
    :catchall_19
    move-exception v0

    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_6 .. :try_end_1b} :catchall_19

    throw v0
.end method

.method public isUnsubscribed()Z
    .registers 2

    .prologue
    .line 46
    iget-boolean v0, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    return v0
.end method

.method public unsubscribe()V
    .registers 3

    .prologue
    .line 79
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-nez v1, :cond_a

    .line 81
    monitor-enter p0

    .line 82
    :try_start_5
    iget-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    if-eqz v1, :cond_b

    .line 83
    monitor-exit p0

    .line 92
    :cond_a
    :goto_a
    return-void

    .line 85
    :cond_b
    const/4 v1, 0x1

    iput-boolean v1, p0, Lrx/internal/util/SubscriptionList;->unsubscribed:Z

    .line 86
    iget-object v0, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/List;

    .line 87
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lrx/Subscription;>;"
    const/4 v1, 0x0

    iput-object v1, p0, Lrx/internal/util/SubscriptionList;->subscriptions:Ljava/util/List;

    .line 88
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_5 .. :try_end_14} :catchall_18

    .line 90
    invoke-static {v0}, Lrx/internal/util/SubscriptionList;->unsubscribeFromAll(Ljava/util/Collection;)V

    goto :goto_a

    .line 88
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lrx/Subscription;>;"
    :catchall_18
    move-exception v1

    :try_start_19
    monitor-exit p0
    :try_end_1a
    .catchall {:try_start_19 .. :try_end_1a} :catchall_18

    throw v1
.end method
