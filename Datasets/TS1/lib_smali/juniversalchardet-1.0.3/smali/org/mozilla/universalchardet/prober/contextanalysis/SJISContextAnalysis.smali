.class public Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;
.super Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis;
.source "SJISContextAnalysis.java"


# static fields
.field public static final HIGHBYTE_BEGIN_1:I = 0x81

.field public static final HIGHBYTE_BEGIN_2:I = 0xe0

.field public static final HIGHBYTE_END_1:I = 0x9f

.field public static final HIGHBYTE_END_2:I = 0xef

.field public static final HIRAGANA_HIGHBYTE:I = 0x82

.field public static final HIRAGANA_LOWBYTE_BEGIN:I = 0x9f

.field public static final HIRAGANA_LOWBYTE_END:I = 0xf1


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis;-><init>()V

    .line 60
    return-void
.end method


# virtual methods
.method protected getOrder([BI)I
    .registers 6
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 86
    aget-byte v2, p1, p2

    and-int/lit16 v0, v2, 0xff

    .line 87
    .local v0, "highbyte":I
    const/16 v2, 0x82

    if-ne v0, v2, :cond_19

    .line 88
    add-int/lit8 v2, p2, 0x1

    aget-byte v2, p1, v2

    and-int/lit16 v1, v2, 0xff

    .line 89
    .local v1, "lowbyte":I
    const/16 v2, 0x9f

    if-lt v1, v2, :cond_19

    const/16 v2, 0xf1

    if-gt v1, v2, :cond_19

    .line 91
    add-int/lit16 v2, v1, -0x9f

    .line 95
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
    const/16 v3, 0x9f

    .line 65
    const/4 v2, -0x1

    iput v2, p1, Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis$Order;->order:I

    .line 66
    const/4 v2, 0x1

    iput v2, p1, Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis$Order;->charLength:I

    .line 68
    aget-byte v2, p2, p3

    and-int/lit16 v0, v2, 0xff

    .line 69
    .local v0, "highbyte":I
    const/16 v2, 0x81

    if-lt v0, v2, :cond_12

    if-le v0, v3, :cond_1a

    :cond_12
    const/16 v2, 0xe0

    if-lt v0, v2, :cond_1d

    const/16 v2, 0xef

    if-gt v0, v2, :cond_1d

    .line 71
    :cond_1a
    const/4 v2, 0x2

    iput v2, p1, Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis$Order;->charLength:I

    .line 74
    :cond_1d
    const/16 v2, 0x82

    if-ne v0, v2, :cond_31

    .line 75
    add-int/lit8 v2, p3, 0x1

    aget-byte v2, p2, v2

    and-int/lit16 v1, v2, 0xff

    .line 76
    .local v1, "lowbyte":I
    if-lt v1, v3, :cond_31

    const/16 v2, 0xf1

    if-gt v1, v2, :cond_31

    .line 78
    add-int/lit16 v2, v1, -0x9f

    iput v2, p1, Lorg/mozilla/universalchardet/prober/contextanalysis/JapaneseContextAnalysis$Order;->order:I

    .line 81
    .end local v1    # "lowbyte":I
    :cond_31
    return-void
.end method
