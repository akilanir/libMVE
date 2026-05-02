.class public abstract Lch/qos/logback/core/UnsynchronizedAppenderBase;
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
.field static final ALLOWED_REPEATS:I = 0x3


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

.field private guard:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field protected name:Ljava/lang/String;

.field protected started:Z

.field private statusRepeatCount:I


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v1, 0x0

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    iput-boolean v1, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->started:Z

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->guard:Ljava/lang/ThreadLocal;

    new-instance v0, Lch/qos/logback/core/spi/FilterAttachableImpl;

    invoke-direct {v0}, Lch/qos/logback/core/spi/FilterAttachableImpl;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->fai:Lch/qos/logback/core/spi/FilterAttachableImpl;

    iput v1, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->statusRepeatCount:I

    iput v1, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->exceptionCount:I

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

    iget-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->fai:Lch/qos/logback/core/spi/FilterAttachableImpl;

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

    iget-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->fai:Lch/qos/logback/core/spi/FilterAttachableImpl;

    invoke-virtual {v0}, Lch/qos/logback/core/spi/FilterAttachableImpl;->clearAllFilters()V

    return-void
.end method

.method public doAppend(Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    const/4 v3, 0x3

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v1, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->guard:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    :goto_f
    return-void

    :cond_10
    :try_start_10
    iget-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->guard:Ljava/lang/ThreadLocal;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    iget-boolean v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->started:Z

    if-nez v0, :cond_4e

    iget v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->statusRepeatCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->statusRepeatCount:I

    if-ge v0, v3, :cond_46

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attempted to append to non started appender ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/UnsynchronizedAppenderBase;->addStatus(Lch/qos/logback/core/status/Status;)V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_46} :catch_69
    .catchall {:try_start_10 .. :try_end_46} :catchall_99

    :cond_46
    iget-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->guard:Ljava/lang/ThreadLocal;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_f

    :cond_4e
    :try_start_4e
    invoke-virtual {p0, p1}, Lch/qos/logback/core/UnsynchronizedAppenderBase;->getFilterChainDecision(Ljava/lang/Object;)Lch/qos/logback/core/spi/FilterReply;

    move-result-object v0

    sget-object v1, Lch/qos/logback/core/spi/FilterReply;->DENY:Lch/qos/logback/core/spi/FilterReply;
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_54} :catch_69
    .catchall {:try_start_4e .. :try_end_54} :catchall_99

    if-ne v0, v1, :cond_5e

    iget-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->guard:Ljava/lang/ThreadLocal;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_f

    :cond_5e
    :try_start_5e
    invoke-virtual {p0, p1}, Lch/qos/logback/core/UnsynchronizedAppenderBase;->append(Ljava/lang/Object;)V
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_61} :catch_69
    .catchall {:try_start_5e .. :try_end_61} :catchall_99

    iget-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->guard:Ljava/lang/ThreadLocal;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_f

    :catch_69
    move-exception v0

    :try_start_6a
    iget v1, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->exceptionCount:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->exceptionCount:I

    if-ge v1, v3, :cond_90

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Appender ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] failed to append."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/UnsynchronizedAppenderBase;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_90
    .catchall {:try_start_6a .. :try_end_90} :catchall_99

    :cond_90
    iget-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->guard:Ljava/lang/ThreadLocal;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto/16 :goto_f

    :catchall_99
    move-exception v0

    iget-object v1, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->guard:Ljava/lang/ThreadLocal;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    throw v0
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

    iget-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->fai:Lch/qos/logback/core/spi/FilterAttachableImpl;

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

    iget-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->fai:Lch/qos/logback/core/spi/FilterAttachableImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/FilterAttachableImpl;->getFilterChainDecision(Ljava/lang/Object;)Lch/qos/logback/core/spi/FilterReply;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->name:Ljava/lang/String;

    return-object v0
.end method

.method public isStarted()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->started:Z

    return v0
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->name:Ljava/lang/String;

    return-void
.end method

.method public start()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->started:Z

    return-void
.end method

.method public stop()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->started:Z

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

    iget-object v1, p0, Lch/qos/logback/core/UnsynchronizedAppenderBase;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
