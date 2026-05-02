.class public Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "NexusRotationCrossDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$Builder;
    }
.end annotation


# static fields
.field private static final ANIMATION_DURATION:I = 0x96

.field private static final ANIMATION_START_DELAY:I = 0x12c

.field private static final LINEAR_INTERPOLATOR:Landroid/view/animation/Interpolator;


# instance fields
.field private mArrowPoints:[Landroid/graphics/Point;

.field private mCenter:I

.field private mPaint1:Landroid/graphics/Paint;

.field private mPaint2:Landroid/graphics/Paint;

.field private mPaint3:Landroid/graphics/Paint;

.field private mPaint4:Landroid/graphics/Paint;

.field private mPath:Landroid/graphics/Path;

.field private mRotationAngle:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 21
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    sput-object v0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->LINEAR_INTERPOLATOR:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>([I)V
    .registers 5
    .param p1, "colors"    # [I

    .prologue
    const/4 v2, 0x1

    .line 35
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 36
    const/4 v0, 0x5

    new-array v0, v0, [Landroid/graphics/Point;

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    .line 37
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPath:Landroid/graphics/Path;

    .line 39
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint1:Landroid/graphics/Paint;

    .line 40
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint1:Landroid/graphics/Paint;

    const/4 v1, 0x0

    aget v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 42
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint2:Landroid/graphics/Paint;

    .line 43
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint2:Landroid/graphics/Paint;

    aget v1, p1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 45
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint3:Landroid/graphics/Paint;

    .line 46
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint3:Landroid/graphics/Paint;

    const/4 v1, 0x2

    aget v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 48
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint4:Landroid/graphics/Paint;

    .line 49
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint4:Landroid/graphics/Paint;

    const/4 v1, 0x3

    aget v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 51
    invoke-direct {p0}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->initObjectAnimator()V

    .line 52
    return-void
.end method

.method static synthetic access$000(Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;)I
    .registers 2
    .param p0, "x0"    # Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;

    .prologue
    .line 17
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mRotationAngle:I

    return v0
.end method

.method static synthetic access$002(Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;I)I
    .registers 2
    .param p0, "x0"    # Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;
    .param p1, "x1"    # I

    .prologue
    .line 17
    iput p1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mRotationAngle:I

    return p1
.end method

.method private drawArrows(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x0

    .line 81
    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mRotationAngle:I

    int-to-float v1, v1

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    int-to-float v2, v2

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    int-to-float v3, v3

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 83
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 84
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v2, v2, v4

    iget v2, v2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v3, v3, v4

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 85
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_26
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    array-length v1, v1

    if-ge v0, v1, :cond_41

    .line 86
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v2, v2, v0

    iget v2, v2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v3, v3, v0

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 85
    add-int/lit8 v0, v0, 0x1

    goto :goto_26

    .line 88
    :cond_41
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v2, v2, v4

    iget v2, v2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v3, v3, v4

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 90
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 91
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint1:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 92
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 94
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 95
    const/high16 v1, 0x42b40000    # 90.0f

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    int-to-float v2, v2

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    int-to-float v3, v3

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 96
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint2:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 97
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 99
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 100
    const/high16 v1, 0x43340000    # 180.0f

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    int-to-float v2, v2

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    int-to-float v3, v3

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 101
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint3:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 102
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 104
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 105
    const/high16 v1, 0x43870000    # 270.0f

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    int-to-float v2, v2

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    int-to-float v3, v3

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 106
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint4:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 107
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 108
    return-void
.end method

.method private initObjectAnimator()V
    .registers 4

    .prologue
    .line 55
    const-string v1, "rotationAngle"

    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_22

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 56
    .local v0, "objectAnimator":Landroid/animation/ObjectAnimator;
    sget-object v1, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->LINEAR_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 57
    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 58
    new-instance v1, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$1;

    invoke-direct {v1, p0, v0}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable$1;-><init>(Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;Landroid/animation/ObjectAnimator;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 72
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 73
    return-void

    .line 55
    :array_22
    .array-data 4
        0x0
        0xb4
    .end array-data
.end method

.method private measureDrawable(Landroid/graphics/Rect;)V
    .registers 11
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    const/4 v8, 0x0

    .line 157
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    iput v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    .line 158
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v3

    div-int/lit8 v0, v3, 0x32

    .line 159
    .local v0, "arrowMargin":I
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v3

    div-int/lit8 v1, v3, 0xf

    .line 160
    .local v1, "arrowWidth":I
    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    int-to-double v4, v4

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    div-double/2addr v4, v6

    double-to-int v4, v4

    sub-int v2, v3, v4

    .line 162
    .local v2, "padding":I
    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    new-instance v4, Landroid/graphics/Point;

    iget v5, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    sub-int/2addr v5, v0

    iget v6, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mCenter:I

    sub-int/2addr v6, v0

    invoke-direct {v4, v5, v6}, Landroid/graphics/Point;-><init>(II)V

    aput-object v4, v3, v8

    .line 163
    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    const/4 v4, 0x1

    new-instance v5, Landroid/graphics/Point;

    iget-object v6, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v6, v6, v8

    iget v6, v6, Landroid/graphics/Point;->x:I

    iget-object v7, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v7, v7, v8

    iget v7, v7, Landroid/graphics/Point;->y:I

    sub-int/2addr v7, v1

    invoke-direct {v5, v6, v7}, Landroid/graphics/Point;-><init>(II)V

    aput-object v5, v3, v4

    .line 164
    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    const/4 v4, 0x2

    new-instance v5, Landroid/graphics/Point;

    add-int v6, v2, v1

    invoke-direct {v5, v6, v2}, Landroid/graphics/Point;-><init>(II)V

    aput-object v5, v3, v4

    .line 165
    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    const/4 v4, 0x3

    new-instance v5, Landroid/graphics/Point;

    add-int v6, v2, v1

    invoke-direct {v5, v2, v6}, Landroid/graphics/Point;-><init>(II)V

    aput-object v5, v3, v4

    .line 166
    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    const/4 v4, 0x4

    new-instance v5, Landroid/graphics/Point;

    iget-object v6, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v6, v6, v8

    iget v6, v6, Landroid/graphics/Point;->x:I

    sub-int/2addr v6, v1

    iget-object v7, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mArrowPoints:[Landroid/graphics/Point;

    aget-object v7, v7, v8

    iget v7, v7, Landroid/graphics/Point;->y:I

    invoke-direct {v5, v6, v7}, Landroid/graphics/Point;-><init>(II)V

    aput-object v5, v3, v4

    .line 167
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->drawArrows(Landroid/graphics/Canvas;)V

    .line 78
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 171
    const/4 v0, -0x3

    return v0
.end method

.method getRotationAngle()I
    .registers 2

    .prologue
    .line 179
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mRotationAngle:I

    return v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 112
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 113
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 114
    invoke-interface {v0, p0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 116
    :cond_9
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 2
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 152
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 153
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->measureDrawable(Landroid/graphics/Rect;)V

    .line 154
    return-void
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 6
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;
    .param p3, "when"    # J

    .prologue
    .line 120
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 121
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 122
    invoke-interface {v0, p0, p2, p3, p4}, Landroid/graphics/drawable/Drawable$Callback;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    .line 124
    :cond_9
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 136
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint1:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 137
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint2:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 138
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint3:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 139
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint4:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 140
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint1:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 145
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint2:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 146
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint3:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 147
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mPaint4:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 148
    return-void
.end method

.method setRotationAngle(I)V
    .registers 2
    .param p1, "angle"    # I

    .prologue
    .line 175
    iput p1, p0, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->mRotationAngle:I

    .line 176
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 4
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/NexusRotationCrossDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 129
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 130
    invoke-interface {v0, p0, p2}, Landroid/graphics/drawable/Drawable$Callback;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    .line 132
    :cond_9
    return-void
.end method
