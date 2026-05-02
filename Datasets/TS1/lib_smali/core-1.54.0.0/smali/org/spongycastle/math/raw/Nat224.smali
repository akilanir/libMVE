.class public abstract Lorg/spongycastle/math/raw/Nat224;
.super Ljava/lang/Object;
.source "Nat224.java"


# static fields
.field private static final M:J = 0xffffffffL


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static add([II[II[II)I
    .registers 15
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "y"    # [I
    .param p3, "yOff"    # I
    .param p4, "z"    # [I
    .param p5, "zOff"    # I

    .prologue
    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 40
    const-wide/16 v0, 0x0

    .line 41
    .local v0, "c":J
    add-int/lit8 v2, p1, 0x0

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x0

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 42
    add-int/lit8 v2, p5, 0x0

    long-to-int v3, v0

    aput v3, p4, v2

    .line 43
    ushr-long/2addr v0, v8

    .line 44
    add-int/lit8 v2, p1, 0x1

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x1

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 45
    add-int/lit8 v2, p5, 0x1

    long-to-int v3, v0

    aput v3, p4, v2

    .line 46
    ushr-long/2addr v0, v8

    .line 47
    add-int/lit8 v2, p1, 0x2

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x2

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 48
    add-int/lit8 v2, p5, 0x2

    long-to-int v3, v0

    aput v3, p4, v2

    .line 49
    ushr-long/2addr v0, v8

    .line 50
    add-int/lit8 v2, p1, 0x3

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x3

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 51
    add-int/lit8 v2, p5, 0x3

    long-to-int v3, v0

    aput v3, p4, v2

    .line 52
    ushr-long/2addr v0, v8

    .line 53
    add-int/lit8 v2, p1, 0x4

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x4

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 54
    add-int/lit8 v2, p5, 0x4

    long-to-int v3, v0

    aput v3, p4, v2

    .line 55
    ushr-long/2addr v0, v8

    .line 56
    add-int/lit8 v2, p1, 0x5

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x5

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 57
    add-int/lit8 v2, p5, 0x5

    long-to-int v3, v0

    aput v3, p4, v2

    .line 58
    ushr-long/2addr v0, v8

    .line 59
    add-int/lit8 v2, p1, 0x6

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x6

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 60
    add-int/lit8 v2, p5, 0x6

    long-to-int v3, v0

    aput v3, p4, v2

    .line 61
    ushr-long/2addr v0, v8

    .line 62
    long-to-int v2, v0

    return v2
.end method

.method public static add([I[I[I)I
    .registers 15
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "z"    # [I

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .local v0, "c":J
    aget v2, p0, v9

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 15
    long-to-int v2, v0

    aput v2, p2, v9

    .line 16
    ushr-long/2addr v0, v8

    .line 17
    aget v2, p0, v10

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 18
    long-to-int v2, v0

    aput v2, p2, v10

    .line 19
    ushr-long/2addr v0, v8

    .line 20
    aget v2, p0, v11

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 21
    long-to-int v2, v0

    aput v2, p2, v11

    .line 22
    ushr-long/2addr v0, v8

    .line 23
    const/4 v2, 0x3

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x3

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 24
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 25
    ushr-long/2addr v0, v8

    .line 26
    const/4 v2, 0x4

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x4

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 27
    const/4 v2, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 28
    ushr-long/2addr v0, v8

    .line 29
    const/4 v2, 0x5

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x5

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 30
    const/4 v2, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 31
    ushr-long/2addr v0, v8

    .line 32
    const/4 v2, 0x6

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x6

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 33
    const/4 v2, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 34
    ushr-long/2addr v0, v8

    .line 35
    long-to-int v2, v0

    return v2
.end method

.method public static addBothTo([II[II[II)I
    .registers 15
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "y"    # [I
    .param p3, "yOff"    # I
    .param p4, "z"    # [I
    .param p5, "zOff"    # I

    .prologue
    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 94
    const-wide/16 v0, 0x0

    .line 95
    .local v0, "c":J
    add-int/lit8 v2, p1, 0x0

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x0

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-int/lit8 v4, p5, 0x0

    aget v4, p4, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 96
    add-int/lit8 v2, p5, 0x0

    long-to-int v3, v0

    aput v3, p4, v2

    .line 97
    ushr-long/2addr v0, v8

    .line 98
    add-int/lit8 v2, p1, 0x1

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x1

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-int/lit8 v4, p5, 0x1

    aget v4, p4, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 99
    add-int/lit8 v2, p5, 0x1

    long-to-int v3, v0

    aput v3, p4, v2

    .line 100
    ushr-long/2addr v0, v8

    .line 101
    add-int/lit8 v2, p1, 0x2

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x2

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-int/lit8 v4, p5, 0x2

    aget v4, p4, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 102
    add-int/lit8 v2, p5, 0x2

    long-to-int v3, v0

    aput v3, p4, v2

    .line 103
    ushr-long/2addr v0, v8

    .line 104
    add-int/lit8 v2, p1, 0x3

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x3

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-int/lit8 v4, p5, 0x3

    aget v4, p4, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 105
    add-int/lit8 v2, p5, 0x3

    long-to-int v3, v0

    aput v3, p4, v2

    .line 106
    ushr-long/2addr v0, v8

    .line 107
    add-int/lit8 v2, p1, 0x4

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x4

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-int/lit8 v4, p5, 0x4

    aget v4, p4, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 108
    add-int/lit8 v2, p5, 0x4

    long-to-int v3, v0

    aput v3, p4, v2

    .line 109
    ushr-long/2addr v0, v8

    .line 110
    add-int/lit8 v2, p1, 0x5

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x5

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-int/lit8 v4, p5, 0x5

    aget v4, p4, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 111
    add-int/lit8 v2, p5, 0x5

    long-to-int v3, v0

    aput v3, p4, v2

    .line 112
    ushr-long/2addr v0, v8

    .line 113
    add-int/lit8 v2, p1, 0x6

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x6

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-int/lit8 v4, p5, 0x6

    aget v4, p4, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 114
    add-int/lit8 v2, p5, 0x6

    long-to-int v3, v0

    aput v3, p4, v2

    .line 115
    ushr-long/2addr v0, v8

    .line 116
    long-to-int v2, v0

    return v2
.end method

.method public static addBothTo([I[I[I)I
    .registers 15
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "z"    # [I

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 67
    const-wide/16 v0, 0x0

    .line 68
    .local v0, "c":J
    aget v2, p0, v9

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    aget v4, p2, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 69
    long-to-int v2, v0

    aput v2, p2, v9

    .line 70
    ushr-long/2addr v0, v8

    .line 71
    aget v2, p0, v10

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    aget v4, p2, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 72
    long-to-int v2, v0

    aput v2, p2, v10

    .line 73
    ushr-long/2addr v0, v8

    .line 74
    aget v2, p0, v11

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    aget v4, p2, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 75
    long-to-int v2, v0

    aput v2, p2, v11

    .line 76
    ushr-long/2addr v0, v8

    .line 77
    const/4 v2, 0x3

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x3

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    const/4 v4, 0x3

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 78
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 79
    ushr-long/2addr v0, v8

    .line 80
    const/4 v2, 0x4

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x4

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    const/4 v4, 0x4

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 81
    const/4 v2, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 82
    ushr-long/2addr v0, v8

    .line 83
    const/4 v2, 0x5

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x5

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    const/4 v4, 0x5

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 84
    const/4 v2, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 85
    ushr-long/2addr v0, v8

    .line 86
    const/4 v2, 0x6

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x6

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    const/4 v4, 0x6

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 87
    const/4 v2, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 88
    ushr-long/2addr v0, v8

    .line 89
    long-to-int v2, v0

    return v2
.end method

.method public static addTo([II[III)I
    .registers 14
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "z"    # [I
    .param p3, "zOff"    # I
    .param p4, "cIn"    # I

    .prologue
    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 148
    int-to-long v2, p4

    and-long v0, v2, v6

    .line 149
    .local v0, "c":J
    add-int/lit8 v2, p1, 0x0

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x0

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 150
    add-int/lit8 v2, p3, 0x0

    long-to-int v3, v0

    aput v3, p2, v2

    .line 151
    ushr-long/2addr v0, v8

    .line 152
    add-int/lit8 v2, p1, 0x1

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x1

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 153
    add-int/lit8 v2, p3, 0x1

    long-to-int v3, v0

    aput v3, p2, v2

    .line 154
    ushr-long/2addr v0, v8

    .line 155
    add-int/lit8 v2, p1, 0x2

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x2

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 156
    add-int/lit8 v2, p3, 0x2

    long-to-int v3, v0

    aput v3, p2, v2

    .line 157
    ushr-long/2addr v0, v8

    .line 158
    add-int/lit8 v2, p1, 0x3

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x3

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 159
    add-int/lit8 v2, p3, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 160
    ushr-long/2addr v0, v8

    .line 161
    add-int/lit8 v2, p1, 0x4

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x4

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 162
    add-int/lit8 v2, p3, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 163
    ushr-long/2addr v0, v8

    .line 164
    add-int/lit8 v2, p1, 0x5

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x5

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 165
    add-int/lit8 v2, p3, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 166
    ushr-long/2addr v0, v8

    .line 167
    add-int/lit8 v2, p1, 0x6

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x6

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 168
    add-int/lit8 v2, p3, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 169
    ushr-long/2addr v0, v8

    .line 170
    long-to-int v2, v0

    return v2
.end method

.method public static addTo([I[I)I
    .registers 14
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 121
    const-wide/16 v0, 0x0

    .line 122
    .local v0, "c":J
    aget v2, p0, v9

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 123
    long-to-int v2, v0

    aput v2, p1, v9

    .line 124
    ushr-long/2addr v0, v8

    .line 125
    aget v2, p0, v10

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 126
    long-to-int v2, v0

    aput v2, p1, v10

    .line 127
    ushr-long/2addr v0, v8

    .line 128
    aget v2, p0, v11

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 129
    long-to-int v2, v0

    aput v2, p1, v11

    .line 130
    ushr-long/2addr v0, v8

    .line 131
    const/4 v2, 0x3

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x3

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 132
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p1, v2

    .line 133
    ushr-long/2addr v0, v8

    .line 134
    const/4 v2, 0x4

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x4

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 135
    const/4 v2, 0x4

    long-to-int v3, v0

    aput v3, p1, v2

    .line 136
    ushr-long/2addr v0, v8

    .line 137
    const/4 v2, 0x5

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x5

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 138
    const/4 v2, 0x5

    long-to-int v3, v0

    aput v3, p1, v2

    .line 139
    ushr-long/2addr v0, v8

    .line 140
    const/4 v2, 0x6

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x6

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 141
    const/4 v2, 0x6

    long-to-int v3, v0

    aput v3, p1, v2

    .line 142
    ushr-long/2addr v0, v8

    .line 143
    long-to-int v2, v0

    return v2
.end method

.method public static addToEachOther([II[II)I
    .registers 13
    .param p0, "u"    # [I
    .param p1, "uOff"    # I
    .param p2, "v"    # [I
    .param p3, "vOff"    # I

    .prologue
    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 175
    const-wide/16 v0, 0x0

    .line 176
    .local v0, "c":J
    add-int/lit8 v2, p1, 0x0

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x0

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 177
    add-int/lit8 v2, p1, 0x0

    long-to-int v3, v0

    aput v3, p0, v2

    .line 178
    add-int/lit8 v2, p3, 0x0

    long-to-int v3, v0

    aput v3, p2, v2

    .line 179
    ushr-long/2addr v0, v8

    .line 180
    add-int/lit8 v2, p1, 0x1

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x1

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 181
    add-int/lit8 v2, p1, 0x1

    long-to-int v3, v0

    aput v3, p0, v2

    .line 182
    add-int/lit8 v2, p3, 0x1

    long-to-int v3, v0

    aput v3, p2, v2

    .line 183
    ushr-long/2addr v0, v8

    .line 184
    add-int/lit8 v2, p1, 0x2

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x2

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 185
    add-int/lit8 v2, p1, 0x2

    long-to-int v3, v0

    aput v3, p0, v2

    .line 186
    add-int/lit8 v2, p3, 0x2

    long-to-int v3, v0

    aput v3, p2, v2

    .line 187
    ushr-long/2addr v0, v8

    .line 188
    add-int/lit8 v2, p1, 0x3

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x3

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 189
    add-int/lit8 v2, p1, 0x3

    long-to-int v3, v0

    aput v3, p0, v2

    .line 190
    add-int/lit8 v2, p3, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 191
    ushr-long/2addr v0, v8

    .line 192
    add-int/lit8 v2, p1, 0x4

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x4

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 193
    add-int/lit8 v2, p1, 0x4

    long-to-int v3, v0

    aput v3, p0, v2

    .line 194
    add-int/lit8 v2, p3, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 195
    ushr-long/2addr v0, v8

    .line 196
    add-int/lit8 v2, p1, 0x5

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x5

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 197
    add-int/lit8 v2, p1, 0x5

    long-to-int v3, v0

    aput v3, p0, v2

    .line 198
    add-int/lit8 v2, p3, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 199
    ushr-long/2addr v0, v8

    .line 200
    add-int/lit8 v2, p1, 0x6

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x6

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 201
    add-int/lit8 v2, p1, 0x6

    long-to-int v3, v0

    aput v3, p0, v2

    .line 202
    add-int/lit8 v2, p3, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 203
    ushr-long/2addr v0, v8

    .line 204
    long-to-int v2, v0

    return v2
.end method

.method public static copy([I[I)V
    .registers 8
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 209
    aget v0, p0, v1

    aput v0, p1, v1

    .line 210
    aget v0, p0, v2

    aput v0, p1, v2

    .line 211
    aget v0, p0, v3

    aput v0, p1, v3

    .line 212
    aget v0, p0, v4

    aput v0, p1, v4

    .line 213
    aget v0, p0, v5

    aput v0, p1, v5

    .line 214
    const/4 v0, 0x5

    const/4 v1, 0x5

    aget v1, p0, v1

    aput v1, p1, v0

    .line 215
    const/4 v0, 0x6

    const/4 v1, 0x6

    aget v1, p0, v1

    aput v1, p1, v0

    .line 216
    return-void
.end method

.method public static create()[I
    .registers 1

    .prologue
    .line 220
    const/4 v0, 0x7

    new-array v0, v0, [I

    return-object v0
.end method

.method public static createExt()[I
    .registers 1

    .prologue
    .line 225
    const/16 v0, 0xe

    new-array v0, v0, [I

    return-object v0
.end method

.method public static diff([II[II[II)Z
    .registers 13
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "y"    # [I
    .param p3, "yOff"    # I
    .param p4, "z"    # [I
    .param p5, "zOff"    # I

    .prologue
    .line 230
    invoke-static {p0, p1, p2, p3}, Lorg/spongycastle/math/raw/Nat224;->gte([II[II)Z

    move-result v6

    .line 231
    .local v6, "pos":Z
    if-eqz v6, :cond_a

    .line 233
    invoke-static/range {p0 .. p5}, Lorg/spongycastle/math/raw/Nat224;->sub([II[II[II)I

    .line 239
    :goto_9
    return v6

    :cond_a
    move-object v0, p2

    move v1, p3

    move-object v2, p0

    move v3, p1

    move-object v4, p4

    move v5, p5

    .line 237
    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/raw/Nat224;->sub([II[II[II)I

    goto :goto_9
.end method

.method public static eq([I[I)Z
    .registers 5
    .param p0, "x"    # [I
    .param p1, "y"    # [I

    .prologue
    .line 244
    const/4 v0, 0x6

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_e

    .line 246
    aget v1, p0, v0

    aget v2, p1, v0

    if-eq v1, v2, :cond_b

    .line 248
    const/4 v1, 0x0

    .line 251
    :goto_a
    return v1

    .line 244
    :cond_b
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 251
    :cond_e
    const/4 v1, 0x1

    goto :goto_a
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[I
    .registers 6
    .param p0, "x"    # Ljava/math/BigInteger;

    .prologue
    .line 256
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v3

    if-ltz v3, :cond_e

    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v3

    const/16 v4, 0xe0

    if-le v3, v4, :cond_14

    .line 258
    :cond_e
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 261
    :cond_14
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    move-result-object v2

    .line 262
    .local v2, "z":[I
    const/4 v0, 0x0

    .line 263
    .local v0, "i":I
    :goto_19
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v3

    if-eqz v3, :cond_2f

    .line 265
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    move-result v3

    aput v3, v2, v0

    .line 266
    const/16 v3, 0x20

    invoke-virtual {p0, v3}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object p0

    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_19

    .line 268
    :cond_2f
    return-object v2
.end method

.method public static getBit([II)I
    .registers 6
    .param p0, "x"    # [I
    .param p1, "bit"    # I

    .prologue
    const/4 v2, 0x0

    .line 273
    if-nez p1, :cond_8

    .line 275
    aget v2, p0, v2

    and-int/lit8 v2, v2, 0x1

    .line 283
    :cond_7
    :goto_7
    return v2

    .line 277
    :cond_8
    shr-int/lit8 v1, p1, 0x5

    .line 278
    .local v1, "w":I
    if-ltz v1, :cond_7

    const/4 v3, 0x7

    if-ge v1, v3, :cond_7

    .line 282
    and-int/lit8 v0, p1, 0x1f

    .line 283
    .local v0, "b":I
    aget v2, p0, v1

    ushr-int/2addr v2, v0

    and-int/lit8 v2, v2, 0x1

    goto :goto_7
.end method

.method public static gte([II[II)Z
    .registers 10
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "y"    # [I
    .param p3, "yOff"    # I

    .prologue
    const/4 v3, 0x1

    const/high16 v5, -0x80000000

    .line 302
    const/4 v0, 0x6

    .local v0, "i":I
    :goto_4
    if-ltz v0, :cond_15

    .line 304
    add-int v4, p1, v0

    aget v4, p0, v4

    xor-int v1, v4, v5

    .line 305
    .local v1, "x_i":I
    add-int v4, p3, v0

    aget v4, p2, v4

    xor-int v2, v4, v5

    .line 306
    .local v2, "y_i":I
    if-ge v1, v2, :cond_16

    .line 307
    const/4 v3, 0x0

    .line 311
    .end local v1    # "x_i":I
    .end local v2    # "y_i":I
    :cond_15
    return v3

    .line 308
    .restart local v1    # "x_i":I
    .restart local v2    # "y_i":I
    :cond_16
    if-gt v1, v2, :cond_15

    .line 302
    add-int/lit8 v0, v0, -0x1

    goto :goto_4
.end method

.method public static gte([I[I)Z
    .registers 8
    .param p0, "x"    # [I
    .param p1, "y"    # [I

    .prologue
    const/4 v3, 0x1

    const/high16 v5, -0x80000000

    .line 288
    const/4 v0, 0x6

    .local v0, "i":I
    :goto_4
    if-ltz v0, :cond_11

    .line 290
    aget v4, p0, v0

    xor-int v1, v4, v5

    .line 291
    .local v1, "x_i":I
    aget v4, p1, v0

    xor-int v2, v4, v5

    .line 292
    .local v2, "y_i":I
    if-ge v1, v2, :cond_12

    .line 293
    const/4 v3, 0x0

    .line 297
    .end local v1    # "x_i":I
    .end local v2    # "y_i":I
    :cond_11
    return v3

    .line 294
    .restart local v1    # "x_i":I
    .restart local v2    # "y_i":I
    :cond_12
    if-gt v1, v2, :cond_11

    .line 288
    add-int/lit8 v0, v0, -0x1

    goto :goto_4
.end method

.method public static isOne([I)Z
    .registers 5
    .param p0, "x"    # [I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 316
    aget v3, p0, v1

    if-eq v3, v2, :cond_7

    .line 327
    :cond_6
    :goto_6
    return v1

    .line 320
    :cond_7
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_8
    const/4 v3, 0x7

    if-ge v0, v3, :cond_12

    .line 322
    aget v3, p0, v0

    if-nez v3, :cond_6

    .line 320
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_12
    move v1, v2

    .line 327
    goto :goto_6
.end method

.method public static isZero([I)Z
    .registers 3
    .param p0, "x"    # [I

    .prologue
    .line 332
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/4 v1, 0x7

    if-ge v0, v1, :cond_d

    .line 334
    aget v1, p0, v0

    if-eqz v1, :cond_a

    .line 336
    const/4 v1, 0x0

    .line 339
    :goto_9
    return v1

    .line 332
    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 339
    :cond_d
    const/4 v1, 0x1

    goto :goto_9
.end method

.method public static mul([II[II[II)V
    .registers 35
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "y"    # [I
    .param p3, "yOff"    # I
    .param p4, "zz"    # [I
    .param p5, "zzOff"    # I

    .prologue
    .line 408
    add-int/lit8 v23, p3, 0x0

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v9, v23, v25

    .line 409
    .local v9, "y_0":J
    add-int/lit8 v23, p3, 0x1

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v11, v23, v25

    .line 410
    .local v11, "y_1":J
    add-int/lit8 v23, p3, 0x2

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v13, v23, v25

    .line 411
    .local v13, "y_2":J
    add-int/lit8 v23, p3, 0x3

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v15, v23, v25

    .line 412
    .local v15, "y_3":J
    add-int/lit8 v23, p3, 0x4

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v17, v23, v25

    .line 413
    .local v17, "y_4":J
    add-int/lit8 v23, p3, 0x5

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v19, v23, v25

    .line 414
    .local v19, "y_5":J
    add-int/lit8 v23, p3, 0x6

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v21, v23, v25

    .line 417
    .local v21, "y_6":J
    const-wide/16 v2, 0x0

    .local v2, "c":J
    add-int/lit8 v23, p1, 0x0

    aget v23, p0, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v5, v23, v25

    .line 418
    .local v5, "x_0":J
    mul-long v23, v5, v9

    add-long v2, v2, v23

    .line 419
    add-int/lit8 v23, p5, 0x0

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 420
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 421
    mul-long v23, v5, v11

    add-long v2, v2, v23

    .line 422
    add-int/lit8 v23, p5, 0x1

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 423
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 424
    mul-long v23, v5, v13

    add-long v2, v2, v23

    .line 425
    add-int/lit8 v23, p5, 0x2

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 426
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 427
    mul-long v23, v5, v15

    add-long v2, v2, v23

    .line 428
    add-int/lit8 v23, p5, 0x3

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 429
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 430
    mul-long v23, v5, v17

    add-long v2, v2, v23

    .line 431
    add-int/lit8 v23, p5, 0x4

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 432
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 433
    mul-long v23, v5, v19

    add-long v2, v2, v23

    .line 434
    add-int/lit8 v23, p5, 0x5

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 435
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 436
    mul-long v23, v5, v21

    add-long v2, v2, v23

    .line 437
    add-int/lit8 v23, p5, 0x6

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 438
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 439
    add-int/lit8 v23, p5, 0x7

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 442
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_f3
    const/16 v23, 0x7

    move/from16 v0, v23

    if-ge v4, v0, :cond_1ff

    .line 444
    add-int/lit8 p5, p5, 0x1

    .line 445
    const-wide/16 v2, 0x0

    add-int v23, p1, v4

    aget v23, p0, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v7, v23, v25

    .line 446
    .local v7, "x_i":J
    mul-long v23, v7, v9

    add-int/lit8 v25, p5, 0x0

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 447
    add-int/lit8 v23, p5, 0x0

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 448
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 449
    mul-long v23, v7, v11

    add-int/lit8 v25, p5, 0x1

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 450
    add-int/lit8 v23, p5, 0x1

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 451
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 452
    mul-long v23, v7, v13

    add-int/lit8 v25, p5, 0x2

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 453
    add-int/lit8 v23, p5, 0x2

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 454
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 455
    mul-long v23, v7, v15

    add-int/lit8 v25, p5, 0x3

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 456
    add-int/lit8 v23, p5, 0x3

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 457
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 458
    mul-long v23, v7, v17

    add-int/lit8 v25, p5, 0x4

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 459
    add-int/lit8 v23, p5, 0x4

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 460
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 461
    mul-long v23, v7, v19

    add-int/lit8 v25, p5, 0x5

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 462
    add-int/lit8 v23, p5, 0x5

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 463
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 464
    mul-long v23, v7, v21

    add-int/lit8 v25, p5, 0x6

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 465
    add-int/lit8 v23, p5, 0x6

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 466
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 467
    add-int/lit8 v23, p5, 0x7

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 442
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_f3

    .line 469
    .end local v7    # "x_i":J
    :cond_1ff
    return-void
.end method

.method public static mul([I[I[I)V
    .registers 32
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "zz"    # [I

    .prologue
    .line 344
    const/16 v23, 0x0

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v9, v23, v25

    .line 345
    .local v9, "y_0":J
    const/16 v23, 0x1

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v11, v23, v25

    .line 346
    .local v11, "y_1":J
    const/16 v23, 0x2

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v13, v23, v25

    .line 347
    .local v13, "y_2":J
    const/16 v23, 0x3

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v15, v23, v25

    .line 348
    .local v15, "y_3":J
    const/16 v23, 0x4

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v17, v23, v25

    .line 349
    .local v17, "y_4":J
    const/16 v23, 0x5

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v19, v23, v25

    .line 350
    .local v19, "y_5":J
    const/16 v23, 0x6

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v21, v23, v25

    .line 353
    .local v21, "y_6":J
    const-wide/16 v2, 0x0

    .local v2, "c":J
    const/16 v23, 0x0

    aget v23, p0, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v5, v23, v25

    .line 354
    .local v5, "x_0":J
    mul-long v23, v5, v9

    add-long v2, v2, v23

    .line 355
    const/16 v23, 0x0

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 356
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 357
    mul-long v23, v5, v11

    add-long v2, v2, v23

    .line 358
    const/16 v23, 0x1

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 359
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 360
    mul-long v23, v5, v13

    add-long v2, v2, v23

    .line 361
    const/16 v23, 0x2

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 362
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 363
    mul-long v23, v5, v15

    add-long v2, v2, v23

    .line 364
    const/16 v23, 0x3

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 365
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 366
    mul-long v23, v5, v17

    add-long v2, v2, v23

    .line 367
    const/16 v23, 0x4

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 368
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 369
    mul-long v23, v5, v19

    add-long v2, v2, v23

    .line 370
    const/16 v23, 0x5

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 371
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 372
    mul-long v23, v5, v21

    add-long v2, v2, v23

    .line 373
    const/16 v23, 0x6

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 374
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 375
    const/16 v23, 0x7

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 378
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_f3
    const/16 v23, 0x7

    move/from16 v0, v23

    if-ge v4, v0, :cond_1fb

    .line 380
    const-wide/16 v2, 0x0

    aget v23, p0, v4

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v7, v23, v25

    .line 381
    .local v7, "x_i":J
    mul-long v23, v7, v9

    add-int/lit8 v25, v4, 0x0

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 382
    add-int/lit8 v23, v4, 0x0

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 383
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 384
    mul-long v23, v7, v11

    add-int/lit8 v25, v4, 0x1

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 385
    add-int/lit8 v23, v4, 0x1

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 386
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 387
    mul-long v23, v7, v13

    add-int/lit8 v25, v4, 0x2

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 388
    add-int/lit8 v23, v4, 0x2

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 389
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 390
    mul-long v23, v7, v15

    add-int/lit8 v25, v4, 0x3

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 391
    add-int/lit8 v23, v4, 0x3

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 392
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 393
    mul-long v23, v7, v17

    add-int/lit8 v25, v4, 0x4

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 394
    add-int/lit8 v23, v4, 0x4

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 395
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 396
    mul-long v23, v7, v19

    add-int/lit8 v25, v4, 0x5

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 397
    add-int/lit8 v23, v4, 0x5

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 398
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 399
    mul-long v23, v7, v21

    add-int/lit8 v25, v4, 0x6

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 400
    add-int/lit8 v23, v4, 0x6

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 401
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 402
    add-int/lit8 v23, v4, 0x7

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 378
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_f3

    .line 404
    .end local v7    # "x_i":J
    :cond_1fb
    return-void
.end method

.method public static mul33Add(I[II[II[II)J
    .registers 33
    .param p0, "w"    # I
    .param p1, "x"    # [I
    .param p2, "xOff"    # I
    .param p3, "y"    # [I
    .param p4, "yOff"    # I
    .param p5, "z"    # [I
    .param p6, "zOff"    # I

    .prologue
    .line 560
    const-wide/16 v2, 0x0

    .local v2, "c":J
    move/from16 v0, p0

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v4, v20, v22

    .line 561
    .local v4, "wVal":J
    add-int/lit8 v20, p2, 0x0

    aget v20, p1, v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v6, v20, v22

    .line 562
    .local v6, "x0":J
    mul-long v20, v4, v6

    add-int/lit8 v22, p4, 0x0

    aget v22, p3, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v22, v22, v24

    add-long v20, v20, v22

    add-long v2, v2, v20

    .line 563
    add-int/lit8 v20, p6, 0x0

    long-to-int v0, v2

    move/from16 v21, v0

    aput v21, p5, v20

    .line 564
    const/16 v20, 0x20

    ushr-long v2, v2, v20

    .line 565
    add-int/lit8 v20, p2, 0x1

    aget v20, p1, v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v8, v20, v22

    .line 566
    .local v8, "x1":J
    mul-long v20, v4, v8

    add-long v20, v20, v6

    add-int/lit8 v22, p4, 0x1

    aget v22, p3, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v22, v22, v24

    add-long v20, v20, v22

    add-long v2, v2, v20

    .line 567
    add-int/lit8 v20, p6, 0x1

    long-to-int v0, v2

    move/from16 v21, v0

    aput v21, p5, v20

    .line 568
    const/16 v20, 0x20

    ushr-long v2, v2, v20

    .line 569
    add-int/lit8 v20, p2, 0x2

    aget v20, p1, v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v10, v20, v22

    .line 570
    .local v10, "x2":J
    mul-long v20, v4, v10

    add-long v20, v20, v8

    add-int/lit8 v22, p4, 0x2

    aget v22, p3, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v22, v22, v24

    add-long v20, v20, v22

    add-long v2, v2, v20

    .line 571
    add-int/lit8 v20, p6, 0x2

    long-to-int v0, v2

    move/from16 v21, v0

    aput v21, p5, v20

    .line 572
    const/16 v20, 0x20

    ushr-long v2, v2, v20

    .line 573
    add-int/lit8 v20, p2, 0x3

    aget v20, p1, v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v12, v20, v22

    .line 574
    .local v12, "x3":J
    mul-long v20, v4, v12

    add-long v20, v20, v10

    add-int/lit8 v22, p4, 0x3

    aget v22, p3, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v22, v22, v24

    add-long v20, v20, v22

    add-long v2, v2, v20

    .line 575
    add-int/lit8 v20, p6, 0x3

    long-to-int v0, v2

    move/from16 v21, v0

    aput v21, p5, v20

    .line 576
    const/16 v20, 0x20

    ushr-long v2, v2, v20

    .line 577
    add-int/lit8 v20, p2, 0x4

    aget v20, p1, v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v14, v20, v22

    .line 578
    .local v14, "x4":J
    mul-long v20, v4, v14

    add-long v20, v20, v12

    add-int/lit8 v22, p4, 0x4

    aget v22, p3, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v22, v22, v24

    add-long v20, v20, v22

    add-long v2, v2, v20

    .line 579
    add-int/lit8 v20, p6, 0x4

    long-to-int v0, v2

    move/from16 v21, v0

    aput v21, p5, v20

    .line 580
    const/16 v20, 0x20

    ushr-long v2, v2, v20

    .line 581
    add-int/lit8 v20, p2, 0x5

    aget v20, p1, v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v16, v20, v22

    .line 582
    .local v16, "x5":J
    mul-long v20, v4, v16

    add-long v20, v20, v14

    add-int/lit8 v22, p4, 0x5

    aget v22, p3, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v22, v22, v24

    add-long v20, v20, v22

    add-long v2, v2, v20

    .line 583
    add-int/lit8 v20, p6, 0x5

    long-to-int v0, v2

    move/from16 v21, v0

    aput v21, p5, v20

    .line 584
    const/16 v20, 0x20

    ushr-long v2, v2, v20

    .line 585
    add-int/lit8 v20, p2, 0x6

    aget v20, p1, v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0xffffffffL

    and-long v18, v20, v22

    .line 586
    .local v18, "x6":J
    mul-long v20, v4, v18

    add-long v20, v20, v16

    add-int/lit8 v22, p4, 0x6

    aget v22, p3, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v22, v22, v24

    add-long v20, v20, v22

    add-long v2, v2, v20

    .line 587
    add-int/lit8 v20, p6, 0x6

    long-to-int v0, v2

    move/from16 v21, v0

    aput v21, p5, v20

    .line 588
    const/16 v20, 0x20

    ushr-long v2, v2, v20

    .line 589
    add-long v2, v2, v18

    .line 590
    return-wide v2
.end method

.method public static mul33DWordAdd(IJ[II)I
    .registers 21
    .param p0, "x"    # I
    .param p1, "y"    # J
    .param p3, "z"    # [I
    .param p4, "zOff"    # I

    .prologue
    .line 679
    const-wide/16 v2, 0x0

    .local v2, "c":J
    move/from16 v0, p0

    int-to-long v10, v0

    const-wide v12, 0xffffffffL

    and-long v4, v10, v12

    .line 680
    .local v4, "xVal":J
    const-wide v10, 0xffffffffL

    and-long v6, p1, v10

    .line 681
    .local v6, "y00":J
    mul-long v10, v4, v6

    add-int/lit8 v12, p4, 0x0

    aget v12, p3, v12

    int-to-long v12, v12

    const-wide v14, 0xffffffffL

    and-long/2addr v12, v14

    add-long/2addr v10, v12

    add-long/2addr v2, v10

    .line 682
    add-int/lit8 v10, p4, 0x0

    long-to-int v11, v2

    aput v11, p3, v10

    .line 683
    const/16 v10, 0x20

    ushr-long/2addr v2, v10

    .line 684
    const/16 v10, 0x20

    ushr-long v8, p1, v10

    .line 685
    .local v8, "y01":J
    mul-long v10, v4, v8

    add-long/2addr v10, v6

    add-int/lit8 v12, p4, 0x1

    aget v12, p3, v12

    int-to-long v12, v12

    const-wide v14, 0xffffffffL

    and-long/2addr v12, v14

    add-long/2addr v10, v12

    add-long/2addr v2, v10

    .line 686
    add-int/lit8 v10, p4, 0x1

    long-to-int v11, v2

    aput v11, p3, v10

    .line 687
    const/16 v10, 0x20

    ushr-long/2addr v2, v10

    .line 688
    add-int/lit8 v10, p4, 0x2

    aget v10, p3, v10

    int-to-long v10, v10

    const-wide v12, 0xffffffffL

    and-long/2addr v10, v12

    add-long/2addr v10, v8

    add-long/2addr v2, v10

    .line 689
    add-int/lit8 v10, p4, 0x2

    long-to-int v11, v2

    aput v11, p3, v10

    .line 690
    const/16 v10, 0x20

    ushr-long/2addr v2, v10

    .line 691
    add-int/lit8 v10, p4, 0x3

    aget v10, p3, v10

    int-to-long v10, v10

    const-wide v12, 0xffffffffL

    and-long/2addr v10, v12

    add-long/2addr v2, v10

    .line 692
    add-int/lit8 v10, p4, 0x3

    long-to-int v11, v2

    aput v11, p3, v10

    .line 693
    const/16 v10, 0x20

    ushr-long/2addr v2, v10

    .line 694
    const-wide/16 v10, 0x0

    cmp-long v10, v2, v10

    if-nez v10, :cond_77

    const/4 v10, 0x0

    :goto_76
    return v10

    :cond_77
    const/4 v10, 0x7

    const/4 v11, 0x4

    move-object/from16 v0, p3

    move/from16 v1, p4

    invoke-static {v10, v0, v1, v11}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    move-result v10

    goto :goto_76
.end method

.method public static mul33WordAdd(II[II)I
    .registers 16
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "z"    # [I
    .param p3, "zOff"    # I

    .prologue
    .line 702
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v6, p0

    const-wide v8, 0xffffffffL

    and-long v2, v6, v8

    .local v2, "xVal":J
    int-to-long v6, p1

    const-wide v8, 0xffffffffL

    and-long v4, v6, v8

    .line 703
    .local v4, "yVal":J
    mul-long v6, v4, v2

    add-int/lit8 v8, p3, 0x0

    aget v8, p2, v8

    int-to-long v8, v8

    const-wide v10, 0xffffffffL

    and-long/2addr v8, v10

    add-long/2addr v6, v8

    add-long/2addr v0, v6

    .line 704
    add-int/lit8 v6, p3, 0x0

    long-to-int v7, v0

    aput v7, p2, v6

    .line 705
    const/16 v6, 0x20

    ushr-long/2addr v0, v6

    .line 706
    add-int/lit8 v6, p3, 0x1

    aget v6, p2, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v6, v4

    add-long/2addr v0, v6

    .line 707
    add-int/lit8 v6, p3, 0x1

    long-to-int v7, v0

    aput v7, p2, v6

    .line 708
    const/16 v6, 0x20

    ushr-long/2addr v0, v6

    .line 709
    add-int/lit8 v6, p3, 0x2

    aget v6, p2, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v0, v6

    .line 710
    add-int/lit8 v6, p3, 0x2

    long-to-int v7, v0

    aput v7, p2, v6

    .line 711
    const/16 v6, 0x20

    ushr-long/2addr v0, v6

    .line 712
    const-wide/16 v6, 0x0

    cmp-long v6, v0, v6

    if-nez v6, :cond_5a

    const/4 v6, 0x0

    :goto_59
    return v6

    :cond_5a
    const/4 v6, 0x7

    const/4 v7, 0x3

    invoke-static {v6, p2, p3, v7}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    move-result v6

    goto :goto_59
.end method

.method public static mulAddTo([II[II[II)I
    .registers 35
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "y"    # [I
    .param p3, "yOff"    # I
    .param p4, "zz"    # [I
    .param p5, "zzOff"    # I

    .prologue
    .line 515
    add-int/lit8 v23, p3, 0x0

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v7, v23, v25

    .line 516
    .local v7, "y_0":J
    add-int/lit8 v23, p3, 0x1

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v9, v23, v25

    .line 517
    .local v9, "y_1":J
    add-int/lit8 v23, p3, 0x2

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v11, v23, v25

    .line 518
    .local v11, "y_2":J
    add-int/lit8 v23, p3, 0x3

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v13, v23, v25

    .line 519
    .local v13, "y_3":J
    add-int/lit8 v23, p3, 0x4

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v15, v23, v25

    .line 520
    .local v15, "y_4":J
    add-int/lit8 v23, p3, 0x5

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v17, v23, v25

    .line 521
    .local v17, "y_5":J
    add-int/lit8 v23, p3, 0x6

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v19, v23, v25

    .line 523
    .local v19, "y_6":J
    const-wide/16 v21, 0x0

    .line 524
    .local v21, "zc":J
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_73
    const/16 v23, 0x7

    move/from16 v0, v23

    if-ge v4, v0, :cond_197

    .line 526
    const-wide/16 v2, 0x0

    .local v2, "c":J
    add-int v23, p1, v4

    aget v23, p0, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v5, v23, v25

    .line 527
    .local v5, "x_i":J
    mul-long v23, v5, v7

    add-int/lit8 v25, p5, 0x0

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 528
    add-int/lit8 v23, p5, 0x0

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 529
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 530
    mul-long v23, v5, v9

    add-int/lit8 v25, p5, 0x1

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 531
    add-int/lit8 v23, p5, 0x1

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 532
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 533
    mul-long v23, v5, v11

    add-int/lit8 v25, p5, 0x2

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 534
    add-int/lit8 v23, p5, 0x2

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 535
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 536
    mul-long v23, v5, v13

    add-int/lit8 v25, p5, 0x3

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 537
    add-int/lit8 v23, p5, 0x3

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 538
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 539
    mul-long v23, v5, v15

    add-int/lit8 v25, p5, 0x4

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 540
    add-int/lit8 v23, p5, 0x4

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 541
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 542
    mul-long v23, v5, v17

    add-int/lit8 v25, p5, 0x5

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 543
    add-int/lit8 v23, p5, 0x5

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 544
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 545
    mul-long v23, v5, v19

    add-int/lit8 v25, p5, 0x6

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 546
    add-int/lit8 v23, p5, 0x6

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 547
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 548
    add-int/lit8 v23, p5, 0x7

    aget v23, p4, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v23, v23, v25

    add-long v23, v23, v21

    add-long v2, v2, v23

    .line 549
    add-int/lit8 v23, p5, 0x7

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p4, v23

    .line 550
    const/16 v23, 0x20

    ushr-long v21, v2, v23

    .line 551
    add-int/lit8 p5, p5, 0x1

    .line 524
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_73

    .line 553
    .end local v2    # "c":J
    .end local v5    # "x_i":J
    :cond_197
    move-wide/from16 v0, v21

    long-to-int v0, v0

    move/from16 v23, v0

    return v23
.end method

.method public static mulAddTo([I[I[I)I
    .registers 32
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "zz"    # [I

    .prologue
    .line 473
    const/16 v23, 0x0

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v7, v23, v25

    .line 474
    .local v7, "y_0":J
    const/16 v23, 0x1

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v9, v23, v25

    .line 475
    .local v9, "y_1":J
    const/16 v23, 0x2

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v11, v23, v25

    .line 476
    .local v11, "y_2":J
    const/16 v23, 0x3

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v13, v23, v25

    .line 477
    .local v13, "y_3":J
    const/16 v23, 0x4

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v15, v23, v25

    .line 478
    .local v15, "y_4":J
    const/16 v23, 0x5

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v17, v23, v25

    .line 479
    .local v17, "y_5":J
    const/16 v23, 0x6

    aget v23, p1, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v19, v23, v25

    .line 481
    .local v19, "y_6":J
    const-wide/16 v21, 0x0

    .line 482
    .local v21, "zc":J
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_73
    const/16 v23, 0x7

    move/from16 v0, v23

    if-ge v4, v0, :cond_193

    .line 484
    const-wide/16 v2, 0x0

    .local v2, "c":J
    aget v23, p0, v4

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v5, v23, v25

    .line 485
    .local v5, "x_i":J
    mul-long v23, v5, v7

    add-int/lit8 v25, v4, 0x0

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 486
    add-int/lit8 v23, v4, 0x0

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 487
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 488
    mul-long v23, v5, v9

    add-int/lit8 v25, v4, 0x1

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 489
    add-int/lit8 v23, v4, 0x1

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 490
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 491
    mul-long v23, v5, v11

    add-int/lit8 v25, v4, 0x2

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 492
    add-int/lit8 v23, v4, 0x2

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 493
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 494
    mul-long v23, v5, v13

    add-int/lit8 v25, v4, 0x3

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 495
    add-int/lit8 v23, v4, 0x3

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 496
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 497
    mul-long v23, v5, v15

    add-int/lit8 v25, v4, 0x4

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 498
    add-int/lit8 v23, v4, 0x4

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 499
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 500
    mul-long v23, v5, v17

    add-int/lit8 v25, v4, 0x5

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 501
    add-int/lit8 v23, v4, 0x5

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 502
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 503
    mul-long v23, v5, v19

    add-int/lit8 v25, v4, 0x6

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v23, v23, v25

    add-long v2, v2, v23

    .line 504
    add-int/lit8 v23, v4, 0x6

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 505
    const/16 v23, 0x20

    ushr-long v2, v2, v23

    .line 506
    add-int/lit8 v23, v4, 0x7

    aget v23, p2, v23

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide v25, 0xffffffffL

    and-long v23, v23, v25

    add-long v23, v23, v21

    add-long v2, v2, v23

    .line 507
    add-int/lit8 v23, v4, 0x7

    long-to-int v0, v2

    move/from16 v24, v0

    aput v24, p2, v23

    .line 508
    const/16 v23, 0x20

    ushr-long v21, v2, v23

    .line 482
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_73

    .line 510
    .end local v2    # "c":J
    .end local v5    # "x_i":J
    :cond_193
    move-wide/from16 v0, v21

    long-to-int v0, v0

    move/from16 v23, v0

    return v23
.end method

.method public static mulByWord(I[I)I
    .registers 14
    .param p0, "x"    # I
    .param p1, "z"    # [I

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 595
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v4, p0

    and-long v2, v4, v6

    .line 596
    .local v2, "xVal":J
    aget v4, p1, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 597
    long-to-int v4, v0

    aput v4, p1, v9

    .line 598
    ushr-long/2addr v0, v8

    .line 599
    aget v4, p1, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 600
    long-to-int v4, v0

    aput v4, p1, v10

    .line 601
    ushr-long/2addr v0, v8

    .line 602
    aget v4, p1, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 603
    long-to-int v4, v0

    aput v4, p1, v11

    .line 604
    ushr-long/2addr v0, v8

    .line 605
    const/4 v4, 0x3

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 606
    const/4 v4, 0x3

    long-to-int v5, v0

    aput v5, p1, v4

    .line 607
    ushr-long/2addr v0, v8

    .line 608
    const/4 v4, 0x4

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 609
    const/4 v4, 0x4

    long-to-int v5, v0

    aput v5, p1, v4

    .line 610
    ushr-long/2addr v0, v8

    .line 611
    const/4 v4, 0x5

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 612
    const/4 v4, 0x5

    long-to-int v5, v0

    aput v5, p1, v4

    .line 613
    ushr-long/2addr v0, v8

    .line 614
    const/4 v4, 0x6

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 615
    const/4 v4, 0x6

    long-to-int v5, v0

    aput v5, p1, v4

    .line 616
    ushr-long/2addr v0, v8

    .line 617
    long-to-int v4, v0

    return v4
.end method

.method public static mulByWordAddTo(I[I[I)I
    .registers 13
    .param p0, "x"    # I
    .param p1, "y"    # [I
    .param p2, "z"    # [I

    .prologue
    .line 622
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v4, p0

    const-wide v6, 0xffffffffL

    and-long v2, v4, v6

    .line 623
    .local v2, "xVal":J
    const/4 v4, 0x0

    aget v4, p2, v4

    int-to-long v4, v4

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    const/4 v6, 0x0

    aget v6, p1, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 624
    const/4 v4, 0x0

    long-to-int v5, v0

    aput v5, p2, v4

    .line 625
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 626
    const/4 v4, 0x1

    aget v4, p2, v4

    int-to-long v4, v4

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    const/4 v6, 0x1

    aget v6, p1, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 627
    const/4 v4, 0x1

    long-to-int v5, v0

    aput v5, p2, v4

    .line 628
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 629
    const/4 v4, 0x2

    aget v4, p2, v4

    int-to-long v4, v4

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    const/4 v6, 0x2

    aget v6, p1, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 630
    const/4 v4, 0x2

    long-to-int v5, v0

    aput v5, p2, v4

    .line 631
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 632
    const/4 v4, 0x3

    aget v4, p2, v4

    int-to-long v4, v4

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    const/4 v6, 0x3

    aget v6, p1, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 633
    const/4 v4, 0x3

    long-to-int v5, v0

    aput v5, p2, v4

    .line 634
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 635
    const/4 v4, 0x4

    aget v4, p2, v4

    int-to-long v4, v4

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    const/4 v6, 0x4

    aget v6, p1, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 636
    const/4 v4, 0x4

    long-to-int v5, v0

    aput v5, p2, v4

    .line 637
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 638
    const/4 v4, 0x5

    aget v4, p2, v4

    int-to-long v4, v4

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    const/4 v6, 0x5

    aget v6, p1, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 639
    const/4 v4, 0x5

    long-to-int v5, v0

    aput v5, p2, v4

    .line 640
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 641
    const/4 v4, 0x6

    aget v4, p2, v4

    int-to-long v4, v4

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    const/4 v6, 0x6

    aget v6, p1, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 642
    const/4 v4, 0x6

    long-to-int v5, v0

    aput v5, p2, v4

    .line 643
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 644
    long-to-int v4, v0

    return v4
.end method

.method public static mulWord(I[I[II)I
    .registers 13
    .param p0, "x"    # I
    .param p1, "y"    # [I
    .param p2, "z"    # [I
    .param p3, "zOff"    # I

    .prologue
    const-wide v7, 0xffffffffL

    .line 733
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v5, p0

    and-long v3, v5, v7

    .line 734
    .local v3, "xVal":J
    const/4 v2, 0x0

    .line 737
    .local v2, "i":I
    :cond_b
    aget v5, p1, v2

    int-to-long v5, v5

    and-long/2addr v5, v7

    mul-long/2addr v5, v3

    add-long/2addr v0, v5

    .line 738
    add-int v5, p3, v2

    long-to-int v6, v0

    aput v6, p2, v5

    .line 739
    const/16 v5, 0x20

    ushr-long/2addr v0, v5

    .line 741
    add-int/lit8 v2, v2, 0x1

    const/4 v5, 0x7

    if-lt v2, v5, :cond_b

    .line 742
    long-to-int v5, v0

    return v5
.end method

.method public static mulWordAddTo(I[II[II)I
    .registers 16
    .param p0, "x"    # I
    .param p1, "y"    # [I
    .param p2, "yOff"    # I
    .param p3, "z"    # [I
    .param p4, "zOff"    # I

    .prologue
    const/16 v10, 0x20

    const-wide v8, 0xffffffffL

    .line 649
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v4, p0

    and-long v2, v4, v8

    .line 650
    .local v2, "xVal":J
    add-int/lit8 v4, p2, 0x0

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v8

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x0

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 651
    add-int/lit8 v4, p4, 0x0

    long-to-int v5, v0

    aput v5, p3, v4

    .line 652
    ushr-long/2addr v0, v10

    .line 653
    add-int/lit8 v4, p2, 0x1

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v8

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x1

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 654
    add-int/lit8 v4, p4, 0x1

    long-to-int v5, v0

    aput v5, p3, v4

    .line 655
    ushr-long/2addr v0, v10

    .line 656
    add-int/lit8 v4, p2, 0x2

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v8

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x2

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 657
    add-int/lit8 v4, p4, 0x2

    long-to-int v5, v0

    aput v5, p3, v4

    .line 658
    ushr-long/2addr v0, v10

    .line 659
    add-int/lit8 v4, p2, 0x3

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v8

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x3

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 660
    add-int/lit8 v4, p4, 0x3

    long-to-int v5, v0

    aput v5, p3, v4

    .line 661
    ushr-long/2addr v0, v10

    .line 662
    add-int/lit8 v4, p2, 0x4

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v8

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x4

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 663
    add-int/lit8 v4, p4, 0x4

    long-to-int v5, v0

    aput v5, p3, v4

    .line 664
    ushr-long/2addr v0, v10

    .line 665
    add-int/lit8 v4, p2, 0x5

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v8

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x5

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 666
    add-int/lit8 v4, p4, 0x5

    long-to-int v5, v0

    aput v5, p3, v4

    .line 667
    ushr-long/2addr v0, v10

    .line 668
    add-int/lit8 v4, p2, 0x6

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v8

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x6

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 669
    add-int/lit8 v4, p4, 0x6

    long-to-int v5, v0

    aput v5, p3, v4

    .line 670
    ushr-long/2addr v0, v10

    .line 671
    long-to-int v4, v0

    return v4
.end method

.method public static mulWordDwordAdd(IJ[II)I
    .registers 16
    .param p0, "x"    # I
    .param p1, "y"    # J
    .param p3, "z"    # [I
    .param p4, "zOff"    # I

    .prologue
    const/16 v10, 0x20

    const-wide v8, 0xffffffffL

    .line 718
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v4, p0

    and-long v2, v4, v8

    .line 719
    .local v2, "xVal":J
    and-long v4, p1, v8

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x0

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 720
    add-int/lit8 v4, p4, 0x0

    long-to-int v5, v0

    aput v5, p3, v4

    .line 721
    ushr-long/2addr v0, v10

    .line 722
    ushr-long v4, p1, v10

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x1

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 723
    add-int/lit8 v4, p4, 0x1

    long-to-int v5, v0

    aput v5, p3, v4

    .line 724
    ushr-long/2addr v0, v10

    .line 725
    add-int/lit8 v4, p4, 0x2

    aget v4, p3, v4

    int-to-long v4, v4

    and-long/2addr v4, v8

    add-long/2addr v0, v4

    .line 726
    add-int/lit8 v4, p4, 0x2

    long-to-int v5, v0

    aput v5, p3, v4

    .line 727
    ushr-long/2addr v0, v10

    .line 728
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-nez v4, :cond_43

    const/4 v4, 0x0

    :goto_42
    return v4

    :cond_43
    const/4 v4, 0x7

    const/4 v5, 0x3

    invoke-static {v4, p3, p4, v5}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    move-result v4

    goto :goto_42
.end method

.method public static square([II[II)V
    .registers 57
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "zz"    # [I
    .param p3, "zzOff"    # I

    .prologue
    .line 886
    add-int/lit8 v49, p1, 0x0

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v11, v49, v51

    .line 889
    .local v11, "x_0":J
    const/4 v2, 0x0

    .line 891
    .local v2, "c":I
    const/4 v3, 0x6

    .local v3, "i":I
    const/16 v5, 0xe

    .line 894
    .local v5, "j":I
    :goto_14
    add-int/lit8 v4, v3, -0x1

    .end local v3    # "i":I
    .local v4, "i":I
    add-int v49, p1, v3

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v9, v49, v51

    .line 895
    .local v9, "xVal":J
    mul-long v6, v9, v9

    .line 896
    .local v6, "p":J
    add-int/lit8 v5, v5, -0x1

    add-int v49, p3, v5

    shl-int/lit8 v50, v2, 0x1f

    const/16 v51, 0x21

    ushr-long v51, v6, v51

    move-wide/from16 v0, v51

    long-to-int v0, v0

    move/from16 v51, v0

    or-int v50, v50, v51

    aput v50, p2, v49

    .line 897
    add-int/lit8 v5, v5, -0x1

    add-int v49, p3, v5

    const/16 v50, 0x1

    ushr-long v50, v6, v50

    move-wide/from16 v0, v50

    long-to-int v0, v0

    move/from16 v50, v0

    aput v50, p2, v49

    .line 898
    long-to-int v2, v6

    .line 900
    if-gtz v4, :cond_351

    .line 903
    mul-long v6, v11, v11

    .line 904
    shl-int/lit8 v49, v2, 0x1f

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v49, v49, v51

    const/16 v51, 0x21

    ushr-long v51, v6, v51

    or-long v25, v49, v51

    .line 905
    .local v25, "zz_1":J
    add-int/lit8 v49, p3, 0x0

    long-to-int v0, v6

    move/from16 v50, v0

    aput v50, p2, v49

    .line 906
    const/16 v49, 0x20

    ushr-long v49, v6, v49

    move-wide/from16 v0, v49

    long-to-int v0, v0

    move/from16 v49, v0

    and-int/lit8 v2, v49, 0x1

    .line 910
    add-int/lit8 v49, p1, 0x1

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v13, v49, v51

    .line 911
    .local v13, "x_1":J
    add-int/lit8 v49, p3, 0x2

    aget v49, p2, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v33, v49, v51

    .line 914
    .local v33, "zz_2":J
    mul-long v49, v13, v11

    add-long v25, v25, v49

    .line 915
    move-wide/from16 v0, v25

    long-to-int v8, v0

    .line 916
    .local v8, "w":I
    add-int/lit8 v49, p3, 0x1

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 917
    ushr-int/lit8 v2, v8, 0x1f

    .line 918
    const/16 v49, 0x20

    ushr-long v49, v25, v49

    add-long v33, v33, v49

    .line 921
    add-int/lit8 v49, p1, 0x2

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v15, v49, v51

    .line 922
    .local v15, "x_2":J
    add-int/lit8 v49, p3, 0x3

    aget v49, p2, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v35, v49, v51

    .line 923
    .local v35, "zz_3":J
    add-int/lit8 v49, p3, 0x4

    aget v49, p2, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v37, v49, v51

    .line 925
    .local v37, "zz_4":J
    mul-long v49, v15, v11

    add-long v33, v33, v49

    .line 926
    move-wide/from16 v0, v33

    long-to-int v8, v0

    .line 927
    add-int/lit8 v49, p3, 0x2

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 928
    ushr-int/lit8 v2, v8, 0x1f

    .line 929
    const/16 v49, 0x20

    ushr-long v49, v33, v49

    mul-long v51, v15, v13

    add-long v49, v49, v51

    add-long v35, v35, v49

    .line 930
    const/16 v49, 0x20

    ushr-long v49, v35, v49

    add-long v37, v37, v49

    .line 931
    const-wide v49, 0xffffffffL

    and-long v35, v35, v49

    .line 934
    add-int/lit8 v49, p1, 0x3

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v17, v49, v51

    .line 935
    .local v17, "x_3":J
    add-int/lit8 v49, p3, 0x5

    aget v49, p2, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v39, v49, v51

    .line 936
    .local v39, "zz_5":J
    add-int/lit8 v49, p3, 0x6

    aget v49, p2, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v41, v49, v51

    .line 938
    .local v41, "zz_6":J
    mul-long v49, v17, v11

    add-long v35, v35, v49

    .line 939
    move-wide/from16 v0, v35

    long-to-int v8, v0

    .line 940
    add-int/lit8 v49, p3, 0x3

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 941
    ushr-int/lit8 v2, v8, 0x1f

    .line 942
    const/16 v49, 0x20

    ushr-long v49, v35, v49

    mul-long v51, v17, v13

    add-long v49, v49, v51

    add-long v37, v37, v49

    .line 943
    const/16 v49, 0x20

    ushr-long v49, v37, v49

    mul-long v51, v17, v15

    add-long v49, v49, v51

    add-long v39, v39, v49

    .line 944
    const-wide v49, 0xffffffffL

    and-long v37, v37, v49

    .line 945
    const/16 v49, 0x20

    ushr-long v49, v39, v49

    add-long v41, v41, v49

    .line 946
    const-wide v49, 0xffffffffL

    and-long v39, v39, v49

    .line 949
    add-int/lit8 v49, p1, 0x4

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v19, v49, v51

    .line 950
    .local v19, "x_4":J
    add-int/lit8 v49, p3, 0x7

    aget v49, p2, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v43, v49, v51

    .line 951
    .local v43, "zz_7":J
    add-int/lit8 v49, p3, 0x8

    aget v49, p2, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v45, v49, v51

    .line 953
    .local v45, "zz_8":J
    mul-long v49, v19, v11

    add-long v37, v37, v49

    .line 954
    move-wide/from16 v0, v37

    long-to-int v8, v0

    .line 955
    add-int/lit8 v49, p3, 0x4

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 956
    ushr-int/lit8 v2, v8, 0x1f

    .line 957
    const/16 v49, 0x20

    ushr-long v49, v37, v49

    mul-long v51, v19, v13

    add-long v49, v49, v51

    add-long v39, v39, v49

    .line 958
    const/16 v49, 0x20

    ushr-long v49, v39, v49

    mul-long v51, v19, v15

    add-long v49, v49, v51

    add-long v41, v41, v49

    .line 959
    const-wide v49, 0xffffffffL

    and-long v39, v39, v49

    .line 960
    const/16 v49, 0x20

    ushr-long v49, v41, v49

    mul-long v51, v19, v17

    add-long v49, v49, v51

    add-long v43, v43, v49

    .line 961
    const-wide v49, 0xffffffffL

    and-long v41, v41, v49

    .line 962
    const/16 v49, 0x20

    ushr-long v49, v43, v49

    add-long v45, v45, v49

    .line 963
    const-wide v49, 0xffffffffL

    and-long v43, v43, v49

    .line 966
    add-int/lit8 v49, p1, 0x5

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v21, v49, v51

    .line 967
    .local v21, "x_5":J
    add-int/lit8 v49, p3, 0x9

    aget v49, p2, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v47, v49, v51

    .line 968
    .local v47, "zz_9":J
    add-int/lit8 v49, p3, 0xa

    aget v49, p2, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v27, v49, v51

    .line 970
    .local v27, "zz_10":J
    mul-long v49, v21, v11

    add-long v39, v39, v49

    .line 971
    move-wide/from16 v0, v39

    long-to-int v8, v0

    .line 972
    add-int/lit8 v49, p3, 0x5

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 973
    ushr-int/lit8 v2, v8, 0x1f

    .line 974
    const/16 v49, 0x20

    ushr-long v49, v39, v49

    mul-long v51, v21, v13

    add-long v49, v49, v51

    add-long v41, v41, v49

    .line 975
    const/16 v49, 0x20

    ushr-long v49, v41, v49

    mul-long v51, v21, v15

    add-long v49, v49, v51

    add-long v43, v43, v49

    .line 976
    const-wide v49, 0xffffffffL

    and-long v41, v41, v49

    .line 977
    const/16 v49, 0x20

    ushr-long v49, v43, v49

    mul-long v51, v21, v17

    add-long v49, v49, v51

    add-long v45, v45, v49

    .line 978
    const-wide v49, 0xffffffffL

    and-long v43, v43, v49

    .line 979
    const/16 v49, 0x20

    ushr-long v49, v45, v49

    mul-long v51, v21, v19

    add-long v49, v49, v51

    add-long v47, v47, v49

    .line 980
    const-wide v49, 0xffffffffL

    and-long v45, v45, v49

    .line 981
    const/16 v49, 0x20

    ushr-long v49, v47, v49

    add-long v27, v27, v49

    .line 982
    const-wide v49, 0xffffffffL

    and-long v47, v47, v49

    .line 985
    add-int/lit8 v49, p1, 0x6

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v23, v49, v51

    .line 986
    .local v23, "x_6":J
    add-int/lit8 v49, p3, 0xb

    aget v49, p2, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v29, v49, v51

    .line 987
    .local v29, "zz_11":J
    add-int/lit8 v49, p3, 0xc

    aget v49, p2, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v31, v49, v51

    .line 989
    .local v31, "zz_12":J
    mul-long v49, v23, v11

    add-long v41, v41, v49

    .line 990
    move-wide/from16 v0, v41

    long-to-int v8, v0

    .line 991
    add-int/lit8 v49, p3, 0x6

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 992
    ushr-int/lit8 v2, v8, 0x1f

    .line 993
    const/16 v49, 0x20

    ushr-long v49, v41, v49

    mul-long v51, v23, v13

    add-long v49, v49, v51

    add-long v43, v43, v49

    .line 994
    const/16 v49, 0x20

    ushr-long v49, v43, v49

    mul-long v51, v23, v15

    add-long v49, v49, v51

    add-long v45, v45, v49

    .line 995
    const/16 v49, 0x20

    ushr-long v49, v45, v49

    mul-long v51, v23, v17

    add-long v49, v49, v51

    add-long v47, v47, v49

    .line 996
    const/16 v49, 0x20

    ushr-long v49, v47, v49

    mul-long v51, v23, v19

    add-long v49, v49, v51

    add-long v27, v27, v49

    .line 997
    const/16 v49, 0x20

    ushr-long v49, v27, v49

    mul-long v51, v23, v21

    add-long v49, v49, v51

    add-long v29, v29, v49

    .line 998
    const/16 v49, 0x20

    ushr-long v49, v29, v49

    add-long v31, v31, v49

    .line 1001
    move-wide/from16 v0, v43

    long-to-int v8, v0

    .line 1002
    add-int/lit8 v49, p3, 0x7

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 1003
    ushr-int/lit8 v2, v8, 0x1f

    .line 1004
    move-wide/from16 v0, v45

    long-to-int v8, v0

    .line 1005
    add-int/lit8 v49, p3, 0x8

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 1006
    ushr-int/lit8 v2, v8, 0x1f

    .line 1007
    move-wide/from16 v0, v47

    long-to-int v8, v0

    .line 1008
    add-int/lit8 v49, p3, 0x9

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 1009
    ushr-int/lit8 v2, v8, 0x1f

    .line 1010
    move-wide/from16 v0, v27

    long-to-int v8, v0

    .line 1011
    add-int/lit8 v49, p3, 0xa

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 1012
    ushr-int/lit8 v2, v8, 0x1f

    .line 1013
    move-wide/from16 v0, v29

    long-to-int v8, v0

    .line 1014
    add-int/lit8 v49, p3, 0xb

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 1015
    ushr-int/lit8 v2, v8, 0x1f

    .line 1016
    move-wide/from16 v0, v31

    long-to-int v8, v0

    .line 1017
    add-int/lit8 v49, p3, 0xc

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 1018
    ushr-int/lit8 v2, v8, 0x1f

    .line 1019
    add-int/lit8 v49, p3, 0xd

    aget v49, p2, v49

    const/16 v50, 0x20

    shr-long v50, v31, v50

    move-wide/from16 v0, v50

    long-to-int v0, v0

    move/from16 v50, v0

    add-int v8, v49, v50

    .line 1020
    add-int/lit8 v49, p3, 0xd

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p2, v49

    .line 1021
    return-void

    .end local v8    # "w":I
    .end local v13    # "x_1":J
    .end local v15    # "x_2":J
    .end local v17    # "x_3":J
    .end local v19    # "x_4":J
    .end local v21    # "x_5":J
    .end local v23    # "x_6":J
    .end local v25    # "zz_1":J
    .end local v27    # "zz_10":J
    .end local v29    # "zz_11":J
    .end local v31    # "zz_12":J
    .end local v33    # "zz_2":J
    .end local v35    # "zz_3":J
    .end local v37    # "zz_4":J
    .end local v39    # "zz_5":J
    .end local v41    # "zz_6":J
    .end local v43    # "zz_7":J
    .end local v45    # "zz_8":J
    .end local v47    # "zz_9":J
    :cond_351
    move v3, v4

    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto/16 :goto_14
.end method

.method public static square([I[I)V
    .registers 55
    .param p0, "x"    # [I
    .param p1, "zz"    # [I

    .prologue
    .line 747
    const/16 v49, 0x0

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v11, v49, v51

    .line 750
    .local v11, "x_0":J
    const/4 v2, 0x0

    .line 752
    .local v2, "c":I
    const/4 v3, 0x6

    .local v3, "i":I
    const/16 v5, 0xe

    .line 755
    .local v5, "j":I
    :goto_14
    add-int/lit8 v4, v3, -0x1

    .end local v3    # "i":I
    .local v4, "i":I
    aget v49, p0, v3

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v9, v49, v51

    .line 756
    .local v9, "xVal":J
    mul-long v6, v9, v9

    .line 757
    .local v6, "p":J
    add-int/lit8 v5, v5, -0x1

    shl-int/lit8 v49, v2, 0x1f

    const/16 v50, 0x21

    ushr-long v50, v6, v50

    move-wide/from16 v0, v50

    long-to-int v0, v0

    move/from16 v50, v0

    or-int v49, v49, v50

    aput v49, p1, v5

    .line 758
    add-int/lit8 v5, v5, -0x1

    const/16 v49, 0x1

    ushr-long v49, v6, v49

    move-wide/from16 v0, v49

    long-to-int v0, v0

    move/from16 v49, v0

    aput v49, p1, v5

    .line 759
    long-to-int v2, v6

    .line 761
    if-gtz v4, :cond_34b

    .line 764
    mul-long v6, v11, v11

    .line 765
    shl-int/lit8 v49, v2, 0x1f

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v49, v49, v51

    const/16 v51, 0x21

    ushr-long v51, v6, v51

    or-long v25, v49, v51

    .line 766
    .local v25, "zz_1":J
    const/16 v49, 0x0

    long-to-int v0, v6

    move/from16 v50, v0

    aput v50, p1, v49

    .line 767
    const/16 v49, 0x20

    ushr-long v49, v6, v49

    move-wide/from16 v0, v49

    long-to-int v0, v0

    move/from16 v49, v0

    and-int/lit8 v2, v49, 0x1

    .line 771
    const/16 v49, 0x1

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v13, v49, v51

    .line 772
    .local v13, "x_1":J
    const/16 v49, 0x2

    aget v49, p1, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v33, v49, v51

    .line 775
    .local v33, "zz_2":J
    mul-long v49, v13, v11

    add-long v25, v25, v49

    .line 776
    move-wide/from16 v0, v25

    long-to-int v8, v0

    .line 777
    .local v8, "w":I
    const/16 v49, 0x1

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 778
    ushr-int/lit8 v2, v8, 0x1f

    .line 779
    const/16 v49, 0x20

    ushr-long v49, v25, v49

    add-long v33, v33, v49

    .line 782
    const/16 v49, 0x2

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v15, v49, v51

    .line 783
    .local v15, "x_2":J
    const/16 v49, 0x3

    aget v49, p1, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v35, v49, v51

    .line 784
    .local v35, "zz_3":J
    const/16 v49, 0x4

    aget v49, p1, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v37, v49, v51

    .line 786
    .local v37, "zz_4":J
    mul-long v49, v15, v11

    add-long v33, v33, v49

    .line 787
    move-wide/from16 v0, v33

    long-to-int v8, v0

    .line 788
    const/16 v49, 0x2

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 789
    ushr-int/lit8 v2, v8, 0x1f

    .line 790
    const/16 v49, 0x20

    ushr-long v49, v33, v49

    mul-long v51, v15, v13

    add-long v49, v49, v51

    add-long v35, v35, v49

    .line 791
    const/16 v49, 0x20

    ushr-long v49, v35, v49

    add-long v37, v37, v49

    .line 792
    const-wide v49, 0xffffffffL

    and-long v35, v35, v49

    .line 795
    const/16 v49, 0x3

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v17, v49, v51

    .line 796
    .local v17, "x_3":J
    const/16 v49, 0x5

    aget v49, p1, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v39, v49, v51

    .line 797
    .local v39, "zz_5":J
    const/16 v49, 0x6

    aget v49, p1, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v41, v49, v51

    .line 799
    .local v41, "zz_6":J
    mul-long v49, v17, v11

    add-long v35, v35, v49

    .line 800
    move-wide/from16 v0, v35

    long-to-int v8, v0

    .line 801
    const/16 v49, 0x3

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 802
    ushr-int/lit8 v2, v8, 0x1f

    .line 803
    const/16 v49, 0x20

    ushr-long v49, v35, v49

    mul-long v51, v17, v13

    add-long v49, v49, v51

    add-long v37, v37, v49

    .line 804
    const/16 v49, 0x20

    ushr-long v49, v37, v49

    mul-long v51, v17, v15

    add-long v49, v49, v51

    add-long v39, v39, v49

    .line 805
    const-wide v49, 0xffffffffL

    and-long v37, v37, v49

    .line 806
    const/16 v49, 0x20

    ushr-long v49, v39, v49

    add-long v41, v41, v49

    .line 807
    const-wide v49, 0xffffffffL

    and-long v39, v39, v49

    .line 810
    const/16 v49, 0x4

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v19, v49, v51

    .line 811
    .local v19, "x_4":J
    const/16 v49, 0x7

    aget v49, p1, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v43, v49, v51

    .line 812
    .local v43, "zz_7":J
    const/16 v49, 0x8

    aget v49, p1, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v45, v49, v51

    .line 814
    .local v45, "zz_8":J
    mul-long v49, v19, v11

    add-long v37, v37, v49

    .line 815
    move-wide/from16 v0, v37

    long-to-int v8, v0

    .line 816
    const/16 v49, 0x4

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 817
    ushr-int/lit8 v2, v8, 0x1f

    .line 818
    const/16 v49, 0x20

    ushr-long v49, v37, v49

    mul-long v51, v19, v13

    add-long v49, v49, v51

    add-long v39, v39, v49

    .line 819
    const/16 v49, 0x20

    ushr-long v49, v39, v49

    mul-long v51, v19, v15

    add-long v49, v49, v51

    add-long v41, v41, v49

    .line 820
    const-wide v49, 0xffffffffL

    and-long v39, v39, v49

    .line 821
    const/16 v49, 0x20

    ushr-long v49, v41, v49

    mul-long v51, v19, v17

    add-long v49, v49, v51

    add-long v43, v43, v49

    .line 822
    const-wide v49, 0xffffffffL

    and-long v41, v41, v49

    .line 823
    const/16 v49, 0x20

    ushr-long v49, v43, v49

    add-long v45, v45, v49

    .line 824
    const-wide v49, 0xffffffffL

    and-long v43, v43, v49

    .line 827
    const/16 v49, 0x5

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v21, v49, v51

    .line 828
    .local v21, "x_5":J
    const/16 v49, 0x9

    aget v49, p1, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v47, v49, v51

    .line 829
    .local v47, "zz_9":J
    const/16 v49, 0xa

    aget v49, p1, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v27, v49, v51

    .line 831
    .local v27, "zz_10":J
    mul-long v49, v21, v11

    add-long v39, v39, v49

    .line 832
    move-wide/from16 v0, v39

    long-to-int v8, v0

    .line 833
    const/16 v49, 0x5

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 834
    ushr-int/lit8 v2, v8, 0x1f

    .line 835
    const/16 v49, 0x20

    ushr-long v49, v39, v49

    mul-long v51, v21, v13

    add-long v49, v49, v51

    add-long v41, v41, v49

    .line 836
    const/16 v49, 0x20

    ushr-long v49, v41, v49

    mul-long v51, v21, v15

    add-long v49, v49, v51

    add-long v43, v43, v49

    .line 837
    const-wide v49, 0xffffffffL

    and-long v41, v41, v49

    .line 838
    const/16 v49, 0x20

    ushr-long v49, v43, v49

    mul-long v51, v21, v17

    add-long v49, v49, v51

    add-long v45, v45, v49

    .line 839
    const-wide v49, 0xffffffffL

    and-long v43, v43, v49

    .line 840
    const/16 v49, 0x20

    ushr-long v49, v45, v49

    mul-long v51, v21, v19

    add-long v49, v49, v51

    add-long v47, v47, v49

    .line 841
    const-wide v49, 0xffffffffL

    and-long v45, v45, v49

    .line 842
    const/16 v49, 0x20

    ushr-long v49, v47, v49

    add-long v27, v27, v49

    .line 843
    const-wide v49, 0xffffffffL

    and-long v47, v47, v49

    .line 846
    const/16 v49, 0x6

    aget v49, p0, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v23, v49, v51

    .line 847
    .local v23, "x_6":J
    const/16 v49, 0xb

    aget v49, p1, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v29, v49, v51

    .line 848
    .local v29, "zz_11":J
    const/16 v49, 0xc

    aget v49, p1, v49

    move/from16 v0, v49

    int-to-long v0, v0

    move-wide/from16 v49, v0

    const-wide v51, 0xffffffffL

    and-long v31, v49, v51

    .line 850
    .local v31, "zz_12":J
    mul-long v49, v23, v11

    add-long v41, v41, v49

    .line 851
    move-wide/from16 v0, v41

    long-to-int v8, v0

    .line 852
    const/16 v49, 0x6

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 853
    ushr-int/lit8 v2, v8, 0x1f

    .line 854
    const/16 v49, 0x20

    ushr-long v49, v41, v49

    mul-long v51, v23, v13

    add-long v49, v49, v51

    add-long v43, v43, v49

    .line 855
    const/16 v49, 0x20

    ushr-long v49, v43, v49

    mul-long v51, v23, v15

    add-long v49, v49, v51

    add-long v45, v45, v49

    .line 856
    const/16 v49, 0x20

    ushr-long v49, v45, v49

    mul-long v51, v23, v17

    add-long v49, v49, v51

    add-long v47, v47, v49

    .line 857
    const/16 v49, 0x20

    ushr-long v49, v47, v49

    mul-long v51, v23, v19

    add-long v49, v49, v51

    add-long v27, v27, v49

    .line 858
    const/16 v49, 0x20

    ushr-long v49, v27, v49

    mul-long v51, v23, v21

    add-long v49, v49, v51

    add-long v29, v29, v49

    .line 859
    const/16 v49, 0x20

    ushr-long v49, v29, v49

    add-long v31, v31, v49

    .line 862
    move-wide/from16 v0, v43

    long-to-int v8, v0

    .line 863
    const/16 v49, 0x7

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 864
    ushr-int/lit8 v2, v8, 0x1f

    .line 865
    move-wide/from16 v0, v45

    long-to-int v8, v0

    .line 866
    const/16 v49, 0x8

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 867
    ushr-int/lit8 v2, v8, 0x1f

    .line 868
    move-wide/from16 v0, v47

    long-to-int v8, v0

    .line 869
    const/16 v49, 0x9

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 870
    ushr-int/lit8 v2, v8, 0x1f

    .line 871
    move-wide/from16 v0, v27

    long-to-int v8, v0

    .line 872
    const/16 v49, 0xa

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 873
    ushr-int/lit8 v2, v8, 0x1f

    .line 874
    move-wide/from16 v0, v29

    long-to-int v8, v0

    .line 875
    const/16 v49, 0xb

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 876
    ushr-int/lit8 v2, v8, 0x1f

    .line 877
    move-wide/from16 v0, v31

    long-to-int v8, v0

    .line 878
    const/16 v49, 0xc

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 879
    ushr-int/lit8 v2, v8, 0x1f

    .line 880
    const/16 v49, 0xd

    aget v49, p1, v49

    const/16 v50, 0x20

    shr-long v50, v31, v50

    move-wide/from16 v0, v50

    long-to-int v0, v0

    move/from16 v50, v0

    add-int v8, v49, v50

    .line 881
    const/16 v49, 0xd

    shl-int/lit8 v50, v8, 0x1

    or-int v50, v50, v2

    aput v50, p1, v49

    .line 882
    return-void

    .end local v8    # "w":I
    .end local v13    # "x_1":J
    .end local v15    # "x_2":J
    .end local v17    # "x_3":J
    .end local v19    # "x_4":J
    .end local v21    # "x_5":J
    .end local v23    # "x_6":J
    .end local v25    # "zz_1":J
    .end local v27    # "zz_10":J
    .end local v29    # "zz_11":J
    .end local v31    # "zz_12":J
    .end local v33    # "zz_2":J
    .end local v35    # "zz_3":J
    .end local v37    # "zz_4":J
    .end local v39    # "zz_5":J
    .end local v41    # "zz_6":J
    .end local v43    # "zz_7":J
    .end local v45    # "zz_8":J
    .end local v47    # "zz_9":J
    :cond_34b
    move v3, v4

    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto/16 :goto_14
.end method

.method public static sub([II[II[II)I
    .registers 15
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "y"    # [I
    .param p3, "yOff"    # I
    .param p4, "z"    # [I
    .param p5, "zOff"    # I

    .prologue
    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 1052
    const-wide/16 v0, 0x0

    .line 1053
    .local v0, "c":J
    add-int/lit8 v2, p1, 0x0

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x0

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1054
    add-int/lit8 v2, p5, 0x0

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1055
    shr-long/2addr v0, v8

    .line 1056
    add-int/lit8 v2, p1, 0x1

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x1

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1057
    add-int/lit8 v2, p5, 0x1

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1058
    shr-long/2addr v0, v8

    .line 1059
    add-int/lit8 v2, p1, 0x2

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x2

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1060
    add-int/lit8 v2, p5, 0x2

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1061
    shr-long/2addr v0, v8

    .line 1062
    add-int/lit8 v2, p1, 0x3

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x3

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1063
    add-int/lit8 v2, p5, 0x3

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1064
    shr-long/2addr v0, v8

    .line 1065
    add-int/lit8 v2, p1, 0x4

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x4

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1066
    add-int/lit8 v2, p5, 0x4

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1067
    shr-long/2addr v0, v8

    .line 1068
    add-int/lit8 v2, p1, 0x5

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x5

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1069
    add-int/lit8 v2, p5, 0x5

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1070
    shr-long/2addr v0, v8

    .line 1071
    add-int/lit8 v2, p1, 0x6

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x6

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1072
    add-int/lit8 v2, p5, 0x6

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1073
    shr-long/2addr v0, v8

    .line 1074
    long-to-int v2, v0

    return v2
.end method

.method public static sub([I[I[I)I
    .registers 15
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "z"    # [I

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 1025
    const-wide/16 v0, 0x0

    .line 1026
    .local v0, "c":J
    aget v2, p0, v9

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1027
    long-to-int v2, v0

    aput v2, p2, v9

    .line 1028
    shr-long/2addr v0, v8

    .line 1029
    aget v2, p0, v10

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1030
    long-to-int v2, v0

    aput v2, p2, v10

    .line 1031
    shr-long/2addr v0, v8

    .line 1032
    aget v2, p0, v11

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1033
    long-to-int v2, v0

    aput v2, p2, v11

    .line 1034
    shr-long/2addr v0, v8

    .line 1035
    const/4 v2, 0x3

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x3

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1036
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1037
    shr-long/2addr v0, v8

    .line 1038
    const/4 v2, 0x4

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x4

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1039
    const/4 v2, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1040
    shr-long/2addr v0, v8

    .line 1041
    const/4 v2, 0x5

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x5

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1042
    const/4 v2, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1043
    shr-long/2addr v0, v8

    .line 1044
    const/4 v2, 0x6

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x6

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1045
    const/4 v2, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1046
    shr-long/2addr v0, v8

    .line 1047
    long-to-int v2, v0

    return v2
.end method

.method public static subBothFrom([I[I[I)I
    .registers 15
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "z"    # [I

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 1079
    const-wide/16 v0, 0x0

    .line 1080
    .local v0, "c":J
    aget v2, p2, v9

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p0, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    aget v4, p1, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1081
    long-to-int v2, v0

    aput v2, p2, v9

    .line 1082
    shr-long/2addr v0, v8

    .line 1083
    aget v2, p2, v10

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p0, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    aget v4, p1, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1084
    long-to-int v2, v0

    aput v2, p2, v10

    .line 1085
    shr-long/2addr v0, v8

    .line 1086
    aget v2, p2, v11

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p0, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    aget v4, p1, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1087
    long-to-int v2, v0

    aput v2, p2, v11

    .line 1088
    shr-long/2addr v0, v8

    .line 1089
    const/4 v2, 0x3

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x3

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    const/4 v4, 0x3

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1090
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1091
    shr-long/2addr v0, v8

    .line 1092
    const/4 v2, 0x4

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x4

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    const/4 v4, 0x4

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1093
    const/4 v2, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1094
    shr-long/2addr v0, v8

    .line 1095
    const/4 v2, 0x5

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x5

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    const/4 v4, 0x5

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1096
    const/4 v2, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1097
    shr-long/2addr v0, v8

    .line 1098
    const/4 v2, 0x6

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x6

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    const/4 v4, 0x6

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1099
    const/4 v2, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1100
    shr-long/2addr v0, v8

    .line 1101
    long-to-int v2, v0

    return v2
.end method

.method public static subFrom([II[II)I
    .registers 13
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "z"    # [I
    .param p3, "zOff"    # I

    .prologue
    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 1133
    const-wide/16 v0, 0x0

    .line 1134
    .local v0, "c":J
    add-int/lit8 v2, p3, 0x0

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p1, 0x0

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1135
    add-int/lit8 v2, p3, 0x0

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1136
    shr-long/2addr v0, v8

    .line 1137
    add-int/lit8 v2, p3, 0x1

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p1, 0x1

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1138
    add-int/lit8 v2, p3, 0x1

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1139
    shr-long/2addr v0, v8

    .line 1140
    add-int/lit8 v2, p3, 0x2

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p1, 0x2

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1141
    add-int/lit8 v2, p3, 0x2

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1142
    shr-long/2addr v0, v8

    .line 1143
    add-int/lit8 v2, p3, 0x3

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p1, 0x3

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1144
    add-int/lit8 v2, p3, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1145
    shr-long/2addr v0, v8

    .line 1146
    add-int/lit8 v2, p3, 0x4

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p1, 0x4

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1147
    add-int/lit8 v2, p3, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1148
    shr-long/2addr v0, v8

    .line 1149
    add-int/lit8 v2, p3, 0x5

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p1, 0x5

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1150
    add-int/lit8 v2, p3, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1151
    shr-long/2addr v0, v8

    .line 1152
    add-int/lit8 v2, p3, 0x6

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p1, 0x6

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1153
    add-int/lit8 v2, p3, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1154
    shr-long/2addr v0, v8

    .line 1155
    long-to-int v2, v0

    return v2
.end method

.method public static subFrom([I[I)I
    .registers 14
    .param p0, "x"    # [I
    .param p1, "z"    # [I

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/16 v8, 0x20

    const-wide v6, 0xffffffffL

    .line 1106
    const-wide/16 v0, 0x0

    .line 1107
    .local v0, "c":J
    aget v2, p1, v9

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p0, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1108
    long-to-int v2, v0

    aput v2, p1, v9

    .line 1109
    shr-long/2addr v0, v8

    .line 1110
    aget v2, p1, v10

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p0, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1111
    long-to-int v2, v0

    aput v2, p1, v10

    .line 1112
    shr-long/2addr v0, v8

    .line 1113
    aget v2, p1, v11

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p0, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1114
    long-to-int v2, v0

    aput v2, p1, v11

    .line 1115
    shr-long/2addr v0, v8

    .line 1116
    const/4 v2, 0x3

    aget v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x3

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1117
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p1, v2

    .line 1118
    shr-long/2addr v0, v8

    .line 1119
    const/4 v2, 0x4

    aget v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x4

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1120
    const/4 v2, 0x4

    long-to-int v3, v0

    aput v3, p1, v2

    .line 1121
    shr-long/2addr v0, v8

    .line 1122
    const/4 v2, 0x5

    aget v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x5

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1123
    const/4 v2, 0x5

    long-to-int v3, v0

    aput v3, p1, v2

    .line 1124
    shr-long/2addr v0, v8

    .line 1125
    const/4 v2, 0x6

    aget v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x6

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1126
    const/4 v2, 0x6

    long-to-int v3, v0

    aput v3, p1, v2

    .line 1127
    shr-long/2addr v0, v8

    .line 1128
    long-to-int v2, v0

    return v2
.end method

.method public static toBigInteger([I)Ljava/math/BigInteger;
    .registers 6
    .param p0, "x"    # [I

    .prologue
    .line 1160
    const/16 v3, 0x1c

    new-array v0, v3, [B

    .line 1161
    .local v0, "bs":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    const/4 v3, 0x7

    if-ge v1, v3, :cond_16

    .line 1163
    aget v2, p0, v1

    .line 1164
    .local v2, "x_i":I
    if-eqz v2, :cond_13

    .line 1166
    rsub-int/lit8 v3, v1, 0x6

    shl-int/lit8 v3, v3, 0x2

    invoke-static {v2, v0, v3}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 1161
    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1169
    .end local v2    # "x_i":I
    :cond_16
    new-instance v3, Ljava/math/BigInteger;

    const/4 v4, 0x1

    invoke-direct {v3, v4, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    return-object v3
.end method

.method public static zero([I)V
    .registers 3
    .param p0, "z"    # [I

    .prologue
    const/4 v1, 0x0

    .line 1174
    aput v1, p0, v1

    .line 1175
    const/4 v0, 0x1

    aput v1, p0, v0

    .line 1176
    const/4 v0, 0x2

    aput v1, p0, v0

    .line 1177
    const/4 v0, 0x3

    aput v1, p0, v0

    .line 1178
    const/4 v0, 0x4

    aput v1, p0, v0

    .line 1179
    const/4 v0, 0x5

    aput v1, p0, v0

    .line 1180
    const/4 v0, 0x6

    aput v1, p0, v0

    .line 1181
    return-void
.end method
