.class Lorg/osmdroid/views/MapView$MapViewZoomListener;
.super Ljava/lang/Object;
.source "MapView.java"

# interfaces
.implements Landroid/widget/ZoomButtonsController$OnZoomListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/views/MapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MapViewZoomListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/views/MapView;


# direct methods
.method private constructor <init>(Lorg/osmdroid/views/MapView;)V
    .registers 2

    .prologue
    .line 1184
    iput-object p1, p0, Lorg/osmdroid/views/MapView$MapViewZoomListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/osmdroid/views/MapView;Lorg/osmdroid/views/MapView$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/osmdroid/views/MapView;
    .param p2, "x1"    # Lorg/osmdroid/views/MapView$1;

    .prologue
    .line 1184
    invoke-direct {p0, p1}, Lorg/osmdroid/views/MapView$MapViewZoomListener;-><init>(Lorg/osmdroid/views/MapView;)V

    return-void
.end method


# virtual methods
.method public onVisibilityChanged(Z)V
    .registers 2
    .param p1, "visible"    # Z

    .prologue
    .line 1196
    return-void
.end method

.method public onZoom(Z)V
    .registers 3
    .param p1, "zoomIn"    # Z

    .prologue
    .line 1187
    if-eqz p1, :cond_c

    .line 1188
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewZoomListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    invoke-interface {v0}, Lorg/osmdroid/api/IMapController;->zoomIn()Z

    .line 1192
    :goto_b
    return-void

    .line 1190
    :cond_c
    iget-object v0, p0, Lorg/osmdroid/views/MapView$MapViewZoomListener;->this$0:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    invoke-interface {v0}, Lorg/osmdroid/api/IMapController;->zoomOut()Z

    goto :goto_b
.end method
