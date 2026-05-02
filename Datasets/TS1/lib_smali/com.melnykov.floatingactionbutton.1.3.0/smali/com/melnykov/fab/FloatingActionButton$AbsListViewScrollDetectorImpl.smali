.class Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;
.super Lcom/melnykov/fab/AbsListViewScrollDetector;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melnykov/fab/FloatingActionButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AbsListViewScrollDetectorImpl"
.end annotation


# instance fields
.field private mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

.field private mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

.field final synthetic this$0:Lcom/melnykov/fab/FloatingActionButton;


# direct methods
.method private constructor <init>(Lcom/melnykov/fab/FloatingActionButton;)V
    .registers 2

    .prologue
    .line 429
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-direct {p0}, Lcom/melnykov/fab/AbsListViewScrollDetector;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/melnykov/fab/FloatingActionButton;Lcom/melnykov/fab/FloatingActionButton$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/melnykov/fab/FloatingActionButton;
    .param p2, "x1"    # Lcom/melnykov/fab/FloatingActionButton$1;

    .prologue
    .line 429
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;-><init>(Lcom/melnykov/fab/FloatingActionButton;)V

    return-void
.end method

.method static synthetic access$400(Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 2
    .param p0, "x0"    # Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;
    .param p1, "x1"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 429
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->setScrollDirectionListener(Lcom/melnykov/fab/ScrollDirectionListener;)V

    return-void
.end method

.method private setScrollDirectionListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 2
    .param p1, "scrollDirectionListener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 434
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    .line 435
    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .registers 6
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 460
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_9

    .line 461
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2, p3, p4}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    .line 464
    :cond_9
    invoke-super {p0, p1, p2, p3, p4}, Lcom/melnykov/fab/AbsListViewScrollDetector;->onScroll(Landroid/widget/AbsListView;III)V

    .line 465
    return-void
.end method

.method public onScrollDown()V
    .registers 2

    .prologue
    .line 443
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->show()V

    .line 444
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    if-eqz v0, :cond_e

    .line 445
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v0}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollDown()V

    .line 447
    :cond_e
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .registers 4
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 469
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_9

    .line 470
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    .line 473
    :cond_9
    invoke-super {p0, p1, p2}, Lcom/melnykov/fab/AbsListViewScrollDetector;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    .line 474
    return-void
.end method

.method public onScrollUp()V
    .registers 2

    .prologue
    .line 451
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->hide()V

    .line 452
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    if-eqz v0, :cond_e

    .line 453
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v0}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollUp()V

    .line 455
    :cond_e
    return-void
.end method

.method public setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .registers 2
    .param p1, "onScrollListener"    # Landroid/widget/AbsListView$OnScrollListener;

    .prologue
    .line 438
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mOnScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    .line 439
    return-void
.end method
