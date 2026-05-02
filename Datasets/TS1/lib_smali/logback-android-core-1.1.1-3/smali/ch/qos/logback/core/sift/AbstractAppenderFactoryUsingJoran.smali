.class public abstract Lch/qos/logback/core/sift/AbstractAppenderFactoryUsingJoran;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/sift/AppenderFactory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lch/qos/logback/core/sift/AppenderFactory",
        "<TE;>;"
    }
.end annotation


# instance fields
.field final eventList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;"
        }
    .end annotation
.end field

.field protected key:Ljava/lang/String;

.field protected parentPropertyMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1}, Lch/qos/logback/core/sift/AbstractAppenderFactoryUsingJoran;->removeSiftElement(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/sift/AbstractAppenderFactoryUsingJoran;->eventList:Ljava/util/List;

    iput-object p2, p0, Lch/qos/logback/core/sift/AbstractAppenderFactoryUsingJoran;->key:Ljava/lang/String;

    iput-object p3, p0, Lch/qos/logback/core/sift/AbstractAppenderFactoryUsingJoran;->parentPropertyMap:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public buildAppender(Lch/qos/logback/core/Context;Ljava/lang/String;)Lch/qos/logback/core/Appender;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/Context;",
            "Ljava/lang/String;",
            ")",
            "Lch/qos/logback/core/Appender",
            "<TE;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/JoranException;
        }
    .end annotation

    invoke-virtual {p0, p2}, Lch/qos/logback/core/sift/AbstractAppenderFactoryUsingJoran;->getSiftingJoranConfigurator(Ljava/lang/String;)Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;

    move-result-object v0

    invoke-virtual {v0, p1}, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->setContext(Lch/qos/logback/core/Context;)V

    iget-object v1, p0, Lch/qos/logback/core/sift/AbstractAppenderFactoryUsingJoran;->eventList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->doConfigure(Ljava/util/List;)V

    invoke-virtual {v0}, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->getAppender()Lch/qos/logback/core/Appender;

    move-result-object v0

    return-object v0
.end method

.method public getEventList()Ljava/util/List;
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

    iget-object v0, p0, Lch/qos/logback/core/sift/AbstractAppenderFactoryUsingJoran;->eventList:Ljava/util/List;

    return-object v0
.end method

.method public abstract getSiftingJoranConfigurator(Ljava/lang/String;)Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase",
            "<TE;>;"
        }
    .end annotation
.end method

.method removeSiftElement(Ljava/util/List;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {p1, v0, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
