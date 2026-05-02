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

.field private mOnFocusChangeListener:Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;

.field private mPendingFocusChangedEvent:Z

.field private final mRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Lorg/osmdroid/ResourceProxy;)V
    .registers 5
    .param p1, "pDefaultMarker"    # Landroid/graphics/drawable/Drawable;
    .param p2, "pResourceProxy"    # Lorg/osmdroid/ResourceProxy;

    .prologue
    .line 70
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    invoke-direct {p0, p2}, Lorg/osmdroid/views/overlay/Overlay;-><init>(Lorg/osmdroid/ResourceProxy;)V

    .line 42
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    .line 43
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDrawFocusedItem:Z

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mPendingFocusChangedEvent:Z

    .line 72
    if-nez p1, :cond_21

    .line 73
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You must pass a default marker to ItemizedOverlay."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_21
    iput-object p1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDefaultMarker:Landroid/graphics/drawable/Drawable;

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    .line 79
    return-void
.end method


# virtual methods
.method protected declared-synchronized boundToHotspot(Landroid/graphics/drawable/Drawable;Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;)Landroid/graphics/drawable/Drawable;
    .registers 10
    .param p1, "marker"    # Landroid/graphics/drawable/Drawable;
    .param p2, "hotspot"    # Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;

    .prologue
    .line 300
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    monitor-enter p0

    :try_start_1
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 301
    .local v1, "markerWidth":I
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 303
    .local v0, "markerHeight":I
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    const/4 v3, 0x0

    const/4 v4, 0x0

    add-int/lit8 v5, v1, 0x0

    add-int/lit8 v6, v0, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 305
    if-nez p2, :cond_18

    .line 306
    sget-object p2, Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;->BOTTOM_CENTER:Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;

    .line 309
    :cond_18
    sget-object v2, Lorg/osmdroid/views/overlay/ItemizedOverlay$1;->$SwitchMap$org$osmdroid$views$overlay$OverlayItem$HotspotPlace:[I

    invoke-virtual {p2}, Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_82

    .line 341
    :goto_23
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V
    :try_end_28
    .catchall {:try_start_1 .. :try_end_28} :catchall_36

    .line 342
    monitor-exit p0

    return-object p1

    .line 314
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

    .line 300
    .end local v0    # "markerHeight":I
    .end local v1    # "markerWidth":I
    :catchall_36
    move-exception v2

    monitor-exit p0

    throw v2

    .line 317
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

    .line 320
    :pswitch_43
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    neg-int v3, v1

    div-int/lit8 v3, v3, 0x2

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 323
    :pswitch_4d
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    neg-int v3, v1

    neg-int v4, v0

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 326
    :pswitch_57
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    const/4 v3, 0x0

    neg-int v4, v0

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 329
    :pswitch_61
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    neg-int v3, v1

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 332
    :pswitch_69
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    neg-int v3, v1

    neg-int v4, v0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 335
    :pswitch_71
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23

    .line 338
    :pswitch_79
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mRect:Landroid/graphics/Rect;

    const/4 v3, 0x0

    neg-int v4, v0

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V
    :try_end_80
    .catchall {:try_start_39 .. :try_end_80} :catchall_36

    goto :goto_23

    .line 309
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
    .registers 10
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;
    .param p3, "shadow"    # Z

    .prologue
    .line 110
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    if-eqz p3, :cond_3

    .line 132
    :cond_2
    return-void

    .line 114
    :cond_3
    iget-boolean v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mPendingFocusChangedEvent:Z

    if-eqz v4, :cond_12

    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mOnFocusChangeListener:Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;

    if-eqz v4, :cond_12

    .line 115
    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mOnFocusChangeListener:Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;

    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;

    invoke-interface {v4, p0, v5}, Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;->onFocusChanged(Lorg/osmdroid/views/overlay/ItemizedOverlay;Lorg/osmdroid/views/overlay/OverlayItem;)V

    .line 116
    :cond_12
    const/4 v4, 0x0

    iput-boolean v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mPendingFocusChangedEvent:Z

    .line 118
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    .line 119
    .local v2, "pj":Lorg/osmdroid/views/Projection;
    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .line 122
    .local v3, "size":I
    move v0, v3

    .local v0, "i":I
    :goto_22
    if-ltz v0, :cond_2

    .line 123
    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->getItem(I)Lorg/osmdroid/views/overlay/OverlayItem;

    move-result-object v1

    .line 124
    .local v1, "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    if-nez v1, :cond_2d

    .line 122
    :goto_2a
    add-int/lit8 v0, v0, -0x1

    goto :goto_22

    .line 128
    :cond_2d
    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/OverlayItem;->getPoint()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v4

    iget-object v5, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    invoke-virtual {v2, v4, v5}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 130
    iget-object v4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v5

    invoke-virtual {p0, p1, v1, v4, v5}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->onDrawItem(Landroid/graphics/Canvas;Lorg/osmdroid/views/overlay/OverlayItem;Landroid/graphics/Point;F)V

    goto :goto_2a
.end method

.method protected getDefaultMarker(I)Landroid/graphics/drawable/Drawable;
    .registers 3
    .param p1, "state"    # I

    .prologue
    .line 192
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDefaultMarker:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Lorg/osmdroid/views/overlay/OverlayItem;->setState(Landroid/graphics/drawable/Drawable;I)V

    .line 193
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
    .line 285
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
    .line 161
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    :try_start_0
    iget-object v1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/OverlayItem;
    :try_end_8
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_8} :catch_9

    .line 163
    :goto_8
    return-object v1

    .line 162
    :catch_9
    move-exception v0

    .line 163
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
    .line 214
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    .local p1, "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    return v0
.end method

.method protected onDrawItem(Landroid/graphics/Canvas;Lorg/osmdroid/views/overlay/OverlayItem;Landroid/graphics/Point;F)V
    .registers 13
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
    const/4 v4, 0x0

    .line 179
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDrawFocusedItem:Z

    if-eqz v0, :cond_25

    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;

    if-ne v0, p2, :cond_25

    const/4 v7, 0x4

    .line 181
    .local v7, "state":I
    :goto_a
    invoke-virtual {p2, v7}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_27

    invoke-virtual {p0, v7}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->getDefaultMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 183
    .local v1, "marker":Landroid/graphics/drawable/Drawable;
    :goto_14
    invoke-virtual {p2}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarkerHotspot()Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;

    move-result-object v6

    .line 185
    .local v6, "hotspot":Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;
    invoke-virtual {p0, v1, v6}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->boundToHotspot(Landroid/graphics/drawable/Drawable;Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;)Landroid/graphics/drawable/Drawable;

    .line 188
    iget v2, p3, Landroid/graphics/Point;->x:I

    iget v3, p3, Landroid/graphics/Point;->y:I

    move-object v0, p1

    move v5, p4

    invoke-static/range {v0 .. v5}, Lorg/osmdroid/views/overlay/Overlay;->drawAt(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIZF)V

    .line 189
    return-void

    .end local v1    # "marker":Landroid/graphics/drawable/Drawable;
    .end local v6    # "hotspot":Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;
    .end local v7    # "state":I
    :cond_25
    move v7, v4

    .line 179
    goto :goto_a

    .line 181
    .restart local v7    # "state":I
    :cond_27
    invoke-virtual {p2, v7}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    goto :goto_14
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 13
    .param p1, "e"    # Landroid/view/MotionEvent;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 219
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v3

    .line 220
    .local v3, "pj":Lorg/osmdroid/views/Projection;
    invoke-virtual {v3}, Lorg/osmdroid/views/Projection;->getIntrinsicScreenRect()Landroid/graphics/Rect;

    move-result-object v4

    .line 221
    .local v4, "screenRect":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->size()I

    move-result v5

    .line 223
    .local v5, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    if-ge v0, v5, :cond_6c

    .line 224
    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->getItem(I)Lorg/osmdroid/views/overlay/OverlayItem;

    move-result-object v1

    .line 225
    .local v1, "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    if-nez v1, :cond_18

    .line 223
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 229
    :cond_18
    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/OverlayItem;->getPoint()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v7

    iget-object v8, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mCurScreenCoords:Landroid/graphics/Point;

    invoke-virtual {v3, v7, v8}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 231
    iget-boolean v7, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDrawFocusedItem:Z

    if-eqz v7, :cond_65

    iget-object v7, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;

    if-ne v7, v1, :cond_65

    const/4 v6, 0x4

    .line 233
    .local v6, "state":I
    :goto_2a
    invoke-virtual {v1, v6}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    if-nez v7, :cond_67

    invoke-virtual {p0, v6}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->getDefaultMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 235
    .local v2, "marker":Landroid/graphics/drawable/Drawable;
    :goto_34
    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarkerHotspot()Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;

    move-result-object v7

    invoke-virtual {p0, v2, v7}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->boundToHotspot(Landroid/graphics/drawable/Drawable;Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;)Landroid/graphics/drawable/Drawable;

    .line 236
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

    .line 239
    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->onTap(I)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 241
    const/4 v7, 0x1

    .line 246
    .end local v1    # "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    .end local v2    # "marker":Landroid/graphics/drawable/Drawable;
    .end local v6    # "state":I
    :goto_64
    return v7

    .line 231
    .restart local v1    # "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    :cond_65
    const/4 v6, 0x0

    goto :goto_2a

    .line 233
    .restart local v6    # "state":I
    :cond_67
    invoke-virtual {v1, v6}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_34

    .line 246
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
    .line 258
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    const/4 v0, 0x0

    return v0
.end method

.method protected final populate()V
    .registers 5

    .prologue
    .line 144
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->size()I

    move-result v1

    .line 145
    .local v1, "size":I
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 146
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 147
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_f
    if-ge v0, v1, :cond_1d

    .line 148
    iget-object v2, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mInternalItemList:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/ItemizedOverlay;->createItem(I)Lorg/osmdroid/views/overlay/OverlayItem;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 150
    :cond_1d
    return-void
.end method

.method public setDrawFocusedItem(Z)V
    .registers 2
    .param p1, "drawFocusedItem"    # Z

    .prologue
    .line 266
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mDrawFocusedItem:Z

    .line 267
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
    .line 276
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    .local p1, "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;

    if-eq p1, v0, :cond_a

    const/4 v0, 0x1

    :goto_5
    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mPendingFocusChangedEvent:Z

    .line 277
    iput-object p1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mFocusedItem:Lorg/osmdroid/views/overlay/OverlayItem;

    .line 278
    return-void

    .line 276
    :cond_a
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setOnFocusChangeListener(Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;)V
    .registers 2
    .param p1, "l"    # Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;

    .prologue
    .line 346
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlay;, "Lorg/osmdroid/views/overlay/ItemizedOverlay<TItem;>;"
    iput-object p1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlay;->mOnFocusChangeListener:Lorg/osmdroid/views/overlay/ItemizedOverlay$OnFocusChangeListener;

    .line 347
    return-void
.end method

.method public abstract size()I
.end method
