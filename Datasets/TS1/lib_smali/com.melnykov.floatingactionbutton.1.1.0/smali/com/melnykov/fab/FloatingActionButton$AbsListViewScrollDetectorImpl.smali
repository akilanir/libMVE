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
.field private mListener:Lcom/melnykov/fab/ScrollDirectionListener;

.field final synthetic this$0:Lcom/melnykov/fab/FloatingActionButton;


# direct methods
.method private constructor <init>(Lcom/melnykov/fab/FloatingActionButton;)V
    .registers 2

    .prologue
    .line 377
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-direct {p0}, Lcom/melnykov/fab/AbsListViewScrollDetector;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/melnykov/fab/FloatingActionButton;Lcom/melnykov/fab/FloatingActionButton$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/melnykov/fab/FloatingActionButton;
    .param p2, "x1"    # Lcom/melnykov/fab/FloatingActionButton$1;

    .prologue
    .line 377
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;-><init>(Lcom/melnykov/fab/FloatingActionButton;)V

    return-void
.end method

.method static synthetic access$400(Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 2
    .param p0, "x0"    # Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;
    .param p1, "x1"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 377
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->setListener(Lcom/melnykov/fab/ScrollDirectionListener;)V

    return-void
.end method

.method private setListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 2
    .param p1, "scrollDirectionListener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 381
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mListener:Lcom/melnykov/fab/ScrollDirectionListener;

    .line 382
    return-void
.end method


# virtual methods
.method public onScrollDown()V
    .registers 2

    .prologue
    .line 386
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->show()V

    .line 387
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mListener:Lcom/melnykov/fab/ScrollDirectionListener;

    if-eqz v0, :cond_e

    .line 388
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v0}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollDown()V

    .line 390
    :cond_e
    return-void
.end method

.method public onScrollUp()V
    .registers 2

    .prologue
    .line 394
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->hide()V

    .line 395
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mListener:Lcom/melnykov/fab/ScrollDirectionListener;

    if-eqz v0, :cond_e

    .line 396
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$AbsListViewScrollDetectorImpl;->mListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v0}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollUp()V

    .line 398
    :cond_e
    return-void
.end method
