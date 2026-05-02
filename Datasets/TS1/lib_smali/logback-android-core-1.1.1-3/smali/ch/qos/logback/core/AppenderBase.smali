.class public abstract Lch/qos/logback/core/AppenderBase;
.super Lch/qos/logback/core/spi/ContextAwareBase;

# interfaces
.implements Lch/qos/logback/core/Appender;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/spi/ContextAwareBase;",
        "Lch/qos/logback/core/Appender",
        "<TE;>;"
    }
.end annotation


# static fields
.field static final ALLOWED_REPEATS:I = 0x5


# instance fields
.field private exceptionCount:I

.field private fai:Lch/qos/logback/core/spi/FilterAttachableImpl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/spi/FilterAttachableImpl",
            "<TE;>;"
        }
    .end annotation
.end field

.field private guard:Z

.field protected name:Ljava/lang/String;

.field protected started:Z

.field private statusRepeatCount:I


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v1, 0x0

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    iput-boolean v1, p0, Lch/qos/logback/core/AppenderBase;->started:Z

    iput-boolean v1, p0, Lch/qos/logback/core/AppenderBase;->guard:Z

    new-instance v0, Lch/qos/logback/core/spi/FilterAttachableImpl;

    invoke-direct {v0}, Lch/qos/logback/core/spi/FilterAttachableImpl;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/AppenderBase;->fai:Lch/qos/logback/core/spi/FilterAttachableImpl;

    iput v1, p0, Lch/qos/logback/core/AppenderBase;->statusRepeatCount:I

    iput v1, p0, Lch/qos/logback/core/AppenderBase;->exceptionCount:I

    return-void
.end method


# virtual methods
.method public addFilter(Lch/qos/logback/core/filter/Filter;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/filter/Filter",
            "<TE;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/AppenderBase;->fai:Lch/qos/logback/core/spi/FilterAttachableImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/FilterAttachableImpl;->addFilter(Lch/qos/logback/core/filter/Filter;)V

    return-void
.end method

.method protected abstract append(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation
.end method

.method public clearAllFilters()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/AppenderBase;->fai:Lch/qos/logback/core/spi/FilterAttachableImpl;

    invoke-virtual {v0}, Lch/qos/logback/core/spi/FilterAttachableImpl;->clearAllFilters()V

    return-void
.end method

.method public declared-synchronized doAppend(Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    const/4 v3, 0x5

    monitor-enter p0

    :try_start_2
    iget-boolean v0, p0, Lch/qos/logback/core/AppenderBase;->guard:Z
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_3e

    if-eqz v0, :cond_8

    :goto_6
    monitor-exit p0

    return-void

    :cond_8
    const/4 v0, 0x1

    :try_start_9
    iput-boolean v0, p0, Lch/qos/logback/core/AppenderBase;->guard:Z

    iget-boolean v0, p0, Lch/qos/logback/core/AppenderBase;->started:Z

    if-nez v0, :cond_41

    iget v0, p0, Lch/qos/logback/core/AppenderBase;->statusRepeatCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lch/qos/logback/core/AppenderBase;->statusRepeatCount:I

    if-ge v0, v3, :cond_3a

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attempted to append to non started appender ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/AppenderBase;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/AppenderBase;->addStatus(Lch/qos/logback/core/status/Status;)V
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_3a} :catch_54
    .catchall {:try_start_9 .. :try_end_3a} :catchall_7f

    :cond_3a
    const/4 v0, 0x0

    :try_start_3b
    iput-boolean v0, p0, Lch/qos/logback/core/AppenderBase;->guard:Z
    :try_end_3d
    .catchall {:try_start_3b .. :try_end_3d} :catchall_3e

    goto :goto_6

    :catchall_3e
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_41
    :try_start_41
    invoke-virtual {p0, p1}, Lch/qos/logback/core/AppenderBase;->getFilterChainDecision(Ljava/lang/Object;)Lch/qos/logback/core/spi/FilterReply;

    move-result-object v0

    sget-object v1, Lch/qos/logback/core/spi/FilterReply;->DENY:Lch/qos/logback/core/spi/FilterReply;
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_47} :catch_54
    .catchall {:try_start_41 .. :try_end_47} :catchall_7f

    if-ne v0, v1, :cond_4d

    const/4 v0, 0x0

    :try_start_4a
    iput-boolean v0, p0, Lch/qos/logback/core/AppenderBase;->guard:Z
    :try_end_4c
    .catchall {:try_start_4a .. :try_end_4c} :catchall_3e

    goto :goto_6

    :cond_4d
    :try_start_4d
    invoke-virtual {p0, p1}, Lch/qos/logback/core/AppenderBase;->append(Ljava/lang/Object;)V
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_50} :catch_54
    .catchall {:try_start_4d .. :try_end_50} :catchall_7f

    const/4 v0, 0x0

    :try_start_51
    iput-boolean v0, p0, Lch/qos/logback/core/AppenderBase;->guard:Z
    :try_end_53
    .catchall {:try_start_51 .. :try_end_53} :catchall_3e

    goto :goto_6

    :catch_54
    move-exception v0

    :try_start_55
    iget v1, p0, Lch/qos/logback/core/AppenderBase;->exceptionCount:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lch/qos/logback/core/AppenderBase;->exceptionCount:I

    if-ge v1, v3, :cond_7b

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Appender ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/AppenderBase;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] failed to append."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/AppenderBase;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7b
    .catchall {:try_start_55 .. :try_end_7b} :catchall_7f

    :cond_7b
    const/4 v0, 0x0

    :try_start_7c
    iput-boolean v0, p0, Lch/qos/logback/core/AppenderBase;->guard:Z

    goto :goto_6

    :catchall_7f
    move-exception v0

    const/4 v1, 0x0

    iput-boolean v1, p0, Lch/qos/logback/core/AppenderBase;->guard:Z

    throw v0
    :try_end_84
    .catchall {:try_start_7c .. :try_end_84} :catchall_3e
.end method

.method public getCopyOfAttachedFiltersList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/filter/Filter",
            "<TE;>;>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/AppenderBase;->fai:Lch/qos/logback/core/spi/FilterAttachableImpl;

    invoke-virtual {v0}, Lch/qos/logback/core/spi/FilterAttachableImpl;->getCopyOfAttachedFiltersList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getFilterChainDecision(Ljava/lang/Object;)Lch/qos/logback/core/spi/FilterReply;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Lch/qos/logback/core/spi/FilterReply;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/AppenderBase;->fai:Lch/qos/logback/core/spi/FilterAttachableImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/FilterAttachableImpl;->getFilterChainDecision(Ljava/lang/Object;)Lch/qos/logback/core/spi/FilterReply;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/AppenderBase;->name:Ljava/lang/String;

    return-object v0
.end method

.method public isStarted()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/AppenderBase;->started:Z

    return v0
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/AppenderBase;->name:Ljava/lang/String;

    return-void
.end method

.method public start()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/AppenderBase;->started:Z

    return-void
.end method

.method public stop()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/AppenderBase;->started:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/AppenderBase;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
