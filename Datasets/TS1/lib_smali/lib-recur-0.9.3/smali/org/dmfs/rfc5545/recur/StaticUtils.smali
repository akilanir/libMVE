.class public abstract Lorg/dmfs/rfc5545/recur/StaticUtils;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ListToArray(Ljava/util/List;)[I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)[I"
        }
    .end annotation

    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    new-array v1, v3, [I

    const/4 v0, 0x0

    move v2, v0

    :goto_c
    if-ge v2, v3, :cond_1e

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    aput v0, v1, v2

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_c

    :cond_1e
    move-object v0, v1

    goto :goto_3
.end method

.method public static ListToSortedArray(Ljava/util/List;)[I
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)[I"
        }
    .end annotation

    const/4 v1, 0x0

    if-nez p0, :cond_5

    const/4 v0, 0x0

    :goto_4
    return-object v0

    :cond_5
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v7

    new-array v2, v7, [I

    const/high16 v0, -0x80000000

    move v3, v1

    move v4, v1

    move v5, v0

    :goto_10
    if-ge v3, v7, :cond_29

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aput v6, v2, v3

    if-le v5, v6, :cond_27

    const/4 v0, 0x1

    :goto_21
    or-int/2addr v4, v0

    add-int/lit8 v0, v3, 0x1

    move v3, v0

    move v5, v6

    goto :goto_10

    :cond_27
    move v0, v1

    goto :goto_21

    :cond_29
    if-eqz v4, :cond_2e

    invoke-static {v2}, Ljava/util/Arrays;->sort([I)V

    :cond_2e
    move-object v0, v2

    goto :goto_4
.end method

.method public static linearSearch([II)I
    .registers 5

    const/4 v0, 0x0

    array-length v1, p0

    :goto_2
    if-ge v0, v1, :cond_c

    aget v2, p0, v0

    if-ne v2, p1, :cond_9

    :goto_8
    return v0

    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_c
    const/4 v0, -0x1

    goto :goto_8
.end method

.method public static linearSearch([JIIJ)I
    .registers 8

    move v0, p1

    :goto_1
    if-ge v0, p2, :cond_d

    aget-wide v1, p0, v0

    cmp-long v1, v1, p3

    if-nez v1, :cond_a

    :goto_9
    return v0

    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_d
    const/4 v0, -0x1

    goto :goto_9
.end method

.method public static linearSearch([JJ)I
    .registers 5

    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1, p2}, Lorg/dmfs/rfc5545/recur/StaticUtils;->linearSearch([JIIJ)I

    move-result v0

    return v0
.end method
