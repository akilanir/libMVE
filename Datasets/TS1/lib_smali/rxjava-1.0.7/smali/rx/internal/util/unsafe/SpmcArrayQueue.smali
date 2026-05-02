.class public final Lrx/internal/util/unsafe/SpmcArrayQueue;
.super Lrx/internal/util/unsafe/SpmcArrayQueueL3Pad;
.source "SpmcArrayQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/util/unsafe/SpmcArrayQueueL3Pad",
        "<TE;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "capacity"    # I

    .prologue
    .line 128
    .local p0, "this":Lrx/internal/util/unsafe/SpmcArrayQueue;, "Lrx/internal/util/unsafe/SpmcArrayQueue<TE;>;"
    invoke-direct {p0, p1}, Lrx/internal/util/unsafe/SpmcArrayQueueL3Pad;-><init>(I)V

    .line 129
    return-void
.end method


# virtual methods
.method public isEmpty()Z
    .registers 5

    .prologue
    .line 227
    .local p0, "this":Lrx/internal/util/unsafe/SpmcArrayQueue;, "Lrx/internal/util/unsafe/SpmcArrayQueue<TE;>;"
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvConsumerIndex()J

    move-result-wide v0

    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvProducerIndex()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public offer(Ljava/lang/Object;)Z
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "this":Lrx/internal/util/unsafe/SpmcArrayQueue;, "Lrx/internal/util/unsafe/SpmcArrayQueue<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    if-nez p1, :cond_a

    .line 134
    new-instance v9, Ljava/lang/NullPointerException;

    const-string v10, "Null is not a valid element"

    invoke-direct {v9, v10}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 136
    :cond_a
    iget-object v4, p0, Lrx/internal/util/unsafe/SpmcArrayQueue;->buffer:[Ljava/lang/Object;

    .line 137
    .local v4, "lb":[Ljava/lang/Object;, "[TE;"
    iget-wide v2, p0, Lrx/internal/util/unsafe/SpmcArrayQueue;->mask:J

    .line 138
    .local v2, "lMask":J
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvProducerIndex()J

    move-result-wide v0

    .line 139
    .local v0, "currProducerIndex":J
    invoke-virtual {p0, v0, v1}, Lrx/internal/util/unsafe/SpmcArrayQueue;->calcElementOffset(J)J

    move-result-wide v5

    .line 140
    .local v5, "offset":J
    invoke-virtual {p0, v4, v5, v6}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvElement([Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_2e

    .line 141
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvConsumerIndex()J

    move-result-wide v9

    sub-long v7, v0, v9

    .line 143
    .local v7, "size":J
    cmp-long v9, v7, v2

    if-lez v9, :cond_28

    .line 144
    const/4 v9, 0x0

    .line 155
    .end local v7    # "size":J
    :goto_27
    return v9

    .line 148
    .restart local v7    # "size":J
    :cond_28
    invoke-virtual {p0, v4, v5, v6}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvElement([Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v9

    if-nez v9, :cond_28

    .line 151
    .end local v7    # "size":J
    :cond_2e
    invoke-virtual {p0, v4, v5, v6, p1}, Lrx/internal/util/unsafe/SpmcArrayQueue;->spElement([Ljava/lang/Object;JLjava/lang/Object;)V

    .line 154
    const-wide/16 v9, 0x1

    add-long/2addr v9, v0

    invoke-virtual {p0, v9, v10}, Lrx/internal/util/unsafe/SpmcArrayQueue;->soTail(J)V

    .line 155
    const/4 v9, 0x1

    goto :goto_27
.end method

.method public peek()Ljava/lang/Object;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 187
    .local p0, "this":Lrx/internal/util/unsafe/SpmcArrayQueue;, "Lrx/internal/util/unsafe/SpmcArrayQueue<TE;>;"
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvProducerIndexCache()J

    move-result-wide v2

    .line 190
    .local v2, "currProducerIndexCache":J
    :cond_4
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvConsumerIndex()J

    move-result-wide v4

    .line 191
    .local v4, "currentConsumerIndex":J
    cmp-long v7, v4, v2

    if-ltz v7, :cond_19

    .line 192
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvProducerIndex()J

    move-result-wide v0

    .line 193
    .local v0, "currProducerIndex":J
    cmp-long v7, v4, v0

    if-ltz v7, :cond_16

    .line 194
    const/4 v6, 0x0

    .line 200
    .end local v0    # "currProducerIndex":J
    :goto_15
    return-object v6

    .line 196
    .restart local v0    # "currProducerIndex":J
    :cond_16
    invoke-virtual {p0, v0, v1}, Lrx/internal/util/unsafe/SpmcArrayQueue;->svProducerIndexCache(J)V

    .line 199
    .end local v0    # "currProducerIndex":J
    :cond_19
    invoke-virtual {p0, v4, v5}, Lrx/internal/util/unsafe/SpmcArrayQueue;->calcElementOffset(J)J

    move-result-wide v7

    invoke-virtual {p0, v7, v8}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvElement(J)Ljava/lang/Object;

    move-result-object v6

    .local v6, "e":Ljava/lang/Object;, "TE;"
    if-eqz v6, :cond_4

    goto :goto_15
.end method

.method public poll()Ljava/lang/Object;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lrx/internal/util/unsafe/SpmcArrayQueue;, "Lrx/internal/util/unsafe/SpmcArrayQueue<TE;>;"
    const/4 v10, 0x0

    .line 161
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvProducerIndexCache()J

    move-result-wide v2

    .line 163
    .local v2, "currProducerIndexCache":J
    :cond_5
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvConsumerIndex()J

    move-result-wide v4

    .line 164
    .local v4, "currentConsumerIndex":J
    cmp-long v11, v4, v2

    if-ltz v11, :cond_1a

    .line 165
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvProducerIndex()J

    move-result-wide v0

    .line 166
    .local v0, "currProducerIndex":J
    cmp-long v11, v4, v0

    if-ltz v11, :cond_17

    move-object v6, v10

    .line 181
    .end local v0    # "currProducerIndex":J
    :goto_16
    return-object v6

    .line 169
    .restart local v0    # "currProducerIndex":J
    :cond_17
    invoke-virtual {p0, v0, v1}, Lrx/internal/util/unsafe/SpmcArrayQueue;->svProducerIndexCache(J)V

    .line 172
    .end local v0    # "currProducerIndex":J
    :cond_1a
    const-wide/16 v11, 0x1

    add-long/2addr v11, v4

    invoke-virtual {p0, v4, v5, v11, v12}, Lrx/internal/util/unsafe/SpmcArrayQueue;->casHead(JJ)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 175
    invoke-virtual {p0, v4, v5}, Lrx/internal/util/unsafe/SpmcArrayQueue;->calcElementOffset(J)J

    move-result-wide v8

    .line 176
    .local v8, "offset":J
    iget-object v7, p0, Lrx/internal/util/unsafe/SpmcArrayQueue;->buffer:[Ljava/lang/Object;

    .line 178
    .local v7, "lb":[Ljava/lang/Object;, "[TE;"
    invoke-virtual {p0, v7, v8, v9}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lpElement([Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v6

    .line 180
    .local v6, "e":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, v7, v8, v9, v10}, Lrx/internal/util/unsafe/SpmcArrayQueue;->soElement([Ljava/lang/Object;JLjava/lang/Object;)V

    goto :goto_16
.end method

.method public size()I
    .registers 9

    .prologue
    .line 210
    .local p0, "this":Lrx/internal/util/unsafe/SpmcArrayQueue;, "Lrx/internal/util/unsafe/SpmcArrayQueue<TE;>;"
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvConsumerIndex()J

    move-result-wide v0

    .line 212
    .local v0, "after":J
    :cond_4
    move-wide v2, v0

    .line 213
    .local v2, "before":J
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvProducerIndex()J

    move-result-wide v4

    .line 214
    .local v4, "currentProducerIndex":J
    invoke-virtual {p0}, Lrx/internal/util/unsafe/SpmcArrayQueue;->lvConsumerIndex()J

    move-result-wide v0

    .line 215
    cmp-long v6, v2, v0

    if-nez v6, :cond_4

    .line 216
    sub-long v6, v4, v0

    long-to-int v6, v6

    return v6
.end method
