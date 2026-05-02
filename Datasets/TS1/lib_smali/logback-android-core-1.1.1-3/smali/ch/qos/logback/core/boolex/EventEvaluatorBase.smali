.class public abstract Lch/qos/logback/core/boolex/EventEvaluatorBase;
.super Lch/qos/logback/core/spi/ContextAwareBase;

# interfaces
.implements Lch/qos/logback/core/boolex/EventEvaluator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/spi/ContextAwareBase;",
        "Lch/qos/logback/core/boolex/EventEvaluator",
        "<TE;>;"
    }
.end annotation


# instance fields
.field name:Ljava/lang/String;

.field started:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/boolex/EventEvaluatorBase;->name:Ljava/lang/String;

    return-object v0
.end method

.method public isStarted()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/boolex/EventEvaluatorBase;->started:Z

    return v0
.end method

.method public setName(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/boolex/EventEvaluatorBase;->name:Ljava/lang/String;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "name has been already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iput-object p1, p0, Lch/qos/logback/core/boolex/EventEvaluatorBase;->name:Ljava/lang/String;

    return-void
.end method

.method public start()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/boolex/EventEvaluatorBase;->started:Z

    return-void
.end method

.method public stop()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/boolex/EventEvaluatorBase;->started:Z

    return-void
.end method
