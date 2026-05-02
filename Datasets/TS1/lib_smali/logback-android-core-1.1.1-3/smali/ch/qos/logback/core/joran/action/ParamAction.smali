.class public Lch/qos/logback/core/joran/action/ParamAction;
.super Lch/qos/logback/core/joran/action/Action;


# static fields
.field static NO_NAME:Ljava/lang/String;

.field static NO_VALUE:Ljava/lang/String;


# instance fields
.field inError:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "No name attribute in <param> element"

    sput-object v0, Lch/qos/logback/core/joran/action/ParamAction;->NO_NAME:Ljava/lang/String;

    const-string v0, "No value attribute in <param> element"

    sput-object v0, Lch/qos/logback/core/joran/action/ParamAction;->NO_VALUE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/joran/action/ParamAction;->inError:Z

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 8

    const/4 v2, 0x1

    const-string v0, "name"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "value"

    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v0, :cond_17

    iput-boolean v2, p0, Lch/qos/logback/core/joran/action/ParamAction;->inError:Z

    sget-object v0, Lch/qos/logback/core/joran/action/ParamAction;->NO_NAME:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/ParamAction;->addError(Ljava/lang/String;)V

    :goto_16
    return-void

    :cond_17
    if-nez v1, :cond_21

    iput-boolean v2, p0, Lch/qos/logback/core/joran/action/ParamAction;->inError:Z

    sget-object v0, Lch/qos/logback/core/joran/action/ParamAction;->NO_VALUE:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/ParamAction;->addError(Ljava/lang/String;)V

    goto :goto_16

    :cond_21
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v2

    new-instance v3, Lch/qos/logback/core/joran/util/PropertySetter;

    invoke-direct {v3, v2}, Lch/qos/logback/core/joran/util/PropertySetter;-><init>(Ljava/lang/Object;)V

    iget-object v2, p0, Lch/qos/logback/core/joran/action/ParamAction;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v3, v2}, Lch/qos/logback/core/joran/util/PropertySetter;->setContext(Lch/qos/logback/core/Context;)V

    invoke-virtual {p1, v1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_16
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 3

    return-void
.end method

.method public finish(Lch/qos/logback/core/joran/spi/InterpretationContext;)V
    .registers 2

    return-void
.end method
