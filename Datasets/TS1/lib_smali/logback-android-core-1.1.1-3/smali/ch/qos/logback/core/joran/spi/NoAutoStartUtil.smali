.class public Lch/qos/logback/core/joran/spi/NoAutoStartUtil;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static notMarkedWithNoAutoStart(Ljava/lang/Object;)Z
    .registers 4

    const/4 v1, 0x0

    if-nez p0, :cond_4

    :goto_3
    return v1

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v2, Lch/qos/logback/core/joran/spi/NoAutoStart;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/spi/NoAutoStart;

    if-nez v0, :cond_15

    const/4 v0, 0x1

    :goto_13
    move v1, v0

    goto :goto_3

    :cond_15
    move v0, v1

    goto :goto_13
.end method
