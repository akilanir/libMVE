.class public Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;
.super Lch/qos/logback/core/joran/action/Action;


# instance fields
.field inError:Z

.field lcl:Lch/qos/logback/classic/spi/LoggerContextListener;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->inError:Z

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/ActionException;
        }
    .end annotation

    const/4 v3, 0x1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->inError:Z

    const-string v0, "class"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    const-string v0, "Mandatory \"class\" attribute not set for <loggerContextListener> element"

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->addError(Ljava/lang/String;)V

    iput-boolean v3, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->inError:Z

    :goto_17
    return-void

    :cond_18
    :try_start_18
    const-class v0, Lch/qos/logback/classic/spi/LoggerContextListener;

    iget-object v2, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->context:Lch/qos/logback/core/Context;

    invoke-static {v1, v0, v2}, Lch/qos/logback/core/util/OptionHelper;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Lch/qos/logback/core/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/spi/LoggerContextListener;

    iput-object v0, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->lcl:Lch/qos/logback/classic/spi/LoggerContextListener;

    iget-object v0, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->lcl:Lch/qos/logback/classic/spi/LoggerContextListener;

    instance-of v0, v0, Lch/qos/logback/core/spi/ContextAware;

    if-eqz v0, :cond_33

    iget-object v0, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->lcl:Lch/qos/logback/classic/spi/LoggerContextListener;

    check-cast v0, Lch/qos/logback/core/spi/ContextAware;

    iget-object v2, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->context:Lch/qos/logback/core/Context;

    invoke-interface {v0, v2}, Lch/qos/logback/core/spi/ContextAware;->setContext(Lch/qos/logback/core/Context;)V

    :cond_33
    iget-object v0, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->lcl:Lch/qos/logback/classic/spi/LoggerContextListener;

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->pushObject(Ljava/lang/Object;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adding LoggerContextListener of type ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "] to the object stack"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->addInfo(Ljava/lang/String;)V
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_54} :catch_55

    goto :goto_17

    :catch_55
    move-exception v0

    iput-boolean v3, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->inError:Z

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not create LoggerContextListener of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_17
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/ActionException;
        }
    .end annotation

    iget-boolean v0, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->inError:Z

    if-eqz v0, :cond_5

    :goto_4
    return-void

    :cond_5
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->lcl:Lch/qos/logback/classic/spi/LoggerContextListener;

    if-eq v0, v1, :cond_13

    const-string v0, "The object on the top the of the stack is not the LoggerContextListener pushed earlier."

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->addWarn(Ljava/lang/String;)V

    goto :goto_4

    :cond_13
    iget-object v0, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->lcl:Lch/qos/logback/classic/spi/LoggerContextListener;

    instance-of v0, v0, Lch/qos/logback/core/spi/LifeCycle;

    if-eqz v0, :cond_25

    iget-object v0, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->lcl:Lch/qos/logback/classic/spi/LoggerContextListener;

    check-cast v0, Lch/qos/logback/core/spi/LifeCycle;

    invoke-interface {v0}, Lch/qos/logback/core/spi/LifeCycle;->start()V

    const-string v0, "Starting LoggerContextListener"

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->addInfo(Ljava/lang/String;)V

    :cond_25
    iget-object v0, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->context:Lch/qos/logback/core/Context;

    check-cast v0, Lch/qos/logback/classic/LoggerContext;

    iget-object v1, p0, Lch/qos/logback/classic/joran/action/LoggerContextListenerAction;->lcl:Lch/qos/logback/classic/spi/LoggerContextListener;

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/LoggerContext;->addListener(Lch/qos/logback/classic/spi/LoggerContextListener;)V

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->popObject()Ljava/lang/Object;

    goto :goto_4
.end method
