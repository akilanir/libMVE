.class public Lorg/osmdroid/views/MapController$MyZoomAnimationListener;
.super Ljava/lang/Object;
.source "MapController.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/views/MapController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "MyZoomAnimationListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/views/MapController;


# direct methods
.method protected constructor <init>(Lorg/osmdroid/views/MapController;)V
    .registers 2

    .prologue
    .line 351
    iput-object p1, p0, Lorg/osmdroid/views/MapController$MyZoomAnimationListener;->this$0:Lorg/osmdroid/views/MapController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 3
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 360
    iget-object v0, p0, Lorg/osmdroid/views/MapController$MyZoomAnimationListener;->this$0:Lorg/osmdroid/views/MapController;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapController;->onAnimationEnd()V

    .line 361
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 366
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 3
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 355
    iget-object v0, p0, Lorg/osmdroid/views/MapController$MyZoomAnimationListener;->this$0:Lorg/osmdroid/views/MapController;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapController;->onAnimationStart()V

    .line 356
    return-void
.end method
