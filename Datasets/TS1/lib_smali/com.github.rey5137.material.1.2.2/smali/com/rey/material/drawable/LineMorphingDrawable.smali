.class public Lcom/rey/material/drawable/LineMorphingDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "LineMorphingDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/drawable/LineMorphingDrawable$Builder;,
        Lcom/rey/material/drawable/LineMorphingDrawable$State;
    }
.end annotation


# instance fields
.field private mAnimDuration:I

.field private mAnimProgress:F

.field private mClockwise:Z

.field private mCurState:I

.field private mDrawBound:Landroid/graphics/RectF;

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mIsRtl:Z

.field private mPaddingBottom:I

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaddingTop:I

.field private mPaint:Landroid/graphics/Paint;

.field private mPath:Landroid/graphics/Path;

.field private mPrevState:I

.field private mRunning:Z

.field private mStartTime:J

.field private mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

.field private mStrokeCap:Landroid/graphics/Paint$Cap;

.field private mStrokeColor:I

.field private mStrokeJoin:Landroid/graphics/Paint$Join;

.field private mStrokeSize:I

.field private final mUpdater:Ljava/lang/Runnable;


# direct methods
.method private constructor <init>([Lcom/rey/material/drawable/LineMorphingDrawable$State;IIIIIILandroid/view/animation/Interpolator;IILandroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;ZZ)V
    .registers 18
    .param p1, "states"    # [Lcom/rey/material/drawable/LineMorphingDrawable$State;
    .param p2, "curState"    # I
    .param p3, "paddingLeft"    # I
    .param p4, "paddingTop"    # I
    .param p5, "paddingRight"    # I
    .param p6, "paddingBottom"    # I
    .param p7, "animDuration"    # I
    .param p8, "interpolator"    # Landroid/view/animation/Interpolator;
    .param p9, "strokeSize"    # I
    .param p10, "strokeColor"    # I
    .param p11, "strokeCap"    # Landroid/graphics/Paint$Cap;
    .param p12, "strokeJoin"    # Landroid/graphics/Paint$Join;
    .param p13, "clockwise"    # Z
    .param p14, "isRtl"    # Z

    .prologue
    .line 64
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 36
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mRunning:Z

    .line 40
    const/16 v1, 0xc

    iput v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingLeft:I

    .line 41
    const/16 v1, 0xc

    iput v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingTop:I

    .line 42
    const/16 v1, 0xc

    iput v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingRight:I

    .line 43
    const/16 v1, 0xc

    iput v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingBottom:I

    .line 351
    new-instance v1, Lcom/rey/material/drawable/LineMorphingDrawable$1;

    invoke-direct {v1, p0}, Lcom/rey/material/drawable/LineMorphingDrawable$1;-><init>(Lcom/rey/material/drawable/LineMorphingDrawable;)V

    iput-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mUpdater:Ljava/lang/Runnable;

    .line 65
    iput-object p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    .line 66
    iput p3, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingLeft:I

    .line 67
    iput p4, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingTop:I

    .line 68
    iput p5, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingRight:I

    .line 69
    iput p6, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingBottom:I

    .line 71
    iput p7, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimDuration:I

    .line 72
    iput-object p8, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 73
    iput p9, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStrokeSize:I

    .line 74
    iput p10, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStrokeColor:I

    .line 75
    iput-object p11, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStrokeCap:Landroid/graphics/Paint$Cap;

    .line 76
    iput-object p12, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStrokeJoin:Landroid/graphics/Paint$Join;

    .line 77
    move/from16 v0, p13

    iput-boolean v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mClockwise:Z

    .line 78
    move/from16 v0, p14

    iput-boolean v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mIsRtl:Z

    .line 80
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaint:Landroid/graphics/Paint;

    .line 81
    iget-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 82
    iget-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 83
    iget-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStrokeCap:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 84
    iget-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStrokeJoin:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 85
    iget-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStrokeColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    iget-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStrokeSize:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 88
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    .line 90
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPath:Landroid/graphics/Path;

    .line 92
    const/4 v1, 0x0

    invoke-virtual {p0, p2, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->switchLineState(IZ)V

    .line 93
    return-void
.end method

.method synthetic constructor <init>([Lcom/rey/material/drawable/LineMorphingDrawable$State;IIIIIILandroid/view/animation/Interpolator;IILandroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;ZZLcom/rey/material/drawable/LineMorphingDrawable$1;)V
    .registers 16
    .param p1, "x0"    # [Lcom/rey/material/drawable/LineMorphingDrawable$State;
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # I
    .param p5, "x4"    # I
    .param p6, "x5"    # I
    .param p7, "x6"    # I
    .param p8, "x7"    # Landroid/view/animation/Interpolator;
    .param p9, "x8"    # I
    .param p10, "x9"    # I
    .param p11, "x10"    # Landroid/graphics/Paint$Cap;
    .param p12, "x11"    # Landroid/graphics/Paint$Join;
    .param p13, "x12"    # Z
    .param p14, "x13"    # Z
    .param p15, "x14"    # Lcom/rey/material/drawable/LineMorphingDrawable$1;

    .prologue
    .line 34
    invoke-direct/range {p0 .. p14}, Lcom/rey/material/drawable/LineMorphingDrawable;-><init>([Lcom/rey/material/drawable/LineMorphingDrawable$State;IIIIIILandroid/view/animation/Interpolator;IILandroid/graphics/Paint$Cap;Landroid/graphics/Paint$Join;ZZ)V

    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/drawable/LineMorphingDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/LineMorphingDrawable;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->update()V

    return-void
.end method

.method private getX(F)F
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 308
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    return v0
.end method

.method private getY(F)F
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 312
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    return v0
.end method

.method private resetAnimation()V
    .registers 3

    .prologue
    .line 318
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStartTime:J

    .line 319
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    .line 320
    return-void
.end method

.method private update()V
    .registers 9

    .prologue
    const/high16 v5, 0x3f800000    # 1.0f

    .line 361
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 362
    .local v0, "curTime":J
    iget-wide v3, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStartTime:J

    sub-long v3, v0, v3

    long-to-float v3, v3

    iget v4, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimDuration:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-static {v5, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 364
    .local v2, "value":F
    cmpl-float v3, v2, v5

    if-nez v3, :cond_32

    .line 365
    iget v3, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    invoke-virtual {p0, v3, v5}, Lcom/rey/material/drawable/LineMorphingDrawable;->setLineState(IF)Z

    .line 366
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mRunning:Z

    .line 371
    :goto_1f
    invoke-virtual {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_31

    .line 372
    iget-object v3, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    const-wide/16 v6, 0x10

    add-long/2addr v4, v6

    invoke-virtual {p0, v3, v4, v5}, Lcom/rey/material/drawable/LineMorphingDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 373
    :cond_31
    return-void

    .line 369
    :cond_32
    iget v3, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    iget-object v4, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v4, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v4

    invoke-virtual {p0, v3, v4}, Lcom/rey/material/drawable/LineMorphingDrawable;->setLineState(IF)Z

    goto :goto_1f
.end method

.method private updatePath()V
    .registers 6

    .prologue
    .line 182
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 184
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    if-nez v0, :cond_a

    .line 195
    :goto_9
    return-void

    .line 187
    :cond_a
    iget v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_24

    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    iget v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPrevState:I

    aget-object v0, v0, v1

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    if-eqz v0, :cond_33

    iget v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    const v1, 0x3d4ccccd    # 0.05f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_33

    .line 188
    :cond_24
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    iget v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPrevState:I

    aget-object v1, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->updatePathWithState(Landroid/graphics/Path;Lcom/rey/material/drawable/LineMorphingDrawable$State;)V

    .line 194
    :goto_2f
    invoke-virtual {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->invalidateSelf()V

    goto :goto_9

    .line 189
    :cond_33
    iget v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    iget v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    aget-object v0, v0, v1

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    if-eqz v0, :cond_5a

    iget v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    const v1, 0x3f733333    # 0.95f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_5a

    .line 190
    :cond_4e
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    iget v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    aget-object v1, v1, v2

    invoke-direct {p0, v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->updatePathWithState(Landroid/graphics/Path;Lcom/rey/material/drawable/LineMorphingDrawable$State;)V

    goto :goto_2f

    .line 192
    :cond_5a
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    iget v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPrevState:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    iget v3, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    aget-object v2, v2, v3

    iget-object v3, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mInterpolator:Landroid/view/animation/Interpolator;

    iget v4, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    invoke-interface {v3, v4}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/rey/material/drawable/LineMorphingDrawable;->updatePathBetweenStates(Landroid/graphics/Path;Lcom/rey/material/drawable/LineMorphingDrawable$State;Lcom/rey/material/drawable/LineMorphingDrawable$State;F)V

    goto :goto_2f
.end method

.method private updatePathBetweenStates(Landroid/graphics/Path;Lcom/rey/material/drawable/LineMorphingDrawable$State;Lcom/rey/material/drawable/LineMorphingDrawable$State;F)V
    .registers 20
    .param p1, "path"    # Landroid/graphics/Path;
    .param p2, "prev"    # Lcom/rey/material/drawable/LineMorphingDrawable$State;
    .param p3, "cur"    # Lcom/rey/material/drawable/LineMorphingDrawable$State;
    .param p4, "progress"    # F

    .prologue
    .line 263
    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    array-length v12, v12

    move-object/from16 v0, p3

    iget-object v13, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    array-length v13, v13

    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    move-result v12

    div-int/lit8 v1, v12, 0x4

    .line 265
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11
    if-ge v2, v1, :cond_a2

    .line 266
    mul-int/lit8 v3, v2, 0x4

    .line 272
    .local v3, "index":I
    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    array-length v12, v12

    if-lt v3, v12, :cond_64

    .line 273
    const/high16 v4, 0x3f000000    # 0.5f

    .line 274
    .local v4, "x1":F
    const/high16 v8, 0x3f000000    # 0.5f

    .line 275
    .local v8, "y1":F
    const/high16 v5, 0x3f000000    # 0.5f

    .line 276
    .local v5, "x2":F
    const/high16 v9, 0x3f000000    # 0.5f

    .line 289
    .local v9, "y2":F
    :goto_24
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    array-length v12, v12

    if-lt v3, v12, :cond_83

    .line 290
    const/high16 v6, 0x3f000000    # 0.5f

    .line 291
    .local v6, "x3":F
    const/high16 v10, 0x3f000000    # 0.5f

    .line 292
    .local v10, "y3":F
    const/high16 v7, 0x3f000000    # 0.5f

    .line 293
    .local v7, "x4":F
    const/high16 v11, 0x3f000000    # 0.5f

    .line 302
    .local v11, "y4":F
    :goto_33
    iget-object v12, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPath:Landroid/graphics/Path;

    sub-float v13, v6, v4

    mul-float v13, v13, p4

    add-float/2addr v13, v4

    invoke-direct {p0, v13}, Lcom/rey/material/drawable/LineMorphingDrawable;->getX(F)F

    move-result v13

    sub-float v14, v10, v8

    mul-float v14, v14, p4

    add-float/2addr v14, v8

    invoke-direct {p0, v14}, Lcom/rey/material/drawable/LineMorphingDrawable;->getY(F)F

    move-result v14

    invoke-virtual {v12, v13, v14}, Landroid/graphics/Path;->moveTo(FF)V

    .line 303
    iget-object v12, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPath:Landroid/graphics/Path;

    sub-float v13, v7, v5

    mul-float v13, v13, p4

    add-float/2addr v13, v5

    invoke-direct {p0, v13}, Lcom/rey/material/drawable/LineMorphingDrawable;->getX(F)F

    move-result v13

    sub-float v14, v11, v9

    mul-float v14, v14, p4

    add-float/2addr v14, v9

    invoke-direct {p0, v14}, Lcom/rey/material/drawable/LineMorphingDrawable;->getY(F)F

    move-result v14

    invoke-virtual {v12, v13, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 265
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 279
    .end local v4    # "x1":F
    .end local v5    # "x2":F
    .end local v6    # "x3":F
    .end local v7    # "x4":F
    .end local v8    # "y1":F
    .end local v9    # "y2":F
    .end local v10    # "y3":F
    .end local v11    # "y4":F
    :cond_64
    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    aget v4, v12, v3

    .line 280
    .restart local v4    # "x1":F
    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    add-int/lit8 v13, v3, 0x1

    aget v8, v12, v13

    .line 281
    .restart local v8    # "y1":F
    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    add-int/lit8 v13, v3, 0x2

    aget v5, v12, v13

    .line 282
    .restart local v5    # "x2":F
    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    add-int/lit8 v13, v3, 0x3

    aget v9, v12, v13

    .restart local v9    # "y2":F
    goto :goto_24

    .line 296
    :cond_83
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    aget v6, v12, v3

    .line 297
    .restart local v6    # "x3":F
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    add-int/lit8 v13, v3, 0x1

    aget v10, v12, v13

    .line 298
    .restart local v10    # "y3":F
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    add-int/lit8 v13, v3, 0x2

    aget v7, v12, v13

    .line 299
    .restart local v7    # "x4":F
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    add-int/lit8 v13, v3, 0x3

    aget v11, v12, v13

    .restart local v11    # "y4":F
    goto :goto_33

    .line 305
    .end local v3    # "index":I
    .end local v4    # "x1":F
    .end local v5    # "x2":F
    .end local v6    # "x3":F
    .end local v7    # "x4":F
    .end local v8    # "y1":F
    .end local v9    # "y2":F
    .end local v10    # "y3":F
    .end local v11    # "y4":F
    :cond_a2
    return-void
.end method

.method private updatePathWithState(Landroid/graphics/Path;Lcom/rey/material/drawable/LineMorphingDrawable$State;)V
    .registers 24
    .param p1, "path"    # Landroid/graphics/Path;
    .param p2, "state"    # Lcom/rey/material/drawable/LineMorphingDrawable$State;

    .prologue
    .line 198
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    move-object/from16 v18, v0

    if-eqz v18, :cond_1ae

    .line 199
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_9
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v5, v0, :cond_11d

    .line 200
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    move-object/from16 v18, v0

    aget v18, v18, v5

    mul-int/lit8 v7, v18, 0x4

    .line 201
    .local v7, "index1":I
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    move-object/from16 v18, v0

    add-int/lit8 v19, v5, 0x1

    aget v18, v18, v19

    mul-int/lit8 v8, v18, 0x4

    .line 203
    .local v8, "index2":I
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    aget v18, v18, v7

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getX(F)F

    move-result v10

    .line 204
    .local v10, "x1":F
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    add-int/lit8 v19, v7, 0x1

    aget v18, v18, v19

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getY(F)F

    move-result v14

    .line 205
    .local v14, "y1":F
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    add-int/lit8 v19, v7, 0x2

    aget v18, v18, v19

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getX(F)F

    move-result v11

    .line 206
    .local v11, "x2":F
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    add-int/lit8 v19, v7, 0x3

    aget v18, v18, v19

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getY(F)F

    move-result v15

    .line 208
    .local v15, "y2":F
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    aget v18, v18, v8

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getX(F)F

    move-result v12

    .line 209
    .local v12, "x3":F
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    add-int/lit8 v19, v8, 0x1

    aget v18, v18, v19

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getY(F)F

    move-result v16

    .line 210
    .local v16, "y3":F
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    add-int/lit8 v19, v8, 0x2

    aget v18, v18, v19

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getX(F)F

    move-result v13

    .line 211
    .local v13, "x4":F
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    add-int/lit8 v19, v8, 0x3

    aget v18, v18, v19

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getY(F)F

    move-result v17

    .line 213
    .local v17, "y4":F
    cmpl-float v18, v10, v12

    if-nez v18, :cond_d7

    cmpl-float v18, v14, v16

    if-nez v18, :cond_d7

    .line 214
    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v15}, Landroid/graphics/Path;->moveTo(FF)V

    .line 215
    move-object/from16 v0, p1

    invoke-virtual {v0, v10, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 216
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v13, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 199
    :goto_d3
    add-int/lit8 v5, v5, 0x2

    goto/16 :goto_9

    .line 218
    :cond_d7
    cmpl-float v18, v10, v13

    if-nez v18, :cond_f1

    cmpl-float v18, v14, v17

    if-nez v18, :cond_f1

    .line 219
    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v15}, Landroid/graphics/Path;->moveTo(FF)V

    .line 220
    move-object/from16 v0, p1

    invoke-virtual {v0, v10, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 221
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v12, v1}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_d3

    .line 223
    :cond_f1
    cmpl-float v18, v11, v12

    if-nez v18, :cond_10b

    cmpl-float v18, v15, v16

    if-nez v18, :cond_10b

    .line 224
    move-object/from16 v0, p1

    invoke-virtual {v0, v10, v14}, Landroid/graphics/Path;->moveTo(FF)V

    .line 225
    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v15}, Landroid/graphics/Path;->lineTo(FF)V

    .line 226
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v13, v1}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_d3

    .line 229
    :cond_10b
    move-object/from16 v0, p1

    invoke-virtual {v0, v10, v14}, Landroid/graphics/Path;->moveTo(FF)V

    .line 230
    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v15}, Landroid/graphics/Path;->lineTo(FF)V

    .line 231
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v12, v1}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_d3

    .line 235
    .end local v7    # "index1":I
    .end local v8    # "index2":I
    .end local v10    # "x1":F
    .end local v11    # "x2":F
    .end local v12    # "x3":F
    .end local v13    # "x4":F
    .end local v14    # "y1":F
    .end local v15    # "y2":F
    .end local v16    # "y3":F
    .end local v17    # "y4":F
    :cond_11d
    const/4 v5, 0x0

    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    div-int/lit8 v3, v18, 0x4

    .local v3, "count":I
    :goto_12b
    if-ge v5, v3, :cond_21b

    .line 236
    const/4 v4, 0x0

    .line 237
    .local v4, "exist":Z
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_12f
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v9, v0, :cond_14b

    .line 238
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    move-object/from16 v18, v0

    aget v18, v18, v9

    move/from16 v0, v18

    if-ne v0, v5, :cond_150

    .line 239
    const/4 v4, 0x1

    .line 243
    :cond_14b
    if-eqz v4, :cond_153

    .line 235
    :goto_14d
    add-int/lit8 v5, v5, 0x1

    goto :goto_12b

    .line 237
    :cond_150
    add-int/lit8 v9, v9, 0x1

    goto :goto_12f

    .line 246
    :cond_153
    mul-int/lit8 v6, v5, 0x4

    .line 248
    .local v6, "index":I
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    aget v18, v18, v6

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getX(F)F

    move-result v18

    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v19, v0

    add-int/lit8 v20, v6, 0x1

    aget v19, v19, v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getY(F)F

    move-result v19

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 249
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    add-int/lit8 v19, v6, 0x2

    aget v18, v18, v19

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getX(F)F

    move-result v18

    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v19, v0

    add-int/lit8 v20, v6, 0x3

    aget v19, v19, v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getY(F)F

    move-result v19

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_14d

    .line 253
    .end local v3    # "count":I
    .end local v4    # "exist":Z
    .end local v5    # "i":I
    .end local v6    # "index":I
    .end local v9    # "j":I
    :cond_1ae
    const/4 v5, 0x0

    .restart local v5    # "i":I
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    div-int/lit8 v3, v18, 0x4

    .restart local v3    # "count":I
    :goto_1bc
    if-ge v5, v3, :cond_21b

    .line 254
    mul-int/lit8 v6, v5, 0x4

    .line 256
    .restart local v6    # "index":I
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    aget v18, v18, v6

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getX(F)F

    move-result v18

    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v19, v0

    add-int/lit8 v20, v6, 0x1

    aget v19, v19, v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getY(F)F

    move-result v19

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 257
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v18, v0

    add-int/lit8 v19, v6, 0x2

    aget v18, v18, v19

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getX(F)F

    move-result v18

    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    move-object/from16 v19, v0

    add-int/lit8 v20, v6, 0x3

    aget v19, v19, v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/rey/material/drawable/LineMorphingDrawable;->getY(F)F

    move-result v19

    move-object/from16 v0, p1

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 253
    add-int/lit8 v5, v5, 0x1

    goto :goto_1bc

    .line 260
    .end local v6    # "index":I
    :cond_21b
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v3, 0x3f800000    # 1.0f

    .line 97
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    .line 98
    .local v1, "restoreCount":I
    iget-boolean v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mClockwise:Z

    if-eqz v2, :cond_48

    const/16 v2, 0xb4

    :goto_c
    int-to-float v4, v2

    iget v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPrevState:I

    iget v5, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    if-ge v2, v5, :cond_4b

    const/4 v2, 0x0

    :goto_14
    iget v5, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    add-float/2addr v2, v5

    mul-float v0, v4, v2

    .line 100
    .local v0, "degrees":F
    iget-boolean v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mIsRtl:Z

    if-eqz v2, :cond_2e

    .line 101
    const/high16 v2, -0x40800000    # -1.0f

    iget-object v4, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    iget-object v5, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 103
    :cond_2e
    iget-object v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    iget-object v3, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    invoke-virtual {p1, v0, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 104
    iget-object v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPath:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 105
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 106
    return-void

    .line 98
    .end local v0    # "degrees":F
    :cond_48
    const/16 v2, -0xb4

    goto :goto_c

    :cond_4b
    move v2, v3

    goto :goto_14
.end method

.method public getAnimProgress()F
    .registers 2

    .prologue
    .line 178
    iget v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    return v0
.end method

.method public getLineState()I
    .registers 2

    .prologue
    .line 170
    iget v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    return v0
.end method

.method public getLineStateCount()I
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mStates:[Lcom/rey/material/drawable/LineMorphingDrawable$State;

    array-length v0, v0

    goto :goto_5
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 120
    const/4 v0, -0x3

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 342
    iget-boolean v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mRunning:Z

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 5
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 125
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 127
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingLeft:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 128
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    iget v1, p1, Landroid/graphics/Rect;->top:I

    iget v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingTop:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 129
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    iget v1, p1, Landroid/graphics/Rect;->right:I

    iget v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingRight:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 130
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mDrawBound:Landroid/graphics/RectF;

    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    iget v2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaddingBottom:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 132
    invoke-direct {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->updatePath()V

    .line 133
    return-void
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 347
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mRunning:Z

    .line 348
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 349
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 110
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 111
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 115
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 116
    return-void
.end method

.method public setLineState(IF)Z
    .registers 5
    .param p1, "state"    # I
    .param p2, "progress"    # F

    .prologue
    const/4 v0, 0x1

    .line 153
    iget v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    if-eq v1, p1, :cond_11

    .line 154
    iget v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    iput v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPrevState:I

    .line 155
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    .line 156
    iput p2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    .line 157
    invoke-direct {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->updatePath()V

    .line 166
    :goto_10
    return v0

    .line 160
    :cond_11
    iget v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    cmpl-float v1, v1, p2

    if-eqz v1, :cond_1d

    .line 161
    iput p2, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    .line 162
    invoke-direct {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->updatePath()V

    goto :goto_10

    .line 166
    :cond_1d
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public start()V
    .registers 6

    .prologue
    .line 324
    invoke-direct {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->resetAnimation()V

    .line 326
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/LineMorphingDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 327
    invoke-virtual {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->invalidateSelf()V

    .line 328
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 332
    invoke-virtual {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->isRunning()Z

    move-result v0

    if-nez v0, :cond_7

    .line 338
    :goto_6
    return-void

    .line 335
    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mRunning:Z

    .line 336
    iget-object v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/LineMorphingDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 337
    invoke-virtual {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->invalidateSelf()V

    goto :goto_6
.end method

.method public switchLineState(IZ)V
    .registers 5
    .param p1, "state"    # I
    .param p2, "animation"    # Z

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    .line 136
    iget v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    if-eq v0, p1, :cond_18

    .line 137
    iget v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    iput v0, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mPrevState:I

    .line 138
    iput p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mCurState:I

    .line 139
    if-eqz p2, :cond_12

    .line 140
    invoke-virtual {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->start()V

    .line 150
    :cond_11
    :goto_11
    return-void

    .line 142
    :cond_12
    iput v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    .line 143
    invoke-direct {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->updatePath()V

    goto :goto_11

    .line 146
    :cond_18
    if-nez p2, :cond_11

    .line 147
    iput v1, p0, Lcom/rey/material/drawable/LineMorphingDrawable;->mAnimProgress:F

    .line 148
    invoke-direct {p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->updatePath()V

    goto :goto_11
.end method
