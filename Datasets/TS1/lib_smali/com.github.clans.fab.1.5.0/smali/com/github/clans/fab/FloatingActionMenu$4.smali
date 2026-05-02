.class Lcom/github/clans/fab/FloatingActionMenu$4;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "FloatingActionMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/clans/fab/FloatingActionMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/clans/fab/FloatingActionMenu;


# direct methods
.method constructor <init>(Lcom/github/clans/fab/FloatingActionMenu;)V
    .registers 2
    .param p1, "this$0"    # Lcom/github/clans/fab/FloatingActionMenu;

    .prologue
    .line 542
    iput-object p1, p0, Lcom/github/clans/fab/FloatingActionMenu$4;->this$0:Lcom/github/clans/fab/FloatingActionMenu;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 546
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu$4;->this$0:Lcom/github/clans/fab/FloatingActionMenu;

    # getter for: Lcom/github/clans/fab/FloatingActionMenu;->mIsSetClosedOnTouchOutside:Z
    invoke-static {v0}, Lcom/github/clans/fab/FloatingActionMenu;->access$100(Lcom/github/clans/fab/FloatingActionMenu;)Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu$4;->this$0:Lcom/github/clans/fab/FloatingActionMenu;

    invoke-virtual {v0}, Lcom/github/clans/fab/FloatingActionMenu;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 551
    iget-object v0, p0, Lcom/github/clans/fab/FloatingActionMenu$4;->this$0:Lcom/github/clans/fab/FloatingActionMenu;

    iget-object v1, p0, Lcom/github/clans/fab/FloatingActionMenu$4;->this$0:Lcom/github/clans/fab/FloatingActionMenu;

    # getter for: Lcom/github/clans/fab/FloatingActionMenu;->mIsAnimated:Z
    invoke-static {v1}, Lcom/github/clans/fab/FloatingActionMenu;->access$000(Lcom/github/clans/fab/FloatingActionMenu;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/clans/fab/FloatingActionMenu;->close(Z)V

    .line 552
    const/4 v0, 0x1

    return v0
.end method
