.class public Lcom/pnikosis/materialishprogress/ProgressWheel;
.super Landroid/view/View;
.source "ProgressWheel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;,
        Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;
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

.field private shouldAnimate:Z

.field private spinSpeed:F

.field private timeStartGrowing:D


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    const-class v0, Lcom/pnikosis/materialishprogress/ProgressWheel;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v5, 0x0

    const/4 v4, 0x4

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 92
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 31
    const/16 v0, 0x10

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barLength:I

    .line 32
    const/16 v0, 0x10e

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barMaxLength:I

    .line 33
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pauseGrowingTime:J

    .line 40
    const/16 v0, 0x1c

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 41
    iput v4, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 42
    iput v4, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 43
    iput-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    .line 44
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    .line 45
    const-wide v0, 0x407cc00000000000L    # 460.0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    .line 46
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barGrowingFromFront:Z

    .line 48
    iput-wide v5, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pausedTimeWithoutGrowing:J

    .line 50
    const/high16 v0, -0x56000000

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    .line 51
    const v0, 0xffffff

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    .line 54
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    .line 55
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    .line 58
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    .line 62
    const/high16 v0, 0x43660000    # 230.0f

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    .line 65
    iput-wide v5, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 69
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 70
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 71
    iput-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 93
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setAnimationEnabled()V

    .line 94
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const-wide/16 v5, 0x0

    const/4 v4, 0x4

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 81
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    const/16 v0, 0x10

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barLength:I

    .line 32
    const/16 v0, 0x10e

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barMaxLength:I

    .line 33
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pauseGrowingTime:J

    .line 40
    const/16 v0, 0x1c

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 41
    iput v4, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 42
    iput v4, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 43
    iput-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    .line 44
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    .line 45
    const-wide v0, 0x407cc00000000000L    # 460.0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    .line 46
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barGrowingFromFront:Z

    .line 48
    iput-wide v5, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pausedTimeWithoutGrowing:J

    .line 50
    const/high16 v0, -0x56000000

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    .line 51
    const v0, 0xffffff

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    .line 54
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    .line 55
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    .line 58
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    .line 62
    const/high16 v0, 0x43660000    # 230.0f

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    .line 65
    iput-wide v5, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 69
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 70
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 71
    iput-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 83
    sget-object v0, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->parseAttributes(Landroid/content/res/TypedArray;)V

    .line 85
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setAnimationEnabled()V

    .line 86
    return-void
.end method

.method private parseAttributes(Landroid/content/res/TypedArray;)V
    .registers 8
    .param p1, "a"    # Landroid/content/res/TypedArray;

    .prologue
    const/high16 v4, 0x43b40000    # 360.0f

    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 221
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 222
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    int-to-float v2, v2

    invoke-static {v3, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 223
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    int-to-float v2, v2

    invoke-static {v3, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 224
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    int-to-float v2, v2

    .line 225
    invoke-static {v3, v2, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 227
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_circleRadius:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    int-to-float v3, v3

    .line 228
    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 230
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_fillRadius:I

    invoke-virtual {p1, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    .line 232
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_barWidth:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 234
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_rimWidth:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 236
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_spinSpeed:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    div-float/2addr v3, v4

    .line 237
    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 238
    .local v0, "baseSpinSpeed":F
    mul-float v2, v0, v4

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    .line 240
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_barSpinCycleTime:I

    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    double-to-int v3, v3

    .line 241
    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    int-to-double v2, v2

    iput-wide v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    .line 243
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_barColor:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    .line 245
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_rimColor:I

    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    .line 247
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_linearProgress:I

    invoke-virtual {p1, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->linearProgress:Z

    .line 249
    sget v2, Lcom/pnikosis/materialishprogress/R$styleable;->ProgressWheel_matProg_progressIndeterminate:I

    invoke-virtual {p1, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    if-eqz v2, :cond_9a

    .line 250
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->spin()V

    .line 254
    :cond_9a
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 255
    return-void
.end method

.method private runCallback()V
    .registers 5

    .prologue
    const/high16 v3, 0x42c80000    # 100.0f

    .line 428
    iget-object v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->callback:Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    if-eqz v1, :cond_18

    .line 429
    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    mul-float/2addr v1, v3

    const/high16 v2, 0x43b40000    # 360.0f

    div-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    div-float v0, v1, v3

    .line 430
    .local v0, "normalizedProgress":F
    iget-object v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->callback:Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    invoke-interface {v1, v0}, Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;->onProgressUpdate(F)V

    .line 432
    .end local v0    # "normalizedProgress":F
    :cond_18
    return-void
.end method

.method private runCallback(F)V
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 422
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->callback:Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    if-eqz v0, :cond_9

    .line 423
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->callback:Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    invoke-interface {v0, p1}, Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;->onProgressUpdate(F)V

    .line 425
    :cond_9
    return-void
.end method

.method private setAnimationEnabled()V
    .registers 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    .line 97
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 100
    .local v1, "currentApiVersion":I
    const/16 v2, 0x11

    if-lt v1, v2, :cond_1f

    .line 101
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "animator_duration_scale"

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Global;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    move-result v0

    .line 108
    .local v0, "animationValue":F
    :goto_16
    const/4 v2, 0x0

    cmpl-float v2, v0, v2

    if-eqz v2, :cond_2e

    const/4 v2, 0x1

    :goto_1c
    iput-boolean v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->shouldAnimate:Z

    .line 109
    return-void

    .line 104
    .end local v0    # "animationValue":F
    :cond_1f
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "animator_duration_scale"

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    move-result v0

    .restart local v0    # "animationValue":F
    goto :goto_16

    .line 108
    :cond_2e
    const/4 v2, 0x0

    goto :goto_1c
.end method

.method private setupBounds(II)V
    .registers 17
    .param p1, "layout_width"    # I
    .param p2, "layout_height"    # I

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingTop()I

    move-result v5

    .line 190
    .local v5, "paddingTop":I
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingBottom()I

    move-result v2

    .line 191
    .local v2, "paddingBottom":I
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingLeft()I

    move-result v3

    .line 192
    .local v3, "paddingLeft":I
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingRight()I

    move-result v4

    .line 194
    .local v4, "paddingRight":I
    iget-boolean v8, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    if-nez v8, :cond_57

    .line 196
    sub-int v8, p1, v3

    sub-int/2addr v8, v4

    sub-int v9, p2, v2

    sub-int/2addr v9, v5

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 199
    .local v1, "minValue":I
    iget v8, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    mul-int/lit8 v8, v8, 0x2

    iget v9, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    mul-int/lit8 v9, v9, 0x2

    sub-int/2addr v8, v9

    invoke-static {v1, v8}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 202
    .local v0, "circleDiameter":I
    sub-int v8, p1, v3

    sub-int/2addr v8, v4

    sub-int/2addr v8, v0

    div-int/lit8 v8, v8, 0x2

    add-int v6, v8, v3

    .line 203
    .local v6, "xOffset":I
    sub-int v8, p2, v5

    sub-int/2addr v8, v2

    sub-int/2addr v8, v0

    div-int/lit8 v8, v8, 0x2

    add-int v7, v8, v5

    .line 205
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

    .line 212
    .end local v0    # "circleDiameter":I
    .end local v1    # "minValue":I
    .end local v6    # "xOffset":I
    .end local v7    # "yOffset":I
    :goto_56
    return-void

    .line 209
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

    .line 174
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 175
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 176
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 177
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 179
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 180
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 181
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 182
    iget-object v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 183
    return-void
.end method

.method private updateBarLength(J)V
    .registers 10
    .param p1, "deltaTimeInMilliSeconds"    # J

    .prologue
    .line 356
    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pausedTimeWithoutGrowing:J

    const-wide/16 v5, 0xc8

    cmp-long v3, v3, v5

    if-ltz v3, :cond_5f

    .line 357
    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    long-to-double v5, p1

    add-double/2addr v3, v5

    iput-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    .line 359
    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    iget-wide v5, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    cmpl-double v3, v3, v5

    if-lez v3, :cond_28

    .line 362
    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    iget-wide v5, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    sub-double/2addr v3, v5

    iput-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    .line 364
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->pausedTimeWithoutGrowing:J

    .line 366
    iget-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barGrowingFromFront:Z

    if-nez v3, :cond_4d

    const/4 v3, 0x1

    :goto_26
    iput-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barGrowingFromFront:Z

    .line 369
    :cond_28
    iget-wide v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->timeStartGrowing:D

    iget-wide v5, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barSpinCycleTime:D

    div-double/2addr v3, v5

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    add-double/2addr v3, v5

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v3, v5

    .line 370
    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    const/high16 v4, 0x3f000000    # 0.5f

    add-float v1, v3, v4

    .line 371
    .local v1, "distance":F
    const/high16 v0, 0x437e0000    # 254.0f

    .line 373
    .local v0, "destLength":F
    iget-boolean v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barGrowingFromFront:Z

    if-eqz v3, :cond_4f

    .line 374
    mul-float v3, v1, v0

    iput v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    .line 383
    .end local v0    # "destLength":F
    .end local v1    # "distance":F
    :goto_4c
    return-void

    .line 366
    :cond_4d
    const/4 v3, 0x0

    goto :goto_26

    .line 376
    .restart local v0    # "destLength":F
    .restart local v1    # "distance":F
    :cond_4f
    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr v3, v1

    mul-float v2, v0, v3

    .line 377
    .local v2, "newLength":F
    iget v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    iget v4, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    sub-float/2addr v4, v2

    add-float/2addr v3, v4

    iput v3, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 378
    iput v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    goto :goto_4c

    .line 381
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
    .line 610
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    return v0
.end method

.method public getBarWidth()I
    .registers 2

    .prologue
    .line 591
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    return v0
.end method

.method public getCircleRadius()I
    .registers 2

    .prologue
    .line 572
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    return v0
.end method

.method public getProgress()F
    .registers 3

    .prologue
    .line 513
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
    .line 630
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    return v0
.end method

.method public getRimWidth()I
    .registers 2

    .prologue
    .line 670
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    return v0
.end method

.method public getSpinSpeed()F
    .registers 3

    .prologue
    .line 652
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    const/high16 v1, 0x43b40000    # 360.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public isSpinning()Z
    .registers 2

    .prologue
    .line 390
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 20
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 270
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 272
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    const/high16 v3, 0x43b40000    # 360.0f

    const/high16 v4, 0x43b40000    # 360.0f

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 274
    const/4 v15, 0x0

    .line 276
    .local v15, "mustInvalidate":Z
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->shouldAnimate:Z

    if-nez v1, :cond_1d

    .line 345
    :cond_1c
    :goto_1c
    return-void

    .line 280
    :cond_1d
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-eqz v1, :cond_97

    .line 282
    const/4 v15, 0x1

    .line 284
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    sub-long v12, v1, v5

    .line 285
    .local v12, "deltaTime":J
    long-to-float v1, v12

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    mul-float/2addr v1, v2

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float v11, v1, v2

    .line 287
    .local v11, "deltaNormalized":F
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/pnikosis/materialishprogress/ProgressWheel;->updateBarLength(J)V

    .line 289
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    add-float/2addr v1, v11

    move-object/from16 v0, p0

    iput v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 290
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    const/high16 v2, 0x43b40000    # 360.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_62

    .line 291
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    const/high16 v2, 0x43b40000    # 360.0f

    sub-float/2addr v1, v2

    move-object/from16 v0, p0

    iput v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 296
    const/high16 v1, -0x40800000    # -1.0f

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/pnikosis/materialishprogress/ProgressWheel;->runCallback(F)V

    .line 298
    :cond_62
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    move-object/from16 v0, p0

    iput-wide v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 300
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    const/high16 v2, 0x42b40000    # 90.0f

    sub-float v3, v1, v2

    .line 301
    .local v3, "from":F
    const/high16 v1, 0x41800000    # 16.0f

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barExtraLength:F

    add-float v4, v1, v2

    .line 303
    .local v4, "length":F
    invoke-virtual/range {p0 .. p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_83

    .line 304
    const/4 v3, 0x0

    .line 305
    const/high16 v4, 0x43070000    # 135.0f

    .line 308
    :cond_83
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 342
    .end local v3    # "from":F
    .end local v4    # "length":F
    .end local v11    # "deltaNormalized":F
    .end local v12    # "deltaTime":J
    :goto_91
    if-eqz v15, :cond_1c

    .line 343
    invoke-virtual/range {p0 .. p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    goto :goto_1c

    .line 310
    :cond_97
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    move/from16 v17, v0

    .line 312
    .local v17, "oldProgress":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_d7

    .line 314
    const/4 v15, 0x1

    .line 316
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    move-object/from16 v0, p0

    iget-wide v5, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    sub-long/2addr v1, v5

    long-to-float v1, v1

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float v12, v1, v2

    .line 317
    .local v12, "deltaTime":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    mul-float v11, v12, v1

    .line 319
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

    .line 320
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    move-object/from16 v0, p0

    iput-wide v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 323
    .end local v11    # "deltaNormalized":F
    .end local v12    # "deltaTime":F
    :cond_d7
    move-object/from16 v0, p0

    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    cmpl-float v1, v17, v1

    if-eqz v1, :cond_e2

    .line 324
    invoke-direct/range {p0 .. p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->runCallback()V

    .line 327
    :cond_e2
    const/16 v16, 0x0

    .line 328
    .local v16, "offset":F
    move-object/from16 v0, p0

    iget v8, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 329
    .local v8, "progress":F
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->linearProgress:Z

    if-nez v1, :cond_123

    .line 330
    const/high16 v14, 0x40000000    # 2.0f

    .line 331
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

    .line 332
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

    .line 335
    .end local v14    # "factor":F
    :cond_123
    invoke-virtual/range {p0 .. p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_12b

    .line 336
    const/high16 v8, 0x43b40000    # 360.0f

    .line 339
    :cond_12b
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleBounds:Landroid/graphics/RectF;

    const/high16 v1, 0x42b40000    # 90.0f

    sub-float v7, v16, v1

    const/4 v9, 0x0

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barPaint:Landroid/graphics/Paint;

    move-object/from16 v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto/16 :goto_91
.end method

.method protected onMeasure(II)V
    .registers 15
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v11, -0x80000000

    const/high16 v10, 0x40000000    # 2.0f

    .line 116
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 118
    iget v8, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingLeft()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingRight()I

    move-result v9

    add-int v4, v8, v9

    .line 119
    .local v4, "viewWidth":I
    iget v8, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingTop()I

    move-result v9

    add-int/2addr v8, v9

    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->getPaddingBottom()I

    move-result v9

    add-int v3, v8, v9

    .line 121
    .local v3, "viewHeight":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v6

    .line 122
    .local v6, "widthMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v7

    .line 123
    .local v7, "widthSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 124
    .local v1, "heightMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 130
    .local v2, "heightSize":I
    if-ne v6, v10, :cond_3d

    .line 132
    move v5, v7

    .line 142
    .local v5, "width":I
    :goto_34
    if-eq v1, v10, :cond_38

    if-ne v6, v10, :cond_46

    .line 144
    :cond_38
    move v0, v2

    .line 153
    .local v0, "height":I
    :goto_39
    invoke-virtual {p0, v5, v0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setMeasuredDimension(II)V

    .line 154
    return-void

    .line 133
    .end local v0    # "height":I
    .end local v5    # "width":I
    :cond_3d
    if-ne v6, v11, :cond_44

    .line 135
    invoke-static {v4, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    .restart local v5    # "width":I
    goto :goto_34

    .line 138
    .end local v5    # "width":I
    :cond_44
    move v5, v4

    .restart local v5    # "width":I
    goto :goto_34

    .line 145
    :cond_46
    if-ne v1, v11, :cond_4d

    .line 147
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .restart local v0    # "height":I
    goto :goto_39

    .line 150
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
    .line 485
    instance-of v1, p1, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;

    if-nez v1, :cond_8

    .line 486
    invoke-super {p0, p1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 506
    :goto_7
    return-void

    :cond_8
    move-object v0, p1

    .line 490
    check-cast v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;

    .line 491
    .local v0, "ss":Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;
    invoke-virtual {v0}, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 493
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mProgress:F

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 494
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mTargetProgress:F

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 495
    iget-boolean v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->isSpinning:Z

    iput-boolean v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 496
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->spinSpeed:F

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    .line 497
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barWidth:I

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 498
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barColor:I

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    .line 499
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimWidth:I

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 500
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimColor:I

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    .line 501
    iget v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->circleRadius:I

    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 502
    iget-boolean v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->linearProgress:Z

    iput-boolean v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->linearProgress:Z

    .line 503
    iget-boolean v1, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->fillRadius:Z

    iput-boolean v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    .line 505
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    goto :goto_7
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 464
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 466
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;

    invoke-direct {v0, v1}, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 469
    .local v0, "ss":Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mProgress:F

    .line 470
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->mTargetProgress:F

    .line 471
    iget-boolean v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    iput-boolean v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->isSpinning:Z

    .line 472
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->spinSpeed:F

    .line 473
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barWidth:I

    .line 474
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->barColor:I

    .line 475
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimWidth:I

    .line 476
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->rimColor:I

    .line 477
    iget v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    iput v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->circleRadius:I

    .line 478
    iget-boolean v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->linearProgress:Z

    iput-boolean v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->linearProgress:Z

    .line 479
    iget-boolean v2, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->fillRadius:Z

    iput-boolean v2, v0, Lcom/pnikosis/materialishprogress/ProgressWheel$WheelSavedState;->fillRadius:Z

    .line 481
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 5
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 162
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 164
    invoke-direct {p0, p1, p2}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setupBounds(II)V

    .line 165
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setupPaints()V

    .line 166
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 167
    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .registers 5
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .prologue
    .line 348
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 350
    if-nez p2, :cond_b

    .line 351
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 353
    :cond_b
    return-void
.end method

.method public resetCount()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 397
    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 398
    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 399
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 400
    return-void
.end method

.method public setBarColor(I)V
    .registers 3
    .param p1, "barColor"    # I

    .prologue
    .line 619
    iput p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barColor:I

    .line 620
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setupPaints()V

    .line 621
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_c

    .line 622
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 624
    :cond_c
    return-void
.end method

.method public setBarWidth(I)V
    .registers 3
    .param p1, "barWidth"    # I

    .prologue
    .line 600
    iput p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->barWidth:I

    .line 601
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_9

    .line 602
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 604
    :cond_9
    return-void
.end method

.method public setCallback(Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;)V
    .registers 3
    .param p1, "progressCallback"    # Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    .prologue
    .line 258
    iput-object p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->callback:Lcom/pnikosis/materialishprogress/ProgressWheel$ProgressCallback;

    .line 260
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_9

    .line 261
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->runCallback()V

    .line 263
    :cond_9
    return-void
.end method

.method public setCircleRadius(I)V
    .registers 3
    .param p1, "circleRadius"    # I

    .prologue
    .line 581
    iput p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->circleRadius:I

    .line 582
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_9

    .line 583
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 585
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

    .line 441
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-eqz v0, :cond_e

    .line 442
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 443
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 446
    :cond_e
    cmpl-float v0, p1, v2

    if-lez v0, :cond_1a

    .line 447
    sub-float/2addr p1, v2

    .line 452
    :cond_13
    :goto_13
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_20

    .line 460
    :goto_19
    return-void

    .line 448
    :cond_1a
    cmpg-float v0, p1, v1

    if-gez v0, :cond_13

    .line 449
    const/4 p1, 0x0

    goto :goto_13

    .line 456
    :cond_20
    mul-float v0, p1, v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 457
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 458
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 459
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    goto :goto_19
.end method

.method public setLinearProgress(Z)V
    .registers 3
    .param p1, "isLinear"    # Z

    .prologue
    .line 562
    iput-boolean p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->linearProgress:Z

    .line 563
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_9

    .line 564
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 566
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

    .line 527
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-eqz v0, :cond_11

    .line 528
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 529
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 531
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->runCallback()V

    .line 534
    :cond_11
    cmpl-float v0, p1, v2

    if-lez v0, :cond_1d

    .line 535
    sub-float/2addr p1, v2

    .line 540
    :cond_16
    :goto_16
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_23

    .line 554
    :goto_1c
    return-void

    .line 536
    :cond_1d
    cmpg-float v0, p1, v1

    if-gez v0, :cond_16

    .line 537
    const/4 p1, 0x0

    goto :goto_16

    .line 547
    :cond_23
    iget v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    iget v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_31

    .line 548
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 551
    :cond_31
    mul-float v0, p1, v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 553
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    goto :goto_1c
.end method

.method public setRimColor(I)V
    .registers 3
    .param p1, "rimColor"    # I

    .prologue
    .line 639
    iput p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimColor:I

    .line 640
    invoke-direct {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->setupPaints()V

    .line 641
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_c

    .line 642
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 644
    :cond_c
    return-void
.end method

.method public setRimWidth(I)V
    .registers 3
    .param p1, "rimWidth"    # I

    .prologue
    .line 679
    iput p1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->rimWidth:I

    .line 680
    iget-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    if-nez v0, :cond_9

    .line 681
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 683
    :cond_9
    return-void
.end method

.method public setSpinSpeed(F)V
    .registers 3
    .param p1, "spinSpeed"    # F

    .prologue
    .line 663
    const/high16 v0, 0x43b40000    # 360.0f

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->spinSpeed:F

    .line 664
    return-void
.end method

.method public spin()V
    .registers 3

    .prologue
    .line 416
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->lastTimeAnimated:J

    .line 417
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 418
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 419
    return-void
.end method

.method public stopSpinning()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 406
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->isSpinning:Z

    .line 407
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mProgress:F

    .line 408
    iput v1, p0, Lcom/pnikosis/materialishprogress/ProgressWheel;->mTargetProgress:F

    .line 409
    invoke-virtual {p0}, Lcom/pnikosis/materialishprogress/ProgressWheel;->invalidate()V

    .line 410
    return-void
.end method
