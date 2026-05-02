.class public abstract Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;
.super Lch/qos/logback/core/joran/GenericConfigurator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/joran/GenericConfigurator;"
    }
.end annotation


# static fields
.field static final ONE_AND_ONLY_ONE_URL:Ljava/lang/String; = "http://logback.qos.ch/codes.html#1andOnly1"


# instance fields
.field errorEmmissionCount:I

.field protected final key:Ljava/lang/String;

.field protected final parentPropertyMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected final value:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lch/qos/logback/core/joran/GenericConfigurator;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->errorEmmissionCount:I

    iput-object p1, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->key:Ljava/lang/String;

    iput-object p2, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->value:Ljava/lang/String;

    iput-object p3, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->parentPropertyMap:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method protected addImplicitRules(Lch/qos/logback/core/joran/spi/Interpreter;)V
    .registers 4

    new-instance v0, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;

    invoke-direct {v0}, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->setContext(Lch/qos/logback/core/Context;)V

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/Interpreter;->addImplicitAction(Lch/qos/logback/core/joran/action/ImplicitAction;)V

    new-instance v0, Lch/qos/logback/core/joran/action/NestedBasicPropertyIA;

    invoke-direct {v0}, Lch/qos/logback/core/joran/action/NestedBasicPropertyIA;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/joran/action/NestedBasicPropertyIA;->setContext(Lch/qos/logback/core/Context;)V

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/Interpreter;->addImplicitAction(Lch/qos/logback/core/joran/action/ImplicitAction;)V

    return-void
.end method

.method protected addInstanceRules(Lch/qos/logback/core/joran/spi/RuleStore;)V
    .registers 4

    new-instance v0, Lch/qos/logback/core/joran/spi/ElementSelector;

    const-string v1, "configuration/property"

    invoke-direct {v0, v1}, Lch/qos/logback/core/joran/spi/ElementSelector;-><init>(Ljava/lang/String;)V

    new-instance v1, Lch/qos/logback/core/joran/action/PropertyAction;

    invoke-direct {v1}, Lch/qos/logback/core/joran/action/PropertyAction;-><init>()V

    invoke-interface {p1, v0, v1}, Lch/qos/logback/core/joran/spi/RuleStore;->addRule(Lch/qos/logback/core/joran/spi/ElementSelector;Lch/qos/logback/core/joran/action/Action;)V

    new-instance v0, Lch/qos/logback/core/joran/spi/ElementSelector;

    const-string v1, "configuration/timestamp"

    invoke-direct {v0, v1}, Lch/qos/logback/core/joran/spi/ElementSelector;-><init>(Ljava/lang/String;)V

    new-instance v1, Lch/qos/logback/core/joran/action/TimestampAction;

    invoke-direct {v1}, Lch/qos/logback/core/joran/action/TimestampAction;-><init>()V

    invoke-interface {p1, v0, v1}, Lch/qos/logback/core/joran/spi/RuleStore;->addRule(Lch/qos/logback/core/joran/spi/ElementSelector;Lch/qos/logback/core/joran/action/Action;)V

    new-instance v0, Lch/qos/logback/core/joran/spi/ElementSelector;

    const-string v1, "configuration/define"

    invoke-direct {v0, v1}, Lch/qos/logback/core/joran/spi/ElementSelector;-><init>(Ljava/lang/String;)V

    new-instance v1, Lch/qos/logback/core/joran/action/DefinePropertyAction;

    invoke-direct {v1}, Lch/qos/logback/core/joran/action/DefinePropertyAction;-><init>()V

    invoke-interface {p1, v0, v1}, Lch/qos/logback/core/joran/spi/RuleStore;->addRule(Lch/qos/logback/core/joran/spi/ElementSelector;Lch/qos/logback/core/joran/action/Action;)V

    return-void
.end method

.method public doConfigure(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/JoranException;
        }
    .end annotation

    invoke-super {p0, p1}, Lch/qos/logback/core/joran/GenericConfigurator;->doConfigure(Ljava/util/List;)V

    return-void
.end method

.method public abstract getAppender()Lch/qos/logback/core/Appender;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/Appender",
            "<TE;>;"
        }
    .end annotation
.end method

.method protected oneAndOnlyOneCheck(Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<**>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    if-nez v1, :cond_1a

    iget v0, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->errorEmmissionCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->errorEmmissionCount:I

    const-string v0, "No nested appenders found within the <sift> element in SiftingAppender."

    :cond_f
    :goto_f
    if-eqz v0, :cond_19

    iget v1, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->errorEmmissionCount:I

    const/4 v2, 0x4

    if-ge v1, v2, :cond_19

    invoke-virtual {p0, v0}, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->addError(Ljava/lang/String;)V

    :cond_19
    return-void

    :cond_1a
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_f

    iget v0, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->errorEmmissionCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->errorEmmissionCount:I

    const-string v0, "Only and only one appender can be nested the <sift> element in SiftingAppender. See also http://logback.qos.ch/codes.html#1andOnly1"

    goto :goto_f
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

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
