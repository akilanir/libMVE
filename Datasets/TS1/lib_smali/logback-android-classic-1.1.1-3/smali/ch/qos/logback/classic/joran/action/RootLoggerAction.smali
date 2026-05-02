.class public Lch/qos/logback/classic/joran/action/RootLoggerAction;
.super Lch/qos/logback/core/joran/action/Action;


# instance fields
.field inError:Z

.field root:Lch/qos/logback/classic/Logger;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/joran/action/RootLoggerAction;->inError:Z

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 7

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/joran/action/RootLoggerAction;->inError:Z

    iget-object v0, p0, Lch/qos/logback/classic/joran/action/RootLoggerAction;->context:Lch/qos/logback/core/Context;

    check-cast v0, Lch/qos/logback/classic/LoggerContext;

    const-string v1, "ROOT"

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/LoggerContext;->getLogger(Ljava/lang/String;)Lch/qos/logback/classic/Logger;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/joran/action/RootLoggerAction;->root:Lch/qos/logback/classic/Logger;

    const-string v0, "level"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3e

    invoke-static {v0}, Lch/qos/logback/classic/Level;->toLevel(Ljava/lang/String;)Lch/qos/logback/classic/Level;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting level of ROOT logger to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/classic/joran/action/RootLoggerAction;->addInfo(Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/classic/joran/action/RootLoggerAction;->root:Lch/qos/logback/classic/Logger;

    invoke-virtual {v1, v0}, Lch/qos/logback/classic/Logger;->setLevel(Lch/qos/logback/classic/Level;)V

    :cond_3e
    iget-object v0, p0, Lch/qos/logback/classic/joran/action/RootLoggerAction;->root:Lch/qos/logback/classic/Logger;

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->pushObject(Ljava/lang/Object;)V

    return-void
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 6

    iget-boolean v0, p0, Lch/qos/logback/classic/joran/action/RootLoggerAction;->inError:Z

    if-eqz v0, :cond_5

    :goto_4
    return-void

    :cond_5
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/joran/action/RootLoggerAction;->root:Lch/qos/logback/classic/Logger;

    if-eq v0, v1, :cond_29

    const-string v1, "The object on the top the of the stack is not the root logger"

    invoke-virtual {p0, v1}, Lch/qos/logback/classic/joran/action/RootLoggerAction;->addWarn(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "It is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/RootLoggerAction;->addWarn(Ljava/lang/String;)V

    goto :goto_4

    :cond_29
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->popObject()Ljava/lang/Object;

    goto :goto_4
.end method

.method public finish(Lch/qos/logback/core/joran/spi/InterpretationContext;)V
    .registers 2

    return-void
.end method
