.class public Lch/qos/logback/core/joran/spi/Interpreter;
.super Ljava/lang/Object;


# static fields
.field private static EMPTY_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/action/Action;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field actionListStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/action/Action;",
            ">;>;"
        }
    .end annotation
.end field

.field private final cai:Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;

.field private elementPath:Lch/qos/logback/core/joran/spi/ElementPath;

.field eventPlayer:Lch/qos/logback/core/joran/spi/EventPlayer;

.field private final implicitActions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lch/qos/logback/core/joran/action/ImplicitAction;",
            ">;"
        }
    .end annotation
.end field

.field private final interpretationContext:Lch/qos/logback/core/joran/spi/InterpretationContext;

.field locator:Lorg/xml/sax/Locator;

.field private final ruleStore:Lch/qos/logback/core/joran/spi/RuleStore;

.field skip:Lch/qos/logback/core/joran/spi/ElementPath;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/Vector;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    sput-object v0, Lch/qos/logback/core/joran/spi/Interpreter;->EMPTY_LIST:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lch/qos/logback/core/Context;Lch/qos/logback/core/joran/spi/RuleStore;Lch/qos/logback/core/joran/spi/ElementPath;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->skip:Lch/qos/logback/core/joran/spi/ElementPath;

    new-instance v0, Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;

    invoke-direct {v0, p1, p0}, Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;-><init>(Lch/qos/logback/core/Context;Lch/qos/logback/core/joran/spi/Interpreter;)V

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->cai:Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;

    iput-object p2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->ruleStore:Lch/qos/logback/core/joran/spi/RuleStore;

    new-instance v0, Lch/qos/logback/core/joran/spi/InterpretationContext;

    invoke-direct {v0, p1, p0}, Lch/qos/logback/core/joran/spi/InterpretationContext;-><init>(Lch/qos/logback/core/Context;Lch/qos/logback/core/joran/spi/Interpreter;)V

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->interpretationContext:Lch/qos/logback/core/joran/spi/InterpretationContext;

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->implicitActions:Ljava/util/ArrayList;

    iput-object p3, p0, Lch/qos/logback/core/joran/spi/Interpreter;->elementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->actionListStack:Ljava/util/Stack;

    new-instance v0, Lch/qos/logback/core/joran/spi/EventPlayer;

    invoke-direct {v0, p0}, Lch/qos/logback/core/joran/spi/EventPlayer;-><init>(Lch/qos/logback/core/joran/spi/Interpreter;)V

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->eventPlayer:Lch/qos/logback/core/joran/spi/EventPlayer;

    return-void
.end method

.method private callBodyAction(Ljava/util/List;Ljava/lang/String;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/action/Action;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-nez p1, :cond_3

    :cond_2
    return-void

    :cond_3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/action/Action;

    :try_start_13
    iget-object v1, p0, Lch/qos/logback/core/joran/spi/Interpreter;->interpretationContext:Lch/qos/logback/core/joran/spi/InterpretationContext;

    invoke-virtual {v0, v1, p2}, Lch/qos/logback/core/joran/action/Action;->body(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    :try_end_18
    .catch Lch/qos/logback/core/joran/spi/ActionException; {:try_start_13 .. :try_end_18} :catch_19

    goto :goto_7

    :catch_19
    move-exception v1

    iget-object v3, p0, Lch/qos/logback/core/joran/spi/Interpreter;->cai:Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in end() methd for action ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "]"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0, v1}, Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7
.end method

.method private callEndAction(Ljava/util/List;Ljava/lang/String;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/action/Action;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    if-nez p1, :cond_3

    :cond_2
    return-void

    :cond_3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/action/Action;

    :try_start_13
    iget-object v2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->interpretationContext:Lch/qos/logback/core/joran/spi/InterpretationContext;

    invoke-virtual {v0, v2, p2}, Lch/qos/logback/core/joran/action/Action;->end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    :try_end_18
    .catch Lch/qos/logback/core/joran/spi/ActionException; {:try_start_13 .. :try_end_18} :catch_19
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_18} :catch_39

    goto :goto_7

    :catch_19
    move-exception v0

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->cai:Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ActionException in Action for tag ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7

    :catch_39
    move-exception v0

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->cai:Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RuntimeException in Action for tag ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7
.end method

.method private endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->actionListStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/Interpreter;->skip:Lch/qos/logback/core/joran/spi/ElementPath;

    if-eqz v1, :cond_1f

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->skip:Lch/qos/logback/core/joran/spi/ElementPath;

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/Interpreter;->elementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/joran/spi/ElementPath;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->skip:Lch/qos/logback/core/joran/spi/ElementPath;

    :cond_19
    :goto_19
    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->elementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/ElementPath;->pop()V

    return-void

    :cond_1f
    sget-object v1, Lch/qos/logback/core/joran/spi/Interpreter;->EMPTY_LIST:Ljava/util/List;

    if-eq v0, v1, :cond_19

    invoke-virtual {p0, p2, p3}, Lch/qos/logback/core/joran/spi/Interpreter;->getTagName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lch/qos/logback/core/joran/spi/Interpreter;->callEndAction(Ljava/util/List;Ljava/lang/String;)V

    goto :goto_19
.end method

.method private pushEmptyActionList()V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->actionListStack:Ljava/util/Stack;

    sget-object v1, Lch/qos/logback/core/joran/spi/Interpreter;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 8

    invoke-virtual {p0, p2, p3}, Lch/qos/logback/core/joran/spi/Interpreter;->getTagName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/Interpreter;->elementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-virtual {v1, v0}, Lch/qos/logback/core/joran/spi/ElementPath;->push(Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/Interpreter;->skip:Lch/qos/logback/core/joran/spi/ElementPath;

    if-eqz v1, :cond_11

    invoke-direct {p0}, Lch/qos/logback/core/joran/spi/Interpreter;->pushEmptyActionList()V

    :goto_10
    return-void

    :cond_11
    iget-object v1, p0, Lch/qos/logback/core/joran/spi/Interpreter;->elementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-virtual {p0, v1, p4}, Lch/qos/logback/core/joran/spi/Interpreter;->getApplicableActionList(Lch/qos/logback/core/joran/spi/ElementPath;Lorg/xml/sax/Attributes;)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_22

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->actionListStack:Ljava/util/Stack;

    invoke-virtual {v2, v1}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v1, v0, p4}, Lch/qos/logback/core/joran/spi/Interpreter;->callBeginAction(Ljava/util/List;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    goto :goto_10

    :cond_22
    invoke-direct {p0}, Lch/qos/logback/core/joran/spi/Interpreter;->pushEmptyActionList()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "no applicable action for ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "], current ElementPath  is ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/Interpreter;->elementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/Interpreter;->cai:Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;

    invoke-virtual {v1, v0}, Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;->addError(Ljava/lang/String;)V

    goto :goto_10
.end method


# virtual methods
.method public addImplicitAction(Lch/qos/logback/core/joran/action/ImplicitAction;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->implicitActions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method callBeginAction(Ljava/util/List;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/action/Action;",
            ">;",
            "Ljava/lang/String;",
            "Lorg/xml/sax/Attributes;",
            ")V"
        }
    .end annotation

    if-nez p1, :cond_3

    :cond_2
    return-void

    :cond_3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/action/Action;

    :try_start_13
    iget-object v2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->interpretationContext:Lch/qos/logback/core/joran/spi/InterpretationContext;

    invoke-virtual {v0, v2, p2, p3}, Lch/qos/logback/core/joran/action/Action;->begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    :try_end_18
    .catch Lch/qos/logback/core/joran/spi/ActionException; {:try_start_13 .. :try_end_18} :catch_19
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_18} :catch_41

    goto :goto_7

    :catch_19
    move-exception v0

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->elementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-virtual {v2}, Lch/qos/logback/core/joran/spi/ElementPath;->duplicate()Lch/qos/logback/core/joran/spi/ElementPath;

    move-result-object v2

    iput-object v2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->skip:Lch/qos/logback/core/joran/spi/ElementPath;

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->cai:Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ActionException in Action for tag ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7

    :catch_41
    move-exception v0

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->elementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-virtual {v2}, Lch/qos/logback/core/joran/spi/ElementPath;->duplicate()Lch/qos/logback/core/joran/spi/ElementPath;

    move-result-object v2

    iput-object v2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->skip:Lch/qos/logback/core/joran/spi/ElementPath;

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/Interpreter;->cai:Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RuntimeException in Action for tag ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lch/qos/logback/core/joran/spi/CAI_WithLocatorSupport;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7
.end method

.method public characters(Lch/qos/logback/core/joran/event/BodyEvent;)V
    .registers 5

    iget-object v0, p1, Lch/qos/logback/core/joran/event/BodyEvent;->locator:Lorg/xml/sax/Locator;

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/spi/Interpreter;->setDocumentLocator(Lorg/xml/sax/Locator;)V

    invoke-virtual {p1}, Lch/qos/logback/core/joran/event/BodyEvent;->getText()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->actionListStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v1, :cond_20

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_20

    invoke-direct {p0, v0, v1}, Lch/qos/logback/core/joran/spi/Interpreter;->callBodyAction(Ljava/util/List;Ljava/lang/String;)V

    :cond_20
    return-void
.end method

.method public endElement(Lch/qos/logback/core/joran/event/EndEvent;)V
    .registers 5

    iget-object v0, p1, Lch/qos/logback/core/joran/event/EndEvent;->locator:Lorg/xml/sax/Locator;

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/spi/Interpreter;->setDocumentLocator(Lorg/xml/sax/Locator;)V

    iget-object v0, p1, Lch/qos/logback/core/joran/event/EndEvent;->namespaceURI:Ljava/lang/String;

    iget-object v1, p1, Lch/qos/logback/core/joran/event/EndEvent;->localName:Ljava/lang/String;

    iget-object v2, p1, Lch/qos/logback/core/joran/event/EndEvent;->qName:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lch/qos/logback/core/joran/spi/Interpreter;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method getApplicableActionList(Lch/qos/logback/core/joran/spi/ElementPath;Lorg/xml/sax/Attributes;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/joran/spi/ElementPath;",
            "Lorg/xml/sax/Attributes;",
            ")",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/action/Action;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->ruleStore:Lch/qos/logback/core/joran/spi/RuleStore;

    invoke-interface {v0, p1}, Lch/qos/logback/core/joran/spi/RuleStore;->matchActions(Lch/qos/logback/core/joran/spi/ElementPath;)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_e

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->interpretationContext:Lch/qos/logback/core/joran/spi/InterpretationContext;

    invoke-virtual {p0, p1, p2, v0}, Lch/qos/logback/core/joran/spi/Interpreter;->lookupImplicitAction(Lch/qos/logback/core/joran/spi/ElementPath;Lorg/xml/sax/Attributes;Lch/qos/logback/core/joran/spi/InterpretationContext;)Ljava/util/List;

    move-result-object v0

    :cond_e
    return-object v0
.end method

.method public getEventPlayer()Lch/qos/logback/core/joran/spi/EventPlayer;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->eventPlayer:Lch/qos/logback/core/joran/spi/EventPlayer;

    return-object v0
.end method

.method public getExecutionContext()Lch/qos/logback/core/joran/spi/InterpretationContext;
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/Interpreter;->getInterpretationContext()Lch/qos/logback/core/joran/spi/InterpretationContext;

    move-result-object v0

    return-object v0
.end method

.method public getInterpretationContext()Lch/qos/logback/core/joran/spi/InterpretationContext;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->interpretationContext:Lch/qos/logback/core/joran/spi/InterpretationContext;

    return-object v0
.end method

.method public getLocator()Lorg/xml/sax/Locator;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->locator:Lorg/xml/sax/Locator;

    return-object v0
.end method

.method public getRuleStore()Lch/qos/logback/core/joran/spi/RuleStore;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->ruleStore:Lch/qos/logback/core/joran/spi/RuleStore;

    return-object v0
.end method

.method getTagName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_a

    :cond_9
    move-object p1, p2

    :cond_a
    return-object p1
.end method

.method lookupImplicitAction(Lch/qos/logback/core/joran/spi/ElementPath;Lorg/xml/sax/Attributes;Lch/qos/logback/core/joran/spi/InterpretationContext;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/joran/spi/ElementPath;",
            "Lorg/xml/sax/Attributes;",
            "Lch/qos/logback/core/joran/spi/InterpretationContext;",
            ")",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/action/Action;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->implicitActions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v0, 0x0

    move v1, v0

    :goto_8
    if-ge v1, v2, :cond_27

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->implicitActions:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/action/ImplicitAction;

    invoke-virtual {v0, p1, p2, p3}, Lch/qos/logback/core/joran/action/ImplicitAction;->isApplicable(Lch/qos/logback/core/joran/spi/ElementPath;Lorg/xml/sax/Attributes;Lch/qos/logback/core/joran/spi/InterpretationContext;)Z

    move-result v3

    if-eqz v3, :cond_23

    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v0, v1

    :goto_22
    return-object v0

    :cond_23
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_8

    :cond_27
    const/4 v0, 0x0

    goto :goto_22
.end method

.method public setDocumentLocator(Lorg/xml/sax/Locator;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/joran/spi/Interpreter;->locator:Lorg/xml/sax/Locator;

    return-void
.end method

.method public setInterpretationContextPropertiesMap(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/Interpreter;->interpretationContext:Lch/qos/logback/core/joran/spi/InterpretationContext;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->setPropertiesMap(Ljava/util/Map;)V

    return-void
.end method

.method public startDocument()V
    .registers 1

    return-void
.end method

.method public startElement(Lch/qos/logback/core/joran/event/StartEvent;)V
    .registers 6

    invoke-virtual {p1}, Lch/qos/logback/core/joran/event/StartEvent;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/spi/Interpreter;->setDocumentLocator(Lorg/xml/sax/Locator;)V

    iget-object v0, p1, Lch/qos/logback/core/joran/event/StartEvent;->namespaceURI:Ljava/lang/String;

    iget-object v1, p1, Lch/qos/logback/core/joran/event/StartEvent;->localName:Ljava/lang/String;

    iget-object v2, p1, Lch/qos/logback/core/joran/event/StartEvent;->qName:Ljava/lang/String;

    iget-object v3, p1, Lch/qos/logback/core/joran/event/StartEvent;->attributes:Lorg/xml/sax/Attributes;

    invoke-direct {p0, v0, v1, v2, v3}, Lch/qos/logback/core/joran/spi/Interpreter;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    return-void
.end method
