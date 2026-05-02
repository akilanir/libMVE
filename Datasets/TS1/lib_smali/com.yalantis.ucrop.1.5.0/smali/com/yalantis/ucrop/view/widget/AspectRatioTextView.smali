.class public Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;
.super Landroid/widget/TextView;
.source "AspectRatioTextView.java"


# instance fields
.field private mAspectRatio:F

.field private mAspectRatioTitle:Ljava/lang/String;

.field private mAspectRatioX:F

.field private mAspectRatioY:F

.field private final mCanvasClipBounds:Landroid/graphics/Rect;

.field private mDotPaint:Landroid/graphics/Paint;

.field private mDotSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mCanvasClipBounds:Landroid/graphics/Rect;

    .line 45
    sget-object v1, Lcom/yalantis/ucrop/R$styleable;->ucrop_AspectRatioTextView:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 46
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-direct {p0, v0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->init(Landroid/content/res/TypedArray;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 27
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mCanvasClipBounds:Landroid/graphics/Rect;

    .line 52
    sget-object v1, Lcom/yalantis/ucrop/R$styleable;->ucrop_AspectRatioTextView:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 53
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-direct {p0, v0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->init(Landroid/content/res/TypedArray;)V

    .line 54
    return-void
.end method

.method private applyActiveColor(I)V
    .registers 9
    .param p1, "activeColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 111
    iget-object v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mDotPaint:Landroid/graphics/Paint;

    if-eqz v1, :cond_c

    .line 112
    iget-object v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mDotPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 114
    :cond_c
    new-instance v0, Landroid/content/res/ColorStateList;

    new-array v1, v6, [[I

    new-array v2, v5, [I

    const v3, 0x10100a1

    aput v3, v2, v4

    aput-object v2, v1, v4

    new-array v2, v5, [I

    aput v4, v2, v4

    aput-object v2, v1, v5

    new-array v2, v6, [I

    aput p1, v2, v4

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/yalantis/ucrop/R$color;->ucrop_color_widget:I

    invoke-static {v3, v4}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v2, v5

    invoke-direct {v0, v1, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 125
    .local v0, "textViewColorStateList":Landroid/content/res/ColorStateList;
    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 126
    return-void
.end method

.method private init(Landroid/content/res/TypedArray;)V
    .registers 6
    .param p1, "a"    # Landroid/content/res/TypedArray;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 86
    invoke-virtual {p0, v3}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->setGravity(I)V

    .line 88
    sget v1, Lcom/yalantis/ucrop/R$styleable;->ucrop_AspectRatioTextView_ucrop_artv_ratio_title:I

    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioTitle:Ljava/lang/String;

    .line 89
    sget v1, Lcom/yalantis/ucrop/R$styleable;->ucrop_AspectRatioTextView_ucrop_artv_ratio_x:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioX:F

    .line 90
    sget v1, Lcom/yalantis/ucrop/R$styleable;->ucrop_AspectRatioTextView_ucrop_artv_ratio_y:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioY:F

    .line 92
    iget v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioX:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_29

    iget v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioY:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_5d

    .line 93
    :cond_29
    iput v2, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatio:F

    .line 98
    :goto_2b
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/yalantis/ucrop/R$dimen;->ucrop_size_dot_scale_text_view:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mDotSize:I

    .line 99
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mDotPaint:Landroid/graphics/Paint;

    .line 100
    iget-object v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mDotPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 102
    invoke-direct {p0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->setTitle()V

    .line 104
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/yalantis/ucrop/R$color;->ucrop_color_widget_active:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 105
    .local v0, "activeColor":I
    invoke-direct {p0, v0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->applyActiveColor(I)V

    .line 107
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 108
    return-void

    .line 95
    .end local v0    # "activeColor":I
    :cond_5d
    iget v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioX:F

    iget v2, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioY:F

    div-float/2addr v1, v2

    iput v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatio:F

    goto :goto_2b
.end method

.method private setTitle()V
    .registers 5

    .prologue
    .line 139
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioTitle:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 140
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioTitle:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    :goto_d
    return-void

    .line 142
    :cond_e
    const-string v0, "%d:%d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioX:F

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioY:F

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_d
.end method

.method private toggleAspectRatio()V
    .registers 4

    .prologue
    .line 129
    iget v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatio:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_16

    .line 130
    iget v0, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioX:F

    .line 131
    .local v0, "tempRatioW":F
    iget v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioY:F

    iput v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioX:F

    .line 132
    iput v0, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioY:F

    .line 134
    iget v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioX:F

    iget v2, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatioY:F

    div-float/2addr v1, v2

    iput v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatio:F

    .line 136
    .end local v0    # "tempRatioW":F
    :cond_16
    return-void
.end method


# virtual methods
.method public getAspectRatio(Z)F
    .registers 3
    .param p1, "toggleRatio"    # Z

    .prologue
    .line 66
    if-eqz p1, :cond_8

    .line 67
    invoke-direct {p0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->toggleAspectRatio()V

    .line 68
    invoke-direct {p0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->setTitle()V

    .line 70
    :cond_8
    iget v0, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mAspectRatio:F

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 75
    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 77
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 78
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mCanvasClipBounds:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    .line 79
    iget-object v0, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mCanvasClipBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    iget-object v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mCanvasClipBounds:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mCanvasClipBounds:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    iget v2, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mDotSize:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mDotSize:I

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->mDotPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 82
    :cond_2d
    return-void
.end method

.method public setActiveColor(I)V
    .registers 2
    .param p1, "activeColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->applyActiveColor(I)V

    .line 62
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/widget/AspectRatioTextView;->invalidate()V

    .line 63
    return-void
.end method
