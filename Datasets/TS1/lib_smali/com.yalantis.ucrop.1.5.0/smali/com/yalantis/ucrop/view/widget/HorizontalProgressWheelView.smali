.class public Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;
.super Landroid/view/View;
.source "HorizontalProgressWheelView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;
    }
.end annotation


# instance fields
.field private final mCanvasClipBounds:Landroid/graphics/Rect;

.field private mLastTouchedPosition:F

.field private mMiddleLineColor:I

.field private mProgressLineHeight:I

.field private mProgressLineMargin:I

.field private mProgressLinePaint:Landroid/graphics/Paint;

.field private mProgressLineWidth:I

.field private mScrollStarted:Z

.field private mScrollingListener:Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;

.field private mTotalScrollDistance:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 45
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    .line 46
    invoke-direct {p0}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->init()V

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 22
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    .line 52
    return-void
.end method

.method private init()V
    .registers 3

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/yalantis/ucrop/R$color;->ucrop_color_progress_wheel_line:I

    invoke-static {v0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mMiddleLineColor:I

    .line 132
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/yalantis/ucrop/R$dimen;->ucrop_width_horizontal_wheel_progress_line:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineWidth:I

    .line 133
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/yalantis/ucrop/R$dimen;->ucrop_height_horizontal_wheel_progress_line:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineHeight:I

    .line 134
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/yalantis/ucrop/R$dimen;->ucrop_margin_horizontal_wheel_progress_line:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineMargin:I

    .line 136
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLinePaint:Landroid/graphics/Paint;

    .line 137
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLinePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 138
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLinePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 140
    return-void
.end method

.method private onScrollEvent(Landroid/view/MotionEvent;F)V
    .registers 6
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "distance"    # F

    .prologue
    .line 121
    iget v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mTotalScrollDistance:F

    sub-float/2addr v0, p2

    iput v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mTotalScrollDistance:F

    .line 122
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->postInvalidate()V

    .line 123
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mLastTouchedPosition:F

    .line 124
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mScrollingListener:Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;

    if-eqz v0, :cond_1a

    .line 125
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mScrollingListener:Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;

    neg-float v1, p2

    iget v2, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mTotalScrollDistance:F

    invoke-interface {v0, v1, v2}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;->onScroll(FF)V

    .line 127
    :cond_1a
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v11, 0x437f0000    # 255.0f

    const/high16 v10, 0x40800000    # 4.0f

    const/high16 v9, 0x40000000    # 2.0f

    .line 93
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 94
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    .line 96
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineWidth:I

    iget v2, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineMargin:I

    add-int/2addr v1, v2

    div-int v8, v0, v1

    .line 97
    .local v8, "linesCount":I
    iget v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mTotalScrollDistance:F

    iget v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineMargin:I

    iget v2, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineWidth:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    rem-float v6, v0, v1

    .line 99
    .local v6, "deltaX":F
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLinePaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/yalantis/ucrop/R$color;->ucrop_color_progress_wheel_line:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 100
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_35
    if-ge v7, v8, :cond_a4

    .line 101
    div-int/lit8 v0, v8, 0x4

    if-ge v7, v0, :cond_87

    .line 102
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLinePaint:Landroid/graphics/Paint;

    int-to-float v1, v7

    div-int/lit8 v2, v8, 0x4

    int-to-float v2, v2

    div-float/2addr v1, v2

    mul-float/2addr v1, v11

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 108
    :goto_47
    neg-float v0, v6

    iget-object v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    iget v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineWidth:I

    iget v2, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineMargin:I

    add-int/2addr v1, v2

    mul-int/2addr v1, v7

    int-to-float v1, v1

    add-float/2addr v1, v0

    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    int-to-float v0, v0

    iget v2, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineHeight:I

    int-to-float v2, v2

    div-float/2addr v2, v10

    sub-float v2, v0, v2

    neg-float v0, v6

    iget-object v3, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    add-float/2addr v0, v3

    iget v3, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineWidth:I

    iget v4, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineMargin:I

    add-int/2addr v3, v4

    mul-int/2addr v3, v7

    int-to-float v3, v3

    add-float/2addr v3, v0

    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    int-to-float v0, v0

    iget v4, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineHeight:I

    int-to-float v4, v4

    div-float/2addr v4, v10

    add-float/2addr v4, v0

    iget-object v5, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLinePaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 100
    add-int/lit8 v7, v7, 0x1

    goto :goto_35

    .line 103
    :cond_87
    mul-int/lit8 v0, v8, 0x3

    div-int/lit8 v0, v0, 0x4

    if-le v7, v0, :cond_9c

    .line 104
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLinePaint:Landroid/graphics/Paint;

    sub-int v1, v8, v7

    int-to-float v1, v1

    div-int/lit8 v2, v8, 0x4

    int-to-float v2, v2

    div-float/2addr v1, v2

    mul-float/2addr v1, v11

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_47

    .line 106
    :cond_9c
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLinePaint:Landroid/graphics/Paint;

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_47

    .line 115
    :cond_a4
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLinePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mMiddleLineColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 116
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    int-to-float v1, v0

    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    int-to-float v0, v0

    iget v2, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineHeight:I

    int-to-float v2, v2

    div-float/2addr v2, v9

    sub-float v2, v0, v2

    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    int-to-float v3, v0

    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mCanvasClipBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    int-to-float v0, v0

    iget v4, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLineHeight:I

    int-to-float v4, v4

    div-float/2addr v4, v9

    add-float/2addr v4, v0

    iget-object v5, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mProgressLinePaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 118
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    .line 65
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_3e

    .line 88
    :cond_8
    :goto_8
    return v3

    .line 67
    :pswitch_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mLastTouchedPosition:F

    goto :goto_8

    .line 70
    :pswitch_10
    iget-object v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mScrollingListener:Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;

    if-eqz v1, :cond_8

    .line 71
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mScrollStarted:Z

    .line 72
    iget-object v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mScrollingListener:Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;

    invoke-interface {v1}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;->onScrollEnd()V

    goto :goto_8

    .line 76
    :pswitch_1d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iget v2, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mLastTouchedPosition:F

    sub-float v0, v1, v2

    .line 77
    .local v0, "distance":F
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_8

    .line 78
    iget-boolean v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mScrollStarted:Z

    if-nez v1, :cond_39

    .line 79
    iput-boolean v3, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mScrollStarted:Z

    .line 80
    iget-object v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mScrollingListener:Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;

    if-eqz v1, :cond_39

    .line 81
    iget-object v1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mScrollingListener:Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;

    invoke-interface {v1}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;->onScrollStart()V

    .line 84
    :cond_39
    invoke-direct {p0, p1, v0}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->onScrollEvent(Landroid/view/MotionEvent;F)V

    goto :goto_8

    .line 65
    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_9
        :pswitch_10
        :pswitch_1d
    .end packed-switch
.end method

.method public setMiddleLineColor(I)V
    .registers 2
    .param p1, "middleLineColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 59
    iput p1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mMiddleLineColor:I

    .line 60
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->invalidate()V

    .line 61
    return-void
.end method

.method public setScrollingListener(Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;)V
    .registers 2
    .param p1, "scrollingListener"    # Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView;->mScrollingListener:Lcom/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener;

    .line 56
    return-void
.end method
