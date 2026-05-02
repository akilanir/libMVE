.class Lcom/rey/material/app/BottomSheetDialog$3;
.super Ljava/lang/Object;
.source "BottomSheetDialog.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/app/BottomSheetDialog;->dismiss()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/app/BottomSheetDialog;


# direct methods
.method constructor <init>(Lcom/rey/material/app/BottomSheetDialog;)V
    .registers 2

    .prologue
    .line 354
    iput-object p1, p0, Lcom/rey/material/app/BottomSheetDialog$3;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 365
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog$3;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    const/4 v1, 0x0

    # setter for: Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;
    invoke-static {v0, v1}, Lcom/rey/material/app/BottomSheetDialog;->access$202(Lcom/rey/material/app/BottomSheetDialog;Landroid/view/animation/Animation;)Landroid/view/animation/Animation;

    .line 366
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog$3;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/rey/material/app/BottomSheetDialog;->access$400(Lcom/rey/material/app/BottomSheetDialog;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/app/BottomSheetDialog$3;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    # getter for: Lcom/rey/material/app/BottomSheetDialog;->mDismissAction:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/rey/material/app/BottomSheetDialog;->access$300(Lcom/rey/material/app/BottomSheetDialog;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 367
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 361
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 357
    return-void
.end method
