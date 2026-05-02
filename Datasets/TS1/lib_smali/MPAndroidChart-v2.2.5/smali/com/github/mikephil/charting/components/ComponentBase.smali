.class public abstract Lcom/github/mikephil/charting/components/ComponentBase;
.super Ljava/lang/Object;
.source "ComponentBase.java"


# instance fields
.field protected mEnabled:Z

.field protected mTextColor:I

.field protected mTextSize:F

.field protected mTypeface:Landroid/graphics/Typeface;

.field protected mXOffset:F

.field protected mYOffset:F


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/high16 v1, 0x40a00000    # 5.0f

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mEnabled:Z

    .line 24
    iput v1, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mXOffset:F

    .line 29
    iput v1, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mYOffset:F

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mTypeface:Landroid/graphics/Typeface;

    .line 39
    const/high16 v0, 0x41200000    # 10.0f

    iput v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mTextSize:F

    .line 44
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mTextColor:I

    .line 48
    return-void
.end method


# virtual methods
.method public getTextColor()I
    .registers 2

    .prologue
    .line 149
    iget v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mTextColor:I

    return v0
.end method

.method public getTextSize()F
    .registers 2

    .prologue
    .line 130
    iget v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mTextSize:F

    return v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public getXOffset()F
    .registers 2

    .prologue
    .line 57
    iget v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mXOffset:F

    return v0
.end method

.method public getYOffset()F
    .registers 2

    .prologue
    .line 76
    iget v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mYOffset:F

    return v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 169
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mEnabled:Z

    return v0
.end method

.method public setEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 160
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mEnabled:Z

    .line 161
    return-void
.end method

.method public setTextColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 140
    iput p1, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mTextColor:I

    .line 141
    return-void
.end method

.method public setTextSize(F)V
    .registers 3
    .param p1, "size"    # F

    .prologue
    .line 116
    const/high16 v0, 0x41c00000    # 24.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_8

    .line 117
    const/high16 p1, 0x41c00000    # 24.0f

    .line 118
    :cond_8
    const/high16 v0, 0x40c00000    # 6.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_10

    .line 119
    const/high16 p1, 0x40c00000    # 6.0f

    .line 121
    :cond_10
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mTextSize:F

    .line 122
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .registers 2
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mTypeface:Landroid/graphics/Typeface;

    .line 106
    return-void
.end method

.method public setXOffset(F)V
    .registers 3
    .param p1, "xOffset"    # F

    .prologue
    .line 66
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mXOffset:F

    .line 67
    return-void
.end method

.method public setYOffset(F)V
    .registers 3
    .param p1, "yOffset"    # F

    .prologue
    .line 87
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/ComponentBase;->mYOffset:F

    .line 88
    return-void
.end method
