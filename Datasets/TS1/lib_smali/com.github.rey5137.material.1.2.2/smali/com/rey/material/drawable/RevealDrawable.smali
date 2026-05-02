.class public Lcom/rey/material/drawable/RevealDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "RevealDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;
    }
.end annotation


# static fields
.field private static final GRADIENT_RADIUS:F = 16.0f

.field private static final GRADIENT_STOPS:[F


# instance fields
.field private mAnimProgress:F

.field private mCurColor:I

.field private mCurColorTransparent:Z

.field private mCurTask:I

.field private mFillPaint:Landroid/graphics/Paint;

.field private mMatrix:Landroid/graphics/Matrix;

.field private mMaxRadius:F

.field private mNextColorTransparent:Z

.field private mRect:Landroid/graphics/RectF;

.field private mRunning:Z

.field private mShader:Landroid/graphics/RadialGradient;

.field private mShaderPaint:Landroid/graphics/Paint;

.field private mStartTime:J

.field private mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

.field private final mUpdater:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const/4 v0, 0x3

    new-array v0, v0, [F

    fill-array-data v0, :array_a

    sput-object v0, Lcom/rey/material/drawable/RevealDrawable;->GRADIENT_STOPS:[F

    return-void

    nop

    :array_a
    .array-data 4
        0x0
        0x3f7d70a4    # 0.99f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    const/4 v2, 0x1

    .line 45
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mRunning:Z

    .line 243
    new-instance v0, Lcom/rey/material/drawable/RevealDrawable$1;

    invoke-direct {v0, p0}, Lcom/rey/material/drawable/RevealDrawable$1;-><init>(Lcom/rey/material/drawable/RevealDrawable;)V

    iput-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mUpdater:Ljava/lang/Runnable;

    .line 46
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mShaderPaint:Landroid/graphics/Paint;

    .line 47
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mShaderPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 49
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mFillPaint:Landroid/graphics/Paint;

    .line 50
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mFillPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 52
    iput p1, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    .line 54
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mRect:Landroid/graphics/RectF;

    .line 56
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 57
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/drawable/RevealDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/RevealDrawable;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/rey/material/drawable/RevealDrawable;->update()V

    return-void
.end method

.method private fillCanvas(Landroid/graphics/Canvas;IZ)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "color"    # I
    .param p3, "transparent"    # Z

    .prologue
    .line 94
    if-eqz p3, :cond_3

    .line 99
    :goto_2
    return-void

    .line 97
    :cond_3
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 98
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_2
.end method

.method private fillCanvasWithHole(Landroid/graphics/Canvas;Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;FZ)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "task"    # Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;
    .param p3, "radius"    # F
    .param p4, "transparent"    # Z

    .prologue
    .line 102
    if-eqz p4, :cond_3

    .line 113
    :goto_2
    return-void

    .line 105
    :cond_3
    const/high16 v2, 0x41800000    # 16.0f

    div-float v0, p3, v2

    .line 107
    .local v0, "scale":F
    iget-object v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 108
    iget-object v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mMatrix:Landroid/graphics/Matrix;

    iget v3, p2, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->x:F

    iget v4, p2, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->y:F

    invoke-virtual {v2, v0, v0, v3, v4}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 109
    invoke-direct {p0, p2}, Lcom/rey/material/drawable/RevealDrawable;->getShader(Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;)Landroid/graphics/RadialGradient;

    move-result-object v1

    .line 110
    .local v1, "shader":Landroid/graphics/RadialGradient;
    iget-object v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/RadialGradient;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 111
    iget-object v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mShaderPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 112
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    iget-object v3, p0, Lcom/rey/material/drawable/RevealDrawable;->mShaderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_2
.end method

.method private fillCircle(Landroid/graphics/Canvas;FFFIZ)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "radius"    # F
    .param p5, "color"    # I
    .param p6, "transparent"    # Z

    .prologue
    .line 116
    if-eqz p6, :cond_3

    .line 122
    :goto_2
    return-void

    .line 119
    :cond_3
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p5}, Landroid/graphics/Paint;->setColor(I)V

    .line 120
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mRect:Landroid/graphics/RectF;

    sub-float v1, p2, p4

    sub-float v2, p3, p4

    add-float v3, p2, p4

    add-float v4, p3, p4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 121
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_2
.end method

.method private getMaxRadius(FFLandroid/graphics/Rect;)F
    .registers 12
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "bounds"    # Landroid/graphics/Rect;

    .prologue
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    .line 72
    invoke-virtual {p3}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    int-to-float v2, v2

    cmpg-float v2, p1, v2

    if-gez v2, :cond_2f

    iget v2, p3, Landroid/graphics/Rect;->right:I

    int-to-float v0, v2

    .line 73
    .local v0, "x1":F
    :goto_e
    invoke-virtual {p3}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    int-to-float v2, v2

    cmpg-float v2, p2, v2

    if-gez v2, :cond_33

    iget v2, p3, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v2

    .line 75
    .local v1, "y1":F
    :goto_1a
    sub-float v2, v0, p1

    float-to-double v2, v2

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    sub-float v4, v1, p2

    float-to-double v4, v4

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    add-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v2, v2

    return v2

    .line 72
    .end local v0    # "x1":F
    .end local v1    # "y1":F
    :cond_2f
    iget v2, p3, Landroid/graphics/Rect;->left:I

    int-to-float v0, v2

    goto :goto_e

    .line 73
    .restart local v0    # "x1":F
    :cond_33
    iget v2, p3, Landroid/graphics/Rect;->top:I

    int-to-float v1, v2

    goto :goto_1a
.end method

.method private getShader(Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;)Landroid/graphics/RadialGradient;
    .registers 11
    .param p1, "task"    # Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    .prologue
    const/4 v8, 0x2

    const/4 v6, 0x1

    const/high16 v3, 0x41800000    # 16.0f

    const/4 v1, 0x0

    const/4 v5, 0x0

    .line 79
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mShader:Landroid/graphics/RadialGradient;

    if-nez v0, :cond_2e

    .line 80
    iget-boolean v0, p1, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->isOut:Z

    if-eqz v0, :cond_31

    .line 81
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    invoke-static {v0, v1}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v7

    .line 82
    .local v7, "color_middle":I
    new-instance v0, Landroid/graphics/RadialGradient;

    iget v1, p1, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->x:F

    iget v2, p1, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->y:F

    const/4 v4, 0x3

    new-array v4, v4, [I

    aput v5, v4, v5

    aput v7, v4, v6

    iget v5, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    aput v5, v4, v8

    sget-object v5, Lcom/rey/material/drawable/RevealDrawable;->GRADIENT_STOPS:[F

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mShader:Landroid/graphics/RadialGradient;

    .line 90
    .end local v7    # "color_middle":I
    :cond_2e
    :goto_2e
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mShader:Landroid/graphics/RadialGradient;

    return-object v0

    .line 85
    :cond_31
    iget v0, p1, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->color:I

    invoke-static {v0, v1}, Lcom/rey/material/util/ColorUtil;->getColor(IF)I

    move-result v7

    .line 86
    .restart local v7    # "color_middle":I
    new-instance v0, Landroid/graphics/RadialGradient;

    iget v1, p1, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->x:F

    iget v2, p1, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->y:F

    const/4 v4, 0x3

    new-array v4, v4, [I

    aput v5, v4, v5

    aput v7, v4, v6

    iget v5, p1, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->color:I

    aput v5, v4, v8

    sget-object v5, Lcom/rey/material/drawable/RevealDrawable;->GRADIENT_STOPS:[F

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mShader:Landroid/graphics/RadialGradient;

    goto :goto_2e
.end method

.method private resetAnimation()V
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 202
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/rey/material/drawable/RevealDrawable;->mStartTime:J

    .line 203
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mAnimProgress:F

    .line 204
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-nez v0, :cond_44

    move v0, v1

    :goto_14
    iput-boolean v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColorTransparent:Z

    .line 205
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    iget v3, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    aget-object v0, v0, v3

    iget v0, v0, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->color:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-nez v0, :cond_46

    :goto_24
    iput-boolean v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mNextColorTransparent:Z

    .line 206
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    iget v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    aget-object v0, v0, v1

    iget v0, v0, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->x:F

    iget-object v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    iget v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    aget-object v1, v1, v2

    iget v1, v1, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->y:F

    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/rey/material/drawable/RevealDrawable;->getMaxRadius(FFLandroid/graphics/Rect;)F

    move-result v0

    iput v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mMaxRadius:F

    .line 207
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mShader:Landroid/graphics/RadialGradient;

    .line 208
    return-void

    :cond_44
    move v0, v2

    .line 204
    goto :goto_14

    :cond_46
    move v1, v2

    .line 205
    goto :goto_24
.end method

.method private update()V
    .registers 9

    .prologue
    const/high16 v7, 0x3f800000    # 1.0f

    .line 253
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 254
    .local v0, "curTime":J
    const-class v3, Lcom/rey/material/drawable/RevealDrawable;

    monitor-enter v3

    .line 255
    const/high16 v2, 0x3f800000    # 1.0f

    :try_start_b
    iget-wide v4, p0, Lcom/rey/material/drawable/RevealDrawable;->mStartTime:J

    sub-long v4, v0, v4

    long-to-float v4, v4

    iget-object v5, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    iget v6, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    aget-object v5, v5, v6

    iget v5, v5, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->duration:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mAnimProgress:F

    .line 257
    iget v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mAnimProgress:F

    cmpl-float v2, v2, v7

    if-nez v2, :cond_57

    .line 258
    iget-object v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    iget v4, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    aget-object v2, v2, v4

    iget v2, v2, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->color:I

    invoke-virtual {p0, v2}, Lcom/rey/material/drawable/RevealDrawable;->setCurColor(I)V

    .line 259
    iget v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    :goto_37
    iget v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    iget-object v4, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    array-length v4, v4

    if-ge v2, v4, :cond_4d

    .line 260
    iget-object v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    iget v4, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    aget-object v2, v2, v4

    iget v2, v2, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->color:I

    iget v4, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    if-eq v2, v4, :cond_6e

    .line 261
    invoke-direct {p0}, Lcom/rey/material/drawable/RevealDrawable;->resetAnimation()V

    .line 265
    :cond_4d
    iget v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    iget-object v4, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    array-length v4, v4

    if-ne v2, v4, :cond_57

    .line 266
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->stop()V

    .line 268
    :cond_57
    monitor-exit v3
    :try_end_58
    .catchall {:try_start_b .. :try_end_58} :catchall_75

    .line 270
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->invalidateSelf()V

    .line 272
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_6d

    .line 273
    iget-object v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x10

    add-long/2addr v3, v5

    invoke-virtual {p0, v2, v3, v4}, Lcom/rey/material/drawable/RevealDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 274
    :cond_6d
    return-void

    .line 259
    :cond_6e
    :try_start_6e
    iget v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    goto :goto_37

    .line 268
    :catchall_75
    move-exception v2

    monitor-exit v3
    :try_end_77
    .catchall {:try_start_6e .. :try_end_77} :catchall_75

    throw v2
.end method


# virtual methods
.method public changeColor(IILandroid/view/animation/Interpolator;FFZ)V
    .registers 16
    .param p1, "color"    # I
    .param p2, "duration"    # I
    .param p3, "interpolator"    # Landroid/view/animation/Interpolator;
    .param p4, "x"    # F
    .param p5, "y"    # F
    .param p6, "out"    # Z

    .prologue
    .line 159
    const/4 v0, 0x1

    new-array v7, v0, [Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    const/4 v8, 0x0

    new-instance v0, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;-><init>(IILandroid/view/animation/Interpolator;FFZ)V

    aput-object v0, v7, v8

    invoke-virtual {p0, v7}, Lcom/rey/material/drawable/RevealDrawable;->changeColor([Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;)V

    .line 160
    return-void
.end method

.method public varargs changeColor([Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;)V
    .registers 9
    .param p1, "tasks"    # [Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    .prologue
    .line 163
    const-class v4, Lcom/rey/material/drawable/RevealDrawable;

    monitor-enter v4

    .line 164
    :try_start_3
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->isRunning()Z

    move-result v3

    if-nez v3, :cond_21

    .line 165
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v3, p1

    if-ge v1, v3, :cond_1c

    .line 166
    aget-object v3, p1, v1

    iget v3, v3, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->color:I

    iget v5, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    if-eq v3, v5, :cond_1e

    .line 167
    iput v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    .line 168
    iput-object p1, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    .line 169
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->start()V

    .line 181
    .end local v1    # "i":I
    :cond_1c
    :goto_1c
    monitor-exit v4

    .line 182
    return-void

    .line 165
    .restart local v1    # "i":I
    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 174
    .end local v1    # "i":I
    :cond_21
    iget-object v3, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    array-length v3, v3

    iget v5, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    sub-int v0, v3, v5

    .line 175
    .local v0, "curLength":I
    array-length v3, p1

    add-int/2addr v3, v0

    new-array v2, v3, [Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    .line 176
    .local v2, "newTasks":[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;
    iget-object v3, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    iget v5, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    const/4 v6, 0x0

    invoke-static {v3, v5, v2, v6, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 177
    const/4 v3, 0x0

    array-length v5, p1

    invoke-static {p1, v3, v2, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 178
    iput-object v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    .line 179
    const/4 v3, 0x0

    iput v3, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    goto :goto_1c

    .line 181
    .end local v0    # "curLength":I
    .end local v2    # "newTasks":[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;
    :catchall_3f
    move-exception v3

    monitor-exit v4
    :try_end_41
    .catchall {:try_start_3 .. :try_end_41} :catchall_3f

    throw v3
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/16 v3, 0xff

    .line 126
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->isRunning()Z

    move-result v0

    if-nez v0, :cond_10

    .line 127
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    iget-boolean v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColorTransparent:Z

    invoke-direct {p0, p1, v0, v1}, Lcom/rey/material/drawable/RevealDrawable;->fillCanvas(Landroid/graphics/Canvas;IZ)V

    .line 156
    :goto_f
    return-void

    .line 129
    :cond_10
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    iget v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurTask:I

    aget-object v7, v0, v1

    .line 131
    .local v7, "task":Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mAnimProgress:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_25

    .line 132
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    iget-boolean v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColorTransparent:Z

    invoke-direct {p0, p1, v0, v1}, Lcom/rey/material/drawable/RevealDrawable;->fillCanvas(Landroid/graphics/Canvas;IZ)V

    goto :goto_f

    .line 133
    :cond_25
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mAnimProgress:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_35

    .line 134
    iget v0, v7, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->color:I

    iget-boolean v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mNextColorTransparent:Z

    invoke-direct {p0, p1, v0, v1}, Lcom/rey/material/drawable/RevealDrawable;->fillCanvas(Landroid/graphics/Canvas;IZ)V

    goto :goto_f

    .line 135
    :cond_35
    iget-boolean v0, v7, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->isOut:Z

    if-eqz v0, :cond_68

    .line 136
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mMaxRadius:F

    iget-object v1, v7, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->interpolator:Landroid/view/animation/Interpolator;

    iget v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mAnimProgress:F

    invoke-interface {v1, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    mul-float v4, v0, v1

    .line 138
    .local v4, "radius":F
    iget v0, v7, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->color:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-ne v0, v3, :cond_62

    .line 139
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    iget-boolean v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColorTransparent:Z

    invoke-direct {p0, p1, v0, v1}, Lcom/rey/material/drawable/RevealDrawable;->fillCanvas(Landroid/graphics/Canvas;IZ)V

    .line 143
    :goto_54
    iget v2, v7, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->x:F

    iget v3, v7, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->y:F

    iget v5, v7, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->color:I

    iget-boolean v6, p0, Lcom/rey/material/drawable/RevealDrawable;->mNextColorTransparent:Z

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/drawable/RevealDrawable;->fillCircle(Landroid/graphics/Canvas;FFFIZ)V

    goto :goto_f

    .line 141
    :cond_62
    iget-boolean v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColorTransparent:Z

    invoke-direct {p0, p1, v7, v4, v0}, Lcom/rey/material/drawable/RevealDrawable;->fillCanvasWithHole(Landroid/graphics/Canvas;Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;FZ)V

    goto :goto_54

    .line 146
    .end local v4    # "radius":F
    :cond_68
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mMaxRadius:F

    iget-object v1, v7, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->interpolator:Landroid/view/animation/Interpolator;

    iget v2, p0, Lcom/rey/material/drawable/RevealDrawable;->mAnimProgress:F

    invoke-interface {v1, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    mul-float v4, v0, v1

    .line 148
    .restart local v4    # "radius":F
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-ne v0, v3, :cond_92

    .line 149
    iget v0, v7, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->color:I

    iget-boolean v1, p0, Lcom/rey/material/drawable/RevealDrawable;->mNextColorTransparent:Z

    invoke-direct {p0, p1, v0, v1}, Lcom/rey/material/drawable/RevealDrawable;->fillCanvas(Landroid/graphics/Canvas;IZ)V

    .line 153
    :goto_83
    iget v2, v7, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->x:F

    iget v3, v7, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->y:F

    iget v5, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    iget-boolean v6, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColorTransparent:Z

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/drawable/RevealDrawable;->fillCircle(Landroid/graphics/Canvas;FFFIZ)V

    goto/16 :goto_f

    .line 151
    :cond_92
    iget-boolean v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mNextColorTransparent:Z

    invoke-direct {p0, p1, v7, v4, v0}, Lcom/rey/material/drawable/RevealDrawable;->fillCanvasWithHole(Landroid/graphics/Canvas;Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;FZ)V

    goto :goto_83
.end method

.method public getCurColor()I
    .registers 2

    .prologue
    .line 60
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 198
    const/4 v0, -0x3

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 234
    iget-boolean v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mRunning:Z

    return v0
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 239
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mRunning:Z

    .line 240
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 241
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 186
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mShaderPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 187
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 188
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 192
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mShaderPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 193
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 194
    return-void
.end method

.method public setCurColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 64
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    if-eq v0, p1, :cond_14

    .line 65
    iput p1, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    .line 66
    iget v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColor:I

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-nez v0, :cond_15

    const/4 v0, 0x1

    :goto_f
    iput-boolean v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mCurColorTransparent:Z

    .line 67
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->invalidateSelf()V

    .line 69
    :cond_14
    return-void

    .line 66
    :cond_15
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public start()V
    .registers 6

    .prologue
    .line 212
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 219
    :goto_6
    return-void

    .line 215
    :cond_7
    invoke-direct {p0}, Lcom/rey/material/drawable/RevealDrawable;->resetAnimation()V

    .line 217
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/RevealDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 218
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->invalidateSelf()V

    goto :goto_6
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 223
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->isRunning()Z

    move-result v0

    if-nez v0, :cond_7

    .line 230
    :goto_6
    return-void

    .line 226
    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mTasks:[Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;

    .line 227
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mRunning:Z

    .line 228
    iget-object v0, p0, Lcom/rey/material/drawable/RevealDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/RevealDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 229
    invoke-virtual {p0}, Lcom/rey/material/drawable/RevealDrawable;->invalidateSelf()V

    goto :goto_6
.end method
