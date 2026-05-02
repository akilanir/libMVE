.class public Lch/qos/logback/core/joran/action/NestedBasicPropertyIA;
.super Lch/qos/logback/core/joran/action/ImplicitAction;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/joran/action/NestedBasicPropertyIA$1;
    }
.end annotation


# instance fields
.field actionDataStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lch/qos/logback/core/joran/action/IADataForBasicProperty;",
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

    iput-object v0, p0, Lch/qos/logback/core/joran/action/NestedBasicPropertyIA;->actionDataStack:Ljava/util/Stack;

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 4

    return-void
.end method

.method public body(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 7

    invoke-virtual {p1, p2}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lch/qos/logback/core/joran/action/NestedBasicPropertyIA;->actionDataStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/action/IADataForBasicProperty;

    sget-object v2, Lch/qos/logback/core/joran/action/NestedBasicPropertyIA$1;->$SwitchMap$ch$qos$logback$core$util$AggregationType:[I

    iget-object v3, v0, Lch/qos/logback/core/joran/action/IADataForBasicProperty;->aggregationType:Lch/qos/logback/core/util/AggregationType;

    invoke-virtual {v3}, Lch/qos/logback/core/util/AggregationType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_2a

    :goto_19
    return-void

    :pswitch_1a
    iget-object v2, v0, Lch/qos/logback/core/joran/action/IADataForBasicProperty;->parentBean:Lch/qos/logback/core/joran/util/PropertySetter;

    iget-object v0, v0, Lch/qos/logback/core/joran/action/IADataForBasicProperty;->propertyName:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_19

    :pswitch_22
    iget-object v2, v0, Lch/qos/logback/core/joran/action/IADataForBasicProperty;->parentBean:Lch/qos/logback/core/joran/util/PropertySetter;

    iget-object v0, v0, Lch/qos/logback/core/joran/action/IADataForBasicProperty;->propertyName:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->addBasicProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_19

    :pswitch_data_2a
    .packed-switch 0x4
        :pswitch_1a
        :pswitch_22
    .end packed-switch
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/joran/action/NestedBasicPropertyIA;->actionDataStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    return-void
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

    iget-object v2, p0, Lch/qos/logback/core/joran/action/NestedBasicPropertyIA;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v3, v2}, Lch/qos/logback/core/joran/util/PropertySetter;->setContext(Lch/qos/logback/core/Context;)V

    invoke-virtual {v3, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->computeAggregationType(Ljava/lang/String;)Lch/qos/logback/core/util/AggregationType;

    move-result-object v2

    sget-object v4, Lch/qos/logback/core/joran/action/NestedBasicPropertyIA$1;->$SwitchMap$ch$qos$logback$core$util$AggregationType:[I

    invoke-virtual {v2}, Lch/qos/logback/core/util/AggregationType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_4c

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PropertySetter.canContainComponent returned "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/action/NestedBasicPropertyIA;->addError(Ljava/lang/String;)V

    goto :goto_b

    :pswitch_40
    new-instance v0, Lch/qos/logback/core/joran/action/IADataForBasicProperty;

    invoke-direct {v0, v3, v2, v1}, Lch/qos/logback/core/joran/action/IADataForBasicProperty;-><init>(Lch/qos/logback/core/joran/util/PropertySetter;Lch/qos/logback/core/util/AggregationType;Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/core/joran/action/NestedBasicPropertyIA;->actionDataStack:Ljava/util/Stack;

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
