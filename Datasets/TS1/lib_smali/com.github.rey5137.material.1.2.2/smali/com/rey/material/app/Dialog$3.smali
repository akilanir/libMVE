.class Lcom/rey/material/app/Dialog$3;
.super Ljava/lang/Object;
.source "Dialog.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/app/Dialog;->dismiss()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/app/Dialog;


# direct methods
.method constructor <init>(Lcom/rey/material/app/Dialog;)V
    .registers 2

    .prologue
    .line 1053
    iput-object p1, p0, Lcom/rey/material/app/Dialog$3;->this$0:Lcom/rey/material/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1062
    iget-object v0, p0, Lcom/rey/material/app/Dialog$3;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v0}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog$DialogCardView;->setVisibility(I)V

    .line 1063
    iget-object v0, p0, Lcom/rey/material/app/Dialog$3;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/rey/material/app/Dialog;->access$300(Lcom/rey/material/app/Dialog;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/app/Dialog$3;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mDismissAction:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/rey/material/app/Dialog;->access$200(Lcom/rey/material/app/Dialog;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1064
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1058
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1055
    return-void
.end method
