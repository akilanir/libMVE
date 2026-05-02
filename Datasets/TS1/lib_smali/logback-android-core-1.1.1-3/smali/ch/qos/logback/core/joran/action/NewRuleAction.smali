.class public Lch/qos/logback/core/joran/action/NewRuleAction;
.super Lch/qos/logback/core/joran/action/Action;


# instance fields
.field inError:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/joran/action/NewRuleAction;->inError:Z

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 9

    const/4 v4, 0x1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/joran/action/NewRuleAction;->inError:Z

    const-string v0, "pattern"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "actionClass"

    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1e

    iput-boolean v4, p0, Lch/qos/logback/core/joran/action/NewRuleAction;->inError:Z

    const-string v0, "No \'pattern\' attribute in <newRule>"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/NewRuleAction;->addError(Ljava/lang/String;)V

    :goto_1d
    return-void

    :cond_1e
    invoke-static {v1}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2c

    iput-boolean v4, p0, Lch/qos/logback/core/joran/action/NewRuleAction;->inError:Z

    const-string v0, "No \'actionClass\' attribute in <newRule>"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/NewRuleAction;->addError(Ljava/lang/String;)V

    goto :goto_1d

    :cond_2c
    :try_start_2c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "About to add new Joran parsing rule ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lch/qos/logback/core/joran/action/NewRuleAction;->addInfo(Ljava/lang/String;)V

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->getJoranInterpreter()Lch/qos/logback/core/joran/spi/Interpreter;

    move-result-object v2

    invoke-virtual {v2}, Lch/qos/logback/core/joran/spi/Interpreter;->getRuleStore()Lch/qos/logback/core/joran/spi/RuleStore;

    move-result-object v2

    new-instance v3, Lch/qos/logback/core/joran/spi/ElementSelector;

    invoke-direct {v3, v0}, Lch/qos/logback/core/joran/spi/ElementSelector;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3, v1}, Lch/qos/logback/core/joran/spi/RuleStore;->addRule(Lch/qos/logback/core/joran/spi/ElementSelector;Ljava/lang/String;)V
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_62} :catch_63

    goto :goto_1d

    :catch_63
    move-exception v2

    iput-boolean v4, p0, Lch/qos/logback/core/joran/action/NewRuleAction;->inError:Z

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not add new Joran parsing rule ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/NewRuleAction;->addError(Ljava/lang/String;)V

    goto :goto_1d
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 3

    return-void
.end method

.method public finish(Lch/qos/logback/core/joran/spi/InterpretationContext;)V
    .registers 2

    return-void
.end method
