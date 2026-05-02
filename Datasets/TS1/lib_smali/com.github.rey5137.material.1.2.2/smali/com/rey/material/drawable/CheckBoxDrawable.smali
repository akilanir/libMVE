.class public Lcom/rey/material/drawable/CheckBoxDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "CheckBoxDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/drawable/CheckBoxDrawable$Builder;
    }
.end annotation


# static fields
.field private static final FILL_TIME:F = 0.4f

.field private static final TICK_DATA:[F


# instance fields
.field private mAnimDuration:I

.field private mAnimEnable:Z

.field private mAnimProgress:F

.field private mBoxRect:Landroid/graphics/RectF;

.field private mBoxSize:I

.field private mChecked:Z

.field private mCornerRadius:I

.field private mCurColor:I

.field private mHeight:I

.field private mInEditMode:Z

.field private mPaint:Landroid/graphics/Paint;

.field private mPrevColor:I

.field private mRunning:Z

.field private mStartTime:J

.field private mStrokeColor:Landroid/content/res/ColorStateList;

.field private mStrokeSize:I

.field private mTickColor:I

.field private mTickPath:Landroid/graphics/Path;

.field private mTickPathProgress:F

.field private final mUpdater:Ljava/lang/Runnable;

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    const/4 v0, 0x6

    new-array v0, v0, [F

    fill-array-data v0, :array_a

    sput-object v0, Lcom/rey/material/drawable/CheckBoxDrawable;->TICK_DATA:[F

    return-void

    nop

    :array_a
    .array-data 4
        0x0
        0x3ef22d0e    # 0.473f
        0x3ebbe76d    # 0.367f
        0x3f56c8b4    # 0.839f
        0x3f800000    # 1.0f
        0x3e53f7cf    # 0.207f
    .end array-data
.end method

.method private constructor <init>(IIIIILandroid/content/res/ColorStateList;II)V
    .registers 12
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "boxSize"    # I
    .param p4, "cornerRadius"    # I
    .param p5, "strokeSize"    # I
    .param p6, "strokeColor"    # Landroid/content/res/ColorStateList;
    .param p7, "tickColor"    # I
    .param p8, "animDuration"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 52
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 25
    iput-boolean v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mRunning:Z

    .line 43
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mTickPathProgress:F

    .line 44
    iput-boolean v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mChecked:Z

    .line 46
    iput-boolean v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mInEditMode:Z

    .line 47
    iput-boolean v2, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimEnable:Z

    .line 332
    new-instance v0, Lcom/rey/material/drawable/CheckBoxDrawable$1;

    invoke-direct {v0, p0}, Lcom/rey/material/drawable/CheckBoxDrawable$1;-><init>(Lcom/rey/material/drawable/CheckBoxDrawable;)V

    iput-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mUpdater:Ljava/lang/Runnable;

    .line 53
    iput p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mWidth:I

    .line 54
    iput p2, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mHeight:I

    .line 55
    iput p3, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxSize:I

    .line 56
    iput p4, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    .line 57
    iput p5, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    .line 58
    iput-object p6, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeColor:Landroid/content/res/ColorStateList;

    .line 59
    iput p7, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mTickColor:I

    .line 60
    iput p8, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimDuration:I

    .line 62
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    .line 63
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 65
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    .line 66
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mTickPath:Landroid/graphics/Path;

    .line 67
    return-void
.end method

.method synthetic constructor <init>(IIIIILandroid/content/res/ColorStateList;IILcom/rey/material/drawable/CheckBoxDrawable$1;)V
    .registers 10
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # I
    .param p5, "x4"    # I
    .param p6, "x5"    # Landroid/content/res/ColorStateList;
    .param p7, "x6"    # I
    .param p8, "x7"    # I
    .param p9, "x8"    # Lcom/rey/material/drawable/CheckBoxDrawable$1;

    .prologue
    .line 23
    invoke-direct/range {p0 .. p8}, Lcom/rey/material/drawable/CheckBoxDrawable;-><init>(IIIIILandroid/content/res/ColorStateList;II)V

    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/drawable/CheckBoxDrawable;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/drawable/CheckBoxDrawable;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/rey/material/drawable/CheckBoxDrawable;->update()V

    return-void
.end method

.method private drawChecked(Landroid/graphics/Canvas;)V
    .registers 18
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 169
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxSize:I

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    mul-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    int-to-float v5, v1

    .line 170
    .local v5, "size":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v2, v2

    add-float v3, v1, v2

    .line 171
    .local v3, "x":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v2, v2

    add-float v4, v1, v2

    .line 173
    .local v4, "y":F
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/drawable/CheckBoxDrawable;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_14f

    .line 174
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimProgress:F

    const v2, 0x3ecccccd    # 0.4f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_d0

    .line 175
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimProgress:F

    const v2, 0x3ecccccd    # 0.4f

    div-float v6, v1, v2

    .line 176
    .local v6, "progress":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxSize:I

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    mul-float v14, v1, v6

    .line 177
    .local v14, "fillWidth":F
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, v14, v2

    add-float/2addr v1, v2

    const/high16 v2, 0x3f000000    # 0.5f

    sub-float v15, v1, v2

    .line 179
    .local v15, "padding":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPrevColor:I

    move-object/from16 v0, p0

    iget v7, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCurColor:I

    invoke-static {v2, v7, v6}, Lcom/rey/material/util/ColorUtil;->getMiddleColor(IIF)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 180
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v14}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 181
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 182
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    add-float v2, v1, v15

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    add-float v3, v1, v15

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    .end local v3    # "x":F
    iget v1, v1, Landroid/graphics/RectF;->right:F

    sub-float v4, v1, v15

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    .end local v4    # "y":F
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    sub-float v5, v1, v15

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    .end local v5    # "size":F
    .end local v6    # "progress":F
    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 184
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 185
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v7, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v7, v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2, v7, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 216
    .end local v14    # "fillWidth":F
    .end local v15    # "padding":F
    :goto_cf
    return-void

    .line 188
    .restart local v3    # "x":F
    .restart local v4    # "y":F
    .restart local v5    # "size":F
    :cond_d0
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimProgress:F

    const v2, 0x3ecccccd    # 0.4f

    sub-float/2addr v1, v2

    const v2, 0x3f19999a    # 0.6f

    div-float v6, v1, v2

    .line 190
    .restart local v6    # "progress":F
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCurColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 191
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 192
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 193
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v7, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v7, v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2, v7, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 195
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 196
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 197
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 198
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mTickColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 200
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mTickPath:Landroid/graphics/Path;

    const/4 v7, 0x1

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/rey/material/drawable/CheckBoxDrawable;->getTickPath(Landroid/graphics/Path;FFFFZ)Landroid/graphics/Path;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_cf

    .line 204
    .end local v6    # "progress":F
    :cond_14f
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCurColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 205
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 206
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 207
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v7, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v7, v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2, v7, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 209
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 210
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 211
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 212
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mTickColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 214
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mTickPath:Landroid/graphics/Path;

    const/high16 v12, 0x3f800000    # 1.0f

    const/4 v13, 0x1

    move-object/from16 v7, p0

    move v9, v3

    move v10, v4

    move v11, v5

    invoke-direct/range {v7 .. v13}, Lcom/rey/material/drawable/CheckBoxDrawable;->getTickPath(Landroid/graphics/Path;FFFFZ)Landroid/graphics/Path;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_cf
.end method

.method private drawUnchecked(Landroid/graphics/Canvas;)V
    .registers 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v8, 0x3f800000    # 1.0f

    const v7, 0x3f19999a    # 0.6f

    const v1, 0x3ecccccd    # 0.4f

    const/high16 v6, 0x40000000    # 2.0f

    .line 219
    invoke-virtual {p0}, Lcom/rey/material/drawable/CheckBoxDrawable;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_ea

    .line 220
    iget v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimProgress:F

    cmpg-float v0, v0, v7

    if-gez v0, :cond_81

    .line 221
    iget v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxSize:I

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    int-to-float v4, v0

    .line 222
    .local v4, "size":F
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v1, v1

    add-float v2, v0, v1

    .line 223
    .local v2, "x":F
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v1, v1

    add-float v3, v0, v1

    .line 224
    .local v3, "y":F
    iget v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimProgress:F

    div-float v5, v0, v7

    .line 226
    .local v5, "progress":F
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPrevColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 227
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 228
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 229
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v1, v1

    iget v6, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v6, v6

    iget-object v7, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v6, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 231
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 232
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 233
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 234
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mTickColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 236
    iget-object v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mTickPath:Landroid/graphics/Path;

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/rey/material/drawable/CheckBoxDrawable;->getTickPath(Landroid/graphics/Path;FFFFZ)Landroid/graphics/Path;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 258
    .end local v2    # "x":F
    .end local v3    # "y":F
    .end local v4    # "size":F
    .end local v5    # "progress":F
    :goto_80
    return-void

    .line 239
    :cond_81
    iget v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimProgress:F

    add-float/2addr v0, v1

    sub-float/2addr v0, v8

    div-float v5, v0, v1

    .line 240
    .restart local v5    # "progress":F
    iget v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxSize:I

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    div-float/2addr v0, v6

    sub-float v1, v8, v5

    mul-float v12, v0, v1

    .line 241
    .local v12, "fillWidth":F
    iget v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v0, v0

    div-float/2addr v0, v6

    div-float v1, v12, v6

    add-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    sub-float v13, v0, v1

    .line 243
    .local v13, "padding":F
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPrevColor:I

    iget v6, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCurColor:I

    invoke-static {v1, v6, v5}, Lcom/rey/material/util/ColorUtil;->getMiddleColor(IIF)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 244
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v12}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 245
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 246
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    add-float v7, v0, v13

    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    add-float v8, v0, v13

    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    sub-float v9, v0, v13

    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    sub-float v10, v0, v13

    iget-object v11, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v6, p1

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 248
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 249
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v1, v1

    iget v6, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v6, v6

    iget-object v7, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v6, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_80

    .line 253
    .end local v5    # "progress":F
    .end local v12    # "fillWidth":F
    .end local v13    # "padding":F
    :cond_ea
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCurColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 254
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 255
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 256
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v1, v1

    iget v6, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCornerRadius:I

    int-to-float v6, v6

    iget-object v7, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v6, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto/16 :goto_80
.end method

.method private getTickPath(Landroid/graphics/Path;FFFFZ)Landroid/graphics/Path;
    .registers 24
    .param p1, "path"    # Landroid/graphics/Path;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "size"    # F
    .param p5, "progress"    # F
    .param p6, "in"    # Z

    .prologue
    .line 120
    move-object/from16 v0, p0

    iget v11, v0, Lcom/rey/material/drawable/CheckBoxDrawable;->mTickPathProgress:F

    cmpl-float v11, v11, p5

    if-nez v11, :cond_9

    .line 165
    :goto_8
    return-object p1

    .line 123
    :cond_9
    move/from16 v0, p5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/drawable/CheckBoxDrawable;->mTickPathProgress:F

    .line 125
    sget-object v11, Lcom/rey/material/drawable/CheckBoxDrawable;->TICK_DATA:[F

    const/4 v12, 0x0

    aget v11, v11, v12

    mul-float v11, v11, p4

    add-float v5, p2, v11

    .line 126
    .local v5, "x1":F
    sget-object v11, Lcom/rey/material/drawable/CheckBoxDrawable;->TICK_DATA:[F

    const/4 v12, 0x1

    aget v11, v11, v12

    mul-float v11, v11, p4

    add-float v8, p3, v11

    .line 127
    .local v8, "y1":F
    sget-object v11, Lcom/rey/material/drawable/CheckBoxDrawable;->TICK_DATA:[F

    const/4 v12, 0x2

    aget v11, v11, v12

    mul-float v11, v11, p4

    add-float v6, p2, v11

    .line 128
    .local v6, "x2":F
    sget-object v11, Lcom/rey/material/drawable/CheckBoxDrawable;->TICK_DATA:[F

    const/4 v12, 0x3

    aget v11, v11, v12

    mul-float v11, v11, p4

    add-float v9, p3, v11

    .line 129
    .local v9, "y2":F
    sget-object v11, Lcom/rey/material/drawable/CheckBoxDrawable;->TICK_DATA:[F

    const/4 v12, 0x4

    aget v11, v11, v12

    mul-float v11, v11, p4

    add-float v7, p2, v11

    .line 130
    .local v7, "x3":F
    sget-object v11, Lcom/rey/material/drawable/CheckBoxDrawable;->TICK_DATA:[F

    const/4 v12, 0x5

    aget v11, v11, v12

    mul-float v11, v11, p4

    add-float v10, p3, v11

    .line 132
    .local v10, "y3":F
    sub-float v11, v5, v6

    float-to-double v11, v11

    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v11

    sub-float v13, v8, v9

    float-to-double v13, v13

    const-wide/high16 v15, 0x4000000000000000L    # 2.0

    invoke-static/range {v13 .. v16}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v13

    add-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v11

    double-to-float v2, v11

    .line 133
    .local v2, "d1":F
    sub-float v11, v5, v6

    float-to-double v11, v11

    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v11

    sub-float v13, v8, v9

    float-to-double v13, v13

    const-wide/high16 v15, 0x4000000000000000L    # 2.0

    invoke-static/range {v13 .. v16}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v13

    add-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v11

    double-to-float v3, v11

    .line 134
    .local v3, "d2":F
    add-float v11, v2, v3

    div-float v4, v2, v11

    .line 136
    .local v4, "midProgress":F
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Path;->reset()V

    .line 138
    if-eqz p6, :cond_c3

    .line 139
    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v8}, Landroid/graphics/Path;->moveTo(FF)V

    .line 141
    cmpg-float v11, p5, v4

    if-gez v11, :cond_a0

    .line 142
    div-float p5, p5, v4

    .line 143
    const/high16 v11, 0x3f800000    # 1.0f

    sub-float v11, v11, p5

    mul-float/2addr v11, v5

    mul-float v12, v6, p5

    add-float/2addr v11, v12

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float v12, v12, p5

    mul-float/2addr v12, v8

    mul-float v13, v9, p5

    add-float/2addr v12, v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_8

    .line 146
    :cond_a0
    sub-float v11, p5, v4

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float/2addr v12, v4

    div-float p5, v11, v12

    .line 147
    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 148
    const/high16 v11, 0x3f800000    # 1.0f

    sub-float v11, v11, p5

    mul-float/2addr v11, v6

    mul-float v12, v7, p5

    add-float/2addr v11, v12

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float v12, v12, p5

    mul-float/2addr v12, v9

    mul-float v13, v10, p5

    add-float/2addr v12, v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_8

    .line 152
    :cond_c3
    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v10}, Landroid/graphics/Path;->moveTo(FF)V

    .line 154
    cmpg-float v11, p5, v4

    if-gez v11, :cond_ea

    .line 155
    div-float p5, p5, v4

    .line 156
    move-object/from16 v0, p1

    invoke-virtual {v0, v6, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 157
    const/high16 v11, 0x3f800000    # 1.0f

    sub-float v11, v11, p5

    mul-float/2addr v11, v5

    mul-float v12, v6, p5

    add-float/2addr v11, v12

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float v12, v12, p5

    mul-float/2addr v12, v8

    mul-float v13, v9, p5

    add-float/2addr v12, v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_8

    .line 160
    :cond_ea
    sub-float v11, p5, v4

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float/2addr v12, v4

    div-float p5, v11, v12

    .line 161
    const/high16 v11, 0x3f800000    # 1.0f

    sub-float v11, v11, p5

    mul-float/2addr v11, v6

    mul-float v12, v7, p5

    add-float/2addr v11, v12

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float v12, v12, p5

    mul-float/2addr v12, v9

    mul-float v13, v10, p5

    add-float/2addr v12, v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_8
.end method

.method private resetAnimation()V
    .registers 3

    .prologue
    .line 302
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStartTime:J

    .line 303
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimProgress:F

    .line 304
    return-void
.end method

.method private update()V
    .registers 8

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    .line 342
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 343
    .local v0, "curTime":J
    iget-wide v2, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStartTime:J

    sub-long v2, v0, v2

    long-to-float v2, v2

    iget v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimDuration:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimProgress:F

    .line 345
    iget v2, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimProgress:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_1e

    .line 346
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mRunning:Z

    .line 348
    :cond_1e
    invoke-virtual {p0}, Lcom/rey/material/drawable/CheckBoxDrawable;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 349
    iget-object v2, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x10

    add-long/2addr v3, v5

    invoke-virtual {p0, v2, v3, v4}, Lcom/rey/material/drawable/CheckBoxDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 351
    :cond_30
    invoke-virtual {p0}, Lcom/rey/material/drawable/CheckBoxDrawable;->invalidateSelf()V

    .line 352
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mChecked:Z

    if-eqz v0, :cond_8

    .line 114
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/CheckBoxDrawable;->drawChecked(Landroid/graphics/Canvas;)V

    .line 117
    :goto_7
    return-void

    .line 116
    :cond_8
    invoke-direct {p0, p1}, Lcom/rey/material/drawable/CheckBoxDrawable;->drawUnchecked(Landroid/graphics/Canvas;)V

    goto :goto_7
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 88
    iget v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 83
    iget v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mWidth:I

    return v0
.end method

.method public getMinimumHeight()I
    .registers 2

    .prologue
    .line 98
    iget v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mHeight:I

    return v0
.end method

.method public getMinimumWidth()I
    .registers 2

    .prologue
    .line 93
    iget v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mWidth:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 296
    const/4 v0, -0x3

    return v0
.end method

.method public isAnimEnable()Z
    .registers 2

    .prologue
    .line 78
    iget-boolean v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimEnable:Z

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 323
    iget-boolean v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mRunning:Z

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 103
    const/4 v0, 0x1

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 8
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 108
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v1

    iget v2, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxSize:I

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v2

    iget v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxSize:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v3

    iget v4, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxSize:I

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    add-float/2addr v3, v4

    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v4

    iget v5, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mBoxSize:I

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    add-float/2addr v4, v5

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 109
    return-void
.end method

.method protected onStateChange([I)Z
    .registers 7
    .param p1, "state"    # [I

    .prologue
    .line 262
    const v3, 0x10100a0

    invoke-static {p1, v3}, Lcom/rey/material/util/ViewUtil;->hasState([II)Z

    move-result v0

    .line 263
    .local v0, "checked":Z
    iget-object v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mStrokeColor:Landroid/content/res/ColorStateList;

    iget v4, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCurColor:I

    invoke-virtual {v3, p1, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    .line 264
    .local v1, "color":I
    const/4 v2, 0x0

    .line 266
    .local v2, "needRedraw":Z
    iget-boolean v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mChecked:Z

    if-eq v3, v0, :cond_22

    .line 267
    iput-boolean v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mChecked:Z

    .line 268
    const/4 v2, 0x1

    .line 269
    iget-boolean v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mInEditMode:Z

    if-nez v3, :cond_22

    iget-boolean v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimEnable:Z

    if-eqz v3, :cond_22

    .line 270
    invoke-virtual {p0}, Lcom/rey/material/drawable/CheckBoxDrawable;->start()V

    .line 273
    :cond_22
    iget v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCurColor:I

    if-eq v3, v1, :cond_36

    .line 274
    invoke-virtual {p0}, Lcom/rey/material/drawable/CheckBoxDrawable;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_34

    iget v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCurColor:I

    :goto_2e
    iput v3, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPrevColor:I

    .line 275
    iput v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mCurColor:I

    .line 276
    const/4 v2, 0x1

    .line 281
    :cond_33
    :goto_33
    return v2

    :cond_34
    move v3, v1

    .line 274
    goto :goto_2e

    .line 278
    :cond_36
    invoke-virtual {p0}, Lcom/rey/material/drawable/CheckBoxDrawable;->isRunning()Z

    move-result v3

    if-nez v3, :cond_33

    .line 279
    iput v1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPrevColor:I

    goto :goto_33
.end method

.method public scheduleSelf(Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "what"    # Ljava/lang/Runnable;
    .param p2, "when"    # J

    .prologue
    .line 328
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mRunning:Z

    .line 329
    invoke-super {p0, p1, p2, p3}, Landroid/graphics/drawable/Drawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 330
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 286
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 287
    return-void
.end method

.method public setAnimEnable(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 74
    iput-boolean p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mAnimEnable:Z

    .line 75
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 291
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 292
    return-void
.end method

.method public setInEditMode(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 70
    iput-boolean p1, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mInEditMode:Z

    .line 71
    return-void
.end method

.method public start()V
    .registers 6

    .prologue
    .line 308
    invoke-direct {p0}, Lcom/rey/material/drawable/CheckBoxDrawable;->resetAnimation()V

    .line 310
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x10

    add-long/2addr v1, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/drawable/CheckBoxDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 311
    invoke-virtual {p0}, Lcom/rey/material/drawable/CheckBoxDrawable;->invalidateSelf()V

    .line 312
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 316
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mRunning:Z

    .line 317
    iget-object v0, p0, Lcom/rey/material/drawable/CheckBoxDrawable;->mUpdater:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/CheckBoxDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 318
    invoke-virtual {p0}, Lcom/rey/material/drawable/CheckBoxDrawable;->invalidateSelf()V

    .line 319
    return-void
.end method
