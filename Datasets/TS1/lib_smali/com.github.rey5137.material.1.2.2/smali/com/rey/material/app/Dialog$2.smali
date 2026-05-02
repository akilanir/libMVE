.class Lcom/rey/material/app/Dialog$2;
.super Ljava/lang/Object;
.source "Dialog.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/app/Dialog;->onStart()V
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
    .line 1025
    iput-object p1, p0, Lcom/rey/material/app/Dialog$2;->this$0:Lcom/rey/material/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .registers 4

    .prologue
    .line 1028
    iget-object v1, p0, Lcom/rey/material/app/Dialog$2;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v1}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rey/material/app/Dialog$DialogCardView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1029
    iget-object v1, p0, Lcom/rey/material/app/Dialog$2;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v1}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rey/material/app/Dialog$DialogCardView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/rey/material/app/Dialog$2;->this$0:Lcom/rey/material/app/Dialog;

    iget v2, v2, Lcom/rey/material/app/Dialog;->mInAnimationId:I

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 1030
    .local v0, "anim":Landroid/view/animation/Animation;
    iget-object v1, p0, Lcom/rey/material/app/Dialog$2;->this$0:Lcom/rey/material/app/Dialog;

    # getter for: Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;
    invoke-static {v1}, Lcom/rey/material/app/Dialog;->access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/rey/material/app/Dialog$DialogCardView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1031
    const/4 v1, 0x0

    return v1
.end method
