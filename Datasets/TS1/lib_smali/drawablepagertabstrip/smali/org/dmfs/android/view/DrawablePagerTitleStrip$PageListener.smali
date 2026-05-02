.class Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;
.super Landroid/database/DataSetObserver;
.source "DrawablePagerTitleStrip.java"

# interfaces
.implements Lorg/dmfs/android/view/ViewPager$OnPageChangeListener;
.implements Lorg/dmfs/android/view/ViewPager$OnAdapterChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/view/DrawablePagerTitleStrip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PageListener"
.end annotation


# instance fields
.field private mScrollState:I

.field final synthetic this$0:Lorg/dmfs/android/view/DrawablePagerTitleStrip;


# direct methods
.method private constructor <init>(Lorg/dmfs/android/view/DrawablePagerTitleStrip;)V
    .registers 2

    .prologue
    .line 473
    iput-object p1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;->this$0:Lorg/dmfs/android/view/DrawablePagerTitleStrip;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/view/DrawablePagerTitleStrip;Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;)V
    .registers 3

    .prologue
    .line 473
    invoke-direct {p0, p1}, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;-><init>(Lorg/dmfs/android/view/DrawablePagerTitleStrip;)V

    return-void
.end method


# virtual methods
.method public onAdapterChanged(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V
    .registers 4
    .param p1, "oldAdapter"    # Landroid/support/v4/view/PagerAdapter;
    .param p2, "newAdapter"    # Landroid/support/v4/view/PagerAdapter;

    .prologue
    .line 515
    iget-object v0, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;->this$0:Lorg/dmfs/android/view/DrawablePagerTitleStrip;

    invoke-virtual {v0, p1, p2}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    .line 516
    return-void
.end method

.method public onChanged()V
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 522
    iget-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;->this$0:Lorg/dmfs/android/view/DrawablePagerTitleStrip;

    iget-object v2, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;->this$0:Lorg/dmfs/android/view/DrawablePagerTitleStrip;

    iget-object v2, v2, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    invoke-virtual {v2}, Lorg/dmfs/android/view/ViewPager;->getCurrentItem()I

    move-result v2

    iget-object v3, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;->this$0:Lorg/dmfs/android/view/DrawablePagerTitleStrip;

    iget-object v3, v3, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    invoke-virtual {v3}, Lorg/dmfs/android/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->updateImages(ILandroid/support/v4/view/PagerAdapter;)V

    .line 524
    iget-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;->this$0:Lorg/dmfs/android/view/DrawablePagerTitleStrip;

    # getter for: Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownPositionOffset:F
    invoke-static {v1}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->access$0(Lorg/dmfs/android/view/DrawablePagerTitleStrip;)F

    move-result v1

    cmpl-float v1, v1, v0

    if-ltz v1, :cond_26

    iget-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;->this$0:Lorg/dmfs/android/view/DrawablePagerTitleStrip;

    # getter for: Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mLastKnownPositionOffset:F
    invoke-static {v1}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->access$0(Lorg/dmfs/android/view/DrawablePagerTitleStrip;)F

    move-result v0

    .line 525
    .local v0, "offset":F
    :cond_26
    iget-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;->this$0:Lorg/dmfs/android/view/DrawablePagerTitleStrip;

    iget-object v2, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;->this$0:Lorg/dmfs/android/view/DrawablePagerTitleStrip;

    iget-object v2, v2, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    invoke-virtual {v2}, Lorg/dmfs/android/view/ViewPager;->getCurrentItem()I

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->updateDrawablePositions(IFZ)V

    .line 526
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .registers 2
    .param p1, "state"    # I

    .prologue
    .line 508
    iput p1, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;->mScrollState:I

    .line 509
    return-void
.end method

.method public onPageScrolled(IFI)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 481
    const/high16 v0, 0x3f000000    # 0.5f

    cmpl-float v0, p2, v0

    if-lez v0, :cond_8

    .line 484
    add-int/lit8 p1, p1, 0x1

    .line 486
    :cond_8
    iget-object v0, p0, Lorg/dmfs/android/view/DrawablePagerTitleStrip$PageListener;->this$0:Lorg/dmfs/android/view/DrawablePagerTitleStrip;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lorg/dmfs/android/view/DrawablePagerTitleStrip;->updateDrawablePositions(IFZ)V

    .line 487
    return-void
.end method

.method public onPageSelected(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 502
    return-void
.end method
