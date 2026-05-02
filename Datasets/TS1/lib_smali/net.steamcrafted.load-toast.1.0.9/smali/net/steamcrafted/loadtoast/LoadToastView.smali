.class public Lnet/steamcrafted/loadtoast/LoadToastView;
.super Landroid/view/View;
.source "LoadToastView.java"


# instance fields
.field private BASE_TEXT_SIZE:I

.field private IMAGE_WIDTH:I

.field private MARQUE_STEP:I

.field private MAX_TEXT_WIDTH:I

.field private TOAST_HEIGHT:I

.field private WIDTH_SCALE:F

.field private backPaint:Landroid/graphics/Paint;

.field private cmp:Lcom/nineoldandroids/animation/ValueAnimator;

.field private completeicon:Landroid/graphics/drawable/Drawable;

.field private easeinterpol:Landroid/view/animation/AccelerateDecelerateInterpolator;

.field private errorPaint:Landroid/graphics/Paint;

.field private failedicon:Landroid/graphics/drawable/Drawable;

.field private iconBackPaint:Landroid/graphics/Paint;

.field private iconBounds:Landroid/graphics/Rect;

.field private loaderPaint:Landroid/graphics/Paint;

.field private mText:Ljava/lang/String;

.field private mTextBounds:Landroid/graphics/Rect;

.field private outOfBounds:Z

.field private prevUpdate:J

.field private spinnerRect:Landroid/graphics/RectF;

.field private success:Z

.field private successPaint:Landroid/graphics/Paint;

.field private textPaint:Landroid/graphics/Paint;

.field private toastPath:Landroid/graphics/Path;

.field private va:Lcom/nineoldandroids/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, -0x1

    const/4 v4, 0x1

    .line 64
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 29
    const-string v1, ""

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mText:Ljava/lang/String;

    .line 31
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    .line 32
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->backPaint:Landroid/graphics/Paint;

    .line 33
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBackPaint:Landroid/graphics/Paint;

    .line 34
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->loaderPaint:Landroid/graphics/Paint;

    .line 35
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->successPaint:Landroid/graphics/Paint;

    .line 36
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->errorPaint:Landroid/graphics/Paint;

    .line 39
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mTextBounds:Landroid/graphics/Rect;

    .line 40
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->spinnerRect:Landroid/graphics/RectF;

    .line 42
    const/16 v1, 0x64

    iput v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    .line 43
    const/16 v1, 0x14

    iput v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->BASE_TEXT_SIZE:I

    .line 44
    const/16 v1, 0x28

    iput v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    .line 45
    const/16 v1, 0x30

    iput v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    .line 46
    const/4 v1, 0x0

    iput v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->WIDTH_SCALE:F

    .line 47
    iput v4, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MARQUE_STEP:I

    .line 49
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->prevUpdate:J

    .line 57
    iput-boolean v4, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->success:Z

    .line 58
    const/4 v1, 0x0

    iput-boolean v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->outOfBounds:Z

    .line 60
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    .line 61
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->easeinterpol:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 65
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    const/high16 v2, 0x41700000    # 15.0f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 66
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 67
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 69
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->backPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 70
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->backPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 72
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBackPaint:Landroid/graphics/Paint;

    const v2, -0xffff01

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 73
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBackPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 75
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->loaderPaint:Landroid/graphics/Paint;

    const/4 v2, 0x4

    invoke-direct {p0, v2}, Lnet/steamcrafted/loadtoast/LoadToastView;->dpToPx(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 76
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->loaderPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 77
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->loaderPaint:Landroid/graphics/Paint;

    invoke-direct {p0}, Lnet/steamcrafted/loadtoast/LoadToastView;->fetchPrimaryColor()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 78
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->loaderPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 80
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->successPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lnet/steamcrafted/loadtoast/LoadToastView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lnet/steamcrafted/loadtoast/R$color;->color_success:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 81
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->errorPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lnet/steamcrafted/loadtoast/LoadToastView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lnet/steamcrafted/loadtoast/R$color;->color_error:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 82
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->successPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 83
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->errorPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 85
    iget v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    invoke-direct {p0, v1}, Lnet/steamcrafted/loadtoast/LoadToastView;->dpToPx(I)I

    move-result v1

    iput v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    .line 86
    iget v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->BASE_TEXT_SIZE:I

    invoke-direct {p0, v1}, Lnet/steamcrafted/loadtoast/LoadToastView;->dpToPx(I)I

    move-result v1

    iput v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->BASE_TEXT_SIZE:I

    .line 87
    iget v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    invoke-direct {p0, v1}, Lnet/steamcrafted/loadtoast/LoadToastView;->dpToPx(I)I

    move-result v1

    iput v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    .line 88
    iget v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    invoke-direct {p0, v1}, Lnet/steamcrafted/loadtoast/LoadToastView;->dpToPx(I)I

    move-result v1

    iput v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    .line 89
    iget v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MARQUE_STEP:I

    invoke-direct {p0, v1}, Lnet/steamcrafted/loadtoast/LoadToastView;->dpToPx(I)I

    move-result v1

    iput v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MARQUE_STEP:I

    .line 91
    iget v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    iget v2, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    sub-int/2addr v1, v2

    div-int/lit8 v0, v1, 0x2

    .line 92
    .local v0, "padding":I
    new-instance v1, Landroid/graphics/Rect;

    iget v2, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    iget v3, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    add-int/2addr v2, v3

    sub-int/2addr v2, v0

    iget v3, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    iget v4, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    add-int/2addr v3, v4

    sub-int/2addr v3, v0

    iget v4, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    add-int/2addr v3, v4

    iget v4, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    add-int/2addr v4, v0

    invoke-direct {v1, v2, v0, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBounds:Landroid/graphics/Rect;

    .line 95
    invoke-virtual {p0}, Lnet/steamcrafted/loadtoast/LoadToastView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lnet/steamcrafted/loadtoast/R$drawable;->ic_navigation_check:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->completeicon:Landroid/graphics/drawable/Drawable;

    .line 96
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->completeicon:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 97
    invoke-virtual {p0}, Lnet/steamcrafted/loadtoast/LoadToastView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lnet/steamcrafted/loadtoast/R$drawable;->ic_error:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->failedicon:Landroid/graphics/drawable/Drawable;

    .line 98
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->failedicon:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 100
    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_18a

    invoke-static {v1}, Lcom/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->va:Lcom/nineoldandroids/animation/ValueAnimator;

    .line 101
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->va:Lcom/nineoldandroids/animation/ValueAnimator;

    const-wide/16 v2, 0x1770

    invoke-virtual {v1, v2, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 102
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->va:Lcom/nineoldandroids/animation/ValueAnimator;

    new-instance v2, Lnet/steamcrafted/loadtoast/LoadToastView$1;

    invoke-direct {v2, p0}, Lnet/steamcrafted/loadtoast/LoadToastView$1;-><init>(Lnet/steamcrafted/loadtoast/LoadToastView;)V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 109
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->va:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v1, v5}, Lcom/nineoldandroids/animation/ValueAnimator;->setRepeatMode(I)V

    .line 110
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->va:Lcom/nineoldandroids/animation/ValueAnimator;

    const v2, 0x98967f

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->setRepeatCount(I)V

    .line 111
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->va:Lcom/nineoldandroids/animation/ValueAnimator;

    new-instance v2, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 112
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->va:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 114
    invoke-direct {p0}, Lnet/steamcrafted/loadtoast/LoadToastView;->calculateBounds()V

    .line 115
    return-void

    .line 100
    :array_18a
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static synthetic access$002(Lnet/steamcrafted/loadtoast/LoadToastView;F)F
    .registers 2
    .param p0, "x0"    # Lnet/steamcrafted/loadtoast/LoadToastView;
    .param p1, "x1"    # F

    .prologue
    .line 27
    iput p1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->WIDTH_SCALE:F

    return p1
.end method

.method private calculateBounds()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 184
    iput-boolean v5, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->outOfBounds:Z

    .line 185
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->prevUpdate:J

    .line 187
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    iget v2, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->BASE_TEXT_SIZE:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 188
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mText:Ljava/lang/String;

    iget-object v3, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mText:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    iget-object v4, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mTextBounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2, v5, v3, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 189
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mTextBounds:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    iget v2, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    if-le v1, v2, :cond_61

    .line 190
    iget v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->BASE_TEXT_SIZE:I

    .line 191
    .local v0, "textSize":I
    :goto_2a
    const/16 v1, 0xd

    invoke-direct {p0, v1}, Lnet/steamcrafted/loadtoast/LoadToastView;->dpToPx(I)I

    move-result v1

    if-le v0, v1, :cond_54

    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mTextBounds:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    iget v2, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    if-le v1, v2, :cond_54

    .line 192
    add-int/lit8 v0, v0, -0x1

    .line 194
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    int-to-float v2, v0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 195
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mText:Ljava/lang/String;

    iget-object v3, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mText:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    iget-object v4, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mTextBounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2, v5, v3, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    goto :goto_2a

    .line 197
    :cond_54
    iget-object v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mTextBounds:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    iget v2, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    if-le v1, v2, :cond_61

    .line 198
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->outOfBounds:Z

    .line 208
    .end local v0    # "textSize":I
    :cond_61
    return-void
.end method

.method private done()V
    .registers 4

    .prologue
    .line 146
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_2e

    invoke-static {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->cmp:Lcom/nineoldandroids/animation/ValueAnimator;

    .line 147
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->cmp:Lcom/nineoldandroids/animation/ValueAnimator;

    const-wide/16 v1, 0x258

    invoke-virtual {v0, v1, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 148
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->cmp:Lcom/nineoldandroids/animation/ValueAnimator;

    new-instance v1, Lnet/steamcrafted/loadtoast/LoadToastView$2;

    invoke-direct {v1, p0}, Lnet/steamcrafted/loadtoast/LoadToastView$2;-><init>(Lnet/steamcrafted/loadtoast/LoadToastView;)V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 156
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->cmp:Lcom/nineoldandroids/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 157
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->cmp:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 158
    return-void

    .line 146
    nop

    :array_2e
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private dpToPx(I)I
    .registers 5
    .param p1, "dp"    # I

    .prologue
    .line 175
    const/4 v0, 0x1

    int-to-float v1, p1

    invoke-virtual {p0}, Lnet/steamcrafted/loadtoast/LoadToastView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method private fetchPrimaryColor()I
    .registers 9

    .prologue
    const/16 v5, 0x9b

    const/4 v7, 0x0

    .line 161
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_28

    .line 162
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    .line 164
    .local v2, "typedValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Lnet/steamcrafted/loadtoast/LoadToastView;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v4, v2, Landroid/util/TypedValue;->data:I

    const/4 v5, 0x1

    new-array v5, v5, [I

    const v6, 0x1010435

    aput v6, v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 165
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v7, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 167
    .local v1, "color":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 171
    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local v1    # "color":I
    .end local v2    # "typedValue":Landroid/util/TypedValue;
    :goto_27
    return v1

    :cond_28
    invoke-static {v5, v5, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    goto :goto_27
.end method

.method private measureHeight(I)I
    .registers 6
    .param p1, "measureSpec"    # I

    .prologue
    .line 347
    const/4 v0, 0x0

    .line 348
    .local v0, "result":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 349
    .local v1, "specMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 351
    .local v2, "specSize":I
    const/high16 v3, 0x40000000    # 2.0f

    if-ne v1, v3, :cond_f

    .line 353
    move v0, v2

    .line 362
    :cond_e
    :goto_e
    return v0

    .line 356
    :cond_f
    iget v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    .line 357
    const/high16 v3, -0x80000000

    if-ne v1, v3, :cond_e

    .line 359
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_e
.end method

.method private measureWidth(I)I
    .registers 7
    .param p1, "measureSpec"    # I

    .prologue
    .line 321
    const/4 v0, 0x0

    .line 322
    .local v0, "result":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 323
    .local v1, "specMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 325
    .local v2, "specSize":I
    const/high16 v3, 0x40000000    # 2.0f

    if-ne v1, v3, :cond_f

    .line 327
    move v0, v2

    .line 338
    :cond_e
    :goto_e
    return v0

    .line 331
    :cond_f
    iget v3, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    iget v4, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    add-int/2addr v3, v4

    iget v4, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    add-int v0, v3, v4

    .line 332
    const/high16 v3, -0x80000000

    if-ne v1, v3, :cond_e

    .line 334
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_e
.end method


# virtual methods
.method public error()V
    .registers 2

    .prologue
    .line 141
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->success:Z

    .line 142
    invoke-direct {p0}, Lnet/steamcrafted/loadtoast/LoadToastView;->done()V

    .line 143
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 28
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 211
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 213
    const/high16 v1, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->WIDTH_SCALE:F

    sub-float/2addr v1, v2

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v24

    .line 215
    .local v24, "ws":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->mText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1b

    const/16 v24, 0x0

    .line 217
    :cond_1b
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v1, v1, v24

    move-object/from16 v0, p0

    iget v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    move-object/from16 v0, p0

    iget v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    mul-float v23, v1, v2

    .line 218
    .local v23, "translateLoad":F
    const/high16 v1, 0x40000000    # 2.0f

    div-float v14, v23, v1

    .line 219
    .local v14, "leftMargin":F
    const/4 v1, 0x0

    const/high16 v2, 0x41200000    # 10.0f

    mul-float v2, v2, v24

    const/high16 v3, 0x41100000    # 9.0f

    sub-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v21

    .line 220
    .local v21, "textOpactity":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    const/high16 v2, 0x437f0000    # 255.0f

    mul-float v2, v2, v21

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 221
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->spinnerRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    const/4 v3, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lnet/steamcrafted/loadtoast/LoadToastView;->dpToPx(I)I

    move-result v3

    add-int/2addr v2, v3

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v23, v3

    sub-float/2addr v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    const/4 v4, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lnet/steamcrafted/loadtoast/LoadToastView;->dpToPx(I)I

    move-result v4

    add-int/2addr v3, v4

    int-to-float v3, v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    const/4 v5, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lnet/steamcrafted/loadtoast/LoadToastView;->dpToPx(I)I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float v5, v23, v5

    sub-float/2addr v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBounds:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    const/4 v6, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lnet/steamcrafted/loadtoast/LoadToastView;->dpToPx(I)I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 224
    move-object/from16 v0, p0

    iget v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    mul-int/lit8 v1, v1, 0x2

    int-to-double v1, v1

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v3, v5

    mul-double/2addr v1, v3

    const-wide/high16 v3, 0x4008000000000000L    # 3.0

    div-double/2addr v1, v3

    double-to-int v8, v1

    .line 225
    .local v8, "circleOffset":I
    move-object/from16 v0, p0

    iget v0, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    move/from16 v22, v0

    .line 226
    .local v22, "th":I
    move-object/from16 v0, p0

    iget v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    move-object/from16 v0, p0

    iget v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    sub-int/2addr v1, v2

    div-int/lit8 v16, v1, 0x2

    .line 227
    .local v16, "pd":I
    move-object/from16 v0, p0

    iget v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    mul-int/lit8 v1, v1, 0x2

    int-to-double v1, v1

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v3, v5

    mul-double/2addr v1, v3

    const-wide/high16 v3, 0x4008000000000000L    # 3.0

    div-double/2addr v1, v3

    double-to-int v12, v1

    .line 228
    .local v12, "iconoffset":I
    move-object/from16 v0, p0

    iget v13, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    .line 230
    .local v13, "iw":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 231
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    div-int/lit8 v2, v22, 0x2

    int-to-float v2, v2

    add-float/2addr v2, v14

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 232
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    move-object/from16 v0, p0

    iget v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    mul-float v2, v2, v24

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 233
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    int-to-float v2, v8

    const/4 v3, 0x0

    div-int/lit8 v4, v22, 0x2

    int-to-float v4, v4

    div-int/lit8 v5, v22, 0x2

    sub-int/2addr v5, v8

    int-to-float v5, v5

    div-int/lit8 v6, v22, 0x2

    int-to-float v6, v6

    div-int/lit8 v7, v22, 0x2

    int-to-float v7, v7

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 235
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    move/from16 v0, v16

    neg-int v2, v0

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 236
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    const/4 v2, 0x0

    neg-int v3, v12

    int-to-float v3, v3

    neg-int v4, v13

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v12

    int-to-float v4, v4

    neg-int v5, v13

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    neg-int v6, v13

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    neg-int v7, v13

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 237
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    neg-int v2, v12

    int-to-float v2, v2

    const/4 v3, 0x0

    neg-int v4, v13

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    div-int/lit8 v5, v13, 0x2

    sub-int/2addr v5, v12

    int-to-float v5, v5

    neg-int v6, v13

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    div-int/lit8 v7, v13, 0x2

    int-to-float v7, v7

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 238
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    const/4 v2, 0x0

    int-to-float v3, v12

    div-int/lit8 v4, v13, 0x2

    sub-int/2addr v4, v12

    int-to-float v4, v4

    div-int/lit8 v5, v13, 0x2

    int-to-float v5, v5

    div-int/lit8 v6, v13, 0x2

    int-to-float v6, v6

    div-int/lit8 v7, v13, 0x2

    int-to-float v7, v7

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 239
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    int-to-float v2, v12

    const/4 v3, 0x0

    div-int/lit8 v4, v13, 0x2

    int-to-float v4, v4

    neg-int v5, v13

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v5, v12

    int-to-float v5, v5

    div-int/lit8 v6, v13, 0x2

    int-to-float v6, v6

    neg-int v7, v13

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 240
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    move/from16 v0, v16

    int-to-float v2, v0

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 242
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    const/4 v2, 0x0

    int-to-float v3, v8

    div-int/lit8 v4, v22, 0x2

    sub-int v4, v8, v4

    int-to-float v4, v4

    div-int/lit8 v5, v22, 0x2

    int-to-float v5, v5

    move/from16 v0, v22

    neg-int v6, v0

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    div-int/lit8 v7, v22, 0x2

    int-to-float v7, v7

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 243
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->IMAGE_WIDTH:I

    neg-int v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    mul-float v2, v2, v24

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 244
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    neg-int v2, v8

    int-to-float v2, v2

    const/4 v3, 0x0

    move/from16 v0, v22

    neg-int v4, v0

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    move/from16 v0, v22

    neg-int v5, v0

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v5, v8

    int-to-float v5, v5

    move/from16 v0, v22

    neg-int v6, v0

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    move/from16 v0, v22

    neg-int v7, v0

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 245
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    const/4 v2, 0x0

    neg-int v3, v8

    int-to-float v3, v3

    neg-int v4, v8

    div-int/lit8 v5, v22, 0x2

    add-int/2addr v4, v5

    int-to-float v4, v4

    move/from16 v0, v22

    neg-int v5, v0

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    div-int/lit8 v6, v22, 0x2

    int-to-float v6, v6

    move/from16 v0, v22

    neg-int v7, v0

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 247
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->spinnerRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->spinnerRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBounds:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    const v4, 0x3ff33333    # 1.9f

    div-float/2addr v3, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->backPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 249
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->backPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 251
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->va:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v1

    const/high16 v2, 0x40c00000    # 6.0f

    mul-float v17, v1, v2

    .line 252
    .local v17, "prog":F
    const/high16 v1, 0x40000000    # 2.0f

    rem-float v19, v17, v1

    .line 253
    .local v19, "progrot":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->easeinterpol:Landroid/view/animation/AccelerateDecelerateInterpolator;

    const/high16 v2, 0x40400000    # 3.0f

    rem-float v2, v17, v2

    const/high16 v3, 0x40400000    # 3.0f

    div-float/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;->getInterpolation(F)F

    move-result v1

    const/high16 v2, 0x40400000    # 3.0f

    mul-float/2addr v1, v2

    const/high16 v2, 0x3f400000    # 0.75f

    sub-float v18, v1, v2

    .line 254
    .local v18, "proglength":F
    const/high16 v1, 0x3f400000    # 0.75f

    cmpl-float v1, v18, v1

    if-lez v1, :cond_272

    .line 255
    const/high16 v1, 0x3f400000    # 0.75f

    const/high16 v2, 0x40400000    # 3.0f

    rem-float v2, v17, v2

    const/high16 v3, 0x3fc00000    # 1.5f

    sub-float/2addr v2, v3

    sub-float v18, v1, v2

    .line 256
    const/high16 v1, 0x40400000    # 3.0f

    rem-float v1, v17, v1

    const/high16 v2, 0x3fc00000    # 1.5f

    sub-float/2addr v1, v2

    const/high16 v2, 0x3fc00000    # 1.5f

    div-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v1, v2

    add-float v19, v19, v1

    .line 260
    :cond_272
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 262
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->mText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_28f

    .line 263
    const/high16 v1, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->WIDTH_SCALE:F

    sub-float/2addr v1, v2

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v24

    .line 266
    :cond_28f
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->spinnerRect:Landroid/graphics/RectF;

    const/high16 v3, 0x43340000    # 180.0f

    mul-float v3, v3, v19

    const v4, 0x43855555

    mul-float v4, v4, v18

    const/high16 v5, 0x3f800000    # 1.0f

    add-float/2addr v4, v5

    const/high16 v5, 0x440c0000    # 560.0f

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float v6, v6, v24

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    const v5, 0x43b3fffd    # 359.9999f

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 267
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->loaderPaint:Landroid/graphics/Paint;

    const/high16 v2, 0x437f0000    # 255.0f

    mul-float v2, v2, v24

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 268
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->toastPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->loaderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 270
    move-object/from16 v0, p0

    iget v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->WIDTH_SCALE:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_3b0

    .line 271
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->success:Z

    if-eqz v1, :cond_3a5

    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->completeicon:Landroid/graphics/drawable/Drawable;

    .line 272
    .local v11, "icon":Landroid/graphics/drawable/Drawable;
    :goto_2e2
    move-object/from16 v0, p0

    iget v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->WIDTH_SCALE:F

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v9, v1, v2

    .line 273
    .local v9, "circleProg":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    const/high16 v2, 0x43000000    # 128.0f

    mul-float/2addr v2, v9

    const/high16 v3, 0x42fe0000    # 127.0f

    add-float/2addr v2, v3

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 274
    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, 0x3e800000    # 0.25f

    const/high16 v3, 0x3f400000    # 0.75f

    mul-float/2addr v3, v9

    add-float/2addr v2, v3

    sub-float/2addr v1, v2

    move-object/from16 v0, p0

    iget v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    int-to-float v2, v2

    mul-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    float-to-int v15, v1

    .line 275
    .local v15, "paddingicon":I
    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v9

    move-object/from16 v0, p0

    iget v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    int-to-float v2, v2

    mul-float/2addr v1, v2

    const/high16 v2, 0x41000000    # 8.0f

    div-float/2addr v1, v2

    float-to-int v10, v1

    .line 276
    .local v10, "completeoff":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->spinnerRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    float-to-int v1, v1

    add-int/2addr v1, v15

    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->spinnerRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    float-to-int v2, v2

    add-int/2addr v2, v15

    add-int/2addr v2, v10

    move-object/from16 v0, p0

    iget-object v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->spinnerRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    float-to-int v3, v3

    sub-int/2addr v3, v15

    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->spinnerRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    float-to-int v4, v4

    sub-int/2addr v4, v15

    add-int/2addr v4, v10

    invoke-virtual {v11, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 277
    move-object/from16 v0, p0

    iget v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    add-float v2, v14, v1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v9

    move-object/from16 v0, p0

    iget v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    int-to-float v3, v3

    mul-float/2addr v1, v3

    const/high16 v3, 0x41000000    # 8.0f

    div-float/2addr v1, v3

    move-object/from16 v0, p0

    iget v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    add-float/2addr v3, v1

    const/high16 v1, 0x3e800000    # 0.25f

    const/high16 v4, 0x3f400000    # 0.75f

    mul-float/2addr v4, v9

    add-float/2addr v1, v4

    move-object/from16 v0, p0

    iget v4, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    int-to-float v4, v4

    mul-float/2addr v1, v4

    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, v1, v4

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->success:Z

    if-eqz v1, :cond_3ab

    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->successPaint:Landroid/graphics/Paint;

    :goto_374
    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 279
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 280
    const/high16 v1, 0x42b40000    # 90.0f

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v2, v9

    mul-float/2addr v1, v2

    move-object/from16 v0, p0

    iget v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    add-float/2addr v2, v14

    move-object/from16 v0, p0

    iget v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 281
    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 282
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 284
    const-wide/16 v1, 0x0

    move-object/from16 v0, p0

    iput-wide v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->prevUpdate:J

    .line 307
    .end local v9    # "circleProg":F
    .end local v10    # "completeoff":I
    .end local v11    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v15    # "paddingicon":I
    :goto_3a4
    return-void

    .line 271
    :cond_3a5
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->failedicon:Landroid/graphics/drawable/Drawable;

    goto/16 :goto_2e2

    .line 277
    .restart local v9    # "circleProg":F
    .restart local v10    # "completeoff":I
    .restart local v11    # "icon":Landroid/graphics/drawable/Drawable;
    .restart local v15    # "paddingicon":I
    :cond_3ab
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->errorPaint:Landroid/graphics/Paint;

    goto :goto_374

    .line 288
    .end local v9    # "circleProg":F
    .end local v10    # "completeoff":I
    .end local v11    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v15    # "paddingicon":I
    :cond_3b0
    div-int/lit8 v1, v22, 0x2

    int-to-float v1, v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->descent()F

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->ascent()F

    move-result v3

    add-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    sub-float/2addr v1, v2

    float-to-int v0, v1

    move/from16 v25, v0

    .line 290
    .local v25, "yPos":I
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->outOfBounds:Z

    if-eqz v1, :cond_443

    .line 291
    const/16 v20, 0x0

    .line 292
    .local v20, "shift":F
    move-object/from16 v0, p0

    iget-wide v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->prevUpdate:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_414

    .line 293
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    move-object/from16 v0, p0

    iput-wide v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->prevUpdate:J

    .line 301
    :cond_3e5
    :goto_3e5
    div-int/lit8 v1, v22, 0x2

    const/4 v2, 0x0

    div-int/lit8 v3, v22, 0x2

    move-object/from16 v0, p0

    iget v4, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    add-int/2addr v3, v4

    move-object/from16 v0, p0

    iget v4, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->TOAST_HEIGHT:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 302
    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->mText:Ljava/lang/String;

    div-int/lit8 v2, v22, 0x2

    int-to-float v2, v2

    sub-float v2, v2, v20

    move-object/from16 v0, p0

    iget v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    int-to-float v3, v3

    add-float/2addr v2, v3

    move/from16 v0, v25

    int-to-float v3, v0

    move-object/from16 v0, p0

    iget-object v4, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_3a4

    .line 295
    :cond_414
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    move-object/from16 v0, p0

    iget-wide v3, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->prevUpdate:J

    sub-long/2addr v1, v3

    long-to-float v1, v1

    const/high16 v2, 0x41800000    # 16.0f

    div-float/2addr v1, v2

    move-object/from16 v0, p0

    iget v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->MARQUE_STEP:I

    int-to-float v2, v2

    mul-float v20, v1, v2

    .line 297
    move-object/from16 v0, p0

    iget v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    int-to-float v1, v1

    sub-float v1, v20, v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->mTextBounds:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_3e5

    .line 298
    const-wide/16 v1, 0x0

    move-object/from16 v0, p0

    iput-wide v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->prevUpdate:J

    goto :goto_3e5

    .line 304
    .end local v20    # "shift":F
    :cond_443
    move-object/from16 v0, p0

    iget-object v2, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->mText:Ljava/lang/String;

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v1, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->mText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v1, v22, 0x2

    move-object/from16 v0, p0

    iget v5, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->MAX_TEXT_WIDTH:I

    move-object/from16 v0, p0

    iget-object v6, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->mTextBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    sub-int/2addr v5, v6

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v1, v5

    int-to-float v5, v1

    move/from16 v0, v25

    int-to-float v6, v0

    move-object/from16 v0, p0

    iget-object v7, v0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    goto/16 :goto_3a4
.end method

.method protected onMeasure(II)V
    .registers 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 311
    invoke-direct {p0, p1}, Lnet/steamcrafted/loadtoast/LoadToastView;->measureWidth(I)I

    move-result v0

    invoke-direct {p0, p2}, Lnet/steamcrafted/loadtoast/LoadToastView;->measureHeight(I)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lnet/steamcrafted/loadtoast/LoadToastView;->setMeasuredDimension(II)V

    .line 313
    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 122
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->backPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 123
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->iconBackPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 124
    return-void
.end method

.method public setProgressColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 127
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->loaderPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 128
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 179
    iput-object p1, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->mText:Ljava/lang/String;

    .line 180
    invoke-direct {p0}, Lnet/steamcrafted/loadtoast/LoadToastView;->calculateBounds()V

    .line 181
    return-void
.end method

.method public setTextColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 118
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 119
    return-void
.end method

.method public show()V
    .registers 2

    .prologue
    .line 131
    const/4 v0, 0x0

    iput v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->WIDTH_SCALE:F

    .line 132
    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->cmp:Lcom/nineoldandroids/animation/ValueAnimator;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->cmp:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 133
    :cond_c
    return-void
.end method

.method public success()V
    .registers 2

    .prologue
    .line 136
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnet/steamcrafted/loadtoast/LoadToastView;->success:Z

    .line 137
    invoke-direct {p0}, Lnet/steamcrafted/loadtoast/LoadToastView;->done()V

    .line 138
    return-void
.end method
