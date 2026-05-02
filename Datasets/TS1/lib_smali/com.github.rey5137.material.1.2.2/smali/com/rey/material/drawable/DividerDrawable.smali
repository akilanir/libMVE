.class public Lcom/rey/material/drawable/DividerDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "DividerDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# instance fields
.field private mAnimDuration:I

.field private mAnimEnable:Z

.field private mAnimProgress:F

.field private mColorStateList:Landroid/content/res/ColorStateList;

.field private mCurColor:I

.field private mEnable:Z

.field private mHeight:I

.field private mInEditMode:Z

.field private mPaddingLeft:I

.field private mPaddingRight:I

.field private mPaint:Landroid/graphics/Paint;

.field private mPath:Landroid/graphics/Path;

.field private mPathEffect:Landroid/graphics/PathEffect;

.field private mPrevColor:I

.field private mRunning:Z

.field private mStartTime:J

.field private final mUpdater:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(IIILandroid/content/res/ColorStateList;I)V
    .registers 10
    .param p1, "height"    # I
    .param p2, "paddingLeft"    # I
    .param p3, "paddingRight"    # I
    .param p4, "colorStateList"    # Landroid/content/res/ColorStateList;
    .param p5, "animDuration"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 45
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 20
    iput-boolean v3, p0, Lcom/rey/material/drawable/DividerDrawable;->mRunning:Z

    .line 31
    iput-boolean v2, p0, Lcom/rey/material/drawable/DividerDrawable;->mEnable:Z

    .line 35
    iput-boolean v3, p0, Lcom/rey/material/drawable/DividerDrawable;->mInEditMode:Z

    .line 36
    iput-boolean v2, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimEnable:Z

    .line 231
    new-instance v0, Lcom/rey/material/drawable/DividerDrawable$1;

    invoke-direct {v0, p0}, Lcom/rey/material/drawable/DividerDrawable$1;-><init>(Lcom/rey/material/drawable/DividerDrawable;)V

    iput-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mUpdater:Ljava/lang/Runnable;

    .line 46
    iput p1, p0, Lcom/rey/material/drawable/DividerDrawable;->mHeight:I

    .line 47
    iput p2, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingLeft:I

    .line 48
    iput p3, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingRight:I

    .line 49
    iput p5, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimDuration:I

    .line 51
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    .line 52
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 53
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 54
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mHeight:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 55
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 56
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 58
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    .line 60
    iput-boolean v3, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimEnable:Z

    .line 61
    invoke-virtual {p0, p4}, Lcom/rey/material/drawable/DividerDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 62
    iput-boolean v2, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimEnable:Z

    .line 63
    return-void
.end method

.method public constructor <init>(ILandroid/content/res/ColorStateList;I)V
    .registers 10
    .param p1, "height"    # I
    .param p2, "colorStateList"    # Landroid/content/res/ColorStateList;
    .param p3, "animDuration"    # I

    .prologue
    const/4 v2, 0x0

    .line 42
    move-object v0, p0

    move v1, p1

    move v3, v2

    move-object v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/rey/material/drawable/DividerDrawable;-><init>(IIILandroid/content/res/ColorStateList;I)V

    .line 43
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/drawable/DividerDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/DividerDrawable;

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/rey/material/drawable/DividerDrawable;->update()V

    return-void
.end method

.method private getPathEffect()Landroid/graphics/PathEffect;
    .registers 5

    .prologue
    .line 111
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPathEffect:Landroid/graphics/PathEffect;

    if-nez v0, :cond_1d

    .line 112
    new-instance v0, Landroid/graphics/DashPathEffect;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    const v3, 0x3e4ccccd    # 0.2f

    aput v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/rey/material/drawable/DividerDrawable;->mHeight:I

    mul-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    aput v3, v1, v2

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    iput-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPathEffect:Landroid/graphics/PathEffect;

    .line 114
    :cond_1d
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPathEffect:Landroid/graphics/PathEffect;

    return-object v0
.end method

.method private resetAnimation()V
    .registers 3

    .prologue
    .line 202
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mStartTime:J

    .line 203
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimProgress:F

    .line 204
    return-void
.end method

.method private update()V
    .registers 8

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    .line 241
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 242
    .local v0, "curTime":J
    iget-wide v2, p0, Lcom/rey/material/drawable/DividerDrawable;->mStartTime:J

    sub-long v2, v0, v2

    long-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimDuration:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimProgress:F

    .line 244
    iget v2, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimProgress:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_1e

    .line 245
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/rey/material/drawable/DividerDrawable;->mRunning:Z

    .line 247
    :cond_1e
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 248
    iget-object v2, p0, Lcom/rey/material/drawable/DividerDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x10

    add-long/2addr v3, v5

    invoke-virtual {p0, v2, v3, v4}, Lcom/rey/material/drawable/DividerDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 250
    :cond_30
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->invalidateSelf()V

    .line 251
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    .line 119
    iget v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mHeight:I

    if-nez v6, :cond_8

    .line 156
    :goto_7
    return-void

    .line 122
    :cond_8
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 123
    .local v0, "bounds":Landroid/graphics/Rect;
    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    iget v7, p0, Lcom/rey/material/drawable/DividerDrawable;->mHeight:I

    div-int/lit8 v7, v7, 0x2

    sub-int/2addr v6, v7

    int-to-float v4, v6

    .line 125
    .local v4, "y":F
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->isRunning()Z

    move-result v6

    if-nez v6, :cond_52

    .line 126
    iget-object v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v6}, Landroid/graphics/Path;->reset()V

    .line 127
    iget-object v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    iget v7, v0, Landroid/graphics/Rect;->left:I

    iget v8, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingLeft:I

    add-int/2addr v7, v8

    int-to-float v7, v7

    invoke-virtual {v6, v7, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 128
    iget-object v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    iget v7, v0, Landroid/graphics/Rect;->right:I

    iget v8, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingRight:I

    sub-int/2addr v7, v8

    int-to-float v7, v7

    invoke-virtual {v6, v7, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 129
    iget-object v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    iget-boolean v7, p0, Lcom/rey/material/drawable/DividerDrawable;->mEnable:Z

    if-eqz v7, :cond_4d

    :goto_3b
    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 130
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mCurColor:I

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 131
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    iget-object v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_7

    .line 129
    :cond_4d
    invoke-direct {p0}, Lcom/rey/material/drawable/DividerDrawable;->getPathEffect()Landroid/graphics/PathEffect;

    move-result-object v5

    goto :goto_3b

    .line 134
    :cond_52
    iget v6, v0, Landroid/graphics/Rect;->right:I

    iget v7, v0, Landroid/graphics/Rect;->left:I

    add-int/2addr v6, v7

    iget v7, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingRight:I

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingLeft:I

    add-int/2addr v6, v7

    int-to-float v6, v6

    const/high16 v7, 0x40000000    # 2.0f

    div-float v1, v6, v7

    .line 135
    .local v1, "centerX":F
    iget v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimProgress:F

    sub-float v6, v9, v6

    mul-float/2addr v6, v1

    iget v7, v0, Landroid/graphics/Rect;->left:I

    iget v8, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingLeft:I

    add-int/2addr v7, v8

    int-to-float v7, v7

    iget v8, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimProgress:F

    mul-float/2addr v7, v8

    add-float v3, v6, v7

    .line 136
    .local v3, "start":F
    iget v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimProgress:F

    sub-float v6, v9, v6

    mul-float/2addr v6, v1

    iget v7, v0, Landroid/graphics/Rect;->right:I

    iget v8, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingRight:I

    add-int/2addr v7, v8

    int-to-float v7, v7

    iget v8, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimProgress:F

    mul-float/2addr v7, v8

    add-float v2, v6, v7

    .line 138
    .local v2, "end":F
    iget-object v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 140
    iget v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimProgress:F

    cmpg-float v5, v5, v9

    if-gez v5, :cond_c0

    .line 141
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mPrevColor:I

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 142
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v5}, Landroid/graphics/Path;->reset()V

    .line 143
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    iget v6, v0, Landroid/graphics/Rect;->left:I

    iget v7, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingLeft:I

    add-int/2addr v6, v7

    int-to-float v6, v6

    invoke-virtual {v5, v6, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 144
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v5, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 145
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    iget v6, v0, Landroid/graphics/Rect;->right:I

    iget v7, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingRight:I

    sub-int/2addr v6, v7

    int-to-float v6, v6

    invoke-virtual {v5, v6, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 146
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v5, v2, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 147
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    iget-object v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 150
    :cond_c0
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    iget v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mCurColor:I

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 151
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v5}, Landroid/graphics/Path;->reset()V

    .line 152
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v5, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 153
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v5, v2, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 154
    iget-object v5, p0, Lcom/rey/material/drawable/DividerDrawable;->mPath:Landroid/graphics/Path;

    iget-object v6, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_7
.end method

.method public getDividerHeight()I
    .registers 2

    .prologue
    .line 74
    iget v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mHeight:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 170
    const/4 v0, -0x3

    return v0
.end method

.method public getPaddingLeft()I
    .registers 2

    .prologue
    .line 86
    iget v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingLeft:I

    return v0
.end method

.method public getPaddingRight()I
    .registers 2

    .prologue
    .line 90
    iget v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingRight:I

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 222
    iget-boolean v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mRunning:Z

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 175
    const/4 v0, 0x1

    return v0
.end method

.method protected onStateChange([I)Z
    .registers 5
    .param p1, "state"    # [I

    .prologue
    .line 180
    const v1, 0x101009e

    invoke-static {p1, v1}, Lcom/rey/material/util/ViewUtil;->hasState([II)Z

    move-result v1

    iput-boolean v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mEnable:Z

    .line 181
    iget-object v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mColorStateList:Landroid/content/res/ColorStateList;

    iget v2, p0, Lcom/rey/material/drawable/DividerDrawable;->mCurColor:I

    invoke-virtual {v1, p1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 183
    .local v0, "color":I
    iget v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mCurColor:I

    if-eq v1, v0, :cond_3e

    .line 184
    iget-boolean v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mInEditMode:Z

    if-nez v1, :cond_39

    iget-boolean v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimEnable:Z

    if-eqz v1, :cond_39

    iget-boolean v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mEnable:Z

    if-eqz v1, :cond_39

    iget v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimDuration:I

    if-lez v1, :cond_39

    .line 185
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_36

    iget v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mPrevColor:I

    :goto_2d
    iput v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mPrevColor:I

    .line 186
    iput v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mCurColor:I

    .line 187
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->start()V

    .line 193
    :goto_34
    const/4 v1, 0x1

    .line 198
    :goto_35
    return v1

    .line 185
    :cond_36
    iget v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mCurColor:I

    goto :goto_2d

    .line 190
    :cond_39
    iput v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPrevColor:I

    .line 191
    iput v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mCurColor:I

    goto :goto_34

    .line 195
    :cond_3e
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->isRunning()Z

    move-result v1

    if-nez v1, :cond_46

    .line 196
    iput v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPrevColor:I

    .line 198
    :cond_46
    const/4 v1, 0x0

    goto :goto_35
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 227
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mRunning:Z

    .line 228
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 229
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 160
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 161
    return-void
.end method

.method public setAnimEnable(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 98
    iput-boolean p1, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimEnable:Z

    .line 99
    return-void
.end method

.method public setAnimationDuration(I)V
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 107
    iput p1, p0, Lcom/rey/material/drawable/DividerDrawable;->mAnimDuration:I

    .line 108
    return-void
.end method

.method public setColor(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "colorStateList"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/rey/material/drawable/DividerDrawable;->mColorStateList:Landroid/content/res/ColorStateList;

    .line 103
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->getState()[I

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/DividerDrawable;->onStateChange([I)Z

    .line 104
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 165
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 166
    return-void
.end method

.method public setDividerHeight(I)V
    .registers 4
    .param p1, "height"    # I

    .prologue
    .line 66
    iget v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mHeight:I

    if-eq v0, p1, :cond_11

    .line 67
    iput p1, p0, Lcom/rey/material/drawable/DividerDrawable;->mHeight:I

    .line 68
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/DividerDrawable;->mHeight:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 69
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->invalidateSelf()V

    .line 71
    :cond_11
    return-void
.end method

.method public setInEditMode(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 94
    iput-boolean p1, p0, Lcom/rey/material/drawable/DividerDrawable;->mInEditMode:Z

    .line 95
    return-void
.end method

.method public setPadding(II)V
    .registers 4
    .param p1, "left"    # I
    .param p2, "right"    # I

    .prologue
    .line 78
    iget v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingLeft:I

    if-ne v0, p1, :cond_8

    iget v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingRight:I

    if-eq v0, p2, :cond_f

    .line 79
    :cond_8
    iput p1, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingLeft:I

    .line 80
    iput p2, p0, Lcom/rey/material/drawable/DividerDrawable;->mPaddingRight:I

    .line 81
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->invalidateSelf()V

    .line 83
    :cond_f
    return-void
.end method

.method public start()V
    .registers 6

    .prologue
    .line 208
    invoke-direct {p0}, Lcom/rey/material/drawable/DividerDrawable;->resetAnimation()V

    .line 209
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/DividerDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 210
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->invalidateSelf()V

    .line 211
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 215
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mRunning:Z

    .line 216
    iget-object v0, p0, Lcom/rey/material/drawable/DividerDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/DividerDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 217
    invoke-virtual {p0}, Lcom/rey/material/drawable/DividerDrawable;->invalidateSelf()V

    .line 218
    return-void
.end method
