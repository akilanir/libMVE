.class Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout$1;
.super Ljava/lang/Object;
.source "BottomSheetDialog.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->onLayout(ZIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;


# direct methods
.method constructor <init>(Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;)V
    .registers 2

    .prologue
    .line 442
    iput-object p1, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout$1;->this$1:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 453
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout$1;->this$1:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    iget-object v0, v0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->this$0:Lcom/rey/material/app/BottomSheetDialog;

    const/4 v1, 0x0

    # setter for: Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;
    invoke-static {v0, v1}, Lcom/rey/material/app/BottomSheetDialog;->access$202(Lcom/rey/material/app/BottomSheetDialog;Landroid/view/animation/Animation;)Landroid/view/animation/Animation;

    .line 454
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 449
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 445
    return-void
.end method
