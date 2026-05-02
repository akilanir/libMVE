.class public Lcom/rey/material/drawable/RadioButtonDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "RadioButtonDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/drawable/RadioButtonDrawable$Builder;
    }
.end annotation


# instance fields
.field private mAnimDuration:I

.field private mAnimEnable:Z

.field private mAnimProgress:F

.field private mChecked:Z

.field private mCurColor:I

.field private mHeight:I

.field private mInEditMode:Z

.field private mInnerRadius:I

.field private mPaint:Landroid/graphics/Paint;

.field private mPrevColor:I

.field private mRadius:I

.field private mRunning:Z

.field private mStartTime:J

.field private mStrokeColor:Landroid/content/res/ColorStateList;

.field private mStrokeSize:I

.field private final mUpdater:Ljava/lang/Runnable;

.field private mWidth:I


# direct methods
.method private constructor <init>(IIILandroid/content/res/ColorStateList;III)V
    .registers 10
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "strokeSize"    # I
    .param p4, "strokeColor"    # Landroid/content/res/ColorStateList;
    .param p5, "radius"    # I
    .param p6, "innerRadius"    # I
    .param p7, "animDuration"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 42
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 22
    iput-boolean v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRunning:Z

    .line 37
    iput-boolean v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mChecked:Z

    .line 39
    iput-boolean v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mInEditMode:Z

    .line 40
    iput-boolean v1, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimEnable:Z

    .line 255
    new-instance v0, Lcom/rey/material/drawable/RadioButtonDrawable$1;

    invoke-direct {v0, p0}, Lcom/rey/material/drawable/RadioButtonDrawable$1;-><init>(Lcom/rey/material/drawable/RadioButtonDrawable;)V

    iput-object v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mUpdater:Ljava/lang/Runnable;

    .line 43
    iput p7, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimDuration:I

    .line 44
    iput p3, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    .line 45
    iput p1, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mWidth:I

    .line 46
    iput p2, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mHeight:I

    .line 47
    iput p5, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    .line 48
    iput p6, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mInnerRadius:I

    .line 49
    iput-object p4, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeColor:Landroid/content/res/ColorStateList;

    .line 51
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    .line 52
    iget-object v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 53
    return-void
.end method

.method synthetic constructor <init>(IIILandroid/content/res/ColorStateList;IIILcom/rey/material/drawable/RadioButtonDrawable$1;)V
    .registers 9
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Landroid/content/res/ColorStateList;
    .param p5, "x4"    # I
    .param p6, "x5"    # I
    .param p7, "x6"    # I
    .param p8, "x7"    # Lcom/rey/material/drawable/RadioButtonDrawable$1;

    .prologue
    .line 20
    invoke-direct/range {p0 .. p7}, Lcom/rey/material/drawable/RadioButtonDrawable;-><init>(IIILandroid/content/res/ColorStateList;III)V

    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/drawable/RadioButtonDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/RadioButtonDrawable;

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->update()V

    return-void
.end method

.method private drawChecked(Landroid/graphics/Canvas;)V
    .registers 15
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v12, 0x40000000    # 2.0f

    const/high16 v11, 0x3f800000    # 1.0f

    .line 101
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v0

    .line 102
    .local v0, "cx":F
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v1

    .line 104
    .local v1, "cy":F
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->isRunning()Z

    move-result v8

    if-eqz v8, :cond_ba

    .line 105
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    int-to-float v8, v8

    div-float v2, v8, v12

    .line 106
    .local v2, "halfStrokeSize":F
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v8, v8

    sub-float/2addr v8, v2

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v9, v9

    sub-float/2addr v9, v2

    iget v10, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v10, v10

    add-float/2addr v9, v10

    iget v10, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    int-to-float v10, v10

    sub-float/2addr v9, v10

    iget v10, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mInnerRadius:I

    int-to-float v10, v10

    sub-float/2addr v9, v10

    div-float v4, v8, v9

    .line 108
    .local v4, "inTime":F
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimProgress:F

    cmpg-float v8, v8, v4

    if-gez v8, :cond_73

    .line 109
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimProgress:F

    div-float v3, v8, v4

    .line 110
    .local v3, "inProgress":F
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v8, v8

    sub-float v9, v11, v3

    mul-float/2addr v9, v2

    add-float v7, v8, v9

    .line 111
    .local v7, "outerRadius":F
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v8, v8

    sub-float/2addr v8, v2

    sub-float v9, v11, v3

    mul-float v5, v8, v9

    .line 113
    .local v5, "innerRadius":F
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPrevColor:I

    iget v10, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mCurColor:I

    invoke-static {v9, v10, v3}, Lcom/rey/material/util/ColorUtil;->getMiddleColor(IIF)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 114
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    sub-float v9, v7, v5

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 115
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 116
    add-float v8, v7, v5

    div-float/2addr v8, v12

    iget-object v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v8, v9}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 141
    .end local v2    # "halfStrokeSize":F
    .end local v3    # "inProgress":F
    .end local v4    # "inTime":F
    .end local v5    # "innerRadius":F
    .end local v7    # "outerRadius":F
    :goto_72
    return-void

    .line 119
    .restart local v2    # "halfStrokeSize":F
    .restart local v4    # "inTime":F
    :cond_73
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimProgress:F

    sub-float/2addr v8, v4

    sub-float v9, v11, v4

    div-float v6, v8, v9

    .line 120
    .local v6, "outProgress":F
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    sub-float v9, v11, v6

    mul-float/2addr v8, v9

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mInnerRadius:I

    int-to-float v9, v9

    mul-float/2addr v9, v6

    add-float v5, v8, v9

    .line 122
    .restart local v5    # "innerRadius":F
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mCurColor:I

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 123
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 124
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v5, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 126
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v8, v8

    mul-float v9, v2, v6

    add-float v7, v8, v9

    .line 127
    .restart local v7    # "outerRadius":F
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 128
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 129
    sub-float v8, v7, v2

    iget-object v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v8, v9}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_72

    .line 133
    .end local v2    # "halfStrokeSize":F
    .end local v4    # "inTime":F
    .end local v5    # "innerRadius":F
    .end local v6    # "outProgress":F
    .end local v7    # "outerRadius":F
    :cond_ba
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mCurColor:I

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 134
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 135
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 136
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v8, v8

    iget-object v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v8, v9}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 138
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 139
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mInnerRadius:I

    int-to-float v8, v8

    iget-object v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v8, v9}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_72
.end method

.method private drawUnchecked(Landroid/graphics/Canvas;)V
    .registers 15
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v12, 0x40000000    # 2.0f

    const/high16 v11, 0x3f800000    # 1.0f

    .line 144
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v0

    .line 145
    .local v0, "cx":F
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v1

    .line 147
    .local v1, "cy":F
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->isRunning()Z

    move-result v8

    if-eqz v8, :cond_bd

    .line 148
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    int-to-float v8, v8

    div-float v2, v8, v12

    .line 149
    .local v2, "halfStrokeSize":F
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    sub-int/2addr v8, v9

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mInnerRadius:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v9, v9

    sub-float/2addr v9, v2

    iget v10, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v10, v10

    add-float/2addr v9, v10

    iget v10, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    int-to-float v10, v10

    sub-float/2addr v9, v10

    iget v10, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mInnerRadius:I

    int-to-float v10, v10

    sub-float/2addr v9, v10

    div-float v4, v8, v9

    .line 151
    .local v4, "inTime":F
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimProgress:F

    cmpg-float v8, v8, v4

    if-gez v8, :cond_8b

    .line 152
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimProgress:F

    div-float v3, v8, v4

    .line 153
    .local v3, "inProgress":F
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    mul-float/2addr v8, v3

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mInnerRadius:I

    int-to-float v9, v9

    sub-float v10, v11, v3

    mul-float/2addr v9, v10

    add-float v5, v8, v9

    .line 155
    .local v5, "innerRadius":F
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPrevColor:I

    iget v10, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mCurColor:I

    invoke-static {v9, v10, v3}, Lcom/rey/material/util/ColorUtil;->getMiddleColor(IIF)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 156
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 157
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v5, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 159
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v8, v8

    sub-float v9, v11, v3

    mul-float/2addr v9, v2

    add-float v7, v8, v9

    .line 160
    .local v7, "outerRadius":F
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 161
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 162
    sub-float v8, v7, v2

    iget-object v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v8, v9}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 181
    .end local v2    # "halfStrokeSize":F
    .end local v3    # "inProgress":F
    .end local v4    # "inTime":F
    .end local v5    # "innerRadius":F
    .end local v7    # "outerRadius":F
    :goto_8a
    return-void

    .line 165
    .restart local v2    # "halfStrokeSize":F
    .restart local v4    # "inTime":F
    :cond_8b
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimProgress:F

    sub-float/2addr v8, v4

    sub-float v9, v11, v4

    div-float v6, v8, v9

    .line 166
    .local v6, "outProgress":F
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v8, v8

    mul-float v9, v2, v6

    add-float v7, v8, v9

    .line 167
    .restart local v7    # "outerRadius":F
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v8, v8

    sub-float/2addr v8, v2

    mul-float v5, v8, v6

    .line 169
    .restart local v5    # "innerRadius":F
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mCurColor:I

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 170
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    sub-float v9, v7, v5

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 171
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 172
    add-float v8, v7, v5

    div-float/2addr v8, v12

    iget-object v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v8, v9}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_8a

    .line 176
    .end local v2    # "halfStrokeSize":F
    .end local v4    # "inTime":F
    .end local v5    # "innerRadius":F
    .end local v6    # "outProgress":F
    .end local v7    # "outerRadius":F
    :cond_bd
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mCurColor:I

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 177
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    iget v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeSize:I

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 178
    iget-object v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 179
    iget v8, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRadius:I

    int-to-float v8, v8

    iget-object v9, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v8, v9}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_8a
.end method

.method private resetAnimation()V
    .registers 3

    .prologue
    .line 225
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStartTime:J

    .line 226
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimProgress:F

    .line 227
    return-void
.end method

.method private update()V
    .registers 8

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    .line 265
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 266
    .local v0, "curTime":J
    iget-wide v2, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStartTime:J

    sub-long v2, v0, v2

    long-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimDuration:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimProgress:F

    .line 268
    iget v2, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimProgress:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_1e

    .line 269
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRunning:Z

    .line 271
    :cond_1e
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 272
    iget-object v2, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x10

    add-long/2addr v3, v5

    invoke-virtual {p0, v2, v3, v4}, Lcom/rey/material/drawable/RadioButtonDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 274
    :cond_30
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->invalidateSelf()V

    .line 275
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 94
    iget-boolean v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mChecked:Z

    if-eqz v0, :cond_8

    .line 95
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/RadioButtonDrawable;->drawChecked(Landroid/graphics/Canvas;)V

    .line 98
    :goto_7
    return-void

    .line 97
    :cond_8
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/RadioButtonDrawable;->drawUnchecked(Landroid/graphics/Canvas;)V

    goto :goto_7
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 74
    iget v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 69
    iget v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mWidth:I

    return v0
.end method

.method public getMinimumHeight()I
    .registers 2

    .prologue
    .line 84
    iget v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mHeight:I

    return v0
.end method

.method public getMinimumWidth()I
    .registers 2

    .prologue
    .line 79
    iget v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mWidth:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 219
    const/4 v0, -0x3

    return v0
.end method

.method public isAnimEnable()Z
    .registers 2

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimEnable:Z

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 246
    iget-boolean v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRunning:Z

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 89
    const/4 v0, 0x1

    return v0
.end method

.method protected onStateChange([I)Z
    .registers 7
    .param p1, "state"    # [I

    .prologue
    .line 185
    const v3, 0x10100a0

    invoke-static {p1, v3}, Lcom/rey/material/util/ViewUtil;->hasState([II)Z

    move-result v0

    .line 186
    .local v0, "checked":Z
    iget-object v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mStrokeColor:Landroid/content/res/ColorStateList;

    iget v4, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mCurColor:I

    invoke-virtual {v3, p1, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    .line 187
    .local v1, "color":I
    const/4 v2, 0x0

    .line 189
    .local v2, "needRedraw":Z
    iget-boolean v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mChecked:Z

    if-eq v3, v0, :cond_22

    .line 190
    iput-boolean v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mChecked:Z

    .line 191
    const/4 v2, 0x1

    .line 192
    iget-boolean v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mInEditMode:Z

    if-nez v3, :cond_22

    iget-boolean v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimEnable:Z

    if-eqz v3, :cond_22

    .line 193
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->start()V

    .line 196
    :cond_22
    iget v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mCurColor:I

    if-eq v3, v1, :cond_36

    .line 197
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_34

    iget v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mCurColor:I

    :goto_2e
    iput v3, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPrevColor:I

    .line 198
    iput v1, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mCurColor:I

    .line 199
    const/4 v2, 0x1

    .line 204
    :cond_33
    :goto_33
    return v2

    :cond_34
    move v3, v1

    .line 197
    goto :goto_2e

    .line 201
    :cond_36
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->isRunning()Z

    move-result v3

    if-nez v3, :cond_33

    .line 202
    iput v1, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPrevColor:I

    goto :goto_33
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 251
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRunning:Z

    .line 252
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 253
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 209
    iget-object v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 210
    return-void
.end method

.method public setAnimEnable(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 60
    iput-boolean p1, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mAnimEnable:Z

    .line 61
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 214
    iget-object v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 215
    return-void
.end method

.method public setInEditMode(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 56
    iput-boolean p1, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mInEditMode:Z

    .line 57
    return-void
.end method

.method public start()V
    .registers 6

    .prologue
    .line 231
    invoke-direct {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->resetAnimation()V

    .line 233
    iget-object v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/RadioButtonDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 234
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->invalidateSelf()V

    .line 235
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 239
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mRunning:Z

    .line 240
    iget-object v0, p0, Lcom/rey/material/drawable/RadioButtonDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/RadioButtonDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 241
    invoke-virtual {p0}, Lcom/rey/material/drawable/RadioButtonDrawable;->invalidateSelf()V

    .line 242
    return-void
.end method
