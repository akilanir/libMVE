.class Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;
.super Lcom/melnykov/fab/RecyclerViewScrollDetector;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melnykov/fab/FloatingActionButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecyclerViewScrollDetectorImpl"
.end annotation


# instance fields
.field private mOnScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field private mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

.field final synthetic this$0:Lcom/melnykov/fab/FloatingActionButton;


# direct methods
.method private constructor <init>(Lcom/melnykov/fab/FloatingActionButton;)V
    .registers 2

    .prologue
    .line 477
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-direct {p0}, Lcom/melnykov/fab/RecyclerViewScrollDetector;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/melnykov/fab/FloatingActionButton;Lcom/melnykov/fab/FloatingActionButton$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/melnykov/fab/FloatingActionButton;
    .param p2, "x1"    # Lcom/melnykov/fab/FloatingActionButton$1;

    .prologue
    .line 477
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;-><init>(Lcom/melnykov/fab/FloatingActionButton;)V

    return-void
.end method

.method static synthetic access$600(Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 2
    .param p0, "x0"    # Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;
    .param p1, "x1"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 477
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->setScrollDirectionListener(Lcom/melnykov/fab/ScrollDirectionListener;)V

    return-void
.end method

.method private setScrollDirectionListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 2
    .param p1, "scrollDirectionListener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 482
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    .line 483
    return-void
.end method


# virtual methods
.method public onScrollDown()V
    .registers 2

    .prologue
    .line 491
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->show()V

    .line 492
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    if-eqz v0, :cond_e

    .line 493
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v0}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollDown()V

    .line 495
    :cond_e
    return-void
.end method

.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .registers 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 516
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mOnScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    if-eqz v0, :cond_9

    .line 517
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mOnScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    .line 520
    :cond_9
    invoke-super {p0, p1, p2}, Lcom/melnykov/fab/RecyclerViewScrollDetector;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    .line 521
    return-void
.end method

.method public onScrollUp()V
    .registers 2

    .prologue
    .line 499
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->hide()V

    .line 500
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    if-eqz v0, :cond_e

    .line 501
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v0}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollUp()V

    .line 503
    :cond_e
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 507
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mOnScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    if-eqz v0, :cond_9

    .line 508
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mOnScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    .line 511
    :cond_9
    invoke-super {p0, p1, p2, p3}, Lcom/melnykov/fab/RecyclerViewScrollDetector;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    .line 512
    return-void
.end method

.method public setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .registers 2
    .param p1, "onScrollListener"    # Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .prologue
    .line 486
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mOnScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .line 487
    return-void
.end method
