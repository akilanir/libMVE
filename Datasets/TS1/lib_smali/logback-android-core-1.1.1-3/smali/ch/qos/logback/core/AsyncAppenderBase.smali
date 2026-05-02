.class public Lch/qos/logback/core/AsyncAppenderBase;
.super Lch/qos/logback/core/UnsynchronizedAppenderBase;

# interfaces
.implements Lch/qos/logback/core/spi/AppenderAttachable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/AsyncAppenderBase$Worker;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/UnsynchronizedAppenderBase",
        "<TE;>;",
        "Lch/qos/logback/core/spi/AppenderAttachable",
        "<TE;>;"
    }
.end annotation


# static fields
.field public static final DEFAULT_QUEUE_SIZE:I = 0x100

.field static final UNDEFINED:I = -0x1


# instance fields
.field aai:Lch/qos/logback/core/spi/AppenderAttachableImpl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/spi/AppenderAttachableImpl",
            "<TE;>;"
        }
    .end annotation
.end field

.field appenderCount:I

.field blockingQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<TE;>;"
        }
    .end annotation
.end field

.field discardingThreshold:I

.field queueSize:I

.field worker:Lch/qos/logback/core/AsyncAppenderBase$Worker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/AsyncAppenderBase",
            "<TE;>.Worker;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/UnsynchronizedAppenderBase;-><init>()V

    new-instance v0, Lch/qos/logback/core/spi/AppenderAttachableImpl;

    invoke-direct {v0}, Lch/qos/logback/core/spi/AppenderAttachableImpl;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->aai:Lch/qos/logback/core/spi/AppenderAttachableImpl;

    const/16 v0, 0x100

    iput v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->queueSize:I

    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->appenderCount:I

    const/4 v0, -0x1

    iput v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->discardingThreshold:I

    new-instance v0, Lch/qos/logback/core/AsyncAppenderBase$Worker;

    invoke-direct {v0, p0}, Lch/qos/logback/core/AsyncAppenderBase$Worker;-><init>(Lch/qos/logback/core/AsyncAppenderBase;)V

    iput-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->worker:Lch/qos/logback/core/AsyncAppenderBase$Worker;

    return-void
.end method

.method private isQueueBelowDiscardingThreshold()Z
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->blockingQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->remainingCapacity()I

    move-result v0

    iget v1, p0, Lch/qos/logback/core/AsyncAppenderBase;->discardingThreshold:I

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private put(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->blockingQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_5} :catch_6

    :goto_5
    return-void

    :catch_6
    move-exception v0

    goto :goto_5
.end method


# virtual methods
.method public addAppender(Lch/qos/logback/core/Appender;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/Appender",
            "<TE;>;)V"
        }
    .end annotation

    iget v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->appenderCount:I

    if-nez v0, :cond_30

    iget v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->appenderCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->appenderCount:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Attaching appender named ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p1}, Lch/qos/logback/core/Appender;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] to AsyncAppender."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/AsyncAppenderBase;->addInfo(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->aai:Lch/qos/logback/core/spi/AppenderAttachableImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/AppenderAttachableImpl;->addAppender(Lch/qos/logback/core/Appender;)V

    :goto_2f
    return-void

    :cond_30
    const-string v0, "One and only one appender may be attached to AsyncAppender."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/AsyncAppenderBase;->addWarn(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ignoring additional appender named ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p1}, Lch/qos/logback/core/Appender;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/AsyncAppenderBase;->addWarn(Ljava/lang/String;)V

    goto :goto_2f
.end method

.method protected append(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    invoke-direct {p0}, Lch/qos/logback/core/AsyncAppenderBase;->isQueueBelowDiscardingThreshold()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p0, p1}, Lch/qos/logback/core/AsyncAppenderBase;->isDiscardable(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    :goto_c
    return-void

    :cond_d
    invoke-virtual {p0, p1}, Lch/qos/logback/core/AsyncAppenderBase;->preprocess(Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lch/qos/logback/core/AsyncAppenderBase;->put(Ljava/lang/Object;)V

    goto :goto_c
.end method

.method public detachAndStopAllAppenders()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->aai:Lch/qos/logback/core/spi/AppenderAttachableImpl;

    invoke-virtual {v0}, Lch/qos/logback/core/spi/AppenderAttachableImpl;->detachAndStopAllAppenders()V

    return-void
.end method

.method public detachAppender(Lch/qos/logback/core/Appender;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/Appender",
            "<TE;>;)Z"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->aai:Lch/qos/logback/core/spi/AppenderAttachableImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/AppenderAttachableImpl;->detachAppender(Lch/qos/logback/core/Appender;)Z

    move-result v0

    return v0
.end method

.method public detachAppender(Ljava/lang/String;)Z
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->aai:Lch/qos/logback/core/spi/AppenderAttachableImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/AppenderAttachableImpl;->detachAppender(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getAppender(Ljava/lang/String;)Lch/qos/logback/core/Appender;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lch/qos/logback/core/Appender",
            "<TE;>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->aai:Lch/qos/logback/core/spi/AppenderAttachableImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/AppenderAttachableImpl;->getAppender(Ljava/lang/String;)Lch/qos/logback/core/Appender;

    move-result-object v0

    return-object v0
.end method

.method public getDiscardingThreshold()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->discardingThreshold:I

    return v0
.end method

.method public getNumberOfElementsInQueue()I
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->blockingQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v0

    return v0
.end method

.method public getQueueSize()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->queueSize:I

    return v0
.end method

.method public getRemainingCapacity()I
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->blockingQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->remainingCapacity()I

    move-result v0

    return v0
.end method

.method public isAttached(Lch/qos/logback/core/Appender;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/Appender",
            "<TE;>;)Z"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->aai:Lch/qos/logback/core/spi/AppenderAttachableImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/AppenderAttachableImpl;->isAttached(Lch/qos/logback/core/Appender;)Z

    move-result v0

    return v0
.end method

.method protected isDiscardable(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public iteratorForAppenders()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lch/qos/logback/core/Appender",
            "<TE;>;>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->aai:Lch/qos/logback/core/spi/AppenderAttachableImpl;

    invoke-virtual {v0}, Lch/qos/logback/core/spi/AppenderAttachableImpl;->iteratorForAppenders()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method protected preprocess(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    return-void
.end method

.method public setDiscardingThreshold(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/AsyncAppenderBase;->discardingThreshold:I

    return-void
.end method

.method public setQueueSize(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/AsyncAppenderBase;->queueSize:I

    return-void
.end method

.method public start()V
    .registers 4

    const/4 v2, 0x1

    iget v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->appenderCount:I

    if-nez v0, :cond_b

    const-string v0, "No attached appenders found."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/AsyncAppenderBase;->addError(Ljava/lang/String;)V

    :goto_a
    return-void

    :cond_b
    iget v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->queueSize:I

    if-ge v0, v2, :cond_2e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid queue size ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lch/qos/logback/core/AsyncAppenderBase;->queueSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/AsyncAppenderBase;->addError(Ljava/lang/String;)V

    goto :goto_a

    :cond_2e
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    iget v1, p0, Lch/qos/logback/core/AsyncAppenderBase;->queueSize:I

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->blockingQueue:Ljava/util/concurrent/BlockingQueue;

    iget v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->discardingThreshold:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_42

    iget v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->queueSize:I

    div-int/lit8 v0, v0, 0x5

    iput v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->discardingThreshold:I

    :cond_42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Setting discardingThreshold to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lch/qos/logback/core/AsyncAppenderBase;->discardingThreshold:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/AsyncAppenderBase;->addInfo(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->worker:Lch/qos/logback/core/AsyncAppenderBase$Worker;

    invoke-virtual {v0, v2}, Lch/qos/logback/core/AsyncAppenderBase$Worker;->setDaemon(Z)V

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->worker:Lch/qos/logback/core/AsyncAppenderBase$Worker;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AsyncAppender-Worker-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/AsyncAppenderBase;->worker:Lch/qos/logback/core/AsyncAppenderBase$Worker;

    invoke-virtual {v2}, Lch/qos/logback/core/AsyncAppenderBase$Worker;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/core/AsyncAppenderBase$Worker;->setName(Ljava/lang/String;)V

    invoke-super {p0}, Lch/qos/logback/core/UnsynchronizedAppenderBase;->start()V

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->worker:Lch/qos/logback/core/AsyncAppenderBase$Worker;

    invoke-virtual {v0}, Lch/qos/logback/core/AsyncAppenderBase$Worker;->start()V

    goto :goto_a
.end method

.method public stop()V
    .registers 4

    invoke-virtual {p0}, Lch/qos/logback/core/AsyncAppenderBase;->isStarted()Z

    move-result v0

    if-nez v0, :cond_7

    :goto_6
    return-void

    :cond_7
    invoke-super {p0}, Lch/qos/logback/core/UnsynchronizedAppenderBase;->stop()V

    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->worker:Lch/qos/logback/core/AsyncAppenderBase$Worker;

    invoke-virtual {v0}, Lch/qos/logback/core/AsyncAppenderBase$Worker;->interrupt()V

    :try_start_f
    iget-object v0, p0, Lch/qos/logback/core/AsyncAppenderBase;->worker:Lch/qos/logback/core/AsyncAppenderBase$Worker;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v1, v2}, Lch/qos/logback/core/AsyncAppenderBase$Worker;->join(J)V
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_16} :catch_17

    goto :goto_6

    :catch_17
    move-exception v0

    const-string v1, "Failed to join worker thread"

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/AsyncAppenderBase;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6
.end method
