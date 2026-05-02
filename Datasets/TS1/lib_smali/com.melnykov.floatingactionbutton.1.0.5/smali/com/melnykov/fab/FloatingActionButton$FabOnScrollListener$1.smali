.class Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener$1;
.super Ljava/lang/Object;
.source "FloatingActionButton.java"

# interfaces
.implements Lcom/melnykov/fab/ScrollDirectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;


# direct methods
.method constructor <init>(Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;)V
    .registers 2

    .prologue
    .line 298
    iput-object p1, p0, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener$1;->this$0:Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollDown()V
    .registers 2

    .prologue
    .line 300
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener$1;->this$0:Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;

    # getter for: Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;->mFloatingActionButton:Lcom/melnykov/fab/FloatingActionButton;
    invoke-static {v0}, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;->access$100(Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;)Lcom/melnykov/fab/FloatingActionButton;

    move-result-object v0

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->show()V

    .line 301
    return-void
.end method

.method public onScrollUp()V
    .registers 2

    .prologue
    .line 304
    iget-object v0, p0, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener$1;->this$0:Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;

    # getter for: Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;->mFloatingActionButton:Lcom/melnykov/fab/FloatingActionButton;
    invoke-static {v0}, Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;->access$100(Lcom/melnykov/fab/FloatingActionButton$FabOnScrollListener;)Lcom/melnykov/fab/FloatingActionButton;

    move-result-object v0

    invoke-virtual {v0}, Lcom/melnykov/fab/FloatingActionButton;->hide()V

    .line 305
    return-void
.end method
