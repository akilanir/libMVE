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
.field private mListener:Lcom/melnykov/fab/ScrollDirectionListener;

.field final synthetic this$0:Lcom/melnykov/fab/FloatingActionButton;


# direct methods
.method private constructor <init>(Lcom/melnykov/fab/FloatingActionButton;)V
    .registers 2

    .prologue
    .line 401
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-direct {p0}, Lcom/melnykov/fab/RecyclerViewScrollDetector;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/melnykov/fab/FloatingActionButton;Lcom/melnykov/fab/FloatingActionButton$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/melnykov/fab/FloatingActionButton;
    .param p2, "x1"    # Lcom/melnykov/fab/FloatingActionButton$1;

    .prologue
    .line 401
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;-><init>(Lcom/melnykov/fab/FloatingActionButton;)V

    return-void
.end method

.method static synthetic access$600(Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 2
    .param p0, "x0"    # Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;
    .param p1, "x1"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 401
    invoke-direct {p0, p1}, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->setListener(Lcom/melnykov/fab/ScrollDirectionListener;)V

    return-void
.end method

.method private setListener(Lcom/melnykov/fab/ScrollDirectionListener;)V
    .registers 2
    .param p1, "scrollDirectionListener"    # Lcom/melnykov/fab/ScrollDirectionListener;

    .prologue
    .line 405
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mListener:Lcom/melnykov/fab/ScrollDirectionListener;

    .line 406
    return-void
.end method


# virtual methods
.method public onScrollDown()V
    .registers 2

    .prologue
    .line 410
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->show()V

    .line 411
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mListener:Lcom/melnykov/fab/ScrollDirectionListener;

    if-eqz v0, :cond_e

    .line 412
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v0}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollDown()V

    .line 414
    :cond_e
    return-void
.end method

.method public onScrollUp()V
    .registers 2

    .prologue
    .line 418
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->this$0:Lcom/melnykov/fab/FloatingActionButton;

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->hide()V

    .line 419
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mListener:Lcom/melnykov/fab/ScrollDirectionListener;

    if-eqz v0, :cond_e

    .line 420
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$RecyclerViewScrollDetectorImpl;->mListener:Lcom/melnykov/fab/ScrollDirectionListener;

    invoke-interface {v0}, Lcom/melnykov/fab/ScrollDirectionListener;->onScrollUp()V

    .line 422
    :cond_e
    return-void
.end method
