.class public Lch/qos/logback/classic/joran/action/LevelAction;
.super Lch/qos/logback/core/joran/action/Action;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field inError:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/joran/action/LevelAction;->inError:Z

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 8

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lch/qos/logback/classic/Logger;

    if-nez v1, :cond_11

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/classic/joran/action/LevelAction;->inError:Z

    const-string v0, "For element <level>, could not find a logger at the top of execution stack."

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/LevelAction;->addError(Ljava/lang/String;)V

    :goto_10
    return-void

    :cond_11
    check-cast v0, Lch/qos/logback/classic/Logger;

    invoke-virtual {v0}, Lch/qos/logback/classic/Logger;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "value"

    invoke-interface {p3, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "INHERITED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_31

    const-string v3, "NULL"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_54

    :cond_31
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lch/qos/logback/classic/Logger;->setLevel(Lch/qos/logback/classic/Level;)V

    :goto_35
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " level set to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lch/qos/logback/classic/Logger;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/LevelAction;->addInfo(Ljava/lang/String;)V

    goto :goto_10

    :cond_54
    sget-object v3, Lch/qos/logback/classic/Level;->DEBUG:Lch/qos/logback/classic/Level;

    invoke-static {v2, v3}, Lch/qos/logback/classic/Level;->toLevel(Ljava/lang/String;Lch/qos/logback/classic/Level;)Lch/qos/logback/classic/Level;

    move-result-object v2

    invoke-virtual {v0, v2}, Lch/qos/logback/classic/Logger;->setLevel(Lch/qos/logback/classic/Level;)V

    goto :goto_35
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 3

    return-void
.end method

.method public finish(Lch/qos/logback/core/joran/spi/InterpretationContext;)V
    .registers 2

    return-void
.end method
