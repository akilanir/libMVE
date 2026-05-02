.class Lcom/github/clans/fab/Label$2;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "Label.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/clans/fab/Label;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/clans/fab/Label;


# direct methods
.method constructor <init>(Lcom/github/clans/fab/Label;)V
    .registers 2
    .param p1, "this$0"    # Lcom/github/clans/fab/Label;

    .prologue
    .line 287
    iput-object p1, p0, Lcom/github/clans/fab/Label$2;->this$0:Lcom/github/clans/fab/Label;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 291
    iget-object v0, p0, Lcom/github/clans/fab/Label$2;->this$0:Lcom/github/clans/fab/Label;

    invoke-virtual {v0}, Lcom/github/clans/fab/Label;->onActionDown()V

    .line 292
    iget-object v0, p0, Lcom/github/clans/fab/Label$2;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mFab:Lcom/github/clans/fab/FloatingActionButton;
    invoke-static {v0}, Lcom/github/clans/fab/Label;->access$100(Lcom/github/clans/fab/Label;)Lcom/github/clans/fab/FloatingActionButton;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 293
    iget-object v0, p0, Lcom/github/clans/fab/Label$2;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mFab:Lcom/github/clans/fab/FloatingActionButton;
    invoke-static {v0}, Lcom/github/clans/fab/Label;->access$100(Lcom/github/clans/fab/Label;)Lcom/github/clans/fab/FloatingActionButton;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/clans/fab/FloatingActionButton;->onActionDown()V

    .line 295
    :cond_16
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 300
    iget-object v0, p0, Lcom/github/clans/fab/Label$2;->this$0:Lcom/github/clans/fab/Label;

    invoke-virtual {v0}, Lcom/github/clans/fab/Label;->onActionUp()V

    .line 301
    iget-object v0, p0, Lcom/github/clans/fab/Label$2;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mFab:Lcom/github/clans/fab/FloatingActionButton;
    invoke-static {v0}, Lcom/github/clans/fab/Label;->access$100(Lcom/github/clans/fab/Label;)Lcom/github/clans/fab/FloatingActionButton;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 302
    iget-object v0, p0, Lcom/github/clans/fab/Label$2;->this$0:Lcom/github/clans/fab/Label;

    # getter for: Lcom/github/clans/fab/Label;->mFab:Lcom/github/clans/fab/FloatingActionButton;
    invoke-static {v0}, Lcom/github/clans/fab/Label;->access$100(Lcom/github/clans/fab/Label;)Lcom/github/clans/fab/FloatingActionButton;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/clans/fab/FloatingActionButton;->onActionUp()V

    .line 304
    :cond_16
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
