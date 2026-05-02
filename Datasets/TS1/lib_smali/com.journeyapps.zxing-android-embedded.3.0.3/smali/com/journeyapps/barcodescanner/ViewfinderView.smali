.class public Lcom/journeyapps/barcodescanner/ViewfinderView;
.super Landroid/view/View;
.source "ViewfinderView.java"


# static fields
.field protected static final ANIMATION_DELAY:J = 0x50L

.field protected static final CURRENT_POINT_OPACITY:I = 0xa0

.field protected static final MAX_RESULT_POINTS:I = 0x14

.field protected static final POINT_SIZE:I = 0x6

.field protected static final SCANNER_ALPHA:[I

.field protected static final TAG:Ljava/lang/String;


# instance fields
.field protected cameraPreview:Lcom/journeyapps/barcodescanner/CameraPreview;

.field protected final laserColor:I

.field protected lastPossibleResultPoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/ResultPoint;",
            ">;"
        }
    .end annotation
.end field

.field protected final maskColor:I

.field protected final paint:Landroid/graphics/Paint;

.field protected possibleResultPoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/ResultPoint;",
            ">;"
        }
    .end annotation
.end field

.field protected resultBitmap:Landroid/graphics/Bitmap;

.field protected final resultColor:I

.field protected final resultPointColor:I

.field protected scannerAlpha:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 43
    const-class v0, Lcom/journeyapps/barcodescanner/ViewfinderView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->TAG:Ljava/lang/String;

    .line 45
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_12

    sput-object v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->SCANNER_ALPHA:[I

    return-void

    :array_12
    .array-data 4
        0x0
        0x40
        0x80
        0xc0
        0xff
        0xc0
        0x80
        0x40
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 67
    new-instance v2, Landroid/graphics/Paint;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    .line 69
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/ViewfinderView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 72
    .local v1, "resources":Landroid/content/res/Resources;
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/ViewfinderView;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lcom/google/zxing/client/android/R$styleable;->zxing_finder:[I

    invoke-virtual {v2, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 74
    .local v0, "attributes":Landroid/content/res/TypedArray;
    sget v2, Lcom/google/zxing/client/android/R$styleable;->zxing_finder_zxing_viewfinder_mask:I

    sget v3, Lcom/google/zxing/client/android/R$color;->zxing_viewfinder_mask:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->maskColor:I

    .line 76
    sget v2, Lcom/google/zxing/client/android/R$styleable;->zxing_finder_zxing_result_view:I

    sget v3, Lcom/google/zxing/client/android/R$color;->zxing_result_view:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->resultColor:I

    .line 78
    sget v2, Lcom/google/zxing/client/android/R$styleable;->zxing_finder_zxing_viewfinder_laser:I

    sget v3, Lcom/google/zxing/client/android/R$color;->zxing_viewfinder_laser:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->laserColor:I

    .line 80
    sget v2, Lcom/google/zxing/client/android/R$styleable;->zxing_finder_zxing_possible_result_points:I

    sget v3, Lcom/google/zxing/client/android/R$color;->zxing_possible_result_points:I

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->resultPointColor:I

    .line 83
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 85
    const/4 v2, 0x0

    iput v2, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->scannerAlpha:I

    .line 86
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x5

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->possibleResultPoints:Ljava/util/List;

    .line 87
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->lastPossibleResultPoints:Ljava/util/List;

    .line 88
    return-void
.end method


# virtual methods
.method public addPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V
    .registers 6
    .param p1, "point"    # Lcom/google/zxing/ResultPoint;

    .prologue
    .line 215
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->possibleResultPoints:Ljava/util/List;

    .line 216
    .local v0, "points":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 218
    .local v1, "size":I
    const/16 v2, 0x14

    if-le v1, v2, :cond_17

    .line 220
    const/4 v2, 0x0

    add-int/lit8 v3, v1, -0xa

    invoke-interface {v0, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 222
    :cond_17
    return-void
.end method

.method public drawResultBitmap(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    .line 205
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    .line 206
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/ViewfinderView;->invalidate()V

    .line 207
    return-void
.end method

.method public drawViewfinder()V
    .registers 3

    .prologue
    .line 191
    iget-object v0, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    .line 192
    .local v0, "resultBitmap":Landroid/graphics/Bitmap;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    .line 193
    if-eqz v0, :cond_a

    .line 194
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 196
    :cond_a
    invoke-virtual {p0}, Lcom/journeyapps/barcodescanner/ViewfinderView;->invalidate()V

    .line 197
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 25
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DrawAllocation"
        }
    .end annotation

    .prologue
    .line 119
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->cameraPreview:Lcom/journeyapps/barcodescanner/CameraPreview;

    if-eqz v2, :cond_1a

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->cameraPreview:Lcom/journeyapps/barcodescanner/CameraPreview;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/CameraPreview;->getPreviewFramingRect()Landroid/graphics/Rect;

    move-result-object v2

    if-eqz v2, :cond_1a

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->cameraPreview:Lcom/journeyapps/barcodescanner/CameraPreview;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/CameraPreview;->getFramingRect()Landroid/graphics/Rect;

    move-result-object v2

    if-nez v2, :cond_1b

    .line 188
    :cond_1a
    :goto_1a
    return-void

    .line 123
    :cond_1b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->cameraPreview:Lcom/journeyapps/barcodescanner/CameraPreview;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/CameraPreview;->getFramingRect()Landroid/graphics/Rect;

    move-result-object v11

    .line 124
    .local v11, "frame":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->cameraPreview:Lcom/journeyapps/barcodescanner/CameraPreview;

    invoke-virtual {v2}, Lcom/journeyapps/barcodescanner/CameraPreview;->getPreviewFramingRect()Landroid/graphics/Rect;

    move-result-object v18

    .line 126
    .local v18, "previewFrame":Landroid/graphics/Rect;
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v22

    .line 127
    .local v22, "width":I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v14

    .line 130
    .local v14, "height":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_b5

    move-object/from16 v0, p0

    iget v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->resultColor:I

    :goto_41
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 131
    const/4 v3, 0x0

    const/4 v4, 0x0

    move/from16 v0, v22

    int-to-float v5, v0

    iget v2, v11, Landroid/graphics/Rect;->top:I

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 132
    const/4 v3, 0x0

    iget v2, v11, Landroid/graphics/Rect;->top:I

    int-to-float v4, v2

    iget v2, v11, Landroid/graphics/Rect;->left:I

    int-to-float v5, v2

    iget v2, v11, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 133
    iget v2, v11, Landroid/graphics/Rect;->right:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v3, v2

    iget v2, v11, Landroid/graphics/Rect;->top:I

    int-to-float v4, v2

    move/from16 v0, v22

    int-to-float v5, v0

    iget v2, v11, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 134
    const/4 v3, 0x0

    iget v2, v11, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v4, v2

    move/from16 v0, v22

    int-to-float v5, v0

    int-to-float v6, v14

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 136
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_ba

    .line 138
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xa0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 139
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v11, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto/16 :goto_1a

    .line 130
    :cond_b5
    move-object/from16 v0, p0

    iget v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->maskColor:I

    goto :goto_41

    .line 143
    :cond_ba
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->laserColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 144
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    sget-object v3, Lcom/journeyapps/barcodescanner/ViewfinderView;->SCANNER_ALPHA:[I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->scannerAlpha:I

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 145
    move-object/from16 v0, p0

    iget v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->scannerAlpha:I

    add-int/lit8 v2, v2, 0x1

    sget-object v3, Lcom/journeyapps/barcodescanner/ViewfinderView;->SCANNER_ALPHA:[I

    array-length v3, v3

    rem-int/2addr v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->scannerAlpha:I

    .line 146
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iget v3, v11, Landroid/graphics/Rect;->top:I

    add-int v16, v2, v3

    .line 147
    .local v16, "middle":I
    iget v2, v11, Landroid/graphics/Rect;->left:I

    add-int/lit8 v2, v2, 0x2

    int-to-float v3, v2

    add-int/lit8 v2, v16, -0x1

    int-to-float v4, v2

    iget v2, v11, Landroid/graphics/Rect;->right:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v5, v2

    add-int/lit8 v2, v16, 0x2

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 149
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    div-float v20, v2, v3

    .line 150
    .local v20, "scaleX":F
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    div-float v21, v2, v3

    .line 152
    .local v21, "scaleY":F
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->possibleResultPoints:Ljava/util/List;

    .line 153
    .local v10, "currentPossible":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->lastPossibleResultPoints:Ljava/util/List;

    .line 154
    .local v9, "currentLast":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    iget v12, v11, Landroid/graphics/Rect;->left:I

    .line 155
    .local v12, "frameLeft":I
    iget v13, v11, Landroid/graphics/Rect;->top:I

    .line 156
    .local v13, "frameTop":I
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_17a

    .line 157
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->lastPossibleResultPoints:Ljava/util/List;

    .line 169
    :cond_134
    if-eqz v9, :cond_1ca

    .line 170
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    const/16 v3, 0x50

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 171
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->resultPointColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 172
    const/high16 v19, 0x40400000    # 3.0f

    .line 173
    .local v19, "radius":F
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, "i$":Ljava/util/Iterator;
    :goto_150
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1ca

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/google/zxing/ResultPoint;

    .line 174
    .local v17, "point":Lcom/google/zxing/ResultPoint;
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    mul-float v2, v2, v20

    float-to-int v2, v2

    add-int/2addr v2, v12

    int-to-float v2, v2

    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    mul-float v3, v3, v21

    float-to-int v3, v3

    add-int/2addr v3, v13

    int-to-float v3, v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v2, v3, v1, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_150

    .line 159
    .end local v15    # "i$":Ljava/util/Iterator;
    .end local v17    # "point":Lcom/google/zxing/ResultPoint;
    .end local v19    # "radius":F
    :cond_17a
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x5

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->possibleResultPoints:Ljava/util/List;

    .line 160
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->lastPossibleResultPoints:Ljava/util/List;

    .line 161
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xa0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 162
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->resultPointColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 163
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .restart local v15    # "i$":Ljava/util/Iterator;
    :goto_1a0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_134

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/google/zxing/ResultPoint;

    .line 164
    .restart local v17    # "point":Lcom/google/zxing/ResultPoint;
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    mul-float v2, v2, v20

    float-to-int v2, v2

    add-int/2addr v2, v12

    int-to-float v2, v2

    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    mul-float v3, v3, v21

    float-to-int v3, v3

    add-int/2addr v3, v13

    int-to-float v3, v3

    const/high16 v4, 0x40c00000    # 6.0f

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/journeyapps/barcodescanner/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_1a0

    .line 182
    .end local v15    # "i$":Ljava/util/Iterator;
    .end local v17    # "point":Lcom/google/zxing/ResultPoint;
    :cond_1ca
    const-wide/16 v3, 0x50

    iget v2, v11, Landroid/graphics/Rect;->left:I

    add-int/lit8 v5, v2, -0x6

    iget v2, v11, Landroid/graphics/Rect;->top:I

    add-int/lit8 v6, v2, -0x6

    iget v2, v11, Landroid/graphics/Rect;->right:I

    add-int/lit8 v7, v2, 0x6

    iget v2, v11, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v8, v2, 0x6

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v8}, Lcom/journeyapps/barcodescanner/ViewfinderView;->postInvalidateDelayed(JIIII)V

    goto/16 :goto_1a
.end method

.method public setCameraPreview(Lcom/journeyapps/barcodescanner/CameraPreview;)V
    .registers 3
    .param p1, "view"    # Lcom/journeyapps/barcodescanner/CameraPreview;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/ViewfinderView;->cameraPreview:Lcom/journeyapps/barcodescanner/CameraPreview;

    .line 92
    new-instance v0, Lcom/journeyapps/barcodescanner/ViewfinderView$1;

    invoke-direct {v0, p0}, Lcom/journeyapps/barcodescanner/ViewfinderView$1;-><init>(Lcom/journeyapps/barcodescanner/ViewfinderView;)V

    invoke-virtual {p1, v0}, Lcom/journeyapps/barcodescanner/CameraPreview;->addStateListener(Lcom/journeyapps/barcodescanner/CameraPreview$StateListener;)V

    .line 113
    return-void
.end method
