.class Lcom/astuetz/PagerSlidingTabStrip$1;
.super Ljava/lang/Object;
.source "PagerSlidingTabStrip.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/astuetz/PagerSlidingTabStrip;->notifyDataSetChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/astuetz/PagerSlidingTabStrip;


# direct methods
.method constructor <init>(Lcom/astuetz/PagerSlidingTabStrip;)V
    .registers 2
    .param p1, "this$0"    # Lcom/astuetz/PagerSlidingTabStrip;

    .prologue
    .line 250
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip$1;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .registers 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 257
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_3c

    .line 258
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip$1;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-virtual {v0}, Lcom/astuetz/PagerSlidingTabStrip;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 263
    :goto_f
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip$1;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip$1;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->pager:Landroid/support/v4/view/ViewPager;
    invoke-static {v1}, Lcom/astuetz/PagerSlidingTabStrip;->access$300(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    # setter for: Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I
    invoke-static {v0, v1}, Lcom/astuetz/PagerSlidingTabStrip;->access$202(Lcom/astuetz/PagerSlidingTabStrip;I)I

    .line 264
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip$1;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    const/4 v1, 0x0

    # setter for: Lcom/astuetz/PagerSlidingTabStrip;->currentPositionOffset:F
    invoke-static {v0, v1}, Lcom/astuetz/PagerSlidingTabStrip;->access$402(Lcom/astuetz/PagerSlidingTabStrip;F)F

    .line 265
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip$1;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip$1;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I
    invoke-static {v1}, Lcom/astuetz/PagerSlidingTabStrip;->access$200(Lcom/astuetz/PagerSlidingTabStrip;)I

    move-result v1

    const/4 v2, 0x0

    # invokes: Lcom/astuetz/PagerSlidingTabStrip;->scrollToChild(II)V
    invoke-static {v0, v1, v2}, Lcom/astuetz/PagerSlidingTabStrip;->access$500(Lcom/astuetz/PagerSlidingTabStrip;II)V

    .line 266
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip$1;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip$1;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->currentPosition:I
    invoke-static {v1}, Lcom/astuetz/PagerSlidingTabStrip;->access$200(Lcom/astuetz/PagerSlidingTabStrip;)I

    move-result v1

    # invokes: Lcom/astuetz/PagerSlidingTabStrip;->updateSelection(I)V
    invoke-static {v0, v1}, Lcom/astuetz/PagerSlidingTabStrip;->access$600(Lcom/astuetz/PagerSlidingTabStrip;I)V

    .line 267
    return-void

    .line 260
    :cond_3c
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip$1;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-virtual {v0}, Lcom/astuetz/PagerSlidingTabStrip;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_f
.end method
