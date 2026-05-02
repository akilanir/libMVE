.class public Lch/qos/logback/classic/joran/action/LoggerAction;
.super Lch/qos/logback/core/joran/action/Action;


# static fields
.field public static final LEVEL_ATTRIBUTE:Ljava/lang/String; = "level"


# instance fields
.field inError:Z

.field logger:Lch/qos/logback/classic/Logger;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->inError:Z

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 8

    const/4 v3, 0x0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->inError:Z

    iput-object v3, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->logger:Lch/qos/logback/classic/Logger;

    iget-object v0, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->context:Lch/qos/logback/core/Context;

    check-cast v0, Lch/qos/logback/classic/LoggerContext;

    const-string v1, "name"

    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_42

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->inError:Z

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/joran/action/LoggerAction;->getLineColStr(Lch/qos/logback/core/joran/spi/InterpretationContext;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No \'name\' attribute in element "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", around "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/LoggerAction;->addError(Ljava/lang/String;)V

    :goto_41
    return-void

    :cond_42
    invoke-virtual {v0, v1}, Lch/qos/logback/classic/LoggerContext;->getLogger(Ljava/lang/String;)Lch/qos/logback/classic/Logger;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->logger:Lch/qos/logback/classic/Logger;

    const-string v0, "level"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_89

    const-string v2, "INHERITED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_68

    const-string v2, "NULL"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_cd

    :cond_68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting level of logger ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "] to null, i.e. INHERITED"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/LoggerAction;->addInfo(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->logger:Lch/qos/logback/classic/Logger;

    invoke-virtual {v0, v3}, Lch/qos/logback/classic/Logger;->setLevel(Lch/qos/logback/classic/Level;)V

    :cond_89
    :goto_89
    const-string v0, "additivity"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_c6

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting additivity of logger ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/classic/joran/action/LoggerAction;->addInfo(Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->logger:Lch/qos/logback/classic/Logger;

    invoke-virtual {v1, v0}, Lch/qos/logback/classic/Logger;->setAdditive(Z)V

    :cond_c6
    iget-object v0, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->logger:Lch/qos/logback/classic/Logger;

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->pushObject(Ljava/lang/Object;)V

    goto/16 :goto_41

    :cond_cd
    invoke-static {v0}, Lch/qos/logback/classic/Level;->toLevel(Ljava/lang/String;)Lch/qos/logback/classic/Level;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting level of logger ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lch/qos/logback/classic/joran/action/LoggerAction;->addInfo(Ljava/lang/String;)V

    iget-object v2, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->logger:Lch/qos/logback/classic/Logger;

    invoke-virtual {v2, v0}, Lch/qos/logback/classic/Logger;->setLevel(Lch/qos/logback/classic/Level;)V

    goto :goto_89
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 6

    iget-boolean v0, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->inError:Z

    if-eqz v0, :cond_5

    :goto_4
    return-void

    :cond_5
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->logger:Lch/qos/logback/classic/Logger;

    if-eq v0, v1, :cond_42

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The object on the top the of the stack is not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/classic/joran/action/LoggerAction;->logger:Lch/qos/logback/classic/Logger;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pushed earlier"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/classic/joran/action/LoggerAction;->addWarn(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "It is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/LoggerAction;->addWarn(Ljava/lang/String;)V

    goto :goto_4

    :cond_42
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->popObject()Ljava/lang/Object;

    goto :goto_4
.end method

.method public finish(Lch/qos/logback/core/joran/spi/InterpretationContext;)V
    .registers 2

    return-void
.end method
