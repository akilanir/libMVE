.class public final Lcom/google/android/exoplayer/DefaultLoadControl;
.super Ljava/lang/Object;
.source "DefaultLoadControl.java"

# interfaces
.implements Lcom/google/android/exoplayer/LoadControl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;,
        Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;
    }
.end annotation


# static fields
.field private static final ABOVE_HIGH_WATERMARK:I = 0x0

.field private static final BELOW_LOW_WATERMARK:I = 0x2

.field private static final BETWEEN_WATERMARKS:I = 0x1

.field public static final DEFAULT_HIGH_BUFFER_LOAD:F = 0.8f

.field public static final DEFAULT_HIGH_WATERMARK_MS:I = 0x7530

.field public static final DEFAULT_LOW_BUFFER_LOAD:F = 0.2f

.field public static final DEFAULT_LOW_WATERMARK_MS:I = 0x3a98


# instance fields
.field private final allocator:Lcom/google/android/exoplayer/upstream/Allocator;

.field private bufferState:I

.field private final eventHandler:Landroid/os/Handler;

.field private final eventListener:Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;

.field private fillingBuffers:Z

.field private final highBufferLoad:F

.field private final highWatermarkUs:J

.field private final loaderStates:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;",
            ">;"
        }
    .end annotation
.end field

.field private final loaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final lowBufferLoad:F

.field private final lowWatermarkUs:J

.field private maxLoadStartPositionUs:J

.field private streamingPrioritySet:Z

.field private targetBufferSize:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/Allocator;)V
    .registers 3
    .param p1, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;

    .prologue
    const/4 v0, 0x0

    .line 90
    invoke-direct {p0, p1, v0, v0}, Lcom/google/android/exoplayer/DefaultLoadControl;-><init>(Lcom/google/android/exoplayer/upstream/Allocator;Landroid/os/Handler;Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/Allocator;Landroid/os/Handler;Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;)V
    .registers 12
    .param p1, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;
    .param p2, "eventHandler"    # Landroid/os/Handler;
    .param p3, "eventListener"    # Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;

    .prologue
    .line 103
    const/16 v4, 0x3a98

    const/16 v5, 0x7530

    const v6, 0x3e4ccccd    # 0.2f

    const v7, 0x3f4ccccd    # 0.8f

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/DefaultLoadControl;-><init>(Lcom/google/android/exoplayer/upstream/Allocator;Landroid/os/Handler;Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;IIFF)V

    .line 105
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer/upstream/Allocator;Landroid/os/Handler;Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;IIFF)V
    .registers 12
    .param p1, "allocator"    # Lcom/google/android/exoplayer/upstream/Allocator;
    .param p2, "eventHandler"    # Landroid/os/Handler;
    .param p3, "eventListener"    # Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;
    .param p4, "lowWatermarkMs"    # I
    .param p5, "highWatermarkMs"    # I
    .param p6, "lowBufferLoad"    # F
    .param p7, "highBufferLoad"    # F

    .prologue
    const-wide/16 v2, 0x3e8

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-object p1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    .line 128
    iput-object p2, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventHandler:Landroid/os/Handler;

    .line 129
    iput-object p3, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventListener:Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;

    .line 130
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    .line 131
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    .line 132
    int-to-long v0, p4

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->lowWatermarkUs:J

    .line 133
    int-to-long v0, p5

    mul-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->highWatermarkUs:J

    .line 134
    iput p6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->lowBufferLoad:F

    .line 135
    iput p7, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->highBufferLoad:F

    .line 136
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer/DefaultLoadControl;)Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/exoplayer/DefaultLoadControl;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventListener:Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;

    return-object v0
.end method

.method private getBufferState(I)I
    .registers 5
    .param p1, "currentBufferSize"    # I

    .prologue
    .line 206
    int-to-float v1, p1

    iget v2, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 207
    .local v0, "bufferLoad":F
    iget v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->highBufferLoad:F

    cmpl-float v1, v0, v1

    if-lez v1, :cond_e

    const/4 v1, 0x0

    :goto_d
    return v1

    :cond_e
    iget v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->lowBufferLoad:F

    cmpg-float v1, v0, v1

    if-gez v1, :cond_16

    const/4 v1, 0x2

    goto :goto_d

    :cond_16
    const/4 v1, 0x1

    goto :goto_d
.end method

.method private getLoaderBufferState(JJ)I
    .registers 10
    .param p1, "playbackPositionUs"    # J
    .param p3, "nextLoadPositionUs"    # J

    .prologue
    const/4 v2, 0x0

    .line 195
    const-wide/16 v3, -0x1

    cmp-long v3, p3, v3

    if-nez v3, :cond_8

    .line 199
    :cond_7
    :goto_7
    return v2

    .line 198
    :cond_8
    sub-long v0, p3, p1

    .line 199
    .local v0, "timeUntilNextLoadPosition":J
    iget-wide v3, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->highWatermarkUs:J

    cmp-long v3, v0, v3

    if-gtz v3, :cond_7

    iget-wide v2, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->lowWatermarkUs:J

    cmp-long v2, v0, v2

    if-gez v2, :cond_18

    const/4 v2, 0x2

    goto :goto_7

    :cond_18
    const/4 v2, 0x1

    goto :goto_7
.end method

.method private notifyLoadingChanged(Z)V
    .registers 4
    .param p1, "loading"    # Z

    .prologue
    .line 251
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventListener:Lcom/google/android/exoplayer/DefaultLoadControl$EventListener;

    if-eqz v0, :cond_12

    .line 252
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/DefaultLoadControl$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/DefaultLoadControl$1;-><init>(Lcom/google/android/exoplayer/DefaultLoadControl;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 259
    :cond_12
    return-void
.end method

.method private updateControlState()V
    .registers 16

    .prologue
    const-wide/16 v13, -0x1

    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 213
    const/4 v7, 0x0

    .line 214
    .local v7, "loading":Z
    const/4 v0, 0x0

    .line 215
    .local v0, "haveNextLoadPosition":Z
    iget v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->bufferState:I

    .line 216
    .local v1, "highestState":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9
    iget-object v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_35

    .line 217
    iget-object v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    iget-object v11, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v11, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;

    .line 218
    .local v4, "loaderState":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    iget-boolean v8, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->loading:Z

    or-int/2addr v7, v8

    .line 219
    iget-wide v11, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->nextLoadPositionUs:J

    cmp-long v8, v11, v13

    if-eqz v8, :cond_33

    move v8, v9

    :goto_29
    or-int/2addr v0, v8

    .line 220
    iget v8, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->bufferState:I

    invoke-static {v1, v8}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 216
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_33
    move v8, v10

    .line 219
    goto :goto_29

    .line 223
    .end local v4    # "loaderState":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    :cond_35
    iget-object v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_93

    if-nez v7, :cond_41

    if-eqz v0, :cond_93

    :cond_41
    const/4 v8, 0x2

    if-eq v1, v8, :cond_4a

    if-ne v1, v9, :cond_93

    iget-boolean v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->fillingBuffers:Z

    if-eqz v8, :cond_93

    :cond_4a
    move v8, v9

    :goto_4b
    iput-boolean v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->fillingBuffers:Z

    .line 226
    iget-boolean v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->fillingBuffers:Z

    if-eqz v8, :cond_95

    iget-boolean v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->streamingPrioritySet:Z

    if-nez v8, :cond_95

    .line 227
    sget-object v8, Lcom/google/android/exoplayer/upstream/NetworkLock;->instance:Lcom/google/android/exoplayer/upstream/NetworkLock;

    invoke-virtual {v8, v10}, Lcom/google/android/exoplayer/upstream/NetworkLock;->add(I)V

    .line 228
    iput-boolean v9, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->streamingPrioritySet:Z

    .line 229
    invoke-direct {p0, v9}, Lcom/google/android/exoplayer/DefaultLoadControl;->notifyLoadingChanged(Z)V

    .line 236
    :cond_5f
    :goto_5f
    iput-wide v13, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->maxLoadStartPositionUs:J

    .line 237
    iget-boolean v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->fillingBuffers:Z

    if-eqz v8, :cond_aa

    .line 238
    const/4 v2, 0x0

    :goto_66
    iget-object v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_aa

    .line 239
    iget-object v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 240
    .local v3, "loader":Ljava/lang/Object;
    iget-object v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    invoke-virtual {v8, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;

    .line 241
    .restart local v4    # "loaderState":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    iget-wide v5, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->nextLoadPositionUs:J

    .line 242
    .local v5, "loaderTime":J
    cmp-long v8, v5, v13

    if-eqz v8, :cond_90

    iget-wide v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->maxLoadStartPositionUs:J

    cmp-long v8, v8, v13

    if-eqz v8, :cond_8e

    iget-wide v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->maxLoadStartPositionUs:J

    cmp-long v8, v5, v8

    if-gez v8, :cond_90

    .line 244
    :cond_8e
    iput-wide v5, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->maxLoadStartPositionUs:J

    .line 238
    :cond_90
    add-int/lit8 v2, v2, 0x1

    goto :goto_66

    .end local v3    # "loader":Ljava/lang/Object;
    .end local v4    # "loaderState":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    .end local v5    # "loaderTime":J
    :cond_93
    move v8, v10

    .line 223
    goto :goto_4b

    .line 230
    :cond_95
    iget-boolean v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->fillingBuffers:Z

    if-nez v8, :cond_5f

    iget-boolean v8, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->streamingPrioritySet:Z

    if-eqz v8, :cond_5f

    if-nez v7, :cond_5f

    .line 231
    sget-object v8, Lcom/google/android/exoplayer/upstream/NetworkLock;->instance:Lcom/google/android/exoplayer/upstream/NetworkLock;

    invoke-virtual {v8, v10}, Lcom/google/android/exoplayer/upstream/NetworkLock;->remove(I)V

    .line 232
    iput-boolean v10, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->streamingPrioritySet:Z

    .line 233
    invoke-direct {p0, v10}, Lcom/google/android/exoplayer/DefaultLoadControl;->notifyLoadingChanged(Z)V

    goto :goto_5f

    .line 248
    :cond_aa
    return-void
.end method


# virtual methods
.method public getAllocator()Lcom/google/android/exoplayer/upstream/Allocator;
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    return-object v0
.end method

.method public register(Ljava/lang/Object;I)V
    .registers 5
    .param p1, "loader"    # Ljava/lang/Object;
    .param p2, "bufferSizeContribution"    # I

    .prologue
    .line 140
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    new-instance v1, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;

    invoke-direct {v1, p2}, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;-><init>(I)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    iget v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    add-int/2addr v0, p2

    iput v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    .line 143
    return-void
.end method

.method public trimAllocator()V
    .registers 3

    .prologue
    .line 155
    iget-object v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    iget v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/upstream/Allocator;->trim(I)V

    .line 156
    return-void
.end method

.method public unregister(Ljava/lang/Object;)V
    .registers 5
    .param p1, "loader"    # Ljava/lang/Object;

    .prologue
    .line 147
    iget-object v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaders:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 148
    iget-object v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;

    .line 149
    .local v0, "state":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    iget v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    iget v2, v0, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->bufferSizeContribution:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    .line 150
    invoke-direct {p0}, Lcom/google/android/exoplayer/DefaultLoadControl;->updateControlState()V

    .line 151
    return-void
.end method

.method public update(Ljava/lang/Object;JJZ)Z
    .registers 15
    .param p1, "loader"    # Ljava/lang/Object;
    .param p2, "playbackPositionUs"    # J
    .param p4, "nextLoadPositionUs"    # J
    .param p6, "loading"    # Z

    .prologue
    .line 167
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/google/android/exoplayer/DefaultLoadControl;->getLoaderBufferState(JJ)I

    move-result v3

    .line 168
    .local v3, "loaderBufferState":I
    iget-object v6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->loaderStates:Ljava/util/HashMap;

    invoke-virtual {v6, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;

    .line 169
    .local v4, "loaderState":Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;
    iget v6, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->bufferState:I

    if-ne v6, v3, :cond_1a

    iget-wide v6, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->nextLoadPositionUs:J

    cmp-long v6, v6, p4

    if-nez v6, :cond_1a

    iget-boolean v6, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->loading:Z

    if-eq v6, p6, :cond_4f

    :cond_1a
    const/4 v5, 0x1

    .line 171
    .local v5, "loaderStateChanged":Z
    :goto_1b
    if-eqz v5, :cond_23

    .line 172
    iput v3, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->bufferState:I

    .line 173
    iput-wide p4, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->nextLoadPositionUs:J

    .line 174
    iput-boolean p6, v4, Lcom/google/android/exoplayer/DefaultLoadControl$LoaderState;->loading:Z

    .line 178
    :cond_23
    iget-object v6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->allocator:Lcom/google/android/exoplayer/upstream/Allocator;

    invoke-interface {v6}, Lcom/google/android/exoplayer/upstream/Allocator;->getTotalBytesAllocated()I

    move-result v2

    .line 179
    .local v2, "currentBufferSize":I
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/DefaultLoadControl;->getBufferState(I)I

    move-result v0

    .line 180
    .local v0, "bufferState":I
    iget v6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->bufferState:I

    if-eq v6, v0, :cond_51

    const/4 v1, 0x1

    .line 181
    .local v1, "bufferStateChanged":Z
    :goto_32
    if-eqz v1, :cond_36

    .line 182
    iput v0, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->bufferState:I

    .line 186
    :cond_36
    if-nez v5, :cond_3a

    if-eqz v1, :cond_3d

    .line 187
    :cond_3a
    invoke-direct {p0}, Lcom/google/android/exoplayer/DefaultLoadControl;->updateControlState()V

    .line 190
    :cond_3d
    iget v6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->targetBufferSize:I

    if-ge v2, v6, :cond_53

    const-wide/16 v6, -0x1

    cmp-long v6, p4, v6

    if-eqz v6, :cond_53

    iget-wide v6, p0, Lcom/google/android/exoplayer/DefaultLoadControl;->maxLoadStartPositionUs:J

    cmp-long v6, p4, v6

    if-gtz v6, :cond_53

    const/4 v6, 0x1

    :goto_4e
    return v6

    .line 169
    .end local v0    # "bufferState":I
    .end local v1    # "bufferStateChanged":Z
    .end local v2    # "currentBufferSize":I
    .end local v5    # "loaderStateChanged":Z
    :cond_4f
    const/4 v5, 0x0

    goto :goto_1b

    .line 180
    .restart local v0    # "bufferState":I
    .restart local v2    # "currentBufferSize":I
    .restart local v5    # "loaderStateChanged":Z
    :cond_51
    const/4 v1, 0x0

    goto :goto_32

    .line 190
    .restart local v1    # "bufferStateChanged":Z
    :cond_53
    const/4 v6, 0x0

    goto :goto_4e
.end method
