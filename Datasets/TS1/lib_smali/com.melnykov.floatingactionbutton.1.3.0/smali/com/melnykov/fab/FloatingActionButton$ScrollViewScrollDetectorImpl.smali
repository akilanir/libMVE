.class Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;
.super Lcom/melnykov/fab/ScrollViewScrollDetector;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melnykov/fab/FloatingActionButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScrollViewScrollDetectorImpl"
.end annotation


# instance fields
.field private mOnScrollChangedListener:Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;

.field private mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

.field final synthetic this$0:Lcom/melnykov/fab/FloatingActionButton;


# direct methods
.method private constructor <init>(Lcom/melnykov/fab/FloatingActionButton;)V
    .registers 2

    .prologue
    .line 524
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-direct {p0}, Lcom/melnykov/fab/ScrollViewScrollDetector;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/melnykov/fab/FloatingActionButton;Lcom/melnykov/fab/FloatingActionButton$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/melnykov/fab/FloatingActionButton;
    .param p2, "x1"    # Lcom/melnykov/fab/FloatingActionButton$1;

    .prologue
    .line 524
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;-><init>(Lcom/melnykov/fab/FloatingActionButton;)V

    return-void
.end method

.method static synthetic access$800(Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 2
    .param p0, "x0"    # Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;
    .param p1, "x1"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 524
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->setScrollDirectionListener(Lcom/melnykov/fab/ScrollDirectionListener;)V

    return-void
.end method

.method private setScrollDirectionListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 2
    .param p1, "scrollDirectionListener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 530
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    .line 531
    return-void
.end method


# virtual methods
.method public onScrollChanged(Landroid/widget/ScrollView;IIII)V
    .registers 12
    .param p1, "who"    # Landroid/widget/ScrollView;
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "oldl"    # I
    .param p5, "oldt"    # I

    .prologue
    .line 555
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->mOnScrollChangedListener:Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;

    if-eqz v0, :cond_e

    .line 556
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->mOnScrollChangedListener:Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;->onScrollChanged(Landroid/widget/ScrollView;IIII)V

    .line 559
    :cond_e
    invoke-super/range {p0 .. p5}, Lcom/melnykov/fab/ScrollViewScrollDetector;->onScrollChanged(Landroid/widget/ScrollView;IIII)V

    .line 560
    return-void
.end method

.method public onScrollDown()V
    .registers 2

    .prologue
    .line 539
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->show()V

    .line 540
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    if-eqz v0, :cond_e

    .line 541
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v0}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollDown()V

    .line 543
    :cond_e
    return-void
.end method

.method public onScrollUp()V
    .registers 2

    .prologue
    .line 547
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->hide()V

    .line 548
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    if-eqz v0, :cond_e

    .line 549
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->mScrollDirectionListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v0}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollUp()V

    .line 551
    :cond_e
    return-void
.end method

.method public setOnScrollChangedListener(Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;)V
    .registers 2
    .param p1, "onScrollChangedListener"    # Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;

    .prologue
    .line 534
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$ScrollViewScrollDetectorImpl;->mOnScrollChangedListener:Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;

    .line 535
    return-void
.end method
