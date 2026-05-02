.class public Lzmq/YQueue;
.super Ljava/lang/Object;
.source "YQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/YQueue$Chunk;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private backChunk:Lzmq/YQueue$Chunk;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/YQueue$Chunk",
            "<TT;>;"
        }
    .end annotation
.end field

.field private backPos:I

.field private beginChunk:Lzmq/YQueue$Chunk;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/YQueue$Chunk",
            "<TT;>;"
        }
    .end annotation
.end field

.field private beginPos:I

.field private endChunk:Lzmq/YQueue$Chunk;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/YQueue$Chunk",
            "<TT;>;"
        }
    .end annotation
.end field

.field private endPos:I

.field private memoryPtr:I

.field private final size:I

.field private volatile spareChunk:Lzmq/YQueue$Chunk;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/YQueue$Chunk",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .registers 5
    .param p1, "size"    # I

    .prologue
    .local p0, "this":Lzmq/YQueue;, "Lzmq/YQueue<TT;>;"
    const/4 v2, 0x0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput p1, p0, Lzmq/YQueue;->size:I

    .line 65
    iput v2, p0, Lzmq/YQueue;->memoryPtr:I

    .line 66
    new-instance v0, Lzmq/YQueue$Chunk;

    iget v1, p0, Lzmq/YQueue;->memoryPtr:I

    invoke-direct {v0, p1, v1}, Lzmq/YQueue$Chunk;-><init>(II)V

    iput-object v0, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    .line 67
    iget v0, p0, Lzmq/YQueue;->memoryPtr:I

    add-int/2addr v0, p1

    iput v0, p0, Lzmq/YQueue;->memoryPtr:I

    .line 68
    iput v2, p0, Lzmq/YQueue;->beginPos:I

    .line 69
    iput v2, p0, Lzmq/YQueue;->backPos:I

    .line 70
    iget-object v0, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    iput-object v0, p0, Lzmq/YQueue;->backChunk:Lzmq/YQueue$Chunk;

    .line 71
    iget-object v0, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    iput-object v0, p0, Lzmq/YQueue;->spareChunk:Lzmq/YQueue$Chunk;

    .line 72
    iget-object v0, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    iput-object v0, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    .line 73
    const/4 v0, 0x1

    iput v0, p0, Lzmq/YQueue;->endPos:I

    .line 74
    return-void
.end method


# virtual methods
.method public back()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lzmq/YQueue;, "Lzmq/YQueue<TT;>;"
    iget-object v0, p0, Lzmq/YQueue;->backChunk:Lzmq/YQueue$Chunk;

    iget-object v0, v0, Lzmq/YQueue$Chunk;->values:[Ljava/lang/Object;

    iget v1, p0, Lzmq/YQueue;->backPos:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public backPos()I
    .registers 3

    .prologue
    .line 90
    .local p0, "this":Lzmq/YQueue;, "Lzmq/YQueue<TT;>;"
    iget-object v0, p0, Lzmq/YQueue;->backChunk:Lzmq/YQueue$Chunk;

    iget-object v0, v0, Lzmq/YQueue$Chunk;->pos:[I

    iget v1, p0, Lzmq/YQueue;->backPos:I

    aget v0, v0, v1

    return v0
.end method

.method public front()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "this":Lzmq/YQueue;, "Lzmq/YQueue<TT;>;"
    iget-object v0, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    iget-object v0, v0, Lzmq/YQueue$Chunk;->values:[Ljava/lang/Object;

    iget v1, p0, Lzmq/YQueue;->beginPos:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public frontPos()I
    .registers 3

    .prologue
    .line 78
    .local p0, "this":Lzmq/YQueue;, "Lzmq/YQueue<TT;>;"
    iget-object v0, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    iget-object v0, v0, Lzmq/YQueue$Chunk;->pos:[I

    iget v1, p0, Lzmq/YQueue;->beginPos:I

    aget v0, v0, v1

    return v0
.end method

.method public pop()Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lzmq/YQueue;, "Lzmq/YQueue<TT;>;"
    const/4 v3, 0x0

    .line 102
    iget-object v1, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    iget-object v1, v1, Lzmq/YQueue$Chunk;->values:[Ljava/lang/Object;

    iget v2, p0, Lzmq/YQueue;->beginPos:I

    aget-object v0, v1, v2

    .line 103
    .local v0, "val":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    iget-object v1, v1, Lzmq/YQueue$Chunk;->values:[Ljava/lang/Object;

    iget v2, p0, Lzmq/YQueue;->beginPos:I

    aput-object v3, v1, v2

    .line 104
    iget v1, p0, Lzmq/YQueue;->beginPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lzmq/YQueue;->beginPos:I

    .line 105
    iget v1, p0, Lzmq/YQueue;->beginPos:I

    iget v2, p0, Lzmq/YQueue;->size:I

    if-ne v1, v2, :cond_2a

    .line 106
    iget-object v1, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    iget-object v1, v1, Lzmq/YQueue$Chunk;->next:Lzmq/YQueue$Chunk;

    iput-object v1, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    .line 107
    iget-object v1, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    iput-object v3, v1, Lzmq/YQueue$Chunk;->prev:Lzmq/YQueue$Chunk;

    .line 108
    const/4 v1, 0x0

    iput v1, p0, Lzmq/YQueue;->beginPos:I

    .line 110
    :cond_2a
    return-object v0
.end method

.method public push(Ljava/lang/Object;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lzmq/YQueue;, "Lzmq/YQueue<TT;>;"
    .local p1, "val":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lzmq/YQueue;->backChunk:Lzmq/YQueue$Chunk;

    iget-object v1, v1, Lzmq/YQueue$Chunk;->values:[Ljava/lang/Object;

    iget v2, p0, Lzmq/YQueue;->backPos:I

    aput-object p1, v1, v2

    .line 117
    iget-object v1, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    iput-object v1, p0, Lzmq/YQueue;->backChunk:Lzmq/YQueue$Chunk;

    .line 118
    iget v1, p0, Lzmq/YQueue;->endPos:I

    iput v1, p0, Lzmq/YQueue;->backPos:I

    .line 120
    iget v1, p0, Lzmq/YQueue;->endPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lzmq/YQueue;->endPos:I

    .line 121
    iget v1, p0, Lzmq/YQueue;->endPos:I

    iget v2, p0, Lzmq/YQueue;->size:I

    if-eq v1, v2, :cond_1d

    .line 138
    :goto_1c
    return-void

    .line 125
    :cond_1d
    iget-object v0, p0, Lzmq/YQueue;->spareChunk:Lzmq/YQueue$Chunk;

    .line 126
    .local v0, "sc":Lzmq/YQueue$Chunk;, "Lzmq/YQueue$Chunk<TT;>;"
    iget-object v1, p0, Lzmq/YQueue;->beginChunk:Lzmq/YQueue$Chunk;

    if-eq v0, v1, :cond_3b

    .line 127
    iget-object v1, p0, Lzmq/YQueue;->spareChunk:Lzmq/YQueue$Chunk;

    iget-object v1, v1, Lzmq/YQueue$Chunk;->next:Lzmq/YQueue$Chunk;

    iput-object v1, p0, Lzmq/YQueue;->spareChunk:Lzmq/YQueue$Chunk;

    .line 128
    iget-object v1, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    iput-object v0, v1, Lzmq/YQueue$Chunk;->next:Lzmq/YQueue$Chunk;

    .line 129
    iget-object v1, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    iput-object v1, v0, Lzmq/YQueue$Chunk;->prev:Lzmq/YQueue$Chunk;

    .line 136
    :goto_31
    iget-object v1, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    iget-object v1, v1, Lzmq/YQueue$Chunk;->next:Lzmq/YQueue$Chunk;

    iput-object v1, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    .line 137
    const/4 v1, 0x0

    iput v1, p0, Lzmq/YQueue;->endPos:I

    goto :goto_1c

    .line 132
    :cond_3b
    iget-object v1, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    new-instance v2, Lzmq/YQueue$Chunk;

    iget v3, p0, Lzmq/YQueue;->size:I

    iget v4, p0, Lzmq/YQueue;->memoryPtr:I

    invoke-direct {v2, v3, v4}, Lzmq/YQueue$Chunk;-><init>(II)V

    iput-object v2, v1, Lzmq/YQueue$Chunk;->next:Lzmq/YQueue$Chunk;

    .line 133
    iget v1, p0, Lzmq/YQueue;->memoryPtr:I

    iget v2, p0, Lzmq/YQueue;->size:I

    add-int/2addr v1, v2

    iput v1, p0, Lzmq/YQueue;->memoryPtr:I

    .line 134
    iget-object v1, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    iget-object v1, v1, Lzmq/YQueue$Chunk;->next:Lzmq/YQueue$Chunk;

    iget-object v2, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    iput-object v2, v1, Lzmq/YQueue$Chunk;->prev:Lzmq/YQueue$Chunk;

    goto :goto_31
.end method

.method public unpush()V
    .registers 3

    .prologue
    .line 150
    .local p0, "this":Lzmq/YQueue;, "Lzmq/YQueue<TT;>;"
    iget v0, p0, Lzmq/YQueue;->backPos:I

    if-lez v0, :cond_15

    .line 151
    iget v0, p0, Lzmq/YQueue;->backPos:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/YQueue;->backPos:I

    .line 162
    :goto_a
    iget v0, p0, Lzmq/YQueue;->endPos:I

    if-lez v0, :cond_22

    .line 163
    iget v0, p0, Lzmq/YQueue;->endPos:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/YQueue;->endPos:I

    .line 170
    :goto_14
    return-void

    .line 154
    :cond_15
    iget v0, p0, Lzmq/YQueue;->size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/YQueue;->backPos:I

    .line 155
    iget-object v0, p0, Lzmq/YQueue;->backChunk:Lzmq/YQueue$Chunk;

    iget-object v0, v0, Lzmq/YQueue$Chunk;->prev:Lzmq/YQueue$Chunk;

    iput-object v0, p0, Lzmq/YQueue;->backChunk:Lzmq/YQueue$Chunk;

    goto :goto_a

    .line 166
    :cond_22
    iget v0, p0, Lzmq/YQueue;->size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/YQueue;->endPos:I

    .line 167
    iget-object v0, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    iget-object v0, v0, Lzmq/YQueue$Chunk;->prev:Lzmq/YQueue$Chunk;

    iput-object v0, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    .line 168
    iget-object v0, p0, Lzmq/YQueue;->endChunk:Lzmq/YQueue$Chunk;

    const/4 v1, 0x0

    iput-object v1, v0, Lzmq/YQueue$Chunk;->next:Lzmq/YQueue$Chunk;

    goto :goto_14
.end method
