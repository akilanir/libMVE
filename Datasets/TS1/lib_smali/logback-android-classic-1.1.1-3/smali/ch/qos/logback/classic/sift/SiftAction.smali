.class public Lch/qos/logback/classic/sift/SiftAction;
.super Lch/qos/logback/core/joran/action/Action;

# interfaces
.implements Lch/qos/logback/core/joran/event/InPlayListener;


# instance fields
.field seList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/ActionException;
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/sift/SiftAction;->seList:Ljava/util/List;

    invoke-virtual {p1, p0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->addInPlayListener(Lch/qos/logback/core/joran/event/InPlayListener;)V

    return-void
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/ActionException;
        }
    .end annotation

    invoke-virtual {p1, p0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->removeInPlayListener(Lch/qos/logback/core/joran/event/InPlayListener;)Z

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lch/qos/logback/classic/sift/SiftingAppender;

    if-eqz v1, :cond_1f

    check-cast v0, Lch/qos/logback/classic/sift/SiftingAppender;

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->getCopyOfPropertyMap()Ljava/util/Map;

    move-result-object v1

    new-instance v2, Lch/qos/logback/classic/sift/AppenderFactoryUsingJoran;

    iget-object v3, p0, Lch/qos/logback/classic/sift/SiftAction;->seList:Ljava/util/List;

    invoke-virtual {v0}, Lch/qos/logback/classic/sift/SiftingAppender;->getDiscriminatorKey()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4, v1}, Lch/qos/logback/classic/sift/AppenderFactoryUsingJoran;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;)V

    invoke-virtual {v0, v2}, Lch/qos/logback/classic/sift/SiftingAppender;->setAppenderFactory(Lch/qos/logback/core/sift/AppenderFactory;)V

    :cond_1f
    return-void
.end method

.method public getSeList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/classic/sift/SiftAction;->seList:Ljava/util/List;

    return-object v0
.end method

.method public inPlay(Lch/qos/logback/core/joran/event/SaxEvent;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/classic/sift/SiftAction;->seList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method
