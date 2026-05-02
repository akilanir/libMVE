.class public abstract Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;
.super Lorg/osmdroid/views/overlay/Overlay;
.source "NonAcceleratedOverlay.java"


# instance fields
.field private mBackingBitmap:Landroid/graphics/Bitmap;

.field private mBackingCanvas:Landroid/graphics/Canvas;

.field private final mBackingMatrix:Landroid/graphics/Matrix;

.field private final mCanvasIdentityMatrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lorg/osmdroid/views/overlay/Overlay;-><init>(Landroid/content/Context;)V

    .line 35
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingMatrix:Landroid/graphics/Matrix;

    .line 36
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mCanvasIdentityMatrix:Landroid/graphics/Matrix;

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/ResourceProxy;)V
    .registers 3
    .param p1, "pResourceProxy"    # Lorg/osmdroid/ResourceProxy;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lorg/osmdroid/views/overlay/Overlay;-><init>(Lorg/osmdroid/ResourceProxy;)V

    .line 35
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingMatrix:Landroid/graphics/Matrix;

    .line 36
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mCanvasIdentityMatrix:Landroid/graphics/Matrix;

    .line 49
    return-void
.end method


# virtual methods
.method protected final draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V
    .registers 12
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "osmv"    # Lorg/osmdroid/views/MapView;
    .param p3, "shadow"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 75
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v3, v4, :cond_1b

    const/4 v0, 0x1

    .line 76
    .local v0, "atLeastHoneycomb":Z
    :goto_a
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->isUsingBackingBitmap()Z

    move-result v3

    if-eqz v3, :cond_a4

    if-eqz v0, :cond_a4

    invoke-virtual {p1}, Landroid/graphics/Canvas;->isHardwareAccelerated()Z

    move-result v3

    if-eqz v3, :cond_a4

    .line 80
    if-eqz p3, :cond_1d

    .line 115
    :cond_1a
    :goto_1a
    return-void

    .end local v0    # "atLeastHoneycomb":Z
    :cond_1b
    move v0, v2

    .line 75
    goto :goto_a

    .line 84
    .restart local v0    # "atLeastHoneycomb":Z
    :cond_1d
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    if-eqz v3, :cond_1a

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    if-eqz v3, :cond_1a

    .line 87
    iget-object v3, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingBitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_45

    iget-object v3, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v4

    if-ne v3, v4, :cond_45

    iget-object v3, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v4

    if-eq v3, v4, :cond_62

    .line 89
    :cond_45
    iput-object v6, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingBitmap:Landroid/graphics/Bitmap;

    .line 90
    iput-object v6, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingCanvas:Landroid/graphics/Canvas;

    .line 92
    :try_start_49
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v4

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingBitmap:Landroid/graphics/Bitmap;
    :try_end_59
    .catch Ljava/lang/OutOfMemoryError; {:try_start_49 .. :try_end_59} :catch_97

    .line 100
    new-instance v3, Landroid/graphics/Canvas;

    iget-object v4, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v3, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v3, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingCanvas:Landroid/graphics/Canvas;

    .line 103
    :cond_62
    iget-object v3, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingCanvas:Landroid/graphics/Canvas;

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v3, v2, v4}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 104
    iget-object v2, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->getMatrix(Landroid/graphics/Matrix;)V

    .line 105
    iget-object v2, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingCanvas:Landroid/graphics/Canvas;

    iget-object v3, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v3}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    .line 106
    iget-object v2, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingCanvas:Landroid/graphics/Canvas;

    invoke-virtual {p0, v2, p1, p2, p3}, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->onDraw(Landroid/graphics/Canvas;Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V

    .line 107
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 108
    iget-object v2, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mCanvasIdentityMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->getMatrix(Landroid/graphics/Matrix;)V

    .line 109
    iget-object v2, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mCanvasIdentityMatrix:Landroid/graphics/Matrix;

    iget-object v3, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mCanvasIdentityMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 110
    iget-object v2, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mCanvasIdentityMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 111
    iget-object v2, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v2, v7, v7, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 112
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_1a

    .line 94
    :catch_97
    move-exception v1

    .line 95
    .local v1, "e":Ljava/lang/OutOfMemoryError;
    const-string v2, "OsmDroid"

    const-string v3, "OutOfMemoryError creating backing bitmap in NonAcceleratedOverlay."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    invoke-static {}, Ljava/lang/System;->gc()V

    goto/16 :goto_1a

    .line 114
    .end local v1    # "e":Ljava/lang/OutOfMemoryError;
    :cond_a4
    invoke-virtual {p0, p1, p1, p2, p3}, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->onDraw(Landroid/graphics/Canvas;Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V

    goto/16 :goto_1a
.end method

.method public isUsingBackingBitmap()Z
    .registers 2

    .prologue
    .line 62
    const/4 v0, 0x1

    return v0
.end method

.method public onDetach(Lorg/osmdroid/views/MapView;)V
    .registers 3
    .param p1, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/4 v0, 0x0

    .line 67
    iput-object v0, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingBitmap:Landroid/graphics/Bitmap;

    .line 68
    iput-object v0, p0, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->mBackingCanvas:Landroid/graphics/Canvas;

    .line 69
    invoke-super {p0, p1}, Lorg/osmdroid/views/overlay/Overlay;->onDetach(Lorg/osmdroid/views/MapView;)V

    .line 70
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V
    .registers 5
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "acceleratedCanvas"    # Landroid/graphics/Canvas;
    .param p3, "osmv"    # Lorg/osmdroid/views/MapView;
    .param p4, "shadow"    # Z

    .prologue
    .line 55
    invoke-virtual {p0, p1, p3, p4}, Lorg/osmdroid/views/overlay/NonAcceleratedOverlay;->onDraw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V

    .line 56
    return-void
.end method

.method protected abstract onDraw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V
.end method
