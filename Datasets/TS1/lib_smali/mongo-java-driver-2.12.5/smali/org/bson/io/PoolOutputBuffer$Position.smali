.class Lorg/bson/io/PoolOutputBuffer$Position;
.super Ljava/lang/Object;
.source "PoolOutputBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/io/PoolOutputBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Position"
.end annotation


# instance fields
.field x:I

.field y:I


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 162
    invoke-virtual {p0}, Lorg/bson/io/PoolOutputBuffer$Position;->reset()V

    .line 163
    return-void
.end method


# virtual methods
.method getAndInc()I
    .registers 3

    .prologue
    .line 185
    iget v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    return v0
.end method

.method inc(I)V
    .registers 4
    .param p1, "amt"    # I

    .prologue
    .line 189
    iget v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    .line 190
    iget v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    const/16 v1, 0x4000

    if-le v0, v1, :cond_13

    .line 191
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "something is wrong"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_13
    return-void
.end method

.method len(I)I
    .registers 3
    .param p1, "which"    # I

    .prologue
    .line 202
    iget v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->x:I

    if-ge p1, v0, :cond_7

    .line 203
    const/16 v0, 0x4000

    .line 207
    :goto_6
    return v0

    .line 204
    :cond_7
    iget v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->x:I

    if-ne p1, v0, :cond_e

    .line 205
    iget v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    goto :goto_6

    .line 207
    :cond_e
    const/4 v0, 0x0

    goto :goto_6
.end method

.method nextBuffer()V
    .registers 3

    .prologue
    .line 195
    iget v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    const/16 v1, 0x4000

    if-eq v0, v1, :cond_e

    .line 196
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "broken"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 197
    :cond_e
    iget v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->x:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->x:I

    .line 198
    const/4 v0, 0x0

    iput v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    .line 199
    return-void
.end method

.method pos()I
    .registers 3

    .prologue
    .line 181
    iget v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->x:I

    add-int/lit8 v0, v0, 0x1

    mul-int/lit16 v0, v0, 0x4000

    iget v1, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    add-int/2addr v0, v1

    return v0
.end method

.method reset()V
    .registers 2

    .prologue
    .line 166
    const/4 v0, -0x1

    iput v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->x:I

    .line 167
    const/4 v0, 0x0

    iput v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    .line 168
    return-void
.end method

.method reset(I)V
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 176
    div-int/lit16 v0, p1, 0x4000

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->x:I

    .line 177
    rem-int/lit16 v0, p1, 0x4000

    iput v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    .line 178
    return-void
.end method

.method reset(Lorg/bson/io/PoolOutputBuffer$Position;)V
    .registers 3
    .param p1, "other"    # Lorg/bson/io/PoolOutputBuffer$Position;

    .prologue
    .line 171
    iget v0, p1, Lorg/bson/io/PoolOutputBuffer$Position;->x:I

    iput v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->x:I

    .line 172
    iget v0, p1, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    iput v0, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    .line 173
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lorg/bson/io/PoolOutputBuffer$Position;->x:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
