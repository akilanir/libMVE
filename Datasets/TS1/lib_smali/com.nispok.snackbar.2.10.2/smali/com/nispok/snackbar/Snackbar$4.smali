.class Lcom/nispok/snackbar/Snackbar$4;
.super Ljava/lang/Object;
.source "Snackbar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 585
    iput-object p1, p0, Lcom/nispok/snackbar/Snackbar$4;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 588
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$4;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mActionClickListener:Lcom/nispok/snackbar/listeners/ActionClickListener;
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$000(Lcom/nispok/snackbar/Snackbar;)Lcom/nispok/snackbar/listeners/ActionClickListener;

    move-result-object v0

    if-eqz v0, :cond_31

    .line 593
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$4;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mIsDismissing:Z
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$100(Lcom/nispok/snackbar/Snackbar;)Z

    move-result v0

    if-nez v0, :cond_31

    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$4;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mActionClicked:Z
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$200(Lcom/nispok/snackbar/Snackbar;)Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$4;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mShouldAllowMultipleActionClicks:Z
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$300(Lcom/nispok/snackbar/Snackbar;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 595
    :cond_20
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$4;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mActionClickListener:Lcom/nispok/snackbar/listeners/ActionClickListener;
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$000(Lcom/nispok/snackbar/Snackbar;)Lcom/nispok/snackbar/listeners/ActionClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/nispok/snackbar/Snackbar$4;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-interface {v0, v1}, Lcom/nispok/snackbar/listeners/ActionClickListener;->onActionClicked(Lcom/nispok/snackbar/Snackbar;)V

    .line 596
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$4;->this$0:Lcom/nispok/snackbar/Snackbar;

    const/4 v1, 0x1

    # setter for: Lcom/nispok/snackbar/Snackbar;->mActionClicked:Z
    invoke-static {v0, v1}, Lcom/nispok/snackbar/Snackbar;->access$202(Lcom/nispok/snackbar/Snackbar;Z)Z

    .line 599
    :cond_31
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$4;->this$0:Lcom/nispok/snackbar/Snackbar;

    # getter for: Lcom/nispok/snackbar/Snackbar;->mShouldDismissOnActionClicked:Z
    invoke-static {v0}, Lcom/nispok/snackbar/Snackbar;->access$400(Lcom/nispok/snackbar/Snackbar;)Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 600
    iget-object v0, p0, Lcom/nispok/snackbar/Snackbar$4;->this$0:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->dismiss()V

    .line 602
    :cond_3e
    return-void
.end method
