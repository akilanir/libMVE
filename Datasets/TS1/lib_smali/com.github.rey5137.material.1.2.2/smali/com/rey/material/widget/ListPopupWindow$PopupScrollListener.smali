.class Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;
.super Ljava/lang/Object;
.source "ListPopupWindow.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/ListPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PopupScrollListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/ListPopupWindow;


# direct methods
.method private constructor <init>(Lcom/rey/material/widget/ListPopupWindow;)V
    .registers 2

    .prologue
    .line 1792
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/rey/material/widget/ListPopupWindow;Lcom/rey/material/widget/ListPopupWindow$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/rey/material/widget/ListPopupWindow;
    .param p2, "x1"    # Lcom/rey/material/widget/ListPopupWindow$1;

    .prologue
    .line 1792
    invoke-direct {p0, p1}, Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;-><init>(Lcom/rey/material/widget/ListPopupWindow;)V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 5
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 1796
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 5
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 1799
    const/4 v0, 0x1

    if-ne p2, v0, :cond_2f

    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow;->isInputMethodNotNeeded()Z

    move-result v0

    if-nez v0, :cond_2f

    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;
    invoke-static {v0}, Lcom/rey/material/widget/ListPopupWindow;->access$500(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/PopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rey/material/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2f

    .line 1801
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/rey/material/widget/ListPopupWindow;->access$1600(Lcom/rey/material/widget/ListPopupWindow;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mResizePopupRunnable:Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;
    invoke-static {v1}, Lcom/rey/material/widget/ListPopupWindow;->access$1500(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1802
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;->this$0:Lcom/rey/material/widget/ListPopupWindow;

    # getter for: Lcom/rey/material/widget/ListPopupWindow;->mResizePopupRunnable:Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;
    invoke-static {v0}, Lcom/rey/material/widget/ListPopupWindow;->access$1500(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;->run()V

    .line 1804
    :cond_2f
    return-void
.end method
