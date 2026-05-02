.class public Lch/qos/logback/core/subst/NodeToStringTransformer;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/subst/NodeToStringTransformer$1;
    }
.end annotation


# instance fields
.field final node:Lch/qos/logback/core/subst/Node;

.field final propertyContainer0:Lch/qos/logback/core/spi/PropertyContainer;

.field final propertyContainer1:Lch/qos/logback/core/spi/PropertyContainer;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/subst/Node;Lch/qos/logback/core/spi/PropertyContainer;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lch/qos/logback/core/subst/NodeToStringTransformer;-><init>(Lch/qos/logback/core/subst/Node;Lch/qos/logback/core/spi/PropertyContainer;Lch/qos/logback/core/spi/PropertyContainer;)V

    return-void
.end method

.method public constructor <init>(Lch/qos/logback/core/subst/Node;Lch/qos/logback/core/spi/PropertyContainer;Lch/qos/logback/core/spi/PropertyContainer;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/subst/NodeToStringTransformer;->node:Lch/qos/logback/core/subst/Node;

    iput-object p2, p0, Lch/qos/logback/core/subst/NodeToStringTransformer;->propertyContainer0:Lch/qos/logback/core/spi/PropertyContainer;

    iput-object p3, p0, Lch/qos/logback/core/subst/NodeToStringTransformer;->propertyContainer1:Lch/qos/logback/core/spi/PropertyContainer;

    return-void
.end method

.method private compileNode(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;Ljava/util/Stack;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/subst/Node;",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Stack",
            "<",
            "Lch/qos/logback/core/subst/Node;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    :goto_0
    if-eqz p1, :cond_1a

    sget-object v0, Lch/qos/logback/core/subst/NodeToStringTransformer$1;->$SwitchMap$ch$qos$logback$core$subst$Node$Type:[I

    iget-object v1, p1, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    invoke-virtual {v1}, Lch/qos/logback/core/subst/Node$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1c

    :goto_f
    iget-object p1, p1, Lch/qos/logback/core/subst/Node;->next:Lch/qos/logback/core/subst/Node;

    goto :goto_0

    :pswitch_12
    invoke-direct {p0, p1, p2}, Lch/qos/logback/core/subst/NodeToStringTransformer;->handleLiteral(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;)V

    goto :goto_f

    :pswitch_16
    invoke-direct {p0, p1, p2, p3}, Lch/qos/logback/core/subst/NodeToStringTransformer;->handleVariable(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;Ljava/util/Stack;)V

    goto :goto_f

    :cond_1a
    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_12
        :pswitch_16
    .end packed-switch
.end method

.method private constructRecursionErrorMessage(Ljava/util/Stack;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Stack",
            "<",
            "Lch/qos/logback/core/subst/Node;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v0, "Circular variable reference detected while parsing input ["

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_36

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/subst/Node;

    const-string v3, "${"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0, v0}, Lch/qos/logback/core/subst/NodeToStringTransformer;->variableNodeValue(Lch/qos/logback/core/subst/Node;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "}"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/util/Stack;->lastElement()Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v0, :cond_b

    const-string v0, " --> "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    :cond_36
    const-string v0, "]"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private equalNodes(Lch/qos/logback/core/subst/Node;Lch/qos/logback/core/subst/Node;)Z
    .registers 6

    const/4 v0, 0x0

    iget-object v1, p1, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    if-eqz v1, :cond_10

    iget-object v1, p1, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    iget-object v2, p2, Lch/qos/logback/core/subst/Node;->type:Lch/qos/logback/core/subst/Node$Type;

    invoke-virtual {v1, v2}, Lch/qos/logback/core/subst/Node$Type;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    :cond_f
    :goto_f
    return v0

    :cond_10
    iget-object v1, p1, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    if-eqz v1, :cond_1e

    iget-object v1, p1, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    iget-object v2, p2, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    :cond_1e
    iget-object v1, p1, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    if-eqz v1, :cond_2c

    iget-object v1, p1, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    iget-object v2, p2, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    :cond_2c
    const/4 v0, 0x1

    goto :goto_f
.end method

.method private handleLiteral(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;)V
    .registers 4

    iget-object v0, p1, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method private handleVariable(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;Ljava/util/Stack;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/subst/Node;",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Stack",
            "<",
            "Lch/qos/logback/core/subst/Node;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    invoke-direct {p0, p1, p3}, Lch/qos/logback/core/subst/NodeToStringTransformer;->haveVisitedNodeAlready(Lch/qos/logback/core/subst/Node;Ljava/util/Stack;)Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-virtual {p3, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, p3}, Lch/qos/logback/core/subst/NodeToStringTransformer;->constructRecursionErrorMessage(Ljava/util/Stack;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_13
    invoke-virtual {p3, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p1, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    check-cast v0, Lch/qos/logback/core/subst/Node;

    invoke-direct {p0, v0, v1, p3}, Lch/qos/logback/core/subst/NodeToStringTransformer;->compileNode(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;Ljava/util/Stack;)V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lch/qos/logback/core/subst/NodeToStringTransformer;->lookupKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_37

    invoke-static {v1}, Lch/qos/logback/core/subst/NodeToStringTransformer;->tokenizeAndParseString(Ljava/lang/String;)Lch/qos/logback/core/subst/Node;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lch/qos/logback/core/subst/NodeToStringTransformer;->compileNode(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;Ljava/util/Stack;)V

    invoke-virtual {p3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    :goto_36
    return-void

    :cond_37
    iget-object v1, p1, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    if-nez v1, :cond_55

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_IS_UNDEFINED"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    goto :goto_36

    :cond_55
    iget-object v0, p1, Lch/qos/logback/core/subst/Node;->defaultPart:Ljava/lang/Object;

    check-cast v0, Lch/qos/logback/core/subst/Node;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v0, v1, p3}, Lch/qos/logback/core/subst/NodeToStringTransformer;->compileNode(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;Ljava/util/Stack;)V

    invoke-virtual {p3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_36
.end method

.method private haveVisitedNodeAlready(Lch/qos/logback/core/subst/Node;Ljava/util/Stack;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/subst/Node;",
            "Ljava/util/Stack",
            "<",
            "Lch/qos/logback/core/subst/Node;",
            ">;)Z"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/subst/Node;

    invoke-direct {p0, p1, v0}, Lch/qos/logback/core/subst/NodeToStringTransformer;->equalNodes(Lch/qos/logback/core/subst/Node;Lch/qos/logback/core/subst/Node;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method private lookupKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const/4 v1, 0x0

    iget-object v0, p0, Lch/qos/logback/core/subst/NodeToStringTransformer;->propertyContainer0:Lch/qos/logback/core/spi/PropertyContainer;

    invoke-interface {v0, p1}, Lch/qos/logback/core/spi/PropertyContainer;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_a

    :cond_9
    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lch/qos/logback/core/subst/NodeToStringTransformer;->propertyContainer1:Lch/qos/logback/core/spi/PropertyContainer;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lch/qos/logback/core/subst/NodeToStringTransformer;->propertyContainer1:Lch/qos/logback/core/spi/PropertyContainer;

    invoke-interface {v0, p1}, Lch/qos/logback/core/spi/PropertyContainer;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_9

    :cond_16
    invoke-static {p1, v1}, Lch/qos/logback/core/util/OptionHelper;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_9

    invoke-static {p1}, Lch/qos/logback/core/util/OptionHelper;->getEnv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_9

    move-object v0, v1

    goto :goto_9
.end method

.method public static substituteVariable(Ljava/lang/String;Lch/qos/logback/core/spi/PropertyContainer;Lch/qos/logback/core/spi/PropertyContainer;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    invoke-static {p0}, Lch/qos/logback/core/subst/NodeToStringTransformer;->tokenizeAndParseString(Ljava/lang/String;)Lch/qos/logback/core/subst/Node;

    move-result-object v0

    new-instance v1, Lch/qos/logback/core/subst/NodeToStringTransformer;

    invoke-direct {v1, v0, p1, p2}, Lch/qos/logback/core/subst/NodeToStringTransformer;-><init>(Lch/qos/logback/core/subst/Node;Lch/qos/logback/core/spi/PropertyContainer;Lch/qos/logback/core/spi/PropertyContainer;)V

    invoke-virtual {v1}, Lch/qos/logback/core/subst/NodeToStringTransformer;->transform()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static tokenizeAndParseString(Ljava/lang/String;)Lch/qos/logback/core/subst/Node;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    new-instance v0, Lch/qos/logback/core/subst/Tokenizer;

    invoke-direct {v0, p0}, Lch/qos/logback/core/subst/Tokenizer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lch/qos/logback/core/subst/Tokenizer;->tokenize()Ljava/util/List;

    move-result-object v0

    new-instance v1, Lch/qos/logback/core/subst/Parser;

    invoke-direct {v1, v0}, Lch/qos/logback/core/subst/Parser;-><init>(Ljava/util/List;)V

    invoke-virtual {v1}, Lch/qos/logback/core/subst/Parser;->parse()Lch/qos/logback/core/subst/Node;

    move-result-object v0

    return-object v0
.end method

.method private variableNodeValue(Lch/qos/logback/core/subst/Node;)Ljava/lang/String;
    .registers 3

    iget-object v0, p1, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    check-cast v0, Lch/qos/logback/core/subst/Node;

    iget-object v0, v0, Lch/qos/logback/core/subst/Node;->payload:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public transform()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/subst/NodeToStringTransformer;->node:Lch/qos/logback/core/subst/Node;

    new-instance v2, Ljava/util/Stack;

    invoke-direct {v2}, Ljava/util/Stack;-><init>()V

    invoke-direct {p0, v1, v0, v2}, Lch/qos/logback/core/subst/NodeToStringTransformer;->compileNode(Lch/qos/logback/core/subst/Node;Ljava/lang/StringBuilder;Ljava/util/Stack;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
