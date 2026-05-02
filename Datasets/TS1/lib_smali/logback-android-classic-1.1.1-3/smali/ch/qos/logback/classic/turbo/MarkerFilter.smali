.class public Lch/qos/logback/classic/turbo/MarkerFilter;
.super Lch/qos/logback/classic/turbo/MatchingFilter;


# instance fields
.field markerToMatch:Lorg/slf4j/Marker;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/classic/turbo/MatchingFilter;-><init>()V

    return-void
.end method


# virtual methods
.method public decide(Lorg/slf4j/Marker;Lch/qos/logback/classic/Logger;Lch/qos/logback/classic/Level;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)Lch/qos/logback/core/spi/FilterReply;
    .registers 8

    invoke-virtual {p0}, Lch/qos/logback/classic/turbo/MarkerFilter;->isStarted()Z

    move-result v0

    if-nez v0, :cond_9

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    :goto_8
    return-object v0

    :cond_9
    if-nez p1, :cond_e

    iget-object v0, p0, Lch/qos/logback/classic/turbo/MarkerFilter;->onMismatch:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_8

    :cond_e
    iget-object v0, p0, Lch/qos/logback/classic/turbo/MarkerFilter;->markerToMatch:Lorg/slf4j/Marker;

    invoke-interface {p1, v0}, Lorg/slf4j/Marker;->contains(Lorg/slf4j/Marker;)Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object v0, p0, Lch/qos/logback/classic/turbo/MarkerFilter;->onMatch:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_8

    :cond_19
    iget-object v0, p0, Lch/qos/logback/classic/turbo/MarkerFilter;->onMismatch:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_8
.end method

.method public setMarker(Ljava/lang/String;)V
    .registers 3

    if-eqz p1, :cond_8

    invoke-static {p1}, Lorg/slf4j/MarkerFactory;->getMarker(Ljava/lang/String;)Lorg/slf4j/Marker;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/turbo/MarkerFilter;->markerToMatch:Lorg/slf4j/Marker;

    :cond_8
    return-void
.end method

.method public start()V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/classic/turbo/MarkerFilter;->markerToMatch:Lorg/slf4j/Marker;

    if-eqz v0, :cond_8

    invoke-super {p0}, Lch/qos/logback/classic/turbo/MatchingFilter;->start()V

    :goto_7
    return-void

    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "The marker property must be set for ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/classic/turbo/MarkerFilter;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/turbo/MarkerFilter;->addError(Ljava/lang/String;)V

    goto :goto_7
.end method
