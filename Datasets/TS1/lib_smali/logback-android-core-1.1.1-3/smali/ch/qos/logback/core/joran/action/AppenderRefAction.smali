.class public Lch/qos/logback/core/joran/action/AppenderRefAction;
.super Lch/qos/logback/core/joran/action/Action;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/joran/action/Action;"
    }
.end annotation


# instance fields
.field inError:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/joran/action/AppenderRefAction;->inError:Z

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 9

    const/4 v4, 0x1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/joran/action/AppenderRefAction;->inError:Z

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lch/qos/logback/core/spi/AppenderAttachable;

    if-nez v1, :cond_33

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not find an AppenderAttachable at the top of execution stack. Near ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] line "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lch/qos/logback/core/joran/action/AppenderRefAction;->getLineNumber(Lch/qos/logback/core/joran/spi/InterpretationContext;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-boolean v4, p0, Lch/qos/logback/core/joran/action/AppenderRefAction;->inError:Z

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/AppenderRefAction;->addError(Ljava/lang/String;)V

    :goto_32
    return-void

    :cond_33
    check-cast v0, Lch/qos/logback/core/spi/AppenderAttachable;

    const-string v1, "ref"

    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4d

    const-string v0, "Missing appender ref attribute in <appender-ref> tag."

    iput-boolean v4, p0, Lch/qos/logback/core/joran/action/AppenderRefAction;->inError:Z

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/AppenderRefAction;->addError(Ljava/lang/String;)V

    goto :goto_32

    :cond_4d
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->getObjectMap()Ljava/util/Map;

    move-result-object v1

    const-string v3, "APPENDER_BAG"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lch/qos/logback/core/Appender;

    if-nez v1, :cond_85

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not find an appender named ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]. Did you define it below instead of above in the configuration file?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-boolean v4, p0, Lch/qos/logback/core/joran/action/AppenderRefAction;->inError:Z

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/AppenderRefAction;->addError(Ljava/lang/String;)V

    const-string v0, "See http://logback.qos.ch/codes.html#appender_order for more details."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/AppenderRefAction;->addError(Ljava/lang/String;)V

    goto :goto_32

    :cond_85
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Attaching appender named ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lch/qos/logback/core/joran/action/AppenderRefAction;->addInfo(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lch/qos/logback/core/spi/AppenderAttachable;->addAppender(Lch/qos/logback/core/Appender;)V

    goto :goto_32
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 3

    return-void
.end method
