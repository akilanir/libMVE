.class public Lch/qos/logback/classic/joran/action/FindIncludeAction;
.super Lch/qos/logback/core/joran/action/IncludeAction;


# static fields
.field private static final EVENT_OFFSET:I = 0x1


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/IncludeAction;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/FindIncludeAction;->setEventOffset(I)V

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/ActionException;
        }
    .end annotation

    return-void
.end method

.method protected createRecorder(Ljava/io/InputStream;Ljava/net/URL;)Lch/qos/logback/core/joran/event/SaxEventRecorder;
    .registers 7

    invoke-virtual {p2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AndroidManifest.xml"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    new-instance v0, Lch/qos/logback/classic/android/ASaxEventRecorder;

    invoke-direct {v0}, Lch/qos/logback/classic/android/ASaxEventRecorder;-><init>()V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "logback"

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/android/ASaxEventRecorder;->setFilter([Ljava/lang/String;)V

    :goto_1c
    return-object v0

    :cond_1d
    new-instance v0, Lch/qos/logback/core/joran/event/SaxEventRecorder;

    invoke-virtual {p0}, Lch/qos/logback/classic/joran/action/FindIncludeAction;->getContext()Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lch/qos/logback/core/joran/event/SaxEventRecorder;-><init>(Lch/qos/logback/core/Context;)V

    goto :goto_1c
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/ActionException;
        }
    .end annotation

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3d

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lch/qos/logback/classic/joran/action/ConditionalIncludeAction$State;

    if-eqz v0, :cond_3d

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->popObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/joran/action/ConditionalIncludeAction$State;

    invoke-virtual {v0}, Lch/qos/logback/classic/joran/action/ConditionalIncludeAction$State;->getUrl()Ljava/net/URL;

    move-result-object v0

    if-eqz v0, :cond_60

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Path found ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/classic/joran/action/FindIncludeAction;->addInfo(Ljava/lang/String;)V

    :try_start_3a
    invoke-virtual {p0, p1, v0}, Lch/qos/logback/classic/joran/action/FindIncludeAction;->processInclude(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/net/URL;)V
    :try_end_3d
    .catch Lch/qos/logback/core/joran/spi/JoranException; {:try_start_3a .. :try_end_3d} :catch_3e

    :cond_3d
    :goto_3d
    return-void

    :catch_3e
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to process include ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/classic/joran/action/FindIncludeAction;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3d

    :cond_60
    const-string v0, "No paths found from includes"

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/FindIncludeAction;->addInfo(Ljava/lang/String;)V

    goto :goto_3d
.end method
