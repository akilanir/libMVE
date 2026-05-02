.class public Lch/qos/logback/classic/spi/EventArgUtil;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static arrangeArguments([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 1

    return-object p0
.end method

.method public static final extractThrowable([Ljava/lang/Object;)Ljava/lang/Throwable;
    .registers 4

    const/4 v1, 0x0

    if-eqz p0, :cond_6

    array-length v0, p0

    if-nez v0, :cond_8

    :cond_6
    move-object v0, v1

    :goto_7
    return-object v0

    :cond_8
    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    aget-object v0, p0, v0

    instance-of v2, v0, Ljava/lang/Throwable;

    if-eqz v2, :cond_14

    check-cast v0, Ljava/lang/Throwable;

    goto :goto_7

    :cond_14
    move-object v0, v1

    goto :goto_7
.end method

.method public static successfulExtraction(Ljava/lang/Throwable;)Z
    .registers 2

    if-eqz p0, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static trimmedCopy([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 4

    const/4 v2, 0x0

    if-eqz p0, :cond_6

    array-length v0, p0

    if-nez v0, :cond_e

    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "non-sensical empty or null argument array"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    new-array v1, v0, [Ljava/lang/Object;

    invoke-static {p0, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1
.end method
