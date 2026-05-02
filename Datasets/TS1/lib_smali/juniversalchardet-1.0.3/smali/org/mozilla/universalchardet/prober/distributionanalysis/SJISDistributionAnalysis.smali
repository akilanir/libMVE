.class public Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;
.super Lorg/mozilla/universalchardet/prober/distributionanalysis/JISDistributionAnalysis;
.source "SJISDistributionAnalysis.java"


# static fields
.field public static final HIGHBYTE_BEGIN_1:I = 0x81

.field public static final HIGHBYTE_BEGIN_2:I = 0xe0

.field public static final HIGHBYTE_END_1:I = 0x9f

.field public static final HIGHBYTE_END_2:I = 0xef

.field public static final LOWBYTE_BEGIN_1:I = 0x40

.field public static final LOWBYTE_BEGIN_2:I = 0x80


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/mozilla/universalchardet/prober/distributionanalysis/JISDistributionAnalysis;-><init>()V

    .line 59
    return-void
.end method


# virtual methods
.method protected getOrder([BI)I
    .registers 7
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 64
    const/4 v2, -0x1

    .line 66
    .local v2, "order":I
    aget-byte v3, p1, p2

    and-int/lit16 v0, v3, 0xff

    .line 67
    .local v0, "highbyte":I
    const/16 v3, 0x81

    if-lt v0, v3, :cond_22

    const/16 v3, 0x9f

    if-gt v0, v3, :cond_22

    .line 68
    add-int/lit16 v3, v0, -0x81

    mul-int/lit16 v2, v3, 0xbc

    .line 74
    :goto_11
    add-int/lit8 v3, p2, 0x1

    aget-byte v3, p1, v3

    and-int/lit16 v1, v3, 0xff

    .line 75
    .local v1, "lowbyte":I
    add-int/lit8 v3, v1, -0x40

    add-int/2addr v2, v3

    .line 76
    const/16 v3, 0x80

    if-lt v1, v3, :cond_20

    .line 77
    add-int/lit8 v2, v2, -0x1

    :cond_20
    move v3, v2

    .line 80
    .end local v1    # "lowbyte":I
    :goto_21
    return v3

    .line 69
    :cond_22
    const/16 v3, 0xe0

    if-lt v0, v3, :cond_31

    const/16 v3, 0xef

    if-gt v0, v3, :cond_31

    .line 70
    add-int/lit16 v3, v0, -0xe0

    add-int/lit8 v3, v3, 0x1f

    mul-int/lit16 v2, v3, 0xbc

    .line 71
    goto :goto_11

    .line 72
    :cond_31
    const/4 v3, -0x1

    goto :goto_21
.end method
