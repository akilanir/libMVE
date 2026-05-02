.class public Lch/qos/logback/core/joran/action/IncludeAction;
.super Lch/qos/logback/core/joran/action/AbstractIncludeAction;


# static fields
.field private static final CONFIG_TAG:Ljava/lang/String; = "configuration"

.field private static final INCLUDED_TAG:Ljava/lang/String; = "included"


# instance fields
.field private eventOffset:I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/AbstractIncludeAction;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lch/qos/logback/core/joran/action/IncludeAction;->eventOffset:I

    return-void
.end method

.method private getEventName(Lch/qos/logback/core/joran/event/SaxEvent;)Ljava/lang/String;
    .registers 3

    iget-object v0, p1, Lch/qos/logback/core/joran/event/SaxEvent;->qName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_b

    iget-object v0, p1, Lch/qos/logback/core/joran/event/SaxEvent;->qName:Ljava/lang/String;

    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p1, Lch/qos/logback/core/joran/event/SaxEvent;->localName:Ljava/lang/String;

    goto :goto_a
.end method

.method private openURL(Ljava/net/URL;)Ljava/io/InputStream;
    .registers 5

    :try_start_0
    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    :goto_4
    return-object v0

    :catch_5
    move-exception v0

    invoke-virtual {p0}, Lch/qos/logback/core/joran/action/IncludeAction;->isOptional()Z

    move-result v1

    if-nez v1, :cond_2c

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to open ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/joran/action/IncludeAction;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2c
    const/4 v0, 0x0

    goto :goto_4
.end method

.method private trimHeadAndTail(Lch/qos/logback/core/joran/event/SaxEventRecorder;)V
    .registers 7

    const/4 v2, 0x0

    invoke-virtual {p1}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->getSaxEventList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_c

    :cond_b
    :goto_b
    return-void

    :cond_c
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/event/SaxEvent;

    if-eqz v0, :cond_59

    invoke-direct {p0, v0}, Lch/qos/logback/core/joran/action/IncludeAction;->getEventName(Lch/qos/logback/core/joran/event/SaxEvent;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "included"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    const-string v3, "configuration"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    move v3, v1

    move v1, v0

    :goto_26
    if-nez v3, :cond_2a

    if-eqz v1, :cond_b

    :cond_2a
    invoke-interface {v4, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_b

    add-int/lit8 v2, v0, -0x1

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/event/SaxEvent;

    if-eqz v0, :cond_b

    invoke-direct {p0, v0}, Lch/qos/logback/core/joran/action/IncludeAction;->getEventName(Lch/qos/logback/core/joran/event/SaxEvent;)Ljava/lang/String;

    move-result-object v0

    if-eqz v3, :cond_4b

    const-string v3, "included"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_55

    :cond_4b
    if-eqz v1, :cond_b

    const-string v1, "configuration"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    :cond_55
    invoke-interface {v4, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_b

    :cond_59
    move v1, v2

    move v3, v2

    goto :goto_26
.end method


# virtual methods
.method protected createRecorder(Ljava/io/InputStream;Ljava/net/URL;)Lch/qos/logback/core/joran/event/SaxEventRecorder;
    .registers 5

    new-instance v0, Lch/qos/logback/core/joran/event/SaxEventRecorder;

    invoke-virtual {p0}, Lch/qos/logback/core/joran/action/IncludeAction;->getContext()Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lch/qos/logback/core/joran/event/SaxEventRecorder;-><init>(Lch/qos/logback/core/Context;)V

    return-object v0
.end method

.method protected processInclude(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/net/URL;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/JoranException;
        }
    .end annotation

    invoke-direct {p0, p2}, Lch/qos/logback/core/joran/action/IncludeAction;->openURL(Ljava/net/URL;)Ljava/io/InputStream;

    move-result-object v1

    if-eqz v1, :cond_2f

    :try_start_6
    invoke-virtual {p0}, Lch/qos/logback/core/joran/action/IncludeAction;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    invoke-static {v0, p2}, Lch/qos/logback/core/joran/util/ConfigurationWatchListUtil;->addToWatchList(Lch/qos/logback/core/Context;Ljava/net/URL;)V

    invoke-virtual {p0, v1, p2}, Lch/qos/logback/core/joran/action/IncludeAction;->createRecorder(Ljava/io/InputStream;Ljava/net/URL;)Lch/qos/logback/core/joran/event/SaxEventRecorder;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/joran/action/IncludeAction;->getContext()Lch/qos/logback/core/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->setContext(Lch/qos/logback/core/Context;)V

    invoke-virtual {v0, v1}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->recordEvents(Ljava/io/InputStream;)V

    invoke-direct {p0, v0}, Lch/qos/logback/core/joran/action/IncludeAction;->trimHeadAndTail(Lch/qos/logback/core/joran/event/SaxEventRecorder;)V

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->getJoranInterpreter()Lch/qos/logback/core/joran/spi/Interpreter;

    move-result-object v2

    invoke-virtual {v2}, Lch/qos/logback/core/joran/spi/Interpreter;->getEventPlayer()Lch/qos/logback/core/joran/spi/EventPlayer;

    move-result-object v2

    invoke-virtual {v0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->getSaxEventList()Ljava/util/List;

    move-result-object v0

    iget v3, p0, Lch/qos/logback/core/joran/action/IncludeAction;->eventOffset:I

    invoke-virtual {v2, v0, v3}, Lch/qos/logback/core/joran/spi/EventPlayer;->addEventsDynamically(Ljava/util/List;I)V
    :try_end_2f
    .catch Lch/qos/logback/core/joran/spi/JoranException; {:try_start_6 .. :try_end_2f} :catch_33
    .catchall {:try_start_6 .. :try_end_2f} :catchall_58

    :cond_2f
    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/action/IncludeAction;->close(Ljava/io/InputStream;)V

    :goto_32
    return-void

    :catch_33
    move-exception v0

    :try_start_34
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed processing ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v0}, Lch/qos/logback/core/joran/action/IncludeAction;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_54
    .catchall {:try_start_34 .. :try_end_54} :catchall_58

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/action/IncludeAction;->close(Ljava/io/InputStream;)V

    goto :goto_32

    :catchall_58
    move-exception v0

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/action/IncludeAction;->close(Ljava/io/InputStream;)V

    throw v0
.end method

.method protected setEventOffset(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/joran/action/IncludeAction;->eventOffset:I

    return-void
.end method
