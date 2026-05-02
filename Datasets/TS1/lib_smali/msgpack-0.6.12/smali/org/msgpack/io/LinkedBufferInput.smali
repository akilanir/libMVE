.class public Lorg/msgpack/io/LinkedBufferInput;
.super Lorg/msgpack/io/AbstractInput;
.source "LinkedBufferInput.java"


# instance fields
.field private final bufferSize:I

.field link:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private nextAdvance:I

.field private tmpBuffer:[B

.field private tmpByteBuffer:Ljava/nio/ByteBuffer;

.field writable:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "bufferSize"    # I

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/msgpack/io/AbstractInput;-><init>()V

    .line 41
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    .line 42
    const/4 v0, -0x1

    iput v0, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    .line 43
    const/16 v0, 0x8

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/msgpack/io/LinkedBufferInput;->tmpBuffer:[B

    .line 44
    iget-object v0, p0, Lorg/msgpack/io/LinkedBufferInput;->tmpBuffer:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/io/LinkedBufferInput;->tmpByteBuffer:Ljava/nio/ByteBuffer;

    .line 45
    iput p1, p0, Lorg/msgpack/io/LinkedBufferInput;->bufferSize:I

    .line 46
    return-void
.end method

.method private removeFirstLink(Ljava/nio/ByteBuffer;)Z
    .registers 5
    .param p1, "first"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 143
    iget-object v2, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-ne v2, v1, :cond_21

    .line 144
    iget v1, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    if-ltz v1, :cond_1b

    .line 145
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 146
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 147
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    iput v1, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    .line 155
    :goto_1a
    return v0

    .line 150
    :cond_1b
    iget-object v1, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    goto :goto_1a

    .line 154
    :cond_21
    iget-object v0, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move v0, v1

    .line 155
    goto :goto_1a
.end method

.method private require(I)Ljava/nio/ByteBuffer;
    .registers 5
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 179
    const/4 v1, 0x0

    .line 181
    .local v1, "bb":Ljava/nio/ByteBuffer;
    :try_start_1
    iget-object v2, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/nio/ByteBuffer;

    move-object v1, v0
    :try_end_b
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_b} :catch_24

    .line 183
    :goto_b
    if-nez v1, :cond_13

    .line 184
    new-instance v2, Lorg/msgpack/io/EndOfBufferException;

    invoke-direct {v2}, Lorg/msgpack/io/EndOfBufferException;-><init>()V

    throw v2

    .line 186
    :cond_13
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-gt p1, v2, :cond_1c

    .line 187
    iput p1, p0, Lorg/msgpack/io/LinkedBufferInput;->nextAdvance:I

    .line 192
    .end local v1    # "bb":Ljava/nio/ByteBuffer;
    :goto_1b
    return-object v1

    .line 190
    .restart local v1    # "bb":Ljava/nio/ByteBuffer;
    :cond_1c
    invoke-direct {p0, p1}, Lorg/msgpack/io/LinkedBufferInput;->requireMore(I)V

    .line 191
    iput p1, p0, Lorg/msgpack/io/LinkedBufferInput;->nextAdvance:I

    .line 192
    iget-object v1, p0, Lorg/msgpack/io/LinkedBufferInput;->tmpByteBuffer:Ljava/nio/ByteBuffer;

    goto :goto_1b

    .line 182
    :catch_24
    move-exception v2

    goto :goto_b
.end method

.method private requireMore(I)V
    .registers 8
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 160
    const/4 v2, 0x0

    .line 161
    .local v2, "off":I
    iget-object v5, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_39

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 162
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-gt p1, v5, :cond_26

    .line 163
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    .line 164
    .local v3, "pos":I
    iget-object v5, p0, Lorg/msgpack/io/LinkedBufferInput;->tmpBuffer:[B

    invoke-virtual {v0, v5, v2, p1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 165
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 166
    return-void

    .line 168
    .end local v3    # "pos":I
    :cond_26
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    .line 169
    .local v4, "rem":I
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    .line 170
    .restart local v3    # "pos":I
    iget-object v5, p0, Lorg/msgpack/io/LinkedBufferInput;->tmpBuffer:[B

    invoke-virtual {v0, v5, v2, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 171
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 172
    sub-int/2addr p1, v4

    .line 173
    add-int/2addr v2, v4

    .line 174
    goto :goto_7

    .line 175
    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    .end local v3    # "pos":I
    .end local v4    # "rem":I
    :cond_39
    new-instance v5, Lorg/msgpack/io/EndOfBufferException;

    invoke-direct {v5}, Lorg/msgpack/io/EndOfBufferException;-><init>()V

    throw v5
.end method


# virtual methods
.method public advance()V
    .registers 5

    .prologue
    .line 121
    iget-object v2, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 140
    :goto_8
    return-void

    .line 124
    :cond_9
    iget v1, p0, Lorg/msgpack/io/LinkedBufferInput;->nextAdvance:I

    .line 127
    .local v1, "len":I
    :cond_b
    iget-object v2, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 128
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-ge v1, v2, :cond_2a

    .line 129
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 138
    :goto_21
    iget v2, p0, Lorg/msgpack/io/LinkedBufferInput;->nextAdvance:I

    invoke-virtual {p0, v2}, Lorg/msgpack/io/LinkedBufferInput;->incrReadByteCount(I)V

    .line 139
    const/4 v2, 0x0

    iput v2, p0, Lorg/msgpack/io/LinkedBufferInput;->nextAdvance:I

    goto :goto_8

    .line 132
    :cond_2a
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    sub-int/2addr v1, v2

    .line 133
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 134
    invoke-direct {p0, v0}, Lorg/msgpack/io/LinkedBufferInput;->removeFirstLink(Ljava/nio/ByteBuffer;)Z

    move-result v2

    if-nez v2, :cond_b

    goto :goto_21
.end method

.method public clear()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 336
    iget v1, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    if-ltz v1, :cond_24

    .line 337
    iget-object v1, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 338
    .local v0, "bb":Ljava/nio/ByteBuffer;
    iget-object v1, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 339
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 340
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 341
    iget-object v1, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 342
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    iput v1, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    .line 347
    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    :goto_23
    return-void

    .line 344
    :cond_24
    iget-object v1, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 345
    const/4 v1, -0x1

    iput v1, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    goto :goto_23
.end method

.method public close()V
    .registers 1

    .prologue
    .line 398
    return-void
.end method

.method public copyReferencedBuffer()V
    .registers 10

    .prologue
    .line 350
    iget-object v7, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_9

    .line 387
    :cond_8
    :goto_8
    return-void

    .line 354
    :cond_9
    const/4 v6, 0x0

    .line 355
    .local v6, "size":I
    iget-object v7, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 356
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    add-int/2addr v6, v7

    .line 357
    goto :goto_10

    .line 358
    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    :cond_22
    if-eqz v6, :cond_8

    .line 362
    iget v7, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    if-ltz v7, :cond_68

    .line 363
    iget-object v7, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/ByteBuffer;

    .line 364
    .local v3, "last":Ljava/nio/ByteBuffer;
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    sub-int v7, v6, v7

    new-array v1, v7, [B

    .line 365
    .local v1, "copy":[B
    const/4 v5, 0x0

    .line 366
    .local v5, "off":I
    iget-object v7, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_54

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 367
    .restart local v0    # "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    .line 368
    .local v4, "len":I
    invoke-virtual {v0, v1, v5, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 369
    add-int/2addr v5, v4

    .line 370
    goto :goto_3f

    .line 371
    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    .end local v4    # "len":I
    :cond_54
    iget-object v7, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->clear()V

    .line 372
    iget-object v7, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 373
    iget-object v7, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v7, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 376
    .end local v1    # "copy":[B
    .end local v3    # "last":Ljava/nio/ByteBuffer;
    .end local v5    # "off":I
    :cond_68
    new-array v1, v6, [B

    .line 377
    .restart local v1    # "copy":[B
    const/4 v5, 0x0

    .line 378
    .restart local v5    # "off":I
    iget-object v7, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_71
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_86

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 379
    .restart local v0    # "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    .line 380
    .restart local v4    # "len":I
    invoke-virtual {v0, v1, v5, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 381
    add-int/2addr v5, v4

    .line 382
    goto :goto_71

    .line 383
    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    .end local v4    # "len":I
    :cond_86
    iget-object v7, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->clear()V

    .line 384
    iget-object v7, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 385
    const/4 v7, 0x0

    iput v7, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    goto/16 :goto_8
.end method

.method public feed(Ljava/nio/ByteBuffer;)V
    .registers 3
    .param p1, "b"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 284
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/msgpack/io/LinkedBufferInput;->feed(Ljava/nio/ByteBuffer;Z)V

    .line 285
    return-void
.end method

.method public feed(Ljava/nio/ByteBuffer;Z)V
    .registers 12
    .param p1, "buf"    # Ljava/nio/ByteBuffer;
    .param p2, "reference"    # Z

    .prologue
    const/4 v8, 0x0

    .line 288
    if-eqz p2, :cond_2c

    .line 289
    iget v6, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    if-lez v6, :cond_23

    iget-object v6, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    if-nez v6, :cond_23

    .line 290
    iget-object v6, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    iget-object v7, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v7, p1}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    .line 333
    :goto_22
    return-void

    .line 293
    :cond_23
    iget-object v6, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v6, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 294
    const/4 v6, -0x1

    iput v6, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    goto :goto_22

    .line 298
    :cond_2c
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    .line 300
    .local v4, "rem":I
    const/4 v1, 0x0

    .line 302
    .local v1, "bb":Ljava/nio/ByteBuffer;
    :try_start_31
    iget-object v6, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/nio/ByteBuffer;

    move-object v1, v0
    :try_end_3b
    .catch Ljava/util/NoSuchElementException; {:try_start_31 .. :try_end_3b} :catch_b3

    .line 304
    :goto_3b
    iget v6, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    if-gt v4, v6, :cond_64

    .line 305
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    .line 306
    .local v3, "pos":I
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    invoke-virtual {v1, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 307
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    add-int/2addr v6, v4

    invoke-virtual {v1, v6}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 308
    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 309
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 310
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v6

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v7

    sub-int/2addr v6, v7

    iput v6, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    goto :goto_22

    .line 314
    .end local v3    # "pos":I
    :cond_64
    iget v6, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    if-lez v6, :cond_95

    .line 315
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    .line 316
    .restart local v3    # "pos":I
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    invoke-virtual {v1, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 317
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    iget v7, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    add-int/2addr v6, v7

    invoke-virtual {v1, v6}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 318
    iget v6, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 319
    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 320
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 321
    iget v6, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    sub-int/2addr v4, v6

    .line 322
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    add-int/2addr v6, v4

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 323
    iput v8, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    .line 326
    .end local v3    # "pos":I
    :cond_95
    iget v6, p0, Lorg/msgpack/io/LinkedBufferInput;->bufferSize:I

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 327
    .local v5, "sz":I
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 328
    .local v2, "nb":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 329
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 330
    invoke-virtual {v2, v8}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 331
    iget-object v6, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 332
    sub-int v6, v5, v4

    iput v6, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    goto/16 :goto_22

    .line 303
    .end local v2    # "nb":Ljava/nio/ByteBuffer;
    .end local v5    # "sz":I
    :catch_b3
    move-exception v6

    goto :goto_3b
.end method

.method public feed([B)V
    .registers 4
    .param p1, "b"    # [B

    .prologue
    const/4 v1, 0x0

    .line 227
    array-length v0, p1

    invoke-virtual {p0, p1, v1, v0, v1}, Lorg/msgpack/io/LinkedBufferInput;->feed([BIIZ)V

    .line 228
    return-void
.end method

.method public feed([BII)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 235
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/msgpack/io/LinkedBufferInput;->feed([BIIZ)V

    .line 236
    return-void
.end method

.method public feed([BIIZ)V
    .registers 13
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "reference"    # Z

    .prologue
    const/4 v7, 0x0

    .line 239
    if-eqz p4, :cond_34

    .line 240
    iget v5, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    if-lez v5, :cond_27

    iget-object v5, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-nez v5, :cond_27

    .line 241
    iget-object v5, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    iget-object v6, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    .line 281
    :goto_26
    return-void

    .line 244
    :cond_27
    iget-object v5, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 245
    const/4 v5, -0x1

    iput v5, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    goto :goto_26

    .line 249
    :cond_34
    const/4 v1, 0x0

    .line 251
    .local v1, "bb":Ljava/nio/ByteBuffer;
    :try_start_35
    iget-object v5, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/nio/ByteBuffer;

    move-object v1, v0
    :try_end_3f
    .catch Ljava/util/NoSuchElementException; {:try_start_35 .. :try_end_3f} :catch_af

    .line 253
    :goto_3f
    iget v5, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    if-gt p3, v5, :cond_68

    .line 254
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    .line 255
    .local v3, "pos":I
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 256
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    add-int/2addr v5, p3

    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 257
    invoke-virtual {v1, p1, p2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 258
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 259
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    sub-int/2addr v5, v6

    iput v5, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    goto :goto_26

    .line 263
    .end local v3    # "pos":I
    :cond_68
    iget v5, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    if-lez v5, :cond_91

    .line 264
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    .line 265
    .restart local v3    # "pos":I
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 266
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    iget v6, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    add-int/2addr v5, v6

    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 267
    iget v5, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    invoke-virtual {v1, p1, p2, v5}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 268
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 269
    iget v5, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    add-int/2addr p2, v5

    .line 270
    iget v5, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    sub-int/2addr p3, v5

    .line 271
    iput v7, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    .line 274
    .end local v3    # "pos":I
    :cond_91
    iget v5, p0, Lorg/msgpack/io/LinkedBufferInput;->bufferSize:I

    invoke-static {p3, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 275
    .local v4, "sz":I
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 276
    .local v2, "nb":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, p1, p2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 277
    invoke-virtual {v2, p3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 278
    invoke-virtual {v2, v7}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 279
    iget-object v5, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v5, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 280
    sub-int v5, v4, p3

    iput v5, p0, Lorg/msgpack/io/LinkedBufferInput;->writable:I

    goto/16 :goto_26

    .line 252
    .end local v2    # "nb":Ljava/nio/ByteBuffer;
    .end local v4    # "sz":I
    :catch_af
    move-exception v5

    goto :goto_3f
.end method

.method public feed([BZ)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "reference"    # Z

    .prologue
    .line 231
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1, p2}, Lorg/msgpack/io/LinkedBufferInput;->feed([BIIZ)V

    .line 232
    return-void
.end method

.method public getByte()B
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 197
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/msgpack/io/LinkedBufferInput;->require(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 198
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    return v1
.end method

.method public getDouble()D
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 222
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lorg/msgpack/io/LinkedBufferInput;->require(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 223
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getDouble(I)D

    move-result-wide v1

    return-wide v1
.end method

.method public getFloat()F
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 217
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lorg/msgpack/io/LinkedBufferInput;->require(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 218
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getFloat(I)F

    move-result v1

    return v1
.end method

.method public getInt()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 207
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lorg/msgpack/io/LinkedBufferInput;->require(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 208
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v1

    return v1
.end method

.method public getLong()J
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 212
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lorg/msgpack/io/LinkedBufferInput;->require(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 213
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getLong(I)J

    move-result-wide v1

    return-wide v1
.end method

.method public bridge synthetic getReadByteCount()I
    .registers 2

    .prologue
    .line 27
    invoke-super {p0}, Lorg/msgpack/io/AbstractInput;->getReadByteCount()I

    move-result v0

    return v0
.end method

.method public getShort()S
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 202
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lorg/msgpack/io/LinkedBufferInput;->require(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 203
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v1

    return v1
.end method

.method public getSize()I
    .registers 5

    .prologue
    .line 390
    const/4 v2, 0x0

    .line 391
    .local v2, "size":I
    iget-object v3, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 392
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    add-int/2addr v2, v3

    .line 393
    goto :goto_7

    .line 394
    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    :cond_19
    return v2
.end method

.method public read([BII)I
    .registers 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 49
    iget-object v3, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 50
    const/4 v1, 0x0

    .line 69
    :goto_9
    return v1

    .line 52
    :cond_a
    move v1, p3

    .line 54
    .local v1, "olen":I
    :cond_b
    iget-object v3, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 55
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    if-ge p3, v3, :cond_20

    .line 56
    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 57
    invoke-virtual {p0, p3}, Lorg/msgpack/io/LinkedBufferInput;->incrReadByteCount(I)V

    goto :goto_9

    .line 60
    :cond_20
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    .line 61
    .local v2, "rem":I
    invoke-virtual {v0, p1, p2, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 62
    invoke-virtual {p0, v2}, Lorg/msgpack/io/LinkedBufferInput;->incrReadByteCount(I)V

    .line 63
    sub-int/2addr p3, v2

    .line 64
    add-int/2addr p2, v2

    .line 65
    invoke-direct {p0, v0}, Lorg/msgpack/io/LinkedBufferInput;->removeFirstLink(Ljava/nio/ByteBuffer;)Z

    move-result v3

    if-nez v3, :cond_b

    .line 69
    sub-int/2addr v1, p3

    goto :goto_9
.end method

.method public readByte()B
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 105
    const/4 v1, 0x0

    .line 107
    .local v1, "bb":Ljava/nio/ByteBuffer;
    :try_start_1
    iget-object v3, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Ljava/nio/ByteBuffer;

    move-object v1, v0
    :try_end_b
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_b} :catch_2a

    .line 109
    :goto_b
    if-eqz v1, :cond_13

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    if-nez v3, :cond_19

    .line 110
    :cond_13
    new-instance v3, Lorg/msgpack/io/EndOfBufferException;

    invoke-direct {v3}, Lorg/msgpack/io/EndOfBufferException;-><init>()V

    throw v3

    .line 112
    :cond_19
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    .line 113
    .local v2, "result":B
    invoke-virtual {p0}, Lorg/msgpack/io/LinkedBufferInput;->incrReadOneByteCount()V

    .line 114
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    if-nez v3, :cond_29

    .line 115
    invoke-direct {p0, v1}, Lorg/msgpack/io/LinkedBufferInput;->removeFirstLink(Ljava/nio/ByteBuffer;)Z

    .line 117
    :cond_29
    return v2

    .line 108
    .end local v2    # "result":B
    :catch_2a
    move-exception v3

    goto :goto_b
.end method

.method public bridge synthetic resetReadByteCount()V
    .registers 1

    .prologue
    .line 27
    invoke-super {p0}, Lorg/msgpack/io/AbstractInput;->resetReadByteCount()V

    return-void
.end method

.method public tryRefer(Lorg/msgpack/io/BufferReferer;I)Z
    .registers 10
    .param p1, "ref"    # Lorg/msgpack/io/BufferReferer;
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 73
    const/4 v1, 0x0

    .line 75
    .local v1, "bb":Ljava/nio/ByteBuffer;
    :try_start_2
    iget-object v5, p0, Lorg/msgpack/io/LinkedBufferInput;->link:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/nio/ByteBuffer;

    move-object v1, v0
    :try_end_c
    .catch Ljava/util/NoSuchElementException; {:try_start_2 .. :try_end_c} :catch_64

    .line 77
    :goto_c
    if-nez v1, :cond_14

    .line 78
    new-instance v5, Lorg/msgpack/io/EndOfBufferException;

    invoke-direct {v5}, Lorg/msgpack/io/EndOfBufferException;-><init>()V

    throw v5

    .line 79
    :cond_14
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-ge v5, p2, :cond_1c

    .line 80
    const/4 v5, 0x0

    .line 101
    :goto_1b
    return v5

    .line 82
    :cond_1c
    const/4 v4, 0x0

    .line 83
    .local v4, "success":Z
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    .line 84
    .local v3, "pos":I
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    .line 86
    .local v2, "lim":I
    add-int v5, v3, p2

    :try_start_27
    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 87
    const/4 v5, 0x1

    invoke-interface {p1, v1, v5}, Lorg/msgpack/io/BufferReferer;->refer(Ljava/nio/ByteBuffer;Z)V

    .line 88
    invoke-virtual {p0, p2}, Lorg/msgpack/io/LinkedBufferInput;->incrReadByteCount(I)V
    :try_end_31
    .catchall {:try_start_27 .. :try_end_31} :catchall_4b

    .line 89
    const/4 v4, 0x1

    .line 91
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 92
    if-eqz v4, :cond_47

    .line 93
    add-int v5, v3, p2

    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 97
    :goto_3c
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-nez v5, :cond_45

    .line 98
    invoke-direct {p0, v1}, Lorg/msgpack/io/LinkedBufferInput;->removeFirstLink(Ljava/nio/ByteBuffer;)Z

    :cond_45
    move v5, v6

    .line 101
    goto :goto_1b

    .line 95
    :cond_47
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_3c

    .line 91
    :catchall_4b
    move-exception v5

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 92
    if-eqz v4, :cond_60

    .line 93
    add-int v6, v3, p2

    invoke-virtual {v1, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 97
    :goto_56
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    if-nez v6, :cond_5f

    .line 98
    invoke-direct {p0, v1}, Lorg/msgpack/io/LinkedBufferInput;->removeFirstLink(Ljava/nio/ByteBuffer;)Z

    :cond_5f
    throw v5

    .line 95
    :cond_60
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_56

    .line 76
    .end local v2    # "lim":I
    .end local v3    # "pos":I
    .end local v4    # "success":Z
    :catch_64
    move-exception v5

    goto :goto_c
.end method
