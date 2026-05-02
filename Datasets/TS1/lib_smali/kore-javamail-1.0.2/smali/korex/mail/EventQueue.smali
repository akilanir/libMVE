.class Lkorex/mail/EventQueue;
.super Ljava/lang/Object;
.source "EventQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/EventQueue$QueueElement;,
        Lkorex/mail/EventQueue$TerminatorEvent;
    }
.end annotation


# static fields
.field private static appq:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/ClassLoader;",
            "Lkorex/mail/EventQueue;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private executor:Ljava/util/concurrent/Executor;

.field private volatile q:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lkorex/mail/EventQueue$QueueElement;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;)V
    .registers 2
    .param p1, "ex"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object p1, p0, Lkorex/mail/EventQueue;->executor:Ljava/util/concurrent/Executor;

    .line 101
    return-void
.end method

.method static declared-synchronized getApplicationEventQueue(Ljava/util/concurrent/Executor;)Lkorex/mail/EventQueue;
    .registers 5
    .param p0, "ex"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 138
    const-class v3, Lkorex/mail/EventQueue;

    monitor-enter v3

    :try_start_3
    invoke-static {}, Lkorex/mail/Session;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 139
    .local v0, "cl":Ljava/lang/ClassLoader;
    sget-object v2, Lkorex/mail/EventQueue;->appq:Ljava/util/WeakHashMap;

    if-nez v2, :cond_12

    .line 140
    new-instance v2, Ljava/util/WeakHashMap;

    invoke-direct {v2}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v2, Lkorex/mail/EventQueue;->appq:Ljava/util/WeakHashMap;

    .line 141
    :cond_12
    sget-object v2, Lkorex/mail/EventQueue;->appq:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkorex/mail/EventQueue;

    .line 142
    .local v1, "q":Lkorex/mail/EventQueue;
    if-nez v1, :cond_26

    .line 143
    new-instance v1, Lkorex/mail/EventQueue;

    .end local v1    # "q":Lkorex/mail/EventQueue;
    invoke-direct {v1, p0}, Lkorex/mail/EventQueue;-><init>(Ljava/util/concurrent/Executor;)V

    .line 144
    .restart local v1    # "q":Lkorex/mail/EventQueue;
    sget-object v2, Lkorex/mail/EventQueue;->appq:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_28

    .line 146
    :cond_26
    monitor-exit v3

    return-object v1

    .line 138
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    .end local v1    # "q":Lkorex/mail/EventQueue;
    :catchall_28
    move-exception v2

    monitor-exit v3

    throw v2
.end method


# virtual methods
.method declared-synchronized enqueue(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V
    .registers 6
    .param p1, "event"    # Lkorex/mail/event/MailEvent;
    .param p2, "vector"    # Ljava/util/Vector;

    .prologue
    .line 108
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lkorex/mail/EventQueue;->q:Ljava/util/concurrent/BlockingQueue;

    if-nez v1, :cond_15

    .line 109
    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v1, p0, Lkorex/mail/EventQueue;->q:Ljava/util/concurrent/BlockingQueue;

    .line 110
    iget-object v1, p0, Lkorex/mail/EventQueue;->executor:Ljava/util/concurrent/Executor;

    if-eqz v1, :cond_21

    .line 111
    iget-object v1, p0, Lkorex/mail/EventQueue;->executor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 118
    :cond_15
    :goto_15
    iget-object v1, p0, Lkorex/mail/EventQueue;->q:Ljava/util/concurrent/BlockingQueue;

    new-instance v2, Lkorex/mail/EventQueue$QueueElement;

    invoke-direct {v2, p1, p2}, Lkorex/mail/EventQueue$QueueElement;-><init>(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_30

    .line 119
    monitor-exit p0

    return-void

    .line 113
    :cond_21
    :try_start_21
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "JavaMail-EventQueue"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 114
    .local v0, "qThread":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 115
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_2f
    .catchall {:try_start_21 .. :try_end_2f} :catchall_30

    goto :goto_15

    .line 108
    .end local v0    # "qThread":Ljava/lang/Thread;
    :catchall_30
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public run()V
    .registers 8

    .prologue
    .line 154
    iget-object v0, p0, Lkorex/mail/EventQueue;->q:Ljava/util/concurrent/BlockingQueue;

    .line 155
    .local v0, "bq":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<Lkorex/mail/EventQueue$QueueElement;>;"
    if-nez v0, :cond_7

    .line 179
    :goto_4
    return-void

    .line 174
    .local v1, "e":Lkorex/mail/event/MailEvent;
    .local v2, "i":I
    .local v3, "qe":Lkorex/mail/EventQueue$QueueElement;
    .local v5, "v":Ljava/util/Vector;
    :cond_5
    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 161
    .end local v1    # "e":Lkorex/mail/event/MailEvent;
    .end local v2    # "i":I
    .end local v3    # "qe":Lkorex/mail/EventQueue$QueueElement;
    .end local v5    # "v":Ljava/util/Vector;
    :cond_7
    :try_start_7
    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkorex/mail/EventQueue$QueueElement;

    .line 162
    .restart local v3    # "qe":Lkorex/mail/EventQueue$QueueElement;
    iget-object v1, v3, Lkorex/mail/EventQueue$QueueElement;->event:Lkorex/mail/event/MailEvent;

    .line 163
    .restart local v1    # "e":Lkorex/mail/event/MailEvent;
    iget-object v5, v3, Lkorex/mail/EventQueue$QueueElement;->vector:Ljava/util/Vector;

    .line 165
    .restart local v5    # "v":Ljava/util/Vector;
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_12
    invoke-virtual {v5}, Ljava/util/Vector;->size()I
    :try_end_15
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_15} :catch_28

    move-result v6

    if-ge v2, v6, :cond_5

    .line 167
    :try_start_18
    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v1, v6}, Lkorex/mail/event/MailEvent;->dispatch(Ljava/lang/Object;)V
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_1f} :catch_22
    .catch Ljava/lang/InterruptedException; {:try_start_18 .. :try_end_1f} :catch_28

    .line 165
    :cond_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 168
    :catch_22
    move-exception v4

    .line 169
    .local v4, "t":Ljava/lang/Throwable;
    :try_start_23
    instance-of v6, v4, Ljava/lang/InterruptedException;
    :try_end_25
    .catch Ljava/lang/InterruptedException; {:try_start_23 .. :try_end_25} :catch_28

    if-eqz v6, :cond_1f

    goto :goto_4

    .line 176
    .end local v1    # "e":Lkorex/mail/event/MailEvent;
    .end local v2    # "i":I
    .end local v3    # "qe":Lkorex/mail/EventQueue$QueueElement;
    .end local v4    # "t":Ljava/lang/Throwable;
    .end local v5    # "v":Ljava/util/Vector;
    :catch_28
    move-exception v6

    goto :goto_4
.end method

.method declared-synchronized terminateQueue()V
    .registers 5

    .prologue
    .line 125
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lkorex/mail/EventQueue;->q:Ljava/util/concurrent/BlockingQueue;

    if-eqz v1, :cond_20

    .line 126
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 127
    .local v0, "dummyListeners":Ljava/util/Vector;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->setSize(I)V

    .line 128
    iget-object v1, p0, Lkorex/mail/EventQueue;->q:Ljava/util/concurrent/BlockingQueue;

    new-instance v2, Lkorex/mail/EventQueue$QueueElement;

    new-instance v3, Lkorex/mail/EventQueue$TerminatorEvent;

    invoke-direct {v3}, Lkorex/mail/EventQueue$TerminatorEvent;-><init>()V

    invoke-direct {v2, v3, v0}, Lkorex/mail/EventQueue$QueueElement;-><init>(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z

    .line 129
    const/4 v1, 0x0

    iput-object v1, p0, Lkorex/mail/EventQueue;->q:Ljava/util/concurrent/BlockingQueue;
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_22

    .line 131
    .end local v0    # "dummyListeners":Ljava/util/Vector;
    :cond_20
    monitor-exit p0

    return-void

    .line 125
    :catchall_22
    move-exception v1

    monitor-exit p0

    throw v1
.end method
