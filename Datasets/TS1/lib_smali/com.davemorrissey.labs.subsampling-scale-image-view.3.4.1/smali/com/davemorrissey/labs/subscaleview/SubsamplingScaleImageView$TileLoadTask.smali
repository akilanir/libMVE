.class Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;
.super Landroid/os/AsyncTask;
.source "SubsamplingScaleImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TileLoadTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private final decoderRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;",
            ">;"
        }
    .end annotation
.end field

.field private exception:Ljava/lang/Exception;

.field private final tileRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;",
            ">;"
        }
    .end annotation
.end field

.field private final viewRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)V
    .registers 5
    .param p1, "view"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p2, "decoder"    # Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;
    .param p3, "tile"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .prologue
    .line 1465
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 1466
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->viewRef:Ljava/lang/ref/WeakReference;

    .line 1467
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->decoderRef:Ljava/lang/ref/WeakReference;

    .line 1468
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->tileRef:Ljava/lang/ref/WeakReference;

    .line 1469
    const/4 v0, 0x1

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static {p3, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3602(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 1470
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .registers 10
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 1475
    :try_start_0
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->viewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 1476
    .local v3, "view":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->decoderRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    .line 1477
    .local v0, "decoder":Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->tileRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 1478
    .local v2, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    if-eqz v0, :cond_72

    if-eqz v2, :cond_72

    if-eqz v3, :cond_72

    invoke-interface {v0}, Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;->isReady()Z

    move-result v4

    if-eqz v4, :cond_72

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v4

    if-eqz v4, :cond_72

    .line 1479
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoderLock:Ljava/lang/Object;
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$5200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_64

    .line 1481
    :try_start_2f
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v4

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->fileSRect:Landroid/graphics/Rect;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v6

    # invokes: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fileSRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    invoke-static {v3, v4, v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$5300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 1482
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$4800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/Rect;

    move-result-object v4

    if-eqz v4, :cond_53

    .line 1483
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->fileSRect:Landroid/graphics/Rect;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v4

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$4800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/Rect;

    move-result-object v6

    iget v6, v6, Landroid/graphics/Rect;->left:I

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$4800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/Rect;

    move-result-object v7

    iget v7, v7, Landroid/graphics/Rect;->top:I

    invoke-virtual {v4, v6, v7}, Landroid/graphics/Rect;->offset(II)V

    .line 1485
    :cond_53
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->fileSRect:Landroid/graphics/Rect;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v4

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    invoke-interface {v0, v4, v6}, Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;->decodeRegion(Landroid/graphics/Rect;I)Landroid/graphics/Bitmap;

    move-result-object v4

    monitor-exit v5

    .line 1494
    .end local v0    # "decoder":Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;
    .end local v2    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .end local v3    # "view":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    :goto_60
    return-object v4

    .line 1486
    .restart local v0    # "decoder":Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;
    .restart local v2    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .restart local v3    # "view":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    :catchall_61
    move-exception v4

    monitor-exit v5
    :try_end_63
    .catchall {:try_start_2f .. :try_end_63} :catchall_61

    :try_start_63
    throw v4
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_64} :catch_64

    .line 1490
    .end local v0    # "decoder":Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;
    .end local v2    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .end local v3    # "view":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    :catch_64
    move-exception v1

    .line 1491
    .local v1, "e":Ljava/lang/Exception;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$4900()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Failed to decode tile"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1492
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->exception:Ljava/lang/Exception;

    .line 1494
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_70
    :goto_70
    const/4 v4, 0x0

    goto :goto_60

    .line 1487
    .restart local v0    # "decoder":Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;
    .restart local v2    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .restart local v3    # "view":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    :cond_72
    if-eqz v2, :cond_70

    .line 1488
    const/4 v4, 0x0

    :try_start_75
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static {v2, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3602(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_75 .. :try_end_78} :catch_64

    goto :goto_70
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 1459
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 1499
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->viewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .line 1500
    .local v0, "subsamplingScaleImageView":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->tileRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 1501
    .local v1, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    if-eqz v0, :cond_20

    if-eqz v1, :cond_20

    .line 1502
    if-eqz p1, :cond_21

    .line 1503
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v1, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 1504
    const/4 v2, 0x0

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static {v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3602(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 1505
    # invokes: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onTileLoaded()V
    invoke-static {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$5400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)V

    .line 1510
    :cond_20
    :goto_20
    return-void

    .line 1506
    :cond_21
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->exception:Ljava/lang/Exception;

    if-eqz v2, :cond_20

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;
    invoke-static {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$5100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    move-result-object v2

    if-eqz v2, :cond_20

    .line 1507
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;
    invoke-static {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$5100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    move-result-object v2

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->exception:Ljava/lang/Exception;

    invoke-interface {v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;->onTileLoadError(Ljava/lang/Exception;)V

    goto :goto_20
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 1459
    check-cast p1, Landroid/graphics/Bitmap;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
