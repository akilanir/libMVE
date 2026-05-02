.class public final Lch/qos/logback/classic/spi/TurboFilterList;
.super Ljava/util/concurrent/CopyOnWriteArrayList;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/CopyOnWriteArrayList",
        "<",
        "Lch/qos/logback/classic/turbo/TurboFilter;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    return-void
.end method


# virtual methods
.method public getTurboFilterChainDecision(Lorg/slf4j/Marker;Lch/qos/logback/classic/Logger;Lch/qos/logback/classic/Level;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)Lch/qos/logback/core/spi/FilterReply;
    .registers 17

    invoke-virtual {p0}, Lch/qos/logback/classic/spi/TurboFilterList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1e

    const/4 v0, 0x0

    :try_start_8
    invoke-virtual {p0, v0}, Lch/qos/logback/classic/spi/TurboFilterList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/turbo/TurboFilter;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object/from16 v6, p6

    invoke-virtual/range {v0 .. v6}, Lch/qos/logback/classic/turbo/TurboFilter;->decide(Lorg/slf4j/Marker;Lch/qos/logback/classic/Logger;Lch/qos/logback/classic/Level;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)Lch/qos/logback/core/spi/FilterReply;
    :try_end_18
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_8 .. :try_end_18} :catch_1a

    move-result-object v0

    :cond_19
    :goto_19
    return-object v0

    :catch_1a
    move-exception v0

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_19

    :cond_1e
    invoke-virtual {p0}, Lch/qos/logback/classic/spi/TurboFilterList;->toArray()[Ljava/lang/Object;

    move-result-object v8

    array-length v9, v8

    const/4 v0, 0x0

    move v7, v0

    :goto_25
    if-ge v7, v9, :cond_42

    aget-object v0, v8, v7

    check-cast v0, Lch/qos/logback/classic/turbo/TurboFilter;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object/from16 v6, p6

    invoke-virtual/range {v0 .. v6}, Lch/qos/logback/classic/turbo/TurboFilter;->decide(Lorg/slf4j/Marker;Lch/qos/logback/classic/Logger;Lch/qos/logback/classic/Level;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)Lch/qos/logback/core/spi/FilterReply;

    move-result-object v0

    sget-object v1, Lch/qos/logback/core/spi/FilterReply;->DENY:Lch/qos/logback/core/spi/FilterReply;

    if-eq v0, v1, :cond_19

    sget-object v1, Lch/qos/logback/core/spi/FilterReply;->ACCEPT:Lch/qos/logback/core/spi/FilterReply;

    if-eq v0, v1, :cond_19

    add-int/lit8 v0, v7, 0x1

    move v7, v0

    goto :goto_25

    :cond_42
    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_19
.end method
