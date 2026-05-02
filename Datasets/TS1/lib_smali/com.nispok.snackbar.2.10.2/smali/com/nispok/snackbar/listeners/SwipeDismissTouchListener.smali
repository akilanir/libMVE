.class public Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;
.super Ljava/lang/Object;
.source "SwipeDismissTouchListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;
    }
.end annotation


# instance fields
.field private mAnimationTime:J

.field private mCallbacks:Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;

.field private mDownX:F

.field private mDownY:F

.field private mMaxFlingVelocity:I

.field private mMinFlingVelocity:I

.field private mSlop:I

.field private mSwiping:Z

.field private mSwipingSlop:I

.field private mToken:Ljava/lang/Object;

.field private mTranslationX:F

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mView:Landroid/view/View;

.field private mViewWidth:I


# direct methods
.method public constructor <init>(Landroid/view/View;Ljava/lang/Object;Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "token"    # Ljava/lang/Object;
    .param p3, "callbacks"    # Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v1, 0x1

    iput v1, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mViewWidth:I

    .line 91
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 92
    .local v0, "vc":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSlop:I

    .line 93
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    iput v1, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mMinFlingVelocity:I

    .line 94
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mMaxFlingVelocity:I

    .line 95
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x10e0000

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v1, v1

    iput-wide v1, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mAnimationTime:J

    .line 97
    iput-object p1, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mView:Landroid/view/View;

    .line 98
    iput-object p2, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mToken:Ljava/lang/Object;

    .line 99
    iput-object p3, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mCallbacks:Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;

    .line 100
    return-void
.end method

.method static synthetic access$000(Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;)V
    .registers 1
    .param p0, "x0"    # Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->performDismiss()V

    return-void
.end method

.method private performDismiss()V
    .registers 4

    .prologue
    .line 238
    iget-object v0, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mCallbacks:Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;

    iget-object v1, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mView:Landroid/view/View;

    iget-object v2, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mToken:Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;->onDismiss(Landroid/view/View;Ljava/lang/Object;)V

    .line 239
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 18
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    .line 105
    iget v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mTranslationX:F

    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v10}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 107
    iget v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mViewWidth:I

    const/4 v10, 0x2

    if-ge v9, v10, :cond_15

    .line 108
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v9

    iput v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mViewWidth:I

    .line 111
    :cond_15
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v9

    packed-switch v9, :pswitch_data_210

    .line 234
    :cond_1c
    :goto_1c
    const/4 v9, 0x0

    :goto_1d
    return v9

    .line 114
    :pswitch_1e
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v9

    iput v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mDownX:F

    .line 115
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v9

    iput v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mDownY:F

    .line 116
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mCallbacks:Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;

    iget-object v10, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mToken:Ljava/lang/Object;

    invoke-interface {v9, v10}, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;->canDismiss(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_47

    .line 117
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mCallbacks:Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;

    const/4 v10, 0x1

    invoke-interface {v9, v10}, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;->pauseTimer(Z)V

    .line 118
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v9

    iput-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 119
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 121
    :cond_47
    const/4 v9, 0x0

    goto :goto_1d

    .line 125
    :pswitch_49
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v9, :cond_1c

    .line 129
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mCallbacks:Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;

    const/4 v10, 0x0

    invoke-interface {v9, v10}, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks;->pauseTimer(Z)V

    .line 130
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v9

    iget v10, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mDownX:F

    sub-float v4, v9, v10

    .line 131
    .local v4, "deltaX":F
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 132
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v10, 0x3e8

    invoke-virtual {v9, v10}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 133
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v8

    .line 134
    .local v8, "velocityX":F
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 135
    .local v1, "absVelocityX":F
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 136
    .local v2, "absVelocityY":F
    const/4 v6, 0x0

    .line 137
    .local v6, "dismiss":Z
    const/4 v7, 0x0

    .line 138
    .local v7, "dismissRight":Z
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v9

    iget v10, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mViewWidth:I

    div-int/lit8 v10, v10, 0x2

    int-to-float v10, v10

    cmpl-float v9, v9, v10

    if-lez v9, :cond_d7

    iget-boolean v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v9, :cond_d7

    .line 139
    const/4 v6, 0x1

    .line 140
    const/4 v9, 0x0

    cmpl-float v9, v4, v9

    if-lez v9, :cond_d5

    const/4 v7, 0x1

    .line 148
    :cond_97
    :goto_97
    if-eqz v6, :cond_11c

    .line 150
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v10

    if-eqz v7, :cond_117

    iget v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mViewWidth:I

    int-to-float v9, v9

    .line 151
    :goto_a4
    invoke-virtual {v10, v9}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    const/4 v10, 0x0

    .line 152
    invoke-virtual {v9, v10}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    iget-wide v10, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mAnimationTime:J

    .line 153
    invoke-virtual {v9, v10, v11}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    new-instance v10, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$1;

    invoke-direct {v10, p0}, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener$1;-><init>(Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;)V

    .line 154
    invoke-virtual {v9, v10}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 168
    :cond_bb
    :goto_bb
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v9, :cond_c7

    .line 169
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9}, Landroid/view/VelocityTracker;->recycle()V

    .line 170
    const/4 v9, 0x0

    iput-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 172
    :cond_c7
    const/4 v9, 0x0

    iput v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mTranslationX:F

    .line 173
    const/4 v9, 0x0

    iput v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mDownX:F

    .line 174
    const/4 v9, 0x0

    iput v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mDownY:F

    .line 175
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSwiping:Z

    goto/16 :goto_1c

    .line 140
    :cond_d5
    const/4 v7, 0x0

    goto :goto_97

    .line 141
    :cond_d7
    iget v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mMinFlingVelocity:I

    int-to-float v9, v9

    cmpg-float v9, v9, v1

    if-gtz v9, :cond_97

    iget v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mMaxFlingVelocity:I

    int-to-float v9, v9

    cmpg-float v9, v1, v9

    if-gtz v9, :cond_97

    cmpg-float v9, v2, v1

    if-gez v9, :cond_97

    cmpg-float v9, v2, v1

    if-gez v9, :cond_97

    iget-boolean v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v9, :cond_97

    .line 145
    const/4 v9, 0x0

    cmpg-float v9, v8, v9

    if-gez v9, :cond_10e

    const/4 v9, 0x1

    move v10, v9

    :goto_f8
    const/4 v9, 0x0

    cmpg-float v9, v4, v9

    if-gez v9, :cond_111

    const/4 v9, 0x1

    :goto_fe
    if-ne v10, v9, :cond_113

    const/4 v6, 0x1

    .line 146
    :goto_101
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v9

    const/4 v10, 0x0

    cmpl-float v9, v9, v10

    if-lez v9, :cond_115

    const/4 v7, 0x1

    :goto_10d
    goto :goto_97

    .line 145
    :cond_10e
    const/4 v9, 0x0

    move v10, v9

    goto :goto_f8

    :cond_111
    const/4 v9, 0x0

    goto :goto_fe

    :cond_113
    const/4 v6, 0x0

    goto :goto_101

    .line 146
    :cond_115
    const/4 v7, 0x0

    goto :goto_10d

    .line 150
    :cond_117
    iget v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mViewWidth:I

    neg-int v9, v9

    int-to-float v9, v9

    goto :goto_a4

    .line 160
    :cond_11c
    iget-boolean v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v9, :cond_bb

    .line 162
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    const/4 v10, 0x0

    .line 163
    invoke-virtual {v9, v10}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    const/high16 v10, 0x3f800000    # 1.0f

    .line 164
    invoke-virtual {v9, v10}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    iget-wide v10, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mAnimationTime:J

    .line 165
    invoke-virtual {v9, v10, v11}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    const/4 v10, 0x0

    .line 166
    invoke-virtual {v9, v10}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    goto :goto_bb

    .line 180
    .end local v1    # "absVelocityX":F
    .end local v2    # "absVelocityY":F
    .end local v4    # "deltaX":F
    .end local v6    # "dismiss":Z
    .end local v7    # "dismissRight":Z
    .end local v8    # "velocityX":F
    :pswitch_13c
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v9, :cond_1c

    .line 184
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    const/4 v10, 0x0

    .line 185
    invoke-virtual {v9, v10}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    const/high16 v10, 0x3f800000    # 1.0f

    .line 186
    invoke-virtual {v9, v10}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    iget-wide v10, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mAnimationTime:J

    .line 187
    invoke-virtual {v9, v10, v11}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    const/4 v10, 0x0

    .line 188
    invoke-virtual {v9, v10}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 189
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9}, Landroid/view/VelocityTracker;->recycle()V

    .line 190
    const/4 v9, 0x0

    iput-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 191
    const/4 v9, 0x0

    iput v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mTranslationX:F

    .line 192
    const/4 v9, 0x0

    iput v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mDownX:F

    .line 193
    const/4 v9, 0x0

    iput v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mDownY:F

    .line 194
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSwiping:Z

    goto/16 :goto_1c

    .line 199
    :pswitch_171
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v9, :cond_1c

    .line 203
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 204
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v9

    iget v10, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mDownX:F

    sub-float v4, v9, v10

    .line 205
    .restart local v4    # "deltaX":F
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v9

    iget v10, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mDownY:F

    sub-float v5, v9, v10

    .line 206
    .local v5, "deltaY":F
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v9

    iget v10, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSlop:I

    int-to-float v10, v10

    cmpl-float v9, v9, v10

    if-lez v9, :cond_1db

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v9

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v10

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    cmpg-float v9, v9, v10

    if-gez v9, :cond_1db

    .line 207
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSwiping:Z

    .line 208
    const/4 v9, 0x0

    cmpl-float v9, v4, v9

    if-lez v9, :cond_20c

    iget v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSlop:I

    :goto_1b0
    iput v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSwipingSlop:I

    .line 210
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    if-eqz v9, :cond_1c4

    .line 211
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    const/4 v10, 0x1

    invoke-interface {v9, v10}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 215
    :cond_1c4
    invoke-static/range {p2 .. p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v3

    .line 217
    .local v3, "cancelEvent":Landroid/view/MotionEvent;
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v9

    shl-int/lit8 v9, v9, 0x8

    or-int/lit8 v9, v9, 0x3

    .line 216
    invoke-virtual {v3, v9}, Landroid/view/MotionEvent;->setAction(I)V

    .line 219
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mView:Landroid/view/View;

    invoke-virtual {v9, v3}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 220
    invoke-virtual {v3}, Landroid/view/MotionEvent;->recycle()V

    .line 223
    .end local v3    # "cancelEvent":Landroid/view/MotionEvent;
    :cond_1db
    iget-boolean v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSwiping:Z

    if-eqz v9, :cond_1c

    .line 224
    iput v4, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mTranslationX:F

    .line 225
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mView:Landroid/view/View;

    iget v10, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSwipingSlop:I

    int-to-float v10, v10

    sub-float v10, v4, v10

    invoke-virtual {v9, v10}, Landroid/view/View;->setTranslationX(F)V

    .line 227
    iget-object v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mView:Landroid/view/View;

    const/4 v10, 0x0

    const/high16 v11, 0x3f800000    # 1.0f

    const/high16 v12, 0x3f800000    # 1.0f

    const/high16 v13, 0x40000000    # 2.0f

    .line 228
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v14

    mul-float/2addr v13, v14

    iget v14, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mViewWidth:I

    int-to-float v14, v14

    div-float/2addr v13, v14

    sub-float/2addr v12, v13

    .line 227
    invoke-static {v11, v12}, Ljava/lang/Math;->min(FF)F

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->max(FF)F

    move-result v10

    invoke-virtual {v9, v10}, Landroid/view/View;->setAlpha(F)V

    .line 229
    const/4 v9, 0x1

    goto/16 :goto_1d

    .line 208
    :cond_20c
    iget v9, p0, Lcom/nispok/snackbar/listeners/SwipeDismissTouchListener;->mSlop:I

    neg-int v9, v9

    goto :goto_1b0

    .line 111
    :pswitch_data_210
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_49
        :pswitch_171
        :pswitch_13c
    .end packed-switch
.end method
