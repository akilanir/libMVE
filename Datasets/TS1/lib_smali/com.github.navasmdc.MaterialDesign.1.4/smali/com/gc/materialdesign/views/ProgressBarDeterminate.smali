.class public Lcom/gc/materialdesign/views/ProgressBarDeterminate;
.super Lcom/gc/materialdesign/views/CustomView;
.source "ProgressBarDeterminate.java"


# instance fields
.field backgroundColor:I

.field max:I

.field min:I

.field pendindProgress:I

.field progress:I

.field progressView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/gc/materialdesign/views/CustomView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    const/16 v0, 0x64

    iput v0, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->max:I

    .line 20
    iput v1, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->min:I

    .line 21
    iput v1, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->progress:I

    .line 23
    const-string v0, "#1E88E5"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->backgroundColor:I

    .line 101
    const/4 v0, -0x1

    iput v0, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->pendindProgress:I

    .line 29
    invoke-virtual {p0, p2}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->setAttributes(Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method


# virtual methods
.method public getProgress()I
    .registers 2

    .prologue
    .line 123
    iget v0, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->progress:I

    return v0
.end method

.method protected makePressColor()I
    .registers 5

    .prologue
    .line 78
    iget v3, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->backgroundColor:I

    shr-int/lit8 v3, v3, 0x10

    and-int/lit16 v2, v3, 0xff

    .line 79
    .local v2, "r":I
    iget v3, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->backgroundColor:I

    shr-int/lit8 v3, v3, 0x8

    and-int/lit16 v1, v3, 0xff

    .line 80
    .local v1, "g":I
    iget v3, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->backgroundColor:I

    shr-int/lit8 v3, v3, 0x0

    and-int/lit16 v0, v3, 0xff

    .line 81
    .local v0, "b":I
    const/16 v3, 0x80

    invoke-static {v3, v2, v1, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    return v3
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 88
    invoke-super {p0, p1}, Lcom/gc/materialdesign/views/CustomView;->onDraw(Landroid/graphics/Canvas;)V

    .line 89
    iget v0, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->pendindProgress:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_d

    .line 90
    iget v0, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->pendindProgress:I

    invoke-virtual {p0, v0}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->setProgress(I)V

    .line 91
    :cond_d
    return-void
.end method

.method protected setAttributes(Landroid/util/AttributeSet;)V
    .registers 9
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v6, 0x1

    const/4 v5, -0x1

    .line 35
    new-instance v3, Landroid/view/View;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->progressView:Landroid/view/View;

    .line 36
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 37
    .local v2, "params":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v3, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->progressView:Landroid/view/View;

    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    iget-object v3, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->progressView:Landroid/view/View;

    sget v4, Lcom/gc/materialdesign/R$drawable;->background_progress:I

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 39
    iget-object v3, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->progressView:Landroid/view/View;

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->addView(Landroid/view/View;)V

    .line 43
    const-string v3, "http://schemas.android.com/apk/res/android"

    const-string v4, "background"

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 44
    .local v0, "bacgroundColor":I
    if-eq v0, v5, :cond_71

    .line 45
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->setBackgroundColor(I)V

    .line 55
    :goto_38
    const-string v3, "http://schemas.android.com/apk/res-auto"

    const-string v4, "min"

    const/4 v5, 0x0

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->min:I

    .line 56
    const-string v3, "http://schemas.android.com/apk/res-auto"

    const-string v4, "max"

    const/16 v5, 0x64

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->max:I

    .line 57
    const-string v3, "http://schemas.android.com/apk/res-auto"

    const-string v4, "progress"

    iget v5, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->min:I

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->progress:I

    .line 59
    const/high16 v3, 0x40400000    # 3.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->setMinimumHeight(I)V

    .line 61
    new-instance v3, Lcom/gc/materialdesign/views/ProgressBarDeterminate$1;

    invoke-direct {v3, p0}, Lcom/gc/materialdesign/views/ProgressBarDeterminate$1;-><init>(Lcom/gc/materialdesign/views/ProgressBarDeterminate;)V

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->post(Ljava/lang/Runnable;)Z

    .line 71
    return-void

    .line 48
    :cond_71
    const-string v3, "http://schemas.android.com/apk/res/android"

    const-string v4, "background"

    invoke-interface {p1, v3, v4, v5}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 49
    .local v1, "background":I
    if-eq v1, v5, :cond_7f

    .line 50
    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->setBackgroundColor(I)V

    goto :goto_38

    .line 52
    :cond_7f
    const-string v3, "#1E88E5"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->setBackgroundColor(I)V

    goto :goto_38
.end method

.method public setBackgroundColor(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 128
    iput p1, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->backgroundColor:I

    .line 129
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 130
    iget v2, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->backgroundColor:I

    iput v2, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->beforeBackground:I

    .line 131
    :cond_c
    iget-object v2, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->progressView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 132
    .local v0, "layer":Landroid/graphics/drawable/LayerDrawable;
    sget v2, Lcom/gc/materialdesign/R$id;->shape_bacground:I

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 133
    .local v1, "shape":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 134
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->makePressColor()I

    move-result v2

    invoke-super {p0, v2}, Lcom/gc/materialdesign/views/CustomView;->setBackgroundColor(I)V

    .line 135
    return-void
.end method

.method public setMax(I)V
    .registers 2
    .param p1, "max"    # I

    .prologue
    .line 94
    iput p1, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->max:I

    .line 95
    return-void
.end method

.method public setMin(I)V
    .registers 2
    .param p1, "min"    # I

    .prologue
    .line 98
    iput p1, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->min:I

    .line 99
    return-void
.end method

.method public setProgress(I)V
    .registers 11
    .param p1, "progress"    # I

    .prologue
    .line 103
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->getWidth()I

    move-result v5

    if-nez v5, :cond_9

    .line 104
    iput p1, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->pendindProgress:I

    .line 120
    :goto_8
    return-void

    .line 106
    :cond_9
    iput p1, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->progress:I

    .line 107
    iget v5, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->max:I

    if-le p1, v5, :cond_11

    .line 108
    iget p1, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->max:I

    .line 109
    :cond_11
    iget v5, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->min:I

    if-ge p1, v5, :cond_17

    .line 110
    iget p1, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->min:I

    .line 111
    :cond_17
    iget v5, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->max:I

    iget v6, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->min:I

    sub-int v4, v5, v6

    .line 112
    .local v4, "totalWidth":I
    int-to-double v5, p1

    int-to-double v7, v4

    div-double v1, v5, v7

    .line 113
    .local v1, "progressPercent":D
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->getWidth()I

    move-result v5

    int-to-double v5, v5

    mul-double/2addr v5, v1

    double-to-int v3, v5

    .line 114
    .local v3, "progressWidth":I
    iget-object v5, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->progressView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 115
    .local v0, "params":Landroid/widget/RelativeLayout$LayoutParams;
    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 116
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->getHeight()I

    move-result v5

    iput v5, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 117
    iget-object v5, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->progressView:Landroid/view/View;

    invoke-virtual {v5, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    const/4 v5, -0x1

    iput v5, p0, Lcom/gc/materialdesign/views/ProgressBarDeterminate;->pendindProgress:I

    goto :goto_8
.end method
