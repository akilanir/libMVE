.class public Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;
.super Ljava/lang/Object;
.source "ViewAnimator.java"


# static fields
.field private static final DEFAULT_ANIMATION_DELAY_MILLIS:I = 0x64

.field private static final DEFAULT_ANIMATION_DURATION_MILLIS:I = 0x12c

.field private static final INITIAL_DELAY_MILLIS:I = 0x96

.field private static final SAVEDINSTANCESTATE_FIRSTANIMATEDPOSITION:Ljava/lang/String; = "savedinstancestate_firstanimatedposition"

.field private static final SAVEDINSTANCESTATE_LASTANIMATEDPOSITION:Ljava/lang/String; = "savedinstancestate_lastanimatedposition"

.field private static final SAVEDINSTANCESTATE_SHOULDANIMATE:Ljava/lang/String; = "savedinstancestate_shouldanimate"


# instance fields
.field private mAnimationDelayMillis:I

.field private mAnimationDurationMillis:I

.field private mAnimationStartMillis:J

.field private final mAnimators:Landroid/util/SparseArray;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/nineoldandroids/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field private mFirstAnimatedPosition:I

.field private mInitialDelayMillis:I

.field private mLastAnimatedPosition:I

.field private final mListViewWrapper:Lcom/nhaarman/listviewanimations/util/ListViewWrapper;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private mShouldAnimate:Z


# direct methods
.method public constructor <init>(Lcom/nhaarman/listviewanimations/util/ListViewWrapper;)V
    .registers 5
    .param p1, "listViewWrapper"    # Lcom/nhaarman/listviewanimations/util/ListViewWrapper;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, -0x1

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimators:Landroid/util/SparseArray;

    .line 80
    const/16 v0, 0x96

    iput v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mInitialDelayMillis:I

    .line 85
    const/16 v0, 0x64

    iput v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationDelayMillis:I

    .line 90
    const/16 v0, 0x12c

    iput v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationDurationMillis:I

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mShouldAnimate:Z

    .line 118
    iput-object p1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mListViewWrapper:Lcom/nhaarman/listviewanimations/util/ListViewWrapper;

    .line 119
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationStartMillis:J

    .line 120
    iput v2, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mFirstAnimatedPosition:I

    .line 121
    iput v2, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mLastAnimatedPosition:I

    .line 122
    return-void
.end method

.method private animateView(ILandroid/view/View;[Lcom/nineoldandroids/animation/Animator;)V
    .registers 9
    .param p1, "position"    # I
    .param p2, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "animators"    # [Lcom/nineoldandroids/animation/Animator;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 243
    iget-wide v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationStartMillis:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_e

    .line 244
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationStartMillis:J

    .line 247
    :cond_e
    const/4 v1, 0x0

    invoke-static {p2, v1}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    .line 249
    new-instance v0, Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    .line 250
    .local v0, "set":Lcom/nineoldandroids/animation/AnimatorSet;
    invoke-virtual {v0, p3}, Lcom/nineoldandroids/animation/AnimatorSet;->playTogether([Lcom/nineoldandroids/animation/Animator;)V

    .line 251
    invoke-direct {p0, p1}, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->calculateAnimationDelay(I)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/nineoldandroids/animation/AnimatorSet;->setStartDelay(J)V

    .line 252
    iget v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationDurationMillis:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/nineoldandroids/animation/AnimatorSet;->setDuration(J)Lcom/nineoldandroids/animation/AnimatorSet;

    .line 253
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/AnimatorSet;->start()V

    .line 255
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimators:Landroid/util/SparseArray;

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 256
    return-void
.end method

.method private calculateAnimationDelay(I)I
    .registers 14
    .param p1, "position"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 265
    iget-object v7, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mListViewWrapper:Lcom/nhaarman/listviewanimations/util/ListViewWrapper;

    invoke-interface {v7}, Lcom/nhaarman/listviewanimations/util/ListViewWrapper;->getLastVisiblePosition()I

    move-result v3

    .line 266
    .local v3, "lastVisiblePosition":I
    iget-object v7, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mListViewWrapper:Lcom/nhaarman/listviewanimations/util/ListViewWrapper;

    invoke-interface {v7}, Lcom/nhaarman/listviewanimations/util/ListViewWrapper;->getFirstVisiblePosition()I

    move-result v2

    .line 268
    .local v2, "firstVisiblePosition":I
    sub-int v6, v3, v2

    .line 269
    .local v6, "numberOfItemsOnScreen":I
    add-int/lit8 v7, p1, -0x1

    iget v8, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mFirstAnimatedPosition:I

    sub-int v5, v7, v8

    .line 271
    .local v5, "numberOfAnimatedItems":I
    add-int/lit8 v7, v6, 0x1

    if-ge v7, v5, :cond_3d

    .line 272
    iget v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationDelayMillis:I

    .line 274
    .local v0, "delay":I
    iget-object v7, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mListViewWrapper:Lcom/nhaarman/listviewanimations/util/ListViewWrapper;

    invoke-interface {v7}, Lcom/nhaarman/listviewanimations/util/ListViewWrapper;->getListView()Landroid/view/ViewGroup;

    move-result-object v7

    instance-of v7, v7, Landroid/widget/GridView;

    if-eqz v7, :cond_3c

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0xb

    if-lt v7, v8, :cond_3c

    .line 275
    iget-object v7, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mListViewWrapper:Lcom/nhaarman/listviewanimations/util/ListViewWrapper;

    invoke-interface {v7}, Lcom/nhaarman/listviewanimations/util/ListViewWrapper;->getListView()Landroid/view/ViewGroup;

    move-result-object v7

    check-cast v7, Landroid/widget/GridView;

    invoke-virtual {v7}, Landroid/widget/GridView;->getNumColumns()I

    move-result v4

    .line 276
    .local v4, "numColumns":I
    iget v7, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationDelayMillis:I

    rem-int v8, p1, v4

    mul-int/2addr v7, v8

    add-int/2addr v0, v7

    .line 282
    .end local v4    # "numColumns":I
    :cond_3c
    :goto_3c
    return v0

    .line 279
    .end local v0    # "delay":I
    :cond_3d
    iget v7, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mFirstAnimatedPosition:I

    sub-int v7, p1, v7

    iget v8, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationDelayMillis:I

    mul-int v1, v7, v8

    .line 280
    .local v1, "delaySinceStart":I
    const/4 v7, 0x0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    neg-long v8, v8

    iget-wide v10, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationStartMillis:J

    add-long/2addr v8, v10

    iget v10, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mInitialDelayMillis:I

    int-to-long v10, v10

    add-long/2addr v8, v10

    int-to-long v10, v1

    add-long/2addr v8, v10

    long-to-int v8, v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v0

    .restart local v0    # "delay":I
    goto :goto_3c
.end method


# virtual methods
.method public animateViewIfNecessary(ILandroid/view/View;[Lcom/nineoldandroids/animation/Animator;)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "animators"    # [Lcom/nineoldandroids/animation/Animator;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 227
    iget-boolean v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mShouldAnimate:Z

    if-eqz v0, :cond_14

    iget v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mLastAnimatedPosition:I

    if-le p1, v0, :cond_14

    .line 228
    iget v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mFirstAnimatedPosition:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_f

    .line 229
    iput p1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mFirstAnimatedPosition:I

    .line 232
    :cond_f
    invoke-direct {p0, p1, p2, p3}, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->animateView(ILandroid/view/View;[Lcom/nineoldandroids/animation/Animator;)V

    .line 233
    iput p1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mLastAnimatedPosition:I

    .line 235
    :cond_14
    return-void
.end method

.method cancelExistingAnimation(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 212
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    .line 213
    .local v1, "hashCode":I
    iget-object v2, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimators:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/Animator;

    .line 214
    .local v0, "animator":Lcom/nineoldandroids/animation/Animator;
    if-eqz v0, :cond_16

    .line 215
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->end()V

    .line 216
    iget-object v2, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimators:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 218
    :cond_16
    return-void
.end method

.method public disableAnimations()V
    .registers 2

    .prologue
    .line 205
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mShouldAnimate:Z

    .line 206
    return-void
.end method

.method public enableAnimations()V
    .registers 2

    .prologue
    .line 198
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mShouldAnimate:Z

    .line 199
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4
    .param p1, "parcelable"    # Landroid/os/Parcelable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 305
    instance-of v1, p1, Landroid/os/Bundle;

    if-eqz v1, :cond_1f

    move-object v0, p1

    .line 306
    check-cast v0, Landroid/os/Bundle;

    .line 307
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "savedinstancestate_firstanimatedposition"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mFirstAnimatedPosition:I

    .line 308
    const-string v1, "savedinstancestate_lastanimatedposition"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mLastAnimatedPosition:I

    .line 309
    const-string v1, "savedinstancestate_shouldanimate"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mShouldAnimate:Z

    .line 311
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_1f
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 290
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 292
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "savedinstancestate_firstanimatedposition"

    iget v2, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mFirstAnimatedPosition:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 293
    const-string v1, "savedinstancestate_lastanimatedposition"

    iget v2, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mLastAnimatedPosition:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 294
    const-string v1, "savedinstancestate_shouldanimate"

    iget-boolean v2, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mShouldAnimate:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 296
    return-object v0
.end method

.method public reset()V
    .registers 5

    .prologue
    const/4 v3, -0x1

    .line 128
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimators:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1e

    .line 129
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimators:Landroid/util/SparseArray;

    iget-object v2, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimators:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/Animator;->cancel()V

    .line 128
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 131
    :cond_1e
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimators:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    .line 132
    iput v3, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mFirstAnimatedPosition:I

    .line 133
    iput v3, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mLastAnimatedPosition:I

    .line 134
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationStartMillis:J

    .line 135
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mShouldAnimate:Z

    .line 136
    return-void
.end method

.method public setAnimationDelayMillis(I)V
    .registers 2
    .param p1, "delayMillis"    # I

    .prologue
    .line 182
    iput p1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationDelayMillis:I

    .line 183
    return-void
.end method

.method public setAnimationDurationMillis(I)V
    .registers 2
    .param p1, "durationMillis"    # I

    .prologue
    .line 191
    iput p1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mAnimationDurationMillis:I

    .line 192
    return-void
.end method

.method public setInitialDelayMillis(I)V
    .registers 2
    .param p1, "delayMillis"    # I

    .prologue
    .line 173
    iput p1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mInitialDelayMillis:I

    .line 174
    return-void
.end method

.method setLastAnimatedPosition(I)V
    .registers 2
    .param p1, "lastAnimatedPosition"    # I

    .prologue
    .line 164
    iput p1, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mLastAnimatedPosition:I

    .line 165
    return-void
.end method

.method public setShouldAnimateFromPosition(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 145
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->enableAnimations()V

    .line 146
    add-int/lit8 v0, p1, -0x1

    iput v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mFirstAnimatedPosition:I

    .line 147
    add-int/lit8 v0, p1, -0x1

    iput v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mLastAnimatedPosition:I

    .line 148
    return-void
.end method

.method public setShouldAnimateNotVisible()V
    .registers 2

    .prologue
    .line 155
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->enableAnimations()V

    .line 156
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mListViewWrapper:Lcom/nhaarman/listviewanimations/util/ListViewWrapper;

    invoke-interface {v0}, Lcom/nhaarman/listviewanimations/util/ListViewWrapper;->getLastVisiblePosition()I

    move-result v0

    iput v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mFirstAnimatedPosition:I

    .line 157
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mListViewWrapper:Lcom/nhaarman/listviewanimations/util/ListViewWrapper;

    invoke-interface {v0}, Lcom/nhaarman/listviewanimations/util/ListViewWrapper;->getLastVisiblePosition()I

    move-result v0

    iput v0, p0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->mLastAnimatedPosition:I

    .line 158
    return-void
.end method
