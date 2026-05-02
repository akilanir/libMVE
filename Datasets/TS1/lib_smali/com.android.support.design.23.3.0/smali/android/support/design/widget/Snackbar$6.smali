.class Landroid/support/design/widget/Snackbar$6;
.super Ljava/lang/Object;
.source "Snackbar.java"

# interfaces
.implements Landroid/support/design/widget/Snackbar$SnackbarLayout$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/design/widget/Snackbar;->showView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/design/widget/Snackbar;


# direct methods
.method constructor <init>(Landroid/support/design/widget/Snackbar;)V
    .registers 2

    .prologue
    .line 509
    iput-object p1, p0, Landroid/support/design/widget/Snackbar$6;->this$0:Landroid/support/design/widget/Snackbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIII)V
    .registers 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 512
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$6;->this$0:Landroid/support/design/widget/Snackbar;

    # getter for: Landroid/support/design/widget/Snackbar;->mView:Landroid/support/design/widget/Snackbar$SnackbarLayout;
    invoke-static {v0}, Landroid/support/design/widget/Snackbar;->access$400(Landroid/support/design/widget/Snackbar;)Landroid/support/design/widget/Snackbar$SnackbarLayout;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->setOnLayoutChangeListener(Landroid/support/design/widget/Snackbar$SnackbarLayout$OnLayoutChangeListener;)V

    .line 514
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$6;->this$0:Landroid/support/design/widget/Snackbar;

    # invokes: Landroid/support/design/widget/Snackbar;->shouldAnimate()Z
    invoke-static {v0}, Landroid/support/design/widget/Snackbar;->access$500(Landroid/support/design/widget/Snackbar;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 516
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$6;->this$0:Landroid/support/design/widget/Snackbar;

    # invokes: Landroid/support/design/widget/Snackbar;->animateViewIn()V
    invoke-static {v0}, Landroid/support/design/widget/Snackbar;->access$600(Landroid/support/design/widget/Snackbar;)V

    .line 521
    :goto_17
    return-void

    .line 519
    :cond_18
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$6;->this$0:Landroid/support/design/widget/Snackbar;

    # invokes: Landroid/support/design/widget/Snackbar;->onViewShown()V
    invoke-static {v0}, Landroid/support/design/widget/Snackbar;->access$700(Landroid/support/design/widget/Snackbar;)V

    goto :goto_17
.end method
