.class Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;
.super Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;
.source "MapTileProviderBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/tileprovider/MapTileProviderBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ZoomOutTileLooper"
.end annotation


# static fields
.field private static final MAX_ZOOM_OUT_DIFF:I = 0x4


# instance fields
.field final synthetic this$0:Lorg/osmdroid/tileprovider/MapTileProviderBase;


# direct methods
.method public constructor <init>(Lorg/osmdroid/tileprovider/MapTileProviderBase;I)V
    .registers 3
    .param p2, "pOldZoomLevel"    # I

    .prologue
    .line 373
    iput-object p1, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->this$0:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    .line 374
    invoke-direct {p0, p1, p2}, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;-><init>(Lorg/osmdroid/tileprovider/MapTileProviderBase;I)V

    .line 375
    return-void
.end method


# virtual methods
.method protected handleTile(ILorg/osmdroid/tileprovider/MapTile;II)V
    .registers 23
    .param p1, "pTileSizePx"    # I
    .param p2, "pTile"    # Lorg/osmdroid/tileprovider/MapTile;
    .param p3, "pX"    # I
    .param p4, "pY"    # I

    .prologue
    .line 379
    move-object/from16 v0, p0

    iget v12, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mDiff:I

    const/4 v13, 0x4

    if-lt v12, v13, :cond_8

    .line 426
    :cond_7
    :goto_7
    return-void

    .line 384
    :cond_8
    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getX()I

    move-result v12

    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mDiff:I

    shl-int v9, v12, v13

    .line 385
    .local v9, "xx":I
    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getY()I

    move-result v12

    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mDiff:I

    shl-int v11, v12, v13

    .line 386
    .local v11, "yy":I
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mDiff:I

    shl-int v4, v12, v13

    .line 387
    .local v4, "numTiles":I
    const/4 v2, 0x0

    .line 388
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    const/4 v3, 0x0

    .line 389
    .local v3, "canvas":Landroid/graphics/Canvas;
    const/4 v8, 0x0

    .local v8, "x":I
    :goto_26
    if-ge v8, v4, :cond_b6

    .line 390
    const/4 v10, 0x0

    .local v10, "y":I
    :goto_29
    if-ge v10, v4, :cond_b2

    .line 391
    new-instance v7, Lorg/osmdroid/tileprovider/MapTile;

    move-object/from16 v0, p0

    iget v12, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mOldZoomLevel:I

    add-int v13, v9, v8

    add-int v14, v11, v10

    invoke-direct {v7, v12, v13, v14}, Lorg/osmdroid/tileprovider/MapTile;-><init>(III)V

    .line 392
    .local v7, "oldTile":Lorg/osmdroid/tileprovider/MapTile;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->this$0:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    iget-object v12, v12, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileCache:Lorg/osmdroid/tileprovider/MapTileCache;

    invoke-virtual {v12, v7}, Lorg/osmdroid/tileprovider/MapTileCache;->getMapTile(Lorg/osmdroid/tileprovider/MapTile;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 393
    .local v6, "oldDrawable":Landroid/graphics/drawable/Drawable;
    instance-of v12, v6, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v12, :cond_ae

    .line 394
    check-cast v6, Landroid/graphics/drawable/BitmapDrawable;

    .end local v6    # "oldDrawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v6}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    .line 395
    .local v5, "oldBitmap":Landroid/graphics/Bitmap;
    if-eqz v5, :cond_ae

    .line 396
    if-nez v2, :cond_73

    .line 398
    invoke-static {}, Lorg/osmdroid/tileprovider/BitmapPool;->getInstance()Lorg/osmdroid/tileprovider/BitmapPool;

    move-result-object v12

    move/from16 v0, p1

    move/from16 v1, p1

    invoke-virtual {v12, v0, v1}, Lorg/osmdroid/tileprovider/BitmapPool;->obtainSizedBitmapFromPool(II)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 400
    if-nez v2, :cond_68

    .line 401
    sget-object v12, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, p1

    move/from16 v1, p1

    invoke-static {v0, v1, v12}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 403
    :cond_68
    new-instance v3, Landroid/graphics/Canvas;

    .end local v3    # "canvas":Landroid/graphics/Canvas;
    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 404
    .restart local v3    # "canvas":Landroid/graphics/Canvas;
    const v12, -0x333334

    invoke-virtual {v3, v12}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 406
    :cond_73
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mDestRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mTileSize_2:I

    mul-int/2addr v13, v8

    move-object/from16 v0, p0

    iget v14, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mTileSize_2:I

    mul-int/2addr v14, v10

    add-int/lit8 v15, v8, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mTileSize_2:I

    move/from16 v16, v0

    mul-int v15, v15, v16

    add-int/lit8 v16, v10, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mTileSize_2:I

    move/from16 v17, v0

    mul-int v16, v16, v17

    invoke-virtual/range {v12 .. v16}, Landroid/graphics/Rect;->set(IIII)V

    .line 409
    if-eqz v5, :cond_ae

    .line 410
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mDestRect:Landroid/graphics/Rect;

    const/4 v14, 0x0

    invoke-virtual {v3, v5, v12, v13, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 411
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->this$0:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    iget-object v12, v12, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileCache:Lorg/osmdroid/tileprovider/MapTileCache;

    iget-object v12, v12, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTiles:Lorg/osmdroid/tileprovider/LRUMapTileCache;

    invoke-virtual {v12, v5}, Lorg/osmdroid/tileprovider/LRUMapTileCache;->remove(Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;

    .line 390
    .end local v5    # "oldBitmap":Landroid/graphics/Bitmap;
    :cond_ae
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_29

    .line 389
    .end local v7    # "oldTile":Lorg/osmdroid/tileprovider/MapTile;
    :cond_b2
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_26

    .line 418
    .end local v10    # "y":I
    :cond_b6
    if-eqz v2, :cond_7

    .line 419
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mNewTiles:Ljava/util/HashMap;

    move-object/from16 v0, p2

    invoke-virtual {v12, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 420
    sget-boolean v12, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v12, :cond_7

    .line 421
    const-string v12, "OsmDroid"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Created scaled tile: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 422
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mDebugPaint:Landroid/graphics/Paint;

    const/high16 v13, 0x42200000    # 40.0f

    invoke-virtual {v12, v13}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 423
    const-string v12, "scaled"

    const/high16 v13, 0x42480000    # 50.0f

    const/high16 v14, 0x42480000    # 50.0f

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;->mDebugPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v12, v13, v14, v15}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_7
.end method
