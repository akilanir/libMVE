.class Lcom/github/clans/fab/FloatingActionButton$2;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/clans/fab/FloatingActionButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/clans/fab/FloatingActionButton;


# direct methods
.method constructor <init>(Lcom/github/clans/fab/FloatingActionButton;)V
    .registers 2
    .param p1, "this$0"    # Lcom/github/clans/fab/FloatingActionButton;

    .prologue
    .line 559
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionButton$2;->this$0:Lcom/github/clans/fab/FloatingActionButton;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 563
    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionButton$2;->this$0:Lcom/github/clans/fab/FloatingActionButton;

    sget v2, Lcom/github/clans/fab/R$id;->fab_label:I

    invoke-virtual {v1, v2}, Lcom/github/clans/fab/FloatingActionButton;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/clans/fab/Label;

    .line 564
    .local v0, "label":Lcom/github/clans/fab/Label;
    if-eqz v0, :cond_f

    .line 565
    invoke-virtual {v0}, Lcom/github/clans/fab/Label;->onActionDown()V

    .line 567
    :cond_f
    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionButton$2;->this$0:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v1}, Lcom/github/clans/fab/FloatingActionButton;->onActionDown()V

    .line 568
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 573
    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionButton$2;->this$0:Lcom/github/clans/fab/FloatingActionButton;

    sget v2, Lcom/github/clans/fab/R$id;->fab_label:I

    invoke-virtual {v1, v2}, Lcom/github/clans/fab/FloatingActionButton;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/clans/fab/Label;

    .line 574
    .local v0, "label":Lcom/github/clans/fab/Label;
    if-eqz v0, :cond_f

    .line 575
    invoke-virtual {v0}, Lcom/github/clans/fab/Label;->onActionUp()V

    .line 577
    :cond_f
    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionButton$2;->this$0:Lcom/github/clans/fab/FloatingActionButton;

    invoke-virtual {v1}, Lcom/github/clans/fab/FloatingActionButton;->onActionUp()V

    .line 578
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1
.end method
