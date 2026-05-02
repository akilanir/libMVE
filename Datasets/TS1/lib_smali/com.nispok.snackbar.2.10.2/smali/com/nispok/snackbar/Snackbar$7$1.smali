.class Lcom/nispok/snackbar/Snackbar$7$1;
.super Ljava/lang/Object;
.source "Snackbar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nispok/snackbar/Snackbar$7;->onAnimationEnd(Landroid/view/animation/Animation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nispok/snackbar/Snackbar$7;


# direct methods
.method constructor <init>(Lcom/nispok/snackbar/Snackbar$7;)V
    .registers 2
    .param p1, "this$1"    # Lcom/nispok/snackbar/Snackbar$7;

    .prologue
    .line 807
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar$7$1;->this$1:Lcom/nispok/snackbar/Snackbar$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 810
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$7$1;->this$1:Lcom/nispok/snackbar/Snackbar$7;

    iget-object v0, v0, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    # setter for: Lcom/nispok/snackbar/Snackbar;->mSnackbarStart:J
    invoke-static {v0, v1, v2}, Lcom/nispok/snackbar/Snackbar;->access$1102(Lcom/nispok/snackbar/Snackbar;J)J

    .line 812
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$7$1;->this$1:Lcom/nispok/snackbar/Snackbar$7;

    iget-object v0, v0, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mTimeRemaining:J
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$1000(Lcom/nispok/snackbar/Snackbar;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_28

    .line 813
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$7$1;->this$1:Lcom/nispok/snackbar/Snackbar$7;

    iget-object v0, v0, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar$7$1;->this$1:Lcom/nispok/snackbar/Snackbar$7;

    iget-object v1, v1, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v1}, Lcom/nispok/snackbar/Snackbar;->getDuration()J

    move-result-wide v1

    # setter for: Lcom/nispok/snackbar/Snackbar;->mTimeRemaining:J
    invoke-static {v0, v1, v2}, Lcom/nispok/snackbar/Snackbar;->access$1002(Lcom/nispok/snackbar/Snackbar;J)J

    .line 815
    :cond_28
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$7$1;->this$1:Lcom/nispok/snackbar/Snackbar$7;

    iget-object v0, v0, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    # invokes: Lcom/nispok/snackbar/Snackbar;->shouldStartTimer()Z
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$1600(Lcom/nispok/snackbar/Snackbar;)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 816
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$7$1;->this$1:Lcom/nispok/snackbar/Snackbar$7;

    iget-object v0, v0, Lcom/nispok/snackbar/Snackbar$7;->this$0:Lcom/nispok/snackbar/Snackbar;

    # invokes: Lcom/nispok/snackbar/Snackbar;->startTimer()V
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$1700(Lcom/nispok/snackbar/Snackbar;)V

    .line 818
    :cond_39
    return-void
.end method
