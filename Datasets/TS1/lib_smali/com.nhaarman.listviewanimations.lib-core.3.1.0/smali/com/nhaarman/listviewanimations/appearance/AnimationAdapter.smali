.class public abstract Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;
.super Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;
.source "AnimationAdapter.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final ALPHA:Ljava/lang/String; = "alpha"

.field private static final SAVEDINSTANCESTATE_VIEWANIMATOR:Ljava/lang/String; = "savedinstancestate_viewanimator"


# instance fields
.field private mGridViewMeasuringPosition:I

.field private mGridViewPossiblyMeasuring:Z

.field private mIsRootAdapter:Z

.field private mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-class v0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected constructor <init>(Landroid/widget/BaseAdapter;)V
    .registers 4
    .param p1, "baseAdapter"    # Landroid/widget/BaseAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x1

    .line 76
    invoke-direct {p0, p1}, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;-><init>(Landroid/widget/BaseAdapter;)V

    .line 78
    iput-boolean v1, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mGridViewPossiblyMeasuring:Z

    .line 79
    const/4 v0, -0x1

    iput v0, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mGridViewMeasuringPosition:I

    .line 80
    iput-boolean v1, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mIsRootAdapter:Z

    .line 82
    instance-of v0, p1, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;

    if-eqz v0, :cond_14

    .line 83
    check-cast p1, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;

    .end local p1    # "baseAdapter":Landroid/widget/BaseAdapter;
    invoke-direct {p1}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->setIsWrapped()V

    .line 85
    :cond_14
    return-void
.end method

.method private animateViewIfNecessary(ILandroid/view/View;Landroid/view/ViewGroup;)V
    .registers 11
    .param p1, "position"    # I
    .param p2, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v5, 0x0

    const/4 v6, -0x1

    .line 158
    sget-boolean v4, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->$assertionsDisabled:Z

    if-nez v4, :cond_10

    iget-object v4, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    if-nez v4, :cond_10

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 163
    :cond_10
    iget-boolean v4, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mGridViewPossiblyMeasuring:Z

    if-eqz v4, :cond_56

    iget v4, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mGridViewMeasuringPosition:I

    if-eq v4, v6, :cond_1c

    iget v4, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mGridViewMeasuringPosition:I

    if-ne v4, p1, :cond_56

    :cond_1c
    const/4 v4, 0x1

    :goto_1d
    iput-boolean v4, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mGridViewPossiblyMeasuring:Z

    .line 165
    iget-boolean v4, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mGridViewPossiblyMeasuring:Z

    if-eqz v4, :cond_2a

    .line 166
    iput p1, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mGridViewMeasuringPosition:I

    .line 167
    iget-object v4, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    invoke-virtual {v4, v6}, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->setLastAnimatedPosition(I)V

    .line 171
    :cond_2a
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->getDecoratedBaseAdapter()Landroid/widget/BaseAdapter;

    move-result-object v4

    instance-of v4, v4, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;

    if-eqz v4, :cond_58

    .line 172
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->getDecoratedBaseAdapter()Landroid/widget/BaseAdapter;

    move-result-object v4

    check-cast v4, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;

    invoke-virtual {v4, p3, p2}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->getAnimators(Landroid/view/ViewGroup;Landroid/view/View;)[Lcom/nineoldandroids/animation/Animator;

    move-result-object v2

    .line 176
    .local v2, "childAnimators":[Lcom/nineoldandroids/animation/Animator;
    :goto_3c
    invoke-virtual {p0, p3, p2}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->getAnimators(Landroid/view/ViewGroup;Landroid/view/View;)[Lcom/nineoldandroids/animation/Animator;

    move-result-object v1

    .line 177
    .local v1, "animators":[Lcom/nineoldandroids/animation/Animator;
    const-string v4, "alpha"

    const/4 v5, 0x2

    new-array v5, v5, [F

    fill-array-data v5, :array_5c

    invoke-static {p2, v4, v5}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 179
    .local v0, "alphaAnimator":Lcom/nineoldandroids/animation/Animator;
    invoke-static {v2, v1, v0}, Lcom/nhaarman/listviewanimations/util/AnimatorUtil;->concatAnimators([Lcom/nineoldandroids/animation/Animator;[Lcom/nineoldandroids/animation/Animator;Lcom/nineoldandroids/animation/Animator;)[Lcom/nineoldandroids/animation/Animator;

    move-result-object v3

    .line 180
    .local v3, "concatAnimators":[Lcom/nineoldandroids/animation/Animator;
    iget-object v4, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    invoke-virtual {v4, p1, p2, v3}, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->animateViewIfNecessary(ILandroid/view/View;[Lcom/nineoldandroids/animation/Animator;)V

    .line 181
    return-void

    .end local v0    # "alphaAnimator":Lcom/nineoldandroids/animation/Animator;
    .end local v1    # "animators":[Lcom/nineoldandroids/animation/Animator;
    .end local v2    # "childAnimators":[Lcom/nineoldandroids/animation/Animator;
    .end local v3    # "concatAnimators":[Lcom/nineoldandroids/animation/Animator;
    :cond_56
    move v4, v5

    .line 163
    goto :goto_1d

    .line 174
    :cond_58
    new-array v2, v5, [Lcom/nineoldandroids/animation/Animator;

    .restart local v2    # "childAnimators":[Lcom/nineoldandroids/animation/Animator;
    goto :goto_3c

    .line 177
    nop

    :array_5c
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private setIsWrapped()V
    .registers 2

    .prologue
    .line 98
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mIsRootAdapter:Z

    .line 99
    return-void
.end method


# virtual methods
.method public abstract getAnimators(Landroid/view/ViewGroup;Landroid/view/View;)[Lcom/nineoldandroids/animation/Animator;
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 131
    iget-boolean v1, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mIsRootAdapter:Z

    if-eqz v1, :cond_27

    .line 132
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->getListViewWrapper()Lcom/nhaarman/listviewanimations/util/ListViewWrapper;

    move-result-object v1

    if-nez v1, :cond_12

    .line 133
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Call setAbsListView() on this AnimationAdapter first!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 136
    :cond_12
    sget-boolean v1, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->$assertionsDisabled:Z

    if-nez v1, :cond_20

    iget-object v1, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    if-nez v1, :cond_20

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 137
    :cond_20
    if-eqz p2, :cond_27

    .line 138
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    invoke-virtual {v1, p2}, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->cancelExistingAnimation(Landroid/view/View;)V

    .line 142
    :cond_27
    invoke-super {p0, p1, p2, p3}, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 144
    .local v0, "itemView":Landroid/view/View;
    iget-boolean v1, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mIsRootAdapter:Z

    if-eqz v1, :cond_32

    .line 145
    invoke-direct {p0, p1, v0, p3}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->animateViewIfNecessary(ILandroid/view/View;Landroid/view/ViewGroup;)V

    .line 147
    :cond_32
    return-object v0
.end method

.method public getViewAnimator()Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    return-object v0
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "parcelable"    # Landroid/os/Parcelable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 212
    instance-of v1, p1, Landroid/os/Bundle;

    if-eqz v1, :cond_16

    move-object v0, p1

    .line 213
    check-cast v0, Landroid/os/Bundle;

    .line 214
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    if-eqz v1, :cond_16

    .line 215
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    const-string v2, "savedinstancestate_viewanimator"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 218
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_16
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 197
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 199
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    if-eqz v1, :cond_14

    .line 200
    const-string v1, "savedinstancestate_viewanimator"

    iget-object v2, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    invoke-virtual {v2}, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 203
    :cond_14
    return-object v0
.end method

.method public reset()V
    .registers 3

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->getListViewWrapper()Lcom/nhaarman/listviewanimations/util/ListViewWrapper;

    move-result-object v0

    if-nez v0, :cond_e

    .line 106
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Call setAbsListView() on this AnimationAdapter first!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_e
    sget-boolean v0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->$assertionsDisabled:Z

    if-nez v0, :cond_1c

    iget-object v0, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    if-nez v0, :cond_1c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 110
    :cond_1c
    iget-object v0, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    invoke-virtual {v0}, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;->reset()V

    .line 112
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mGridViewPossiblyMeasuring:Z

    .line 113
    const/4 v0, -0x1

    iput v0, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mGridViewMeasuringPosition:I

    .line 115
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->getDecoratedBaseAdapter()Landroid/widget/BaseAdapter;

    move-result-object v0

    instance-of v0, v0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;

    if-eqz v0, :cond_38

    .line 116
    invoke-virtual {p0}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->getDecoratedBaseAdapter()Landroid/widget/BaseAdapter;

    move-result-object v0

    check-cast v0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;

    invoke-virtual {v0}, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->reset()V

    .line 118
    :cond_38
    return-void
.end method

.method public setListViewWrapper(Lcom/nhaarman/listviewanimations/util/ListViewWrapper;)V
    .registers 3
    .param p1, "listViewWrapper"    # Lcom/nhaarman/listviewanimations/util/ListViewWrapper;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 89
    invoke-super {p0, p1}, Lcom/nhaarman/listviewanimations/BaseAdapterDecorator;->setListViewWrapper(Lcom/nhaarman/listviewanimations/util/ListViewWrapper;)V

    .line 90
    new-instance v0, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    invoke-direct {v0, p1}, Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;-><init>(Lcom/nhaarman/listviewanimations/util/ListViewWrapper;)V

    iput-object v0, p0, Lcom/nhaarman/listviewanimations/appearance/AnimationAdapter;->mViewAnimator:Lcom/nhaarman/listviewanimations/appearance/ViewAnimator;

    .line 91
    return-void
.end method
