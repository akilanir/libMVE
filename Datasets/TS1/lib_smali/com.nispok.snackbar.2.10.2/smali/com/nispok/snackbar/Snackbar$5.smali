.class Lcom/nispok/snackbar/Snackbar$5;
.super Ljava/lang/Object;
.source "Snackbar.java"

# interfaces
.implements Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nispok/snackbar/Snackbar;->init(Landroid/content/Context;Landroid/app/Activity;Landroid/view/ViewGroup;Z)Landroid/view/ViewGroup$MarginLayoutParams;
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
    .line 613
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public canDismiss(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "token"    # Ljava/lang/Object;

    .prologue
    .line 616
    const/4 v0, 0x1

    return v0
.end method

.method public onDismiss(Landroid/view/View;Ljava/lang/Object;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "token"    # Ljava/lang/Object;

    .prologue
    .line 621
    if-eqz p1, :cond_19

    .line 622
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mActionSwipeListener:Lcom/nispok/snackbar/listeners/ActionSwipeListener;
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$500(Lcom/nispok/snackbar/Snackbar;)Lcom/nispok/snackbar/listeners/ActionSwipeListener;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 623
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mActionSwipeListener:Lcom/nispok/snackbar/listeners/ActionSwipeListener;
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$500(Lcom/nispok/snackbar/Snackbar;)Lcom/nispok/snackbar/listeners/ActionSwipeListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/nispok/snackbar/listeners/ActionSwipeListener;->onSwipeToDismiss()V

    .line 625
    :cond_13
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    const/4 v1, 0x0

    # invokes: Lcom/nispok/snackbar/Snackbar;->dismiss(Z)V
    invoke-static {v0, v1}, Lcom/nispok/snackbar/Snackbar;->access$600(Lcom/nispok/snackbar/Snackbar;Z)V

    .line 627
    :cond_19
    return-void
.end method

.method public pauseTimer(Z)V
    .registers 9
    .param p1, "shouldPause"    # Z

    .prologue
    .line 631
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    # invokes: Lcom/nispok/snackbar/Snackbar;->isIndefiniteDuration()Z
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$700(Lcom/nispok/snackbar/Snackbar;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 643
    :goto_8
    return-void

    .line 634
    :cond_9
    if-eqz p1, :cond_20

    .line 635
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mDismissRunnable:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/nispok/snackbar/Snackbar;->access$800(Lcom/nispok/snackbar/Snackbar;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nispok/snackbar/Snackbar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 637
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    # setter for: Lcom/nispok/snackbar/Snackbar;->mSnackbarFinish:J
    invoke-static {v0, v1, v2}, Lcom/nispok/snackbar/Snackbar;->access$902(Lcom/nispok/snackbar/Snackbar;J)J

    goto :goto_8

    .line 639
    :cond_20
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mTimeRemaining:J
    invoke-static {v1}, Lcom/nispok/snackbar/Snackbar;->access$1000(Lcom/nispok/snackbar/Snackbar;)J

    move-result-wide v1

    iget-object v3, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mSnackbarFinish:J
    invoke-static {v3}, Lcom/nispok/snackbar/Snackbar;->access$900(Lcom/nispok/snackbar/Snackbar;)J

    move-result-wide v3

    iget-object v5, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mSnackbarStart:J
    invoke-static {v5}, Lcom/nispok/snackbar/Snackbar;->access$1100(Lcom/nispok/snackbar/Snackbar;)J

    move-result-wide v5

    sub-long/2addr v3, v5

    sub-long/2addr v1, v3

    # setter for: Lcom/nispok/snackbar/Snackbar;->mTimeRemaining:J
    invoke-static {v0, v1, v2}, Lcom/nispok/snackbar/Snackbar;->access$1002(Lcom/nispok/snackbar/Snackbar;J)J

    .line 641
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar$5;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mTimeRemaining:J
    invoke-static {v1}, Lcom/nispok/snackbar/Snackbar;->access$1000(Lcom/nispok/snackbar/Snackbar;)J

    move-result-wide v1

    # invokes: Lcom/nispok/snackbar/Snackbar;->startTimer(J)V
    invoke-static {v0, v1, v2}, Lcom/nispok/snackbar/Snackbar;->access$1200(Lcom/nispok/snackbar/Snackbar;J)V

    goto :goto_8
.end method
