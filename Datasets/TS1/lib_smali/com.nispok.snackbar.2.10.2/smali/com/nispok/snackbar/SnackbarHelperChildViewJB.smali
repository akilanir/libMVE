.class Lcom/nispok/snackbar/SnackbarHelperChildViewJB;
.super Landroid/view/View;
.source "SnackbarHelperChildViewJB.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 12
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 13
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/SnackbarHelperChildViewJB;->setSaveEnabled(Z)V

    .line 14
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/SnackbarHelperChildViewJB;->setWillNotDraw(Z)V

    .line 15
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/nispok/snackbar/SnackbarHelperChildViewJB;->setVisibility(I)V

    .line 16
    return-void
.end method


# virtual methods
.method public onWindowSystemUiVisibilityChanged(I)V
    .registers 4
    .param p1, "visible"    # I

    .prologue
    .line 20
    invoke-super {p0, p1}, Landroid/view/View;->onWindowSystemUiVisibilityChanged(I)V

    .line 22
    invoke-virtual {p0}, Lcom/nispok/snackbar/SnackbarHelperChildViewJB;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 23
    .local v0, "parent":Landroid/view/ViewParent;
    instance-of v1, v0, Lcom/nispok/snackbar/Snackbar;

    if-eqz v1, :cond_10

    .line 24
    check-cast v0, Lcom/nispok/snackbar/Snackbar;

    .end local v0    # "parent":Landroid/view/ViewParent;
    invoke-virtual {v0, p1}, Lcom/nispok/snackbar/Snackbar;->dispatchOnWindowSystemUiVisibilityChangedCompat(I)V

    .line 26
    :cond_10
    return-void
.end method
