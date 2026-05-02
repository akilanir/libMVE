.class Lcom/koushikdutta/ion/IonDrawable;
.super Landroid/graphics/drawable/LayerDrawable;
.source "IonDrawable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;,
        Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;
    }
.end annotation


# static fields
.field private static final DEFAULT_PAINT_FLAGS:I = 0x6

.field private static final FADE_DURATION:J = 0xc8L

.field private static final LOG_2:D

.field private static final TILE_DIM:I = 0x100


# instance fields
.field private final NULL_BITMAPINFO:Landroid/graphics/drawable/Drawable;

.field private final NULL_ERROR:Landroid/graphics/drawable/Drawable;

.field private final NULL_PLACEHOLDER:Landroid/graphics/drawable/Drawable;

.field private alpha:I

.field private bitmapDrawable:Landroid/graphics/drawable/Drawable;

.field private bitmapDrawableFactory:Lcom/koushikdutta/ion/BitmapDrawableFactory;

.field private bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

.field private callback:Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;

.field private error:Landroid/graphics/drawable/Drawable;

.field private errorResource:I

.field private fadeIn:Z

.field private gifDecoder:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

.field private info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

.field private ion:Lcom/koushikdutta/ion/Ion;

.field private loadCallback:Lcom/koushikdutta/async/future/FutureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/koushikdutta/async/future/FutureCallback",
            "<",
            "Lcom/koushikdutta/ion/IonDrawable;",
            ">;"
        }
    .end annotation
.end field

.field private maxLevel:I

.field private paint:Landroid/graphics/Paint;

.field private placeholder:Landroid/graphics/drawable/Drawable;

.field private placeholderResource:I

.field private repeatAnimation:Z

.field private resizeHeight:I

.field private resizeWidth:I

.field private resources:Landroid/content/res/Resources;

.field private servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

.field private textureDim:I

.field private tileCallback:Lcom/koushikdutta/async/future/FutureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/koushikdutta/async/future/FutureCallback",
            "<",
            "Lcom/koushikdutta/ion/bitmap/BitmapInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 31
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    sput-wide v0, Lcom/koushikdutta/ion/IonDrawable;->LOG_2:D

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;)V
    .registers 9
    .param p1, "resources"    # Landroid/content/res/Resources;

    .prologue
    const/4 v1, 0x0

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 281
    const/4 v0, 0x3

    new-array v2, v0, [Landroid/graphics/drawable/Drawable;

    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    move-object v0, v1

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-direct {v3, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    aput-object v3, v2, v4

    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    move-object v0, v1

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-direct {v3, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    aput-object v3, v2, v5

    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    aput-object v0, v2, v6

    invoke-direct {p0, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 37
    const/16 v0, 0xff

    iput v0, p0, Lcom/koushikdutta/ion/IonDrawable;->alpha:I

    .line 435
    new-instance v0, Lcom/koushikdutta/ion/IonDrawable$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/IonDrawable$1;-><init>(Lcom/koushikdutta/ion/IonDrawable;)V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->tileCallback:Lcom/koushikdutta/async/future/FutureCallback;

    .line 283
    invoke-virtual {p0, v4, v4}, Lcom/koushikdutta/ion/IonDrawable;->setId(II)V

    .line 284
    invoke-virtual {p0, v5, v5}, Lcom/koushikdutta/ion/IonDrawable;->setId(II)V

    .line 285
    invoke-virtual {p0, v6, v6}, Lcom/koushikdutta/ion/IonDrawable;->setId(II)V

    .line 287
    invoke-virtual {p0, v4}, Lcom/koushikdutta/ion/IonDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->NULL_PLACEHOLDER:Landroid/graphics/drawable/Drawable;

    .line 288
    invoke-virtual {p0, v5}, Lcom/koushikdutta/ion/IonDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->NULL_BITMAPINFO:Landroid/graphics/drawable/Drawable;

    .line 289
    invoke-virtual {p0, v6}, Lcom/koushikdutta/ion/IonDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->NULL_ERROR:Landroid/graphics/drawable/Drawable;

    .line 291
    iput-object p1, p0, Lcom/koushikdutta/ion/IonDrawable;->resources:Landroid/content/res/Resources;

    .line 292
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    .line 293
    new-instance v0, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;-><init>(Lcom/koushikdutta/ion/IonDrawable;)V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->callback:Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;

    .line 294
    return-void
.end method

.method static synthetic access$000(Lcom/koushikdutta/ion/IonDrawable;)Lcom/koushikdutta/async/future/FutureCallback;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/ion/IonDrawable;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->loadCallback:Lcom/koushikdutta/async/future/FutureCallback;

    return-object v0
.end method

.method static synthetic access$100(Lcom/koushikdutta/ion/IonDrawable;)Z
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/ion/IonDrawable;

    .prologue
    .line 30
    iget-boolean v0, p0, Lcom/koushikdutta/ion/IonDrawable;->repeatAnimation:Z

    return v0
.end method

.method private drawDeepZoom(Landroid/graphics/Canvas;)V
    .registers 52
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 626
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v12

    .line 627
    .local v12, "clip":Landroid/graphics/Rect;
    invoke-virtual/range {p0 .. p0}, Lcom/koushikdutta/ion/IonDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v11

    .line 629
    .local v11, "bounds":Landroid/graphics/Rect;
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v12}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    div-float v45, v3, v4

    .line 631
    .local v45, "zoom":F
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    mul-float v47, v45, v3

    .line 632
    .local v47, "zoomWidth":F
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    mul-float v46, v45, v3

    .line 634
    .local v46, "zoomHeight":F
    const/high16 v3, 0x43800000    # 256.0f

    div-float v3, v47, v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    sget-wide v48, Lcom/koushikdutta/ion/IonDrawable;->LOG_2:D

    div-double v41, v3, v48

    .line 635
    .local v41, "wlevel":D
    const/high16 v3, 0x43800000    # 256.0f

    div-float v3, v46, v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    sget-wide v48, Lcom/koushikdutta/ion/IonDrawable;->LOG_2:D

    div-double v13, v3, v48

    .line 636
    .local v13, "hlevel":D
    move-wide/from16 v0, v41

    invoke-static {v0, v1, v13, v14}, Ljava/lang/Math;->max(DD)D

    move-result-wide v18

    .line 638
    .local v18, "maxLevel":D
    const/4 v3, 0x0

    iget v4, v12, Landroid/graphics/Rect;->left:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v38

    .line 639
    .local v38, "visibleLeft":I
    invoke-virtual {v11}, Landroid/graphics/Rect;->width()I

    move-result v3

    iget v4, v12, Landroid/graphics/Rect;->right:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v39

    .line 640
    .local v39, "visibleRight":I
    const/4 v3, 0x0

    iget v4, v12, Landroid/graphics/Rect;->top:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v40

    .line 641
    .local v40, "visibleTop":I
    invoke-virtual {v11}, Landroid/graphics/Rect;->height()I

    move-result v3

    iget v4, v12, Landroid/graphics/Rect;->bottom:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v37

    .line 642
    .local v37, "visibleBottom":I
    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->floor(D)D

    move-result-wide v3

    double-to-int v0, v3

    move/from16 v16, v0

    .line 643
    .local v16, "level":I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/koushikdutta/ion/IonDrawable;->maxLevel:I

    move/from16 v0, v16

    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v16

    .line 644
    const/4 v3, 0x0

    move/from16 v0, v16

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v16

    .line 645
    const/4 v3, 0x1

    shl-int v17, v3, v16

    .line 646
    .local v17, "levelTiles":I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/koushikdutta/ion/IonDrawable;->textureDim:I

    div-int v34, v3, v17

    .line 651
    .local v34, "textureTileDim":I
    const/4 v9, 0x0

    .line 652
    .local v9, "DEBUG_ZOOM":Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v3, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_b0

    .line 653
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v3, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    const/4 v4, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/koushikdutta/ion/IonDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    move-object/from16 v48, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v48

    invoke-virtual {v0, v3, v4, v6, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 666
    :goto_a6
    const/4 v8, 0x1

    .line 667
    .local v8, "sampleSize":I
    :goto_a7
    div-int v3, v34, v8

    const/16 v4, 0x100

    if-le v3, v4, :cond_c7

    .line 668
    shl-int/lit8 v8, v8, 0x1

    goto :goto_a7

    .line 662
    .end local v8    # "sampleSize":I
    :cond_b0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    const/high16 v4, -0x1000000

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 663
    invoke-virtual/range {p0 .. p0}, Lcom/koushikdutta/ion/IonDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_a6

    .line 670
    .restart local v8    # "sampleSize":I
    :cond_c7
    const/16 v44, 0x0

    .local v44, "y":I
    :goto_c9
    move/from16 v0, v44

    move/from16 v1, v17

    if-ge v0, v1, :cond_e8

    .line 671
    mul-int v36, v34, v44

    .line 672
    .local v36, "top":I
    add-int/lit8 v3, v44, 0x1

    mul-int v10, v34, v3

    .line 673
    .local v10, "bottom":I
    iget v3, v11, Landroid/graphics/Rect;->bottom:I

    invoke-static {v10, v3}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 675
    move/from16 v0, v40

    if-ge v10, v0, :cond_e2

    .line 670
    :cond_df
    add-int/lit8 v44, v44, 0x1

    goto :goto_c9

    .line 677
    :cond_e2
    move/from16 v0, v36

    move/from16 v1, v37

    if-le v0, v1, :cond_e9

    .line 764
    .end local v10    # "bottom":I
    .end local v36    # "top":I
    :cond_e8
    return-void

    .line 679
    .restart local v10    # "bottom":I
    .restart local v36    # "top":I
    :cond_e9
    const/16 v43, 0x0

    .local v43, "x":I
    :goto_eb
    move/from16 v0, v43

    move/from16 v1, v17

    if-ge v0, v1, :cond_df

    .line 680
    mul-int v15, v34, v43

    .line 681
    .local v15, "left":I
    add-int/lit8 v3, v43, 0x1

    mul-int v26, v34, v3

    .line 682
    .local v26, "right":I
    iget v3, v11, Landroid/graphics/Rect;->right:I

    move/from16 v0, v26

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v26

    .line 684
    move/from16 v0, v26

    move/from16 v1, v38

    if-ge v0, v1, :cond_108

    .line 679
    :cond_105
    :goto_105
    add-int/lit8 v43, v43, 0x1

    goto :goto_eb

    .line 686
    :cond_108
    move/from16 v0, v39

    if-gt v15, v0, :cond_df

    .line 689
    new-instance v7, Landroid/graphics/Rect;

    move/from16 v0, v36

    move/from16 v1, v26

    invoke-direct {v7, v15, v0, v1, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 693
    .local v7, "texRect":Landroid/graphics/Rect;
    const/4 v3, 0x7

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v6, v6, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->key:Ljava/lang/String;

    aput-object v6, v3, v4

    const/4 v4, 0x1

    const-string v6, ","

    aput-object v6, v3, v4

    const/4 v4, 0x2

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v4

    const/4 v4, 0x3

    const-string v6, ","

    aput-object v6, v3, v4

    const/4 v4, 0x4

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v4

    const/4 v4, 0x5

    const-string v6, ","

    aput-object v6, v3, v4

    const/4 v4, 0x6

    invoke-static/range {v44 .. v44}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-static {v3}, Lcom/koushikdutta/async/util/FileCache;->toKeyString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 694
    .local v5, "tileKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/koushikdutta/ion/IonDrawable;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v3, v3, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v3, v5}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->get(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v35

    .line 695
    .local v35, "tile":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-eqz v35, :cond_16a

    move-object/from16 v0, v35

    iget-object v3, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_16a

    .line 698
    move-object/from16 v0, v35

    iget-object v3, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4, v7, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_105

    .line 703
    :cond_16a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/koushikdutta/ion/IonDrawable;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v3, v3, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v3, v5}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_185

    .line 706
    new-instance v3, Lcom/koushikdutta/ion/LoadBitmapRegion;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/koushikdutta/ion/IonDrawable;->ion:Lcom/koushikdutta/ion/Ion;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v6, v6, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-direct/range {v3 .. v8}, Lcom/koushikdutta/ion/LoadBitmapRegion;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;I)V

    .line 708
    :cond_185
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/koushikdutta/ion/IonDrawable;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v3, v3, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/koushikdutta/ion/IonDrawable;->tileCallback:Lcom/koushikdutta/async/future/FutureCallback;

    invoke-virtual {v3, v5, v4}, Lcom/koushikdutta/async/util/HashList;->add(Ljava/lang/String;Ljava/lang/Object;)V

    .line 710
    const/16 v20, 0x0

    .line 711
    .local v20, "parentLeft":I
    const/16 v22, 0x0

    .line 712
    .local v22, "parentTop":I
    const/16 v23, 0x1

    .line 713
    .local v23, "parentUp":I
    sub-int v21, v16, v23

    .line 714
    .local v21, "parentLevel":I
    rem-int/lit8 v3, v43, 0x2

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1a1

    .line 715
    add-int/lit8 v20, v20, 0x1

    .line 716
    :cond_1a1
    rem-int/lit8 v3, v44, 0x2

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1a8

    .line 717
    add-int/lit8 v22, v22, 0x1

    .line 718
    :cond_1a8
    shr-int/lit8 v24, v43, 0x1

    .line 719
    .local v24, "parentX":I
    shr-int/lit8 v25, v44, 0x1

    .line 721
    .local v25, "parentY":I
    :goto_1ac
    if-ltz v21, :cond_1f4

    .line 722
    const/4 v3, 0x7

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v6, v6, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->key:Ljava/lang/String;

    aput-object v6, v3, v4

    const/4 v4, 0x1

    const-string v6, ","

    aput-object v6, v3, v4

    const/4 v4, 0x2

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v4

    const/4 v4, 0x3

    const-string v6, ","

    aput-object v6, v3, v4

    const/4 v4, 0x4

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v4

    const/4 v4, 0x5

    const-string v6, ","

    aput-object v6, v3, v4

    const/4 v4, 0x6

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-static {v3}, Lcom/koushikdutta/async/util/FileCache;->toKeyString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 723
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/koushikdutta/ion/IonDrawable;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v3, v3, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    invoke-virtual {v3, v5}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->get(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v35

    .line 724
    if-eqz v35, :cond_210

    move-object/from16 v0, v35

    iget-object v3, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_210

    .line 739
    :cond_1f4
    if-eqz v35, :cond_105

    move-object/from16 v0, v35

    iget-object v3, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_105

    .line 743
    const/4 v3, 0x1

    shl-int v30, v3, v21

    .line 744
    .local v30, "subLevelTiles":I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/koushikdutta/ion/IonDrawable;->textureDim:I

    div-int v33, v3, v30

    .line 745
    .local v33, "subtileDim":I
    const/16 v31, 0x1

    .line 746
    .local v31, "subSampleSize":I
    :goto_207
    div-int v3, v33, v31

    const/16 v4, 0x100

    if-le v3, v4, :cond_22d

    .line 747
    shl-int/lit8 v31, v31, 0x1

    goto :goto_207

    .line 726
    .end local v30    # "subLevelTiles":I
    .end local v31    # "subSampleSize":I
    .end local v33    # "subtileDim":I
    :cond_210
    rem-int/lit8 v3, v24, 0x2

    const/4 v4, 0x1

    if-ne v3, v4, :cond_21a

    .line 727
    const/4 v3, 0x1

    shl-int v3, v3, v23

    add-int v20, v20, v3

    .line 729
    :cond_21a
    rem-int/lit8 v3, v25, 0x2

    const/4 v4, 0x1

    if-ne v3, v4, :cond_224

    .line 730
    const/4 v3, 0x1

    shl-int v3, v3, v23

    add-int v22, v22, v3

    .line 732
    :cond_224
    add-int/lit8 v21, v21, -0x1

    .line 733
    add-int/lit8 v23, v23, 0x1

    .line 734
    shr-int/lit8 v24, v24, 0x1

    .line 735
    shr-int/lit8 v25, v25, 0x1

    goto :goto_1ac

    .line 748
    .restart local v30    # "subLevelTiles":I
    .restart local v31    # "subSampleSize":I
    .restart local v33    # "subtileDim":I
    :cond_22d
    div-int v32, v33, v31

    .line 750
    .local v32, "subTextureDim":I
    shr-int v32, v32, v23

    .line 751
    mul-int v27, v32, v20

    .line 752
    .local v27, "sourceLeft":I
    mul-int v29, v32, v22

    .line 753
    .local v29, "sourceTop":I
    new-instance v28, Landroid/graphics/Rect;

    add-int v3, v27, v32

    add-int v4, v29, v32

    move-object/from16 v0, v28

    move/from16 v1, v27

    move/from16 v2, v29

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 754
    .local v28, "sourceRect":Landroid/graphics/Rect;
    move-object/from16 v0, v35

    iget-object v3, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move-object/from16 v1, v28

    invoke-virtual {v0, v3, v1, v7, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto/16 :goto_105
.end method

.method static getOrCreateIonDrawable(Landroid/widget/ImageView;)Lcom/koushikdutta/ion/IonDrawable;
    .registers 4
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 786
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 788
    .local v0, "current":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_a

    instance-of v2, v0, Lcom/koushikdutta/ion/IonDrawable;

    if-nez v2, :cond_18

    .line 789
    :cond_a
    new-instance v1, Lcom/koushikdutta/ion/IonDrawable;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/koushikdutta/ion/IonDrawable;-><init>(Landroid/content/res/Resources;)V

    .line 794
    .local v1, "ret":Lcom/koushikdutta/ion/IonDrawable;
    :goto_13
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 795
    return-object v1

    .end local v1    # "ret":Lcom/koushikdutta/ion/IonDrawable;
    :cond_18
    move-object v1, v0

    .line 791
    check-cast v1, Lcom/koushikdutta/ion/IonDrawable;

    .restart local v1    # "ret":Lcom/koushikdutta/ion/IonDrawable;
    goto :goto_13
.end method

.method private tryGetBitmapResource()Landroid/graphics/drawable/Drawable;
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 412
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_8

    .line 413
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapDrawable:Landroid/graphics/drawable/Drawable;

    .line 423
    :cond_7
    :goto_7
    return-object v0

    .line 414
    :cond_8
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-eqz v1, :cond_7

    .line 416
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v1, v1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    if-nez v1, :cond_7

    .line 418
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v1, v1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->decoder:Landroid/graphics/BitmapRegionDecoder;

    if-nez v1, :cond_7

    .line 420
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v1, v1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_7

    .line 422
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapDrawableFactory:Lcom/koushikdutta/ion/BitmapDrawableFactory;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable;->resources:Landroid/content/res/Resources;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    invoke-interface {v0, v1, v2}, Lcom/koushikdutta/ion/BitmapDrawableFactory;->fromBitmap(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapDrawable:Landroid/graphics/drawable/Drawable;

    .line 423
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_7
.end method

.method private tryGetErrorResource()Landroid/graphics/drawable/Drawable;
    .registers 3

    .prologue
    .line 403
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->error:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7

    .line 404
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->error:Landroid/graphics/drawable/Drawable;

    .line 408
    :goto_6
    return-object v0

    .line 405
    :cond_7
    iget v0, p0, Lcom/koushikdutta/ion/IonDrawable;->errorResource:I

    if-nez v0, :cond_d

    .line 406
    const/4 v0, 0x0

    goto :goto_6

    .line 407
    :cond_d
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->resources:Landroid/content/res/Resources;

    iget v1, p0, Lcom/koushikdutta/ion/IonDrawable;->errorResource:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->error:Landroid/graphics/drawable/Drawable;

    .line 408
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->error:Landroid/graphics/drawable/Drawable;

    goto :goto_6
.end method

.method private tryGetPlaceholderResource()Landroid/graphics/drawable/Drawable;
    .registers 3

    .prologue
    .line 427
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7

    .line 428
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    .line 432
    :goto_6
    return-object v0

    .line 429
    :cond_7
    iget v0, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholderResource:I

    if-nez v0, :cond_d

    .line 430
    const/4 v0, 0x0

    goto :goto_6

    .line 431
    :cond_d
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->resources:Landroid/content/res/Resources;

    iget v1, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholderResource:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    .line 432
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    goto :goto_6
.end method


# virtual methods
.method public cancel()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 276
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->callback:Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;

    invoke-virtual {v0, v1, v1}, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->register(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;)V

    .line 277
    iput-object v1, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    .line 278
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 495
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-nez v4, :cond_71

    .line 497
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 500
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    if-eqz v4, :cond_4f

    .line 501
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    iget v4, v4, Lcom/koushikdutta/ion/BitmapFetcher;->sampleWidth:I

    if-nez v4, :cond_50

    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    iget v4, v4, Lcom/koushikdutta/ion/BitmapFetcher;->sampleHeight:I

    if-nez v4, :cond_50

    .line 502
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v4

    if-eq v4, v6, :cond_27

    .line 503
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v5

    iput v5, v4, Lcom/koushikdutta/ion/BitmapFetcher;->sampleWidth:I

    .line 504
    :cond_27
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v4

    if-eq v4, v6, :cond_35

    .line 505
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v5

    iput v5, v4, Lcom/koushikdutta/ion/BitmapFetcher;->sampleHeight:I

    .line 508
    :cond_35
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/BitmapFetcher;->recomputeDecodeKey()V

    .line 509
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v4, v4, Lcom/koushikdutta/ion/Ion;->bitmapCache:Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    iget-object v5, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    iget-object v5, v5, Lcom/koushikdutta/ion/BitmapFetcher;->bitmapKey:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->get(Ljava/lang/String;)Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    move-result-object v2

    .line 510
    .local v2, "found":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-eqz v2, :cond_50

    .line 512
    iput-object v8, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    .line 515
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->callback:Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;

    invoke-virtual {v4, v8, v2}, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    .line 589
    .end local v2    # "found":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    :cond_4f
    :goto_4f
    return-void

    .line 521
    :cond_50
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->callback:Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;

    iget-object v5, p0, Lcom/koushikdutta/ion/IonDrawable;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v6, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    iget-object v6, v6, Lcom/koushikdutta/ion/BitmapFetcher;->bitmapKey:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->register(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;)V

    .line 525
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-static {v4}, Lcom/koushikdutta/ion/BitmapFetcher;->shouldDeferImageView(Lcom/koushikdutta/ion/Ion;)Z

    move-result v4

    if-eqz v4, :cond_6b

    .line 526
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/BitmapFetcher;->defer()Lcom/koushikdutta/ion/DeferredLoadBitmap;

    .line 531
    :goto_68
    iput-object v8, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    goto :goto_4f

    .line 528
    :cond_6b
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/BitmapFetcher;->execute()V

    goto :goto_68

    .line 538
    :cond_71
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v4, v4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->decoder:Landroid/graphics/BitmapRegionDecoder;

    if-eqz v4, :cond_7b

    .line 539
    invoke-direct {p0, p1}, Lcom/koushikdutta/ion/IonDrawable;->drawDeepZoom(Landroid/graphics/Canvas;)V

    goto :goto_4f

    .line 543
    :cond_7b
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-wide v4, v4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->drawTime:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_8d

    .line 544
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    iput-wide v5, v4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->drawTime:J

    .line 546
    :cond_8d
    iget v4, p0, Lcom/koushikdutta/ion/IonDrawable;->alpha:I

    int-to-long v0, v4

    .line 548
    .local v0, "destAlpha":J
    iget-boolean v4, p0, Lcom/koushikdutta/ion/IonDrawable;->fadeIn:Z

    if-eqz v4, :cond_ab

    .line 549
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-object v6, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-wide v6, v6, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->drawTime:J

    sub-long/2addr v4, v6

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    const-wide/16 v6, 0xc8

    div-long v0, v4, v6

    .line 550
    iget v4, p0, Lcom/koushikdutta/ion/IonDrawable;->alpha:I

    int-to-long v4, v4

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 554
    :cond_ab
    iget v4, p0, Lcom/koushikdutta/ion/IonDrawable;->alpha:I

    int-to-long v4, v4

    cmp-long v4, v0, v4

    if-nez v4, :cond_ec

    .line 555
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_be

    .line 556
    iput-object v8, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    .line 557
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/koushikdutta/ion/IonDrawable;->NULL_PLACEHOLDER:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v4, v5}, Lcom/koushikdutta/ion/IonDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 565
    :cond_be
    :goto_be
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v4, v4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    if-eqz v4, :cond_f4

    .line 566
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 568
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->gifDecoder:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->getCurrentFrame()Lcom/koushikdutta/ion/gif/GifFrame;

    move-result-object v3

    .line 569
    .local v3, "frame":Lcom/koushikdutta/ion/gif/GifFrame;
    if-eqz v3, :cond_4f

    .line 570
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    long-to-int v5, v0

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 571
    iget-object v4, v3, Lcom/koushikdutta/ion/gif/GifFrame;->image:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    iget-object v6, p0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v8, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 572
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/koushikdutta/ion/IonDrawable;->alpha:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 573
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable;->invalidateSelf()V

    goto/16 :goto_4f

    .line 561
    .end local v3    # "frame":Lcom/koushikdutta/ion/gif/GifFrame;
    :cond_ec
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_be

    .line 562
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable;->invalidateSelf()V

    goto :goto_be

    .line 578
    :cond_f4
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v4, v4, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_109

    .line 579
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_104

    .line 580
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapDrawable:Landroid/graphics/drawable/Drawable;

    long-to-int v5, v0

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 586
    :cond_104
    :goto_104
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_4f

    .line 582
    :cond_109
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->error:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_104

    .line 583
    iget-object v4, p0, Lcom/koushikdutta/ion/IonDrawable;->error:Landroid/graphics/drawable/Drawable;

    long-to-int v5, v0

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_104
.end method

.method public getBitmapInfo()Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    return-object v0
.end method

.method public getCurrentDrawable()Landroid/graphics/drawable/Drawable;
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 80
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-nez v2, :cond_12

    .line 81
    iget v2, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholderResource:I

    if-eqz v2, :cond_12

    .line 82
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable;->resources:Landroid/content/res/Resources;

    iget v2, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholderResource:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 98
    :cond_11
    :goto_11
    return-object v1

    .line 84
    :cond_12
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-eqz v2, :cond_4f

    .line 85
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_28

    .line 86
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->resources:Landroid/content/res/Resources;

    iget-object v3, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v3, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    goto :goto_11

    .line 87
    :cond_28
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    if-eqz v2, :cond_4f

    .line 88
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-virtual {v2}, Lcom/koushikdutta/ion/gif/GifDecoder;->getLastFrame()Lcom/koushikdutta/ion/gif/GifFrame;

    move-result-object v0

    .line 89
    .local v0, "last":Lcom/koushikdutta/ion/gif/GifFrame;
    if-eqz v0, :cond_42

    .line 90
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->resources:Landroid/content/res/Resources;

    iget-object v3, v0, Lcom/koushikdutta/ion/gif/GifFrame;->image:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    goto :goto_11

    .line 91
    :cond_42
    iget v2, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholderResource:I

    if-eqz v2, :cond_11

    .line 92
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable;->resources:Landroid/content/res/Resources;

    iget v2, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholderResource:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_11

    .line 96
    .end local v0    # "last":Lcom/koushikdutta/ion/gif/GifFrame;
    :cond_4f
    iget v2, p0, Lcom/koushikdutta/ion/IonDrawable;->errorResource:I

    if-eqz v2, :cond_11

    .line 97
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable;->resources:Landroid/content/res/Resources;

    iget v2, p0, Lcom/koushikdutta/ion/IonDrawable;->errorResource:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_11
.end method

.method public getIntrinsicHeight()I
    .registers 5

    .prologue
    .line 472
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-eqz v2, :cond_28

    .line 473
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->decoder:Landroid/graphics/BitmapRegionDecoder;

    if-eqz v2, :cond_11

    .line 474
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->originalSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 490
    :goto_10
    return v2

    .line 475
    :cond_11
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_28

    .line 476
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/koushikdutta/ion/IonDrawable;->resources:Landroid/content/res/Resources;

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-virtual {v2, v3}, Landroid/graphics/Bitmap;->getScaledHeight(I)I

    move-result v2

    goto :goto_10

    .line 478
    :cond_28
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->gifDecoder:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    if-eqz v2, :cond_35

    .line 479
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->gifDecoder:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-virtual {v2}, Lcom/koushikdutta/ion/gif/GifDecoder;->getHeight()I

    move-result v2

    goto :goto_10

    .line 480
    :cond_35
    iget v2, p0, Lcom/koushikdutta/ion/IonDrawable;->resizeHeight:I

    if-lez v2, :cond_3c

    .line 481
    iget v2, p0, Lcom/koushikdutta/ion/IonDrawable;->resizeHeight:I

    goto :goto_10

    .line 482
    :cond_3c
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-eqz v2, :cond_4b

    .line 483
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonDrawable;->tryGetErrorResource()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 484
    .local v0, "error":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_4b

    .line 485
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    goto :goto_10

    .line 487
    .end local v0    # "error":Landroid/graphics/drawable/Drawable;
    :cond_4b
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonDrawable;->tryGetPlaceholderResource()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 488
    .local v1, "placeholder":Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_56

    .line 489
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    goto :goto_10

    .line 490
    :cond_56
    const/4 v2, -0x1

    goto :goto_10
.end method

.method public getIntrinsicWidth()I
    .registers 5

    .prologue
    .line 445
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-eqz v2, :cond_28

    .line 446
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->decoder:Landroid/graphics/BitmapRegionDecoder;

    if-eqz v2, :cond_11

    .line 447
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->originalSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    .line 467
    :goto_10
    return v2

    .line 448
    :cond_11
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_28

    .line 449
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v2, v2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/koushikdutta/ion/IonDrawable;->resources:Landroid/content/res/Resources;

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-virtual {v2, v3}, Landroid/graphics/Bitmap;->getScaledWidth(I)I

    move-result v2

    goto :goto_10

    .line 451
    :cond_28
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->gifDecoder:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    if-eqz v2, :cond_35

    .line 452
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->gifDecoder:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-virtual {v2}, Lcom/koushikdutta/ion/gif/GifDecoder;->getWidth()I

    move-result v2

    goto :goto_10

    .line 454
    :cond_35
    iget v2, p0, Lcom/koushikdutta/ion/IonDrawable;->resizeWidth:I

    if-lez v2, :cond_3c

    .line 455
    iget v2, p0, Lcom/koushikdutta/ion/IonDrawable;->resizeWidth:I

    goto :goto_10

    .line 457
    :cond_3c
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-eqz v2, :cond_4b

    .line 458
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonDrawable;->tryGetErrorResource()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 459
    .local v0, "error":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_4b

    .line 460
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    goto :goto_10

    .line 463
    .end local v0    # "error":Landroid/graphics/drawable/Drawable;
    :cond_4b
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonDrawable;->tryGetPlaceholderResource()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 464
    .local v1, "placeholder":Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_56

    .line 465
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    goto :goto_10

    .line 467
    :cond_56
    const/4 v2, -0x1

    goto :goto_10
.end method

.method public getLoadCallback()Lcom/koushikdutta/async/future/FutureCallback;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/async/future/FutureCallback",
            "<",
            "Lcom/koushikdutta/ion/IonDrawable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->loadCallback:Lcom/koushikdutta/async/future/FutureCallback;

    return-object v0
.end method

.method public getOpacity()I
    .registers 3

    .prologue
    .line 781
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v0, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v0, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result v0

    if-nez v0, :cond_1e

    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    const/16 v1, 0xff

    if-ge v0, v1, :cond_20

    :cond_1e
    const/4 v0, -0x3

    .line 782
    :goto_1f
    return v0

    :cond_20
    invoke-super {p0}, Landroid/graphics/drawable/LayerDrawable;->getOpacity()I

    move-result v0

    goto :goto_1f
.end method

.method public ion(Lcom/koushikdutta/ion/Ion;)Lcom/koushikdutta/ion/IonDrawable;
    .registers 4
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;

    .prologue
    .line 73
    if-nez p1, :cond_a

    .line 74
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "null ion"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 75
    :cond_a
    iput-object p1, p0, Lcom/koushikdutta/ion/IonDrawable;->ion:Lcom/koushikdutta/ion/Ion;

    .line 76
    return-object p0
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 768
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->setAlpha(I)V

    .line 769
    iput p1, p0, Lcom/koushikdutta/ion/IonDrawable;->alpha:I

    .line 770
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 771
    return-void
.end method

.method public setBitmap(Lcom/koushikdutta/ion/bitmap/BitmapInfo;Lcom/koushikdutta/ion/ResponseServedFrom;)Lcom/koushikdutta/ion/IonDrawable;
    .registers 13
    .param p1, "info"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    .param p2, "servedFrom"    # Lcom/koushikdutta/ion/ResponseServedFrom;

    .prologue
    const/4 v7, 0x0

    const-wide/high16 v8, 0x4070000000000000L    # 256.0

    .line 335
    iget-object v6, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-ne v6, p1, :cond_8

    .line 367
    :cond_7
    :goto_7
    return-object p0

    .line 338
    :cond_8
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable;->cancel()V

    .line 339
    iput-object p2, p0, Lcom/koushikdutta/ion/IonDrawable;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 340
    iput-object p1, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 341
    iput-object v7, p0, Lcom/koushikdutta/ion/IonDrawable;->gifDecoder:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    .line 342
    iput-object v7, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapDrawable:Landroid/graphics/drawable/Drawable;

    .line 343
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable;->invalidateSelf()V

    .line 344
    if-eqz p1, :cond_7

    .line 347
    iget-object v6, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->decoder:Landroid/graphics/BitmapRegionDecoder;

    if-eqz v6, :cond_45

    .line 349
    iget-object v6, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->originalSize:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->x:I

    int-to-double v6, v6

    div-double v4, v6, v8

    .line 350
    .local v4, "wlevel":D
    iget-object v6, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->originalSize:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->y:I

    int-to-double v6, v6

    div-double v0, v6, v8

    .line 354
    .local v0, "hlevel":D
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    .line 355
    .local v2, "level":D
    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v6

    sget-wide v8, Lcom/koushikdutta/ion/IonDrawable;->LOG_2:D

    div-double v2, v6, v8

    .line 357
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    iput v6, p0, Lcom/koushikdutta/ion/IonDrawable;->maxLevel:I

    .line 361
    const/16 v6, 0x100

    iget v7, p0, Lcom/koushikdutta/ion/IonDrawable;->maxLevel:I

    shl-int/2addr v6, v7

    iput v6, p0, Lcom/koushikdutta/ion/IonDrawable;->textureDim:I

    goto :goto_7

    .line 363
    .end local v0    # "hlevel":D
    .end local v2    # "level":D
    .end local v4    # "wlevel":D
    :cond_45
    iget-object v6, p1, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    if-eqz v6, :cond_7

    .line 364
    new-instance v6, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    invoke-direct {v6, p0, p1}, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;-><init>(Lcom/koushikdutta/ion/IonDrawable;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    iput-object v6, p0, Lcom/koushikdutta/ion/IonDrawable;->gifDecoder:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    goto :goto_7
.end method

.method public setBitmapDrawableFactory(Lcom/koushikdutta/ion/BitmapDrawableFactory;)Lcom/koushikdutta/ion/IonDrawable;
    .registers 2
    .param p1, "factory"    # Lcom/koushikdutta/ion/BitmapDrawableFactory;

    .prologue
    .line 271
    iput-object p1, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapDrawableFactory:Lcom/koushikdutta/ion/BitmapDrawableFactory;

    .line 272
    return-object p0
.end method

.method public setBitmapFetcher(Lcom/koushikdutta/ion/BitmapFetcher;)Lcom/koushikdutta/ion/IonDrawable;
    .registers 4
    .param p1, "bitmapFetcher"    # Lcom/koushikdutta/ion/BitmapFetcher;

    .prologue
    .line 264
    iput-object p1, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapFetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    .line 265
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->ion:Lcom/koushikdutta/ion/Ion;

    if-nez v0, :cond_e

    .line 266
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "null ion"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 267
    :cond_e
    return-object p0
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 775
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 776
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 777
    return-void
.end method

.method public setError(ILandroid/graphics/drawable/Drawable;)Lcom/koushikdutta/ion/IonDrawable;
    .registers 4
    .param p1, "resource"    # I
    .param p2, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 385
    if-eqz p2, :cond_6

    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->error:Landroid/graphics/drawable/Drawable;

    if-eq p2, v0, :cond_c

    :cond_6
    if-eqz p1, :cond_d

    iget v0, p0, Lcom/koushikdutta/ion/IonDrawable;->errorResource:I

    if-ne p1, v0, :cond_d

    .line 390
    :cond_c
    :goto_c
    return-object p0

    .line 388
    :cond_d
    iput p1, p0, Lcom/koushikdutta/ion/IonDrawable;->errorResource:I

    .line 389
    iput-object p2, p0, Lcom/koushikdutta/ion/IonDrawable;->error:Landroid/graphics/drawable/Drawable;

    goto :goto_c
.end method

.method public setFadeIn(Z)Lcom/koushikdutta/ion/IonDrawable;
    .registers 2
    .param p1, "fadeIn"    # Z

    .prologue
    .line 259
    iput-boolean p1, p0, Lcom/koushikdutta/ion/IonDrawable;->fadeIn:Z

    .line 260
    return-object p0
.end method

.method public setLoadCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/ion/IonDrawable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/future/FutureCallback",
            "<",
            "Lcom/koushikdutta/ion/IonDrawable;",
            ">;)",
            "Lcom/koushikdutta/ion/IonDrawable;"
        }
    .end annotation

    .prologue
    .line 68
    .local p1, "loadCallback":Lcom/koushikdutta/async/future/FutureCallback;, "Lcom/koushikdutta/async/future/FutureCallback<Lcom/koushikdutta/ion/IonDrawable;>;"
    iput-object p1, p0, Lcom/koushikdutta/ion/IonDrawable;->loadCallback:Lcom/koushikdutta/async/future/FutureCallback;

    .line 69
    return-object p0
.end method

.method public setPlaceholder(ILandroid/graphics/drawable/Drawable;)Lcom/koushikdutta/ion/IonDrawable;
    .registers 4
    .param p1, "resource"    # I
    .param p2, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 394
    if-eqz p2, :cond_6

    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    if-eq p2, v0, :cond_c

    :cond_6
    if-eqz p1, :cond_d

    iget v0, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholderResource:I

    if-ne p1, v0, :cond_d

    .line 399
    :cond_c
    :goto_c
    return-object p0

    .line 397
    :cond_d
    iput p1, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholderResource:I

    .line 398
    iput-object p2, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    goto :goto_c
.end method

.method public setRepeatAnimation(Z)Lcom/koushikdutta/ion/IonDrawable;
    .registers 2
    .param p1, "repeatAnimation"    # Z

    .prologue
    .line 371
    iput-boolean p1, p0, Lcom/koushikdutta/ion/IonDrawable;->repeatAnimation:Z

    .line 372
    return-object p0
.end method

.method public setSize(II)Lcom/koushikdutta/ion/IonDrawable;
    .registers 4
    .param p1, "resizeWidth"    # I
    .param p2, "resizeHeight"    # I

    .prologue
    .line 376
    iget v0, p0, Lcom/koushikdutta/ion/IonDrawable;->resizeWidth:I

    if-ne v0, p1, :cond_9

    iget v0, p0, Lcom/koushikdutta/ion/IonDrawable;->resizeHeight:I

    if-ne v0, p2, :cond_9

    .line 381
    :goto_8
    return-object p0

    .line 378
    :cond_9
    iput p1, p0, Lcom/koushikdutta/ion/IonDrawable;->resizeWidth:I

    .line 379
    iput p2, p0, Lcom/koushikdutta/ion/IonDrawable;->resizeHeight:I

    .line 380
    invoke-virtual {p0}, Lcom/koushikdutta/ion/IonDrawable;->invalidateSelf()V

    goto :goto_8
.end method

.method public updateLayers()Lcom/koushikdutta/ion/IonDrawable;
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 298
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonDrawable;->tryGetPlaceholderResource()Landroid/graphics/drawable/Drawable;

    .line 299
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_1e

    .line 300
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->NULL_PLACEHOLDER:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v3, v0}, Lcom/koushikdutta/ion/IonDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 304
    :goto_f
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    if-nez v0, :cond_24

    .line 305
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->NULL_BITMAPINFO:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1, v0}, Lcom/koushikdutta/ion/IonDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 306
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->NULL_ERROR:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v2, v0}, Lcom/koushikdutta/ion/IonDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 331
    :goto_1d
    return-object p0

    .line 302
    :cond_1e
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v3, v0}, Lcom/koushikdutta/ion/IonDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    goto :goto_f

    .line 311
    :cond_24
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v0, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->bitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_4e

    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v0, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->decoder:Landroid/graphics/BitmapRegionDecoder;

    if-nez v0, :cond_4e

    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v0, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    if-nez v0, :cond_4e

    .line 312
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->NULL_BITMAPINFO:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1, v0}, Lcom/koushikdutta/ion/IonDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 313
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonDrawable;->tryGetErrorResource()Landroid/graphics/drawable/Drawable;

    .line 314
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->error:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_48

    .line 315
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->NULL_ERROR:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v2, v0}, Lcom/koushikdutta/ion/IonDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    goto :goto_1d

    .line 317
    :cond_48
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->error:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v2, v0}, Lcom/koushikdutta/ion/IonDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    goto :goto_1d

    .line 321
    :cond_4e
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v0, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->decoder:Landroid/graphics/BitmapRegionDecoder;

    if-nez v0, :cond_68

    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iget-object v0, v0, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    if-nez v0, :cond_68

    .line 323
    invoke-direct {p0}, Lcom/koushikdutta/ion/IonDrawable;->tryGetBitmapResource()Landroid/graphics/drawable/Drawable;

    .line 324
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->bitmapDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1, v0}, Lcom/koushikdutta/ion/IonDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    .line 330
    :goto_62
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->NULL_ERROR:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v2, v0}, Lcom/koushikdutta/ion/IonDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    goto :goto_1d

    .line 328
    :cond_68
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable;->NULL_BITMAPINFO:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v1, v0}, Lcom/koushikdutta/ion/IonDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    goto :goto_62
.end method
