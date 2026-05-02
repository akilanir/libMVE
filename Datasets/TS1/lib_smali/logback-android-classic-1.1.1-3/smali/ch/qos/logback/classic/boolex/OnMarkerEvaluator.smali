.class public Lch/qos/logback/classic/boolex/OnMarkerEvaluator;
.super Lch/qos/logback/core/boolex/EventEvaluatorBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lch/qos/logback/core/boolex/EventEvaluatorBase",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation


# instance fields
.field markerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/boolex/EventEvaluatorBase;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/boolex/OnMarkerEvaluator;->markerList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addMarker(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/classic/boolex/OnMarkerEvaluator;->markerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public evaluate(Lch/qos/logback/classic/spi/ILoggingEvent;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;,
            Lch/qos/logback/core/boolex/EvaluationException;
        }
    .end annotation

    const/4 v1, 0x0

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getMarker()Lorg/slf4j/Marker;

    move-result-object v2

    if-nez v2, :cond_9

    move v0, v1

    :goto_8
    return v0

    :cond_9
    iget-object v0, p0, Lch/qos/logback/classic/boolex/OnMarkerEvaluator;->markerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v2, v0}, Lorg/slf4j/Marker;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 v0, 0x1

    goto :goto_8

    :cond_23
    move v0, v1

    goto :goto_8
.end method

.method public bridge synthetic evaluate(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;,
            Lch/qos/logback/core/boolex/EvaluationException;
        }
    .end annotation

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/boolex/OnMarkerEvaluator;->evaluate(Lch/qos/logback/classic/spi/ILoggingEvent;)Z

    move-result v0

    return v0
.end method
