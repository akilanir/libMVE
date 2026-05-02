.class Lcom/github/mrengineer13/snackbar/SnackContainer$1;
.super Ljava/lang/Object;
.source "SnackContainer.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/mrengineer13/snackbar/SnackContainer;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;


# direct methods
.method constructor <init>(Lcom/github/mrengineer13/snackbar/SnackContainer;)V
    .registers 2

    .prologue
    .line 84
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    invoke-virtual {v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->removeAllViews()V

    .line 94
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;
    invoke-static {v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$000(Lcom/github/mrengineer13/snackbar/SnackContainer;)Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_22

    .line 95
    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;
    invoke-static {v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$000(Lcom/github/mrengineer13/snackbar/SnackContainer;)Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    # invokes: Lcom/github/mrengineer13/snackbar/SnackContainer;->sendOnHide(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V
    invoke-static {v1, v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$100(Lcom/github/mrengineer13/snackbar/SnackContainer;Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V

    .line 98
    :cond_22
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    invoke-virtual {v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3c

    .line 99
    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    # getter for: Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;
    invoke-static {v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$000(Lcom/github/mrengineer13/snackbar/SnackContainer;)Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    # invokes: Lcom/github/mrengineer13/snackbar/SnackContainer;->showSnack(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V
    invoke-static {v1, v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->access$200(Lcom/github/mrengineer13/snackbar/SnackContainer;Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V

    .line 103
    :goto_3b
    return-void

    .line 101
    :cond_3c
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer$1;->this$0:Lcom/github/mrengineer13/snackbar/SnackContainer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/github/mrengineer13/snackbar/SnackContainer;->setVisibility(I)V

    goto :goto_3b
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 108
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 88
    return-void
.end method
