.class Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;
.super Ljava/lang/Object;
.source "MapView.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/views/MapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MapViewGestureDetectorListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/views/MapView;


# direct methods
.method private constructor <init>(Lorg/osmdroid/views/MapView;)V
    .registers 2

    .prologue
    .line 1176
    iput-object p1, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/osmdroid/views/MapView;Lorg/osmdroid/views/MapView$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/osmdroid/views/MapView;
    .param p2, "x1"    # Lorg/osmdroid/views/MapView$1;

    .prologue
    .line 1176
    invoke-direct {p0, p1}, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;-><init>(Lorg/osmdroid/views/MapView;)V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x1

    .line 1182
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    iget-boolean v0, v0, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    if-eqz v0, :cond_15

    .line 1183
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    # getter for: Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;
    invoke-static {v0}, Lorg/osmdroid/views/MapView;->access$300(Lorg/osmdroid/views/MapView;)Landroid/widget/Scroller;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1184
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 1187
    :cond_15
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-interface {v0, p1, v1}, Lorg/osmdroid/views/overlay/OverlayManager;->onDown(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 1192
    :goto_23
    return v2

    .line 1191
    :cond_24
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    # getter for: Lorg/osmdroid/views/MapView;->mZoomController:Landroid/widget/ZoomButtonsController;
    invoke-static {v0}, Lorg/osmdroid/views/MapView;->access$500(Lorg/osmdroid/views/MapView;)Landroid/widget/ZoomButtonsController;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    # getter for: Lorg/osmdroid/views/MapView;->mEnableZoomController:Z
    invoke-static {v1}, Lorg/osmdroid/views/MapView;->access$400(Lorg/osmdroid/views/MapView;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ZoomButtonsController;->setVisible(Z)V

    goto :goto_23
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 15
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    const/4 v7, 0x0

    const/4 v9, 0x1

    .line 1198
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    # getter for: Lorg/osmdroid/views/MapView;->enableFling:Z
    invoke-static {v0}, Lorg/osmdroid/views/MapView;->access$600(Lorg/osmdroid/views/MapView;)Z

    move-result v0

    if-nez v0, :cond_c

    move v0, v7

    .line 1211
    :goto_b
    return v0

    .line 1202
    :cond_c
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v5, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-interface/range {v0 .. v5}, Lorg/osmdroid/views/overlay/OverlayManager;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FFLorg/osmdroid/views/MapView;)Z

    move-result v0

    if-eqz v0, :cond_20

    move v0, v9

    .line 1204
    goto :goto_b

    .line 1207
    :cond_20
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0, v7}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v0

    invoke-static {v0}, Lmicrosoft/mappoint/TileSystem;->MapSize(I)I

    move-result v6

    .line 1208
    .local v6, "worldSize":I
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    iput-boolean v9, v0, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 1209
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    # getter for: Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;
    invoke-static {v0}, Lorg/osmdroid/views/MapView;->access$300(Lorg/osmdroid/views/MapView;)Landroid/widget/Scroller;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getScrollX()I

    move-result v1

    iget-object v2, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getScrollY()I

    move-result v2

    neg-float v3, p3

    float-to-int v3, v3

    neg-float v4, p4

    float-to-int v4, v4

    neg-int v5, v6

    neg-int v7, v6

    move v8, v6

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    move v0, v9

    .line 1211
    goto :goto_b
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 1216
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    # getter for: Lorg/osmdroid/views/MapView;->mMultiTouchController:Lorg/metalev/multitouch/controller/MultiTouchController;
    invoke-static {v0}, Lorg/osmdroid/views/MapView;->access$700(Lorg/osmdroid/views/MapView;)Lorg/metalev/multitouch/controller/MultiTouchController;

    move-result-object v0

    if-eqz v0, :cond_15

    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    # getter for: Lorg/osmdroid/views/MapView;->mMultiTouchController:Lorg/metalev/multitouch/controller/MultiTouchController;
    invoke-static {v0}, Lorg/osmdroid/views/MapView;->access$700(Lorg/osmdroid/views/MapView;)Lorg/metalev/multitouch/controller/MultiTouchController;

    move-result-object v0

    invoke-virtual {v0}, Lorg/metalev/multitouch/controller/MultiTouchController;->isPinching()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 1220
    :goto_14
    return-void

    .line 1219
    :cond_15
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-interface {v0, p1, v1}, Lorg/osmdroid/views/overlay/OverlayManager;->onLongPress(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    goto :goto_14
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 12
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    const/4 v6, 0x1

    .line 1225
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v5, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-interface/range {v0 .. v5}, Lorg/osmdroid/views/overlay/OverlayManager;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FFLorg/osmdroid/views/MapView;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 1231
    :goto_13
    return v6

    .line 1230
    :cond_14
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    float-to-int v1, p3

    float-to-int v2, p4

    invoke-virtual {v0, v1, v2}, Lorg/osmdroid/views/MapView;->scrollBy(II)V

    goto :goto_13
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 1236
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-interface {v0, p1, v1}, Lorg/osmdroid/views/overlay/OverlayManager;->onShowPress(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)V

    .line 1237
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 1241
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-interface {v0, p1, v1}, Lorg/osmdroid/views/overlay/OverlayManager;->onSingleTapUp(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 1242
    const/4 v0, 0x1

    .line 1245
    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method
