.class Lorg/dmfs/android/view/ViewPager$ViewPositionComparator;
.super Ljava/lang/Object;
.source "ViewPager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/view/ViewPager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewPositionComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 2887
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/view/View;Landroid/view/View;)I
    .registers 7
    .param p1, "lhs"    # Landroid/view/View;
    .param p2, "rhs"    # Landroid/view/View;

    .prologue
    .line 2890
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 2891
    .local v0, "llp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lorg/dmfs/android/view/ViewPager$LayoutParams;

    .line 2892
    .local v1, "rlp":Lorg/dmfs/android/view/ViewPager$LayoutParams;
    iget-boolean v2, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    iget-boolean v3, v1, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    if-eq v2, v3, :cond_1a

    .line 2893
    iget-boolean v2, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->isDecor:Z

    if-eqz v2, :cond_18

    const/4 v2, 0x1

    .line 2895
    :goto_17
    return v2

    .line 2893
    :cond_18
    const/4 v2, -0x1

    goto :goto_17

    .line 2895
    :cond_1a
    iget v2, v0, Lorg/dmfs/android/view/ViewPager$LayoutParams;->position:I

    iget v3, v1, Lorg/dmfs/android/view/ViewPager$LayoutParams;->position:I

    sub-int/2addr v2, v3

    goto :goto_17
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 1
    check-cast p1, Landroid/view/View;

    check-cast p2, Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/android/view/ViewPager$ViewPositionComparator;->compare(Landroid/view/View;Landroid/view/View;)I

    move-result v0

    return v0
.end method
