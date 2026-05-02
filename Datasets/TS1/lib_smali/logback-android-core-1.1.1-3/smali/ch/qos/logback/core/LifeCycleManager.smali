.class public Lch/qos/logback/core/LifeCycleManager;
.super Ljava/lang/Object;


# instance fields
.field private final components:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lch/qos/logback/core/spi/LifeCycle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/LifeCycleManager;->components:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public register(Lch/qos/logback/core/spi/LifeCycle;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/LifeCycleManager;->components:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public reset()V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/LifeCycleManager;->components:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/spi/LifeCycle;

    invoke-interface {v0}, Lch/qos/logback/core/spi/LifeCycle;->isStarted()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v0}, Lch/qos/logback/core/spi/LifeCycle;->stop()V

    goto :goto_6

    :cond_1c
    iget-object v0, p0, Lch/qos/logback/core/LifeCycleManager;->components:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    return-void
.end method
