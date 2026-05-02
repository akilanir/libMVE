.class Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;
.super Landroid/support/v4/widget/ViewDragHelper$Callback;
.source "ClosableSlidingLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cocosw/bottomsheet/ClosableSlidingLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewDragCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;


# direct methods
.method private constructor <init>(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)V
    .registers 2

    .prologue
    .line 186
    iput-object p1, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    invoke-direct {p0}, Landroid/support/v4/widget/ViewDragHelper$Callback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;Lcom/cocosw/bottomsheet/ClosableSlidingLayout$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/cocosw/bottomsheet/ClosableSlidingLayout;
    .param p2, "x1"    # Lcom/cocosw/bottomsheet/ClosableSlidingLayout$1;

    .prologue
    .line 186
    invoke-direct {p0, p1}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;-><init>(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)V

    return-void
.end method


# virtual methods
.method public clampViewPositionVertical(Landroid/view/View;II)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "top"    # I
    .param p3, "dy"    # I

    .prologue
    .line 222
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # getter for: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->top:I
    invoke-static {v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$300(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public onViewPositionChanged(Landroid/view/View;IIII)V
    .registers 8
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "dx"    # I
    .param p5, "dy"    # I

    .prologue
    .line 210
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_b

    .line 211
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->invalidate()V

    .line 213
    :cond_b
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # getter for: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->height:I
    invoke-static {v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$400(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)I

    move-result v0

    sub-int/2addr v0, p3

    const/4 v1, 0x1

    if-ge v0, v1, :cond_39

    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # getter for: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mListener:Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$600(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;

    move-result-object v0

    if-eqz v0, :cond_39

    .line 214
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # getter for: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$500(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    .line 215
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # getter for: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mListener:Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$600(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;->onClosed()V

    .line 216
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # getter for: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$500(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, p3}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    .line 218
    :cond_39
    return-void
.end method

.method public onViewReleased(Landroid/view/View;FF)V
    .registers 7
    .param p1, "releasedChild"    # Landroid/view/View;
    .param p2, "xvel"    # F
    .param p3, "yvel"    # F

    .prologue
    .line 196
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # getter for: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->MINVEL:F
    invoke-static {v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$100(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)F

    move-result v0

    cmpl-float v0, p3, v0

    if-lez v0, :cond_10

    .line 197
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # invokes: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->dismiss(Landroid/view/View;F)V
    invoke-static {v0, p1, p3}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$200(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;Landroid/view/View;F)V

    .line 206
    :goto_f
    return-void

    .line 199
    :cond_10
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    iget-object v1, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # getter for: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->top:I
    invoke-static {v1}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$300(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)I

    move-result v1

    iget-object v2, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # getter for: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->height:I
    invoke-static {v2}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$400(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    if-lt v0, v1, :cond_2b

    .line 200
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # invokes: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->dismiss(Landroid/view/View;F)V
    invoke-static {v0, p1, p3}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$200(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;Landroid/view/View;F)V

    goto :goto_f

    .line 202
    :cond_2b
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # getter for: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$500(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    # getter for: Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->top:I
    invoke-static {v2}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->access$300(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    .line 203
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;->this$0:Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    goto :goto_f
.end method

.method public tryCaptureView(Landroid/view/View;I)Z
    .registers 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "pointerId"    # I

    .prologue
    .line 191
    const/4 v0, 0x1

    return v0
.end method
