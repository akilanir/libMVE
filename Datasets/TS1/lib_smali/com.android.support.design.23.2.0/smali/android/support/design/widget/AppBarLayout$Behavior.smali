.class public Landroid/support/design/widget/AppBarLayout$Behavior;
.super Landroid/support/design/widget/HeaderBehavior;
.source "AppBarLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/AppBarLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Behavior"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;,
        Landroid/support/design/widget/AppBarLayout$Behavior$DragCallback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/design/widget/HeaderBehavior",
        "<",
        "Landroid/support/design/widget/AppBarLayout;",
        ">;"
    }
.end annotation


# static fields
.field private static final ANIMATE_OFFSET_DIPS_PER_SECOND:I = 0x12c

.field private static final INVALID_POSITION:I = -0x1


# instance fields
.field private mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

.field private mLastNestedScrollingChildRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mOffsetDelta:I

.field private mOffsetToChildIndexOnLayout:I

.field private mOffsetToChildIndexOnLayoutIsMinHeight:Z

.field private mOffsetToChildIndexOnLayoutPerc:F

.field private mOnDragCallback:Landroid/support/design/widget/AppBarLayout$Behavior$DragCallback;

.field private mSkipNestedPreScroll:Z

.field private mWasNestedFlung:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 676
    invoke-direct {p0}, Landroid/support/design/widget/HeaderBehavior;-><init>()V

    .line 669
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    .line 676
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 679
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/HeaderBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 669
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    .line 680
    return-void
.end method

.method static synthetic access$1000(Landroid/support/design/widget/AppBarLayout$Behavior;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/AppBarLayout$Behavior;

    .prologue
    .line 642
    iget v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetDelta:I

    return v0
.end method

.method private animateOffsetTo(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)V
    .registers 9
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "offset"    # I

    .prologue
    .line 802
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v0

    .line 803
    .local v0, "currentOffset":I
    if-ne v0, p3, :cond_18

    .line 804
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    if-eqz v2, :cond_17

    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v2}, Landroid/support/design/widget/ValueAnimatorCompat;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 805
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v2}, Landroid/support/design/widget/ValueAnimatorCompat;->cancel()V

    .line 831
    :cond_17
    :goto_17
    return-void

    .line 810
    :cond_18
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    if-nez v2, :cond_60

    .line 811
    invoke-static {}, Landroid/support/design/widget/ViewUtils;->createAnimator()Landroid/support/design/widget/ValueAnimatorCompat;

    move-result-object v2

    iput-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    .line 812
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    sget-object v3, Landroid/support/design/widget/AnimationUtils;->DECELERATE_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v2, v3}, Landroid/support/design/widget/ValueAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 813
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    new-instance v3, Landroid/support/design/widget/AppBarLayout$Behavior$1;

    invoke-direct {v3, p0, p1, p2}, Landroid/support/design/widget/AppBarLayout$Behavior$1;-><init>(Landroid/support/design/widget/AppBarLayout$Behavior;Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)V

    invoke-virtual {v2, v3}, Landroid/support/design/widget/ValueAnimatorCompat;->setUpdateListener(Landroid/support/design/widget/ValueAnimatorCompat$AnimatorUpdateListener;)V

    .line 825
    :goto_33
    sub-int v2, v0, p3

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/support/design/widget/CoordinatorLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    div-float v1, v2, v3

    .line 827
    .local v1, "distanceDp":F
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    const/high16 v3, 0x447a0000    # 1000.0f

    mul-float/2addr v3, v1

    const/high16 v4, 0x43960000    # 300.0f

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/design/widget/ValueAnimatorCompat;->setDuration(I)V

    .line 829
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v2, v0, p3}, Landroid/support/design/widget/ValueAnimatorCompat;->setIntValues(II)V

    .line 830
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v2}, Landroid/support/design/widget/ValueAnimatorCompat;->start()V

    goto :goto_17

    .line 821
    .end local v1    # "distanceDp":F
    :cond_60
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v2}, Landroid/support/design/widget/ValueAnimatorCompat;->cancel()V

    goto :goto_33
.end method

.method private dispatchOffsetUpdates(Landroid/support/design/widget/AppBarLayout;)V
    .registers 7
    .param p1, "layout"    # Landroid/support/design/widget/AppBarLayout;

    .prologue
    .line 993
    # getter for: Landroid/support/design/widget/AppBarLayout;->mListeners:Ljava/util/List;
    invoke-static {p1}, Landroid/support/design/widget/AppBarLayout;->access$800(Landroid/support/design/widget/AppBarLayout;)Ljava/util/List;

    move-result-object v2

    .line 997
    .local v2, "listeners":Ljava/util/List;, "Ljava/util/List<Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "z":I
    :goto_9
    if-ge v0, v3, :cond_1d

    .line 998
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    .line 999
    .local v1, "listener":Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;
    if-eqz v1, :cond_1a

    .line 1000
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopAndBottomOffset()I

    move-result v4

    invoke-interface {v1, p1, v4}, Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;->onOffsetChanged(Landroid/support/design/widget/AppBarLayout;I)V

    .line 997
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 1003
    .end local v1    # "listener":Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;
    :cond_1d
    return-void
.end method

.method private getChildOnOffset(Landroid/support/design/widget/AppBarLayout;I)Landroid/view/View;
    .registers 8
    .param p1, "abl"    # Landroid/support/design/widget/AppBarLayout;
    .param p2, "offset"    # I

    .prologue
    .line 834
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p1}, Landroid/support/design/widget/AppBarLayout;->getChildCount()I

    move-result v1

    .local v1, "count":I
    :goto_5
    if-ge v2, v1, :cond_1d

    .line 835
    invoke-virtual {p1, v2}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 836
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    neg-int v4, p2

    if-gt v3, v4, :cond_1a

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v3

    neg-int v4, p2

    if-lt v3, v4, :cond_1a

    .line 840
    .end local v0    # "child":Landroid/view/View;
    :goto_19
    return-object v0

    .line 834
    .restart local v0    # "child":Landroid/view/View;
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 840
    .end local v0    # "child":Landroid/view/View;
    :cond_1d
    const/4 v0, 0x0

    goto :goto_19
.end method

.method private interpolateOffset(Landroid/support/design/widget/AppBarLayout;I)I
    .registers 16
    .param p1, "layout"    # Landroid/support/design/widget/AppBarLayout;
    .param p2, "offset"    # I

    .prologue
    .line 1006
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 1008
    .local v0, "absOffset":I
    const/4 v5, 0x0

    .local v5, "i":I
    invoke-virtual {p1}, Landroid/support/design/widget/AppBarLayout;->getChildCount()I

    move-result v9

    .local v9, "z":I
    :goto_9
    if-ge v5, v9, :cond_6f

    .line 1009
    invoke-virtual {p1, v5}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1010
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    .line 1011
    .local v2, "childLp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    invoke-virtual {v2}, Landroid/support/design/widget/AppBarLayout$LayoutParams;->getScrollInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v7

    .line 1013
    .local v7, "interpolator":Landroid/view/animation/Interpolator;
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v10

    if-lt v0, v10, :cond_70

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v10

    if-gt v0, v10, :cond_70

    .line 1014
    if-eqz v7, :cond_6f

    .line 1015
    const/4 v3, 0x0

    .line 1016
    .local v3, "childScrollableHeight":I
    invoke-virtual {v2}, Landroid/support/design/widget/AppBarLayout$LayoutParams;->getScrollFlags()I

    move-result v4

    .line 1017
    .local v4, "flags":I
    and-int/lit8 v10, v4, 0x1

    if-eqz v10, :cond_44

    .line 1019
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v10

    iget v11, v2, Landroid/support/design/widget/AppBarLayout$LayoutParams;->topMargin:I

    add-int/2addr v10, v11

    iget v11, v2, Landroid/support/design/widget/AppBarLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v10, v11

    add-int/2addr v3, v10

    .line 1022
    and-int/lit8 v10, v4, 0x2

    if-eqz v10, :cond_44

    .line 1025
    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v10

    sub-int/2addr v3, v10

    .line 1029
    :cond_44
    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v10

    if-eqz v10, :cond_4f

    .line 1030
    # invokes: Landroid/support/design/widget/AppBarLayout;->getTopInset()I
    invoke-static {p1}, Landroid/support/design/widget/AppBarLayout;->access$900(Landroid/support/design/widget/AppBarLayout;)I

    move-result v10

    sub-int/2addr v3, v10

    .line 1033
    :cond_4f
    if-lez v3, :cond_6f

    .line 1034
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v10

    sub-int v8, v0, v10

    .line 1035
    .local v8, "offsetForView":I
    int-to-float v10, v3

    int-to-float v11, v8

    int-to-float v12, v3

    div-float/2addr v11, v12

    invoke-interface {v7, v11}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v11

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 1039
    .local v6, "interpolatedDiff":I
    invoke-static {p2}, Ljava/lang/Integer;->signum(I)I

    move-result v10

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v11

    add-int/2addr v11, v6

    mul-int p2, v10, v11

    .line 1049
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "childLp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    .end local v3    # "childScrollableHeight":I
    .end local v4    # "flags":I
    .end local v6    # "interpolatedDiff":I
    .end local v7    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v8    # "offsetForView":I
    .end local p2    # "offset":I
    :cond_6f
    return p2

    .line 1008
    .restart local v1    # "child":Landroid/view/View;
    .restart local v2    # "childLp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    .restart local v7    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local p2    # "offset":I
    :cond_70
    add-int/lit8 v5, v5, 0x1

    goto :goto_9
.end method

.method private snapToChildIfNeeded(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)V
    .registers 11
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "abl"    # Landroid/support/design/widget/AppBarLayout;

    .prologue
    .line 844
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v4

    .line 845
    .local v4, "offset":I
    invoke-direct {p0, p2, v4}, Landroid/support/design/widget/AppBarLayout$Behavior;->getChildOnOffset(Landroid/support/design/widget/AppBarLayout;I)Landroid/view/View;

    move-result-object v5

    .line 846
    .local v5, "offsetChild":Landroid/view/View;
    if-eqz v5, :cond_46

    .line 847
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    .line 848
    .local v2, "lp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    invoke-virtual {v2}, Landroid/support/design/widget/AppBarLayout$LayoutParams;->getScrollFlags()I

    move-result v6

    and-int/lit8 v6, v6, 0x11

    const/16 v7, 0x11

    if-ne v6, v7, :cond_46

    .line 850
    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v6

    neg-int v1, v6

    .line 851
    .local v1, "childTop":I
    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    move-result v6

    neg-int v0, v6

    .line 854
    .local v0, "childBottom":I
    invoke-virtual {v2}, Landroid/support/design/widget/AppBarLayout$LayoutParams;->getScrollFlags()I

    move-result v6

    and-int/lit8 v6, v6, 0x2

    const/4 v7, 0x2

    if-ne v6, v7, :cond_32

    .line 856
    invoke-static {v5}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v6

    add-int/2addr v0, v6

    .line 859
    :cond_32
    add-int v6, v0, v1

    div-int/lit8 v6, v6, 0x2

    if-ge v4, v6, :cond_47

    move v3, v0

    .line 861
    .local v3, "newOffset":I
    :goto_39
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v6

    neg-int v6, v6

    const/4 v7, 0x0

    invoke-static {v3, v6, v7}, Landroid/support/design/widget/MathUtils;->constrain(III)I

    move-result v6

    invoke-direct {p0, p1, p2, v6}, Landroid/support/design/widget/AppBarLayout$Behavior;->animateOffsetTo(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)V

    .line 865
    .end local v0    # "childBottom":I
    .end local v1    # "childTop":I
    .end local v2    # "lp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    .end local v3    # "newOffset":I
    :cond_46
    return-void

    .restart local v0    # "childBottom":I
    .restart local v1    # "childTop":I
    .restart local v2    # "lp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    :cond_47
    move v3, v1

    .line 859
    goto :goto_39
.end method


# virtual methods
.method canDragView(Landroid/support/design/widget/AppBarLayout;)Z
    .registers 5
    .param p1, "view"    # Landroid/support/design/widget/AppBarLayout;

    .prologue
    const/4 v1, 0x1

    .line 917
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOnDragCallback:Landroid/support/design/widget/AppBarLayout$Behavior$DragCallback;

    if-eqz v2, :cond_c

    .line 919
    iget-object v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOnDragCallback:Landroid/support/design/widget/AppBarLayout$Behavior$DragCallback;

    invoke-virtual {v1, p1}, Landroid/support/design/widget/AppBarLayout$Behavior$DragCallback;->canDrag(Landroid/support/design/widget/AppBarLayout;)Z

    move-result v1

    .line 930
    :cond_b
    :goto_b
    return v1

    .line 923
    :cond_c
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mLastNestedScrollingChildRef:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_b

    .line 925
    iget-object v2, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mLastNestedScrollingChildRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 926
    .local v0, "scrollingView":Landroid/view/View;
    if-eqz v0, :cond_27

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v2

    if-eqz v2, :cond_27

    const/4 v2, -0x1

    invoke-static {v0, v2}, Landroid/support/v4/view/ViewCompat;->canScrollVertically(Landroid/view/View;I)Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_27
    const/4 v1, 0x0

    goto :goto_b
.end method

.method bridge synthetic canDragView(Landroid/view/View;)Z
    .registers 3

    .prologue
    .line 642
    check-cast p1, Landroid/support/design/widget/AppBarLayout;

    invoke-virtual {p0, p1}, Landroid/support/design/widget/AppBarLayout$Behavior;->canDragView(Landroid/support/design/widget/AppBarLayout;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic getLeftAndRightOffset()I
    .registers 2

    .prologue
    .line 642
    invoke-super {p0}, Landroid/support/design/widget/HeaderBehavior;->getLeftAndRightOffset()I

    move-result v0

    return v0
.end method

.method getMaxDragOffset(Landroid/support/design/widget/AppBarLayout;)I
    .registers 3
    .param p1, "view"    # Landroid/support/design/widget/AppBarLayout;

    .prologue
    .line 942
    # invokes: Landroid/support/design/widget/AppBarLayout;->getDownNestedScrollRange()I
    invoke-static {p1}, Landroid/support/design/widget/AppBarLayout;->access$400(Landroid/support/design/widget/AppBarLayout;)I

    move-result v0

    neg-int v0, v0

    return v0
.end method

.method bridge synthetic getMaxDragOffset(Landroid/view/View;)I
    .registers 3

    .prologue
    .line 642
    check-cast p1, Landroid/support/design/widget/AppBarLayout;

    invoke-virtual {p0, p1}, Landroid/support/design/widget/AppBarLayout$Behavior;->getMaxDragOffset(Landroid/support/design/widget/AppBarLayout;)I

    move-result v0

    return v0
.end method

.method getScrollRangeForDragFling(Landroid/support/design/widget/AppBarLayout;)I
    .registers 3
    .param p1, "view"    # Landroid/support/design/widget/AppBarLayout;

    .prologue
    .line 947
    invoke-virtual {p1}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    return v0
.end method

.method bridge synthetic getScrollRangeForDragFling(Landroid/view/View;)I
    .registers 3

    .prologue
    .line 642
    check-cast p1, Landroid/support/design/widget/AppBarLayout;

    invoke-virtual {p0, p1}, Landroid/support/design/widget/AppBarLayout$Behavior;->getScrollRangeForDragFling(Landroid/support/design/widget/AppBarLayout;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic getTopAndBottomOffset()I
    .registers 2

    .prologue
    .line 642
    invoke-super {p0}, Landroid/support/design/widget/HeaderBehavior;->getTopAndBottomOffset()I

    move-result v0

    return v0
.end method

.method getTopBottomOffsetForScrollingSibling()I
    .registers 3

    .prologue
    .line 1054
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopAndBottomOffset()I

    move-result v0

    iget v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetDelta:I

    add-int/2addr v0, v1

    return v0
.end method

.method onFlingFinished(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)V
    .registers 3
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "layout"    # Landroid/support/design/widget/AppBarLayout;

    .prologue
    .line 937
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/AppBarLayout$Behavior;->snapToChildIfNeeded(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)V

    .line 938
    return-void
.end method

.method bridge synthetic onFlingFinished(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)V
    .registers 3

    .prologue
    .line 642
    check-cast p2, Landroid/support/design/widget/AppBarLayout;

    invoke-virtual {p0, p1, p2}, Landroid/support/design/widget/AppBarLayout$Behavior;->onFlingFinished(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)V

    return-void
.end method

.method public onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)Z
    .registers 12
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "abl"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "layoutDirection"    # I

    .prologue
    const/4 v5, 0x0

    .line 870
    invoke-super {p0, p1, p2, p3}, Landroid/support/design/widget/HeaderBehavior;->onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)Z

    move-result v2

    .line 872
    .local v2, "handled":Z
    # invokes: Landroid/support/design/widget/AppBarLayout;->getPendingAction()I
    invoke-static {p2}, Landroid/support/design/widget/AppBarLayout;->access$500(Landroid/support/design/widget/AppBarLayout;)I

    move-result v4

    .line 873
    .local v4, "pendingAction":I
    if-eqz v4, :cond_4c

    .line 874
    and-int/lit8 v6, v4, 0x4

    if-eqz v6, :cond_38

    const/4 v0, 0x1

    .line 875
    .local v0, "animate":Z
    :goto_10
    and-int/lit8 v6, v4, 0x2

    if-eqz v6, :cond_3e

    .line 876
    # invokes: Landroid/support/design/widget/AppBarLayout;->getUpNestedPreScrollRange()I
    invoke-static {p2}, Landroid/support/design/widget/AppBarLayout;->access$300(Landroid/support/design/widget/AppBarLayout;)I

    move-result v6

    neg-int v3, v6

    .line 877
    .local v3, "offset":I
    if-eqz v0, :cond_3a

    .line 878
    invoke-direct {p0, p1, p2, v3}, Landroid/support/design/widget/AppBarLayout$Behavior;->animateOffsetTo(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)V

    .line 901
    .end local v0    # "animate":Z
    .end local v3    # "offset":I
    :cond_1e
    :goto_1e
    # invokes: Landroid/support/design/widget/AppBarLayout;->resetPendingAction()V
    invoke-static {p2}, Landroid/support/design/widget/AppBarLayout;->access$600(Landroid/support/design/widget/AppBarLayout;)V

    .line 902
    const/4 v6, -0x1

    iput v6, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    .line 906
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopAndBottomOffset()I

    move-result v6

    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v7

    neg-int v7, v7

    invoke-static {v6, v7, v5}, Landroid/support/design/widget/MathUtils;->constrain(III)I

    move-result v5

    invoke-virtual {p0, v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->setTopAndBottomOffset(I)Z

    .line 910
    invoke-direct {p0, p2}, Landroid/support/design/widget/AppBarLayout$Behavior;->dispatchOffsetUpdates(Landroid/support/design/widget/AppBarLayout;)V

    .line 912
    return v2

    :cond_38
    move v0, v5

    .line 874
    goto :goto_10

    .line 880
    .restart local v0    # "animate":Z
    .restart local v3    # "offset":I
    :cond_3a
    invoke-virtual {p0, p1, p2, v3}, Landroid/support/design/widget/AppBarLayout$Behavior;->setHeaderTopBottomOffset(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)I

    goto :goto_1e

    .line 882
    .end local v3    # "offset":I
    :cond_3e
    and-int/lit8 v6, v4, 0x1

    if-eqz v6, :cond_1e

    .line 883
    if-eqz v0, :cond_48

    .line 884
    invoke-direct {p0, p1, p2, v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->animateOffsetTo(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)V

    goto :goto_1e

    .line 886
    :cond_48
    invoke-virtual {p0, p1, p2, v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->setHeaderTopBottomOffset(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)I

    goto :goto_1e

    .line 889
    .end local v0    # "animate":Z
    :cond_4c
    iget v6, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    if-ltz v6, :cond_1e

    .line 890
    iget v6, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    invoke-virtual {p2, v6}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 891
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v6

    neg-int v3, v6

    .line 892
    .restart local v3    # "offset":I
    iget-boolean v6, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayoutIsMinHeight:Z

    if-eqz v6, :cond_68

    .line 893
    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v6

    add-int/2addr v3, v6

    .line 897
    :goto_64
    invoke-virtual {p0, v3}, Landroid/support/design/widget/AppBarLayout$Behavior;->setTopAndBottomOffset(I)Z

    goto :goto_1e

    .line 895
    :cond_68
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    iget v7, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayoutPerc:F

    mul-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    add-int/2addr v3, v6

    goto :goto_64
.end method

.method public bridge synthetic onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .registers 5

    .prologue
    .line 642
    check-cast p2, Landroid/support/design/widget/AppBarLayout;

    invoke-virtual {p0, p1, p2, p3}, Landroid/support/design/widget/AppBarLayout$Behavior;->onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)Z

    move-result v0

    return v0
.end method

.method public onNestedFling(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;FFZ)Z
    .registers 15
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "target"    # Landroid/view/View;
    .param p4, "velocityX"    # F
    .param p5, "velocityY"    # F
    .param p6, "consumed"    # Z

    .prologue
    .line 756
    const/4 v6, 0x0

    .line 758
    .local v6, "flung":Z
    if-nez p6, :cond_14

    .line 760
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    neg-int v3, v0

    const/4 v4, 0x0

    neg-float v5, p5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->fling(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;IIF)Z

    move-result v6

    .line 787
    :cond_11
    :goto_11
    iput-boolean v6, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mWasNestedFlung:Z

    .line 788
    return v6

    .line 765
    :cond_14
    const/4 v0, 0x0

    cmpg-float v0, p5, v0

    if-gez v0, :cond_2f

    .line 767
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    neg-int v0, v0

    # invokes: Landroid/support/design/widget/AppBarLayout;->getDownNestedPreScrollRange()I
    invoke-static {p2}, Landroid/support/design/widget/AppBarLayout;->access$200(Landroid/support/design/widget/AppBarLayout;)I

    move-result v1

    add-int v7, v0, v1

    .line 769
    .local v7, "targetScroll":I
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v0

    if-ge v0, v7, :cond_11

    .line 772
    invoke-direct {p0, p1, p2, v7}, Landroid/support/design/widget/AppBarLayout$Behavior;->animateOffsetTo(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)V

    .line 773
    const/4 v6, 0x1

    goto :goto_11

    .line 777
    .end local v7    # "targetScroll":I
    :cond_2f
    # invokes: Landroid/support/design/widget/AppBarLayout;->getUpNestedPreScrollRange()I
    invoke-static {p2}, Landroid/support/design/widget/AppBarLayout;->access$300(Landroid/support/design/widget/AppBarLayout;)I

    move-result v0

    neg-int v7, v0

    .line 778
    .restart local v7    # "targetScroll":I
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v0

    if-le v0, v7, :cond_11

    .line 781
    invoke-direct {p0, p1, p2, v7}, Landroid/support/design/widget/AppBarLayout$Behavior;->animateOffsetTo(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)V

    .line 782
    const/4 v6, 0x1

    goto :goto_11
.end method

.method public bridge synthetic onNestedFling(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FFZ)Z
    .registers 14

    .prologue
    .line 642
    move-object v2, p2

    check-cast v2, Landroid/support/design/widget/AppBarLayout;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Landroid/support/design/widget/AppBarLayout$Behavior;->onNestedFling(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;FFZ)Z

    move-result v0

    return v0
.end method

.method public onNestedPreScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;II[I)V
    .registers 14
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "target"    # Landroid/view/View;
    .param p4, "dx"    # I
    .param p5, "dy"    # I
    .param p6, "consumed"    # [I

    .prologue
    .line 705
    if-eqz p5, :cond_1e

    iget-boolean v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mSkipNestedPreScroll:Z

    if-nez v0, :cond_1e

    .line 707
    if-gez p5, :cond_1f

    .line 709
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    neg-int v4, v0

    .line 710
    .local v4, "min":I
    # invokes: Landroid/support/design/widget/AppBarLayout;->getDownNestedPreScrollRange()I
    invoke-static {p2}, Landroid/support/design/widget/AppBarLayout;->access$200(Landroid/support/design/widget/AppBarLayout;)I

    move-result v0

    add-int v5, v4, v0

    .line 716
    .local v5, "max":I
    :goto_13
    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p5

    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->scroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;III)I

    move-result v0

    aput v0, p6, v6

    .line 718
    .end local v4    # "min":I
    .end local v5    # "max":I
    :cond_1e
    return-void

    .line 713
    :cond_1f
    # invokes: Landroid/support/design/widget/AppBarLayout;->getUpNestedPreScrollRange()I
    invoke-static {p2}, Landroid/support/design/widget/AppBarLayout;->access$300(Landroid/support/design/widget/AppBarLayout;)I

    move-result v0

    neg-int v4, v0

    .line 714
    .restart local v4    # "min":I
    const/4 v5, 0x0

    .restart local v5    # "max":I
    goto :goto_13
.end method

.method public bridge synthetic onNestedPreScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[I)V
    .registers 14

    .prologue
    .line 642
    move-object v2, p2

    check-cast v2, Landroid/support/design/widget/AppBarLayout;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Landroid/support/design/widget/AppBarLayout$Behavior;->onNestedPreScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;II[I)V

    return-void
.end method

.method public onNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;IIII)V
    .registers 14
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "target"    # Landroid/view/View;
    .param p4, "dxConsumed"    # I
    .param p5, "dyConsumed"    # I
    .param p6, "dxUnconsumed"    # I
    .param p7, "dyUnconsumed"    # I

    .prologue
    const/4 v5, 0x0

    .line 724
    if-gez p7, :cond_13

    .line 727
    # invokes: Landroid/support/design/widget/AppBarLayout;->getDownNestedScrollRange()I
    invoke-static {p2}, Landroid/support/design/widget/AppBarLayout;->access$400(Landroid/support/design/widget/AppBarLayout;)I

    move-result v0

    neg-int v4, v0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p7

    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->scroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;III)I

    .line 730
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mSkipNestedPreScroll:Z

    .line 735
    :goto_12
    return-void

    .line 733
    :cond_13
    iput-boolean v5, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mSkipNestedPreScroll:Z

    goto :goto_12
.end method

.method public bridge synthetic onNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;IIII)V
    .registers 16

    .prologue
    .line 642
    move-object v2, p2

    check-cast v2, Landroid/support/design/widget/AppBarLayout;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move v7, p7

    invoke-virtual/range {v0 .. v7}, Landroid/support/design/widget/AppBarLayout$Behavior;->onNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;IIII)V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/os/Parcelable;)V
    .registers 6
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "appBarLayout"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 1084
    instance-of v1, p3, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;

    if-eqz v1, :cond_1b

    move-object v0, p3

    .line 1085
    check-cast v0, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;

    .line 1086
    .local v0, "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    invoke-virtual {v0}, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, p1, p2, v1}, Landroid/support/design/widget/HeaderBehavior;->onRestoreInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    .line 1087
    iget v1, v0, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibleChildIndex:I

    iput v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    .line 1088
    iget v1, v0, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibileChildPercentageShown:F

    iput v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayoutPerc:F

    .line 1089
    iget-boolean v1, v0, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibileChildAtMinimumHeight:Z

    iput-boolean v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayoutIsMinHeight:Z

    .line 1094
    .end local v0    # "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    :goto_1a
    return-void

    .line 1091
    :cond_1b
    invoke-super {p0, p1, p2, p3}, Landroid/support/design/widget/HeaderBehavior;->onRestoreInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    .line 1092
    const/4 v1, -0x1

    iput v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    goto :goto_1a
.end method

.method public bridge synthetic onRestoreInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V
    .registers 4

    .prologue
    .line 642
    check-cast p2, Landroid/support/design/widget/AppBarLayout;

    invoke-virtual {p0, p1, p2, p3}, Landroid/support/design/widget/AppBarLayout$Behavior;->onRestoreInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/os/Parcelable;)V

    return-void
.end method

.method public onSaveInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)Landroid/os/Parcelable;
    .registers 12
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "appBarLayout"    # Landroid/support/design/widget/AppBarLayout;

    .prologue
    .line 1059
    invoke-super {p0, p1, p2}, Landroid/support/design/widget/HeaderBehavior;->onSaveInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;

    move-result-object v5

    .line 1060
    .local v5, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopAndBottomOffset()I

    move-result v3

    .line 1063
    .local v3, "offset":I
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getChildCount()I

    move-result v1

    .local v1, "count":I
    :goto_d
    if-ge v2, v1, :cond_41

    .line 1064
    invoke-virtual {p2, v2}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1065
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v7

    add-int v6, v7, v3

    .line 1067
    .local v6, "visBottom":I
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v7

    add-int/2addr v7, v3

    if-gtz v7, :cond_3e

    if-ltz v6, :cond_3e

    .line 1068
    new-instance v4, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;

    invoke-direct {v4, v5}, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1069
    .local v4, "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    iput v2, v4, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibleChildIndex:I

    .line 1070
    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v7

    if-ne v6, v7, :cond_3c

    const/4 v7, 0x1

    :goto_30
    iput-boolean v7, v4, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibileChildAtMinimumHeight:Z

    .line 1072
    int-to-float v7, v6

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v7, v8

    iput v7, v4, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibileChildPercentageShown:F

    .line 1078
    .end local v0    # "child":Landroid/view/View;
    .end local v4    # "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    .end local v6    # "visBottom":I
    :goto_3b
    return-object v4

    .line 1070
    .restart local v0    # "child":Landroid/view/View;
    .restart local v4    # "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    .restart local v6    # "visBottom":I
    :cond_3c
    const/4 v7, 0x0

    goto :goto_30

    .line 1063
    .end local v4    # "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    :cond_3e
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .end local v0    # "child":Landroid/view/View;
    .end local v6    # "visBottom":I
    :cond_41
    move-object v4, v5

    .line 1078
    goto :goto_3b
.end method

.method public bridge synthetic onSaveInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 642
    check-cast p2, Landroid/support/design/widget/AppBarLayout;

    invoke-virtual {p0, p1, p2}, Landroid/support/design/widget/AppBarLayout$Behavior;->onSaveInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)Landroid/os/Parcelable;

    move-result-object v0

    return-object v0
.end method

.method public onStartNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;Landroid/view/View;I)Z
    .registers 9
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "directTargetChild"    # Landroid/view/View;
    .param p4, "target"    # Landroid/view/View;
    .param p5, "nestedScrollAxes"    # I

    .prologue
    .line 687
    and-int/lit8 v1, p5, 0x2

    if-eqz v1, :cond_29

    # invokes: Landroid/support/design/widget/AppBarLayout;->hasScrollableChildren()Z
    invoke-static {p2}, Landroid/support/design/widget/AppBarLayout;->access$100(Landroid/support/design/widget/AppBarLayout;)Z

    move-result v1

    if-eqz v1, :cond_29

    invoke-virtual {p1}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v1

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getHeight()I

    move-result v2

    if-gt v1, v2, :cond_29

    const/4 v0, 0x1

    .line 691
    .local v0, "started":Z
    :goto_1a
    if-eqz v0, :cond_25

    iget-object v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    if-eqz v1, :cond_25

    .line 693
    iget-object v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v1}, Landroid/support/design/widget/ValueAnimatorCompat;->cancel()V

    .line 697
    :cond_25
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mLastNestedScrollingChildRef:Ljava/lang/ref/WeakReference;

    .line 699
    return v0

    .line 687
    .end local v0    # "started":Z
    :cond_29
    const/4 v0, 0x0

    goto :goto_1a
.end method

.method public bridge synthetic onStartNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;I)Z
    .registers 12

    .prologue
    .line 642
    move-object v2, p2

    check-cast v2, Landroid/support/design/widget/AppBarLayout;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->onStartNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public onStopNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;)V
    .registers 6
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "abl"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "target"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 740
    iget-boolean v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mWasNestedFlung:Z

    if-nez v0, :cond_8

    .line 742
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/AppBarLayout$Behavior;->snapToChildIfNeeded(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)V

    .line 746
    :cond_8
    iput-boolean v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mSkipNestedPreScroll:Z

    .line 747
    iput-boolean v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mWasNestedFlung:Z

    .line 749
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mLastNestedScrollingChildRef:Ljava/lang/ref/WeakReference;

    .line 750
    return-void
.end method

.method public bridge synthetic onStopNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)V
    .registers 4

    .prologue
    .line 642
    check-cast p2, Landroid/support/design/widget/AppBarLayout;

    invoke-virtual {p0, p1, p2, p3}, Landroid/support/design/widget/AppBarLayout$Behavior;->onStopNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;)V

    return-void
.end method

.method public setDragCallback(Landroid/support/design/widget/AppBarLayout$Behavior$DragCallback;)V
    .registers 2
    .param p1, "callback"    # Landroid/support/design/widget/AppBarLayout$Behavior$DragCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 797
    iput-object p1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOnDragCallback:Landroid/support/design/widget/AppBarLayout$Behavior$DragCallback;

    .line 798
    return-void
.end method

.method setHeaderTopBottomOffset(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;III)I
    .registers 12
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "header"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "newOffset"    # I
    .param p4, "minOffset"    # I
    .param p5, "maxOffset"    # I

    .prologue
    .line 953
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v2

    .line 954
    .local v2, "curOffset":I
    const/4 v1, 0x0

    .line 956
    .local v1, "consumed":I
    if-eqz p4, :cond_37

    if-lt v2, p4, :cond_37

    if-gt v2, p5, :cond_37

    .line 959
    invoke-static {p3, p4, p5}, Landroid/support/design/widget/MathUtils;->constrain(III)I

    move-result p3

    .line 960
    move-object v0, p2

    .line 961
    .local v0, "appBarLayout":Landroid/support/design/widget/AppBarLayout;
    if-eq v2, p3, :cond_34

    .line 962
    # invokes: Landroid/support/design/widget/AppBarLayout;->hasChildWithInterpolator()Z
    invoke-static {v0}, Landroid/support/design/widget/AppBarLayout;->access$700(Landroid/support/design/widget/AppBarLayout;)Z

    move-result v5

    if-eqz v5, :cond_35

    invoke-direct {p0, v0, p3}, Landroid/support/design/widget/AppBarLayout$Behavior;->interpolateOffset(Landroid/support/design/widget/AppBarLayout;I)I

    move-result v3

    .line 966
    .local v3, "interpolatedOffset":I
    :goto_1c
    invoke-virtual {p0, v3}, Landroid/support/design/widget/AppBarLayout$Behavior;->setTopAndBottomOffset(I)Z

    move-result v4

    .line 969
    .local v4, "offsetChanged":Z
    sub-int v1, v2, p3

    .line 971
    sub-int v5, p3, v3

    iput v5, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetDelta:I

    .line 973
    if-nez v4, :cond_31

    # invokes: Landroid/support/design/widget/AppBarLayout;->hasChildWithInterpolator()Z
    invoke-static {v0}, Landroid/support/design/widget/AppBarLayout;->access$700(Landroid/support/design/widget/AppBarLayout;)Z

    move-result v5

    if-eqz v5, :cond_31

    .line 978
    invoke-virtual {p1, v0}, Landroid/support/design/widget/CoordinatorLayout;->dispatchDependentViewsChanged(Landroid/view/View;)V

    .line 982
    :cond_31
    invoke-direct {p0, v0}, Landroid/support/design/widget/AppBarLayout$Behavior;->dispatchOffsetUpdates(Landroid/support/design/widget/AppBarLayout;)V

    .line 989
    .end local v0    # "appBarLayout":Landroid/support/design/widget/AppBarLayout;
    .end local v3    # "interpolatedOffset":I
    .end local v4    # "offsetChanged":Z
    :cond_34
    :goto_34
    return v1

    .restart local v0    # "appBarLayout":Landroid/support/design/widget/AppBarLayout;
    :cond_35
    move v3, p3

    .line 962
    goto :goto_1c

    .line 986
    .end local v0    # "appBarLayout":Landroid/support/design/widget/AppBarLayout;
    :cond_37
    const/4 v5, 0x0

    iput v5, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetDelta:I

    goto :goto_34
.end method

.method bridge synthetic setHeaderTopBottomOffset(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;III)I
    .registers 12

    .prologue
    .line 642
    move-object v2, p2

    check-cast v2, Landroid/support/design/widget/AppBarLayout;

    move-object v0, p0

    move-object v1, p1

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->setHeaderTopBottomOffset(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;III)I

    move-result v0

    return v0
.end method

.method public bridge synthetic setLeftAndRightOffset(I)Z
    .registers 3

    .prologue
    .line 642
    invoke-super {p0, p1}, Landroid/support/design/widget/HeaderBehavior;->setLeftAndRightOffset(I)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic setTopAndBottomOffset(I)Z
    .registers 3

    .prologue
    .line 642
    invoke-super {p0, p1}, Landroid/support/design/widget/HeaderBehavior;->setTopAndBottomOffset(I)Z

    move-result v0

    return v0
.end method
