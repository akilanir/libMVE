.class final Landroid/support/v7/graphics/ColorHistogram;
.super Ljava/lang/Object;
.source "ColorHistogram.java"


# instance fields
.field private final mColorCounts:[I

.field private final mColors:[I

.field private final mNumberColors:I


# direct methods
.method constructor <init>([I)V
    .registers 3
    .param p1, "pixels"    # [I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    invoke-static {p1}, Ljava/util/Arrays;->sort([I)V

    .line 40
    invoke-static {p1}, Landroid/support/v7/graphics/ColorHistogram;->countDistinctColors([I)I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/ColorHistogram;->mNumberColors:I

    .line 43
    iget v0, p0, Landroid/support/v7/graphics/ColorHistogram;->mNumberColors:I

    new-array v0, v0, [I

    iput-object v0, p0, Landroid/support/v7/graphics/ColorHistogram;->mColors:[I

    .line 44
    iget v0, p0, Landroid/support/v7/graphics/ColorHistogram;->mNumberColors:I

    new-array v0, v0, [I

    iput-object v0, p0, Landroid/support/v7/graphics/ColorHistogram;->mColorCounts:[I

    .line 47
    invoke-direct {p0, p1}, Landroid/support/v7/graphics/ColorHistogram;->countFrequencies([I)V

    .line 48
    return-void
.end method

.method private static countDistinctColors([I)I
    .registers 6
    .param p0, "pixels"    # [I

    .prologue
    .line 72
    array-length v3, p0

    const/4 v4, 0x2

    if-ge v3, v4, :cond_6

    .line 74
    array-length v0, p0

    .line 90
    :cond_5
    return v0

    .line 78
    :cond_6
    const/4 v0, 0x1

    .line 79
    .local v0, "colorCount":I
    const/4 v3, 0x0

    aget v1, p0, v3

    .line 82
    .local v1, "currentColor":I
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_b
    array-length v3, p0

    if-ge v2, v3, :cond_5

    .line 84
    aget v3, p0, v2

    if-eq v3, v1, :cond_16

    .line 85
    aget v1, p0, v2

    .line 86
    add-int/lit8 v0, v0, 0x1

    .line 82
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_b
.end method

.method private countFrequencies([I)V
    .registers 8
    .param p1, "pixels"    # [I

    .prologue
    const/4 v5, 0x1

    .line 94
    array-length v3, p1

    if-nez v3, :cond_5

    .line 123
    :cond_4
    return-void

    .line 98
    :cond_5
    const/4 v1, 0x0

    .line 99
    .local v1, "currentColorIndex":I
    const/4 v3, 0x0

    aget v0, p1, v3

    .line 101
    .local v0, "currentColor":I
    iget-object v3, p0, Landroid/support/v7/graphics/ColorHistogram;->mColors:[I

    aput v0, v3, v1

    .line 102
    iget-object v3, p0, Landroid/support/v7/graphics/ColorHistogram;->mColorCounts:[I

    aput v5, v3, v1

    .line 104
    array-length v3, p1

    if-eq v3, v5, :cond_4

    .line 110
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_15
    array-length v3, p1

    if-ge v2, v3, :cond_4

    .line 111
    aget v3, p1, v2

    if-ne v3, v0, :cond_27

    .line 113
    iget-object v3, p0, Landroid/support/v7/graphics/ColorHistogram;->mColorCounts:[I

    aget v4, v3, v1

    add-int/lit8 v4, v4, 0x1

    aput v4, v3, v1

    .line 110
    :goto_24
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 116
    :cond_27
    aget v0, p1, v2

    .line 118
    add-int/lit8 v1, v1, 0x1

    .line 119
    iget-object v3, p0, Landroid/support/v7/graphics/ColorHistogram;->mColors:[I

    aput v0, v3, v1

    .line 120
    iget-object v3, p0, Landroid/support/v7/graphics/ColorHistogram;->mColorCounts:[I

    aput v5, v3, v1

    goto :goto_24
.end method


# virtual methods
.method getColorCounts()[I
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Landroid/support/v7/graphics/ColorHistogram;->mColorCounts:[I

    return-object v0
.end method

.method getColors()[I
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Landroid/support/v7/graphics/ColorHistogram;->mColors:[I

    return-object v0
.end method

.method getNumberOfColors()I
    .registers 2

    .prologue
    .line 54
    iget v0, p0, Landroid/support/v7/graphics/ColorHistogram;->mNumberColors:I

    return v0
.end method
