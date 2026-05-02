.class public Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;
.super Lch/qos/logback/core/joran/action/ImplicitAction;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/joran/action/NestedComplexPropertyIA$1;
    }
.end annotation


# instance fields
.field actionDataStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lch/qos/logback/core/joran/action/IADataForComplexProperty;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/ImplicitAction;-><init>()V

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->actionDataStack:Ljava/util/Stack;

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 11

    const/4 v6, 0x1

    iget-object v0, p0, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->actionDataStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/action/IADataForComplexProperty;

    const-string v1, "class"

    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :try_start_13
    invoke-static {v2}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_41

    iget-object v1, p0, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->context:Lch/qos/logback/core/Context;

    invoke-static {v2, v1}, Lch/qos/logback/core/util/Loader;->loadClass(Ljava/lang/String;Lch/qos/logback/core/Context;)Ljava/lang/Class;

    move-result-object v1

    :goto_1f
    if-nez v1, :cond_54

    const/4 v1, 0x1

    iput-boolean v1, v0, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->inError:Z

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not find an appropriate class for property ["

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "]"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->addError(Ljava/lang/String;)V

    :goto_40
    return-void

    :cond_41
    iget-object v1, v0, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->parentBean:Lch/qos/logback/core/joran/util/PropertySetter;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->getComplexPropertyName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->getAggregationType()Lch/qos/logback/core/util/AggregationType;

    move-result-object v4

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->getDefaultNestedComponentRegistry()Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;

    move-result-object v5

    invoke-virtual {v1, v3, v4, v5}, Lch/qos/logback/core/joran/util/PropertySetter;->getClassNameViaImplicitRules(Ljava/lang/String;Lch/qos/logback/core/util/AggregationType;Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_1f

    :cond_54
    invoke-static {v2}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_84

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Assuming default type ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] for ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] property"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->addInfo(Ljava/lang/String;)V

    :cond_84
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->setNestedComplexProperty(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->getNestedComplexProperty()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lch/qos/logback/core/spi/ContextAware;

    if-eqz v1, :cond_9e

    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->getNestedComplexProperty()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lch/qos/logback/core/spi/ContextAware;

    iget-object v3, p0, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->context:Lch/qos/logback/core/Context;

    invoke-interface {v1, v3}, Lch/qos/logback/core/spi/ContextAware;->setContext(Lch/qos/logback/core/Context;)V

    :cond_9e
    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->getNestedComplexProperty()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->pushObject(Ljava/lang/Object;)V
    :try_end_a5
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_a5} :catch_a6

    goto :goto_40

    :catch_a6
    move-exception v1

    iput-boolean v6, v0, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->inError:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not create component ["

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "] of type ["

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_40
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 7

    iget-object v0, p0, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->actionDataStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/action/IADataForComplexProperty;

    iget-boolean v1, v0, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->inError:Z

    if-eqz v1, :cond_d

    :goto_c
    return-void

    :cond_d
    new-instance v1, Lch/qos/logback/core/joran/util/PropertySetter;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->getNestedComplexProperty()Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v2}, Lch/qos/logback/core/joran/util/PropertySetter;-><init>(Ljava/lang/Object;)V

    iget-object v2, p0, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v1, v2}, Lch/qos/logback/core/joran/util/PropertySetter;->setContext(Lch/qos/logback/core/Context;)V

    const-string v2, "parent"

    invoke-virtual {v1, v2}, Lch/qos/logback/core/joran/util/PropertySetter;->computeAggregationType(Ljava/lang/String;)Lch/qos/logback/core/util/AggregationType;

    move-result-object v2

    sget-object v3, Lch/qos/logback/core/util/AggregationType;->AS_COMPLEX_PROPERTY:Lch/qos/logback/core/util/AggregationType;

    if-ne v2, v3, :cond_30

    const-string v2, "parent"

    iget-object v3, v0, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->parentBean:Lch/qos/logback/core/joran/util/PropertySetter;

    invoke-virtual {v3}, Lch/qos/logback/core/joran/util/PropertySetter;->getObj()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lch/qos/logback/core/joran/util/PropertySetter;->setComplexProperty(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_30
    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->getNestedComplexProperty()Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lch/qos/logback/core/spi/LifeCycle;

    if-eqz v2, :cond_43

    invoke-static {v1}, Lch/qos/logback/core/joran/spi/NoAutoStartUtil;->notMarkedWithNoAutoStart(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_43

    check-cast v1, Lch/qos/logback/core/spi/LifeCycle;

    invoke-interface {v1}, Lch/qos/logback/core/spi/LifeCycle;->start()V

    :cond_43
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->getNestedComplexProperty()Ljava/lang/Object;

    move-result-object v2

    if-eq v1, v2, :cond_53

    const-string v0, "The object on the top the of the stack is not the component pushed earlier."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->addError(Ljava/lang/String;)V

    goto :goto_c

    :cond_53
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->popObject()Ljava/lang/Object;

    sget-object v1, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA$1;->$SwitchMap$ch$qos$logback$core$util$AggregationType:[I

    iget-object v2, v0, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->aggregationType:Lch/qos/logback/core/util/AggregationType;

    invoke-virtual {v2}, Lch/qos/logback/core/util/AggregationType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_78

    goto :goto_c

    :pswitch_64
    iget-object v1, v0, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->parentBean:Lch/qos/logback/core/joran/util/PropertySetter;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->getNestedComplexProperty()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, p2, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->addComplexProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_c

    :pswitch_6e
    iget-object v1, v0, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->parentBean:Lch/qos/logback/core/joran/util/PropertySetter;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;->getNestedComplexProperty()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, p2, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->setComplexProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_c

    :pswitch_data_78
    .packed-switch 0x4
        :pswitch_64
        :pswitch_6e
    .end packed-switch
.end method

.method public isApplicable(Lch/qos/logback/core/joran/spi/ElementPath;Lorg/xml/sax/Attributes;Lch/qos/logback/core/joran/spi/InterpretationContext;)Z
    .registers 10

    const/4 v0, 0x0

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/ElementPath;->peekLast()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3}, Lch/qos/logback/core/joran/spi/InterpretationContext;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_c

    :goto_b
    :pswitch_b
    return v0

    :cond_c
    invoke-virtual {p3}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v2

    new-instance v3, Lch/qos/logback/core/joran/util/PropertySetter;

    invoke-direct {v3, v2}, Lch/qos/logback/core/joran/util/PropertySetter;-><init>(Ljava/lang/Object;)V

    iget-object v2, p0, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v3, v2}, Lch/qos/logback/core/joran/util/PropertySetter;->setContext(Lch/qos/logback/core/Context;)V

    invoke-virtual {v3, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->computeAggregationType(Ljava/lang/String;)Lch/qos/logback/core/util/AggregationType;

    move-result-object v2

    sget-object v4, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA$1;->$SwitchMap$ch$qos$logback$core$util$AggregationType:[I

    invoke-virtual {v2}, Lch/qos/logback/core/util/AggregationType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_4c

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PropertySetter.computeAggregationType returned "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->addError(Ljava/lang/String;)V

    goto :goto_b

    :pswitch_40
    new-instance v0, Lch/qos/logback/core/joran/action/IADataForComplexProperty;

    invoke-direct {v0, v3, v2, v1}, Lch/qos/logback/core/joran/action/IADataForComplexProperty;-><init>(Lch/qos/logback/core/joran/util/PropertySetter;Lch/qos/logback/core/util/AggregationType;Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/core/joran/action/NestedComplexPropertyIA;->actionDataStack:Ljava/util/Stack;

    invoke-virtual {v1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    goto :goto_b

    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_40
        :pswitch_40
    .end packed-switch
.end method
