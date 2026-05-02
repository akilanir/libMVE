.class Lcom/nispok/snackbar/Snackbar$7;
.super Ljava/lang/Object;
.source "Snackbar.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nispok/snackbar/Snackbar;->showInternal(Landroid/app/Activity;Landroid/view/ViewGroup$MarginLayoutParams;Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nispok/snackbar/Snackbar;


# direct methods
.method constructor <init>(Lcom/nispok/snackbar/Snackbar;)V
    .registers 2
    .param p1, "this$0"    # Lcom/nispok/snackbar/Snackbar;

    .prologue
    .line 795
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 802
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mEventListener:Lcom/nispok/snackbar/listeners/EventListener;
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$1300(Lcom/nispok/snackbar/Snackbar;)Lcom/nispok/snackbar/listeners/EventListener;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 803
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mEventListener:Lcom/nispok/snackbar/listeners/EventListener;
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$1300(Lcom/nispok/snackbar/Snackbar;)Lcom/nispok/snackbar/listeners/EventListener;

    move-result-object v0

    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-interface {v0, v1}, Lcom/nispok/snackbar/listeners/EventListener;->onShown(Lcom/nispok/snackbar/Snackbar;)V

    .line 804
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    const/4 v1, 0x0

    # setter for: Lcom/nispok/snackbar/Snackbar;->mIsShowingByReplace:Z
    invoke-static {v0, v1}, Lcom/nispok/snackbar/Snackbar;->access$1402(Lcom/nispok/snackbar/Snackbar;Z)Z

    .line 807
    :cond_19
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    new-instance v1, Lcom/nispok/snackbar/Snackbar$7$1;

    invoke-direct {v1, p0}, Lcom/nispok/snackbar/Snackbar$7$1;-><init>(Lcom/nispok/snackbar/Snackbar$7;)V

    invoke-virtual {v0, v1}, Lcom/nispok/snackbar/Snackbar;->post(Ljava/lang/Runnable;)Z

    .line 820
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 824
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 798
    return-void
.end method
