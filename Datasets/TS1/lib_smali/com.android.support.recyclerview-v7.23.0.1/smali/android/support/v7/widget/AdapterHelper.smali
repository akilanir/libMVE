.class Landroid/support/v7/widget/AdapterHelper;
.super Ljava/lang/Object;
.source "AdapterHelper.java"

# interfaces
.implements Landroid/support/v7/widget/OpReorderer$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/AdapterHelper$Callback;,
        Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field static final POSITION_TYPE_INVISIBLE:I = 0x0

.field static final POSITION_TYPE_NEW_OR_LAID_OUT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AHT"


# instance fields
.field final mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

.field final mDisableRecycler:Z

.field mOnItemProcessedCallback:Ljava/lang/Runnable;

.field final mOpReorderer:Landroid/support/v7/widget/OpReorderer;

.field final mPendingUpdates:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;"
        }
    .end annotation
.end field

.field final mPostponedList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;"
        }
    .end annotation
.end field

.field private mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/Pools$Pool",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/support/v7/widget/AdapterHelper$Callback;)V
    .registers 3
    .param p1, "callback"    # Landroid/support/v7/widget/AdapterHelper$Callback;

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/AdapterHelper;-><init>(Landroid/support/v7/widget/AdapterHelper$Callback;Z)V

    .line 72
    return-void
.end method

.method constructor <init>(Landroid/support/v7/widget/AdapterHelper$Callback;Z)V
    .registers 5
    .param p1, "callback"    # Landroid/support/v7/widget/AdapterHelper$Callback;
    .param p2, "disableRecycler"    # Z

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Landroid/support/v4/util/Pools$SimplePool;

    const/16 v1, 0x1e

    invoke-direct {v0, v1}, Landroid/support/v4/util/Pools$SimplePool;-><init>(I)V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    .line 75
    iput-object p1, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    .line 76
    iput-boolean p2, p0, Landroid/support/v7/widget/AdapterHelper;->mDisableRecycler:Z

    .line 77
    new-instance v0, Landroid/support/v7/widget/OpReorderer;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/OpReorderer;-><init>(Landroid/support/v7/widget/OpReorderer$Callback;)V

    iput-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mOpReorderer:Landroid/support/v7/widget/OpReorderer;

    .line 78
    return-void
.end method

.method private applyAdd(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 2
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    .line 429
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 430
    return-void
.end method

.method private applyMove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 2
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    .line 127
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 128
    return-void
.end method

.method private applyRemove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 14
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 131
    iget v4, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 132
    .local v4, "tmpStart":I
    const/4 v2, 0x0

    .line 133
    .local v2, "tmpCount":I
    iget v8, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v9, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int v3, v8, v9

    .line 134
    .local v3, "tmpEnd":I
    const/4 v5, -0x1

    .line 135
    .local v5, "type":I
    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .local v1, "position":I
    :goto_e
    if-ge v1, v3, :cond_41

    .line 136
    const/4 v6, 0x0

    .line 137
    .local v6, "typeChanged":Z
    iget-object v8, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v8, v1}, Landroid/support/v7/widget/AdapterHelper$Callback;->findViewHolder(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v7

    .line 138
    .local v7, "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-nez v7, :cond_1f

    invoke-direct {p0, v1}, Landroid/support/v7/widget/AdapterHelper;->canFindInPreLayout(I)Z

    move-result v8

    if-eqz v8, :cond_32

    .line 145
    :cond_1f
    if-nez v5, :cond_29

    .line 148
    invoke-virtual {p0, v10, v4, v2, v11}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v0

    .line 149
    .local v0, "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-direct {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 150
    const/4 v6, 0x1

    .line 152
    .end local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_29
    const/4 v5, 0x1

    .line 165
    :goto_2a
    if-eqz v6, :cond_3e

    .line 166
    sub-int/2addr v1, v2

    .line 167
    sub-int/2addr v3, v2

    .line 168
    const/4 v2, 0x1

    .line 135
    :goto_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 156
    :cond_32
    if-ne v5, v10, :cond_3c

    .line 159
    invoke-virtual {p0, v10, v4, v2, v11}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v0

    .line 160
    .restart local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-direct {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 161
    const/4 v6, 0x1

    .line 163
    .end local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_3c
    const/4 v5, 0x0

    goto :goto_2a

    .line 170
    :cond_3e
    add-int/lit8 v2, v2, 0x1

    goto :goto_2f

    .line 173
    .end local v6    # "typeChanged":Z
    .end local v7    # "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_41
    iget v8, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-eq v2, v8, :cond_4c

    .line 174
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 175
    invoke-virtual {p0, v10, v4, v2, v11}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object p1

    .line 177
    :cond_4c
    if-nez v5, :cond_52

    .line 178
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 182
    :goto_51
    return-void

    .line 180
    :cond_52
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_51
.end method

.method private applyUpdate(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 13
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    const/4 v10, 0x2

    .line 185
    iget v5, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 186
    .local v5, "tmpStart":I
    const/4 v3, 0x0

    .line 187
    .local v3, "tmpCount":I
    iget v8, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v9, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int v4, v8, v9

    .line 188
    .local v4, "tmpEnd":I
    const/4 v6, -0x1

    .line 189
    .local v6, "type":I
    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .local v2, "position":I
    :goto_d
    if-ge v2, v4, :cond_40

    .line 190
    iget-object v8, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v8, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->findViewHolder(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v7

    .line 191
    .local v7, "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-nez v7, :cond_1d

    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->canFindInPreLayout(I)Z

    move-result v8

    if-eqz v8, :cond_30

    .line 192
    :cond_1d
    if-nez v6, :cond_2a

    .line 193
    iget-object v8, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-virtual {p0, v10, v5, v3, v8}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v0

    .line 195
    .local v0, "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-direct {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 196
    const/4 v3, 0x0

    .line 197
    move v5, v2

    .line 199
    .end local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_2a
    const/4 v6, 0x1

    .line 210
    :goto_2b
    add-int/lit8 v3, v3, 0x1

    .line 189
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 201
    :cond_30
    const/4 v8, 0x1

    if-ne v6, v8, :cond_3e

    .line 202
    iget-object v8, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-virtual {p0, v10, v5, v3, v8}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v0

    .line 204
    .restart local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-direct {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 205
    const/4 v3, 0x0

    .line 206
    move v5, v2

    .line 208
    .end local v0    # "newOp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_3e
    const/4 v6, 0x0

    goto :goto_2b

    .line 212
    .end local v7    # "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_40
    iget v8, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-eq v3, v8, :cond_4d

    .line 213
    iget-object v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    .line 214
    .local v1, "payload":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 215
    invoke-virtual {p0, v10, v5, v3, v1}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object p1

    .line 217
    .end local v1    # "payload":Ljava/lang/Object;
    :cond_4d
    if-nez v6, :cond_53

    .line 218
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 222
    :goto_52
    return-void

    .line 220
    :cond_53
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_52
.end method

.method private canFindInPreLayout(I)Z
    .registers 10
    .param p1, "position"    # I

    .prologue
    const/4 v5, 0x1

    .line 408
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 409
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    if-ge v2, v0, :cond_3e

    .line 410
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 411
    .local v3, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v7, 0x3

    if-ne v6, v7, :cond_22

    .line 412
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p0, v6, v7}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v6

    if-ne v6, p1, :cond_3b

    .line 425
    .end local v3    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_21
    :goto_21
    return v5

    .line 415
    .restart local v3    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_22
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-nez v6, :cond_3b

    .line 417
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v7, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int v1, v6, v7

    .line 418
    .local v1, "end":I
    iget v4, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .local v4, "pos":I
    :goto_2e
    if-ge v4, v1, :cond_3b

    .line 419
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {p0, v4, v6}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v6

    if-eq v6, p1, :cond_21

    .line 418
    add-int/lit8 v4, v4, 0x1

    goto :goto_2e

    .line 409
    .end local v1    # "end":I
    .end local v4    # "pos":I
    :cond_3b
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 425
    .end local v3    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_3e
    const/4 v5, 0x0

    goto :goto_21
.end method

.method private dispatchAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 16
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 228
    iget v12, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-eqz v12, :cond_b

    iget v12, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v13, 0x3

    if-ne v12, v13, :cond_13

    .line 229
    :cond_b
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string v11, "should not dispatch add or move for pre layout"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 242
    :cond_13
    iget v12, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v13, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    invoke-direct {p0, v12, v13}, Landroid/support/v7/widget/AdapterHelper;->updatePositionWithPostponed(II)I

    move-result v8

    .line 246
    .local v8, "tmpStart":I
    const/4 v7, 0x1

    .line 247
    .local v7, "tmpCnt":I
    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 249
    .local v1, "offsetPositionForPartial":I
    iget v12, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v12, :pswitch_data_96

    .line 257
    new-instance v10, Ljava/lang/IllegalArgumentException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "op should be remove or update."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 251
    :pswitch_3c
    const/4 v5, 0x1

    .line 259
    .local v5, "positionMultiplier":I
    :goto_3d
    const/4 v2, 0x1

    .local v2, "p":I
    :goto_3e
    iget v12, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-ge v2, v12, :cond_82

    .line 260
    iget v12, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    mul-int v13, v5, v2

    add-int v4, v12, v13

    .line 261
    .local v4, "pos":I
    iget v12, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    invoke-direct {p0, v4, v12}, Landroid/support/v7/widget/AdapterHelper;->updatePositionWithPostponed(II)I

    move-result v9

    .line 265
    .local v9, "updatedPos":I
    const/4 v0, 0x0

    .line 266
    .local v0, "continuous":Z
    iget v12, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v12, :pswitch_data_9e

    .line 274
    :goto_54
    if-eqz v0, :cond_6b

    .line 275
    add-int/lit8 v7, v7, 0x1

    .line 259
    :goto_58
    add-int/lit8 v2, v2, 0x1

    goto :goto_3e

    .line 254
    .end local v0    # "continuous":Z
    .end local v2    # "p":I
    .end local v4    # "pos":I
    .end local v5    # "positionMultiplier":I
    .end local v9    # "updatedPos":I
    :pswitch_5b
    const/4 v5, 0x0

    .line 255
    .restart local v5    # "positionMultiplier":I
    goto :goto_3d

    .line 268
    .restart local v0    # "continuous":Z
    .restart local v2    # "p":I
    .restart local v4    # "pos":I
    .restart local v9    # "updatedPos":I
    :pswitch_5d
    add-int/lit8 v12, v8, 0x1

    if-ne v9, v12, :cond_63

    move v0, v10

    .line 269
    :goto_62
    goto :goto_54

    :cond_63
    move v0, v11

    .line 268
    goto :goto_62

    .line 271
    :pswitch_65
    if-ne v9, v8, :cond_69

    move v0, v10

    :goto_68
    goto :goto_54

    :cond_69
    move v0, v11

    goto :goto_68

    .line 278
    :cond_6b
    iget v12, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    iget-object v13, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-virtual {p0, v12, v8, v7, v13}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v6

    .line 282
    .local v6, "tmp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-virtual {p0, v6, v1}, Landroid/support/v7/widget/AdapterHelper;->dispatchFirstPassAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;I)V

    .line 283
    invoke-virtual {p0, v6}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 284
    iget v12, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v13, 0x2

    if-ne v12, v13, :cond_7f

    .line 285
    add-int/2addr v1, v7

    .line 287
    :cond_7f
    move v8, v9

    .line 288
    const/4 v7, 0x1

    goto :goto_58

    .line 291
    .end local v0    # "continuous":Z
    .end local v4    # "pos":I
    .end local v6    # "tmp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .end local v9    # "updatedPos":I
    :cond_82
    iget-object v3, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    .line 292
    .local v3, "payload":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 293
    if-lez v7, :cond_95

    .line 294
    iget v10, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    invoke-virtual {p0, v10, v8, v7, v3}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v6

    .line 298
    .restart local v6    # "tmp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-virtual {p0, v6, v1}, Landroid/support/v7/widget/AdapterHelper;->dispatchFirstPassAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;I)V

    .line 299
    invoke-virtual {p0, v6}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 309
    .end local v6    # "tmp":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_95
    return-void

    .line 249
    :pswitch_data_96
    .packed-switch 0x1
        :pswitch_5b
        :pswitch_3c
    .end packed-switch

    .line 266
    :pswitch_data_9e
    .packed-switch 0x1
        :pswitch_65
        :pswitch_5d
    .end packed-switch
.end method

.method private postponeAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 6
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    .line 436
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 437
    iget v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v0, :pswitch_data_4e

    .line 452
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown update op type for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 439
    :pswitch_23
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForAdd(II)V

    .line 454
    :goto_2c
    return-void

    .line 442
    :pswitch_2d
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForMove(II)V

    goto :goto_2c

    .line 445
    :pswitch_37
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForRemovingLaidOutOrNewView(II)V

    goto :goto_2c

    .line 449
    :pswitch_41
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget-object v3, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-interface {v0, v1, v2, v3}, Landroid/support/v7/widget/AdapterHelper$Callback;->markViewHoldersUpdated(IILjava/lang/Object;)V

    goto :goto_2c

    .line 437
    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_23
        :pswitch_37
        :pswitch_41
        :pswitch_2d
    .end packed-switch
.end method

.method private updatePositionWithPostponed(II)I
    .registers 13
    .param p1, "pos"    # I
    .param p2, "cmd"    # I

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x1

    .line 327
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 328
    .local v0, "count":I
    add-int/lit8 v2, v0, -0x1

    .local v2, "i":I
    :goto_a
    if-ltz v2, :cond_a1

    .line 329
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 330
    .local v4, "postponed":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-ne v6, v9, :cond_7b

    .line 332
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v7, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-ge v6, v7, :cond_37

    .line 333
    iget v5, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 334
    .local v5, "start":I
    iget v1, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 339
    .local v1, "end":I
    :goto_22
    if-lt p1, v5, :cond_59

    if-gt p1, v1, :cond_59

    .line 341
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v5, v6, :cond_45

    .line 342
    if-nez p2, :cond_3c

    .line 343
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 348
    :cond_32
    :goto_32
    add-int/lit8 p1, p1, 0x1

    .line 328
    .end local v1    # "end":I
    .end local v5    # "start":I
    :cond_34
    :goto_34
    add-int/lit8 v2, v2, -0x1

    goto :goto_a

    .line 336
    :cond_37
    iget v5, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 337
    .restart local v5    # "start":I
    iget v1, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .restart local v1    # "end":I
    goto :goto_22

    .line 344
    :cond_3c
    if-ne p2, v8, :cond_32

    .line 345
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_32

    .line 350
    :cond_45
    if-nez p2, :cond_50

    .line 351
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 356
    :cond_4d
    :goto_4d
    add-int/lit8 p1, p1, -0x1

    goto :goto_34

    .line 352
    :cond_50
    if-ne p2, v8, :cond_4d

    .line 353
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_4d

    .line 358
    :cond_59
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge p1, v6, :cond_34

    .line 360
    if-nez p2, :cond_6c

    .line 361
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 362
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_34

    .line 363
    :cond_6c
    if-ne p2, v8, :cond_34

    .line 364
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 365
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_34

    .line 369
    .end local v1    # "end":I
    .end local v5    # "start":I
    :cond_7b
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v6, p1, :cond_8f

    .line 370
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-nez v6, :cond_87

    .line 371
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr p1, v6

    goto :goto_34

    .line 372
    :cond_87
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-ne v6, v8, :cond_34

    .line 373
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr p1, v6

    goto :goto_34

    .line 376
    :cond_8f
    if-nez p2, :cond_98

    .line 377
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_34

    .line 378
    :cond_98
    if-ne p2, v8, :cond_34

    .line 379
    iget v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v4, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    goto :goto_34

    .line 392
    .end local v4    # "postponed":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_a1
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v2, v6, -0x1

    :goto_a9
    if-ltz v2, :cond_d9

    .line 393
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 394
    .local v3, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-ne v6, v9, :cond_cc

    .line 395
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v7, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-eq v6, v7, :cond_c1

    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gez v6, :cond_c9

    .line 396
    :cond_c1
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 397
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 392
    :cond_c9
    :goto_c9
    add-int/lit8 v2, v2, -0x1

    goto :goto_a9

    .line 399
    :cond_cc
    iget v6, v3, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gtz v6, :cond_c9

    .line 400
    iget-object v6, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 401
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_c9

    .line 404
    .end local v3    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_d9
    return p1
.end method


# virtual methods
.method varargs addUpdateOp([Landroid/support/v7/widget/AdapterHelper$UpdateOp;)Landroid/support/v7/widget/AdapterHelper;
    .registers 3
    .param p1, "ops"    # [Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    .line 81
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 82
    return-object p0
.end method

.method public applyPendingUpdatesToPosition(I)I
    .registers 8
    .param p1, "position"    # I

    .prologue
    .line 567
    iget-object v4, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 568
    .local v3, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v3, :cond_2e

    .line 569
    iget-object v4, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 570
    .local v2, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v4, :pswitch_data_48

    .line 568
    :cond_16
    :goto_16
    :pswitch_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 572
    :pswitch_19
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v4, p1, :cond_16

    .line 573
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr p1, v4

    goto :goto_16

    .line 577
    :pswitch_21
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v4, p1, :cond_16

    .line 578
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int v0, v4, v5

    .line 579
    .local v0, "end":I
    if-le v0, p1, :cond_2f

    .line 580
    const/4 p1, -0x1

    .line 599
    .end local v0    # "end":I
    .end local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .end local p1    # "position":I
    :cond_2e
    return p1

    .line 582
    .restart local v0    # "end":I
    .restart local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .restart local p1    # "position":I
    :cond_2f
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr p1, v4

    .line 583
    goto :goto_16

    .line 586
    .end local v0    # "end":I
    :pswitch_33
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v4, p1, :cond_3a

    .line 587
    iget p1, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    goto :goto_16

    .line 589
    :cond_3a
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge v4, p1, :cond_40

    .line 590
    add-int/lit8 p1, p1, -0x1

    .line 592
    :cond_40
    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gt v4, p1, :cond_16

    .line 593
    add-int/lit8 p1, p1, 0x1

    goto :goto_16

    .line 570
    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_19
        :pswitch_21
        :pswitch_16
        :pswitch_33
    .end packed-switch
.end method

.method consumePostponedUpdates()V
    .registers 5

    .prologue
    .line 117
    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 118
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v0, :cond_19

    .line 119
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 118
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 121
    :cond_19
    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    .line 122
    return-void
.end method

.method consumeUpdatesInOnePass()V
    .registers 8

    .prologue
    .line 537
    invoke-virtual {p0}, Landroid/support/v7/widget/AdapterHelper;->consumePostponedUpdates()V

    .line 538
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 539
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    if-ge v1, v0, :cond_63

    .line 540
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 541
    .local v2, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v3, :pswitch_data_6a

    .line 559
    :goto_19
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    if-eqz v3, :cond_22

    .line 560
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 539
    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 543
    :pswitch_25
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 544
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v3, v4, v5}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForAdd(II)V

    goto :goto_19

    .line 547
    :pswitch_34
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 548
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v3, v4, v5}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForRemovingInvisible(II)V

    goto :goto_19

    .line 551
    :pswitch_43
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 552
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget-object v6, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-interface {v3, v4, v5, v6}, Landroid/support/v7/widget/AdapterHelper$Callback;->markViewHoldersUpdated(IILjava/lang/Object;)V

    goto :goto_19

    .line 555
    :pswitch_54
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v3, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchSecondPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 556
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v5, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v3, v4, v5}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForMove(II)V

    goto :goto_19

    .line 563
    .end local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_63
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    .line 564
    return-void

    .line 541
    nop

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_25
        :pswitch_34
        :pswitch_43
        :pswitch_54
    .end packed-switch
.end method

.method dispatchFirstPassAndUpdateViewHolders(Landroid/support/v7/widget/AdapterHelper$UpdateOp;I)V
    .registers 6
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .param p2, "offsetStart"    # I

    .prologue
    .line 312
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/AdapterHelper$Callback;->onDispatchFirstPass(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 313
    iget v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v0, :pswitch_data_24

    .line 321
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "only remove and update ops can be dispatched in first pass"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 315
    :pswitch_12
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-interface {v0, p2, v1}, Landroid/support/v7/widget/AdapterHelper$Callback;->offsetPositionsForRemovingInvisible(II)V

    .line 324
    :goto_19
    return-void

    .line 318
    :pswitch_1a
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mCallback:Landroid/support/v7/widget/AdapterHelper$Callback;

    iget v1, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget-object v2, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-interface {v0, p2, v1, v2}, Landroid/support/v7/widget/AdapterHelper$Callback;->markViewHoldersUpdated(IILjava/lang/Object;)V

    goto :goto_19

    .line 313
    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_12
        :pswitch_1a
    .end packed-switch
.end method

.method findPositionOffset(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 461
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(II)I

    move-result v0

    return v0
.end method

.method findPositionOffset(II)I
    .registers 8
    .param p1, "position"    # I
    .param p2, "firstPostponedItem"    # I

    .prologue
    .line 465
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 466
    .local v0, "count":I
    move v1, p2

    .local v1, "i":I
    :goto_7
    if-ge v1, v0, :cond_3d

    .line 467
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 468
    .local v2, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_2c

    .line 469
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v3, p1, :cond_1f

    .line 470
    iget p1, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 466
    :cond_1c
    :goto_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 472
    :cond_1f
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ge v3, p1, :cond_25

    .line 473
    add-int/lit8 p1, p1, -0x1

    .line 475
    :cond_25
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-gt v3, p1, :cond_1c

    .line 476
    add-int/lit8 p1, p1, 0x1

    goto :goto_1c

    .line 479
    :cond_2c
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-gt v3, p1, :cond_1c

    .line 480
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_42

    .line 481
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v3, v4

    if-ge p1, v3, :cond_3e

    .line 482
    const/4 p1, -0x1

    .line 490
    .end local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .end local p1    # "position":I
    :cond_3d
    return p1

    .line 484
    .restart local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .restart local p1    # "position":I
    :cond_3e
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    sub-int/2addr p1, v3

    goto :goto_1c

    .line 485
    :cond_42
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-nez v3, :cond_1c

    .line 486
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr p1, v3

    goto :goto_1c
.end method

.method hasPendingUpdates()Z
    .registers 2

    .prologue
    .line 457
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    .registers 7
    .param p1, "cmd"    # I
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I
    .param p4, "payload"    # Ljava/lang/Object;

    .prologue
    .line 702
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v1}, Landroid/support/v4/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 703
    .local v0, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    if-nez v0, :cond_10

    .line 704
    new-instance v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .end local v0    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    invoke-direct {v0, p1, p2, p3, p4}, Landroid/support/v7/widget/AdapterHelper$UpdateOp;-><init>(IIILjava/lang/Object;)V

    .line 711
    .restart local v0    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :goto_f
    return-object v0

    .line 706
    :cond_10
    iput p1, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    .line 707
    iput p2, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    .line 708
    iput p3, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    .line 709
    iput-object p4, v0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    goto :goto_f
.end method

.method onItemRangeChanged(IILjava/lang/Object;)Z
    .registers 7
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I
    .param p3, "payload"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 497
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    const/4 v2, 0x2

    invoke-virtual {p0, v2, p1, p2, p3}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 498
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v0, :cond_14

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method onItemRangeInserted(II)Z
    .registers 7
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 505
    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {p0, v1, p1, p2, v3}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 506
    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v2, v0, :cond_15

    :goto_14
    return v0

    :cond_15
    move v0, v1

    goto :goto_14
.end method

.method onItemRangeMoved(III)Z
    .registers 9
    .param p1, "from"    # I
    .param p2, "to"    # I
    .param p3, "itemCount"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 521
    if-ne p1, p2, :cond_5

    .line 528
    :goto_4
    return v1

    .line 524
    :cond_5
    if-eq p3, v0, :cond_f

    .line 525
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Moving more than 1 item is not supported yet"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 527
    :cond_f
    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    const/4 v3, 0x3

    const/4 v4, 0x0

    invoke-virtual {p0, v3, p1, p2, v4}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 528
    iget-object v2, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v2, v0, :cond_24

    :goto_22
    move v1, v0

    goto :goto_4

    :cond_24
    move v0, v1

    goto :goto_22
.end method

.method onItemRangeRemoved(II)Z
    .registers 6
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    const/4 v0, 0x1

    .line 513
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {p0, v0, p1, p2, v2}, Landroid/support/v7/widget/AdapterHelper;->obtainUpdateOp(IIILjava/lang/Object;)Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 514
    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v0, :cond_14

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method preProcess()V
    .registers 6

    .prologue
    .line 91
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOpReorderer:Landroid/support/v7/widget/OpReorderer;

    iget-object v4, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/OpReorderer;->reorderOps(Ljava/util/List;)V

    .line 92
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 93
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    if-ge v1, v0, :cond_39

    .line 94
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .line 95
    .local v2, "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    iget v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v3, :pswitch_data_40

    .line 109
    :goto_1d
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    if-eqz v3, :cond_26

    .line 110
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mOnItemProcessedCallback:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 93
    :cond_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 97
    :pswitch_29
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyAdd(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_1d

    .line 100
    :pswitch_2d
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyRemove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_1d

    .line 103
    :pswitch_31
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyUpdate(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_1d

    .line 106
    :pswitch_35
    invoke-direct {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->applyMove(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    goto :goto_1d

    .line 113
    .end local v2    # "op":Landroid/support/v7/widget/AdapterHelper$UpdateOp;
    :cond_39
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 114
    return-void

    .line 95
    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_29
        :pswitch_2d
        :pswitch_31
        :pswitch_35
    .end packed-switch
.end method

.method public recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V
    .registers 3
    .param p1, "op"    # Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    .prologue
    .line 716
    iget-boolean v0, p0, Landroid/support/v7/widget/AdapterHelper;->mDisableRecycler:Z

    if-nez v0, :cond_c

    .line 717
    const/4 v0, 0x0

    iput-object v0, p1, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    .line 718
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mUpdateOpPool:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0, p1}, Landroid/support/v4/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 720
    :cond_c
    return-void
.end method

.method recycleUpdateOpsAndClearList(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/AdapterHelper$UpdateOp;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 723
    .local p1, "ops":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/AdapterHelper$UpdateOp;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 724
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v0, :cond_13

    .line 725
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOp(Landroid/support/v7/widget/AdapterHelper$UpdateOp;)V

    .line 724
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 727
    :cond_13
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 728
    return-void
.end method

.method reset()V
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPendingUpdates:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    .line 87
    iget-object v0, p0, Landroid/support/v7/widget/AdapterHelper;->mPostponedList:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AdapterHelper;->recycleUpdateOpsAndClearList(Ljava/util/List;)V

    .line 88
    return-void
.end method
