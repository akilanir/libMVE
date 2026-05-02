.class public Lch/qos/logback/core/BasicStatusManager;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/status/StatusManager;


# static fields
.field public static final MAX_HEADER_COUNT:I = 0x96

.field public static final TAIL_SIZE:I = 0x96


# instance fields
.field count:I

.field level:I

.field protected final statusList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/status/Status;",
            ">;"
        }
    .end annotation
.end field

.field protected final statusListLock:Lch/qos/logback/core/spi/LogbackLock;

.field protected final statusListenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/status/StatusListener;",
            ">;"
        }
    .end annotation
.end field

.field protected final statusListenerListLock:Lch/qos/logback/core/spi/LogbackLock;

.field protected final tailBuffer:Lch/qos/logback/core/helpers/CyclicBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/helpers/CyclicBuffer",
            "<",
            "Lch/qos/logback/core/status/Status;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 4

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v2, p0, Lch/qos/logback/core/BasicStatusManager;->count:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->statusList:Ljava/util/List;

    new-instance v0, Lch/qos/logback/core/helpers/CyclicBuffer;

    const/16 v1, 0x96

    invoke-direct {v0, v1}, Lch/qos/logback/core/helpers/CyclicBuffer;-><init>(I)V

    iput-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->tailBuffer:Lch/qos/logback/core/helpers/CyclicBuffer;

    new-instance v0, Lch/qos/logback/core/spi/LogbackLock;

    invoke-direct {v0}, Lch/qos/logback/core/spi/LogbackLock;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->statusListLock:Lch/qos/logback/core/spi/LogbackLock;

    iput v2, p0, Lch/qos/logback/core/BasicStatusManager;->level:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->statusListenerList:Ljava/util/List;

    new-instance v0, Lch/qos/logback/core/spi/LogbackLock;

    invoke-direct {v0}, Lch/qos/logback/core/spi/LogbackLock;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->statusListenerListLock:Lch/qos/logback/core/spi/LogbackLock;

    return-void
.end method

.method private fireStatusAddEvent(Lch/qos/logback/core/status/Status;)V
    .registers 5

    iget-object v1, p0, Lch/qos/logback/core/BasicStatusManager;->statusListenerListLock:Lch/qos/logback/core/spi/LogbackLock;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->statusListenerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/StatusListener;

    invoke-interface {v0, p1}, Lch/qos/logback/core/status/StatusListener;->addStatusEvent(Lch/qos/logback/core/status/Status;)V

    goto :goto_9

    :catchall_19
    move-exception v0

    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw v0

    :cond_1c
    :try_start_1c
    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_19

    return-void
.end method


# virtual methods
.method public add(Lch/qos/logback/core/status/Status;)V
    .registers 5

    invoke-direct {p0, p1}, Lch/qos/logback/core/BasicStatusManager;->fireStatusAddEvent(Lch/qos/logback/core/status/Status;)V

    iget v0, p0, Lch/qos/logback/core/BasicStatusManager;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lch/qos/logback/core/BasicStatusManager;->count:I

    invoke-interface {p1}, Lch/qos/logback/core/status/Status;->getLevel()I

    move-result v0

    iget v1, p0, Lch/qos/logback/core/BasicStatusManager;->level:I

    if-le v0, v1, :cond_17

    invoke-interface {p1}, Lch/qos/logback/core/status/Status;->getLevel()I

    move-result v0

    iput v0, p0, Lch/qos/logback/core/BasicStatusManager;->level:I

    :cond_17
    iget-object v1, p0, Lch/qos/logback/core/BasicStatusManager;->statusListLock:Lch/qos/logback/core/spi/LogbackLock;

    monitor-enter v1

    :try_start_1a
    iget-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->statusList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v2, 0x96

    if-ge v0, v2, :cond_2b

    iget-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->statusList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_29
    monitor-exit v1

    return-void

    :cond_2b
    iget-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->tailBuffer:Lch/qos/logback/core/helpers/CyclicBuffer;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/helpers/CyclicBuffer;->add(Ljava/lang/Object;)V

    goto :goto_29

    :catchall_31
    move-exception v0

    monitor-exit v1
    :try_end_33
    .catchall {:try_start_1a .. :try_end_33} :catchall_31

    throw v0
.end method

.method public add(Lch/qos/logback/core/status/StatusListener;)V
    .registers 4

    iget-object v1, p0, Lch/qos/logback/core/BasicStatusManager;->statusListenerListLock:Lch/qos/logback/core/spi/LogbackLock;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->statusListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public addUniquely(Lch/qos/logback/core/status/StatusListener;Ljava/lang/Object;)Z
    .registers 7

    invoke-virtual {p0}, Lch/qos/logback/core/BasicStatusManager;->getCopyOfStatusListenerList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_45

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/StatusListener;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    new-instance v1, Lch/qos/logback/core/status/WarnStatus;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "A previous listener of type ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "] has been already registered. Skipping double registration."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0, p2}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lch/qos/logback/core/BasicStatusManager;->add(Lch/qos/logback/core/status/Status;)V

    const/4 v0, 0x0

    :goto_44
    return v0

    :cond_45
    invoke-virtual {p0, p1}, Lch/qos/logback/core/BasicStatusManager;->add(Lch/qos/logback/core/status/StatusListener;)V

    const/4 v0, 0x1

    goto :goto_44
.end method

.method public clear()V
    .registers 3

    iget-object v1, p0, Lch/qos/logback/core/BasicStatusManager;->statusListLock:Lch/qos/logback/core/spi/LogbackLock;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_4
    iput v0, p0, Lch/qos/logback/core/BasicStatusManager;->count:I

    iget-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->statusList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->tailBuffer:Lch/qos/logback/core/helpers/CyclicBuffer;

    invoke-virtual {v0}, Lch/qos/logback/core/helpers/CyclicBuffer;->clear()V

    monitor-exit v1

    return-void

    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_4 .. :try_end_14} :catchall_12

    throw v0
.end method

.method public getCopyOfStatusList()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/status/Status;",
            ">;"
        }
    .end annotation

    iget-object v1, p0, Lch/qos/logback/core/BasicStatusManager;->statusListLock:Lch/qos/logback/core/spi/LogbackLock;

    monitor-enter v1

    :try_start_3
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lch/qos/logback/core/BasicStatusManager;->statusList:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v2, p0, Lch/qos/logback/core/BasicStatusManager;->tailBuffer:Lch/qos/logback/core/helpers/CyclicBuffer;

    invoke-virtual {v2}, Lch/qos/logback/core/helpers/CyclicBuffer;->asList()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    monitor-exit v1

    return-object v0

    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public getCopyOfStatusListenerList()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/status/StatusListener;",
            ">;"
        }
    .end annotation

    iget-object v1, p0, Lch/qos/logback/core/BasicStatusManager;->statusListenerListLock:Lch/qos/logback/core/spi/LogbackLock;

    monitor-enter v1

    :try_start_3
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lch/qos/logback/core/BasicStatusManager;->statusListenerList:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1

    return-object v0

    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public getCount()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/BasicStatusManager;->count:I

    return v0
.end method

.method public getLevel()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/BasicStatusManager;->level:I

    return v0
.end method

.method public remove(Lch/qos/logback/core/status/StatusListener;)V
    .registers 4

    iget-object v1, p0, Lch/qos/logback/core/BasicStatusManager;->statusListenerListLock:Lch/qos/logback/core/spi/LogbackLock;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lch/qos/logback/core/BasicStatusManager;->statusListenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v1

    return-void

    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method
