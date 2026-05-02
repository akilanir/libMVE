.class public final Lcom/google/zxing/oned/rss/RSSUtils;
.super Ljava/lang/Object;
.source "RSSUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static combins(II)I
    .registers 8
    .param p0, "n"    # I
    .param p1, "r"    # I

    .prologue
    .line 106
    sub-int v5, p0, p1

    if-le v5, p1, :cond_15

    .line 107
    move v3, p1

    .line 108
    .local v3, "minDenom":I
    sub-int v2, p0, p1

    .line 113
    .local v2, "maxDenom":I
    :goto_7
    const/4 v4, 0x1

    .line 114
    .local v4, "val":I
    const/4 v1, 0x1

    .line 115
    .local v1, "j":I
    move v0, p0

    .local v0, "i":I
    :goto_a
    if-le v0, v2, :cond_19

    .line 116
    mul-int/2addr v4, v0

    .line 117
    if-gt v1, v3, :cond_12

    .line 118
    div-int/2addr v4, v1

    .line 119
    add-int/lit8 v1, v1, 0x1

    .line 115
    :cond_12
    add-int/lit8 v0, v0, -0x1

    goto :goto_a

    .line 110
    .end local v0    # "i":I
    .end local v1    # "j":I
    .end local v2    # "maxDenom":I
    .end local v3    # "minDenom":I
    .end local v4    # "val":I
    :cond_15
    sub-int v3, p0, p1

    .line 111
    .restart local v3    # "minDenom":I
    move v2, p1

    .restart local v2    # "maxDenom":I
    goto :goto_7

    .line 122
    .restart local v0    # "i":I
    .restart local v1    # "j":I
    .restart local v4    # "val":I
    :cond_19
    :goto_19
    if-gt v1, v3, :cond_1f

    .line 123
    div-int/2addr v4, v1

    .line 124
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 126
    :cond_1f
    return v4
.end method

.method public static getRSSvalue([IIZ)I
    .registers 16
    .param p0, "widths"    # [I
    .param p1, "maxWidth"    # I
    .param p2, "noNarrow"    # Z

    .prologue
    const/4 v12, 0x1

    .line 67
    array-length v1, p0

    .line 68
    .local v1, "elements":I
    const/4 v5, 0x0

    .line 69
    .local v5, "n":I
    array-length v11, p0

    const/4 v10, 0x0

    :goto_5
    if-ge v10, v11, :cond_d

    aget v9, p0, v10

    .line 70
    .local v9, "width":I
    add-int/2addr v5, v9

    .line 69
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 72
    .end local v9    # "width":I
    :cond_d
    const/4 v8, 0x0

    .line 73
    .local v8, "val":I
    const/4 v6, 0x0

    .line 74
    .local v6, "narrowMask":I
    const/4 v0, 0x0

    .local v0, "bar":I
    :goto_10
    add-int/lit8 v10, v1, -0x1

    if-ge v0, v10, :cond_82

    .line 76
    const/4 v2, 0x1

    .local v2, "elmWidth":I
    shl-int v10, v12, v0

    or-int/2addr v6, v10

    .line 77
    :goto_18
    aget v10, p0, v0

    if-ge v2, v10, :cond_7e

    .line 79
    sub-int v10, v5, v2

    add-int/lit8 v10, v10, -0x1

    sub-int v11, v1, v0

    add-int/lit8 v11, v11, -0x2

    invoke-static {v10, v11}, Lcom/google/zxing/oned/rss/RSSUtils;->combins(II)I

    move-result v7

    .line 80
    .local v7, "subVal":I
    if-eqz p2, :cond_47

    if-nez v6, :cond_47

    sub-int v10, v5, v2

    sub-int v11, v1, v0

    add-int/lit8 v11, v11, -0x1

    sub-int/2addr v10, v11

    sub-int v11, v1, v0

    add-int/lit8 v11, v11, -0x1

    if-lt v10, v11, :cond_47

    .line 82
    sub-int v10, v5, v2

    sub-int v11, v1, v0

    sub-int/2addr v10, v11

    sub-int v11, v1, v0

    add-int/lit8 v11, v11, -0x2

    invoke-static {v10, v11}, Lcom/google/zxing/oned/rss/RSSUtils;->combins(II)I

    move-result v10

    sub-int/2addr v7, v10

    .line 85
    :cond_47
    sub-int v10, v1, v0

    add-int/lit8 v10, v10, -0x1

    if-le v10, v12, :cond_77

    .line 86
    const/4 v3, 0x0

    .line 87
    .local v3, "lessVal":I
    sub-int v10, v5, v2

    sub-int v11, v1, v0

    add-int/lit8 v11, v11, -0x2

    sub-int v4, v10, v11

    .line 88
    .local v4, "mxwElement":I
    :goto_56
    if-le v4, p1, :cond_69

    .line 89
    sub-int v10, v5, v2

    sub-int/2addr v10, v4

    add-int/lit8 v10, v10, -0x1

    sub-int v11, v1, v0

    add-int/lit8 v11, v11, -0x3

    invoke-static {v10, v11}, Lcom/google/zxing/oned/rss/RSSUtils;->combins(II)I

    move-result v10

    add-int/2addr v3, v10

    .line 88
    add-int/lit8 v4, v4, -0x1

    goto :goto_56

    .line 92
    :cond_69
    add-int/lit8 v10, v1, -0x1

    sub-int/2addr v10, v0

    mul-int/2addr v10, v3

    sub-int/2addr v7, v10

    .line 96
    .end local v3    # "lessVal":I
    .end local v4    # "mxwElement":I
    :cond_6e
    :goto_6e
    add-int/2addr v8, v7

    .line 78
    add-int/lit8 v2, v2, 0x1

    shl-int v10, v12, v0

    xor-int/lit8 v10, v10, -0x1

    and-int/2addr v6, v10

    goto :goto_18

    .line 93
    :cond_77
    sub-int v10, v5, v2

    if-le v10, p1, :cond_6e

    .line 94
    add-int/lit8 v7, v7, -0x1

    goto :goto_6e

    .line 98
    .end local v7    # "subVal":I
    :cond_7e
    sub-int/2addr v5, v2

    .line 74
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 100
    .end local v2    # "elmWidth":I
    :cond_82
    return v8
.end method
