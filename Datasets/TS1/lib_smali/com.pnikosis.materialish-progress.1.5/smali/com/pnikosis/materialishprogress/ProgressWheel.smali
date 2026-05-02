.class public Lcom/pnikosis/materialishprogress/ProgressWheel;
.super Landroid/view/View;
.source "ProgressWheel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pnikosis/materialishprogress/ProgressWheel$1;,
        Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;,
        Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private barColor:I

.field private barExtraLength:F

.field private barGrowingFromFront:Z

.field private final barLength:I

.field private final barMaxLength:I

.field private barPaint:Landroid/graphics/Paint;

.field private barSpinCycleTime:D

.field private barWidth:I

.field private callback:Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

.field private circleBounds:Landroid/graphics/RectF;

.field private circleRadius:I

.field private fillRadius:Z

.field private isSpinning:Z

.field private lastTimeAnimated:J

.field private linearProgress:Z

.field private mProgress:F

.field private mTargetProgress:F

.field private final pauseGrowingTime:J

.field private pausedTimeWithoutGrowing:J

.field private rimColor:I

.field private rimPaint:Landroid/graphics/Paint;

.field private rimWidth:I

.field private spinSpeed:F

.field private timeStartGrowing:D


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const-class v0, Lcom/pnikosis/materialishprogress/ProgressWheel;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v1, 0x4

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 98
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 36
    const/16 v0, 0x1c

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 37
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 38
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 40
    const/16 v0, 0x10

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barLength:I

    .line 41
    const/16 v0, 0x10e

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barMaxLength:I

    .line 43
    iput-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    .line 45
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    .line 46
    const-wide v0, 0x407cc00000000000L    # 460.0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    .line 47
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barGrowingFromFront:Z

    .line 50
    iput-wide v4, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pausedTimeWithoutGrowing:J

    .line 51
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pauseGrowingTime:J

    .line 54
    const/high16 v0, -0x56000000

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    .line 55
    const v0, 0xffffff

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    .line 58
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    .line 59
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    .line 62
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    .line 66
    const/high16 v0, 0x43660000    # 230.0f

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    .line 69
    iput-wide v4, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 73
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 74
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 75
    iput-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 99
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v1, 0x4

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 86
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    const/16 v0, 0x1c

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 37
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 38
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 40
    const/16 v0, 0x10

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barLength:I

    .line 41
    const/16 v0, 0x10e

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barMaxLength:I

    .line 43
    iput-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    .line 45
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    .line 46
    const-wide v0, 0x407cc00000000000L    # 460.0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    .line 47
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barGrowingFromFront:Z

    .line 50
    iput-wide v4, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pausedTimeWithoutGrowing:J

    .line 51
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pauseGrowingTime:J

    .line 54
    const/high16 v0, -0x56000000

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    .line 55
    const v0, 0xffffff

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    .line 58
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    .line 59
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    .line 62
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    .line 66
    const/high16 v0, 0x43660000    # 230.0f

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    .line 69
    iput-wide v4, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 73
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 74
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 75
    iput-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 88
    sget-object v0, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->parseAttributes(Landroid/content/res/TypedArray;)V

    .line 90
    return-void
.end method

.method private parseAttributes(Landroid/content/res/TypedArray;)V
    .registers 8
    .param p1, "a"    # Landroid/content/res/TypedArray;

    .prologue
    const/high16 v4, 0x43b40000    # 360.0f

    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 216
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 217
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    int-to-float v2, v2

    invoke-static {v3, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 218
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    int-to-float v2, v2

    invoke-static {v3, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 219
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    int-to-float v2, v2

    invoke-static {v3, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 221
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_circleRadius:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 223
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_fillRadius:I

    invoke-virtual {p1, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    .line 225
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_barWidth:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 227
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_rimWidth:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 229
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_spinSpeed:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    div-float/2addr v3, v4

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 230
    .local v0, "baseSpinSpeed":F
    mul-float v2, v0, v4

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    .line 232
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_barSpinCycleTime:I

    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    double-to-int v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    int-to-double v2, v2

    iput-wide v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    .line 234
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_barColor:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    .line 236
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_rimColor:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    .line 238
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_linearProgress:I

    invoke-virtual {p1, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->linearProgress:Z

    .line 240
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_progressIndeterminate:I

    invoke-virtual {p1, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    if-eqz v2, :cond_9a

    .line 241
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->spin()V

    .line 245
    :cond_9a
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 246
    return-void
.end method

.method private runCallback()V
    .registers 5

    .prologue
    const/high16 v3, 0x42c80000    # 100.0f

    .line 416
    iget-object v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->callback:Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    if-eqz v1, :cond_18

    .line 417
    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    mul-float/2addr v1, v3

    const/high16 v2, 0x43b40000    # 360.0f

    div-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    div-float v0, v1, v3

    .line 418
    .local v0, "normalizedProgress":F
    iget-object v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->callback:Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    invoke-interface {v1, v0}, Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;->onProgressUpdate(F)V

    .line 420
    .end local v0    # "normalizedProgress":F
    :cond_18
    return-void
.end method

.method private runCallback(F)V
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 410
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->callback:Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    if-eqz v0, :cond_9

    .line 411
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->callback:Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    invoke-interface {v0, p1}, Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;->onProgressUpdate(F)V

    .line 413
    :cond_9
    return-void
.end method

.method private setupBounds(II)V
    .registers 17
    .param p1, "layout_width"    # I
    .param p2, "layout_height"    # I

    .prologue
    .line 181
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingTop()I

    move-result v5

    .line 182
    .local v5, "paddingTop":I
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingBottom()I

    move-result v2

    .line 183
    .local v2, "paddingBottom":I
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingLeft()I

    move-result v3

    .line 184
    .local v3, "paddingLeft":I
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingRight()I

    move-result v4

    .line 186
    .local v4, "paddingRight":I
    iget-boolean v8, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    if-nez v8, :cond_57

    .line 188
    sub-int v8, p1, v3

    sub-int/2addr v8, v4

    sub-int v9, p2, v2

    sub-int/2addr v9, v5

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 191
    .local v1, "minValue":I
    iget v8, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    mul-int/lit8 v8, v8, 0x2

    iget v9, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    mul-int/lit8 v9, v9, 0x2

    sub-int/2addr v8, v9

    invoke-static {v1, v8}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 194
    .local v0, "circleDiameter":I
    sub-int v8, p1, v3

    sub-int/2addr v8, v4

    sub-int/2addr v8, v0

    div-int/lit8 v8, v8, 0x2

    add-int v6, v8, v3

    .line 195
    .local v6, "xOffset":I
    sub-int v8, p2, v5

    sub-int/2addr v8, v2

    sub-int/2addr v8, v0

    div-int/lit8 v8, v8, 0x2

    add-int v7, v8, v5

    .line 197
    .local v7, "yOffset":I
    new-instance v8, Landroid/graphics/RectF;

    iget v9, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    add-int/2addr v9, v6

    int-to-float v9, v9

    iget v10, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    add-int/2addr v10, v7

    int-to-float v10, v10

    add-int v11, v6, v0

    iget v12, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    sub-int/2addr v11, v12

    int-to-float v11, v11

    add-int v12, v7, v0

    iget v13, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    sub-int/2addr v12, v13

    int-to-float v12, v12

    invoke-direct {v8, v9, v10, v11, v12}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v8, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    .line 207
    .end local v0    # "circleDiameter":I
    .end local v1    # "minValue":I
    .end local v6    # "xOffset":I
    .end local v7    # "yOffset":I
    :goto_56
    return-void

    .line 202
    :cond_57
    new-instance v8, Landroid/graphics/RectF;

    iget v9, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    add-int/2addr v9, v3

    int-to-float v9, v9

    iget v10, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    add-int/2addr v10, v5

    int-to-float v10, v10

    sub-int v11, p1, v4

    iget v12, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    sub-int/2addr v11, v12

    int-to-float v11, v11

    sub-int v12, p2, v2

    iget v13, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    sub-int/2addr v12, v13

    int-to-float v12, v12

    invoke-direct {v8, v9, v10, v11, v12}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v8, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    goto :goto_56
.end method

.method private setupPaints()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 166
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 167
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 168
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 169
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 171
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 172
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 173
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 174
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 175
    return-void
.end method

.method private updateBarLength(J)V
    .registers 10
    .param p1, "deltaTimeInMilliSeconds"    # J

    .prologue
    .line 345
    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pausedTimeWithoutGrowing:J

    const-wide/16 v5, 0xc8

    cmp-long v3, v3, v5

    if-ltz v3, :cond_5f

    .line 346
    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    long-to-double v5, p1

    add-double/2addr v3, v5

    iput-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    .line 348
    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    iget-wide v5, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    cmpl-double v3, v3, v5

    if-lez v3, :cond_28

    .line 351
    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    iget-wide v5, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    sub-double/2addr v3, v5

    iput-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    .line 353
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pausedTimeWithoutGrowing:J

    .line 355
    iget-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barGrowingFromFront:Z

    if-nez v3, :cond_4d

    const/4 v3, 0x1

    :goto_26
    iput-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barGrowingFromFront:Z

    .line 358
    :cond_28
    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    iget-wide v5, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    div-double/2addr v3, v5

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

    add-float v1, v3, v4

    .line 359
    .local v1, "distance":F
    const/high16 v0, 0x437e0000    # 254.0f

    .line 361
    .local v0, "destLength":F
    iget-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barGrowingFromFront:Z

    if-eqz v3, :cond_4f

    .line 362
    mul-float v3, v1, v0

    iput v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    .line 371
    .end local v0    # "destLength":F
    .end local v1    # "distance":F
    :goto_4c
    return-void

    .line 355
    :cond_4d
    const/4 v3, 0x0

    goto :goto_26

    .line 364
    .restart local v0    # "destLength":F
    .restart local v1    # "distance":F
    :cond_4f
    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr v3, v1

    mul-float v2, v0, v3

    .line 365
    .local v2, "newLength":F
    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    iget v4, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    sub-float/2addr v4, v2

    add-float/2addr v3, v4

    iput v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 366
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    goto :goto_4c

    .line 369
    .end local v0    # "destLength":F
    .end local v1    # "distance":F
    .end local v2    # "newLength":F
    :cond_5f
    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pausedTimeWithoutGrowing:J

    add-long/2addr v3, p1

    iput-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pausedTimeWithoutGrowing:J

    goto :goto_4c
.end method


# virtual methods
.method public getBarColor()I
    .registers 2

    .prologue
    .line 600
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    return v0
.end method

.method public getBarWidth()I
    .registers 2

    .prologue
    .line 581
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    return v0
.end method

.method public getCircleRadius()I
    .registers 2

    .prologue
    .line 562
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    return v0
.end method

.method public getProgress()F
    .registers 3

    .prologue
    .line 543
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-eqz v0, :cond_7

    const/high16 v0, -0x40800000    # -1.0f

    :goto_6
    return v0

    :cond_7
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    const/high16 v1, 0x43b40000    # 360.0f

    div-float/2addr v0, v1

    goto :goto_6
.end method

.method public getRimColor()I
    .registers 2

    .prologue
    .line 620
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    return v0
.end method

.method public getRimWidth()I
    .registers 2

    .prologue
    .line 660
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    return v0
.end method

.method public getSpinSpeed()F
    .registers 3

    .prologue
    .line 642
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    const/high16 v1, 0x43b40000    # 360.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public isSpinning()Z
    .registers 2

    .prologue
    .line 378
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 20
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 261
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 263
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    const/high16 v3, 0x43b40000    # 360.0f

    const/high16 v4, 0x43b40000    # 360.0f

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 265
    const/4 v15, 0x0

    .line 267
    .local v15, "mustInvalidate":Z
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-eqz v1, :cond_90

    .line 269
    const/4 v15, 0x1

    .line 271
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    sub-long v12, v1, v5

    .line 272
    .local v12, "deltaTime":J
    long-to-float v1, v12

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    mul-float/2addr v1, v2

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float v11, v1, v2

    .line 274
    .local v11, "deltaNormalized":F
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/pnikosis/materialishprogress/ProgressWheel;->updateBarLength(J)V

    .line 276
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    add-float/2addr v1, v11

    move-object/from16 v0, p0

    iput v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 277
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    const/high16 v2, 0x43b40000    # 360.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_5b

    .line 278
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    const/high16 v2, 0x43b40000    # 360.0f

    sub-float/2addr v1, v2

    move-object/from16 v0, p0

    iput v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 283
    const/high16 v1, -0x40800000    # -1.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/pnikosis/materialishprogress/ProgressWheel;->runCallback(F)V

    .line 285
    :cond_5b
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    move-object/from16 v0, p0

    iput-wide v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 287
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    const/high16 v2, 0x42b40000    # 90.0f

    sub-float v3, v1, v2

    .line 288
    .local v3, "from":F
    const/high16 v1, 0x41800000    # 16.0f

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    add-float v4, v1, v2

    .line 290
    .local v4, "length":F
    invoke-virtual/range {p0 .. p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_7c

    .line 291
    const/4 v3, 0x0

    .line 292
    const/high16 v4, 0x43070000    # 135.0f

    .line 295
    :cond_7c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 330
    .end local v3    # "from":F
    .end local v4    # "length":F
    .end local v11    # "deltaNormalized":F
    .end local v12    # "deltaTime":J
    :goto_8a
    if-eqz v15, :cond_8f

    .line 331
    invoke-virtual/range {p0 .. p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 333
    :cond_8f
    return-void

    .line 298
    :cond_90
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    move/from16 v17, v0

    .line 300
    .local v17, "oldProgress":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_d0

    .line 302
    const/4 v15, 0x1

    .line 304
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    sub-long/2addr v1, v5

    long-to-float v1, v1

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float v12, v1, v2

    .line 305
    .local v12, "deltaTime":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    mul-float v11, v12, v1

    .line 307
    .restart local v11    # "deltaNormalized":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    add-float/2addr v1, v11

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 308
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    move-object/from16 v0, p0

    iput-wide v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 311
    .end local v11    # "deltaNormalized":F
    .end local v12    # "deltaTime":F
    :cond_d0
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    cmpl-float v1, v17, v1

    if-eqz v1, :cond_db

    .line 312
    invoke-direct/range {p0 .. p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->runCallback()V

    .line 315
    :cond_db
    const/16 v16, 0x0

    .line 316
    .local v16, "offset":F
    move-object/from16 v0, p0

    iget v8, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 317
    .local v8, "progress":F
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->linearProgress:Z

    if-nez v1, :cond_11c

    .line 318
    const/high16 v14, 0x40000000    # 2.0f

    .line 319
    .local v14, "factor":F
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    const/high16 v5, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v6, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    const/high16 v7, 0x43b40000    # 360.0f

    div-float/2addr v6, v7

    sub-float/2addr v5, v6

    float-to-double v5, v5

    const/high16 v7, 0x40000000    # 2.0f

    mul-float/2addr v7, v14

    float-to-double v9, v7

    invoke-static {v5, v6, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    sub-double/2addr v1, v5

    double-to-float v1, v1

    const/high16 v2, 0x43b40000    # 360.0f

    mul-float v16, v1, v2

    .line 320
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    const/high16 v5, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v6, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    const/high16 v7, 0x43b40000    # 360.0f

    div-float/2addr v6, v7

    sub-float/2addr v5, v6

    float-to-double v5, v5

    float-to-double v9, v14

    invoke-static {v5, v6, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    sub-double/2addr v1, v5

    double-to-float v1, v1

    const/high16 v2, 0x43b40000    # 360.0f

    mul-float v8, v1, v2

    .line 323
    .end local v14    # "factor":F
    :cond_11c
    invoke-virtual/range {p0 .. p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_124

    .line 324
    const/high16 v8, 0x43b40000    # 360.0f

    .line 327
    :cond_124
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    const/high16 v1, 0x42b40000    # 90.0f

    sub-float v7, v16, v1

    const/4 v9, 0x0

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    move-object/from16 v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto/16 :goto_8a
.end method

.method protected onMeasure(II)V
    .registers 15
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v11, -0x80000000

    const/high16 v10, 0x40000000    # 2.0f

    .line 107
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 109
    iget v8, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingLeft()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingRight()I

    move-result v9

    add-int v4, v8, v9

    .line 110
    .local v4, "viewWidth":I
    iget v8, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingTop()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingBottom()I

    move-result v9

    add-int v3, v8, v9

    .line 112
    .local v3, "viewHeight":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v6

    .line 113
    .local v6, "widthMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v7

    .line 114
    .local v7, "widthSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 115
    .local v1, "heightMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 121
    .local v2, "heightSize":I
    if-ne v6, v10, :cond_3d

    .line 123
    move v5, v7

    .line 133
    .local v5, "width":I
    :goto_34
    if-eq v1, v10, :cond_38

    if-ne v6, v10, :cond_46

    .line 135
    :cond_38
    move v0, v2

    .line 144
    .local v0, "height":I
    :goto_39
    invoke-virtual {p0, v5, v0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setMeasuredDimension(II)V

    .line 145
    return-void

    .line 124
    .end local v0    # "height":I
    .end local v5    # "width":I
    :cond_3d
    if-ne v6, v11, :cond_44

    .line 126
    invoke-static {v4, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    .restart local v5    # "width":I
    goto :goto_34

    .line 129
    .end local v5    # "width":I
    :cond_44
    move v5, v4

    .restart local v5    # "width":I
    goto :goto_34

    .line 136
    :cond_46
    if-ne v1, v11, :cond_4d

    .line 138
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .restart local v0    # "height":I
    goto :goto_39

    .line 141
    .end local v0    # "height":I
    :cond_4d
    move v0, v3

    .restart local v0    # "height":I
    goto :goto_39
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 511
    instance-of v1, p1, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;

    if-nez v1, :cond_8

    .line 512
    invoke-super {p0, p1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 532
    :goto_7
    return-void

    :cond_8
    move-object v0, p1

    .line 516
    check-cast v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;

    .line 517
    .local v0, "ss":Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;
    invoke-virtual {v0}, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 519
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mProgress:F

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 520
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mTargetProgress:F

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 521
    iget-boolean v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->isSpinning:Z

    iput-boolean v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 522
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->spinSpeed:F

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    .line 523
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barWidth:I

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 524
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barColor:I

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    .line 525
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimWidth:I

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 526
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimColor:I

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    .line 527
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->circleRadius:I

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 528
    iget-boolean v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->linearProgress:Z

    iput-boolean v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->linearProgress:Z

    .line 529
    iget-boolean v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->fillRadius:Z

    iput-boolean v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    .line 531
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    goto :goto_7
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 489
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 491
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;

    invoke-direct {v0, v1}, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 494
    .local v0, "ss":Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mProgress:F

    .line 495
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mTargetProgress:F

    .line 496
    iget-boolean v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    iput-boolean v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->isSpinning:Z

    .line 497
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->spinSpeed:F

    .line 498
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barWidth:I

    .line 499
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barColor:I

    .line 500
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimWidth:I

    .line 501
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimColor:I

    .line 502
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->circleRadius:I

    .line 503
    iget-boolean v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->linearProgress:Z

    iput-boolean v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->linearProgress:Z

    .line 504
    iget-boolean v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    iput-boolean v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->fillRadius:Z

    .line 506
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 5
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 154
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 156
    invoke-direct {p0, p1, p2}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setupBounds(II)V

    .line 157
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setupPaints()V

    .line 158
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 159
    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .registers 5
    .param p1, "changedView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "visibility"    # I

    .prologue
    .line 337
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 339
    if-nez p2, :cond_b

    .line 340
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 342
    :cond_b
    return-void
.end method

.method public resetCount()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 385
    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 386
    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 387
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 388
    return-void
.end method

.method public setBarColor(I)V
    .registers 3
    .param p1, "barColor"    # I

    .prologue
    .line 609
    iput p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    .line 610
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setupPaints()V

    .line 611
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_c

    .line 612
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 614
    :cond_c
    return-void
.end method

.method public setBarWidth(I)V
    .registers 3
    .param p1, "barWidth"    # I

    .prologue
    .line 590
    iput p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 591
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_9

    .line 592
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 594
    :cond_9
    return-void
.end method

.method public setCallback(Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;)V
    .registers 3
    .param p1, "progressCallback"    # Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    .prologue
    .line 249
    iput-object p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->callback:Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    .line 251
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_9

    .line 252
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->runCallback()V

    .line 254
    :cond_9
    return-void
.end method

.method public setCircleRadius(I)V
    .registers 3
    .param p1, "circleRadius"    # I

    .prologue
    .line 571
    iput p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 572
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_9

    .line 573
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 575
    :cond_9
    return-void
.end method

.method public setInstantProgress(F)V
    .registers 6
    .param p1, "progress"    # F

    .prologue
    const/high16 v3, 0x43b40000    # 360.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 465
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-eqz v0, :cond_e

    .line 466
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 467
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 470
    :cond_e
    cmpl-float v0, p1, v2

    if-lez v0, :cond_1a

    .line 471
    sub-float/2addr p1, v2

    .line 476
    :cond_13
    :goto_13
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_20

    .line 484
    :goto_19
    return-void

    .line 472
    :cond_1a
    cmpg-float v0, p1, v1

    if-gez v0, :cond_13

    .line 473
    const/4 p1, 0x0

    goto :goto_13

    .line 480
    :cond_20
    mul-float v0, p1, v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 481
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 482
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 483
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    goto :goto_19
.end method

.method public setLinearProgress(Z)V
    .registers 3
    .param p1, "isLinear"    # Z

    .prologue
    .line 552
    iput-boolean p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->linearProgress:Z

    .line 553
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_9

    .line 554
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 556
    :cond_9
    return-void
.end method

.method public setProgress(F)V
    .registers 6
    .param p1, "progress"    # F

    .prologue
    const/high16 v3, 0x43b40000    # 360.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 429
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-eqz v0, :cond_11

    .line 430
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 431
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 433
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->runCallback()V

    .line 436
    :cond_11
    cmpl-float v0, p1, v2

    if-lez v0, :cond_1d

    .line 437
    sub-float/2addr p1, v2

    .line 442
    :cond_16
    :goto_16
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_23

    .line 456
    :goto_1c
    return-void

    .line 438
    :cond_1d
    cmpg-float v0, p1, v1

    if-gez v0, :cond_16

    .line 439
    const/4 p1, 0x0

    goto :goto_16

    .line 449
    :cond_23
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_31

    .line 450
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 453
    :cond_31
    mul-float v0, p1, v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 455
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    goto :goto_1c
.end method

.method public setRimColor(I)V
    .registers 3
    .param p1, "rimColor"    # I

    .prologue
    .line 629
    iput p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    .line 630
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setupPaints()V

    .line 631
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_c

    .line 632
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 634
    :cond_c
    return-void
.end method

.method public setRimWidth(I)V
    .registers 3
    .param p1, "rimWidth"    # I

    .prologue
    .line 669
    iput p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 670
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_9

    .line 671
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 673
    :cond_9
    return-void
.end method

.method public setSpinSpeed(F)V
    .registers 3
    .param p1, "spinSpeed"    # F

    .prologue
    .line 653
    const/high16 v0, 0x43b40000    # 360.0f

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    .line 654
    return-void
.end method

.method public spin()V
    .registers 3

    .prologue
    .line 404
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 405
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 406
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 407
    return-void
.end method

.method public stopSpinning()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 394
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 395
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 396
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 397
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 398
    return-void
.end method
