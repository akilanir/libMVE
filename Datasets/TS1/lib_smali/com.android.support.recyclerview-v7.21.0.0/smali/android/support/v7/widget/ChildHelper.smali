.class Landroid/support/v7/widget/ChildHelper;
.super Ljava/lang/Object;
.source "ChildHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/ChildHelper$Callback;,
        Landroid/support/v7/widget/ChildHelper$Bucket;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "ChildrenHelper"


# instance fields
.field final mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

.field final mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

.field final mHiddenViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/support/v7/widget/ChildHelper$Callback;)V
    .registers 3
    .param p1, "callback"    # Landroid/support/v7/widget/ChildHelper$Callback;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    .line 50
    new-instance v0, Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-direct {v0}, Landroid/support/v7/widget/ChildHelper$Bucket;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    .line 52
    return-void
.end method

.method private getOffset(I)I
    .registers 8
    .param p1, "index"    # I

    .prologue
    const/4 v4, -0x1

    .line 90
    if-gez p1, :cond_5

    move v2, v4

    .line 107
    :cond_4
    :goto_4
    return v2

    .line 93
    :cond_5
    iget-object v5, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v5}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildCount()I

    move-result v1

    .line 94
    .local v1, "limit":I
    move v2, p1

    .line 95
    .local v2, "offset":I
    :goto_c
    if-ge v2, v1, :cond_27

    .line 96
    iget-object v5, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/ChildHelper$Bucket;->countOnesBefore(I)I

    move-result v3

    .line 97
    .local v3, "removedBefore":I
    sub-int v5, v2, v3

    sub-int v0, p1, v5

    .line 98
    .local v0, "diff":I
    if-nez v0, :cond_25

    .line 99
    :goto_1a
    iget-object v4, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/ChildHelper$Bucket;->get(I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 100
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 104
    :cond_25
    add-int/2addr v2, v0

    .line 106
    goto :goto_c

    .end local v0    # "diff":I
    .end local v3    # "removedBefore":I
    :cond_27
    move v2, v4

    .line 107
    goto :goto_4
.end method


# virtual methods
.method addView(Landroid/view/View;IZ)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "hidden"    # Z

    .prologue
    .line 74
    if-gez p2, :cond_1a

    .line 75
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildCount()I

    move-result v0

    .line 79
    .local v0, "offset":I
    :goto_8
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, p1, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->addView(Landroid/view/View;I)V

    .line 80
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0, p3}, Landroid/support/v7/widget/ChildHelper$Bucket;->insert(IZ)V

    .line 81
    if-eqz p3, :cond_19

    .line 82
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    :cond_19
    return-void

    .line 77
    .end local v0    # "offset":I
    :cond_1a
    invoke-direct {p0, p2}, Landroid/support/v7/widget/ChildHelper;->getOffset(I)I

    move-result v0

    .restart local v0    # "offset":I
    goto :goto_8
.end method

.method addView(Landroid/view/View;Z)V
    .registers 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "hidden"    # Z

    .prologue
    .line 61
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0, p2}, Landroid/support/v7/widget/ChildHelper;->addView(Landroid/view/View;IZ)V

    .line 62
    return-void
.end method

.method attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)V
    .registers 7
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "layoutParams"    # Landroid/view/ViewGroup$LayoutParams;
    .param p4, "hidden"    # Z

    .prologue
    .line 203
    if-gez p2, :cond_13

    .line 204
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildCount()I

    move-result v0

    .line 208
    .local v0, "offset":I
    :goto_8
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, p1, v0, p3}, Landroid/support/v7/widget/ChildHelper$Callback;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 209
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0, p4}, Landroid/support/v7/widget/ChildHelper$Bucket;->insert(IZ)V

    .line 214
    return-void

    .line 206
    .end local v0    # "offset":I
    :cond_13
    invoke-direct {p0, p2}, Landroid/support/v7/widget/ChildHelper;->getOffset(I)I

    move-result v0

    .restart local v0    # "offset":I
    goto :goto_8
.end method

.method detachViewFromParent(I)V
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 252
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->getOffset(I)I

    move-result v0

    .line 253
    .local v0, "offset":I
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->detachViewFromParent(I)V

    .line 254
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->remove(I)Z

    .line 258
    return-void
.end method

.method findHiddenNonRemovedView(II)Landroid/view/View;
    .registers 8
    .param p1, "position"    # I
    .param p2, "type"    # I

    .prologue
    .line 180
    iget-object v4, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    .line 181
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v0, :cond_30

    .line 182
    iget-object v4, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 183
    .local v3, "view":Landroid/view/View;
    iget-object v4, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v4, v3}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    .line 184
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getPosition()I

    move-result v4

    if-ne v4, p1, :cond_2d

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v4

    if-nez v4, :cond_2d

    const/4 v4, -0x1

    if-eq p2, v4, :cond_2c

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v4

    if-ne v4, p2, :cond_2d

    .line 189
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v3    # "view":Landroid/view/View;
    :cond_2c
    :goto_2c
    return-object v3

    .line 181
    .restart local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .restart local v3    # "view":Landroid/view/View;
    :cond_2d
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 189
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v3    # "view":Landroid/view/View;
    :cond_30
    const/4 v3, 0x0

    goto :goto_2c
.end method

.method getChildAt(I)Landroid/view/View;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 156
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->getOffset(I)I

    move-result v0

    .line 157
    .local v0, "offset":I
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method getChildCount()I
    .registers 3

    .prologue
    .line 223
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildCount()I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method getUnfilteredChildAt(I)Landroid/view/View;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 243
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method getUnfilteredChildCount()I
    .registers 2

    .prologue
    .line 233
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildCount()I

    move-result v0

    return v0
.end method

.method hide(Landroid/view/View;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 298
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 299
    .local v0, "offset":I
    if-gez v0, :cond_21

    .line 300
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "view is not a child, cannot hide "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 305
    :cond_21
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->set(I)V

    .line 306
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    return-void
.end method

.method indexOfChild(Landroid/view/View;)I
    .registers 5
    .param p1, "child"    # Landroid/view/View;

    .prologue
    const/4 v1, -0x1

    .line 267
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v2, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 268
    .local v0, "index":I
    if-ne v0, v1, :cond_a

    .line 279
    :cond_9
    :goto_9
    return v1

    .line 271
    :cond_a
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->get(I)Z

    move-result v2

    if-nez v2, :cond_9

    .line 279
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->countOnesBefore(I)I

    move-result v1

    sub-int v1, v0, v1

    goto :goto_9
.end method

.method isHidden(Landroid/view/View;)Z
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 289
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method removeAllViewsUnfiltered()V
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v0}, Landroid/support/v7/widget/ChildHelper$Callback;->removeAllViews()V

    .line 165
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->reset()V

    .line 166
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 170
    return-void
.end method

.method removeView(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 116
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 117
    .local v0, "index":I
    if-gez v0, :cond_9

    .line 127
    :cond_8
    :goto_8
    return-void

    .line 120
    :cond_9
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v1, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->removeViewAt(I)V

    .line 121
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->remove(I)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 122
    iget-object v1, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_8
.end method

.method removeViewAt(I)V
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 136
    invoke-direct {p0, p1}, Landroid/support/v7/widget/ChildHelper;->getOffset(I)I

    move-result v0

    .line 137
    .local v0, "offset":I
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v2, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 138
    .local v1, "view":Landroid/view/View;
    if-nez v1, :cond_d

    .line 148
    :cond_c
    :goto_c
    return-void

    .line 141
    :cond_d
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v2, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->removeViewAt(I)V

    .line 142
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->remove(I)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 143
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_c
.end method

.method removeViewIfHidden(Landroid/view/View;)Z
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x1

    .line 324
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v2, p1}, Landroid/support/v7/widget/ChildHelper$Callback;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 325
    .local v0, "index":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_13

    .line 326
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 340
    :cond_12
    :goto_12
    return v1

    .line 331
    :cond_13
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->get(I)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 332
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->remove(I)Z

    .line 333
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mCallback:Landroid/support/v7/widget/ChildHelper$Callback;

    invoke-interface {v2, v0}, Landroid/support/v7/widget/ChildHelper$Callback;->removeViewAt(I)V

    .line 334
    iget-object v2, p0, Landroid/support/v7/widget/ChildHelper;->mHiddenViews:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    goto :goto_12

    .line 340
    :cond_2e
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 314
    iget-object v0, p0, Landroid/support/v7/widget/ChildHelper;->mBucket:Landroid/support/v7/widget/ChildHelper$Bucket;

    invoke-virtual {v0}, Landroid/support/v7/widget/ChildHelper$Bucket;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
