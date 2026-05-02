.class public abstract Lch/qos/logback/core/pattern/DynamicConverter;
.super Lch/qos/logback/core/pattern/FormattingConverter;

# interfaces
.implements Lch/qos/logback/core/spi/LifeCycle;
.implements Lch/qos/logback/core/spi/ContextAware;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/pattern/FormattingConverter",
        "<TE;>;",
        "Lch/qos/logback/core/spi/LifeCycle;",
        "Lch/qos/logback/core/spi/ContextAware;"
    }
.end annotation


# instance fields
.field cab:Lch/qos/logback/core/spi/ContextAwareBase;

.field private optionList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected started:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/pattern/FormattingConverter;-><init>()V

    new-instance v0, Lch/qos/logback/core/spi/ContextAwareBase;

    invoke-direct {v0, p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>(Lch/qos/logback/core/spi/ContextAware;)V

    iput-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->cab:Lch/qos/logback/core/spi/ContextAwareBase;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->started:Z

    return-void
.end method


# virtual methods
.method public addError(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->cab:Lch/qos/logback/core/spi/ContextAwareBase;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/ContextAwareBase;->addError(Ljava/lang/String;)V

    return-void
.end method

.method public addError(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->cab:Lch/qos/logback/core/spi/ContextAwareBase;

    invoke-virtual {v0, p1, p2}, Lch/qos/logback/core/spi/ContextAwareBase;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public addInfo(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->cab:Lch/qos/logback/core/spi/ContextAwareBase;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/ContextAwareBase;->addInfo(Ljava/lang/String;)V

    return-void
.end method

.method public addInfo(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->cab:Lch/qos/logback/core/spi/ContextAwareBase;

    invoke-virtual {v0, p1, p2}, Lch/qos/logback/core/spi/ContextAwareBase;->addInfo(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public addStatus(Lch/qos/logback/core/status/Status;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->cab:Lch/qos/logback/core/spi/ContextAwareBase;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/ContextAwareBase;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public addWarn(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->cab:Lch/qos/logback/core/spi/ContextAwareBase;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/ContextAwareBase;->addWarn(Ljava/lang/String;)V

    return-void
.end method

.method public addWarn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->cab:Lch/qos/logback/core/spi/ContextAwareBase;

    invoke-virtual {v0, p1, p2}, Lch/qos/logback/core/spi/ContextAwareBase;->addWarn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public getContext()Lch/qos/logback/core/Context;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->cab:Lch/qos/logback/core/spi/ContextAwareBase;

    invoke-virtual {v0}, Lch/qos/logback/core/spi/ContextAwareBase;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    return-object v0
.end method

.method public getFirstOption()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->optionList:Ljava/util/List;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->optionList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_e

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return-object v0

    :cond_e
    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->optionList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_d
.end method

.method protected getOptionList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->optionList:Ljava/util/List;

    return-object v0
.end method

.method public isStarted()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->started:Z

    return v0
.end method

.method public setContext(Lch/qos/logback/core/Context;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->cab:Lch/qos/logback/core/spi/ContextAwareBase;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/ContextAwareBase;->setContext(Lch/qos/logback/core/Context;)V

    return-void
.end method

.method public setOptionList(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lch/qos/logback/core/pattern/DynamicConverter;->optionList:Ljava/util/List;

    return-void
.end method

.method public start()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->started:Z

    return-void
.end method

.method public stop()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/pattern/DynamicConverter;->started:Z

    return-void
.end method
