.class public Lorg/mozilla/universalchardet/prober/contextanalysis/EUCJPContextAnalysis;
.super Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis;
.source "EUCJPContextAnalysis.java"


# static fields
.field public static final FIRSTPLANE_HIGHBYTE_BEGIN:I = 0xa1

.field public static final FIRSTPLANE_HIGHBYTE_END:I = 0xfe

.field public static final HIRAGANA_HIGHBYTE:I = 0xa4

.field public static final HIRAGANA_LOWBYTE_BEGIN:I = 0xa1

.field public static final HIRAGANA_LOWBYTE_END:I = 0xf3

.field public static final SINGLE_SHIFT_2:I = 0x8e

.field public static final SINGLE_SHIFT_3:I = 0x8f


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis;-><init>()V

    .line 61
    return-void
.end method


# virtual methods
.method protected getOrder([BI)I
    .registers 6
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 90
    aget-byte v2, p1, p2

    and-int/lit16 v0, v2, 0xff

    .line 91
    .local v0, "highbyte":I
    const/16 v2, 0xa4

    if-ne v0, v2, :cond_19

    .line 92
    add-int/lit8 v2, p2, 0x1

    aget-byte v2, p1, v2

    and-int/lit16 v1, v2, 0xff

    .line 93
    .local v1, "lowbyte":I
    const/16 v2, 0xa1

    if-lt v1, v2, :cond_19

    const/16 v2, 0xf3

    if-gt v1, v2, :cond_19

    .line 95
    add-int/lit16 v2, v1, -0xa1

    .line 99
    .end local v1    # "lowbyte":I
    :goto_18
    return v2

    :cond_19
    const/4 v2, -0x1

    goto :goto_18
.end method

.method protected getOrder(Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis$Order;[BI)V
    .registers 8
    .param p1, "order"    # Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis$Order;
    .param p2, "buf"    # [B
    .param p3, "offset"    # I

    .prologue
    const/16 v3, 0xa1

    .line 66
    const/4 v2, -0x1

    iput v2, p1, Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis$Order;->order:I

    .line 67
    const/4 v2, 0x1

    iput v2, p1, Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis$Order;->charLength:I

    .line 69
    aget-byte v2, p2, p3

    and-int/lit16 v0, v2, 0xff

    .line 70
    .local v0, "firstByte":I
    const/16 v2, 0x8e

    if-eq v0, v2, :cond_16

    if-lt v0, v3, :cond_2e

    const/16 v2, 0xfe

    if-gt v0, v2, :cond_2e

    .line 73
    :cond_16
    const/4 v2, 0x2

    iput v2, p1, Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis$Order;->charLength:I

    .line 78
    :cond_19
    :goto_19
    const/16 v2, 0xa4

    if-ne v0, v2, :cond_2d

    .line 79
    add-int/lit8 v2, p3, 0x1

    aget-byte v2, p2, v2

    and-int/lit16 v1, v2, 0xff

    .line 80
    .local v1, "secondByte":I
    if-lt v1, v3, :cond_2d

    const/16 v2, 0xf3

    if-gt v1, v2, :cond_2d

    .line 82
    add-int/lit16 v2, v1, -0xa1

    iput v2, p1, Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis$Order;->order:I

    .line 85
    .end local v1    # "secondByte":I
    :cond_2d
    return-void

    .line 74
    :cond_2e
    const/16 v2, 0x8f

    if-ne v0, v2, :cond_19

    .line 75
    const/4 v2, 0x3

    iput v2, p1, Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis$Order;->charLength:I

    goto :goto_19
.end method
