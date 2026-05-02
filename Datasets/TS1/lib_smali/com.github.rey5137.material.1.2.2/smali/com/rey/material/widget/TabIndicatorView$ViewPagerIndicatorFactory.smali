.class public Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;
.super Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;
.source "TabIndicatorView.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/TabIndicatorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewPagerIndicatorFactory"
.end annotation


# instance fields
.field mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>(Landroid/support/v4/view/ViewPager;)V
    .registers 3
    .param p1, "vp"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 707
    invoke-direct {p0}, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;-><init>()V

    .line 708
    iput-object p1, p0, Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 709
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 710
    return-void
.end method


# virtual methods
.method public getCurrentTabIndicator()I
    .registers 2

    .prologue
    .line 739
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v0

    return v0
.end method

.method public getIcon(I)Landroid/graphics/drawable/Drawable;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 724
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTabIndicatorCount()I
    .registers 2

    .prologue
    .line 714
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getText(I)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 729
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public isIconTabIndicator(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 719
    const/4 v0, 0x0

    return v0
.end method

.method public onPageScrollStateChanged(I)V
    .registers 3
    .param p1, "state"    # I

    .prologue
    .line 754
    packed-switch p1, :pswitch_data_14

    .line 765
    :goto_3
    return-void

    .line 756
    :pswitch_4
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;->notifyTabScrollStateChanged(I)V

    goto :goto_3

    .line 759
    :pswitch_9
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;->notifyTabScrollStateChanged(I)V

    goto :goto_3

    .line 762
    :pswitch_e
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;->notifyTabScrollStateChanged(I)V

    goto :goto_3

    .line 754
    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_4
        :pswitch_9
        :pswitch_e
    .end packed-switch
.end method

.method public onPageScrolled(IFI)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 744
    invoke-virtual {p0, p1, p2}, Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;->notifyTabScrolled(IF)V

    .line 745
    return-void
.end method

.method public onPageSelected(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;->notifyTabSelected(I)V

    .line 750
    return-void
.end method

.method public onTabIndicatorSelected(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 734
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$ViewPagerIndicatorFactory;->mViewPager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 735
    return-void
.end method
