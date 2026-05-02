.class public Lch/qos/logback/classic/boolex/OnErrorEvaluator;
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


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/boolex/EventEvaluatorBase;-><init>()V

    return-void
.end method


# virtual methods
.method public evaluate(Lch/qos/logback/classic/spi/ILoggingEvent;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;,
            Lch/qos/logback/core/boolex/EvaluationException;
        }
    .end annotation

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v0

    iget v0, v0, Lch/qos/logback/classic/Level;->levelInt:I

    const v1, 0x9c40

    if-lt v0, v1, :cond_d

    const/4 v0, 0x1

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
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

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/boolex/OnErrorEvaluator;->evaluate(Lch/qos/logback/classic/spi/ILoggingEvent;)Z

    move-result v0

    return v0
.end method
