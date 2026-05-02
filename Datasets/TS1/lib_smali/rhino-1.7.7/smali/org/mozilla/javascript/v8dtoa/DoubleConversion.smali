.class public final Lorg/mozilla/javascript/v8dtoa/DoubleConversion;
.super Ljava/lang/Object;
.source "DoubleConversion.java"


# static fields
.field private static final kDenormalExponent:I = -0x432

.field private static final kExponentBias:I = 0x433

.field private static final kExponentMask:J = 0x7ff0000000000000L

.field private static final kHiddenBit:J = 0x10000000000000L

.field private static final kPhysicalSignificandSize:I = 0x34

.field private static final kSignMask:J = -0x8000000000000000L

.field private static final kSignificandMask:J = 0xfffffffffffffL

.field private static final kSignificandSize:I = 0x35


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method public static doubleToInt32(D)I
    .registers 11
    .param p0, "x"    # D

    .prologue
    .line 73
    double-to-int v3, p0

    .line 74
    .local v3, "i":I
    int-to-double v6, v3

    cmpl-double v6, v6, p0

    if-nez v6, :cond_7

    .line 83
    .end local v3    # "i":I
    :goto_6
    return v3

    .line 77
    .restart local v3    # "i":I
    :cond_7
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 78
    .local v0, "d64":J
    invoke-static {v0, v1}, Lorg/mozilla/javascript/v8dtoa/DoubleConversion;->exponent(J)I

    move-result v2

    .line 79
    .local v2, "exponent":I
    const/16 v6, -0x35

    if-le v2, v6, :cond_17

    const/16 v6, 0x1f

    if-le v2, v6, :cond_19

    .line 80
    :cond_17
    const/4 v3, 0x0

    goto :goto_6

    .line 82
    :cond_19
    invoke-static {v0, v1}, Lorg/mozilla/javascript/v8dtoa/DoubleConversion;->significand(J)J

    move-result-wide v4

    .line 83
    .local v4, "s":J
    invoke-static {v0, v1}, Lorg/mozilla/javascript/v8dtoa/DoubleConversion;->sign(J)I

    move-result v8

    if-gez v2, :cond_2a

    neg-int v6, v2

    shr-long v6, v4, v6

    :goto_26
    long-to-int v6, v6

    mul-int v3, v8, v6

    goto :goto_6

    :cond_2a
    shl-long v6, v4, v2

    goto :goto_26
.end method

.method private static exponent(J)I
    .registers 6
    .param p0, "d64"    # J

    .prologue
    .line 47
    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleConversion;->isDenormal(J)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 48
    const/16 v1, -0x432

    .line 51
    :goto_8
    return v1

    .line 50
    :cond_9
    const-wide/high16 v1, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    and-long/2addr v1, p0

    const/16 v3, 0x34

    shr-long/2addr v1, v3

    long-to-int v0, v1

    .line 51
    .local v0, "biased_e":I
    add-int/lit16 v1, v0, -0x433

    goto :goto_8
.end method

.method private static isDenormal(J)Z
    .registers 6
    .param p0, "d64"    # J

    .prologue
    .line 65
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private static sign(J)I
    .registers 6
    .param p0, "d64"    # J

    .prologue
    .line 69
    const-wide/high16 v0, -0x8000000000000000L

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, -0x1

    goto :goto_a
.end method

.method private static significand(J)J
    .registers 6
    .param p0, "d64"    # J

    .prologue
    .line 55
    const-wide v2, 0xfffffffffffffL

    and-long v0, p0, v2

    .line 56
    .local v0, "significand":J
    invoke-static {p0, p1}, Lorg/mozilla/javascript/v8dtoa/DoubleConversion;->isDenormal(J)Z

    move-result v2

    if-nez v2, :cond_10

    .line 57
    const-wide/high16 v2, 0x10000000000000L

    add-long/2addr v0, v2

    .line 59
    .end local v0    # "significand":J
    :cond_10
    return-wide v0
.end method
