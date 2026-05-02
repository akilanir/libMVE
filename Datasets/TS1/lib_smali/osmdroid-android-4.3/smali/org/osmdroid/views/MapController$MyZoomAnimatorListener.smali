.class public Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MapController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/views/MapController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "MyZoomAnimatorListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/views/MapController;


# direct methods
.method protected constructor <init>(Lorg/osmdroid/views/MapController;)V
    .registers 2

    .prologue
    .line 318
    iput-object p1, p0, Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;->this$0:Lorg/osmdroid/views/MapController;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 327
    iget-object v0, p0, Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;->this$0:Lorg/osmdroid/views/MapController;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapController;->onAnimationEnd()V

    .line 328
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 329
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 321
    iget-object v0, p0, Lorg/osmdroid/views/MapController$MyZoomAnimatorListener;->this$0:Lorg/osmdroid/views/MapController;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapController;->onAnimationStart()V

    .line 322
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 323
    return-void
.end method
