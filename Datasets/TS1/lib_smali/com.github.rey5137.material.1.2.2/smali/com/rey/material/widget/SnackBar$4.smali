.class Lcom/rey/material/widget/SnackBar$4;
.super Ljava/lang/Object;
.source "SnackBar.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/SnackBar;->dismiss()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/SnackBar;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/SnackBar;)V
    .registers 2

    .prologue
    .line 870
    iput-object p1, p0, Lcom/rey/material/widget/SnackBar$4;->this$0:Lcom/rey/material/widget/SnackBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 882
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$4;->this$0:Lcom/rey/material/widget/SnackBar;

    # getter for: Lcom/rey/material/widget/SnackBar;->mRemoveOnDismiss:Z
    invoke-static {v0}, Lcom/rey/material/widget/SnackBar;->access$400(Lcom/rey/material/widget/SnackBar;)Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$4;->this$0:Lcom/rey/material/widget/SnackBar;

    invoke-virtual {v0}, Lcom/rey/material/widget/SnackBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_27

    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$4;->this$0:Lcom/rey/material/widget/SnackBar;

    invoke-virtual {v0}, Lcom/rey/material/widget/SnackBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_27

    .line 883
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$4;->this$0:Lcom/rey/material/widget/SnackBar;

    invoke-virtual {v0}, Lcom/rey/material/widget/SnackBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/rey/material/widget/SnackBar$4;->this$0:Lcom/rey/material/widget/SnackBar;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 885
    :cond_27
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$4;->this$0:Lcom/rey/material/widget/SnackBar;

    const/4 v1, 0x0

    # invokes: Lcom/rey/material/widget/SnackBar;->setState(I)V
    invoke-static {v0, v1}, Lcom/rey/material/widget/SnackBar;->access$200(Lcom/rey/material/widget/SnackBar;I)V

    .line 886
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$4;->this$0:Lcom/rey/material/widget/SnackBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->setVisibility(I)V

    .line 887
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 878
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 874
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar$4;->this$0:Lcom/rey/material/widget/SnackBar;

    const/4 v1, 0x3

    # invokes: Lcom/rey/material/widget/SnackBar;->setState(I)V
    invoke-static {v0, v1}, Lcom/rey/material/widget/SnackBar;->access$200(Lcom/rey/material/widget/SnackBar;I)V

    .line 875
    return-void
.end method
