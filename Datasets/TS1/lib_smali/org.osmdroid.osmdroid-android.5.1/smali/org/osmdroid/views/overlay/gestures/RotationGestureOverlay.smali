.class public Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;
.super Lorg/osmdroid/views/overlay/Overlay;
.source "RotationGestureOverlay.java"

# interfaces
.implements Lorg/osmdroid/views/overlay/gestures/RotationGestureDetector$RotationListener;
.implements Lorg/osmdroid/views/overlay/IOverlayMenuProvider;


# static fields
.field private static final MENU_ENABLED:I

.field private static final MENU_ROTATE_CCW:I

.field private static final MENU_ROTATE_CW:I

.field private static final SHOW_ROTATE_MENU_ITEMS:Z


# instance fields
.field currentAngle:F

.field final deltaTime:J

.field private lastAngle:F

.field private mMapView:Lorg/osmdroid/views/MapView;

.field private mOptionsMenuEnabled:Z

.field private final mRotationDetector:Lorg/osmdroid/views/overlay/gestures/RotationGestureDetector;

.field timeLastSet:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 18
    invoke-static {}, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->getSafeMenuId()I

    move-result v0

    sput v0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->MENU_ENABLED:I

    .line 19
    invoke-static {}, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->getSafeMenuId()I

    move-result v0

    sput v0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->MENU_ROTATE_CCW:I

    .line 20
    invoke-static {}, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->getSafeMenuId()I

    move-result v0

    sput v0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->MENU_ROTATE_CW:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/osmdroid/views/MapView;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/4 v2, 0x0

    .line 29
    invoke-direct {p0, p1}, Lorg/osmdroid/views/overlay/Overlay;-><init>(Landroid/content/Context;)V

    .line 24
    iput v2, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->lastAngle:F

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mOptionsMenuEnabled:Z

    .line 47
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->timeLastSet:J

    .line 48
    const-wide/16 v0, 0x19

    iput-wide v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->deltaTime:J

    .line 49
    iput v2, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->currentAngle:F

    .line 30
    iput-object p2, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    .line 31
    new-instance v0, Lorg/osmdroid/views/overlay/gestures/RotationGestureDetector;

    invoke-direct {v0, p0}, Lorg/osmdroid/views/overlay/gestures/RotationGestureDetector;-><init>(Lorg/osmdroid/views/overlay/gestures/RotationGestureDetector$RotationListener;)V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mRotationDetector:Lorg/osmdroid/views/overlay/gestures/RotationGestureDetector;

    .line 32
    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V
    .registers 4
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "osmv"    # Lorg/osmdroid/views/MapView;
    .param p3, "shadow"    # Z

    .prologue
    .line 37
    return-void
.end method

.method public isOptionsMenuEnabled()Z
    .registers 2

    .prologue
    .line 64
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mOptionsMenuEnabled:Z

    return v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z
    .registers 7
    .param p1, "pMenu"    # Landroid/view/Menu;
    .param p2, "pMenuIdOffset"    # I
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/4 v2, 0x0

    .line 70
    sget v0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->MENU_ENABLED:I

    add-int/2addr v0, p2

    const-string v1, "Enable rotation"

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x1080041

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 78
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;ILorg/osmdroid/views/MapView;)Z
    .registers 9
    .param p1, "pItem"    # Landroid/view/MenuItem;
    .param p2, "pMenuIdOffset"    # I
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/high16 v4, 0x41200000    # 10.0f

    .line 84
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    sget v3, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->MENU_ENABLED:I

    add-int/2addr v3, p2

    if-ne v2, v3, :cond_22

    .line 85
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 86
    iget-object v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/osmdroid/views/MapView;->setMapOrientation(F)V

    .line 87
    invoke-virtual {p0, v1}, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->setEnabled(Z)V

    :cond_1c
    :goto_1c
    move v0, v1

    .line 98
    :goto_1d
    return v0

    .line 89
    :cond_1e
    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->setEnabled(Z)V

    goto :goto_1d

    .line 92
    :cond_22
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sget v2, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->MENU_ROTATE_CCW:I

    add-int/2addr v2, p2

    if-ne v0, v2, :cond_38

    .line 93
    iget-object v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v2

    sub-float/2addr v2, v4

    invoke-virtual {v0, v2}, Lorg/osmdroid/views/MapView;->setMapOrientation(F)V

    goto :goto_1c

    .line 94
    :cond_38
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sget v2, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->MENU_ROTATE_CW:I

    add-int/2addr v2, p2

    if-ne v0, v2, :cond_1c

    .line 95
    iget-object v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v2, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v2

    add-float/2addr v2, v4

    invoke-virtual {v0, v2}, Lorg/osmdroid/views/MapView;->setMapOrientation(F)V

    goto :goto_1c
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "pMenu"    # Landroid/view/Menu;
    .param p2, "pMenuIdOffset"    # I
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 104
    sget v0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->MENU_ENABLED:I

    add-int/2addr v0, p2

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_14

    const-string v0, "Disable rotation"

    :goto_f
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 106
    const/4 v0, 0x0

    return v0

    .line 104
    :cond_14
    const-string v0, "Enable rotation"

    goto :goto_f
.end method

.method public onRotate(F)V
    .registers 6
    .param p1, "deltaAngle"    # F

    .prologue
    .line 54
    iget v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->currentAngle:F

    add-float/2addr v0, p1

    iput v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->currentAngle:F

    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x19

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->timeLastSet:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_26

    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->timeLastSet:J

    .line 57
    iget-object v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    iget-object v1, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v1

    iget v2, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->currentAngle:F

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/MapView;->setMapOrientation(F)V

    .line 59
    :cond_26
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 42
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 43
    iget-object v0, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mRotationDetector:Lorg/osmdroid/views/overlay/gestures/RotationGestureDetector;

    invoke-virtual {v0, p1}, Lorg/osmdroid/views/overlay/gestures/RotationGestureDetector;->onTouch(Landroid/view/MotionEvent;)V

    .line 45
    :cond_b
    invoke-super {p0, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onTouchEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v0

    return v0
.end method

.method public setOptionsMenuEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 112
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/gestures/RotationGestureOverlay;->mOptionsMenuEnabled:Z

    .line 113
    return-void
.end method
