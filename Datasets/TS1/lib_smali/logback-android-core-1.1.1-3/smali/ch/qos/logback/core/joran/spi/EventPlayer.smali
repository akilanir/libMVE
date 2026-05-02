.class public Lch/qos/logback/core/joran/spi/EventPlayer;
.super Ljava/lang/Object;


# instance fields
.field currentIndex:I

.field eventList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;"
        }
    .end annotation
.end field

.field final interpreter:Lch/qos/logback/core/joran/spi/Interpreter;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/joran/spi/Interpreter;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->interpreter:Lch/qos/logback/core/joran/spi/Interpreter;

    return-void
.end method


# virtual methods
.method public addEventsDynamically(Ljava/util/List;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;I)V"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->eventList:Ljava/util/List;

    iget v1, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->currentIndex:I

    add-int/2addr v1, p2

    invoke-interface {v0, v1, p1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    return-void
.end method

.method public getCopyOfPlayerEventList()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->eventList:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public play(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->eventList:Ljava/util/List;

    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->currentIndex:I

    :goto_5
    iget v0, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->currentIndex:I

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->eventList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_5e

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->eventList:Ljava/util/List;

    iget v1, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->currentIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/event/SaxEvent;

    instance-of v1, v0, Lch/qos/logback/core/joran/event/StartEvent;

    if-eqz v1, :cond_2e

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->interpreter:Lch/qos/logback/core/joran/spi/Interpreter;

    move-object v1, v0

    check-cast v1, Lch/qos/logback/core/joran/event/StartEvent;

    invoke-virtual {v2, v1}, Lch/qos/logback/core/joran/spi/Interpreter;->startElement(Lch/qos/logback/core/joran/event/StartEvent;)V

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->interpreter:Lch/qos/logback/core/joran/spi/Interpreter;

    invoke-virtual {v1}, Lch/qos/logback/core/joran/spi/Interpreter;->getInterpretationContext()Lch/qos/logback/core/joran/spi/InterpretationContext;

    move-result-object v1

    invoke-virtual {v1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->fireInPlay(Lch/qos/logback/core/joran/event/SaxEvent;)V

    :cond_2e
    instance-of v1, v0, Lch/qos/logback/core/joran/event/BodyEvent;

    if-eqz v1, :cond_43

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->interpreter:Lch/qos/logback/core/joran/spi/Interpreter;

    invoke-virtual {v1}, Lch/qos/logback/core/joran/spi/Interpreter;->getInterpretationContext()Lch/qos/logback/core/joran/spi/InterpretationContext;

    move-result-object v1

    invoke-virtual {v1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->fireInPlay(Lch/qos/logback/core/joran/event/SaxEvent;)V

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->interpreter:Lch/qos/logback/core/joran/spi/Interpreter;

    move-object v1, v0

    check-cast v1, Lch/qos/logback/core/joran/event/BodyEvent;

    invoke-virtual {v2, v1}, Lch/qos/logback/core/joran/spi/Interpreter;->characters(Lch/qos/logback/core/joran/event/BodyEvent;)V

    :cond_43
    instance-of v1, v0, Lch/qos/logback/core/joran/event/EndEvent;

    if-eqz v1, :cond_57

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->interpreter:Lch/qos/logback/core/joran/spi/Interpreter;

    invoke-virtual {v1}, Lch/qos/logback/core/joran/spi/Interpreter;->getInterpretationContext()Lch/qos/logback/core/joran/spi/InterpretationContext;

    move-result-object v1

    invoke-virtual {v1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->fireInPlay(Lch/qos/logback/core/joran/event/SaxEvent;)V

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->interpreter:Lch/qos/logback/core/joran/spi/Interpreter;

    check-cast v0, Lch/qos/logback/core/joran/event/EndEvent;

    invoke-virtual {v1, v0}, Lch/qos/logback/core/joran/spi/Interpreter;->endElement(Lch/qos/logback/core/joran/event/EndEvent;)V

    :cond_57
    iget v0, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->currentIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lch/qos/logback/core/joran/spi/EventPlayer;->currentIndex:I

    goto :goto_5

    :cond_5e
    return-void
.end method
