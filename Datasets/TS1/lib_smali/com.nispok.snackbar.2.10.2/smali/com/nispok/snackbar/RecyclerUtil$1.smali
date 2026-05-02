.class final Lcom/nispok/snackbar/RecyclerUtil$1;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "RecyclerUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nispok/snackbar/RecyclerUtil;->setScrollListener(Lcom/nispok/snackbar/Snackbar;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$snackbar:Lcom/nispok/snackbar/Snackbar;


# direct methods
.method constructor <init>(Lcom/nispok/snackbar/Snackbar;)V
    .registers 2

    .prologue
    .line 14
    iput-object p1, p0, Lcom/nispok/snackbar/RecyclerUtil$1;->val$snackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .registers 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 17
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    .line 18
    iget-object v0, p0, Lcom/nispok/snackbar/RecyclerUtil$1;->val$snackbar:Lcom/nispok/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/nispok/snackbar/Snackbar;->dismiss()V

    .line 19
    return-void
.end method
