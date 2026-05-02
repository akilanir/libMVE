.class Lcom/mobeta/android/dslv/DragSortListView$DragScroller;
.super Ljava/lang/Object;
.source "DragSortListView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobeta/android/dslv/DragSortListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DragScroller"
.end annotation


# static fields
.field public static final DOWN:I = 0x1

.field public static final STOP:I = -0x1

.field public static final UP:I


# instance fields
.field private dt:F

.field private dy:I

.field private mAbort:Z

.field private mCurrTime:J

.field private mFirstFooter:I

.field private mLastHeader:I

.field private mPrevTime:J

.field private mScrollSpeed:F

.field private mScrolling:Z

.field private scrollDir:I

.field private tStart:J

.field final synthetic this$0:Lcom/mobeta/android/dslv/DragSortListView;


# direct methods
.method public constructor <init>(Lcom/mobeta/android/dslv/DragSortListView;)V
    .registers 3

    .prologue
    .line 2835
    iput-object p1, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2822
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    .line 2836
    return-void
.end method


# virtual methods
.method public getScrollDir()I
    .registers 2

    .prologue
    .line 2832
    iget-boolean v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->scrollDir:I

    :goto_6
    return v0

    :cond_7
    const/4 v0, -0x1

    goto :goto_6
.end method

.method public isScrolling()Z
    .registers 2

    .prologue
    .line 2828
    iget-boolean v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    return v0
.end method

.method public run()V
    .registers 16

    .prologue
    .line 2863
    iget-boolean v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mAbort:Z

    if-eqz v11, :cond_8

    .line 2864
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    .line 2949
    :goto_7
    return-void

    .line 2870
    :cond_8
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v11}, Lcom/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v1

    .line 2871
    .local v1, "first":I
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v11}, Lcom/mobeta/android/dslv/DragSortListView;->getLastVisiblePosition()I

    move-result v2

    .line 2872
    .local v2, "last":I
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v11}, Lcom/mobeta/android/dslv/DragSortListView;->getCount()I

    move-result v0

    .line 2873
    .local v0, "count":I
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v11}, Lcom/mobeta/android/dslv/DragSortListView;->getPaddingTop()I

    move-result v8

    .line 2874
    .local v8, "padTop":I
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v11}, Lcom/mobeta/android/dslv/DragSortListView;->getHeight()I

    move-result v11

    sub-int/2addr v11, v8

    iget-object v12, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v12}, Lcom/mobeta/android/dslv/DragSortListView;->getPaddingBottom()I

    move-result v12

    sub-int v3, v11, v12

    .line 2876
    .local v3, "listHeight":I
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mY:I
    invoke-static {v11}, Lcom/mobeta/android/dslv/DragSortListView;->access$600(Lcom/mobeta/android/dslv/DragSortListView;)I

    move-result v11

    iget-object v12, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I
    invoke-static {v12}, Lcom/mobeta/android/dslv/DragSortListView;->access$2000(Lcom/mobeta/android/dslv/DragSortListView;)I

    move-result v12

    iget-object v13, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mFloatViewHeightHalf:I
    invoke-static {v13}, Lcom/mobeta/android/dslv/DragSortListView;->access$400(Lcom/mobeta/android/dslv/DragSortListView;)I

    move-result v13

    add-int/2addr v12, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 2877
    .local v5, "minY":I
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mY:I
    invoke-static {v11}, Lcom/mobeta/android/dslv/DragSortListView;->access$600(Lcom/mobeta/android/dslv/DragSortListView;)I

    move-result v11

    iget-object v12, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mFloatViewMid:I
    invoke-static {v12}, Lcom/mobeta/android/dslv/DragSortListView;->access$2000(Lcom/mobeta/android/dslv/DragSortListView;)I

    move-result v12

    iget-object v13, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mFloatViewHeightHalf:I
    invoke-static {v13}, Lcom/mobeta/android/dslv/DragSortListView;->access$400(Lcom/mobeta/android/dslv/DragSortListView;)I

    move-result v13

    sub-int/2addr v12, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 2879
    .local v4, "maxY":I
    iget v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->scrollDir:I

    if-nez v11, :cond_100

    .line 2880
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    .line 2882
    .local v10, "v":Landroid/view/View;
    if-nez v10, :cond_6e

    .line 2883
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    goto :goto_7

    .line 2886
    :cond_6e
    if-nez v1, :cond_7a

    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v11

    if-ne v11, v8, :cond_7a

    .line 2887
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    goto :goto_7

    .line 2891
    :cond_7a
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mScrollProfile:Lcom/mobeta/android/dslv/DragSortListView$DragScrollProfile;
    invoke-static {v11}, Lcom/mobeta/android/dslv/DragSortListView;->access$2300(Lcom/mobeta/android/dslv/DragSortListView;)Lcom/mobeta/android/dslv/DragSortListView$DragScrollProfile;

    move-result-object v11

    iget-object v12, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mUpScrollStartYF:F
    invoke-static {v12}, Lcom/mobeta/android/dslv/DragSortListView;->access$2100(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v12

    int-to-float v13, v4

    sub-float/2addr v12, v13

    iget-object v13, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    .line 2892
    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mDragUpScrollHeight:F
    invoke-static {v13}, Lcom/mobeta/android/dslv/DragSortListView;->access$2200(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v13

    div-float/2addr v12, v13

    iget-wide v13, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mPrevTime:J

    .line 2891
    invoke-interface {v11, v12, v13, v14}, Lcom/mobeta/android/dslv/DragSortListView$DragScrollProfile;->getSpeed(FJ)F

    move-result v11

    iput v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrollSpeed:F

    .line 2908
    :goto_97
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v11

    iput-wide v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mCurrTime:J

    .line 2909
    iget-wide v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mCurrTime:J

    iget-wide v13, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mPrevTime:J

    sub-long/2addr v11, v13

    long-to-float v11, v11

    iput v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->dt:F

    .line 2915
    iget v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrollSpeed:F

    iget v12, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->dt:F

    mul-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v11

    iput v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    .line 2918
    iget v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    if-ltz v11, :cond_140

    .line 2919
    iget v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    invoke-static {v3, v11}, Ljava/lang/Math;->min(II)I

    move-result v11

    iput v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    .line 2920
    move v7, v1

    .line 2926
    .local v7, "movePos":I
    :goto_bd
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    sub-int v12, v7, v1

    invoke-virtual {v11, v12}, Lcom/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 2927
    .local v6, "moveItem":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v11

    iget v12, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    add-int v9, v11, v12

    .line 2929
    .local v9, "top":I
    if-nez v7, :cond_d2

    if-le v9, v8, :cond_d2

    .line 2930
    move v9, v8

    .line 2934
    :cond_d2
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    const/4 v12, 0x1

    # setter for: Lcom/mobeta/android/dslv/DragSortListView;->mBlockLayoutRequests:Z
    invoke-static {v11, v12}, Lcom/mobeta/android/dslv/DragSortListView;->access$2602(Lcom/mobeta/android/dslv/DragSortListView;Z)Z

    .line 2936
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    sub-int v12, v9, v8

    invoke-virtual {v11, v7, v12}, Lcom/mobeta/android/dslv/DragSortListView;->setSelectionFromTop(II)V

    .line 2937
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v11}, Lcom/mobeta/android/dslv/DragSortListView;->layoutChildren()V

    .line 2938
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v11}, Lcom/mobeta/android/dslv/DragSortListView;->invalidate()V

    .line 2940
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    const/4 v12, 0x0

    # setter for: Lcom/mobeta/android/dslv/DragSortListView;->mBlockLayoutRequests:Z
    invoke-static {v11, v12}, Lcom/mobeta/android/dslv/DragSortListView;->access$2602(Lcom/mobeta/android/dslv/DragSortListView;Z)Z

    .line 2943
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    const/4 v12, 0x0

    # invokes: Lcom/mobeta/android/dslv/DragSortListView;->doDragFloatView(ILandroid/view/View;Z)V
    invoke-static {v11, v7, v6, v12}, Lcom/mobeta/android/dslv/DragSortListView;->access$2700(Lcom/mobeta/android/dslv/DragSortListView;ILandroid/view/View;Z)V

    .line 2945
    iget-wide v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mCurrTime:J

    iput-wide v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mPrevTime:J

    .line 2948
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v11, p0}, Lcom/mobeta/android/dslv/DragSortListView;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_7

    .line 2894
    .end local v6    # "moveItem":Landroid/view/View;
    .end local v7    # "movePos":I
    .end local v9    # "top":I
    .end local v10    # "v":Landroid/view/View;
    :cond_100
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    sub-int v12, v2, v1

    invoke-virtual {v11, v12}, Lcom/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    .line 2895
    .restart local v10    # "v":Landroid/view/View;
    if-nez v10, :cond_10f

    .line 2896
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    goto/16 :goto_7

    .line 2899
    :cond_10f
    add-int/lit8 v11, v0, -0x1

    if-ne v2, v11, :cond_120

    invoke-virtual {v10}, Landroid/view/View;->getBottom()I

    move-result v11

    add-int v12, v3, v8

    if-gt v11, v12, :cond_120

    .line 2900
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    goto/16 :goto_7

    .line 2904
    :cond_120
    iget-object v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mScrollProfile:Lcom/mobeta/android/dslv/DragSortListView$DragScrollProfile;
    invoke-static {v11}, Lcom/mobeta/android/dslv/DragSortListView;->access$2300(Lcom/mobeta/android/dslv/DragSortListView;)Lcom/mobeta/android/dslv/DragSortListView$DragScrollProfile;

    move-result-object v11

    int-to-float v12, v5

    iget-object v13, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mDownScrollStartYF:F
    invoke-static {v13}, Lcom/mobeta/android/dslv/DragSortListView;->access$2400(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v13

    sub-float/2addr v12, v13

    iget-object v13, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    .line 2905
    # getter for: Lcom/mobeta/android/dslv/DragSortListView;->mDragDownScrollHeight:F
    invoke-static {v13}, Lcom/mobeta/android/dslv/DragSortListView;->access$2500(Lcom/mobeta/android/dslv/DragSortListView;)F

    move-result v13

    div-float/2addr v12, v13

    iget-wide v13, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mPrevTime:J

    .line 2904
    invoke-interface {v11, v12, v13, v14}, Lcom/mobeta/android/dslv/DragSortListView$DragScrollProfile;->getSpeed(FJ)F

    move-result v11

    neg-float v11, v11

    iput v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrollSpeed:F

    goto/16 :goto_97

    .line 2922
    :cond_140
    neg-int v11, v3

    iget v12, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v11

    iput v11, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->dy:I

    .line 2923
    move v7, v2

    .restart local v7    # "movePos":I
    goto/16 :goto_bd
.end method

.method public startScrolling(I)V
    .registers 4
    .param p1, "dir"    # I

    .prologue
    .line 2839
    iget-boolean v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    if-nez v0, :cond_1b

    .line 2841
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mAbort:Z

    .line 2842
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    .line 2843
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->tStart:J

    .line 2844
    iget-wide v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->tStart:J

    iput-wide v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mPrevTime:J

    .line 2845
    iput p1, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->scrollDir:I

    .line 2846
    iget-object v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v0, p0}, Lcom/mobeta/android/dslv/DragSortListView;->post(Ljava/lang/Runnable;)Z

    .line 2848
    :cond_1b
    return-void
.end method

.method public stopScrolling(Z)V
    .registers 3
    .param p1, "now"    # Z

    .prologue
    .line 2851
    if-eqz p1, :cond_b

    .line 2852
    iget-object v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->this$0:Lcom/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v0, p0}, Lcom/mobeta/android/dslv/DragSortListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2853
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mScrolling:Z

    .line 2859
    :goto_a
    return-void

    .line 2855
    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobeta/android/dslv/DragSortListView$DragScroller;->mAbort:Z

    goto :goto_a
.end method
