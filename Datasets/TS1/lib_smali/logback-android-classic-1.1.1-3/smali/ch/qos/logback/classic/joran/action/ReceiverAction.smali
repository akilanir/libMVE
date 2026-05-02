.class public Lch/qos/logback/classic/joran/action/ReceiverAction;
.super Lch/qos/logback/core/joran/action/Action;


# instance fields
.field private inError:Z

.field private receiver:Lch/qos/logback/classic/net/ReceiverBase;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

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

    const-string v0, "class"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_34

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Missing class name for receiver. Near ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] line "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/joran/action/ReceiverAction;->getLineNumber(Lch/qos/logback/core/joran/spi/InterpretationContext;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/ReceiverAction;->addError(Ljava/lang/String;)V

    iput-boolean v3, p0, Lch/qos/logback/classic/joran/action/ReceiverAction;->inError:Z

    :goto_33
    return-void

    :cond_34
    :try_start_34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "About to instantiate receiver of type ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/ReceiverAction;->addInfo(Ljava/lang/String;)V

    const-class v0, Lch/qos/logback/classic/net/ReceiverBase;

    iget-object v2, p0, Lch/qos/logback/classic/joran/action/ReceiverAction;->context:Lch/qos/logback/core/Context;

    invoke-static {v1, v0, v2}, Lch/qos/logback/core/util/OptionHelper;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Lch/qos/logback/core/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/net/ReceiverBase;

    iput-object v0, p0, Lch/qos/logback/classic/joran/action/ReceiverAction;->receiver:Lch/qos/logback/classic/net/ReceiverBase;

    iget-object v0, p0, Lch/qos/logback/classic/joran/action/ReceiverAction;->receiver:Lch/qos/logback/classic/net/ReceiverBase;

    iget-object v2, p0, Lch/qos/logback/classic/joran/action/ReceiverAction;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v0, v2}, Lch/qos/logback/classic/net/ReceiverBase;->setContext(Lch/qos/logback/core/Context;)V

    iget-object v0, p0, Lch/qos/logback/classic/joran/action/ReceiverAction;->receiver:Lch/qos/logback/classic/net/ReceiverBase;

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->pushObject(Ljava/lang/Object;)V
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_68} :catch_69

    goto :goto_33

    :catch_69
    move-exception v0

    iput-boolean v3, p0, Lch/qos/logback/classic/joran/action/ReceiverAction;->inError:Z

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not create a receiver of type ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/classic/joran/action/ReceiverAction;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v1, Lch/qos/logback/core/joran/spi/ActionException;

    invoke-direct {v1, v0}, Lch/qos/logback/core/joran/spi/ActionException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/ActionException;
        }
    .end annotation

    iget-boolean v0, p0, Lch/qos/logback/classic/joran/action/ReceiverAction;->inError:Z

    if-eqz v0, :cond_5

    :goto_4
    return-void

    :cond_5
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/joran/action/ReceiverAction;->receiver:Lch/qos/logback/classic/net/ReceiverBase;

    invoke-interface {v0, v1}, Lch/qos/logback/core/Context;->register(Lch/qos/logback/core/spi/LifeCycle;)V

    iget-object v0, p0, Lch/qos/logback/classic/joran/action/ReceiverAction;->receiver:Lch/qos/logback/classic/net/ReceiverBase;

    invoke-virtual {v0}, Lch/qos/logback/classic/net/ReceiverBase;->start()V

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/joran/action/ReceiverAction;->receiver:Lch/qos/logback/classic/net/ReceiverBase;

    if-eq v0, v1, :cond_21

    const-string v0, "The object at the of the stack is not the remote pushed earlier."

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/ReceiverAction;->addWarn(Ljava/lang/String;)V

    goto :goto_4

    :cond_21
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->popObject()Ljava/lang/Object;

    goto :goto_4
.end method
