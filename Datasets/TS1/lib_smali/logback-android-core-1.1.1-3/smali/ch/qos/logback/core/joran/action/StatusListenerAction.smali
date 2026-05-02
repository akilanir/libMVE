.class public Lch/qos/logback/core/joran/action/StatusListenerAction;
.super Lch/qos/logback/core/joran/action/Action;


# instance fields
.field inError:Z

.field statusListener:Lch/qos/logback/core/status/StatusListener;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->inError:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->statusListener:Lch/qos/logback/core/status/StatusListener;

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

    iput-boolean v0, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->inError:Z

    const-string v0, "class"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_37

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Missing class name for statusListener. Near ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] line "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lch/qos/logback/core/joran/action/StatusListenerAction;->getLineNumber(Lch/qos/logback/core/joran/spi/InterpretationContext;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/StatusListenerAction;->addError(Ljava/lang/String;)V

    iput-boolean v3, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->inError:Z

    :goto_36
    return-void

    :cond_37
    :try_start_37
    const-class v0, Lch/qos/logback/core/status/OnConsoleStatusListener;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8f

    iget-object v0, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->context:Lch/qos/logback/core/Context;

    invoke-static {v0}, Lch/qos/logback/core/status/OnConsoleStatusListener;->addNewInstanceToContext(Lch/qos/logback/core/Context;)V

    :cond_48
    :goto_48
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Added status listener of type ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/StatusListenerAction;->addInfo(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->statusListener:Lch/qos/logback/core/status/StatusListener;

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->pushObject(Ljava/lang/Object;)V
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_69} :catch_6a

    goto :goto_36

    :catch_6a
    move-exception v0

    iput-boolean v3, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->inError:Z

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not create an StatusListener of type ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/joran/action/StatusListenerAction;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v1, Lch/qos/logback/core/joran/spi/ActionException;

    invoke-direct {v1, v0}, Lch/qos/logback/core/joran/spi/ActionException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :cond_8f
    :try_start_8f
    const-class v0, Lch/qos/logback/core/status/StatusListener;

    iget-object v2, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->context:Lch/qos/logback/core/Context;

    invoke-static {v1, v0, v2}, Lch/qos/logback/core/util/OptionHelper;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Lch/qos/logback/core/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/StatusListener;

    iput-object v0, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->statusListener:Lch/qos/logback/core/status/StatusListener;

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    invoke-interface {v0}, Lch/qos/logback/core/Context;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    iget-object v2, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->statusListener:Lch/qos/logback/core/status/StatusListener;

    invoke-interface {v0, v2}, Lch/qos/logback/core/status/StatusManager;->add(Lch/qos/logback/core/status/StatusListener;)V

    iget-object v0, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->statusListener:Lch/qos/logback/core/status/StatusListener;

    instance-of v0, v0, Lch/qos/logback/core/spi/ContextAware;

    if-eqz v0, :cond_48

    iget-object v0, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->statusListener:Lch/qos/logback/core/status/StatusListener;

    check-cast v0, Lch/qos/logback/core/spi/ContextAware;

    iget-object v2, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->context:Lch/qos/logback/core/Context;

    invoke-interface {v0, v2}, Lch/qos/logback/core/spi/ContextAware;->setContext(Lch/qos/logback/core/Context;)V
    :try_end_b7
    .catch Ljava/lang/Exception; {:try_start_8f .. :try_end_b7} :catch_6a

    goto :goto_48
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 5

    iget-boolean v0, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->inError:Z

    if-eqz v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->statusListener:Lch/qos/logback/core/status/StatusListener;

    instance-of v0, v0, Lch/qos/logback/core/spi/LifeCycle;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->statusListener:Lch/qos/logback/core/status/StatusListener;

    check-cast v0, Lch/qos/logback/core/spi/LifeCycle;

    invoke-interface {v0}, Lch/qos/logback/core/spi/LifeCycle;->start()V

    :cond_12
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/action/StatusListenerAction;->statusListener:Lch/qos/logback/core/status/StatusListener;

    if-eq v0, v1, :cond_20

    const-string v0, "The object at the of the stack is not the statusListener pushed earlier."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/StatusListenerAction;->addWarn(Ljava/lang/String;)V

    goto :goto_4

    :cond_20
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->popObject()Ljava/lang/Object;

    goto :goto_4
.end method

.method public finish(Lch/qos/logback/core/joran/spi/InterpretationContext;)V
    .registers 2

    return-void
.end method
