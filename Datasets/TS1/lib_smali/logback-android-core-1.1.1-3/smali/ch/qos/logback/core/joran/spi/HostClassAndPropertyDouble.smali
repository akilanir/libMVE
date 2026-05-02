.class public Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;
.super Ljava/lang/Object;


# instance fields
.field final hostClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field final propertyName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->hostClass:Ljava/lang/Class;

    iput-object p2, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->propertyName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_5

    :cond_4
    :goto_4
    return v0

    :cond_5
    if-nez p1, :cond_9

    move v0, v1

    goto :goto_4

    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_15

    move v0, v1

    goto :goto_4

    :cond_15
    check-cast p1, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->hostClass:Ljava/lang/Class;

    if-nez v2, :cond_21

    iget-object v2, p1, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->hostClass:Ljava/lang/Class;

    if-eqz v2, :cond_2d

    move v0, v1

    goto :goto_4

    :cond_21
    iget-object v2, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->hostClass:Ljava/lang/Class;

    iget-object v3, p1, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->hostClass:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2d

    move v0, v1

    goto :goto_4

    :cond_2d
    iget-object v2, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->propertyName:Ljava/lang/String;

    if-nez v2, :cond_37

    iget-object v2, p1, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->propertyName:Ljava/lang/String;

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_4

    :cond_37
    iget-object v2, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->propertyName:Ljava/lang/String;

    iget-object v3, p1, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->propertyName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    move v0, v1

    goto :goto_4
.end method

.method public getHostClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->hostClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getPropertyName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->propertyName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    const/4 v1, 0x0

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->hostClass:Ljava/lang/Class;

    if-nez v0, :cond_10

    move v0, v1

    :goto_6
    add-int/lit8 v0, v0, 0x1f

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->propertyName:Ljava/lang/String;

    if-nez v2, :cond_17

    :goto_e
    add-int/2addr v0, v1

    return v0

    :cond_10
    iget-object v0, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->hostClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_6

    :cond_17
    iget-object v1, p0, Lch/qos/logback/core/joran/spi/HostClassAndPropertyDouble;->propertyName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_e
.end method
