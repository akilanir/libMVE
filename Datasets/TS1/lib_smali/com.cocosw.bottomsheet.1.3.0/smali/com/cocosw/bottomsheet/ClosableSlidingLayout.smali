.class Lcom/cocosw/bottomsheet/ClosableSlidingLayout;
.super Landroid/widget/FrameLayout;
.source "ClosableSlidingLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cocosw/bottomsheet/ClosableSlidingLayout$1;,
        Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;,
        Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;
    }
.end annotation


# static fields
.field private static final INVALID_POINTER:I = -0x1


# instance fields
.field private final MINVEL:F

.field private collapsible:Z

.field private height:I

.field private mActivePointerId:I

.field private mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

.field private mInitialMotionY:F

.field private mIsBeingDragged:Z

.field private mListener:Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;

.field mTarget:Landroid/view/View;

.field swipeable:Z

.field private top:I

.field private yDiff:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->swipeable:Z

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->collapsible:Z

    .line 47
    const v0, 0x3f4ccccd    # 0.8f

    new-instance v1, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback;-><init>(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;Lcom/cocosw/bottomsheet/ClosableSlidingLayout$1;)V

    invoke-static {p0, v0, v1}, Landroid/support/v4/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;FLandroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    iput-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    .line 48
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x43c80000    # 400.0f

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->MINVEL:F

    .line 49
    return-void
.end method

.method static synthetic access$100(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)F
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    .prologue
    .line 20
    iget v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->MINVEL:F

    return v0
.end method

.method static synthetic access$200(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;Landroid/view/View;F)V
    .registers 3
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/ClosableSlidingLayout;
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # F

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->dismiss(Landroid/view/View;F)V

    return-void
.end method

.method static synthetic access$300(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)I
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    .prologue
    .line 20
    iget v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->top:I

    return v0
.end method

.method static synthetic access$400(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)I
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    .prologue
    .line 20
    iget v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->height:I

    return v0
.end method

.method static synthetic access$500(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)Landroid/support/v4/widget/ViewDragHelper;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    return-object v0
.end method

.method static synthetic access$600(Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mListener:Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;

    return-object v0
.end method

.method private canChildScrollUp()Z
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 112
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-ge v3, v4, :cond_39

    .line 113
    iget-object v3, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mTarget:Landroid/view/View;

    instance-of v3, v3, Landroid/widget/AbsListView;

    if-eqz v3, :cond_2f

    .line 114
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mTarget:Landroid/view/View;

    check-cast v0, Landroid/widget/AbsListView;

    .line 115
    .local v0, "absListView":Landroid/widget/AbsListView;
    invoke-virtual {v0}, Landroid/widget/AbsListView;->getChildCount()I

    move-result v3

    if-lez v3, :cond_2d

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getFirstVisiblePosition()I

    move-result v3

    if-gtz v3, :cond_2c

    invoke-virtual {v0, v2}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {v0}, Landroid/widget/AbsListView;->getPaddingTop()I

    move-result v4

    if-ge v3, v4, :cond_2d

    .line 122
    .end local v0    # "absListView":Landroid/widget/AbsListView;
    :cond_2c
    :goto_2c
    return v1

    .restart local v0    # "absListView":Landroid/widget/AbsListView;
    :cond_2d
    move v1, v2

    .line 115
    goto :goto_2c

    .line 119
    .end local v0    # "absListView":Landroid/widget/AbsListView;
    :cond_2f
    iget-object v3, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mTarget:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getScrollY()I

    move-result v3

    if-gtz v3, :cond_2c

    move v1, v2

    goto :goto_2c

    .line 122
    :cond_39
    iget-object v1, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mTarget:Landroid/view/View;

    const/4 v2, -0x1

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->canScrollVertically(Landroid/view/View;I)Z

    move-result v1

    goto :goto_2c
.end method

.method private dismiss(Landroid/view/View;F)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "yvel"    # F

    .prologue
    .line 170
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v1, 0x0

    iget v2, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->top:I

    iget v3, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->height:I

    add-int/2addr v2, v3

    invoke-virtual {v0, p1, v1, v2}, Landroid/support/v4/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    .line 171
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 172
    return-void
.end method

.method private expand(Landroid/view/View;F)V
    .registers 4
    .param p1, "releasedChild"    # Landroid/view/View;
    .param p2, "yvel"    # F

    .prologue
    .line 164
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mListener:Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;

    if-eqz v0, :cond_9

    .line 165
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mListener:Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;

    invoke-interface {v0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;->onOpened()V

    .line 167
    :cond_9
    return-void
.end method

.method private getMotionEventY(Landroid/view/MotionEvent;I)F
    .registers 5
    .param p1, "ev"    # Landroid/view/MotionEvent;
    .param p2, "activePointerId"    # I

    .prologue
    .line 127
    invoke-static {p1, p2}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v0

    .line 128
    .local v0, "index":I
    if-gez v0, :cond_9

    .line 129
    const/high16 v1, -0x40800000    # -1.0f

    .line 131
    :goto_8
    return v1

    :cond_9
    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v1

    goto :goto_8
.end method


# virtual methods
.method public computeScroll()V
    .registers 3

    .prologue
    .line 150
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 151
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 153
    :cond_c
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 11
    .param p1, "event"    # Landroid/view/MotionEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v8, 0x1

    const/4 v7, -0x1

    const/4 v6, 0x0

    const/high16 v5, -0x40800000    # -1.0f

    const/4 v3, 0x0

    .line 53
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 55
    .local v0, "action":I
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_16

    invoke-direct {p0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->canChildScrollUp()Z

    move-result v4

    if-eqz v4, :cond_17

    .line 99
    :cond_16
    :goto_16
    return v3

    .line 60
    :cond_17
    const/4 v4, 0x3

    if-eq v0, v4, :cond_1c

    if-ne v0, v8, :cond_41

    .line 61
    :cond_1c
    iput v7, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mActivePointerId:I

    .line 62
    iput-boolean v3, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mIsBeingDragged:Z

    .line 63
    iget-boolean v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->collapsible:Z

    if-eqz v4, :cond_3b

    iget v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->yDiff:F

    neg-float v4, v4

    iget-object v5, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v5}, Landroid/support/v4/widget/ViewDragHelper;->getTouchSlop()I

    move-result v5

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_3b

    .line 64
    iget-object v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v4}, Landroid/support/v4/widget/ViewDragHelper;->getCapturedView()Landroid/view/View;

    move-result-object v4

    invoke-direct {p0, v4, v6}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->expand(Landroid/view/View;F)V

    .line 66
    :cond_3b
    iget-object v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v4}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    goto :goto_16

    .line 70
    :cond_41
    packed-switch v0, :pswitch_data_ac

    .line 98
    :cond_44
    :goto_44
    :pswitch_44
    iget-object v3, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v3, p1}, Landroid/support/v4/widget/ViewDragHelper;->shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 99
    iget-boolean v3, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mIsBeingDragged:Z

    goto :goto_16

    .line 72
    :pswitch_4c
    invoke-virtual {p0, v3}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    iput v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->height:I

    .line 73
    invoke-virtual {p0, v3}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    iput v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->top:I

    .line 74
    invoke-static {p1, v3}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v4

    iput v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mActivePointerId:I

    .line 75
    iput-boolean v3, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mIsBeingDragged:Z

    .line 76
    iget v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mActivePointerId:I

    invoke-direct {p0, p1, v4}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->getMotionEventY(Landroid/view/MotionEvent;I)F

    move-result v1

    .line 77
    .local v1, "initialMotionY":F
    cmpl-float v4, v1, v5

    if-eqz v4, :cond_16

    .line 80
    iput v1, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mInitialMotionY:F

    .line 81
    iput v6, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->yDiff:F

    goto :goto_44

    .line 84
    .end local v1    # "initialMotionY":F
    :pswitch_77
    iget v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mActivePointerId:I

    if-eq v4, v7, :cond_16

    .line 87
    iget v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mActivePointerId:I

    invoke-direct {p0, p1, v4}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->getMotionEventY(Landroid/view/MotionEvent;I)F

    move-result v2

    .line 88
    .local v2, "y":F
    cmpl-float v4, v2, v5

    if-eqz v4, :cond_16

    .line 91
    iget v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mInitialMotionY:F

    sub-float v4, v2, v4

    iput v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->yDiff:F

    .line 92
    iget-boolean v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->swipeable:Z

    if-eqz v4, :cond_44

    iget v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->yDiff:F

    iget-object v5, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v5}, Landroid/support/v4/widget/ViewDragHelper;->getTouchSlop()I

    move-result v5

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_44

    iget-boolean v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mIsBeingDragged:Z

    if-nez v4, :cond_44

    .line 93
    iput-boolean v8, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mIsBeingDragged:Z

    .line 94
    iget-object v4, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p0, v3}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Landroid/support/v4/widget/ViewDragHelper;->captureChildView(Landroid/view/View;I)V

    goto :goto_44

    .line 70
    :pswitch_data_ac
    .packed-switch 0x0
        :pswitch_4c
        :pswitch_44
        :pswitch_77
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 136
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-direct {p0}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->canChildScrollUp()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 137
    :cond_c
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 145
    :goto_10
    return v0

    .line 141
    :cond_11
    :try_start_11
    iget-boolean v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->swipeable:Z

    if-eqz v0, :cond_1a

    .line 142
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mDragHelper:Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/ViewDragHelper;->processTouchEvent(Landroid/view/MotionEvent;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1a} :catch_1c

    .line 145
    :cond_1a
    :goto_1a
    const/4 v0, 0x1

    goto :goto_10

    .line 143
    :catch_1c
    move-exception v0

    goto :goto_1a
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 105
    return-void
.end method

.method setCollapsible(Z)V
    .registers 2
    .param p1, "collapsible"    # Z

    .prologue
    .line 160
    iput-boolean p1, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->collapsible:Z

    .line 161
    return-void
.end method

.method setSlideListener(Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mListener:Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;

    .line 157
    return-void
.end method
