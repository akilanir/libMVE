.class public abstract Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;
.super Lcom/google/common/hash/AbstractHasher;
.source "AbstractStreamingHashFunction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/AbstractStreamingHashFunction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "AbstractStreamingHasher"
.end annotation


# instance fields
.field private final buffer:Ljava/nio/ByteBuffer;

.field private final bufferSize:I

.field private final chunkSize:I


# direct methods
.method protected constructor <init>(I)V
    .registers 2
    .param p1, "chunkSize"    # I

    .prologue
    .line 103
    invoke-direct {p0, p1, p1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;-><init>(II)V

    .line 104
    return-void
.end method

.method protected constructor <init>(II)V
    .registers 5
    .param p1, "chunkSize"    # I
    .param p2, "bufferSize"    # I

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/google/common/hash/AbstractHasher;-><init>()V

    .line 117
    rem-int v0, p2, p1

    if-nez v0, :cond_1e

    const/4 v0, 0x1

    :goto_8
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 120
    add-int/lit8 v0, p2, 0x7

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    .line 123
    iput p2, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->bufferSize:I

    .line 124
    iput p1, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->chunkSize:I

    .line 125
    return-void

    .line 117
    :cond_1e
    const/4 v0, 0x0

    goto :goto_8
.end method

.method private munch()V
    .registers 3

    .prologue
    .line 265
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 266
    :goto_5
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    iget v1, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->chunkSize:I

    if-lt v0, v1, :cond_15

    .line 269
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p0, v0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->process(Ljava/nio/ByteBuffer;)V

    goto :goto_5

    .line 271
    :cond_15
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    .line 272
    return-void
.end method

.method private munchIfFull()V
    .registers 3

    .prologue
    .line 258
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/16 v1, 0x8

    if-ge v0, v1, :cond_d

    .line 260
    invoke-direct {p0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->munch()V

    .line 262
    :cond_d
    return-void
.end method

.method private putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/Hasher;
    .registers 6
    .param p1, "readBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 163
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    iget-object v3, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    if-gt v2, v3, :cond_15

    .line 164
    iget-object v2, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 165
    invoke-direct {p0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->munchIfFull()V

    .line 183
    :goto_14
    return-object p0

    .line 170
    :cond_15
    iget v2, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->bufferSize:I

    iget-object v3, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int v0, v2, v3

    .line 171
    .local v0, "bytesToCopy":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_20
    if-ge v1, v0, :cond_2e

    .line 172
    iget-object v2, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 171
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 174
    :cond_2e
    invoke-direct {p0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->munch()V

    .line 177
    :goto_31
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    iget v3, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->chunkSize:I

    if-lt v2, v3, :cond_3d

    .line 178
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->process(Ljava/nio/ByteBuffer;)V

    goto :goto_31

    .line 182
    :cond_3d
    iget-object v2, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    goto :goto_14
.end method


# virtual methods
.method public final hash()Lcom/google/common/hash/HashCode;
    .registers 2

    .prologue
    .line 246
    invoke-direct {p0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->munch()V

    .line 247
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 248
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-lez v0, :cond_15

    .line 249
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p0, v0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->processRemaining(Ljava/nio/ByteBuffer;)V

    .line 251
    :cond_15
    invoke-virtual {p0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->makeHash()Lcom/google/common/hash/HashCode;

    move-result-object v0

    return-object v0
.end method

.method abstract makeHash()Lcom/google/common/hash/HashCode;
.end method

.method protected abstract process(Ljava/nio/ByteBuffer;)V
.end method

.method protected processRemaining(Ljava/nio/ByteBuffer;)V
    .registers 4
    .param p1, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 141
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 142
    iget v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->chunkSize:I

    add-int/lit8 v0, v0, 0x7

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 143
    :goto_e
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    iget v1, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->chunkSize:I

    if-ge v0, v1, :cond_1c

    .line 144
    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    goto :goto_e

    .line 146
    :cond_1c
    iget v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->chunkSize:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 147
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 148
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->process(Ljava/nio/ByteBuffer;)V

    .line 149
    return-void
.end method

.method public final putByte(B)Lcom/google/common/hash/Hasher;
    .registers 3
    .param p1, "b"    # B

    .prologue
    .line 205
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 206
    invoke-direct {p0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->munchIfFull()V

    .line 207
    return-object p0
.end method

.method public bridge synthetic putByte(B)Lcom/google/common/hash/PrimitiveSink;
    .registers 3
    .param p1, "x0"    # B

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putByte(B)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method

.method public final putBytes([B)Lcom/google/common/hash/Hasher;
    .registers 4
    .param p1, "bytes"    # [B

    .prologue
    .line 153
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putBytes([BII)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method

.method public final putBytes([BII)Lcom/google/common/hash/Hasher;
    .registers 6
    .param p1, "bytes"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 158
    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putBytes(Ljava/nio/ByteBuffer;)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic putBytes([B)Lcom/google/common/hash/PrimitiveSink;
    .registers 3
    .param p1, "x0"    # [B

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putBytes([B)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic putBytes([BII)Lcom/google/common/hash/PrimitiveSink;
    .registers 5
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # I

    .prologue
    .line 85
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putBytes([BII)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method

.method public final putChar(C)Lcom/google/common/hash/Hasher;
    .registers 3
    .param p1, "c"    # C

    .prologue
    .line 219
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    .line 220
    invoke-direct {p0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->munchIfFull()V

    .line 221
    return-object p0
.end method

.method public bridge synthetic putChar(C)Lcom/google/common/hash/PrimitiveSink;
    .registers 3
    .param p1, "x0"    # C

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putChar(C)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method

.method public final putInt(I)Lcom/google/common/hash/Hasher;
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 226
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 227
    invoke-direct {p0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->munchIfFull()V

    .line 228
    return-object p0
.end method

.method public bridge synthetic putInt(I)Lcom/google/common/hash/PrimitiveSink;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putInt(I)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method

.method public final putLong(J)Lcom/google/common/hash/Hasher;
    .registers 4
    .param p1, "l"    # J

    .prologue
    .line 233
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 234
    invoke-direct {p0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->munchIfFull()V

    .line 235
    return-object p0
.end method

.method public bridge synthetic putLong(J)Lcom/google/common/hash/PrimitiveSink;
    .registers 4
    .param p1, "x0"    # J

    .prologue
    .line 85
    invoke-virtual {p0, p1, p2}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putLong(J)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method

.method public final putObject(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Lcom/google/common/hash/Hasher;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/common/hash/Funnel",
            "<-TT;>;)",
            "Lcom/google/common/hash/Hasher;"
        }
    .end annotation

    .prologue
    .line 240
    .local p1, "instance":Ljava/lang/Object;, "TT;"
    .local p2, "funnel":Lcom/google/common/hash/Funnel;, "Lcom/google/common/hash/Funnel<-TT;>;"
    invoke-interface {p2, p1, p0}, Lcom/google/common/hash/Funnel;->funnel(Ljava/lang/Object;Lcom/google/common/hash/PrimitiveSink;)V

    .line 241
    return-object p0
.end method

.method public final putShort(S)Lcom/google/common/hash/Hasher;
    .registers 3
    .param p1, "s"    # S

    .prologue
    .line 212
    iget-object v0, p0, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 213
    invoke-direct {p0}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->munchIfFull()V

    .line 214
    return-object p0
.end method

.method public bridge synthetic putShort(S)Lcom/google/common/hash/PrimitiveSink;
    .registers 3
    .param p1, "x0"    # S

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putShort(S)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method

.method public final putString(Ljava/lang/CharSequence;)Lcom/google/common/hash/Hasher;
    .registers 3
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 192
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putUnencodedChars(Ljava/lang/CharSequence;)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic putString(Ljava/lang/CharSequence;)Lcom/google/common/hash/PrimitiveSink;
    .registers 3
    .param p1, "x0"    # Ljava/lang/CharSequence;

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putString(Ljava/lang/CharSequence;)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method

.method public final putUnencodedChars(Ljava/lang/CharSequence;)Lcom/google/common/hash/Hasher;
    .registers 4
    .param p1, "charSequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 197
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-ge v0, v1, :cond_11

    .line 198
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putChar(C)Lcom/google/common/hash/Hasher;

    .line 197
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 200
    :cond_11
    return-object p0
.end method

.method public bridge synthetic putUnencodedChars(Ljava/lang/CharSequence;)Lcom/google/common/hash/PrimitiveSink;
    .registers 3
    .param p1, "x0"    # Ljava/lang/CharSequence;

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lcom/google/common/hash/AbstractStreamingHashFunction$AbstractStreamingHasher;->putUnencodedChars(Ljava/lang/CharSequence;)Lcom/google/common/hash/Hasher;

    move-result-object v0

    return-object v0
.end method
