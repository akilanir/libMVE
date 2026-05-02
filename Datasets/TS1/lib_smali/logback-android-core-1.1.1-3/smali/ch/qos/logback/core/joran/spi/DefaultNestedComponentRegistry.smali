.class public Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;
.super Ljava/lang/Object;


# instance fields
.field defaultComponentMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->defaultComponentMap:Ljava/util/Map;

    return-void
.end method

.method private oneShotFind(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Class;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    new-instance v0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;

    invoke-direct {v0, p1, p2}, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->defaultComponentMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    return-object v0
.end method


# virtual methods
.method public add(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    new-instance v0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->defaultComponentMap:Ljava/util/Map;

    invoke-interface {v1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public findDefaultComponentType(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Class;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    :goto_4
    if-eqz p1, :cond_12

    invoke-direct {p0, p1, v1}, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->oneShotFind(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_d

    :goto_c
    return-object v0

    :cond_d
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p1

    goto :goto_4

    :cond_12
    const/4 v0, 0x0

    goto :goto_c
.end method
