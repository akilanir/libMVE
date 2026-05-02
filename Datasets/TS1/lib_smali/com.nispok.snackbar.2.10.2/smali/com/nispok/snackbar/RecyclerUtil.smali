.class Lcom/nispok/snackbar/RecyclerUtil;
.super Ljava/lang/Object;
.source "RecyclerUtil.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static setScrollListener(Lcom/nispok/snackbar/Snackbar;Landroid/view/View;)V
    .registers 4
    .param p0, "snackbar"    # Lcom/nispok/snackbar/Snackbar;
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 13
    move-object v0, p1

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    .line 14
    .local v0, "recyclerView":Landroid/support/v7/widget/RecyclerView;
    new-instance v1, Lcom/nispok/snackbar/RecyclerUtil$1;

    invoke-direct {v1, p0}, Lcom/nispok/snackbar/RecyclerUtil$1;-><init>(Lcom/nispok/snackbar/Snackbar;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 21
    return-void
.end method
