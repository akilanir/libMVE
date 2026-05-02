.class public Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;
.super Ljava/lang/Object;
.source "TabLayout.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/TabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TabLayoutOnPageChangeListener"
.end annotation


# instance fields
.field private mPreviousScrollState:I

.field private mScrollState:I

.field private final mTabLayoutRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/design/widget/TabLayout;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/design/widget/TabLayout;)V
    .registers 3
    .param p1, "tabLayout"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 1949
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1950
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mTabLayoutRef:Ljava/lang/ref/WeakReference;

    .line 1951
    return-void
.end method

.method static synthetic access$400(Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;

    .prologue
    .line 1944
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->reset()V

    return-void
.end method

.method private reset()V
    .registers 2

    .prologue
    .line 1991
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mScrollState:I

    iput v0, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mPreviousScrollState:I

    .line 1992
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .registers 3
    .param p1, "state"    # I

    .prologue
    .line 1955
    iget v0, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mScrollState:I

    iput v0, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mPreviousScrollState:I

    .line 1956
    iput p1, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mScrollState:I

    .line 1957
    return-void
.end method

.method public onPageScrolled(IFI)V
    .registers 11
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    const/4 v6, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 1962
    iget-object v5, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mTabLayoutRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/TabLayout;

    .line 1963
    .local v0, "tabLayout":Landroid/support/design/widget/TabLayout;
    if-eqz v0, :cond_22

    .line 1966
    iget v5, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mScrollState:I

    if-ne v5, v6, :cond_15

    iget v5, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mPreviousScrollState:I

    if-ne v5, v4, :cond_23

    :cond_15
    move v2, v4

    .line 1971
    .local v2, "updateText":Z
    :goto_16
    iget v5, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mScrollState:I

    if-ne v5, v6, :cond_1e

    iget v5, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mPreviousScrollState:I

    if-eqz v5, :cond_25

    :cond_1e
    move v1, v4

    .line 1973
    .local v1, "updateIndicator":Z
    :goto_1f
    # invokes: Landroid/support/design/widget/TabLayout;->setScrollPosition(IFZZ)V
    invoke-static {v0, p1, p2, v2, v1}, Landroid/support/design/widget/TabLayout;->access$2700(Landroid/support/design/widget/TabLayout;IFZZ)V

    .line 1975
    .end local v1    # "updateIndicator":Z
    .end local v2    # "updateText":Z
    :cond_22
    return-void

    :cond_23
    move v2, v3

    .line 1966
    goto :goto_16

    .restart local v2    # "updateText":Z
    :cond_25
    move v1, v3

    .line 1971
    goto :goto_1f
.end method

.method public onPageSelected(I)V
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 1979
    iget-object v2, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mTabLayoutRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/TabLayout;

    .line 1980
    .local v0, "tabLayout":Landroid/support/design/widget/TabLayout;
    if-eqz v0, :cond_25

    invoke-virtual {v0}, Landroid/support/design/widget/TabLayout;->getSelectedTabPosition()I

    move-result v2

    if-eq v2, p1, :cond_25

    .line 1983
    iget v2, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mScrollState:I

    if-eqz v2, :cond_1d

    iget v2, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mScrollState:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_26

    iget v2, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mPreviousScrollState:I

    if-nez v2, :cond_26

    :cond_1d
    const/4 v1, 0x1

    .line 1986
    .local v1, "updateIndicator":Z
    :goto_1e
    invoke-virtual {v0, p1}, Landroid/support/design/widget/TabLayout;->getTabAt(I)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/support/design/widget/TabLayout;->selectTab(Landroid/support/design/widget/TabLayout$Tab;Z)V

    .line 1988
    .end local v1    # "updateIndicator":Z
    :cond_25
    return-void

    .line 1983
    :cond_26
    const/4 v1, 0x0

    goto :goto_1e
.end method
