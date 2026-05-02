.class public Lch/qos/logback/core/util/ContextUtil;
.super Lch/qos/logback/core/spi/ContextAwareBase;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/Context;)V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    invoke-virtual {p0, p1}, Lch/qos/logback/core/util/ContextUtil;->setContext(Lch/qos/logback/core/Context;)V

    return-void
.end method


# virtual methods
.method public addHostNameAsProperty()V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/util/ContextUtil;->context:Lch/qos/logback/core/Context;

    const-string v1, "HOSTNAME"

    const-string v2, "localhost"

    invoke-interface {v0, v1, v2}, Lch/qos/logback/core/Context;->putProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public addProperties(Ljava/util/Properties;)V
    .registers 6

    if-nez p1, :cond_3

    :cond_2
    return-void

    :cond_3
    invoke-virtual {p1}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lch/qos/logback/core/util/ContextUtil;->context:Lch/qos/logback/core/Context;

    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v0, v3}, Lch/qos/logback/core/Context;->putProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b
.end method
