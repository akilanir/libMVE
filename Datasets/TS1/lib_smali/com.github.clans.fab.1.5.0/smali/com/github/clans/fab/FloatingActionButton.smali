.class public Lcom/github/clans/fab/FloatingActionButton;
.super Landroid/widget/ImageButton;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;,
        Lcom/github/clans/fab/FloatingActionButton$Shadow;,
        Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;
    }
.end annotation


# static fields
.field private static final BAR_MAX_LENGTH:I = 0x10e

.field private static final BAR_SPIN_CYCLE_TIME:D = 500.0

.field private static final PAUSE_GROWING_TIME:J = 0xc8L

.field private static final PORTER_DUFF_CLEAR:Landroid/graphics/Xfermode;

.field public static final SIZE_MINI:I = 0x1

.field public static final SIZE_NORMAL:I


# instance fields
.field private mAnimateProgress:Z

.field private mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mBackgroundPaint:Landroid/graphics/Paint;

.field private mBarExtraLength:F

.field private mBarGrowingFromFront:Z

.field private mBarLength:I

.field private mButtonPositionSaved:Z

.field private mClickListener:Landroid/view/View$OnClickListener;

.field private mColorNormal:I

.field private mColorPressed:I

.field private mColorRipple:I

.field private mCurrentProgress:F

.field mFabSize:I

.field mGestureDetector:Landroid/view/GestureDetector;

.field private mHideAnimation:Landroid/view/animation/Animation;

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private mIconSize:I

.field private mLabelText:Ljava/lang/String;

.field private mLastTimeAnimated:J

.field private mOriginalX:F

.field private mOriginalY:F

.field private mPausedTimeWithoutGrowing:J

.field private mProgress:I

.field private mProgressBackgroundColor:I

.field private mProgressBarEnabled:Z

.field private mProgressCircleBounds:Landroid/graphics/RectF;

.field private mProgressColor:I

.field private mProgressIndeterminate:Z

.field private mProgressMax:I

.field private mProgressPaint:Landroid/graphics/Paint;

.field private mProgressWidth:I

.field mShadowColor:I

.field mShadowRadius:I

.field mShadowXOffset:I

.field mShadowYOffset:I

.field private mShouldProgressIndeterminate:Z

.field private mShouldSetProgress:Z

.field private mShouldUpdateButtonPosition:Z

.field private mShowAnimation:Landroid/view/animation/Animation;

.field private mShowProgressBackground:Z

.field mShowShadow:Z

.field private mSpinSpeed:F

.field private mTargetProgress:F

.field private mTimeStartGrowing:D

.field private mUsingElevation:Z

.field private mUsingElevationCompat:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 51
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    sput-object v0, Lcom/github/clans/fab/FloatingActionButton;->PORTER_DUFF_CLEAR:Landroid/graphics/Xfermode;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 99
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/github/clans/fab/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/github/clans/fab/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 104
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/high16 v3, -0x40800000    # -1.0f

    const/4 v2, 0x1

    .line 107
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x40800000    # 4.0f

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    .line 48
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    .line 49
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x40400000    # 3.0f

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    .line 60
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mIconSize:I

    .line 71
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    .line 75
    iput v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalX:F

    .line 76
    iput v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalY:F

    .line 78
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressCircleBounds:Landroid/graphics/RectF;

    .line 79
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 80
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressPaint:Landroid/graphics/Paint;

    .line 83
    const/high16 v0, 0x43430000    # 195.0f

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mSpinSpeed:F

    .line 84
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mPausedTimeWithoutGrowing:J

    .line 86
    iput-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarGrowingFromFront:Z

    .line 87
    const/16 v0, 0x10

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarLength:I

    .line 95
    const/16 v0, 0x64

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressMax:I

    .line 559
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/github/clans/fab/FloatingActionButton$2;

    invoke-direct {v2, p0}, Lcom/github/clans/fab/FloatingActionButton$2;-><init>(Lcom/github/clans/fab/FloatingActionButton;)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mGestureDetector:Landroid/view/GestureDetector;

    .line 108
    invoke-direct {p0, p1, p2, p3}, Lcom/github/clans/fab/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 109
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/high16 v3, -0x40800000    # -1.0f

    const/4 v2, 0x1

    .line 113
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 47
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x40800000    # 4.0f

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    .line 48
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    .line 49
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x40400000    # 3.0f

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    .line 60
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mIconSize:I

    .line 71
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {v0, v1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    .line 75
    iput v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalX:F

    .line 76
    iput v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalY:F

    .line 78
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressCircleBounds:Landroid/graphics/RectF;

    .line 79
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 80
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressPaint:Landroid/graphics/Paint;

    .line 83
    const/high16 v0, 0x43430000    # 195.0f

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mSpinSpeed:F

    .line 84
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mPausedTimeWithoutGrowing:J

    .line 86
    iput-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarGrowingFromFront:Z

    .line 87
    const/16 v0, 0x10

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarLength:I

    .line 95
    const/16 v0, 0x64

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressMax:I

    .line 559
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/github/clans/fab/FloatingActionButton$2;

    invoke-direct {v2, p0}, Lcom/github/clans/fab/FloatingActionButton$2;-><init>(Lcom/github/clans/fab/FloatingActionButton;)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mGestureDetector:Landroid/view/GestureDetector;

    .line 114
    invoke-direct {p0, p1, p2, p3}, Lcom/github/clans/fab/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 115
    return-void
.end method

.method static synthetic access$1000(Lcom/github/clans/fab/FloatingActionButton;)F
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateCenterX()F

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lcom/github/clans/fab/FloatingActionButton;)F
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateCenterY()F

    move-result v0

    return v0
.end method

.method static synthetic access$1300(Lcom/github/clans/fab/FloatingActionButton;)Landroid/view/View$OnClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mClickListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/github/clans/fab/FloatingActionButton;)Z
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBarEnabled:Z

    return v0
.end method

.method static synthetic access$300(Lcom/github/clans/fab/FloatingActionButton;)I
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 39
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    return v0
.end method

.method static synthetic access$400(Lcom/github/clans/fab/FloatingActionButton;)I
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateMeasuredWidth()I

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/github/clans/fab/FloatingActionButton;)I
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateMeasuredHeight()I

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/github/clans/fab/FloatingActionButton;)I
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 39
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorNormal:I

    return v0
.end method

.method static synthetic access$700()Landroid/graphics/Xfermode;
    .registers 1

    .prologue
    .line 39
    sget-object v0, Lcom/github/clans/fab/FloatingActionButton;->PORTER_DUFF_CLEAR:Landroid/graphics/Xfermode;

    return-object v0
.end method

.method static synthetic access$800(Lcom/github/clans/fab/FloatingActionButton;)I
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getCircleSize()I

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lcom/github/clans/fab/FloatingActionButton;)Z
    .registers 2
    .param p0, "x0"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowProgressBackground:Z

    return v0
.end method

.method private calculateCenterX()F
    .registers 2

    .prologue
    .line 214
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    return v0
.end method

.method private calculateCenterY()F
    .registers 2

    .prologue
    .line 218
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getMeasuredHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    return v0
.end method

.method private calculateMeasuredHeight()I
    .registers 4

    .prologue
    .line 190
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getCircleSize()I

    move-result v1

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateShadowHeight()I

    move-result v2

    add-int v0, v1, v2

    .line 191
    .local v0, "height":I
    iget-boolean v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBarEnabled:Z

    if-eqz v1, :cond_13

    .line 192
    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    .line 194
    :cond_13
    return v0
.end method

.method private calculateMeasuredWidth()I
    .registers 4

    .prologue
    .line 182
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getCircleSize()I

    move-result v1

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateShadowWidth()I

    move-result v2

    add-int v0, v1, v2

    .line 183
    .local v0, "width":I
    iget-boolean v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBarEnabled:Z

    if-eqz v1, :cond_13

    .line 184
    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    .line 186
    :cond_13
    return v0
.end method

.method private createCircleDrawable(I)Landroid/graphics/drawable/Drawable;
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 421
    new-instance v0, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;

    new-instance v1, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v1}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;-><init>(Lcom/github/clans/fab/FloatingActionButton;Landroid/graphics/drawable/shapes/Shape;Lcom/github/clans/fab/FloatingActionButton$1;)V

    .line 422
    .local v0, "shapeDrawable":Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;
    invoke-virtual {v0}, Lcom/github/clans/fab/FloatingActionButton$CircleDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 423
    return-object v0
.end method

.method private createFillDrawable()Landroid/graphics/drawable/Drawable;
    .registers 9
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 398
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 399
    .local v0, "drawable":Landroid/graphics/drawable/StateListDrawable;
    new-array v2, v7, [I

    const v3, 0x10100a7

    aput v3, v2, v6

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorPressed:I

    invoke-direct {p0, v3}, Lcom/github/clans/fab/FloatingActionButton;->createCircleDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 400
    new-array v2, v6, [I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorNormal:I

    invoke-direct {p0, v3}, Lcom/github/clans/fab/FloatingActionButton;->createCircleDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 402
    invoke-static {}, Lcom/github/clans/fab/Util;->hasLollipop()Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 403
    new-instance v1, Landroid/graphics/drawable/RippleDrawable;

    new-instance v2, Landroid/content/res/ColorStateList;

    new-array v3, v7, [[I

    new-array v4, v6, [I

    aput-object v4, v3, v6

    new-array v4, v7, [I

    iget v5, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorRipple:I

    aput v5, v4, v6

    invoke-direct {v2, v3, v4}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 405
    .local v1, "ripple":Landroid/graphics/drawable/RippleDrawable;
    new-instance v2, Lcom/github/clans/fab/FloatingActionButton$1;

    invoke-direct {v2, p0}, Lcom/github/clans/fab/FloatingActionButton$1;-><init>(Lcom/github/clans/fab/FloatingActionButton;)V

    invoke-virtual {p0, v2}, Lcom/github/clans/fab/FloatingActionButton;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 411
    invoke-virtual {p0, v7}, Lcom/github/clans/fab/FloatingActionButton;->setClipToOutline(Z)V

    .line 412
    iput-object v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 417
    .end local v1    # "ripple":Landroid/graphics/drawable/RippleDrawable;
    :goto_4c
    return-object v1

    .line 416
    :cond_4d
    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    move-object v1, v0

    .line 417
    goto :goto_4c
.end method

.method private getCircleSize()I
    .registers 3

    .prologue
    .line 177
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mFabSize:I

    if-nez v0, :cond_f

    sget v0, Lcom/github/clans/fab/R$dimen;->fab_size_normal:I

    :goto_a
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0

    :cond_f
    sget v0, Lcom/github/clans/fab/R$dimen;->fab_size_mini:I

    goto :goto_a
.end method

.method private getShadowX()I
    .registers 3

    .prologue
    .line 206
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private getShadowY()I
    .registers 3

    .prologue
    .line 210
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 118
    sget-object v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton:[I

    invoke-virtual {p1, p2, v2, p3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 119
    .local v0, "attr":Landroid/content/res/TypedArray;
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_colorNormal:I

    const v3, -0x25bcca

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorNormal:I

    .line 120
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_colorPressed:I

    const v3, -0x18afbd

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorPressed:I

    .line 121
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_colorRipple:I

    const v3, -0x66000001

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorRipple:I

    .line 122
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_showShadow:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowShadow:Z

    .line 123
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_shadowColor:I

    const/high16 v3, 0x66000000

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowColor:I

    .line 124
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_shadowRadius:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    .line 125
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_shadowXOffset:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    .line 126
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_shadowYOffset:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    .line 127
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_size:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mFabSize:I

    .line 128
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_label:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mLabelText:Ljava/lang/String;

    .line 129
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_progress_indeterminate:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldProgressIndeterminate:Z

    .line 130
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_progress_color:I

    const v3, -0xff6978

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressColor:I

    .line 131
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_progress_backgroundColor:I

    const/high16 v3, 0x4d000000    # 1.34217728E8f

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBackgroundColor:I

    .line 132
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_progress_max:I

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressMax:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressMax:I

    .line 133
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_progress_showBackground:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowProgressBackground:Z

    .line 135
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_progress:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_aa

    .line 136
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_progress:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgress:I

    .line 137
    iput-boolean v5, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldSetProgress:Z

    .line 140
    :cond_aa
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_elevationCompat:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_c2

    .line 141
    sget v2, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_elevationCompat:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    int-to-float v1, v2

    .line 142
    .local v1, "elevation":F
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->isInEditMode()Z

    move-result v2

    if-eqz v2, :cond_dc

    .line 143
    invoke-virtual {p0, v1}, Lcom/github/clans/fab/FloatingActionButton;->setElevation(F)V

    .line 149
    .end local v1    # "elevation":F
    :cond_c2
    :goto_c2
    invoke-direct {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->initShowAnimation(Landroid/content/res/TypedArray;)V

    .line 150
    invoke-direct {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->initHideAnimation(Landroid/content/res/TypedArray;)V

    .line 151
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 153
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->isInEditMode()Z

    move-result v2

    if-eqz v2, :cond_d8

    .line 154
    iget-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldProgressIndeterminate:Z

    if-eqz v2, :cond_e0

    .line 155
    invoke-virtual {p0, v5}, Lcom/github/clans/fab/FloatingActionButton;->setIndeterminate(Z)V

    .line 163
    :cond_d8
    :goto_d8
    invoke-virtual {p0, v5}, Lcom/github/clans/fab/FloatingActionButton;->setClickable(Z)V

    .line 164
    return-void

    .line 145
    .restart local v1    # "elevation":F
    :cond_dc
    invoke-virtual {p0, v1}, Lcom/github/clans/fab/FloatingActionButton;->setElevationCompat(F)V

    goto :goto_c2

    .line 156
    .end local v1    # "elevation":F
    :cond_e0
    iget-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldSetProgress:Z

    if-eqz v2, :cond_d8

    .line 157
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->saveButtonOriginalPosition()V

    .line 158
    iget v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgress:I

    invoke-virtual {p0, v2, v4}, Lcom/github/clans/fab/FloatingActionButton;->setProgress(IZ)V

    goto :goto_d8
.end method

.method private initHideAnimation(Landroid/content/res/TypedArray;)V
    .registers 5
    .param p1, "attr"    # Landroid/content/res/TypedArray;

    .prologue
    .line 172
    sget v1, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_hideAnimation:I

    sget v2, Lcom/github/clans/fab/R$anim;->fab_scale_down:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    .line 173
    .local v0, "resourceId":I
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    iput-object v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mHideAnimation:Landroid/view/animation/Animation;

    .line 174
    return-void
.end method

.method private initShowAnimation(Landroid/content/res/TypedArray;)V
    .registers 5
    .param p1, "attr"    # Landroid/content/res/TypedArray;

    .prologue
    .line 167
    sget v1, Lcom/github/clans/fab/R$styleable;->FloatingActionButton_fab_showAnimation:I

    sget v2, Lcom/github/clans/fab/R$anim;->fab_scale_up:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    .line 168
    .local v0, "resourceId":I
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    iput-object v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowAnimation:Landroid/view/animation/Animation;

    .line 169
    return-void
.end method

.method private saveButtonOriginalPosition()V
    .registers 3

    .prologue
    const/high16 v1, -0x40800000    # -1.0f

    .line 437
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mButtonPositionSaved:Z

    if-nez v0, :cond_21

    .line 438
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalX:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_12

    .line 439
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getX()F

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalX:F

    .line 442
    :cond_12
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalY:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1e

    .line 443
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getY()F

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalY:F

    .line 446
    :cond_1e
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mButtonPositionSaved:Z

    .line 448
    :cond_21
    return-void
.end method

.method private setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 429
    invoke-static {}, Lcom/github/clans/fab/Util;->hasJellyBean()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 430
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 434
    :goto_9
    return-void

    .line 432
    :cond_a
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9
.end method

.method private setupProgressBarPaints()V
    .registers 3

    .prologue
    .line 465
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBackgroundColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 466
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 467
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 469
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 470
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 471
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 472
    return-void
.end method

.method private setupProgressBounds()V
    .registers 9

    .prologue
    const/4 v2, 0x0

    .line 475
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->hasShadow()Z

    move-result v3

    if-eqz v3, :cond_3f

    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getShadowX()I

    move-result v0

    .line 476
    .local v0, "circleInsetHorizontal":I
    :goto_b
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->hasShadow()Z

    move-result v3

    if-eqz v3, :cond_41

    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getShadowY()I

    move-result v1

    .line 477
    .local v1, "circleInsetVertical":I
    :goto_15
    new-instance v2, Landroid/graphics/RectF;

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, v0

    int-to-float v3, v3

    iget v4, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v1

    int-to-float v4, v4

    .line 480
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateMeasuredWidth()I

    move-result v5

    sub-int/2addr v5, v0

    iget v6, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    div-int/lit8 v6, v6, 0x2

    sub-int/2addr v5, v6

    int-to-float v5, v5

    .line 481
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateMeasuredHeight()I

    move-result v6

    sub-int/2addr v6, v1

    iget v7, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    div-int/lit8 v7, v7, 0x2

    sub-int/2addr v6, v7

    int-to-float v6, v6

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressCircleBounds:Landroid/graphics/RectF;

    .line 483
    return-void

    .end local v0    # "circleInsetHorizontal":I
    .end local v1    # "circleInsetVertical":I
    :cond_3f
    move v0, v2

    .line 475
    goto :goto_b

    .restart local v0    # "circleInsetHorizontal":I
    :cond_41
    move v1, v2

    .line 476
    goto :goto_15
.end method

.method private updateButtonPosition()V
    .registers 5

    .prologue
    .line 453
    iget-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBarEnabled:Z

    if-eqz v2, :cond_45

    .line 454
    iget v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalX:F

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getX()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_31

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getX()F

    move-result v2

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    int-to-float v3, v3

    add-float v0, v2, v3

    .line 455
    .local v0, "x":F
    :goto_17
    iget v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalY:F

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getY()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_3b

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getY()F

    move-result v2

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    int-to-float v3, v3

    add-float v1, v2, v3

    .line 460
    .local v1, "y":F
    :goto_2a
    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->setX(F)V

    .line 461
    invoke-virtual {p0, v1}, Lcom/github/clans/fab/FloatingActionButton;->setY(F)V

    .line 462
    return-void

    .line 454
    .end local v0    # "x":F
    .end local v1    # "y":F
    :cond_31
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getX()F

    move-result v2

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    int-to-float v3, v3

    sub-float v0, v2, v3

    goto :goto_17

    .line 455
    .restart local v0    # "x":F
    :cond_3b
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getY()F

    move-result v2

    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    int-to-float v3, v3

    sub-float v1, v2, v3

    goto :goto_2a

    .line 457
    .end local v0    # "x":F
    :cond_45
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalX:F

    .line 458
    .restart local v0    # "x":F
    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mOriginalY:F

    .restart local v1    # "y":F
    goto :goto_2a
.end method

.method private updateProgressLength(J)V
    .registers 12
    .param p1, "deltaTimeInMillis"    # J

    .prologue
    const-wide v7, 0x407f400000000000L    # 500.0

    .line 285
    iget-wide v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mPausedTimeWithoutGrowing:J

    const-wide/16 v5, 0xc8

    cmp-long v3, v3, v5

    if-ltz v3, :cond_61

    .line 286
    iget-wide v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mTimeStartGrowing:D

    long-to-double v5, p1

    add-double/2addr v3, v5

    iput-wide v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mTimeStartGrowing:D

    .line 288
    iget-wide v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mTimeStartGrowing:D

    cmpl-double v3, v3, v7

    if-lez v3, :cond_29

    .line 289
    iget-wide v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mTimeStartGrowing:D

    sub-double/2addr v3, v7

    iput-wide v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mTimeStartGrowing:D

    .line 290
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mPausedTimeWithoutGrowing:J

    .line 291
    iget-boolean v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarGrowingFromFront:Z

    if-nez v3, :cond_4f

    const/4 v3, 0x1

    :goto_27
    iput-boolean v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarGrowingFromFront:Z

    .line 294
    :cond_29
    iget-wide v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mTimeStartGrowing:D

    div-double/2addr v3, v7

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    add-double/2addr v3, v5

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    const/high16 v4, 0x3f000000    # 0.5f

    add-float v0, v3, v4

    .line 295
    .local v0, "distance":F
    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarLength:I

    rsub-int v3, v3, 0x10e

    int-to-float v1, v3

    .line 297
    .local v1, "length":F
    iget-boolean v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarGrowingFromFront:Z

    if-eqz v3, :cond_51

    .line 298
    mul-float v3, v0, v1

    iput v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarExtraLength:F

    .line 307
    .end local v0    # "distance":F
    .end local v1    # "length":F
    :goto_4e
    return-void

    .line 291
    :cond_4f
    const/4 v3, 0x0

    goto :goto_27

    .line 300
    .restart local v0    # "distance":F
    .restart local v1    # "length":F
    :cond_51
    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr v3, v0

    mul-float v2, v1, v3

    .line 301
    .local v2, "newLength":F
    iget v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    iget v4, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarExtraLength:F

    sub-float/2addr v4, v2

    add-float/2addr v3, v4

    iput v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    .line 302
    iput v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarExtraLength:F

    goto :goto_4e

    .line 305
    .end local v0    # "distance":F
    .end local v1    # "length":F
    .end local v2    # "newLength":F
    :cond_61
    iget-wide v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mPausedTimeWithoutGrowing:J

    add-long/2addr v3, p1

    iput-wide v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mPausedTimeWithoutGrowing:J

    goto :goto_4e
.end method


# virtual methods
.method calculateShadowHeight()I
    .registers 2

    .prologue
    .line 202
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->hasShadow()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getShadowY()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method calculateShadowWidth()I
    .registers 2

    .prologue
    .line 198
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->hasShadow()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getShadowX()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getButtonSize()I
    .registers 2

    .prologue
    .line 828
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mFabSize:I

    return v0
.end method

.method public getColorNormal()I
    .registers 2

    .prologue
    .line 843
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorNormal:I

    return v0
.end method

.method public getColorPressed()I
    .registers 2

    .prologue
    .line 858
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorPressed:I

    return v0
.end method

.method public getColorRipple()I
    .registers 2

    .prologue
    .line 873
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorRipple:I

    return v0
.end method

.method getHideAnimation()Landroid/view/animation/Animation;
    .registers 2

    .prologue
    .line 490
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mHideAnimation:Landroid/view/animation/Animation;

    return-object v0
.end method

.method protected getIconDrawable()Landroid/graphics/drawable/Drawable;
    .registers 3

    .prologue
    .line 389
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7

    .line 390
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 392
    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_6
.end method

.method public getLabelText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1056
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mLabelText:Ljava/lang/String;

    return-object v0
.end method

.method getLabelView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 506
    sget v0, Lcom/github/clans/fab/R$id;->fab_label:I

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    return-object v0
.end method

.method public getLabelVisibility()I
    .registers 3

    .prologue
    .line 1075
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getLabelView()Landroid/widget/TextView;

    move-result-object v0

    .line 1076
    .local v0, "labelView":Landroid/widget/TextView;
    if-eqz v0, :cond_b

    .line 1077
    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    .line 1080
    :goto_a
    return v1

    :cond_b
    const/4 v1, -0x1

    goto :goto_a
.end method

.method public declared-synchronized getMax()I
    .registers 2

    .prologue
    .line 1150
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressMax:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getOnClickListener()Landroid/view/View$OnClickListener;
    .registers 2

    .prologue
    .line 502
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mClickListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method public declared-synchronized getProgress()I
    .registers 2

    .prologue
    .line 1191
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressIndeterminate:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_b

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    :try_start_8
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgress:I
    :try_end_a
    .catchall {:try_start_8 .. :try_end_a} :catchall_b

    goto :goto_6

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getShadowColor()I
    .registers 2

    .prologue
    .line 999
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowColor:I

    return v0
.end method

.method public getShadowRadius()I
    .registers 2

    .prologue
    .line 916
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    return v0
.end method

.method public getShadowXOffset()I
    .registers 2

    .prologue
    .line 948
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    return v0
.end method

.method public getShadowYOffset()I
    .registers 2

    .prologue
    .line 980
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    return v0
.end method

.method getShowAnimation()Landroid/view/animation/Animation;
    .registers 2

    .prologue
    .line 486
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowAnimation:Landroid/view/animation/Animation;

    return-object v0
.end method

.method public hasShadow()Z
    .registers 2

    .prologue
    .line 884
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mUsingElevation:Z

    if-nez v0, :cond_a

    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowShadow:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public hide(Z)V
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    .line 1031
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->isHidden()Z

    move-result v0

    if-nez v0, :cond_f

    .line 1032
    if-eqz p1, :cond_b

    .line 1033
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->playHideAnimation()V

    .line 1035
    :cond_b
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->setVisibility(I)V

    .line 1037
    :cond_f
    return-void
.end method

.method public declared-synchronized hideProgress()V
    .registers 2

    .prologue
    .line 1195
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBarEnabled:Z

    .line 1196
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldUpdateButtonPosition:Z

    .line 1197
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V
    :try_end_a
    .catchall {:try_start_2 .. :try_end_a} :catchall_c

    .line 1198
    monitor-exit p0

    return-void

    .line 1195
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isHidden()Z
    .registers 3

    .prologue
    .line 1008
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public declared-synchronized isProgressBackgroundShown()Z
    .registers 2

    .prologue
    .line 1205
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowProgressBackground:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method onActionDown()V
    .registers 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 517
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v2, v2, Landroid/graphics/drawable/StateListDrawable;

    if-eqz v2, :cond_17

    .line 518
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/StateListDrawable;

    .line 519
    .local v0, "drawable":Landroid/graphics/drawable/StateListDrawable;
    new-array v2, v4, [I

    const/4 v3, 0x0

    const v4, 0x10100a7

    aput v4, v2, v3

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/StateListDrawable;->setState([I)Z

    .line 526
    .end local v0    # "drawable":Landroid/graphics/drawable/StateListDrawable;
    :cond_16
    :goto_16
    return-void

    .line 520
    :cond_17
    invoke-static {}, Lcom/github/clans/fab/Util;->hasLollipop()Z

    move-result v2

    if-eqz v2, :cond_16

    .line 521
    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v1, Landroid/graphics/drawable/RippleDrawable;

    .line 522
    .local v1, "ripple":Landroid/graphics/drawable/RippleDrawable;
    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_3a

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/RippleDrawable;->setState([I)Z

    .line 523
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateCenterX()F

    move-result v2

    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateCenterY()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/RippleDrawable;->setHotspot(FF)V

    .line 524
    invoke-virtual {v1, v4, v4}, Landroid/graphics/drawable/RippleDrawable;->setVisible(ZZ)Z

    goto :goto_16

    .line 522
    nop

    :array_3a
    .array-data 4
        0x101009e
        0x10100a7
    .end array-data
.end method

.method onActionUp()V
    .registers 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 530
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v2, v2, Landroid/graphics/drawable/StateListDrawable;

    if-eqz v2, :cond_12

    .line 531
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/StateListDrawable;

    .line 532
    .local v0, "drawable":Landroid/graphics/drawable/StateListDrawable;
    new-array v2, v3, [I

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/StateListDrawable;->setState([I)Z

    .line 539
    .end local v0    # "drawable":Landroid/graphics/drawable/StateListDrawable;
    :cond_11
    :goto_11
    return-void

    .line 533
    :cond_12
    invoke-static {}, Lcom/github/clans/fab/Util;->hasLollipop()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 534
    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v1, Landroid/graphics/drawable/RippleDrawable;

    .line 535
    .local v1, "ripple":Landroid/graphics/drawable/RippleDrawable;
    new-array v2, v3, [I

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/RippleDrawable;->setState([I)Z

    .line 536
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateCenterX()F

    move-result v2

    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateCenterY()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/RippleDrawable;->setHotspot(FF)V

    .line 537
    invoke-virtual {v1, v4, v4}, Landroid/graphics/drawable/RippleDrawable;->setVisible(ZZ)Z

    goto :goto_11
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 229
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onDraw(Landroid/graphics/Canvas;)V

    .line 231
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBarEnabled:Z

    if-eqz v0, :cond_6f

    .line 232
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowProgressBackground:Z

    if-eqz v0, :cond_18

    .line 233
    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressCircleBounds:Landroid/graphics/RectF;

    const/high16 v2, 0x43b40000    # 360.0f

    const/high16 v3, 0x43b40000    # 360.0f

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/github/clans/fab/FloatingActionButton;->mBackgroundPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 236
    :cond_18
    const/4 v13, 0x0

    .line 238
    .local v13, "shouldInvalidate":Z
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressIndeterminate:Z

    if-eqz v0, :cond_70

    .line 239
    const/4 v13, 0x1

    .line 241
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v4, p0, Lcom/github/clans/fab/FloatingActionButton;->mLastTimeAnimated:J

    sub-long v11, v0, v4

    .line 242
    .local v11, "deltaTime":J
    long-to-float v0, v11

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mSpinSpeed:F

    mul-float/2addr v0, v1

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float v10, v0, v1

    .line 244
    .local v10, "deltaNormalized":F
    invoke-direct {p0, v11, v12}, Lcom/github/clans/fab/FloatingActionButton;->updateProgressLength(J)V

    .line 246
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    add-float/2addr v0, v10

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    .line 247
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    const/high16 v1, 0x43b40000    # 360.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_45

    .line 248
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    const/high16 v1, 0x43b40000    # 360.0f

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    .line 251
    :cond_45
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mLastTimeAnimated:J

    .line 252
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    const/high16 v1, 0x42b40000    # 90.0f

    sub-float v2, v0, v1

    .line 253
    .local v2, "from":F
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarLength:I

    int-to-float v0, v0

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mBarExtraLength:F

    add-float v3, v0, v1

    .line 255
    .local v3, "to":F
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_61

    .line 256
    const/4 v2, 0x0

    .line 257
    const/high16 v3, 0x43070000    # 135.0f

    .line 260
    :cond_61
    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressCircleBounds:Landroid/graphics/RectF;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 278
    .end local v2    # "from":F
    .end local v3    # "to":F
    .end local v10    # "deltaNormalized":F
    .end local v11    # "deltaTime":J
    :goto_6a
    if-eqz v13, :cond_6f

    .line 279
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->invalidate()V

    .line 282
    .end local v13    # "shouldInvalidate":Z
    :cond_6f
    return-void

    .line 262
    .restart local v13    # "shouldInvalidate":Z
    :cond_70
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mTargetProgress:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_a2

    .line 263
    const/4 v13, 0x1

    .line 264
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v4, p0, Lcom/github/clans/fab/FloatingActionButton;->mLastTimeAnimated:J

    sub-long/2addr v0, v4

    long-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float v11, v0, v1

    .line 265
    .local v11, "deltaTime":F
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mSpinSpeed:F

    mul-float v10, v11, v0

    .line 267
    .restart local v10    # "deltaNormalized":F
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mTargetProgress:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_b0

    .line 268
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    sub-float/2addr v0, v10

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mTargetProgress:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    .line 272
    :goto_9c
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mLastTimeAnimated:J

    .line 275
    .end local v10    # "deltaNormalized":F
    .end local v11    # "deltaTime":F
    :cond_a2
    iget-object v5, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressCircleBounds:Landroid/graphics/RectF;

    const/high16 v6, -0x3d4c0000    # -90.0f

    iget v7, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressPaint:Landroid/graphics/Paint;

    move-object v4, p1

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto :goto_6a

    .line 270
    .restart local v10    # "deltaNormalized":F
    .restart local v11    # "deltaTime":F
    :cond_b0
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    add-float/2addr v0, v10

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mTargetProgress:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    goto :goto_9c
.end method

.method protected onMeasure(II)V
    .registers 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 224
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateMeasuredWidth()I

    move-result v0

    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->calculateMeasuredHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/github/clans/fab/FloatingActionButton;->setMeasuredDimension(II)V

    .line 225
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 605
    instance-of v1, p1, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;

    if-nez v1, :cond_8

    .line 606
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 626
    :goto_7
    return-void

    :cond_8
    move-object v0, p1

    .line 610
    check-cast v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;

    .line 611
    .local v0, "ss":Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;
    invoke-virtual {v0}, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/ImageButton;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 613
    iget v1, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mCurrentProgress:F

    iput v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    .line 614
    iget v1, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mTargetProgress:F

    iput v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mTargetProgress:F

    .line 615
    iget v1, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mSpinSpeed:F

    iput v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mSpinSpeed:F

    .line 616
    iget v1, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressWidth:I

    iput v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    .line 617
    iget v1, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressColor:I

    iput v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressColor:I

    .line 618
    iget v1, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressBackgroundColor:I

    iput v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBackgroundColor:I

    .line 619
    iget-boolean v1, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShouldProgressIndeterminate:Z

    iput-boolean v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldProgressIndeterminate:Z

    .line 620
    iget-boolean v1, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShouldSetProgress:Z

    iput-boolean v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldSetProgress:Z

    .line 621
    iget v1, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgress:I

    iput v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgress:I

    .line 622
    iget-boolean v1, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mAnimateProgress:Z

    iput-boolean v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mAnimateProgress:Z

    .line 623
    iget-boolean v1, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShowProgressBackground:Z

    iput-boolean v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowProgressBackground:Z

    .line 625
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mLastTimeAnimated:J

    goto :goto_7
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 584
    invoke-super {p0}, Landroid/widget/ImageButton;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 586
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;

    invoke-direct {v0, v1}, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 588
    .local v0, "ss":Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;
    iget v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    iput v2, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mCurrentProgress:F

    .line 589
    iget v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mTargetProgress:F

    iput v2, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mTargetProgress:F

    .line 590
    iget v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mSpinSpeed:F

    iput v2, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mSpinSpeed:F

    .line 591
    iget v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    iput v2, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressWidth:I

    .line 592
    iget v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressColor:I

    iput v2, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressColor:I

    .line 593
    iget v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBackgroundColor:I

    iput v2, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgressBackgroundColor:I

    .line 594
    iget-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressIndeterminate:Z

    iput-boolean v2, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShouldProgressIndeterminate:Z

    .line 595
    iget-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBarEnabled:Z

    if-eqz v2, :cond_41

    iget v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgress:I

    if-lez v2, :cond_41

    iget-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressIndeterminate:Z

    if-nez v2, :cond_41

    const/4 v2, 0x1

    :goto_32
    iput-boolean v2, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShouldSetProgress:Z

    .line 596
    iget v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgress:I

    iput v2, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mProgress:I

    .line 597
    iget-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mAnimateProgress:Z

    iput-boolean v2, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mAnimateProgress:Z

    .line 598
    iget-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowProgressBackground:Z

    iput-boolean v2, v0, Lcom/github/clans/fab/FloatingActionButton$ProgressSavedState;->mShowProgressBackground:Z

    .line 600
    return-object v0

    .line 595
    :cond_41
    const/4 v2, 0x0

    goto :goto_32
.end method

.method protected onSizeChanged(IIII)V
    .registers 8
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/4 v2, 0x0

    .line 311
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->saveButtonOriginalPosition()V

    .line 313
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldProgressIndeterminate:Z

    if-eqz v0, :cond_1b

    .line 314
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->setIndeterminate(Z)V

    .line 315
    iput-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldProgressIndeterminate:Z

    .line 323
    :cond_e
    :goto_e
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ImageButton;->onSizeChanged(IIII)V

    .line 325
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->setupProgressBounds()V

    .line 326
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->setupProgressBarPaints()V

    .line 327
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 328
    return-void

    .line 316
    :cond_1b
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldSetProgress:Z

    if-eqz v0, :cond_29

    .line 317
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgress:I

    iget-boolean v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mAnimateProgress:Z

    invoke-virtual {p0, v0, v1}, Lcom/github/clans/fab/FloatingActionButton;->setProgress(IZ)V

    .line 318
    iput-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldSetProgress:Z

    goto :goto_e

    .line 319
    :cond_29
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldUpdateButtonPosition:Z

    if-eqz v0, :cond_e

    .line 320
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateButtonPosition()V

    .line 321
    iput-boolean v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldUpdateButtonPosition:Z

    goto :goto_e
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 543
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mClickListener:Landroid/view/View$OnClickListener;

    if-eqz v2, :cond_18

    .line 544
    sget v2, Lcom/github/clans/fab/R$id;->fab_label:I

    invoke-virtual {p0, v2}, Lcom/github/clans/fab/FloatingActionButton;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/clans/fab/Label;

    .line 545
    .local v1, "label":Lcom/github/clans/fab/Label;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 546
    .local v0, "action":I
    packed-switch v0, :pswitch_data_24

    .line 554
    :cond_13
    :goto_13
    iget-object v2, p0, Lcom/github/clans/fab/FloatingActionButton;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v2, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 556
    .end local v0    # "action":I
    .end local v1    # "label":Lcom/github/clans/fab/Label;
    :cond_18
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    return v2

    .line 548
    .restart local v0    # "action":I
    .restart local v1    # "label":Lcom/github/clans/fab/Label;
    :pswitch_1d
    if-eqz v1, :cond_13

    .line 549
    invoke-virtual {v1}, Lcom/github/clans/fab/Label;->onActionUp()V

    goto :goto_13

    .line 546
    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_1d
    .end packed-switch
.end method

.method playHideAnimation()V
    .registers 2

    .prologue
    .line 498
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mHideAnimation:Landroid/view/animation/Animation;

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->startAnimation(Landroid/view/animation/Animation;)V

    .line 499
    return-void
.end method

.method playShowAnimation()V
    .registers 2

    .prologue
    .line 494
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowAnimation:Landroid/view/animation/Animation;

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->startAnimation(Landroid/view/animation/Animation;)V

    .line 495
    return-void
.end method

.method public setButtonSize(I)V
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 817
    if-eqz p1, :cond_d

    const/4 v0, 0x1

    if-eq p1, v0, :cond_d

    .line 818
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Use @FabSize constants only!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 821
    :cond_d
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mFabSize:I

    if-eq v0, p1, :cond_16

    .line 822
    iput p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mFabSize:I

    .line 823
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 825
    :cond_16
    return-void
.end method

.method public setColorNormal(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 832
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorNormal:I

    if-eq v0, p1, :cond_9

    .line 833
    iput p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorNormal:I

    .line 834
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 836
    :cond_9
    return-void
.end method

.method public setColorNormalResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 839
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->setColorNormal(I)V

    .line 840
    return-void
.end method

.method public setColorPressed(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 847
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorPressed:I

    if-eq p1, v0, :cond_9

    .line 848
    iput p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorPressed:I

    .line 849
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 851
    :cond_9
    return-void
.end method

.method public setColorPressedResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 854
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->setColorPressed(I)V

    .line 855
    return-void
.end method

.method public setColorRipple(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 862
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorRipple:I

    if-eq p1, v0, :cond_9

    .line 863
    iput p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorRipple:I

    .line 864
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 866
    :cond_9
    return-void
.end method

.method public setColorRippleResId(I)V
    .registers 3
    .param p1, "colorResId"    # I

    .prologue
    .line 869
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->setColorRipple(I)V

    .line 870
    return-void
.end method

.method setColors(III)V
    .registers 4
    .param p1, "colorNormal"    # I
    .param p2, "colorPressed"    # I
    .param p3, "colorRipple"    # I

    .prologue
    .line 510
    iput p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorNormal:I

    .line 511
    iput p2, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorPressed:I

    .line 512
    iput p3, p0, Lcom/github/clans/fab/FloatingActionButton;->mColorRipple:I

    .line 513
    return-void
.end method

.method public setElevation(F)V
    .registers 3
    .param p1, "elevation"    # F

    .prologue
    .line 1085
    invoke-static {}, Lcom/github/clans/fab/Util;->hasLollipop()Z

    move-result v0

    if-eqz v0, :cond_1d

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1d

    .line 1086
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setElevation(F)V

    .line 1087
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_1a

    .line 1088
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mUsingElevation:Z

    .line 1089
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowShadow:Z

    .line 1091
    :cond_1a
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 1093
    :cond_1d
    return-void
.end method

.method public setElevationCompat(F)V
    .registers 7
    .param p1, "elevation"    # F
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/high16 v2, 0x40000000    # 2.0f

    .line 1103
    const/high16 v1, 0x26000000

    iput v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowColor:I

    .line 1104
    div-float v1, p1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    .line 1105
    iput v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    .line 1106
    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mFabSize:I

    if-nez v1, :cond_37

    move v1, p1

    :goto_17
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    .line 1108
    invoke-static {}, Lcom/github/clans/fab/Util;->hasLollipop()Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 1109
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setElevation(F)V

    .line 1110
    iput-boolean v4, p0, Lcom/github/clans/fab/FloatingActionButton;->mUsingElevationCompat:Z

    .line 1111
    iput-boolean v3, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowShadow:Z

    .line 1112
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 1114
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 1115
    .local v0, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v0, :cond_36

    .line 1116
    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1122
    .end local v0    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_36
    :goto_36
    return-void

    .line 1106
    :cond_37
    div-float v1, p1, v2

    goto :goto_17

    .line 1119
    :cond_3a
    iput-boolean v4, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowShadow:Z

    .line 1120
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    goto :goto_36
.end method

.method public setHideAnimation(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "hideAnimation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1064
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mHideAnimation:Landroid/view/animation/Animation;

    .line 1065
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 779
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_9

    .line 780
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 781
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 783
    :cond_9
    return-void
.end method

.method public setImageResource(I)V
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 787
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 788
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eq v1, v0, :cond_11

    .line 789
    iput-object v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 790
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 792
    :cond_11
    return-void
.end method

.method public declared-synchronized setIndeterminate(Z)V
    .registers 4
    .param p1, "indeterminate"    # Z

    .prologue
    .line 1132
    monitor-enter p0

    if-nez p1, :cond_6

    .line 1133
    const/4 v0, 0x0

    :try_start_4
    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    .line 1136
    :cond_6
    iput-boolean p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBarEnabled:Z

    .line 1137
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldUpdateButtonPosition:Z

    .line 1138
    iput-boolean p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressIndeterminate:Z

    .line 1139
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mLastTimeAnimated:J

    .line 1140
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->setupProgressBounds()V

    .line 1141
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->saveButtonOriginalPosition()V

    .line 1142
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V
    :try_end_1c
    .catchall {:try_start_4 .. :try_end_1c} :catchall_1e

    .line 1143
    monitor-exit p0

    return-void

    .line 1132
    :catchall_1e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setLabelText(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 1048
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mLabelText:Ljava/lang/String;

    .line 1049
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getLabelView()Landroid/widget/TextView;

    move-result-object v0

    .line 1050
    .local v0, "labelView":Landroid/widget/TextView;
    if-eqz v0, :cond_b

    .line 1051
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1053
    :cond_b
    return-void
.end method

.method public setLabelVisibility(I)V
    .registers 3
    .param p1, "visibility"    # I

    .prologue
    .line 1068
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getLabelView()Landroid/widget/TextView;

    move-result-object v0

    .line 1069
    .local v0, "labelView":Landroid/widget/TextView;
    if-eqz v0, :cond_9

    .line 1070
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1072
    :cond_9
    return-void
.end method

.method public setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 5
    .param p1, "params"    # Landroid/view/ViewGroup$LayoutParams;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 333
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_38

    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mUsingElevationCompat:Z

    if-eqz v0, :cond_38

    move-object v0, p1

    .line 334
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getShadowX()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    move-object v0, p1

    .line 335
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getShadowY()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    move-object v0, p1

    .line 336
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getShadowX()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    move-object v0, p1

    .line 337
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getShadowY()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 339
    :cond_38
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 340
    return-void
.end method

.method public declared-synchronized setMax(I)V
    .registers 3
    .param p1, "max"    # I

    .prologue
    .line 1146
    monitor-enter p0

    :try_start_1
    iput p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressMax:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 1147
    monitor-exit p0

    return-void

    .line 1146
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 4
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 796
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 797
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mClickListener:Landroid/view/View$OnClickListener;

    .line 798
    sget v1, Lcom/github/clans/fab/R$id;->fab_label:I

    invoke-virtual {p0, v1}, Lcom/github/clans/fab/FloatingActionButton;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 799
    .local v0, "label":Landroid/view/View;
    if-eqz v0, :cond_17

    .line 800
    new-instance v1, Lcom/github/clans/fab/FloatingActionButton$3;

    invoke-direct {v1, p0}, Lcom/github/clans/fab/FloatingActionButton$3;-><init>(Lcom/github/clans/fab/FloatingActionButton;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 809
    :cond_17
    return-void
.end method

.method public declared-synchronized setProgress(IZ)V
    .registers 5
    .param p1, "progress"    # I
    .param p2, "animate"    # Z

    .prologue
    .line 1154
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressIndeterminate:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_13

    if-eqz v0, :cond_7

    .line 1188
    :cond_5
    :goto_5
    monitor-exit p0

    return-void

    .line 1156
    :cond_7
    :try_start_7
    iput p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgress:I

    .line 1157
    iput-boolean p2, p0, Lcom/github/clans/fab/FloatingActionButton;->mAnimateProgress:Z

    .line 1159
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mButtonPositionSaved:Z

    if-nez v0, :cond_16

    .line 1160
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldSetProgress:Z
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_13

    goto :goto_5

    .line 1154
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1164
    :cond_16
    const/4 v0, 0x1

    :try_start_17
    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBarEnabled:Z

    .line 1165
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShouldUpdateButtonPosition:Z

    .line 1166
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->setupProgressBounds()V

    .line 1167
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->saveButtonOriginalPosition()V

    .line 1168
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 1170
    if-gez p1, :cond_4d

    .line 1171
    const/4 p1, 0x0

    .line 1176
    :cond_28
    :goto_28
    int-to-float v0, p1

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mTargetProgress:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_5

    .line 1180
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressMax:I

    if-lez v0, :cond_54

    int-to-float v0, p1

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressMax:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    const/high16 v1, 0x43b40000    # 360.0f

    mul-float/2addr v0, v1

    :goto_3b
    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mTargetProgress:F

    .line 1181
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mLastTimeAnimated:J

    .line 1183
    if-nez p2, :cond_49

    .line 1184
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mTargetProgress:F

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mCurrentProgress:F

    .line 1187
    :cond_49
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->invalidate()V

    goto :goto_5

    .line 1172
    :cond_4d
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressMax:I

    if-le p1, v0, :cond_28

    .line 1173
    iget p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressMax:I
    :try_end_53
    .catchall {:try_start_17 .. :try_end_53} :catchall_13

    goto :goto_28

    .line 1180
    :cond_54
    const/4 v0, 0x0

    goto :goto_3b
.end method

.method public setShadowColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 992
    iget v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowColor:I

    if-eq v0, p1, :cond_9

    .line 993
    iput p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowColor:I

    .line 994
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 996
    :cond_9
    return-void
.end method

.method public setShadowColorResource(I)V
    .registers 4
    .param p1, "colorResId"    # I

    .prologue
    .line 984
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 985
    .local v0, "shadowColor":I
    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowColor:I

    if-eq v1, v0, :cond_11

    .line 986
    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowColor:I

    .line 987
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 989
    :cond_11
    return-void
.end method

.method public setShadowRadius(F)V
    .registers 3
    .param p1, "shadowRadiusDp"    # F

    .prologue
    .line 910
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    .line 911
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->requestLayout()V

    .line 912
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 913
    return-void
.end method

.method public setShadowRadius(I)V
    .registers 4
    .param p1, "dimenResId"    # I

    .prologue
    .line 893
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 894
    .local v0, "shadowRadius":I
    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    if-eq v1, v0, :cond_14

    .line 895
    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    .line 896
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->requestLayout()V

    .line 897
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 899
    :cond_14
    return-void
.end method

.method public setShadowXOffset(F)V
    .registers 3
    .param p1, "shadowXOffsetDp"    # F

    .prologue
    .line 942
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    .line 943
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->requestLayout()V

    .line 944
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 945
    return-void
.end method

.method public setShadowXOffset(I)V
    .registers 4
    .param p1, "dimenResId"    # I

    .prologue
    .line 925
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 926
    .local v0, "shadowXOffset":I
    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    if-eq v1, v0, :cond_14

    .line 927
    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    .line 928
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->requestLayout()V

    .line 929
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 931
    :cond_14
    return-void
.end method

.method public setShadowYOffset(F)V
    .registers 3
    .param p1, "shadowYOffsetDp"    # F

    .prologue
    .line 974
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/github/clans/fab/Util;->dpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    .line 975
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->requestLayout()V

    .line 976
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 977
    return-void
.end method

.method public setShadowYOffset(I)V
    .registers 4
    .param p1, "dimenResId"    # I

    .prologue
    .line 957
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 958
    .local v0, "shadowYOffset":I
    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    if-eq v1, v0, :cond_14

    .line 959
    iput v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    .line 960
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->requestLayout()V

    .line 961
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 963
    :cond_14
    return-void
.end method

.method public setShowAnimation(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "showAnimation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1060
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowAnimation:Landroid/view/animation/Animation;

    .line 1061
    return-void
.end method

.method public declared-synchronized setShowProgressBackground(Z)V
    .registers 3
    .param p1, "show"    # Z

    .prologue
    .line 1201
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowProgressBackground:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 1202
    monitor-exit p0

    return-void

    .line 1201
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setShowShadow(Z)V
    .registers 3
    .param p1, "show"    # Z

    .prologue
    .line 877
    iget-boolean v0, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowShadow:Z

    if-eq v0, p1, :cond_9

    .line 878
    iput-boolean p1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShowShadow:Z

    .line 879
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->updateBackground()V

    .line 881
    :cond_9
    return-void
.end method

.method public show(Z)V
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    .line 1017
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->isHidden()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1018
    if-eqz p1, :cond_b

    .line 1019
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->playShowAnimation()V

    .line 1021
    :cond_b
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->setVisibility(I)V

    .line 1023
    :cond_f
    return-void
.end method

.method public toggle(Z)V
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    .line 1040
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->isHidden()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1041
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionButton;->show(Z)V

    .line 1045
    :goto_9
    return-void

    .line 1043
    :cond_a
    invoke-virtual {p0, p1}, Lcom/github/clans/fab/FloatingActionButton;->hide(Z)V

    goto :goto_9
.end method

.method updateBackground()V
    .registers 12

    .prologue
    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 344
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->hasShadow()Z

    move-result v4

    if-eqz v4, :cond_89

    .line 345
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v4, 0x3

    new-array v4, v4, [Landroid/graphics/drawable/Drawable;

    new-instance v5, Lcom/github/clans/fab/FloatingActionButton$Shadow;

    const/4 v10, 0x0

    invoke-direct {v5, p0, v10}, Lcom/github/clans/fab/FloatingActionButton$Shadow;-><init>(Lcom/github/clans/fab/FloatingActionButton;Lcom/github/clans/fab/FloatingActionButton$1;)V

    aput-object v5, v4, v1

    .line 347
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->createFillDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    aput-object v5, v4, v3

    .line 348
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-direct {v0, v4}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 357
    .local v0, "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    :goto_25
    const/4 v9, -0x1

    .line 358
    .local v9, "iconSize":I
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_40

    .line 359
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 361
    :cond_40
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->getCircleSize()I

    move-result v4

    if-lez v9, :cond_9d

    .end local v9    # "iconSize":I
    :goto_46
    sub-int/2addr v4, v9

    div-int/lit8 v8, v4, 0x2

    .line 362
    .local v8, "iconOffset":I
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->hasShadow()Z

    move-result v4

    if-eqz v4, :cond_a0

    iget v4, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    iget v5, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowXOffset:I

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    add-int v6, v4, v5

    .line 363
    .local v6, "circleInsetHorizontal":I
    :goto_59
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->hasShadow()Z

    move-result v4

    if-eqz v4, :cond_a2

    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowRadius:I

    iget v4, p0, Lcom/github/clans/fab/FloatingActionButton;->mShadowYOffset:I

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    add-int v7, v1, v4

    .line 365
    .local v7, "circleInsetVertical":I
    :goto_69
    iget-boolean v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressBarEnabled:Z

    if-eqz v1, :cond_73

    .line 366
    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    add-int/2addr v6, v1

    .line 367
    iget v1, p0, Lcom/github/clans/fab/FloatingActionButton;->mProgressWidth:I

    add-int/2addr v7, v1

    .line 378
    :cond_73
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->hasShadow()Z

    move-result v1

    if-eqz v1, :cond_a4

    move v1, v2

    :goto_7a
    add-int v2, v6, v8

    add-int v3, v7, v8

    add-int v4, v6, v8

    add-int v5, v7, v8

    .line 377
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 385
    invoke-direct {p0, v0}, Lcom/github/clans/fab/FloatingActionButton;->setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V

    .line 386
    return-void

    .line 351
    .end local v0    # "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    .end local v6    # "circleInsetHorizontal":I
    .end local v7    # "circleInsetVertical":I
    .end local v8    # "iconOffset":I
    :cond_89
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    new-array v4, v2, [Landroid/graphics/drawable/Drawable;

    .line 352
    invoke-direct {p0}, Lcom/github/clans/fab/FloatingActionButton;->createFillDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    aput-object v5, v4, v1

    .line 353
    invoke-virtual {p0}, Lcom/github/clans/fab/FloatingActionButton;->getIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    aput-object v5, v4, v3

    invoke-direct {v0, v4}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .restart local v0    # "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    goto :goto_25

    .line 361
    .restart local v9    # "iconSize":I
    :cond_9d
    iget v9, p0, Lcom/github/clans/fab/FloatingActionButton;->mIconSize:I

    goto :goto_46

    .end local v9    # "iconSize":I
    .restart local v8    # "iconOffset":I
    :cond_a0
    move v6, v1

    .line 362
    goto :goto_59

    .restart local v6    # "circleInsetHorizontal":I
    :cond_a2
    move v7, v1

    .line 363
    goto :goto_69

    .restart local v7    # "circleInsetVertical":I
    :cond_a4
    move v1, v3

    .line 378
    goto :goto_7a
.end method
