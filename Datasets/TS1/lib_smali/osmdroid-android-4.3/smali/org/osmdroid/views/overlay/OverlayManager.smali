.class public Lorg/osmdroid/views/overlay/OverlayManager;
.super Ljava/util/AbstractList;
.source "OverlayManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList",
        "<",
        "Lorg/osmdroid/views/overlay/Overlay;",
        ">;"
    }
.end annotation


# instance fields
.field private final mOverlayList:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Lorg/osmdroid/views/overlay/Overlay;",
            ">;"
        }
    .end annotation
.end field

.field private mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;


# direct methods
.method public constructor <init>(Lorg/osmdroid/views/overlay/TilesOverlay;)V
    .registers 3
    .param p1, "tilesOverlay"    # Lorg/osmdroid/views/overlay/TilesOverlay;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 26
    invoke-virtual {p0, p1}, Lorg/osmdroid/views/overlay/OverlayManager;->setTilesOverlay(Lorg/osmdroid/views/overlay/TilesOverlay;)V

    .line 27
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mOverlayList:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 28
    return-void
.end method

.method static synthetic access$000(Lorg/osmdroid/views/overlay/OverlayManager;)Ljava/util/concurrent/CopyOnWriteArrayList;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/overlay/OverlayManager;

    .prologue
    .line 19
    iget-object v0, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mOverlayList:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic add(ILjava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # I
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 19
    check-cast p2, Lorg/osmdroid/views/overlay/Overlay;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/osmdroid/views/overlay/OverlayManager;->add(ILorg/osmdroid/views/overlay/Overlay;)V

    return-void
.end method

.method public add(ILorg/osmdroid/views/overlay/Overlay;)V
    .registers 4
    .param p1, "pIndex"    # I
    .param p2, "pElement"    # Lorg/osmdroid/views/overlay/Overlay;

    .prologue
    .line 42
    iget-object v0, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mOverlayList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(ILjava/lang/Object;)V

    .line 43
    return-void
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lorg/osmdroid/views/overlay/OverlayManager;->get(I)Lorg/osmdroid/views/overlay/Overlay;

    move-result-object v0

    return-object v0
.end method

.method public get(I)Lorg/osmdroid/views/overlay/Overlay;
    .registers 3
    .param p1, "pIndex"    # I

    .prologue
    .line 32
    iget-object v0, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mOverlayList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/Overlay;

    return-object v0
.end method

.method public getTilesOverlay()Lorg/osmdroid/views/overlay/TilesOverlay;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z
    .registers 9
    .param p1, "pMenu"    # Landroid/view/Menu;
    .param p2, "menuIdOffset"    # I
    .param p3, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 292
    const/4 v3, 0x1

    .line 293
    .local v3, "result":Z
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 294
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    instance-of v4, v1, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;

    if-eqz v4, :cond_9

    move-object v2, v1

    .line 295
    check-cast v2, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;

    .line 296
    .local v2, "overlayMenuProvider":Lorg/osmdroid/views/overlay/IOverlayMenuProvider;
    invoke-interface {v2}, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;->isOptionsMenuEnabled()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 297
    invoke-interface {v2, p1, p2, p3}, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;->onCreateOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z

    move-result v4

    and-int/2addr v3, v4

    goto :goto_9

    .line 302
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    .end local v2    # "overlayMenuProvider":Lorg/osmdroid/views/overlay/IOverlayMenuProvider;
    :cond_28
    iget-object v4, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    if-eqz v4, :cond_3b

    iget-object v4, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v4}, Lorg/osmdroid/views/overlay/TilesOverlay;->isOptionsMenuEnabled()Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 303
    iget-object v4, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v4, p1, p2, p3}, Lorg/osmdroid/views/overlay/TilesOverlay;->onCreateOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z

    move-result v4

    and-int/2addr v3, v4

    .line 306
    :cond_3b
    return v3
.end method

.method public onDetach(Lorg/osmdroid/views/MapView;)V
    .registers 5
    .param p1, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 127
    iget-object v2, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    if-eqz v2, :cond_9

    .line 128
    iget-object v2, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v2, p1}, Lorg/osmdroid/views/overlay/TilesOverlay;->onDetach(Lorg/osmdroid/views/MapView;)V

    .line 131
    :cond_9
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 132
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1}, Lorg/osmdroid/views/overlay/Overlay;->onDetach(Lorg/osmdroid/views/MapView;)V

    goto :goto_11

    .line 134
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :cond_21
    return-void
.end method

.method public onDoubleTap(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;
    .param p2, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 191
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 192
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onDoubleTap(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 193
    const/4 v2, 0x1

    .line 197
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public onDoubleTapEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;
    .param p2, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 201
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 202
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onDoubleTapEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 203
    const/4 v2, 0x1

    .line 207
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public onDown(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "pEvent"    # Landroid/view/MotionEvent;
    .param p2, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 223
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 224
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onDown(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 225
    const/4 v2, 0x1

    .line 229
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public onDraw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;)V
    .registers 8
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 104
    iget-object v2, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    if-eqz v2, :cond_13

    iget-object v2, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v2}, Lorg/osmdroid/views/overlay/TilesOverlay;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_13

    .line 105
    iget-object v2, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v2, p1, p2, v4}, Lorg/osmdroid/views/overlay/TilesOverlay;->draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V

    .line 108
    :cond_13
    iget-object v2, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    if-eqz v2, :cond_24

    iget-object v2, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v2}, Lorg/osmdroid/views/overlay/TilesOverlay;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 109
    iget-object v2, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v2, p1, p2, v3}, Lorg/osmdroid/views/overlay/TilesOverlay;->draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V

    .line 112
    :cond_24
    iget-object v2, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mOverlayList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2a
    :goto_2a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_40

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 113
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/Overlay;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 114
    invoke-virtual {v1, p1, p2, v4}, Lorg/osmdroid/views/overlay/Overlay;->draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V

    goto :goto_2a

    .line 118
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :cond_40
    iget-object v2, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mOverlayList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_46
    :goto_46
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 119
    .restart local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/Overlay;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_46

    .line 120
    invoke-virtual {v1, p1, p2, v3}, Lorg/osmdroid/views/overlay/Overlay;->draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V

    goto :goto_46

    .line 124
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :cond_5c
    return-void
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FFLorg/osmdroid/views/MapView;)Z
    .registers 13
    .param p1, "pEvent1"    # Landroid/view/MotionEvent;
    .param p2, "pEvent2"    # Landroid/view/MotionEvent;
    .param p3, "pVelocityX"    # F
    .param p4, "pVelocityY"    # F
    .param p5, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 234
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/Overlay;

    .local v0, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .line 235
    invoke-virtual/range {v0 .. v5}, Lorg/osmdroid/views/overlay/Overlay;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FFLorg/osmdroid/views/MapView;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 236
    const/4 v1, 0x1

    .line 240
    .end local v0    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_20
    return v1

    :cond_21
    const/4 v1, 0x0

    goto :goto_20
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 7
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 137
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 138
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1, p2, p3}, Lorg/osmdroid/views/overlay/Overlay;->onKeyDown(ILandroid/view/KeyEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 139
    const/4 v2, 0x1

    .line 143
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 7
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 147
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 148
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1, p2, p3}, Lorg/osmdroid/views/overlay/Overlay;->onKeyUp(ILandroid/view/KeyEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 149
    const/4 v2, 0x1

    .line 153
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public onLongPress(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "pEvent"    # Landroid/view/MotionEvent;
    .param p2, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 244
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 245
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onLongPress(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 246
    const/4 v2, 0x1

    .line 250
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;ILorg/osmdroid/views/MapView;)Z
    .registers 9
    .param p1, "item"    # Landroid/view/MenuItem;
    .param p2, "menuIdOffset"    # I
    .param p3, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/4 v3, 0x1

    .line 327
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_29

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 328
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    instance-of v4, v1, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;

    if-eqz v4, :cond_9

    move-object v2, v1

    .line 329
    check-cast v2, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;

    .line 330
    .local v2, "overlayMenuProvider":Lorg/osmdroid/views/overlay/IOverlayMenuProvider;
    invoke-interface {v2}, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;->isOptionsMenuEnabled()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v2, p1, p2, p3}, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;->onOptionsItemSelected(Landroid/view/MenuItem;ILorg/osmdroid/views/MapView;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 343
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    .end local v2    # "overlayMenuProvider":Lorg/osmdroid/views/overlay/IOverlayMenuProvider;
    :cond_28
    :goto_28
    return v3

    .line 337
    :cond_29
    iget-object v4, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    if-eqz v4, :cond_3d

    iget-object v4, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v4}, Lorg/osmdroid/views/overlay/TilesOverlay;->isOptionsMenuEnabled()Z

    move-result v4

    if-eqz v4, :cond_3d

    iget-object v4, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v4, p1, p2, p3}, Lorg/osmdroid/views/overlay/TilesOverlay;->onOptionsItemSelected(Landroid/view/MenuItem;ILorg/osmdroid/views/MapView;)Z

    move-result v4

    if-nez v4, :cond_28

    .line 343
    :cond_3d
    const/4 v3, 0x0

    goto :goto_28
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z
    .registers 8
    .param p1, "pMenu"    # Landroid/view/Menu;
    .param p2, "menuIdOffset"    # I
    .param p3, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 310
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 311
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    instance-of v3, v1, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;

    if-eqz v3, :cond_8

    move-object v2, v1

    .line 312
    check-cast v2, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;

    .line 313
    .local v2, "overlayMenuProvider":Lorg/osmdroid/views/overlay/IOverlayMenuProvider;
    invoke-interface {v2}, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;->isOptionsMenuEnabled()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 314
    invoke-interface {v2, p1, p2, p3}, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;->onPrepareOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z

    goto :goto_8

    .line 319
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    .end local v2    # "overlayMenuProvider":Lorg/osmdroid/views/overlay/IOverlayMenuProvider;
    :cond_25
    iget-object v3, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    if-eqz v3, :cond_36

    iget-object v3, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v3}, Lorg/osmdroid/views/overlay/TilesOverlay;->isOptionsMenuEnabled()Z

    move-result v3

    if-eqz v3, :cond_36

    .line 320
    iget-object v3, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v3, p1, p2, p3}, Lorg/osmdroid/views/overlay/TilesOverlay;->onPrepareOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z

    .line 323
    :cond_36
    const/4 v3, 0x1

    return v3
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FFLorg/osmdroid/views/MapView;)Z
    .registers 13
    .param p1, "pEvent1"    # Landroid/view/MotionEvent;
    .param p2, "pEvent2"    # Landroid/view/MotionEvent;
    .param p3, "pDistanceX"    # F
    .param p4, "pDistanceY"    # F
    .param p5, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 255
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/Overlay;

    .local v0, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .line 256
    invoke-virtual/range {v0 .. v5}, Lorg/osmdroid/views/overlay/Overlay;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FFLorg/osmdroid/views/MapView;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 257
    const/4 v1, 0x1

    .line 261
    .end local v0    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_20
    return v1

    :cond_21
    const/4 v1, 0x0

    goto :goto_20
.end method

.method public onShowPress(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)V
    .registers 6
    .param p1, "pEvent"    # Landroid/view/MotionEvent;
    .param p2, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 265
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 266
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onShowPress(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)V

    goto :goto_8

    .line 268
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :cond_18
    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;
    .param p2, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 211
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 212
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onSingleTapConfirmed(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 213
    const/4 v2, 0x1

    .line 217
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "pEvent"    # Landroid/view/MotionEvent;
    .param p2, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 271
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 272
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onSingleTapUp(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 273
    const/4 v2, 0x1

    .line 277
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public onSnapToItem(IILandroid/graphics/Point;Lorg/osmdroid/api/IMapView;)Z
    .registers 8
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "snapPoint"    # Landroid/graphics/Point;
    .param p4, "pMapView"    # Lorg/osmdroid/api/IMapView;

    .prologue
    .line 177
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 178
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    instance-of v2, v1, Lorg/osmdroid/views/overlay/Overlay$Snappable;

    if-eqz v2, :cond_8

    .line 179
    check-cast v1, Lorg/osmdroid/views/overlay/Overlay$Snappable;

    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-interface {v1, p1, p2, p3, p4}, Lorg/osmdroid/views/overlay/Overlay$Snappable;->onSnapToItem(IILandroid/graphics/Point;Lorg/osmdroid/api/IMapView;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 180
    const/4 v2, 0x1

    .line 185
    :goto_21
    return v2

    :cond_22
    const/4 v2, 0x0

    goto :goto_21
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 157
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 158
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onTouchEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 159
    const/4 v2, 0x1

    .line 163
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 167
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/OverlayManager;->overlaysReversed()Ljava/lang/Iterable;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 168
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-virtual {v1, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onTrackballEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 169
    const/4 v2, 0x1

    .line 173
    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public overlaysReversed()Ljava/lang/Iterable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/osmdroid/views/overlay/Overlay;",
            ">;"
        }
    .end annotation

    .prologue
    .line 78
    new-instance v0, Lorg/osmdroid/views/overlay/OverlayManager$1;

    invoke-direct {v0, p0}, Lorg/osmdroid/views/overlay/OverlayManager$1;-><init>(Lorg/osmdroid/views/overlay/OverlayManager;)V

    return-object v0
.end method

.method public bridge synthetic remove(I)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lorg/osmdroid/views/overlay/OverlayManager;->remove(I)Lorg/osmdroid/views/overlay/Overlay;

    move-result-object v0

    return-object v0
.end method

.method public remove(I)Lorg/osmdroid/views/overlay/Overlay;
    .registers 3
    .param p1, "pIndex"    # I

    .prologue
    .line 47
    iget-object v0, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mOverlayList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/Overlay;

    return-object v0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # I
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 19
    check-cast p2, Lorg/osmdroid/views/overlay/Overlay;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/osmdroid/views/overlay/OverlayManager;->set(ILorg/osmdroid/views/overlay/Overlay;)Lorg/osmdroid/views/overlay/Overlay;

    move-result-object v0

    return-object v0
.end method

.method public set(ILorg/osmdroid/views/overlay/Overlay;)Lorg/osmdroid/views/overlay/Overlay;
    .registers 5
    .param p1, "pIndex"    # I
    .param p2, "pElement"    # Lorg/osmdroid/views/overlay/Overlay;

    .prologue
    .line 52
    iget-object v1, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mOverlayList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, p1, p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/Overlay;

    .line 53
    .local v0, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    return-object v0
.end method

.method public setOptionsMenusEnabled(Z)V
    .registers 5
    .param p1, "pEnabled"    # Z

    .prologue
    .line 283
    iget-object v2, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mOverlayList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/overlay/Overlay;

    .line 284
    .local v1, "overlay":Lorg/osmdroid/views/overlay/Overlay;
    instance-of v2, v1, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;

    if-eqz v2, :cond_6

    move-object v2, v1

    check-cast v2, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;

    invoke-interface {v2}, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;->isOptionsMenuEnabled()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 286
    check-cast v1, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;

    .end local v1    # "overlay":Lorg/osmdroid/views/overlay/Overlay;
    invoke-interface {v1, p1}, Lorg/osmdroid/views/overlay/IOverlayMenuProvider;->setOptionsMenuEnabled(Z)V

    goto :goto_6

    .line 289
    :cond_25
    return-void
.end method

.method public setTilesOverlay(Lorg/osmdroid/views/overlay/TilesOverlay;)V
    .registers 2
    .param p1, "tilesOverlay"    # Lorg/osmdroid/views/overlay/TilesOverlay;

    .prologue
    .line 74
    iput-object p1, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mTilesOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    .line 75
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lorg/osmdroid/views/overlay/OverlayManager;->mOverlayList:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v0

    return v0
.end method
