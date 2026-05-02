.class Lcom/astuetz/PagerSlidingTabStrip$PageListener;
.super Ljava/lang/Object;
.source "PagerSlidingTabStrip.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/astuetz/PagerSlidingTabStrip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PageListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/astuetz/PagerSlidingTabStrip;


# direct methods
.method private constructor <init>(Lcom/astuetz/PagerSlidingTabStrip;)V
    .registers 2

    .prologue
    .line 433
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/astuetz/PagerSlidingTabStrip;Lcom/astuetz/PagerSlidingTabStrip$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p2, "x1"    # Lcom/astuetz/PagerSlidingTabStrip$1;

    .prologue
    .line 433
    invoke-direct {p0, p1}, Lcom/astuetz/PagerSlidingTabStrip$PageListener;-><init>(Lcom/astuetz/PagerSlidingTabStrip;)V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .registers 8
    .param p1, "state"    # I

    .prologue
    .line 449
    if-nez p1, :cond_12

    .line 450
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;
    invoke-static {v4}, Lcom/astuetz/PagerSlidingTabStrip;->access$200(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v4

    const/4 v5, 0x0

    # invokes: Lcom/astuetz/PagerSlidingTabStrip;->scrollToChild(II)V
    invoke-static {v3, v4, v5}, Lcom/astuetz/PagerSlidingTabStrip;->access$1200(Lcom/astuetz/PagerSlidingTabStrip;II)V

    .line 453
    :cond_12
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;
    invoke-static {v3}, Lcom/astuetz/PagerSlidingTabStrip;->access$300(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/widget/LinearLayout;

    move-result-object v3

    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;
    invoke-static {v4}, Lcom/astuetz/PagerSlidingTabStrip;->access$200(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 454
    .local v0, "currentTab":Landroid/view/View;
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # invokes: Lcom/astuetz/PagerSlidingTabStrip;->select(Landroid/view/View;)V
    invoke-static {v3, v0}, Lcom/astuetz/PagerSlidingTabStrip;->access$1500(Lcom/astuetz/PagerSlidingTabStrip;Landroid/view/View;)V

    .line 456
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;
    invoke-static {v3}, Lcom/astuetz/PagerSlidingTabStrip;->access$200(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_54

    .line 457
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;
    invoke-static {v3}, Lcom/astuetz/PagerSlidingTabStrip;->access$300(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/widget/LinearLayout;

    move-result-object v3

    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;
    invoke-static {v4}, Lcom/astuetz/PagerSlidingTabStrip;->access$200(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 458
    .local v2, "prevTab":Landroid/view/View;
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # invokes: Lcom/astuetz/PagerSlidingTabStrip;->unSelect(Landroid/view/View;)V
    invoke-static {v3, v2}, Lcom/astuetz/PagerSlidingTabStrip;->access$400(Lcom/astuetz/PagerSlidingTabStrip;Landroid/view/View;)V

    .line 462
    .end local v2    # "prevTab":Landroid/view/View;
    :cond_54
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;
    invoke-static {v3}, Lcom/astuetz/PagerSlidingTabStrip;->access$200(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;
    invoke-static {v4}, Lcom/astuetz/PagerSlidingTabStrip;->access$200(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-gt v3, v4, :cond_8d

    .line 463
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;
    invoke-static {v3}, Lcom/astuetz/PagerSlidingTabStrip;->access$300(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/widget/LinearLayout;

    move-result-object v3

    iget-object v4, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mPager:Landroid/support/v4/view/ViewPager;
    invoke-static {v4}, Lcom/astuetz/PagerSlidingTabStrip;->access$200(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/support/v4/view/ViewPager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 464
    .local v1, "nextTab":Landroid/view/View;
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # invokes: Lcom/astuetz/PagerSlidingTabStrip;->unSelect(Landroid/view/View;)V
    invoke-static {v3, v1}, Lcom/astuetz/PagerSlidingTabStrip;->access$400(Lcom/astuetz/PagerSlidingTabStrip;Landroid/view/View;)V

    .line 467
    .end local v1    # "nextTab":Landroid/view/View;
    :cond_8d
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v3, v3, Lcom/astuetz/PagerSlidingTabStrip;->mDelegatePageListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v3, :cond_9a

    .line 468
    iget-object v3, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v3, v3, Lcom/astuetz/PagerSlidingTabStrip;->mDelegatePageListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v3, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    .line 470
    :cond_9a
    return-void
.end method

.method public onPageScrolled(IFI)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 437
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # setter for: Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPosition:I
    invoke-static {v1, p1}, Lcom/astuetz/PagerSlidingTabStrip;->access$1002(Lcom/astuetz/PagerSlidingTabStrip;I)I

    .line 438
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # setter for: Lcom/astuetz/PagerSlidingTabStrip;->mCurrentPositionOffset:F
    invoke-static {v1, p2}, Lcom/astuetz/PagerSlidingTabStrip;->access$1102(Lcom/astuetz/PagerSlidingTabStrip;F)F

    .line 439
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mTabCount:I
    invoke-static {v1}, Lcom/astuetz/PagerSlidingTabStrip;->access$1400(Lcom/astuetz/PagerSlidingTabStrip;)I

    move-result v1

    if-lez v1, :cond_3b

    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # getter for: Lcom/astuetz/PagerSlidingTabStrip;->mTabsContainer:Landroid/widget/LinearLayout;
    invoke-static {v1}, Lcom/astuetz/PagerSlidingTabStrip;->access$300(Lcom/astuetz/PagerSlidingTabStrip;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, p2

    float-to-int v0, v1

    .line 440
    .local v0, "offset":I
    :goto_23
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # invokes: Lcom/astuetz/PagerSlidingTabStrip;->scrollToChild(II)V
    invoke-static {v1, p1, v0}, Lcom/astuetz/PagerSlidingTabStrip;->access$1200(Lcom/astuetz/PagerSlidingTabStrip;II)V

    .line 441
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-virtual {v1}, Lcom/astuetz/PagerSlidingTabStrip;->invalidate()V

    .line 442
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v1, v1, Lcom/astuetz/PagerSlidingTabStrip;->mDelegatePageListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v1, :cond_3a

    .line 443
    iget-object v1, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v1, v1, Lcom/astuetz/PagerSlidingTabStrip;->mDelegatePageListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v1, p1, p2, p3}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    .line 445
    :cond_3a
    return-void

    .line 439
    .end local v0    # "offset":I
    :cond_3b
    const/4 v0, 0x0

    goto :goto_23
.end method

.method public onPageSelected(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 474
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    # invokes: Lcom/astuetz/PagerSlidingTabStrip;->updateSelection(I)V
    invoke-static {v0, p1}, Lcom/astuetz/PagerSlidingTabStrip;->access$1300(Lcom/astuetz/PagerSlidingTabStrip;I)V

    .line 475
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v0, v0, Lcom/astuetz/PagerSlidingTabStrip;->mDelegatePageListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v0, :cond_12

    .line 476
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip$PageListener;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    iget-object v0, v0, Lcom/astuetz/PagerSlidingTabStrip;->mDelegatePageListener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    invoke-interface {v0, p1}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 478
    :cond_12
    return-void
.end method
