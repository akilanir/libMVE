.class public Lch/qos/logback/classic/util/LoggerNameUtil;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFirstSeparatorIndexOf(Ljava/lang/String;)I
    .registers 2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lch/qos/logback/classic/util/LoggerNameUtil;->getSeparatorIndexOf(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getSeparatorIndexOf(Ljava/lang/String;I)I
    .registers 5

    const/4 v2, -0x1

    const/16 v0, 0x2e

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    const/16 v1, 0x24

    invoke-virtual {p0, v1, p1}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    if-ne v0, v2, :cond_13

    if-ne v1, v2, :cond_13

    move v0, v2

    :cond_12
    :goto_12
    return v0

    :cond_13
    if-ne v0, v2, :cond_17

    move v0, v1

    goto :goto_12

    :cond_17
    if-eq v1, v2, :cond_12

    if-lt v0, v1, :cond_12

    move v0, v1

    goto :goto_12
.end method
