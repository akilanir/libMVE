.class public abstract Lorg/spongycastle/math/raw/Nat256;
.super Ljava/lang/Object;
.source "Nat256.java"


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

    .line 43
    const-wide/16 v0, 0x0

    .line 44
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

    .line 45
    add-int/lit8 v2, p5, 0x0

    long-to-int v3, v0

    aput v3, p4, v2

    .line 46
    ushr-long/2addr v0, v8

    .line 47
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

    .line 48
    add-int/lit8 v2, p5, 0x1

    long-to-int v3, v0

    aput v3, p4, v2

    .line 49
    ushr-long/2addr v0, v8

    .line 50
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

    .line 51
    add-int/lit8 v2, p5, 0x2

    long-to-int v3, v0

    aput v3, p4, v2

    .line 52
    ushr-long/2addr v0, v8

    .line 53
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

    .line 54
    add-int/lit8 v2, p5, 0x3

    long-to-int v3, v0

    aput v3, p4, v2

    .line 55
    ushr-long/2addr v0, v8

    .line 56
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

    .line 57
    add-int/lit8 v2, p5, 0x4

    long-to-int v3, v0

    aput v3, p4, v2

    .line 58
    ushr-long/2addr v0, v8

    .line 59
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

    .line 60
    add-int/lit8 v2, p5, 0x5

    long-to-int v3, v0

    aput v3, p4, v2

    .line 61
    ushr-long/2addr v0, v8

    .line 62
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

    .line 63
    add-int/lit8 v2, p5, 0x6

    long-to-int v3, v0

    aput v3, p4, v2

    .line 64
    ushr-long/2addr v0, v8

    .line 65
    add-int/lit8 v2, p1, 0x7

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x7

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 66
    add-int/lit8 v2, p5, 0x7

    long-to-int v3, v0

    aput v3, p4, v2

    .line 67
    ushr-long/2addr v0, v8

    .line 68
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
    const/4 v2, 0x7

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x7

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 36
    const/4 v2, 0x7

    long-to-int v3, v0

    aput v3, p2, v2

    .line 37
    ushr-long/2addr v0, v8

    .line 38
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

    .line 103
    const-wide/16 v0, 0x0

    .line 104
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

    .line 105
    add-int/lit8 v2, p5, 0x0

    long-to-int v3, v0

    aput v3, p4, v2

    .line 106
    ushr-long/2addr v0, v8

    .line 107
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

    .line 108
    add-int/lit8 v2, p5, 0x1

    long-to-int v3, v0

    aput v3, p4, v2

    .line 109
    ushr-long/2addr v0, v8

    .line 110
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

    .line 111
    add-int/lit8 v2, p5, 0x2

    long-to-int v3, v0

    aput v3, p4, v2

    .line 112
    ushr-long/2addr v0, v8

    .line 113
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

    .line 114
    add-int/lit8 v2, p5, 0x3

    long-to-int v3, v0

    aput v3, p4, v2

    .line 115
    ushr-long/2addr v0, v8

    .line 116
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

    .line 117
    add-int/lit8 v2, p5, 0x4

    long-to-int v3, v0

    aput v3, p4, v2

    .line 118
    ushr-long/2addr v0, v8

    .line 119
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

    .line 120
    add-int/lit8 v2, p5, 0x5

    long-to-int v3, v0

    aput v3, p4, v2

    .line 121
    ushr-long/2addr v0, v8

    .line 122
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

    .line 123
    add-int/lit8 v2, p5, 0x6

    long-to-int v3, v0

    aput v3, p4, v2

    .line 124
    ushr-long/2addr v0, v8

    .line 125
    add-int/lit8 v2, p1, 0x7

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x7

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-int/lit8 v4, p5, 0x7

    aget v4, p4, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 126
    add-int/lit8 v2, p5, 0x7

    long-to-int v3, v0

    aput v3, p4, v2

    .line 127
    ushr-long/2addr v0, v8

    .line 128
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

    .line 73
    const-wide/16 v0, 0x0

    .line 74
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

    .line 75
    long-to-int v2, v0

    aput v2, p2, v9

    .line 76
    ushr-long/2addr v0, v8

    .line 77
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

    .line 78
    long-to-int v2, v0

    aput v2, p2, v10

    .line 79
    ushr-long/2addr v0, v8

    .line 80
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

    .line 81
    long-to-int v2, v0

    aput v2, p2, v11

    .line 82
    ushr-long/2addr v0, v8

    .line 83
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

    .line 84
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 85
    ushr-long/2addr v0, v8

    .line 86
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

    .line 87
    const/4 v2, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 88
    ushr-long/2addr v0, v8

    .line 89
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

    .line 90
    const/4 v2, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 91
    ushr-long/2addr v0, v8

    .line 92
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

    .line 93
    const/4 v2, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 94
    ushr-long/2addr v0, v8

    .line 95
    const/4 v2, 0x7

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x7

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    const/4 v4, 0x7

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 96
    const/4 v2, 0x7

    long-to-int v3, v0

    aput v3, p2, v2

    .line 97
    ushr-long/2addr v0, v8

    .line 98
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

    .line 163
    int-to-long v2, p4

    and-long v0, v2, v6

    .line 164
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

    .line 165
    add-int/lit8 v2, p3, 0x0

    long-to-int v3, v0

    aput v3, p2, v2

    .line 166
    ushr-long/2addr v0, v8

    .line 167
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

    .line 168
    add-int/lit8 v2, p3, 0x1

    long-to-int v3, v0

    aput v3, p2, v2

    .line 169
    ushr-long/2addr v0, v8

    .line 170
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

    .line 171
    add-int/lit8 v2, p3, 0x2

    long-to-int v3, v0

    aput v3, p2, v2

    .line 172
    ushr-long/2addr v0, v8

    .line 173
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

    .line 174
    add-int/lit8 v2, p3, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 175
    ushr-long/2addr v0, v8

    .line 176
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

    .line 177
    add-int/lit8 v2, p3, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 178
    ushr-long/2addr v0, v8

    .line 179
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

    .line 180
    add-int/lit8 v2, p3, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 181
    ushr-long/2addr v0, v8

    .line 182
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

    .line 183
    add-int/lit8 v2, p3, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 184
    ushr-long/2addr v0, v8

    .line 185
    add-int/lit8 v2, p1, 0x7

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x7

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 186
    add-int/lit8 v2, p3, 0x7

    long-to-int v3, v0

    aput v3, p2, v2

    .line 187
    ushr-long/2addr v0, v8

    .line 188
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

    .line 133
    const-wide/16 v0, 0x0

    .line 134
    .local v0, "c":J
    aget v2, p0, v9

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 135
    long-to-int v2, v0

    aput v2, p1, v9

    .line 136
    ushr-long/2addr v0, v8

    .line 137
    aget v2, p0, v10

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 138
    long-to-int v2, v0

    aput v2, p1, v10

    .line 139
    ushr-long/2addr v0, v8

    .line 140
    aget v2, p0, v11

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 141
    long-to-int v2, v0

    aput v2, p1, v11

    .line 142
    ushr-long/2addr v0, v8

    .line 143
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

    .line 144
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p1, v2

    .line 145
    ushr-long/2addr v0, v8

    .line 146
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

    .line 147
    const/4 v2, 0x4

    long-to-int v3, v0

    aput v3, p1, v2

    .line 148
    ushr-long/2addr v0, v8

    .line 149
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

    .line 150
    const/4 v2, 0x5

    long-to-int v3, v0

    aput v3, p1, v2

    .line 151
    ushr-long/2addr v0, v8

    .line 152
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

    .line 153
    const/4 v2, 0x6

    long-to-int v3, v0

    aput v3, p1, v2

    .line 154
    ushr-long/2addr v0, v8

    .line 155
    const/4 v2, 0x7

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x7

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 156
    const/4 v2, 0x7

    long-to-int v3, v0

    aput v3, p1, v2

    .line 157
    ushr-long/2addr v0, v8

    .line 158
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

    .line 193
    const-wide/16 v0, 0x0

    .line 194
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

    .line 195
    add-int/lit8 v2, p1, 0x0

    long-to-int v3, v0

    aput v3, p0, v2

    .line 196
    add-int/lit8 v2, p3, 0x0

    long-to-int v3, v0

    aput v3, p2, v2

    .line 197
    ushr-long/2addr v0, v8

    .line 198
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

    .line 199
    add-int/lit8 v2, p1, 0x1

    long-to-int v3, v0

    aput v3, p0, v2

    .line 200
    add-int/lit8 v2, p3, 0x1

    long-to-int v3, v0

    aput v3, p2, v2

    .line 201
    ushr-long/2addr v0, v8

    .line 202
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

    .line 203
    add-int/lit8 v2, p1, 0x2

    long-to-int v3, v0

    aput v3, p0, v2

    .line 204
    add-int/lit8 v2, p3, 0x2

    long-to-int v3, v0

    aput v3, p2, v2

    .line 205
    ushr-long/2addr v0, v8

    .line 206
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

    .line 207
    add-int/lit8 v2, p1, 0x3

    long-to-int v3, v0

    aput v3, p0, v2

    .line 208
    add-int/lit8 v2, p3, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 209
    ushr-long/2addr v0, v8

    .line 210
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

    .line 211
    add-int/lit8 v2, p1, 0x4

    long-to-int v3, v0

    aput v3, p0, v2

    .line 212
    add-int/lit8 v2, p3, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 213
    ushr-long/2addr v0, v8

    .line 214
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

    .line 215
    add-int/lit8 v2, p1, 0x5

    long-to-int v3, v0

    aput v3, p0, v2

    .line 216
    add-int/lit8 v2, p3, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 217
    ushr-long/2addr v0, v8

    .line 218
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

    .line 219
    add-int/lit8 v2, p1, 0x6

    long-to-int v3, v0

    aput v3, p0, v2

    .line 220
    add-int/lit8 v2, p3, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 221
    ushr-long/2addr v0, v8

    .line 222
    add-int/lit8 v2, p1, 0x7

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x7

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 223
    add-int/lit8 v2, p1, 0x7

    long-to-int v3, v0

    aput v3, p0, v2

    .line 224
    add-int/lit8 v2, p3, 0x7

    long-to-int v3, v0

    aput v3, p2, v2

    .line 225
    ushr-long/2addr v0, v8

    .line 226
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

    .line 231
    aget v0, p0, v1

    aput v0, p1, v1

    .line 232
    aget v0, p0, v2

    aput v0, p1, v2

    .line 233
    aget v0, p0, v3

    aput v0, p1, v3

    .line 234
    aget v0, p0, v4

    aput v0, p1, v4

    .line 235
    aget v0, p0, v5

    aput v0, p1, v5

    .line 236
    const/4 v0, 0x5

    const/4 v1, 0x5

    aget v1, p0, v1

    aput v1, p1, v0

    .line 237
    const/4 v0, 0x6

    const/4 v1, 0x6

    aget v1, p0, v1

    aput v1, p1, v0

    .line 238
    const/4 v0, 0x7

    const/4 v1, 0x7

    aget v1, p0, v1

    aput v1, p1, v0

    .line 239
    return-void
.end method

.method public static copy64([J[J)V
    .registers 8
    .param p0, "x"    # [J
    .param p1, "z"    # [J

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 243
    aget-wide v0, p0, v2

    aput-wide v0, p1, v2

    .line 244
    aget-wide v0, p0, v3

    aput-wide v0, p1, v3

    .line 245
    aget-wide v0, p0, v4

    aput-wide v0, p1, v4

    .line 246
    aget-wide v0, p0, v5

    aput-wide v0, p1, v5

    .line 247
    return-void
.end method

.method public static create()[I
    .registers 1

    .prologue
    .line 251
    const/16 v0, 0x8

    new-array v0, v0, [I

    return-object v0
.end method

.method public static create64()[J
    .registers 1

    .prologue
    .line 256
    const/4 v0, 0x4

    new-array v0, v0, [J

    return-object v0
.end method

.method public static createExt()[I
    .registers 1

    .prologue
    .line 261
    const/16 v0, 0x10

    new-array v0, v0, [I

    return-object v0
.end method

.method public static createExt64()[J
    .registers 1

    .prologue
    .line 266
    const/16 v0, 0x8

    new-array v0, v0, [J

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
    .line 271
    invoke-static {p0, p1, p2, p3}, Lorg/spongycastle/math/raw/Nat256;->gte([II[II)Z

    move-result v6

    .line 272
    .local v6, "pos":Z
    if-eqz v6, :cond_a

    .line 274
    invoke-static/range {p0 .. p5}, Lorg/spongycastle/math/raw/Nat256;->sub([II[II[II)I

    .line 280
    :goto_9
    return v6

    :cond_a
    move-object v0, p2

    move v1, p3

    move-object v2, p0

    move v3, p1

    move-object v4, p4

    move v5, p5

    .line 278
    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/raw/Nat256;->sub([II[II[II)I

    goto :goto_9
.end method

.method public static eq([I[I)Z
    .registers 5
    .param p0, "x"    # [I
    .param p1, "y"    # [I

    .prologue
    .line 285
    const/4 v0, 0x7

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_e

    .line 287
    aget v1, p0, v0

    aget v2, p1, v0

    if-eq v1, v2, :cond_b

    .line 289
    const/4 v1, 0x0

    .line 292
    :goto_a
    return v1

    .line 285
    :cond_b
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 292
    :cond_e
    const/4 v1, 0x1

    goto :goto_a
.end method

.method public static eq64([J[J)Z
    .registers 7
    .param p0, "x"    # [J
    .param p1, "y"    # [J

    .prologue
    .line 297
    const/4 v0, 0x3

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_10

    .line 299
    aget-wide v1, p0, v0

    aget-wide v3, p1, v0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_d

    .line 301
    const/4 v1, 0x0

    .line 304
    :goto_c
    return v1

    .line 297
    :cond_d
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 304
    :cond_10
    const/4 v1, 0x1

    goto :goto_c
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[I
    .registers 6
    .param p0, "x"    # Ljava/math/BigInteger;

    .prologue
    .line 309
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v3

    if-ltz v3, :cond_e

    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v3

    const/16 v4, 0x100

    if-le v3, v4, :cond_14

    .line 311
    :cond_e
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 314
    :cond_14
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->create()[I

    move-result-object v2

    .line 315
    .local v2, "z":[I
    const/4 v0, 0x0

    .line 316
    .local v0, "i":I
    :goto_19
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v3

    if-eqz v3, :cond_2f

    .line 318
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    move-result v3

    aput v3, v2, v0

    .line 319
    const/16 v3, 0x20

    invoke-virtual {p0, v3}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object p0

    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_19

    .line 321
    :cond_2f
    return-object v2
.end method

.method public static fromBigInteger64(Ljava/math/BigInteger;)[J
    .registers 6
    .param p0, "x"    # Ljava/math/BigInteger;

    .prologue
    .line 326
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v3

    if-ltz v3, :cond_e

    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v3

    const/16 v4, 0x100

    if-le v3, v4, :cond_14

    .line 328
    :cond_e
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 331
    :cond_14
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->create64()[J

    move-result-object v2

    .line 332
    .local v2, "z":[J
    const/4 v0, 0x0

    .line 333
    .local v0, "i":I
    :goto_19
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v3

    if-eqz v3, :cond_2f

    .line 335
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    invoke-virtual {p0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v3

    aput-wide v3, v2, v0

    .line 336
    const/16 v3, 0x40

    invoke-virtual {p0, v3}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object p0

    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_19

    .line 338
    :cond_2f
    return-object v2
.end method

.method public static getBit([II)I
    .registers 6
    .param p0, "x"    # [I
    .param p1, "bit"    # I

    .prologue
    const/4 v2, 0x0

    .line 343
    if-nez p1, :cond_8

    .line 345
    aget v2, p0, v2

    and-int/lit8 v2, v2, 0x1

    .line 353
    :cond_7
    :goto_7
    return v2

    .line 347
    :cond_8
    and-int/lit16 v3, p1, 0xff

    if-ne v3, p1, :cond_7

    .line 351
    ushr-int/lit8 v1, p1, 0x5

    .line 352
    .local v1, "w":I
    and-int/lit8 v0, p1, 0x1f

    .line 353
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

    .line 372
    const/4 v0, 0x7

    .local v0, "i":I
    :goto_4
    if-ltz v0, :cond_15

    .line 374
    add-int v4, p1, v0

    aget v4, p0, v4

    xor-int v1, v4, v5

    .line 375
    .local v1, "x_i":I
    add-int v4, p3, v0

    aget v4, p2, v4

    xor-int v2, v4, v5

    .line 376
    .local v2, "y_i":I
    if-ge v1, v2, :cond_16

    .line 377
    const/4 v3, 0x0

    .line 381
    .end local v1    # "x_i":I
    .end local v2    # "y_i":I
    :cond_15
    return v3

    .line 378
    .restart local v1    # "x_i":I
    .restart local v2    # "y_i":I
    :cond_16
    if-gt v1, v2, :cond_15

    .line 372
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

    .line 358
    const/4 v0, 0x7

    .local v0, "i":I
    :goto_4
    if-ltz v0, :cond_11

    .line 360
    aget v4, p0, v0

    xor-int v1, v4, v5

    .line 361
    .local v1, "x_i":I
    aget v4, p1, v0

    xor-int v2, v4, v5

    .line 362
    .local v2, "y_i":I
    if-ge v1, v2, :cond_12

    .line 363
    const/4 v3, 0x0

    .line 367
    .end local v1    # "x_i":I
    .end local v2    # "y_i":I
    :cond_11
    return v3

    .line 364
    .restart local v1    # "x_i":I
    .restart local v2    # "y_i":I
    :cond_12
    if-gt v1, v2, :cond_11

    .line 358
    add-int/lit8 v0, v0, -0x1

    goto :goto_4
.end method

.method public static isOne([I)Z
    .registers 5
    .param p0, "x"    # [I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 386
    aget v3, p0, v1

    if-eq v3, v2, :cond_7

    .line 397
    :cond_6
    :goto_6
    return v1

    .line 390
    :cond_7
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_8
    const/16 v3, 0x8

    if-ge v0, v3, :cond_13

    .line 392
    aget v3, p0, v0

    if-nez v3, :cond_6

    .line 390
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_13
    move v1, v2

    .line 397
    goto :goto_6
.end method

.method public static isOne64([J)Z
    .registers 7
    .param p0, "x"    # [J

    .prologue
    const/4 v1, 0x0

    .line 402
    aget-wide v2, p0, v1

    const-wide/16 v4, 0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_a

    .line 413
    :cond_9
    :goto_9
    return v1

    .line 406
    :cond_a
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_b
    const/4 v2, 0x4

    if-ge v0, v2, :cond_19

    .line 408
    aget-wide v2, p0, v0

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_9

    .line 406
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 413
    :cond_19
    const/4 v1, 0x1

    goto :goto_9
.end method

.method public static isZero([I)Z
    .registers 3
    .param p0, "x"    # [I

    .prologue
    .line 418
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v1, 0x8

    if-ge v0, v1, :cond_e

    .line 420
    aget v1, p0, v0

    if-eqz v1, :cond_b

    .line 422
    const/4 v1, 0x0

    .line 425
    :goto_a
    return v1

    .line 418
    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 425
    :cond_e
    const/4 v1, 0x1

    goto :goto_a
.end method

.method public static isZero64([J)Z
    .registers 6
    .param p0, "x"    # [J

    .prologue
    .line 430
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/4 v1, 0x4

    if-ge v0, v1, :cond_11

    .line 432
    aget-wide v1, p0, v0

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_e

    .line 434
    const/4 v1, 0x0

    .line 437
    :goto_d
    return v1

    .line 430
    :cond_e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 437
    :cond_11
    const/4 v1, 0x1

    goto :goto_d
.end method

.method public static mul([II[II[II)V
    .registers 37
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "y"    # [I
    .param p3, "yOff"    # I
    .param p4, "zz"    # [I
    .param p5, "zzOff"    # I

    .prologue
    .line 513
    add-int/lit8 v25, p3, 0x0

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v9, v25, v27

    .line 514
    .local v9, "y_0":J
    add-int/lit8 v25, p3, 0x1

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v11, v25, v27

    .line 515
    .local v11, "y_1":J
    add-int/lit8 v25, p3, 0x2

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v13, v25, v27

    .line 516
    .local v13, "y_2":J
    add-int/lit8 v25, p3, 0x3

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v15, v25, v27

    .line 517
    .local v15, "y_3":J
    add-int/lit8 v25, p3, 0x4

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v17, v25, v27

    .line 518
    .local v17, "y_4":J
    add-int/lit8 v25, p3, 0x5

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v19, v25, v27

    .line 519
    .local v19, "y_5":J
    add-int/lit8 v25, p3, 0x6

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v21, v25, v27

    .line 520
    .local v21, "y_6":J
    add-int/lit8 v25, p3, 0x7

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v23, v25, v27

    .line 523
    .local v23, "y_7":J
    const-wide/16 v2, 0x0

    .local v2, "c":J
    add-int/lit8 v25, p1, 0x0

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v5, v25, v27

    .line 524
    .local v5, "x_0":J
    mul-long v25, v5, v9

    add-long v2, v2, v25

    .line 525
    add-int/lit8 v25, p5, 0x0

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 526
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 527
    mul-long v25, v5, v11

    add-long v2, v2, v25

    .line 528
    add-int/lit8 v25, p5, 0x1

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 529
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 530
    mul-long v25, v5, v13

    add-long v2, v2, v25

    .line 531
    add-int/lit8 v25, p5, 0x2

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 532
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 533
    mul-long v25, v5, v15

    add-long v2, v2, v25

    .line 534
    add-int/lit8 v25, p5, 0x3

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 535
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 536
    mul-long v25, v5, v17

    add-long v2, v2, v25

    .line 537
    add-int/lit8 v25, p5, 0x4

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 538
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 539
    mul-long v25, v5, v19

    add-long v2, v2, v25

    .line 540
    add-int/lit8 v25, p5, 0x5

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 541
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 542
    mul-long v25, v5, v21

    add-long v2, v2, v25

    .line 543
    add-int/lit8 v25, p5, 0x6

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 544
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 545
    mul-long v25, v5, v23

    add-long v2, v2, v25

    .line 546
    add-int/lit8 v25, p5, 0x7

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 547
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 548
    add-int/lit8 v25, p5, 0x8

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 551
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_112
    const/16 v25, 0x8

    move/from16 v0, v25

    if-ge v4, v0, :cond_23f

    .line 553
    add-int/lit8 p5, p5, 0x1

    .line 554
    const-wide/16 v2, 0x0

    add-int v25, p1, v4

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v7, v25, v27

    .line 555
    .local v7, "x_i":J
    mul-long v25, v7, v9

    add-int/lit8 v27, p5, 0x0

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 556
    add-int/lit8 v25, p5, 0x0

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 557
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 558
    mul-long v25, v7, v11

    add-int/lit8 v27, p5, 0x1

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 559
    add-int/lit8 v25, p5, 0x1

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 560
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 561
    mul-long v25, v7, v13

    add-int/lit8 v27, p5, 0x2

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 562
    add-int/lit8 v25, p5, 0x2

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 563
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 564
    mul-long v25, v7, v15

    add-int/lit8 v27, p5, 0x3

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 565
    add-int/lit8 v25, p5, 0x3

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 566
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 567
    mul-long v25, v7, v17

    add-int/lit8 v27, p5, 0x4

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 568
    add-int/lit8 v25, p5, 0x4

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 569
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 570
    mul-long v25, v7, v19

    add-int/lit8 v27, p5, 0x5

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 571
    add-int/lit8 v25, p5, 0x5

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 572
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 573
    mul-long v25, v7, v21

    add-int/lit8 v27, p5, 0x6

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 574
    add-int/lit8 v25, p5, 0x6

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 575
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 576
    mul-long v25, v7, v23

    add-int/lit8 v27, p5, 0x7

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 577
    add-int/lit8 v25, p5, 0x7

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 578
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 579
    add-int/lit8 v25, p5, 0x8

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 551
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_112

    .line 581
    .end local v7    # "x_i":J
    :cond_23f
    return-void
.end method

.method public static mul([I[I[I)V
    .registers 34
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "zz"    # [I

    .prologue
    .line 442
    const/16 v25, 0x0

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v9, v25, v27

    .line 443
    .local v9, "y_0":J
    const/16 v25, 0x1

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v11, v25, v27

    .line 444
    .local v11, "y_1":J
    const/16 v25, 0x2

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v13, v25, v27

    .line 445
    .local v13, "y_2":J
    const/16 v25, 0x3

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v15, v25, v27

    .line 446
    .local v15, "y_3":J
    const/16 v25, 0x4

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v17, v25, v27

    .line 447
    .local v17, "y_4":J
    const/16 v25, 0x5

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v19, v25, v27

    .line 448
    .local v19, "y_5":J
    const/16 v25, 0x6

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v21, v25, v27

    .line 449
    .local v21, "y_6":J
    const/16 v25, 0x7

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v23, v25, v27

    .line 452
    .local v23, "y_7":J
    const-wide/16 v2, 0x0

    .local v2, "c":J
    const/16 v25, 0x0

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v5, v25, v27

    .line 453
    .local v5, "x_0":J
    mul-long v25, v5, v9

    add-long v2, v2, v25

    .line 454
    const/16 v25, 0x0

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 455
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 456
    mul-long v25, v5, v11

    add-long v2, v2, v25

    .line 457
    const/16 v25, 0x1

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 458
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 459
    mul-long v25, v5, v13

    add-long v2, v2, v25

    .line 460
    const/16 v25, 0x2

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 461
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 462
    mul-long v25, v5, v15

    add-long v2, v2, v25

    .line 463
    const/16 v25, 0x3

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 464
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 465
    mul-long v25, v5, v17

    add-long v2, v2, v25

    .line 466
    const/16 v25, 0x4

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 467
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 468
    mul-long v25, v5, v19

    add-long v2, v2, v25

    .line 469
    const/16 v25, 0x5

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 470
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 471
    mul-long v25, v5, v21

    add-long v2, v2, v25

    .line 472
    const/16 v25, 0x6

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 473
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 474
    mul-long v25, v5, v23

    add-long v2, v2, v25

    .line 475
    const/16 v25, 0x7

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 476
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 477
    const/16 v25, 0x8

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 480
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_112
    const/16 v25, 0x8

    move/from16 v0, v25

    if-ge v4, v0, :cond_23b

    .line 482
    const-wide/16 v2, 0x0

    aget v25, p0, v4

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v7, v25, v27

    .line 483
    .local v7, "x_i":J
    mul-long v25, v7, v9

    add-int/lit8 v27, v4, 0x0

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 484
    add-int/lit8 v25, v4, 0x0

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 485
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 486
    mul-long v25, v7, v11

    add-int/lit8 v27, v4, 0x1

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 487
    add-int/lit8 v25, v4, 0x1

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 488
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 489
    mul-long v25, v7, v13

    add-int/lit8 v27, v4, 0x2

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 490
    add-int/lit8 v25, v4, 0x2

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 491
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 492
    mul-long v25, v7, v15

    add-int/lit8 v27, v4, 0x3

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 493
    add-int/lit8 v25, v4, 0x3

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 494
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 495
    mul-long v25, v7, v17

    add-int/lit8 v27, v4, 0x4

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 496
    add-int/lit8 v25, v4, 0x4

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 497
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 498
    mul-long v25, v7, v19

    add-int/lit8 v27, v4, 0x5

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 499
    add-int/lit8 v25, v4, 0x5

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 500
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 501
    mul-long v25, v7, v21

    add-int/lit8 v27, v4, 0x6

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 502
    add-int/lit8 v25, v4, 0x6

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 503
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 504
    mul-long v25, v7, v23

    add-int/lit8 v27, v4, 0x7

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 505
    add-int/lit8 v25, v4, 0x7

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 506
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 507
    add-int/lit8 v25, v4, 0x8

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 480
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_112

    .line 509
    .end local v7    # "x_i":J
    :cond_23b
    return-void
.end method

.method public static mul33Add(I[II[II[II)J
    .registers 35
    .param p0, "w"    # I
    .param p1, "x"    # [I
    .param p2, "xOff"    # I
    .param p3, "y"    # [I
    .param p4, "yOff"    # I
    .param p5, "z"    # [I
    .param p6, "zOff"    # I

    .prologue
    .line 680
    const-wide/16 v2, 0x0

    .local v2, "c":J
    move/from16 v0, p0

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v4, v22, v24

    .line 681
    .local v4, "wVal":J
    add-int/lit8 v22, p2, 0x0

    aget v22, p1, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v6, v22, v24

    .line 682
    .local v6, "x0":J
    mul-long v22, v4, v6

    add-int/lit8 v24, p4, 0x0

    aget v24, p3, v24

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    const-wide v26, 0xffffffffL

    and-long v24, v24, v26

    add-long v22, v22, v24

    add-long v2, v2, v22

    .line 683
    add-int/lit8 v22, p6, 0x0

    long-to-int v0, v2

    move/from16 v23, v0

    aput v23, p5, v22

    .line 684
    const/16 v22, 0x20

    ushr-long v2, v2, v22

    .line 685
    add-int/lit8 v22, p2, 0x1

    aget v22, p1, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v8, v22, v24

    .line 686
    .local v8, "x1":J
    mul-long v22, v4, v8

    add-long v22, v22, v6

    add-int/lit8 v24, p4, 0x1

    aget v24, p3, v24

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    const-wide v26, 0xffffffffL

    and-long v24, v24, v26

    add-long v22, v22, v24

    add-long v2, v2, v22

    .line 687
    add-int/lit8 v22, p6, 0x1

    long-to-int v0, v2

    move/from16 v23, v0

    aput v23, p5, v22

    .line 688
    const/16 v22, 0x20

    ushr-long v2, v2, v22

    .line 689
    add-int/lit8 v22, p2, 0x2

    aget v22, p1, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v10, v22, v24

    .line 690
    .local v10, "x2":J
    mul-long v22, v4, v10

    add-long v22, v22, v8

    add-int/lit8 v24, p4, 0x2

    aget v24, p3, v24

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    const-wide v26, 0xffffffffL

    and-long v24, v24, v26

    add-long v22, v22, v24

    add-long v2, v2, v22

    .line 691
    add-int/lit8 v22, p6, 0x2

    long-to-int v0, v2

    move/from16 v23, v0

    aput v23, p5, v22

    .line 692
    const/16 v22, 0x20

    ushr-long v2, v2, v22

    .line 693
    add-int/lit8 v22, p2, 0x3

    aget v22, p1, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v12, v22, v24

    .line 694
    .local v12, "x3":J
    mul-long v22, v4, v12

    add-long v22, v22, v10

    add-int/lit8 v24, p4, 0x3

    aget v24, p3, v24

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    const-wide v26, 0xffffffffL

    and-long v24, v24, v26

    add-long v22, v22, v24

    add-long v2, v2, v22

    .line 695
    add-int/lit8 v22, p6, 0x3

    long-to-int v0, v2

    move/from16 v23, v0

    aput v23, p5, v22

    .line 696
    const/16 v22, 0x20

    ushr-long v2, v2, v22

    .line 697
    add-int/lit8 v22, p2, 0x4

    aget v22, p1, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v14, v22, v24

    .line 698
    .local v14, "x4":J
    mul-long v22, v4, v14

    add-long v22, v22, v12

    add-int/lit8 v24, p4, 0x4

    aget v24, p3, v24

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    const-wide v26, 0xffffffffL

    and-long v24, v24, v26

    add-long v22, v22, v24

    add-long v2, v2, v22

    .line 699
    add-int/lit8 v22, p6, 0x4

    long-to-int v0, v2

    move/from16 v23, v0

    aput v23, p5, v22

    .line 700
    const/16 v22, 0x20

    ushr-long v2, v2, v22

    .line 701
    add-int/lit8 v22, p2, 0x5

    aget v22, p1, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v16, v22, v24

    .line 702
    .local v16, "x5":J
    mul-long v22, v4, v16

    add-long v22, v22, v14

    add-int/lit8 v24, p4, 0x5

    aget v24, p3, v24

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    const-wide v26, 0xffffffffL

    and-long v24, v24, v26

    add-long v22, v22, v24

    add-long v2, v2, v22

    .line 703
    add-int/lit8 v22, p6, 0x5

    long-to-int v0, v2

    move/from16 v23, v0

    aput v23, p5, v22

    .line 704
    const/16 v22, 0x20

    ushr-long v2, v2, v22

    .line 705
    add-int/lit8 v22, p2, 0x6

    aget v22, p1, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v18, v22, v24

    .line 706
    .local v18, "x6":J
    mul-long v22, v4, v18

    add-long v22, v22, v16

    add-int/lit8 v24, p4, 0x6

    aget v24, p3, v24

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    const-wide v26, 0xffffffffL

    and-long v24, v24, v26

    add-long v22, v22, v24

    add-long v2, v2, v22

    .line 707
    add-int/lit8 v22, p6, 0x6

    long-to-int v0, v2

    move/from16 v23, v0

    aput v23, p5, v22

    .line 708
    const/16 v22, 0x20

    ushr-long v2, v2, v22

    .line 709
    add-int/lit8 v22, p2, 0x7

    aget v22, p1, v22

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0xffffffffL

    and-long v20, v22, v24

    .line 710
    .local v20, "x7":J
    mul-long v22, v4, v20

    add-long v22, v22, v18

    add-int/lit8 v24, p4, 0x7

    aget v24, p3, v24

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    const-wide v26, 0xffffffffL

    and-long v24, v24, v26

    add-long v22, v22, v24

    add-long v2, v2, v22

    .line 711
    add-int/lit8 v22, p6, 0x7

    long-to-int v0, v2

    move/from16 v23, v0

    aput v23, p5, v22

    .line 712
    const/16 v22, 0x20

    ushr-long v2, v2, v22

    .line 713
    add-long v2, v2, v20

    .line 714
    return-wide v2
.end method

.method public static mul33DWordAdd(IJ[II)I
    .registers 21
    .param p0, "x"    # I
    .param p1, "y"    # J
    .param p3, "z"    # [I
    .param p4, "zOff"    # I

    .prologue
    .line 812
    const-wide/16 v2, 0x0

    .local v2, "c":J
    move/from16 v0, p0

    int-to-long v10, v0

    const-wide v12, 0xffffffffL

    and-long v4, v10, v12

    .line 813
    .local v4, "xVal":J
    const-wide v10, 0xffffffffL

    and-long v6, p1, v10

    .line 814
    .local v6, "y00":J
    mul-long v10, v4, v6

    add-int/lit8 v12, p4, 0x0

    aget v12, p3, v12

    int-to-long v12, v12

    const-wide v14, 0xffffffffL

    and-long/2addr v12, v14

    add-long/2addr v10, v12

    add-long/2addr v2, v10

    .line 815
    add-int/lit8 v10, p4, 0x0

    long-to-int v11, v2

    aput v11, p3, v10

    .line 816
    const/16 v10, 0x20

    ushr-long/2addr v2, v10

    .line 817
    const/16 v10, 0x20

    ushr-long v8, p1, v10

    .line 818
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

    .line 819
    add-int/lit8 v10, p4, 0x1

    long-to-int v11, v2

    aput v11, p3, v10

    .line 820
    const/16 v10, 0x20

    ushr-long/2addr v2, v10

    .line 821
    add-int/lit8 v10, p4, 0x2

    aget v10, p3, v10

    int-to-long v10, v10

    const-wide v12, 0xffffffffL

    and-long/2addr v10, v12

    add-long/2addr v10, v8

    add-long/2addr v2, v10

    .line 822
    add-int/lit8 v10, p4, 0x2

    long-to-int v11, v2

    aput v11, p3, v10

    .line 823
    const/16 v10, 0x20

    ushr-long/2addr v2, v10

    .line 824
    add-int/lit8 v10, p4, 0x3

    aget v10, p3, v10

    int-to-long v10, v10

    const-wide v12, 0xffffffffL

    and-long/2addr v10, v12

    add-long/2addr v2, v10

    .line 825
    add-int/lit8 v10, p4, 0x3

    long-to-int v11, v2

    aput v11, p3, v10

    .line 826
    const/16 v10, 0x20

    ushr-long/2addr v2, v10

    .line 827
    const-wide/16 v10, 0x0

    cmp-long v10, v2, v10

    if-nez v10, :cond_77

    const/4 v10, 0x0

    :goto_76
    return v10

    :cond_77
    const/16 v10, 0x8

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
    .line 835
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v6, p0

    const-wide v8, 0xffffffffL

    and-long v2, v6, v8

    .local v2, "xVal":J
    int-to-long v6, p1

    const-wide v8, 0xffffffffL

    and-long v4, v6, v8

    .line 836
    .local v4, "yVal":J
    mul-long v6, v4, v2

    add-int/lit8 v8, p3, 0x0

    aget v8, p2, v8

    int-to-long v8, v8

    const-wide v10, 0xffffffffL

    and-long/2addr v8, v10

    add-long/2addr v6, v8

    add-long/2addr v0, v6

    .line 837
    add-int/lit8 v6, p3, 0x0

    long-to-int v7, v0

    aput v7, p2, v6

    .line 838
    const/16 v6, 0x20

    ushr-long/2addr v0, v6

    .line 839
    add-int/lit8 v6, p3, 0x1

    aget v6, p2, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v6, v4

    add-long/2addr v0, v6

    .line 840
    add-int/lit8 v6, p3, 0x1

    long-to-int v7, v0

    aput v7, p2, v6

    .line 841
    const/16 v6, 0x20

    ushr-long/2addr v0, v6

    .line 842
    add-int/lit8 v6, p3, 0x2

    aget v6, p2, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v0, v6

    .line 843
    add-int/lit8 v6, p3, 0x2

    long-to-int v7, v0

    aput v7, p2, v6

    .line 844
    const/16 v6, 0x20

    ushr-long/2addr v0, v6

    .line 845
    const-wide/16 v6, 0x0

    cmp-long v6, v0, v6

    if-nez v6, :cond_5a

    const/4 v6, 0x0

    :goto_59
    return v6

    :cond_5a
    const/16 v6, 0x8

    const/4 v7, 0x3

    invoke-static {v6, p2, p3, v7}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    move-result v6

    goto :goto_59
.end method

.method public static mulAddTo([II[II[II)I
    .registers 37
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "y"    # [I
    .param p3, "yOff"    # I
    .param p4, "zz"    # [I
    .param p5, "zzOff"    # I

    .prologue
    .line 631
    add-int/lit8 v25, p3, 0x0

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v7, v25, v27

    .line 632
    .local v7, "y_0":J
    add-int/lit8 v25, p3, 0x1

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v9, v25, v27

    .line 633
    .local v9, "y_1":J
    add-int/lit8 v25, p3, 0x2

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v11, v25, v27

    .line 634
    .local v11, "y_2":J
    add-int/lit8 v25, p3, 0x3

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v13, v25, v27

    .line 635
    .local v13, "y_3":J
    add-int/lit8 v25, p3, 0x4

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v15, v25, v27

    .line 636
    .local v15, "y_4":J
    add-int/lit8 v25, p3, 0x5

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v17, v25, v27

    .line 637
    .local v17, "y_5":J
    add-int/lit8 v25, p3, 0x6

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v19, v25, v27

    .line 638
    .local v19, "y_6":J
    add-int/lit8 v25, p3, 0x7

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v21, v25, v27

    .line 640
    .local v21, "y_7":J
    const-wide/16 v23, 0x0

    .line 641
    .local v23, "zc":J
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_83
    const/16 v25, 0x8

    move/from16 v0, v25

    if-ge v4, v0, :cond_1c8

    .line 643
    const-wide/16 v2, 0x0

    .local v2, "c":J
    add-int v25, p1, v4

    aget v25, p0, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v5, v25, v27

    .line 644
    .local v5, "x_i":J
    mul-long v25, v5, v7

    add-int/lit8 v27, p5, 0x0

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 645
    add-int/lit8 v25, p5, 0x0

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 646
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 647
    mul-long v25, v5, v9

    add-int/lit8 v27, p5, 0x1

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 648
    add-int/lit8 v25, p5, 0x1

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 649
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 650
    mul-long v25, v5, v11

    add-int/lit8 v27, p5, 0x2

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 651
    add-int/lit8 v25, p5, 0x2

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 652
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 653
    mul-long v25, v5, v13

    add-int/lit8 v27, p5, 0x3

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 654
    add-int/lit8 v25, p5, 0x3

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 655
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 656
    mul-long v25, v5, v15

    add-int/lit8 v27, p5, 0x4

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 657
    add-int/lit8 v25, p5, 0x4

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 658
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 659
    mul-long v25, v5, v17

    add-int/lit8 v27, p5, 0x5

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 660
    add-int/lit8 v25, p5, 0x5

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 661
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 662
    mul-long v25, v5, v19

    add-int/lit8 v27, p5, 0x6

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 663
    add-int/lit8 v25, p5, 0x6

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 664
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 665
    mul-long v25, v5, v21

    add-int/lit8 v27, p5, 0x7

    aget v27, p4, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 666
    add-int/lit8 v25, p5, 0x7

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 667
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 668
    add-int/lit8 v25, p5, 0x8

    aget v25, p4, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v25, v25, v23

    add-long v2, v2, v25

    .line 669
    add-int/lit8 v25, p5, 0x8

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p4, v25

    .line 670
    const/16 v25, 0x20

    ushr-long v23, v2, v25

    .line 671
    add-int/lit8 p5, p5, 0x1

    .line 641
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_83

    .line 673
    .end local v2    # "c":J
    .end local v5    # "x_i":J
    :cond_1c8
    move-wide/from16 v0, v23

    long-to-int v0, v0

    move/from16 v25, v0

    return v25
.end method

.method public static mulAddTo([I[I[I)I
    .registers 34
    .param p0, "x"    # [I
    .param p1, "y"    # [I
    .param p2, "zz"    # [I

    .prologue
    .line 585
    const/16 v25, 0x0

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v7, v25, v27

    .line 586
    .local v7, "y_0":J
    const/16 v25, 0x1

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v9, v25, v27

    .line 587
    .local v9, "y_1":J
    const/16 v25, 0x2

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v11, v25, v27

    .line 588
    .local v11, "y_2":J
    const/16 v25, 0x3

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v13, v25, v27

    .line 589
    .local v13, "y_3":J
    const/16 v25, 0x4

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v15, v25, v27

    .line 590
    .local v15, "y_4":J
    const/16 v25, 0x5

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v17, v25, v27

    .line 591
    .local v17, "y_5":J
    const/16 v25, 0x6

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v19, v25, v27

    .line 592
    .local v19, "y_6":J
    const/16 v25, 0x7

    aget v25, p1, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v21, v25, v27

    .line 594
    .local v21, "y_7":J
    const-wide/16 v23, 0x0

    .line 595
    .local v23, "zc":J
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_83
    const/16 v25, 0x8

    move/from16 v0, v25

    if-ge v4, v0, :cond_1c4

    .line 597
    const-wide/16 v2, 0x0

    .local v2, "c":J
    aget v25, p0, v4

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v5, v25, v27

    .line 598
    .local v5, "x_i":J
    mul-long v25, v5, v7

    add-int/lit8 v27, v4, 0x0

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 599
    add-int/lit8 v25, v4, 0x0

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 600
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 601
    mul-long v25, v5, v9

    add-int/lit8 v27, v4, 0x1

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 602
    add-int/lit8 v25, v4, 0x1

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 603
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 604
    mul-long v25, v5, v11

    add-int/lit8 v27, v4, 0x2

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 605
    add-int/lit8 v25, v4, 0x2

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 606
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 607
    mul-long v25, v5, v13

    add-int/lit8 v27, v4, 0x3

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 608
    add-int/lit8 v25, v4, 0x3

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 609
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 610
    mul-long v25, v5, v15

    add-int/lit8 v27, v4, 0x4

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 611
    add-int/lit8 v25, v4, 0x4

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 612
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 613
    mul-long v25, v5, v17

    add-int/lit8 v27, v4, 0x5

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 614
    add-int/lit8 v25, v4, 0x5

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 615
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 616
    mul-long v25, v5, v19

    add-int/lit8 v27, v4, 0x6

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 617
    add-int/lit8 v25, v4, 0x6

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 618
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 619
    mul-long v25, v5, v21

    add-int/lit8 v27, v4, 0x7

    aget v27, p2, v27

    move/from16 v0, v27

    int-to-long v0, v0

    move-wide/from16 v27, v0

    const-wide v29, 0xffffffffL

    and-long v27, v27, v29

    add-long v25, v25, v27

    add-long v2, v2, v25

    .line 620
    add-int/lit8 v25, v4, 0x7

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 621
    const/16 v25, 0x20

    ushr-long v2, v2, v25

    .line 622
    add-int/lit8 v25, v4, 0x8

    aget v25, p2, v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    const-wide v27, 0xffffffffL

    and-long v25, v25, v27

    add-long v25, v25, v23

    add-long v2, v2, v25

    .line 623
    add-int/lit8 v25, v4, 0x8

    long-to-int v0, v2

    move/from16 v26, v0

    aput v26, p2, v25

    .line 624
    const/16 v25, 0x20

    ushr-long v23, v2, v25

    .line 595
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_83

    .line 626
    .end local v2    # "c":J
    .end local v5    # "x_i":J
    :cond_1c4
    move-wide/from16 v0, v23

    long-to-int v0, v0

    move/from16 v25, v0

    return v25
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

    .line 719
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v4, p0

    and-long v2, v4, v6

    .line 720
    .local v2, "xVal":J
    aget v4, p1, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 721
    long-to-int v4, v0

    aput v4, p1, v9

    .line 722
    ushr-long/2addr v0, v8

    .line 723
    aget v4, p1, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 724
    long-to-int v4, v0

    aput v4, p1, v10

    .line 725
    ushr-long/2addr v0, v8

    .line 726
    aget v4, p1, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 727
    long-to-int v4, v0

    aput v4, p1, v11

    .line 728
    ushr-long/2addr v0, v8

    .line 729
    const/4 v4, 0x3

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 730
    const/4 v4, 0x3

    long-to-int v5, v0

    aput v5, p1, v4

    .line 731
    ushr-long/2addr v0, v8

    .line 732
    const/4 v4, 0x4

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 733
    const/4 v4, 0x4

    long-to-int v5, v0

    aput v5, p1, v4

    .line 734
    ushr-long/2addr v0, v8

    .line 735
    const/4 v4, 0x5

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 736
    const/4 v4, 0x5

    long-to-int v5, v0

    aput v5, p1, v4

    .line 737
    ushr-long/2addr v0, v8

    .line 738
    const/4 v4, 0x6

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 739
    const/4 v4, 0x6

    long-to-int v5, v0

    aput v5, p1, v4

    .line 740
    ushr-long/2addr v0, v8

    .line 741
    const/4 v4, 0x7

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    add-long/2addr v0, v4

    .line 742
    const/4 v4, 0x7

    long-to-int v5, v0

    aput v5, p1, v4

    .line 743
    ushr-long/2addr v0, v8

    .line 744
    long-to-int v4, v0

    return v4
.end method

.method public static mulByWordAddTo(I[I[I)I
    .registers 13
    .param p0, "x"    # I
    .param p1, "y"    # [I
    .param p2, "z"    # [I

    .prologue
    .line 749
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v4, p0

    const-wide v6, 0xffffffffL

    and-long v2, v4, v6

    .line 750
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

    .line 751
    const/4 v4, 0x0

    long-to-int v5, v0

    aput v5, p2, v4

    .line 752
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 753
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

    .line 754
    const/4 v4, 0x1

    long-to-int v5, v0

    aput v5, p2, v4

    .line 755
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 756
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

    .line 757
    const/4 v4, 0x2

    long-to-int v5, v0

    aput v5, p2, v4

    .line 758
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 759
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

    .line 760
    const/4 v4, 0x3

    long-to-int v5, v0

    aput v5, p2, v4

    .line 761
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 762
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

    .line 763
    const/4 v4, 0x4

    long-to-int v5, v0

    aput v5, p2, v4

    .line 764
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 765
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

    .line 766
    const/4 v4, 0x5

    long-to-int v5, v0

    aput v5, p2, v4

    .line 767
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 768
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

    .line 769
    const/4 v4, 0x6

    long-to-int v5, v0

    aput v5, p2, v4

    .line 770
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 771
    const/4 v4, 0x7

    aget v4, p2, v4

    int-to-long v4, v4

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    mul-long/2addr v4, v2

    const/4 v6, 0x7

    aget v6, p1, v6

    int-to-long v6, v6

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 772
    const/4 v4, 0x7

    long-to-int v5, v0

    aput v5, p2, v4

    .line 773
    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    .line 774
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

    .line 866
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v5, p0

    and-long v3, v5, v7

    .line 867
    .local v3, "xVal":J
    const/4 v2, 0x0

    .line 870
    .local v2, "i":I
    :cond_b
    aget v5, p1, v2

    int-to-long v5, v5

    and-long/2addr v5, v7

    mul-long/2addr v5, v3

    add-long/2addr v0, v5

    .line 871
    add-int v5, p3, v2

    long-to-int v6, v0

    aput v6, p2, v5

    .line 872
    const/16 v5, 0x20

    ushr-long/2addr v0, v5

    .line 874
    add-int/lit8 v2, v2, 0x1

    const/16 v5, 0x8

    if-lt v2, v5, :cond_b

    .line 875
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

    .line 779
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v4, p0

    and-long v2, v4, v8

    .line 780
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

    .line 781
    add-int/lit8 v4, p4, 0x0

    long-to-int v5, v0

    aput v5, p3, v4

    .line 782
    ushr-long/2addr v0, v10

    .line 783
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

    .line 784
    add-int/lit8 v4, p4, 0x1

    long-to-int v5, v0

    aput v5, p3, v4

    .line 785
    ushr-long/2addr v0, v10

    .line 786
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

    .line 787
    add-int/lit8 v4, p4, 0x2

    long-to-int v5, v0

    aput v5, p3, v4

    .line 788
    ushr-long/2addr v0, v10

    .line 789
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

    .line 790
    add-int/lit8 v4, p4, 0x3

    long-to-int v5, v0

    aput v5, p3, v4

    .line 791
    ushr-long/2addr v0, v10

    .line 792
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

    .line 793
    add-int/lit8 v4, p4, 0x4

    long-to-int v5, v0

    aput v5, p3, v4

    .line 794
    ushr-long/2addr v0, v10

    .line 795
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

    .line 796
    add-int/lit8 v4, p4, 0x5

    long-to-int v5, v0

    aput v5, p3, v4

    .line 797
    ushr-long/2addr v0, v10

    .line 798
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

    .line 799
    add-int/lit8 v4, p4, 0x6

    long-to-int v5, v0

    aput v5, p3, v4

    .line 800
    ushr-long/2addr v0, v10

    .line 801
    add-int/lit8 v4, p2, 0x7

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v8

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x7

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 802
    add-int/lit8 v4, p4, 0x7

    long-to-int v5, v0

    aput v5, p3, v4

    .line 803
    ushr-long/2addr v0, v10

    .line 804
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

    .line 851
    const-wide/16 v0, 0x0

    .local v0, "c":J
    int-to-long v4, p0

    and-long v2, v4, v8

    .line 852
    .local v2, "xVal":J
    and-long v4, p1, v8

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x0

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 853
    add-int/lit8 v4, p4, 0x0

    long-to-int v5, v0

    aput v5, p3, v4

    .line 854
    ushr-long/2addr v0, v10

    .line 855
    ushr-long v4, p1, v10

    mul-long/2addr v4, v2

    add-int/lit8 v6, p4, 0x1

    aget v6, p3, v6

    int-to-long v6, v6

    and-long/2addr v6, v8

    add-long/2addr v4, v6

    add-long/2addr v0, v4

    .line 856
    add-int/lit8 v4, p4, 0x1

    long-to-int v5, v0

    aput v5, p3, v4

    .line 857
    ushr-long/2addr v0, v10

    .line 858
    add-int/lit8 v4, p4, 0x2

    aget v4, p3, v4

    int-to-long v4, v4

    and-long/2addr v4, v8

    add-long/2addr v0, v4

    .line 859
    add-int/lit8 v4, p4, 0x2

    long-to-int v5, v0

    aput v5, p3, v4

    .line 860
    ushr-long/2addr v0, v10

    .line 861
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-nez v4, :cond_43

    const/4 v4, 0x0

    :goto_42
    return v4

    :cond_43
    const/16 v4, 0x8

    const/4 v5, 0x3

    invoke-static {v4, p3, p4, v5}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    move-result v4

    goto :goto_42
.end method

.method public static square([II[II)V
    .registers 63
    .param p0, "x"    # [I
    .param p1, "xOff"    # I
    .param p2, "zz"    # [I
    .param p3, "zzOff"    # I

    .prologue
    .line 1044
    add-int/lit8 v55, p1, 0x0

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v11, v55, v57

    .line 1047
    .local v11, "x_0":J
    const/4 v2, 0x0

    .line 1049
    .local v2, "c":I
    const/4 v3, 0x7

    .local v3, "i":I
    const/16 v5, 0x10

    .line 1052
    .local v5, "j":I
    :goto_14
    add-int/lit8 v4, v3, -0x1

    .end local v3    # "i":I
    .local v4, "i":I
    add-int v55, p1, v3

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v9, v55, v57

    .line 1053
    .local v9, "xVal":J
    mul-long v6, v9, v9

    .line 1054
    .local v6, "p":J
    add-int/lit8 v5, v5, -0x1

    add-int v55, p3, v5

    shl-int/lit8 v56, v2, 0x1f

    const/16 v57, 0x21

    ushr-long v57, v6, v57

    move-wide/from16 v0, v57

    long-to-int v0, v0

    move/from16 v57, v0

    or-int v56, v56, v57

    aput v56, p2, v55

    .line 1055
    add-int/lit8 v5, v5, -0x1

    add-int v55, p3, v5

    const/16 v56, 0x1

    ushr-long v56, v6, v56

    move-wide/from16 v0, v56

    long-to-int v0, v0

    move/from16 v56, v0

    aput v56, p2, v55

    .line 1056
    long-to-int v2, v6

    .line 1058
    if-gtz v4, :cond_404

    .line 1061
    mul-long v6, v11, v11

    .line 1062
    shl-int/lit8 v55, v2, 0x1f

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v55, v55, v57

    const/16 v57, 0x21

    ushr-long v57, v6, v57

    or-long v27, v55, v57

    .line 1063
    .local v27, "zz_1":J
    add-int/lit8 v55, p3, 0x0

    long-to-int v0, v6

    move/from16 v56, v0

    aput v56, p2, v55

    .line 1064
    const/16 v55, 0x20

    ushr-long v55, v6, v55

    move-wide/from16 v0, v55

    long-to-int v0, v0

    move/from16 v55, v0

    and-int/lit8 v2, v55, 0x1

    .line 1068
    add-int/lit8 v55, p1, 0x1

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v13, v55, v57

    .line 1069
    .local v13, "x_1":J
    add-int/lit8 v55, p3, 0x2

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v39, v55, v57

    .line 1072
    .local v39, "zz_2":J
    mul-long v55, v13, v11

    add-long v27, v27, v55

    .line 1073
    move-wide/from16 v0, v27

    long-to-int v8, v0

    .line 1074
    .local v8, "w":I
    add-int/lit8 v55, p3, 0x1

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1075
    ushr-int/lit8 v2, v8, 0x1f

    .line 1076
    const/16 v55, 0x20

    ushr-long v55, v27, v55

    add-long v39, v39, v55

    .line 1079
    add-int/lit8 v55, p1, 0x2

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v15, v55, v57

    .line 1080
    .local v15, "x_2":J
    add-int/lit8 v55, p3, 0x3

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v41, v55, v57

    .line 1081
    .local v41, "zz_3":J
    add-int/lit8 v55, p3, 0x4

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v43, v55, v57

    .line 1083
    .local v43, "zz_4":J
    mul-long v55, v15, v11

    add-long v39, v39, v55

    .line 1084
    move-wide/from16 v0, v39

    long-to-int v8, v0

    .line 1085
    add-int/lit8 v55, p3, 0x2

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1086
    ushr-int/lit8 v2, v8, 0x1f

    .line 1087
    const/16 v55, 0x20

    ushr-long v55, v39, v55

    mul-long v57, v15, v13

    add-long v55, v55, v57

    add-long v41, v41, v55

    .line 1088
    const/16 v55, 0x20

    ushr-long v55, v41, v55

    add-long v43, v43, v55

    .line 1089
    const-wide v55, 0xffffffffL

    and-long v41, v41, v55

    .line 1092
    add-int/lit8 v55, p1, 0x3

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v17, v55, v57

    .line 1093
    .local v17, "x_3":J
    add-int/lit8 v55, p3, 0x5

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v45, v55, v57

    .line 1094
    .local v45, "zz_5":J
    add-int/lit8 v55, p3, 0x6

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v47, v55, v57

    .line 1096
    .local v47, "zz_6":J
    mul-long v55, v17, v11

    add-long v41, v41, v55

    .line 1097
    move-wide/from16 v0, v41

    long-to-int v8, v0

    .line 1098
    add-int/lit8 v55, p3, 0x3

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1099
    ushr-int/lit8 v2, v8, 0x1f

    .line 1100
    const/16 v55, 0x20

    ushr-long v55, v41, v55

    mul-long v57, v17, v13

    add-long v55, v55, v57

    add-long v43, v43, v55

    .line 1101
    const/16 v55, 0x20

    ushr-long v55, v43, v55

    mul-long v57, v17, v15

    add-long v55, v55, v57

    add-long v45, v45, v55

    .line 1102
    const-wide v55, 0xffffffffL

    and-long v43, v43, v55

    .line 1103
    const/16 v55, 0x20

    ushr-long v55, v45, v55

    add-long v47, v47, v55

    .line 1104
    const-wide v55, 0xffffffffL

    and-long v45, v45, v55

    .line 1107
    add-int/lit8 v55, p1, 0x4

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v19, v55, v57

    .line 1108
    .local v19, "x_4":J
    add-int/lit8 v55, p3, 0x7

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v49, v55, v57

    .line 1109
    .local v49, "zz_7":J
    add-int/lit8 v55, p3, 0x8

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v51, v55, v57

    .line 1111
    .local v51, "zz_8":J
    mul-long v55, v19, v11

    add-long v43, v43, v55

    .line 1112
    move-wide/from16 v0, v43

    long-to-int v8, v0

    .line 1113
    add-int/lit8 v55, p3, 0x4

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1114
    ushr-int/lit8 v2, v8, 0x1f

    .line 1115
    const/16 v55, 0x20

    ushr-long v55, v43, v55

    mul-long v57, v19, v13

    add-long v55, v55, v57

    add-long v45, v45, v55

    .line 1116
    const/16 v55, 0x20

    ushr-long v55, v45, v55

    mul-long v57, v19, v15

    add-long v55, v55, v57

    add-long v47, v47, v55

    .line 1117
    const-wide v55, 0xffffffffL

    and-long v45, v45, v55

    .line 1118
    const/16 v55, 0x20

    ushr-long v55, v47, v55

    mul-long v57, v19, v17

    add-long v55, v55, v57

    add-long v49, v49, v55

    .line 1119
    const-wide v55, 0xffffffffL

    and-long v47, v47, v55

    .line 1120
    const/16 v55, 0x20

    ushr-long v55, v49, v55

    add-long v51, v51, v55

    .line 1121
    const-wide v55, 0xffffffffL

    and-long v49, v49, v55

    .line 1124
    add-int/lit8 v55, p1, 0x5

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v21, v55, v57

    .line 1125
    .local v21, "x_5":J
    add-int/lit8 v55, p3, 0x9

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v53, v55, v57

    .line 1126
    .local v53, "zz_9":J
    add-int/lit8 v55, p3, 0xa

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v29, v55, v57

    .line 1128
    .local v29, "zz_10":J
    mul-long v55, v21, v11

    add-long v45, v45, v55

    .line 1129
    move-wide/from16 v0, v45

    long-to-int v8, v0

    .line 1130
    add-int/lit8 v55, p3, 0x5

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1131
    ushr-int/lit8 v2, v8, 0x1f

    .line 1132
    const/16 v55, 0x20

    ushr-long v55, v45, v55

    mul-long v57, v21, v13

    add-long v55, v55, v57

    add-long v47, v47, v55

    .line 1133
    const/16 v55, 0x20

    ushr-long v55, v47, v55

    mul-long v57, v21, v15

    add-long v55, v55, v57

    add-long v49, v49, v55

    .line 1134
    const-wide v55, 0xffffffffL

    and-long v47, v47, v55

    .line 1135
    const/16 v55, 0x20

    ushr-long v55, v49, v55

    mul-long v57, v21, v17

    add-long v55, v55, v57

    add-long v51, v51, v55

    .line 1136
    const-wide v55, 0xffffffffL

    and-long v49, v49, v55

    .line 1137
    const/16 v55, 0x20

    ushr-long v55, v51, v55

    mul-long v57, v21, v19

    add-long v55, v55, v57

    add-long v53, v53, v55

    .line 1138
    const-wide v55, 0xffffffffL

    and-long v51, v51, v55

    .line 1139
    const/16 v55, 0x20

    ushr-long v55, v53, v55

    add-long v29, v29, v55

    .line 1140
    const-wide v55, 0xffffffffL

    and-long v53, v53, v55

    .line 1143
    add-int/lit8 v55, p1, 0x6

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v23, v55, v57

    .line 1144
    .local v23, "x_6":J
    add-int/lit8 v55, p3, 0xb

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v31, v55, v57

    .line 1145
    .local v31, "zz_11":J
    add-int/lit8 v55, p3, 0xc

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v33, v55, v57

    .line 1147
    .local v33, "zz_12":J
    mul-long v55, v23, v11

    add-long v47, v47, v55

    .line 1148
    move-wide/from16 v0, v47

    long-to-int v8, v0

    .line 1149
    add-int/lit8 v55, p3, 0x6

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1150
    ushr-int/lit8 v2, v8, 0x1f

    .line 1151
    const/16 v55, 0x20

    ushr-long v55, v47, v55

    mul-long v57, v23, v13

    add-long v55, v55, v57

    add-long v49, v49, v55

    .line 1152
    const/16 v55, 0x20

    ushr-long v55, v49, v55

    mul-long v57, v23, v15

    add-long v55, v55, v57

    add-long v51, v51, v55

    .line 1153
    const-wide v55, 0xffffffffL

    and-long v49, v49, v55

    .line 1154
    const/16 v55, 0x20

    ushr-long v55, v51, v55

    mul-long v57, v23, v17

    add-long v55, v55, v57

    add-long v53, v53, v55

    .line 1155
    const-wide v55, 0xffffffffL

    and-long v51, v51, v55

    .line 1156
    const/16 v55, 0x20

    ushr-long v55, v53, v55

    mul-long v57, v23, v19

    add-long v55, v55, v57

    add-long v29, v29, v55

    .line 1157
    const-wide v55, 0xffffffffL

    and-long v53, v53, v55

    .line 1158
    const/16 v55, 0x20

    ushr-long v55, v29, v55

    mul-long v57, v23, v21

    add-long v55, v55, v57

    add-long v31, v31, v55

    .line 1159
    const-wide v55, 0xffffffffL

    and-long v29, v29, v55

    .line 1160
    const/16 v55, 0x20

    ushr-long v55, v31, v55

    add-long v33, v33, v55

    .line 1161
    const-wide v55, 0xffffffffL

    and-long v31, v31, v55

    .line 1164
    add-int/lit8 v55, p1, 0x7

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v25, v55, v57

    .line 1165
    .local v25, "x_7":J
    add-int/lit8 v55, p3, 0xd

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v35, v55, v57

    .line 1166
    .local v35, "zz_13":J
    add-int/lit8 v55, p3, 0xe

    aget v55, p2, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v37, v55, v57

    .line 1168
    .local v37, "zz_14":J
    mul-long v55, v25, v11

    add-long v49, v49, v55

    .line 1169
    move-wide/from16 v0, v49

    long-to-int v8, v0

    .line 1170
    add-int/lit8 v55, p3, 0x7

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1171
    ushr-int/lit8 v2, v8, 0x1f

    .line 1172
    const/16 v55, 0x20

    ushr-long v55, v49, v55

    mul-long v57, v25, v13

    add-long v55, v55, v57

    add-long v51, v51, v55

    .line 1173
    const/16 v55, 0x20

    ushr-long v55, v51, v55

    mul-long v57, v25, v15

    add-long v55, v55, v57

    add-long v53, v53, v55

    .line 1174
    const/16 v55, 0x20

    ushr-long v55, v53, v55

    mul-long v57, v25, v17

    add-long v55, v55, v57

    add-long v29, v29, v55

    .line 1175
    const/16 v55, 0x20

    ushr-long v55, v29, v55

    mul-long v57, v25, v19

    add-long v55, v55, v57

    add-long v31, v31, v55

    .line 1176
    const/16 v55, 0x20

    ushr-long v55, v31, v55

    mul-long v57, v25, v21

    add-long v55, v55, v57

    add-long v33, v33, v55

    .line 1177
    const/16 v55, 0x20

    ushr-long v55, v33, v55

    mul-long v57, v25, v23

    add-long v55, v55, v57

    add-long v35, v35, v55

    .line 1178
    const/16 v55, 0x20

    ushr-long v55, v35, v55

    add-long v37, v37, v55

    .line 1181
    move-wide/from16 v0, v51

    long-to-int v8, v0

    .line 1182
    add-int/lit8 v55, p3, 0x8

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1183
    ushr-int/lit8 v2, v8, 0x1f

    .line 1184
    move-wide/from16 v0, v53

    long-to-int v8, v0

    .line 1185
    add-int/lit8 v55, p3, 0x9

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1186
    ushr-int/lit8 v2, v8, 0x1f

    .line 1187
    move-wide/from16 v0, v29

    long-to-int v8, v0

    .line 1188
    add-int/lit8 v55, p3, 0xa

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1189
    ushr-int/lit8 v2, v8, 0x1f

    .line 1190
    move-wide/from16 v0, v31

    long-to-int v8, v0

    .line 1191
    add-int/lit8 v55, p3, 0xb

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1192
    ushr-int/lit8 v2, v8, 0x1f

    .line 1193
    move-wide/from16 v0, v33

    long-to-int v8, v0

    .line 1194
    add-int/lit8 v55, p3, 0xc

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1195
    ushr-int/lit8 v2, v8, 0x1f

    .line 1196
    move-wide/from16 v0, v35

    long-to-int v8, v0

    .line 1197
    add-int/lit8 v55, p3, 0xd

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1198
    ushr-int/lit8 v2, v8, 0x1f

    .line 1199
    move-wide/from16 v0, v37

    long-to-int v8, v0

    .line 1200
    add-int/lit8 v55, p3, 0xe

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1201
    ushr-int/lit8 v2, v8, 0x1f

    .line 1202
    add-int/lit8 v55, p3, 0xf

    aget v55, p2, v55

    const/16 v56, 0x20

    shr-long v56, v37, v56

    move-wide/from16 v0, v56

    long-to-int v0, v0

    move/from16 v56, v0

    add-int v8, v55, v56

    .line 1203
    add-int/lit8 v55, p3, 0xf

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p2, v55

    .line 1204
    return-void

    .end local v8    # "w":I
    .end local v13    # "x_1":J
    .end local v15    # "x_2":J
    .end local v17    # "x_3":J
    .end local v19    # "x_4":J
    .end local v21    # "x_5":J
    .end local v23    # "x_6":J
    .end local v25    # "x_7":J
    .end local v27    # "zz_1":J
    .end local v29    # "zz_10":J
    .end local v31    # "zz_11":J
    .end local v33    # "zz_12":J
    .end local v35    # "zz_13":J
    .end local v37    # "zz_14":J
    .end local v39    # "zz_2":J
    .end local v41    # "zz_3":J
    .end local v43    # "zz_4":J
    .end local v45    # "zz_5":J
    .end local v47    # "zz_6":J
    .end local v49    # "zz_7":J
    .end local v51    # "zz_8":J
    .end local v53    # "zz_9":J
    :cond_404
    move v3, v4

    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto/16 :goto_14
.end method

.method public static square([I[I)V
    .registers 61
    .param p0, "x"    # [I
    .param p1, "zz"    # [I

    .prologue
    .line 880
    const/16 v55, 0x0

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v11, v55, v57

    .line 883
    .local v11, "x_0":J
    const/4 v2, 0x0

    .line 885
    .local v2, "c":I
    const/4 v3, 0x7

    .local v3, "i":I
    const/16 v5, 0x10

    .line 888
    .local v5, "j":I
    :goto_14
    add-int/lit8 v4, v3, -0x1

    .end local v3    # "i":I
    .local v4, "i":I
    aget v55, p0, v3

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v9, v55, v57

    .line 889
    .local v9, "xVal":J
    mul-long v6, v9, v9

    .line 890
    .local v6, "p":J
    add-int/lit8 v5, v5, -0x1

    shl-int/lit8 v55, v2, 0x1f

    const/16 v56, 0x21

    ushr-long v56, v6, v56

    move-wide/from16 v0, v56

    long-to-int v0, v0

    move/from16 v56, v0

    or-int v55, v55, v56

    aput v55, p1, v5

    .line 891
    add-int/lit8 v5, v5, -0x1

    const/16 v55, 0x1

    ushr-long v55, v6, v55

    move-wide/from16 v0, v55

    long-to-int v0, v0

    move/from16 v55, v0

    aput v55, p1, v5

    .line 892
    long-to-int v2, v6

    .line 894
    if-gtz v4, :cond_3fe

    .line 897
    mul-long v6, v11, v11

    .line 898
    shl-int/lit8 v55, v2, 0x1f

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v55, v55, v57

    const/16 v57, 0x21

    ushr-long v57, v6, v57

    or-long v27, v55, v57

    .line 899
    .local v27, "zz_1":J
    const/16 v55, 0x0

    long-to-int v0, v6

    move/from16 v56, v0

    aput v56, p1, v55

    .line 900
    const/16 v55, 0x20

    ushr-long v55, v6, v55

    move-wide/from16 v0, v55

    long-to-int v0, v0

    move/from16 v55, v0

    and-int/lit8 v2, v55, 0x1

    .line 904
    const/16 v55, 0x1

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v13, v55, v57

    .line 905
    .local v13, "x_1":J
    const/16 v55, 0x2

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v39, v55, v57

    .line 908
    .local v39, "zz_2":J
    mul-long v55, v13, v11

    add-long v27, v27, v55

    .line 909
    move-wide/from16 v0, v27

    long-to-int v8, v0

    .line 910
    .local v8, "w":I
    const/16 v55, 0x1

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 911
    ushr-int/lit8 v2, v8, 0x1f

    .line 912
    const/16 v55, 0x20

    ushr-long v55, v27, v55

    add-long v39, v39, v55

    .line 915
    const/16 v55, 0x2

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v15, v55, v57

    .line 916
    .local v15, "x_2":J
    const/16 v55, 0x3

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v41, v55, v57

    .line 917
    .local v41, "zz_3":J
    const/16 v55, 0x4

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v43, v55, v57

    .line 919
    .local v43, "zz_4":J
    mul-long v55, v15, v11

    add-long v39, v39, v55

    .line 920
    move-wide/from16 v0, v39

    long-to-int v8, v0

    .line 921
    const/16 v55, 0x2

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 922
    ushr-int/lit8 v2, v8, 0x1f

    .line 923
    const/16 v55, 0x20

    ushr-long v55, v39, v55

    mul-long v57, v15, v13

    add-long v55, v55, v57

    add-long v41, v41, v55

    .line 924
    const/16 v55, 0x20

    ushr-long v55, v41, v55

    add-long v43, v43, v55

    .line 925
    const-wide v55, 0xffffffffL

    and-long v41, v41, v55

    .line 928
    const/16 v55, 0x3

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v17, v55, v57

    .line 929
    .local v17, "x_3":J
    const/16 v55, 0x5

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v45, v55, v57

    .line 930
    .local v45, "zz_5":J
    const/16 v55, 0x6

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v47, v55, v57

    .line 932
    .local v47, "zz_6":J
    mul-long v55, v17, v11

    add-long v41, v41, v55

    .line 933
    move-wide/from16 v0, v41

    long-to-int v8, v0

    .line 934
    const/16 v55, 0x3

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 935
    ushr-int/lit8 v2, v8, 0x1f

    .line 936
    const/16 v55, 0x20

    ushr-long v55, v41, v55

    mul-long v57, v17, v13

    add-long v55, v55, v57

    add-long v43, v43, v55

    .line 937
    const/16 v55, 0x20

    ushr-long v55, v43, v55

    mul-long v57, v17, v15

    add-long v55, v55, v57

    add-long v45, v45, v55

    .line 938
    const-wide v55, 0xffffffffL

    and-long v43, v43, v55

    .line 939
    const/16 v55, 0x20

    ushr-long v55, v45, v55

    add-long v47, v47, v55

    .line 940
    const-wide v55, 0xffffffffL

    and-long v45, v45, v55

    .line 943
    const/16 v55, 0x4

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v19, v55, v57

    .line 944
    .local v19, "x_4":J
    const/16 v55, 0x7

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v49, v55, v57

    .line 945
    .local v49, "zz_7":J
    const/16 v55, 0x8

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v51, v55, v57

    .line 947
    .local v51, "zz_8":J
    mul-long v55, v19, v11

    add-long v43, v43, v55

    .line 948
    move-wide/from16 v0, v43

    long-to-int v8, v0

    .line 949
    const/16 v55, 0x4

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 950
    ushr-int/lit8 v2, v8, 0x1f

    .line 951
    const/16 v55, 0x20

    ushr-long v55, v43, v55

    mul-long v57, v19, v13

    add-long v55, v55, v57

    add-long v45, v45, v55

    .line 952
    const/16 v55, 0x20

    ushr-long v55, v45, v55

    mul-long v57, v19, v15

    add-long v55, v55, v57

    add-long v47, v47, v55

    .line 953
    const-wide v55, 0xffffffffL

    and-long v45, v45, v55

    .line 954
    const/16 v55, 0x20

    ushr-long v55, v47, v55

    mul-long v57, v19, v17

    add-long v55, v55, v57

    add-long v49, v49, v55

    .line 955
    const-wide v55, 0xffffffffL

    and-long v47, v47, v55

    .line 956
    const/16 v55, 0x20

    ushr-long v55, v49, v55

    add-long v51, v51, v55

    .line 957
    const-wide v55, 0xffffffffL

    and-long v49, v49, v55

    .line 960
    const/16 v55, 0x5

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v21, v55, v57

    .line 961
    .local v21, "x_5":J
    const/16 v55, 0x9

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v53, v55, v57

    .line 962
    .local v53, "zz_9":J
    const/16 v55, 0xa

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v29, v55, v57

    .line 964
    .local v29, "zz_10":J
    mul-long v55, v21, v11

    add-long v45, v45, v55

    .line 965
    move-wide/from16 v0, v45

    long-to-int v8, v0

    .line 966
    const/16 v55, 0x5

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 967
    ushr-int/lit8 v2, v8, 0x1f

    .line 968
    const/16 v55, 0x20

    ushr-long v55, v45, v55

    mul-long v57, v21, v13

    add-long v55, v55, v57

    add-long v47, v47, v55

    .line 969
    const/16 v55, 0x20

    ushr-long v55, v47, v55

    mul-long v57, v21, v15

    add-long v55, v55, v57

    add-long v49, v49, v55

    .line 970
    const-wide v55, 0xffffffffL

    and-long v47, v47, v55

    .line 971
    const/16 v55, 0x20

    ushr-long v55, v49, v55

    mul-long v57, v21, v17

    add-long v55, v55, v57

    add-long v51, v51, v55

    .line 972
    const-wide v55, 0xffffffffL

    and-long v49, v49, v55

    .line 973
    const/16 v55, 0x20

    ushr-long v55, v51, v55

    mul-long v57, v21, v19

    add-long v55, v55, v57

    add-long v53, v53, v55

    .line 974
    const-wide v55, 0xffffffffL

    and-long v51, v51, v55

    .line 975
    const/16 v55, 0x20

    ushr-long v55, v53, v55

    add-long v29, v29, v55

    .line 976
    const-wide v55, 0xffffffffL

    and-long v53, v53, v55

    .line 979
    const/16 v55, 0x6

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v23, v55, v57

    .line 980
    .local v23, "x_6":J
    const/16 v55, 0xb

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v31, v55, v57

    .line 981
    .local v31, "zz_11":J
    const/16 v55, 0xc

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v33, v55, v57

    .line 983
    .local v33, "zz_12":J
    mul-long v55, v23, v11

    add-long v47, v47, v55

    .line 984
    move-wide/from16 v0, v47

    long-to-int v8, v0

    .line 985
    const/16 v55, 0x6

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 986
    ushr-int/lit8 v2, v8, 0x1f

    .line 987
    const/16 v55, 0x20

    ushr-long v55, v47, v55

    mul-long v57, v23, v13

    add-long v55, v55, v57

    add-long v49, v49, v55

    .line 988
    const/16 v55, 0x20

    ushr-long v55, v49, v55

    mul-long v57, v23, v15

    add-long v55, v55, v57

    add-long v51, v51, v55

    .line 989
    const-wide v55, 0xffffffffL

    and-long v49, v49, v55

    .line 990
    const/16 v55, 0x20

    ushr-long v55, v51, v55

    mul-long v57, v23, v17

    add-long v55, v55, v57

    add-long v53, v53, v55

    .line 991
    const-wide v55, 0xffffffffL

    and-long v51, v51, v55

    .line 992
    const/16 v55, 0x20

    ushr-long v55, v53, v55

    mul-long v57, v23, v19

    add-long v55, v55, v57

    add-long v29, v29, v55

    .line 993
    const-wide v55, 0xffffffffL

    and-long v53, v53, v55

    .line 994
    const/16 v55, 0x20

    ushr-long v55, v29, v55

    mul-long v57, v23, v21

    add-long v55, v55, v57

    add-long v31, v31, v55

    .line 995
    const-wide v55, 0xffffffffL

    and-long v29, v29, v55

    .line 996
    const/16 v55, 0x20

    ushr-long v55, v31, v55

    add-long v33, v33, v55

    .line 997
    const-wide v55, 0xffffffffL

    and-long v31, v31, v55

    .line 1000
    const/16 v55, 0x7

    aget v55, p0, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v25, v55, v57

    .line 1001
    .local v25, "x_7":J
    const/16 v55, 0xd

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v35, v55, v57

    .line 1002
    .local v35, "zz_13":J
    const/16 v55, 0xe

    aget v55, p1, v55

    move/from16 v0, v55

    int-to-long v0, v0

    move-wide/from16 v55, v0

    const-wide v57, 0xffffffffL

    and-long v37, v55, v57

    .line 1004
    .local v37, "zz_14":J
    mul-long v55, v25, v11

    add-long v49, v49, v55

    .line 1005
    move-wide/from16 v0, v49

    long-to-int v8, v0

    .line 1006
    const/16 v55, 0x7

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 1007
    ushr-int/lit8 v2, v8, 0x1f

    .line 1008
    const/16 v55, 0x20

    ushr-long v55, v49, v55

    mul-long v57, v25, v13

    add-long v55, v55, v57

    add-long v51, v51, v55

    .line 1009
    const/16 v55, 0x20

    ushr-long v55, v51, v55

    mul-long v57, v25, v15

    add-long v55, v55, v57

    add-long v53, v53, v55

    .line 1010
    const/16 v55, 0x20

    ushr-long v55, v53, v55

    mul-long v57, v25, v17

    add-long v55, v55, v57

    add-long v29, v29, v55

    .line 1011
    const/16 v55, 0x20

    ushr-long v55, v29, v55

    mul-long v57, v25, v19

    add-long v55, v55, v57

    add-long v31, v31, v55

    .line 1012
    const/16 v55, 0x20

    ushr-long v55, v31, v55

    mul-long v57, v25, v21

    add-long v55, v55, v57

    add-long v33, v33, v55

    .line 1013
    const/16 v55, 0x20

    ushr-long v55, v33, v55

    mul-long v57, v25, v23

    add-long v55, v55, v57

    add-long v35, v35, v55

    .line 1014
    const/16 v55, 0x20

    ushr-long v55, v35, v55

    add-long v37, v37, v55

    .line 1017
    move-wide/from16 v0, v51

    long-to-int v8, v0

    .line 1018
    const/16 v55, 0x8

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 1019
    ushr-int/lit8 v2, v8, 0x1f

    .line 1020
    move-wide/from16 v0, v53

    long-to-int v8, v0

    .line 1021
    const/16 v55, 0x9

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 1022
    ushr-int/lit8 v2, v8, 0x1f

    .line 1023
    move-wide/from16 v0, v29

    long-to-int v8, v0

    .line 1024
    const/16 v55, 0xa

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 1025
    ushr-int/lit8 v2, v8, 0x1f

    .line 1026
    move-wide/from16 v0, v31

    long-to-int v8, v0

    .line 1027
    const/16 v55, 0xb

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 1028
    ushr-int/lit8 v2, v8, 0x1f

    .line 1029
    move-wide/from16 v0, v33

    long-to-int v8, v0

    .line 1030
    const/16 v55, 0xc

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 1031
    ushr-int/lit8 v2, v8, 0x1f

    .line 1032
    move-wide/from16 v0, v35

    long-to-int v8, v0

    .line 1033
    const/16 v55, 0xd

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 1034
    ushr-int/lit8 v2, v8, 0x1f

    .line 1035
    move-wide/from16 v0, v37

    long-to-int v8, v0

    .line 1036
    const/16 v55, 0xe

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 1037
    ushr-int/lit8 v2, v8, 0x1f

    .line 1038
    const/16 v55, 0xf

    aget v55, p1, v55

    const/16 v56, 0x20

    shr-long v56, v37, v56

    move-wide/from16 v0, v56

    long-to-int v0, v0

    move/from16 v56, v0

    add-int v8, v55, v56

    .line 1039
    const/16 v55, 0xf

    shl-int/lit8 v56, v8, 0x1

    or-int v56, v56, v2

    aput v56, p1, v55

    .line 1040
    return-void

    .end local v8    # "w":I
    .end local v13    # "x_1":J
    .end local v15    # "x_2":J
    .end local v17    # "x_3":J
    .end local v19    # "x_4":J
    .end local v21    # "x_5":J
    .end local v23    # "x_6":J
    .end local v25    # "x_7":J
    .end local v27    # "zz_1":J
    .end local v29    # "zz_10":J
    .end local v31    # "zz_11":J
    .end local v33    # "zz_12":J
    .end local v35    # "zz_13":J
    .end local v37    # "zz_14":J
    .end local v39    # "zz_2":J
    .end local v41    # "zz_3":J
    .end local v43    # "zz_4":J
    .end local v45    # "zz_5":J
    .end local v47    # "zz_6":J
    .end local v49    # "zz_7":J
    .end local v51    # "zz_8":J
    .end local v53    # "zz_9":J
    :cond_3fe
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

    .line 1238
    const-wide/16 v0, 0x0

    .line 1239
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

    .line 1240
    add-int/lit8 v2, p5, 0x0

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1241
    shr-long/2addr v0, v8

    .line 1242
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

    .line 1243
    add-int/lit8 v2, p5, 0x1

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1244
    shr-long/2addr v0, v8

    .line 1245
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

    .line 1246
    add-int/lit8 v2, p5, 0x2

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1247
    shr-long/2addr v0, v8

    .line 1248
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

    .line 1249
    add-int/lit8 v2, p5, 0x3

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1250
    shr-long/2addr v0, v8

    .line 1251
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

    .line 1252
    add-int/lit8 v2, p5, 0x4

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1253
    shr-long/2addr v0, v8

    .line 1254
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

    .line 1255
    add-int/lit8 v2, p5, 0x5

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1256
    shr-long/2addr v0, v8

    .line 1257
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

    .line 1258
    add-int/lit8 v2, p5, 0x6

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1259
    shr-long/2addr v0, v8

    .line 1260
    add-int/lit8 v2, p1, 0x7

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p3, 0x7

    aget v4, p2, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1261
    add-int/lit8 v2, p5, 0x7

    long-to-int v3, v0

    aput v3, p4, v2

    .line 1262
    shr-long/2addr v0, v8

    .line 1263
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

    .line 1208
    const-wide/16 v0, 0x0

    .line 1209
    .local v0, "c":J
    aget v2, p0, v9

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1210
    long-to-int v2, v0

    aput v2, p2, v9

    .line 1211
    shr-long/2addr v0, v8

    .line 1212
    aget v2, p0, v10

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1213
    long-to-int v2, v0

    aput v2, p2, v10

    .line 1214
    shr-long/2addr v0, v8

    .line 1215
    aget v2, p0, v11

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p1, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1216
    long-to-int v2, v0

    aput v2, p2, v11

    .line 1217
    shr-long/2addr v0, v8

    .line 1218
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

    .line 1219
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1220
    shr-long/2addr v0, v8

    .line 1221
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

    .line 1222
    const/4 v2, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1223
    shr-long/2addr v0, v8

    .line 1224
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

    .line 1225
    const/4 v2, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1226
    shr-long/2addr v0, v8

    .line 1227
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

    .line 1228
    const/4 v2, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1229
    shr-long/2addr v0, v8

    .line 1230
    const/4 v2, 0x7

    aget v2, p0, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x7

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1231
    const/4 v2, 0x7

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1232
    shr-long/2addr v0, v8

    .line 1233
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

    .line 1268
    const-wide/16 v0, 0x0

    .line 1269
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

    .line 1270
    long-to-int v2, v0

    aput v2, p2, v9

    .line 1271
    shr-long/2addr v0, v8

    .line 1272
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

    .line 1273
    long-to-int v2, v0

    aput v2, p2, v10

    .line 1274
    shr-long/2addr v0, v8

    .line 1275
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

    .line 1276
    long-to-int v2, v0

    aput v2, p2, v11

    .line 1277
    shr-long/2addr v0, v8

    .line 1278
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

    .line 1279
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1280
    shr-long/2addr v0, v8

    .line 1281
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

    .line 1282
    const/4 v2, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1283
    shr-long/2addr v0, v8

    .line 1284
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

    .line 1285
    const/4 v2, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1286
    shr-long/2addr v0, v8

    .line 1287
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

    .line 1288
    const/4 v2, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1289
    shr-long/2addr v0, v8

    .line 1290
    const/4 v2, 0x7

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x7

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    const/4 v4, 0x7

    aget v4, p1, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1291
    const/4 v2, 0x7

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1292
    shr-long/2addr v0, v8

    .line 1293
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

    .line 1328
    const-wide/16 v0, 0x0

    .line 1329
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

    .line 1330
    add-int/lit8 v2, p3, 0x0

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1331
    shr-long/2addr v0, v8

    .line 1332
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

    .line 1333
    add-int/lit8 v2, p3, 0x1

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1334
    shr-long/2addr v0, v8

    .line 1335
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

    .line 1336
    add-int/lit8 v2, p3, 0x2

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1337
    shr-long/2addr v0, v8

    .line 1338
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

    .line 1339
    add-int/lit8 v2, p3, 0x3

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1340
    shr-long/2addr v0, v8

    .line 1341
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

    .line 1342
    add-int/lit8 v2, p3, 0x4

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1343
    shr-long/2addr v0, v8

    .line 1344
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

    .line 1345
    add-int/lit8 v2, p3, 0x5

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1346
    shr-long/2addr v0, v8

    .line 1347
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

    .line 1348
    add-int/lit8 v2, p3, 0x6

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1349
    shr-long/2addr v0, v8

    .line 1350
    add-int/lit8 v2, p3, 0x7

    aget v2, p2, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    add-int/lit8 v4, p1, 0x7

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1351
    add-int/lit8 v2, p3, 0x7

    long-to-int v3, v0

    aput v3, p2, v2

    .line 1352
    shr-long/2addr v0, v8

    .line 1353
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

    .line 1298
    const-wide/16 v0, 0x0

    .line 1299
    .local v0, "c":J
    aget v2, p1, v9

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p0, v9

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1300
    long-to-int v2, v0

    aput v2, p1, v9

    .line 1301
    shr-long/2addr v0, v8

    .line 1302
    aget v2, p1, v10

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p0, v10

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1303
    long-to-int v2, v0

    aput v2, p1, v10

    .line 1304
    shr-long/2addr v0, v8

    .line 1305
    aget v2, p1, v11

    int-to-long v2, v2

    and-long/2addr v2, v6

    aget v4, p0, v11

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1306
    long-to-int v2, v0

    aput v2, p1, v11

    .line 1307
    shr-long/2addr v0, v8

    .line 1308
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

    .line 1309
    const/4 v2, 0x3

    long-to-int v3, v0

    aput v3, p1, v2

    .line 1310
    shr-long/2addr v0, v8

    .line 1311
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

    .line 1312
    const/4 v2, 0x4

    long-to-int v3, v0

    aput v3, p1, v2

    .line 1313
    shr-long/2addr v0, v8

    .line 1314
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

    .line 1315
    const/4 v2, 0x5

    long-to-int v3, v0

    aput v3, p1, v2

    .line 1316
    shr-long/2addr v0, v8

    .line 1317
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

    .line 1318
    const/4 v2, 0x6

    long-to-int v3, v0

    aput v3, p1, v2

    .line 1319
    shr-long/2addr v0, v8

    .line 1320
    const/4 v2, 0x7

    aget v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v6

    const/4 v4, 0x7

    aget v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v6

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 1321
    const/4 v2, 0x7

    long-to-int v3, v0

    aput v3, p1, v2

    .line 1322
    shr-long/2addr v0, v8

    .line 1323
    long-to-int v2, v0

    return v2
.end method

.method public static toBigInteger([I)Ljava/math/BigInteger;
    .registers 6
    .param p0, "x"    # [I

    .prologue
    .line 1358
    const/16 v3, 0x20

    new-array v0, v3, [B

    .line 1359
    .local v0, "bs":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    const/16 v3, 0x8

    if-ge v1, v3, :cond_17

    .line 1361
    aget v2, p0, v1

    .line 1362
    .local v2, "x_i":I
    if-eqz v2, :cond_14

    .line 1364
    rsub-int/lit8 v3, v1, 0x7

    shl-int/lit8 v3, v3, 0x2

    invoke-static {v2, v0, v3}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 1359
    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1367
    .end local v2    # "x_i":I
    :cond_17
    new-instance v3, Ljava/math/BigInteger;

    const/4 v4, 0x1

    invoke-direct {v3, v4, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    return-object v3
.end method

.method public static toBigInteger64([J)Ljava/math/BigInteger;
    .registers 7
    .param p0, "x"    # [J

    .prologue
    .line 1372
    const/16 v4, 0x20

    new-array v0, v4, [B

    .line 1373
    .local v0, "bs":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    const/4 v4, 0x4

    if-ge v1, v4, :cond_1a

    .line 1375
    aget-wide v2, p0, v1

    .line 1376
    .local v2, "x_i":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-eqz v4, :cond_17

    .line 1378
    rsub-int/lit8 v4, v1, 0x3

    shl-int/lit8 v4, v4, 0x3

    invoke-static {v2, v3, v0, v4}, Lorg/spongycastle/util/Pack;->longToBigEndian(J[BI)V

    .line 1373
    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1381
    .end local v2    # "x_i":J
    :cond_1a
    new-instance v4, Ljava/math/BigInteger;

    const/4 v5, 0x1

    invoke-direct {v4, v5, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    return-object v4
.end method

.method public static zero([I)V
    .registers 3
    .param p0, "z"    # [I

    .prologue
    const/4 v1, 0x0

    .line 1386
    aput v1, p0, v1

    .line 1387
    const/4 v0, 0x1

    aput v1, p0, v0

    .line 1388
    const/4 v0, 0x2

    aput v1, p0, v0

    .line 1389
    const/4 v0, 0x3

    aput v1, p0, v0

    .line 1390
    const/4 v0, 0x4

    aput v1, p0, v0

    .line 1391
    const/4 v0, 0x5

    aput v1, p0, v0

    .line 1392
    const/4 v0, 0x6

    aput v1, p0, v0

    .line 1393
    const/4 v0, 0x7

    aput v1, p0, v0

    .line 1394
    return-void
.end method
