.class public abstract Lorg/osmdroid/views/overlay/ItemizedOverlay;
.super Lorg/osmdroid/views/overlay/Overlay;
.source "ItemizedOverlay.java"

# interfaces
.implements Lorg/osmdroid/views/overlay/Overlay$Snappable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/osmdroid/views/overlay/ItemizedOverlay$1;,
        Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item:",
        "Lorg/osmdroid/views/overlay/OverlayItem;",
        ">",
        "Lorg/osmdroid/views/overlay/Overlay;",
        "Lorg/osmdroid/views/overlay/Overlay$Snappable;"
    }
.end annotation


# instance fields
.field private final mCurScreenCoords:Landroid/graphics/Point;

.field protected final mDefaultMarker:Landroid/graphics/drawable/Drawable;

.field protected mDrawFocusedItem:Z

.field private mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TItem;"
        }
    .end annotation
.end field

.field private final mInternalItemList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<TItem;>;"
        }
    .end annotation
.end field

.field private final mMatrix:Landroid/graphics/Matrix;

.field private final mMatrixValues:[F

.field private mOnFocusChangeListener:Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;

.field private mPendingFocusChangedEvent:Z

.field private final mRect:Landroid/graphics/Rect;

.field protected scaleX:F

.field protected scaleY:F


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Lorg/osmdroid/ResourceProxy;)V
    .registers 5
    .param p1, "pDefaultMarker"    # Landroid/graphics/drawable/Drawable;
    .param p2, "pResourceProxy"    # Lorg/osmdroid/ResourceProxy;

    .prologue
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    const/high16 v1, 0x3f800000    # 1.0f

    .line 75
    invoke-direct {p0, p2}, Lorg/osmdroid/views/overlay/Overlay;-><init>(Lorg/osmdroid/ResourceProxy;)V

    .line 43
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    .line 44
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDrawFocusedItem:Z

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mPendingFocusChangedEvent:Z

    .line 49
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrixValues:[F

    .line 50
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrix:Landroid/graphics/Matrix;

    .line 51
    iput v1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->scaleX:F

    .line 52
    iput v1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->scaleY:F

    .line 77
    if-nez p1, :cond_34

    .line 78
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You must pass a default marker to ItemizedOverlay."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_34
    iput-object p1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDefaultMarker:Landroid/graphics/drawable/Drawable;

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    .line 84
    return-void
.end method


# virtual methods
.method protected declared-synchronized boundToHotspot(Landroid/graphics/drawable/Drawable;Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;)Landroid/graphics/drawable/Drawable;
    .registers 10
    .param p1, "marker"    # Landroid/graphics/drawable/Drawable;
    .param p2, "hotspot"    # Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;

    .prologue
    .line 337
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    monitor-enter p0

    :try_start_1
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 338
    .local v1, "markerWidth":I
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 340
    .local v0, "markerHeight":I
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    const/4 v3, 0x0

    const/4 v4, 0x0

    add-int/lit8 v5, v1, 0x0

    add-int/lit8 v6, v0, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 342
    if-nez p2, :cond_18

    .line 343
    sget-object p2, Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;->BOTTOM_CENTER:Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;

    .line 346
    :cond_18
    sget-object v2, Lorg/osmdroid/views/overlay/ItemizedOverlay$1;->$SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace:[I

    invoke-virtual {p2}, Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_82

    .line 378
    :goto_23
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V
    :try_end_28
    .catchall {:try_start_1 .. :try_end_28} :catchall_36

    .line 379
    monitor-exit p0

    return-object p1

    .line 351
    :pswitch_2a
    :try_start_2a
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    neg-int v3, v1

    div-int/lit8 v3, v3, 0x2

    neg-int v4, v0

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V
    :try_end_35
    .catchall {:try_start_2a .. :try_end_35} :catchall_36

    goto :goto_23

    .line 337
    .end local v0    # "markerHeight":I
    .end local v1    # "markerWidth":I
    :catchall_36
    move-exception v2

    monitor-exit p0

    throw v2

    .line 354
    .restart local v0    # "markerHeight":I
    .restart local v1    # "markerWidth":I
    :pswitch_39
    :try_start_39
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    neg-int v3, v1

    div-int/lit8 v3, v3, 0x2

    neg-int v4, v0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 357
    :pswitch_43
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    neg-int v3, v1

    div-int/lit8 v3, v3, 0x2

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 360
    :pswitch_4d
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    neg-int v3, v1

    neg-int v4, v0

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 363
    :pswitch_57
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    const/4 v3, 0x0

    neg-int v4, v0

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 366
    :pswitch_61
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    neg-int v3, v1

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 369
    :pswitch_69
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    neg-int v3, v1

    neg-int v4, v0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 372
    :pswitch_71
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 375
    :pswitch_79
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    const/4 v3, 0x0

    neg-int v4, v0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V
    :try_end_80
    .catchall {:try_start_39 .. :try_end_80} :catchall_36

    goto :goto_23

    .line 346
    nop

    :pswitch_data_82
    .packed-switch 0x2
        :pswitch_2a
        :pswitch_39
        :pswitch_43
        :pswitch_4d
        :pswitch_57
        :pswitch_61
        :pswitch_69
        :pswitch_71
        :pswitch_79
    .end packed-switch
.end method

.method protected abstract createItem(I)Lorg/osmdroid/views/overlay/OverlayItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TItem;"
        }
    .end annotation
.end method

.method protected draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V
    .registers 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;
    .param p3, "shadow"    # Z

    .prologue
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 115
    if-eqz p3, :cond_7

    .line 146
    :cond_6
    return-void

    .line 119
    :cond_7
    iget-boolean v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mPendingFocusChangedEvent:Z

    if-eqz v4, :cond_16

    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mOnFocusChangeListener:Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;

    if-eqz v4, :cond_16

    .line 120
    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mOnFocusChangeListener:Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;

    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;

    invoke-interface {v4, p0, v5}, Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;->onFocusChanged(Lorg/osmdroid/views/overlay/ItemizedOverlay;Lorg/osmdroid/views/overlay/OverlayItem;)V

    .line 121
    :cond_16
    iput-boolean v6, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mPendingFocusChangedEvent:Z

    .line 123
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    .line 124
    .local v2, "pj":Lorg/osmdroid/views/Projection;
    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .line 126
    .local v3, "size":I
    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->getMatrix(Landroid/graphics/Matrix;)V

    .line 127
    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrix:Landroid/graphics/Matrix;

    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrixValues:[F

    invoke-virtual {v4, v5}, Landroid/graphics/Matrix;->getValues([F)V

    .line 129
    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrixValues:[F

    aget v4, v4, v6

    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrixValues:[F

    aget v5, v5, v6

    mul-float/2addr v4, v5

    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrixValues:[F

    aget v5, v5, v8

    iget-object v6, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrixValues:[F

    aget v6, v6, v8

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v4, v4

    iput v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->scaleX:F

    .line 132
    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrixValues:[F

    aget v4, v4, v9

    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrixValues:[F

    aget v5, v5, v9

    mul-float/2addr v4, v5

    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrixValues:[F

    aget v5, v5, v7

    iget-object v6, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mMatrixValues:[F

    aget v6, v6, v7

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v4, v4

    iput v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->scaleY:F

    .line 136
    move v0, v3

    .local v0, "i":I
    :goto_67
    if-ltz v0, :cond_6

    .line 137
    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->getItem(I)Lorg/osmdroid/views/overlay/OverlayItem;

    move-result-object v1

    .line 138
    .local v1, "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    if-nez v1, :cond_72

    .line 136
    :goto_6f
    add-int/lit8 v0, v0, -0x1

    goto :goto_67

    .line 142
    :cond_72
    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/OverlayItem;->getPoint()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v4

    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    invoke-virtual {v2, v4, v5}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 144
    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v5

    invoke-virtual {p0, p1, v1, v4, v5}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->onDrawItem(Landroid/graphics/Canvas;Lorg/osmdroid/views/overlay/OverlayItem;Landroid/graphics/Point;F)V

    goto :goto_6f
.end method

.method protected getDefaultMarker(I)Landroid/graphics/drawable/Drawable;
    .registers 3
    .param p1, "state"    # I

    .prologue
    .line 229
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDefaultMarker:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Lorg/osmdroid/views/overlay/OverlayItem;->setState(Landroid/graphics/drawable/Drawable;I)V

    .line 230
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDefaultMarker:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getFocus()Lorg/osmdroid/views/overlay/OverlayItem;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TItem;"
        }
    .end annotation

    .prologue
    .line 322
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;

    return-object v0
.end method

.method public final getItem(I)Lorg/osmdroid/views/overlay/OverlayItem;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TItem;"
        }
    .end annotation

    .prologue
    .line 175
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    :try_start_0
    iget-object v1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/OverlayItem;
    :try_end_8
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_8} :catch_9

    .line 177
    :goto_8
    return-object v1

    .line 176
    :catch_9
    move-exception v0

    .line 177
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method protected hitTest(Lorg/osmdroid/views/overlay/OverlayItem;Landroid/graphics/drawable/Drawable;II)Z
    .registers 6
    .param p2, "marker"    # Landroid/graphics/drawable/Drawable;
    .param p3, "hitX"    # I
    .param p4, "hitY"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;",
            "Landroid/graphics/drawable/Drawable;",
            "II)Z"
        }
    .end annotation

    .prologue
    .line 251
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    .local p1, "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    return v0
.end method

.method protected onDrawItem(Landroid/graphics/Canvas;Lorg/osmdroid/views/overlay/OverlayItem;Landroid/graphics/Point;F)V
    .registers 15
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "curScreenCoords"    # Landroid/graphics/Point;
    .param p4, "aMapOrientation"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "TItem;",
            "Landroid/graphics/Point;",
            "F)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    .local p2, "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    const/high16 v9, 0x3f800000    # 1.0f

    .line 196
    iget-boolean v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDrawFocusedItem:Z

    if-eqz v5, :cond_62

    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;

    if-ne v5, p2, :cond_62

    const/4 v2, 0x4

    .line 198
    .local v2, "state":I
    :goto_b
    invoke-virtual {p2, v2}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    if-nez v5, :cond_64

    invoke-virtual {p0, v2}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->getDefaultMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 200
    .local v1, "marker":Landroid/graphics/drawable/Drawable;
    :goto_15
    invoke-virtual {p2}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarkerHotspot()Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;

    move-result-object v0

    .line 202
    .local v0, "hotspot":Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;
    invoke-virtual {p0, v1, v0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->boundToHotspot(Landroid/graphics/drawable/Drawable;Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;)Landroid/graphics/drawable/Drawable;

    .line 204
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    iget v3, v5, Landroid/graphics/Point;->x:I

    .line 205
    .local v3, "x":I
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    iget v4, v5, Landroid/graphics/Point;->y:I

    .line 207
    .local v4, "y":I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 208
    neg-float v5, p4

    int-to-float v6, v3

    int-to-float v7, v4

    invoke-virtual {p1, v5, v6, v7}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 209
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v5}, Landroid/graphics/drawable/Drawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 210
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    add-int/2addr v5, v3

    iget-object v6, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    add-int/2addr v6, v4

    iget-object v7, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    add-int/2addr v7, v3

    iget-object v8, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v8, v4

    invoke-virtual {v1, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 211
    iget v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->scaleX:F

    div-float v5, v9, v5

    iget v6, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->scaleY:F

    div-float v6, v9, v6

    int-to-float v7, v3

    int-to-float v8, v4

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 212
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 213
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v5}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 214
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 226
    return-void

    .line 196
    .end local v0    # "hotspot":Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;
    .end local v1    # "marker":Landroid/graphics/drawable/Drawable;
    .end local v2    # "state":I
    .end local v3    # "x":I
    .end local v4    # "y":I
    :cond_62
    const/4 v2, 0x0

    goto :goto_b

    .line 198
    .restart local v2    # "state":I
    :cond_64
    invoke-virtual {p2, v2}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_15
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 13
    .param p1, "e"    # Landroid/view/MotionEvent;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 256
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v3

    .line 257
    .local v3, "pj":Lorg/osmdroid/views/Projection;
    invoke-virtual {v3}, Lorg/osmdroid/views/Projection;->getIntrinsicScreenRect()Landroid/graphics/Rect;

    move-result-object v4

    .line 258
    .local v4, "screenRect":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->size()I

    move-result v5

    .line 260
    .local v5, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    if-ge v0, v5, :cond_6c

    .line 261
    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->getItem(I)Lorg/osmdroid/views/overlay/OverlayItem;

    move-result-object v1

    .line 262
    .local v1, "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    if-nez v1, :cond_18

    .line 260
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 266
    :cond_18
    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/OverlayItem;->getPoint()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v7

    iget-object v8, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    invoke-virtual {v3, v7, v8}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 268
    iget-boolean v7, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDrawFocusedItem:Z

    if-eqz v7, :cond_65

    iget-object v7, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;

    if-ne v7, v1, :cond_65

    const/4 v6, 0x4

    .line 270
    .local v6, "state":I
    :goto_2a
    invoke-virtual {v1, v6}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    if-nez v7, :cond_67

    invoke-virtual {p0, v6}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->getDefaultMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 272
    .local v2, "marker":Landroid/graphics/drawable/Drawable;
    :goto_34
    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarkerHotspot()Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;

    move-result-object v7

    invoke-virtual {p0, v2, v7}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->boundToHotspot(Landroid/graphics/drawable/Drawable;Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;)Landroid/graphics/drawable/Drawable;

    .line 273
    iget-object v7, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    iget v7, v7, Landroid/graphics/Point;->x:I

    neg-int v7, v7

    iget v8, v4, Landroid/graphics/Rect;->left:I

    add-int/2addr v7, v8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v8

    float-to-int v8, v8

    add-int/2addr v7, v8

    iget-object v8, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    iget v8, v8, Landroid/graphics/Point;->y:I

    neg-int v8, v8

    iget v9, v4, Landroid/graphics/Rect;->top:I

    add-int/2addr v8, v9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    float-to-int v9, v9

    add-int/2addr v8, v9

    invoke-virtual {p0, v1, v2, v7, v8}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->hitTest(Lorg/osmdroid/views/overlay/OverlayItem;Landroid/graphics/drawable/Drawable;II)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 276
    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->onTap(I)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 278
    const/4 v7, 0x1

    .line 283
    .end local v1    # "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    .end local v2    # "marker":Landroid/graphics/drawable/Drawable;
    .end local v6    # "state":I
    :goto_64
    return v7

    .line 268
    .restart local v1    # "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    :cond_65
    const/4 v6, 0x0

    goto :goto_2a

    .line 270
    .restart local v6    # "state":I
    :cond_67
    invoke-virtual {v1, v6}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_34

    .line 283
    .end local v1    # "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    .end local v6    # "state":I
    :cond_6c
    invoke-super {p0, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onSingleTapConfirmed(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v7

    goto :goto_64
.end method

.method protected onTap(I)Z
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 295
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    const/4 v0, 0x0

    return v0
.end method

.method protected final populate()V
    .registers 5

    .prologue
    .line 158
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->size()I

    move-result v1

    .line 159
    .local v1, "size":I
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 160
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 161
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_f
    if-ge v0, v1, :cond_1d

    .line 162
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->createItem(I)Lorg/osmdroid/views/overlay/OverlayItem;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 164
    :cond_1d
    return-void
.end method

.method public setDrawFocusedItem(Z)V
    .registers 2
    .param p1, "drawFocusedItem"    # Z

    .prologue
    .line 303
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDrawFocusedItem:Z

    .line 304
    return-void
.end method

.method public setFocus(Lorg/osmdroid/views/overlay/OverlayItem;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)V"
        }
    .end annotation

    .prologue
    .line 313
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    .local p1, "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;

    if-eq p1, v0, :cond_a

    const/4 v0, 0x1

    :goto_5
    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mPendingFocusChangedEvent:Z

    .line 314
    iput-object p1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;

    .line 315
    return-void

    .line 313
    :cond_a
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setOnFocusChangeListener(Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;)V
    .registers 2
    .param p1, "l"    # Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;

    .prologue
    .line 383
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    iput-object p1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mOnFocusChangeListener:Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;

    .line 384
    return-void
.end method

.method public abstract size()I
.end method
