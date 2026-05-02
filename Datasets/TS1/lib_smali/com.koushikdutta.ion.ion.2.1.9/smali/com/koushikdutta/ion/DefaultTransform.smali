.class Lcom/koushikdutta/ion/DefaultTransform;
.super Ljava/lang/Object;
.source "DefaultTransform.java"

# interfaces
.implements Lcom/koushikdutta/ion/bitmap/Transform;


# static fields
.field static final bilinearSamplingPaint:Landroid/graphics/Paint;


# instance fields
.field final resizeHeight:I

.field final resizeWidth:I

.field final scaleMode:Lcom/koushikdutta/ion/ScaleMode;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 26
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/koushikdutta/ion/DefaultTransform;->bilinearSamplingPaint:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(IILcom/koushikdutta/ion/ScaleMode;)V
    .registers 5
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "scaleMode"    # Lcom/koushikdutta/ion/ScaleMode;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Lcom/koushikdutta/ion/DefaultTransform;->resizeWidth:I

    .line 17
    iput p2, p0, Lcom/koushikdutta/ion/DefaultTransform;->resizeHeight:I

    .line 20
    if-nez p3, :cond_e

    .line 21
    sget-object v0, Lcom/koushikdutta/ion/ScaleMode;->FitXY:Lcom/koushikdutta/ion/ScaleMode;

    iput-object v0, p0, Lcom/koushikdutta/ion/DefaultTransform;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 24
    :goto_d
    return-void

    .line 23
    :cond_e
    iput-object p3, p0, Lcom/koushikdutta/ion/DefaultTransform;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    goto :goto_d
.end method


# virtual methods
.method public key()Ljava/lang/String;
    .registers 3

    .prologue
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/koushikdutta/ion/DefaultTransform;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/ScaleMode;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/koushikdutta/ion/DefaultTransform;->resizeWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/koushikdutta/ion/DefaultTransform;->resizeHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public transform(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 26
    .param p1, "b"    # Landroid/graphics/Bitmap;

    .prologue
    .line 30
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v5

    .line 31
    .local v5, "config":Landroid/graphics/Bitmap$Config;
    if-nez v5, :cond_8

    .line 32
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 33
    :cond_8
    move-object/from16 v0, p0

    iget v13, v0, Lcom/koushikdutta/ion/DefaultTransform;->resizeWidth:I

    .line 34
    .local v13, "resizeWidth":I
    move-object/from16 v0, p0

    iget v12, v0, Lcom/koushikdutta/ion/DefaultTransform;->resizeHeight:I

    .line 35
    .local v12, "resizeHeight":I
    if-gtz v13, :cond_d9

    .line 36
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v21

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    div-float v11, v20, v21

    .line 37
    .local v11, "ratio":F
    int-to-float v0, v12

    move/from16 v20, v0

    mul-float v20, v20, v11

    move/from16 v0, v20

    float-to-int v13, v0

    .line 44
    .end local v11    # "ratio":F
    :cond_2e
    :goto_2e
    new-instance v6, Landroid/graphics/RectF;

    const/16 v20, 0x0

    const/16 v21, 0x0

    int-to-float v0, v13

    move/from16 v22, v0

    int-to-float v0, v12

    move/from16 v23, v0

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v6, v0, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 45
    .local v6, "destination":Landroid/graphics/RectF;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/koushikdutta/ion/DefaultTransform;->scaleMode:Lcom/koushikdutta/ion/ScaleMode;

    .line 47
    .local v15, "scaleMode":Lcom/koushikdutta/ion/ScaleMode;
    sget-object v20, Lcom/koushikdutta/ion/ScaleMode;->CenterInside:Lcom/koushikdutta/ion/ScaleMode;

    move-object/from16 v0, v20

    if-ne v15, v0, :cond_61

    .line 50
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v20

    move/from16 v0, v20

    if-le v13, v0, :cond_5f

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v20

    move/from16 v0, v20

    if-gt v12, v0, :cond_61

    .line 51
    :cond_5f
    sget-object v15, Lcom/koushikdutta/ion/ScaleMode;->FitCenter:Lcom/koushikdutta/ion/ScaleMode;

    .line 54
    :cond_61
    sget-object v20, Lcom/koushikdutta/ion/ScaleMode;->CenterInside:Lcom/koushikdutta/ion/ScaleMode;

    move-object/from16 v0, v20

    if-ne v15, v0, :cond_f9

    .line 55
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v20

    sub-int v20, v13, v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    const/high16 v21, 0x40000000    # 2.0f

    div-float v7, v20, v21

    .line 56
    .local v7, "marginx":F
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v20

    sub-int v20, v12, v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    const/high16 v21, 0x40000000    # 2.0f

    div-float v8, v20, v21

    .line 57
    .local v8, "marginy":F
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    add-float v20, v20, v7

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v21

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    add-float v21, v21, v8

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v6, v7, v8, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 77
    .end local v7    # "marginx":F
    .end local v8    # "marginy":F
    :cond_a2
    :goto_a2
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v20

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v21

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    cmpl-float v20, v20, v21

    if-nez v20, :cond_16f

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v20

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v21

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    cmpl-float v20, v20, v21

    if-nez v20, :cond_16f

    iget v0, v6, Landroid/graphics/RectF;->top:F

    move/from16 v20, v0

    const/16 v21, 0x0

    cmpl-float v20, v20, v21

    if-nez v20, :cond_16f

    iget v0, v6, Landroid/graphics/RectF;->left:F

    move/from16 v20, v0

    const/16 v21, 0x0

    cmpl-float v20, v20, v21

    if-nez v20, :cond_16f

    .line 86
    .end local p1    # "b":Landroid/graphics/Bitmap;
    :cond_d8
    :goto_d8
    return-object p1

    .line 39
    .end local v6    # "destination":Landroid/graphics/RectF;
    .end local v15    # "scaleMode":Lcom/koushikdutta/ion/ScaleMode;
    .restart local p1    # "b":Landroid/graphics/Bitmap;
    :cond_d9
    if-gtz v12, :cond_2e

    .line 40
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v21

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    div-float v11, v20, v21

    .line 41
    .restart local v11    # "ratio":F
    int-to-float v0, v13

    move/from16 v20, v0

    mul-float v20, v20, v11

    move/from16 v0, v20

    float-to-int v12, v0

    goto/16 :goto_2e

    .line 59
    .end local v11    # "ratio":F
    .restart local v6    # "destination":Landroid/graphics/RectF;
    .restart local v15    # "scaleMode":Lcom/koushikdutta/ion/ScaleMode;
    :cond_f9
    sget-object v20, Lcom/koushikdutta/ion/ScaleMode;->FitXY:Lcom/koushikdutta/ion/ScaleMode;

    move-object/from16 v0, v20

    if-eq v15, v0, :cond_a2

    .line 61
    int-to-float v0, v13

    move/from16 v20, v0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v21

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    div-float v18, v20, v21

    .line 62
    .local v18, "xratio":F
    int-to-float v0, v12

    move/from16 v20, v0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v21

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    div-float v19, v20, v21

    .line 63
    .local v19, "yratio":F
    sget-object v20, Lcom/koushikdutta/ion/ScaleMode;->CenterCrop:Lcom/koushikdutta/ion/ScaleMode;

    move-object/from16 v0, v20

    if-ne v15, v0, :cond_16a

    .line 64
    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->max(FF)F

    move-result v11

    .line 68
    .restart local v11    # "ratio":F
    :goto_125
    const/16 v20, 0x0

    cmpl-float v20, v11, v20

    if-eqz v20, :cond_d8

    .line 70
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    mul-float v10, v20, v11

    .line 71
    .local v10, "postWidth":F
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    mul-float v9, v20, v11

    .line 72
    .local v9, "postHeight":F
    int-to-float v0, v13

    move/from16 v20, v0

    sub-float v20, v20, v10

    const/high16 v21, 0x40000000    # 2.0f

    div-float v16, v20, v21

    .line 73
    .local v16, "transx":F
    int-to-float v0, v12

    move/from16 v20, v0

    sub-float v20, v20, v9

    const/high16 v21, 0x40000000    # 2.0f

    div-float v17, v20, v21

    .line 74
    .local v17, "transy":F
    int-to-float v0, v13

    move/from16 v20, v0

    sub-float v20, v20, v16

    int-to-float v0, v12

    move/from16 v21, v0

    sub-float v21, v21, v17

    move/from16 v0, v16

    move/from16 v1, v17

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    goto/16 :goto_a2

    .line 66
    .end local v9    # "postHeight":F
    .end local v10    # "postWidth":F
    .end local v11    # "ratio":F
    .end local v16    # "transx":F
    .end local v17    # "transy":F
    :cond_16a
    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->min(FF)F

    move-result v11

    .restart local v11    # "ratio":F
    goto :goto_125

    .line 82
    .end local v11    # "ratio":F
    .end local v18    # "xratio":F
    .end local v19    # "yratio":F
    :cond_16f
    invoke-static {v13, v12, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v14

    .line 83
    .local v14, "ret":Landroid/graphics/Bitmap;
    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, v14}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 85
    .local v4, "canvas":Landroid/graphics/Canvas;
    const/16 v20, 0x0

    sget-object v21, Lcom/koushikdutta/ion/DefaultTransform;->bilinearSamplingPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v4, v0, v1, v6, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    move-object/from16 p1, v14

    .line 86
    goto/16 :goto_d8
.end method
