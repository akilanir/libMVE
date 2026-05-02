.class public Lorg/zeromq/ZFrame;
.super Ljava/lang/Object;
.source "ZFrame.java"


# static fields
.field public static final DONTWAIT:I = 0x1

.field public static final MORE:I = 0x2

.field public static final REUSE:I = 0x80


# instance fields
.field private data:[B

.field private more:Z


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    if-eqz p1, :cond_d

    .line 80
    sget-object v0, Lorg/zeromq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/zeromq/ZFrame;->data:[B

    .line 82
    :cond_d
    return-void
.end method

.method public constructor <init>([B)V
    .registers 2
    .param p1, "data"    # [B

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    if-eqz p1, :cond_7

    .line 68
    iput-object p1, p0, Lorg/zeromq/ZFrame;->data:[B

    .line 70
    :cond_7
    return-void
.end method

.method private recv(Lorg/zeromq/ZMQ$Socket;I)[B
    .registers 5
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "flags"    # I

    .prologue
    .line 352
    if-nez p1, :cond_a

    .line 353
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "socket parameter must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 356
    :cond_a
    invoke-virtual {p1, p2}, Lorg/zeromq/ZMQ$Socket;->recv(I)[B

    move-result-object v0

    iput-object v0, p0, Lorg/zeromq/ZFrame;->data:[B

    .line 357
    invoke-virtual {p1}, Lorg/zeromq/ZMQ$Socket;->hasReceiveMore()Z

    move-result v0

    iput-boolean v0, p0, Lorg/zeromq/ZFrame;->more:Z

    .line 358
    iget-object v0, p0, Lorg/zeromq/ZFrame;->data:[B

    return-object v0
.end method

.method public static recvFrame(Lorg/zeromq/ZMQ$Socket;)Lorg/zeromq/ZFrame;
    .registers 2
    .param p0, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 373
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/zeromq/ZFrame;->recvFrame(Lorg/zeromq/ZMQ$Socket;I)Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public static recvFrame(Lorg/zeromq/ZMQ$Socket;I)Lorg/zeromq/ZFrame;
    .registers 4
    .param p0, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p1, "flags"    # I

    .prologue
    .line 388
    new-instance v1, Lorg/zeromq/ZFrame;

    invoke-direct {v1}, Lorg/zeromq/ZFrame;-><init>()V

    .line 389
    .local v1, "f":Lorg/zeromq/ZFrame;
    invoke-direct {v1, p0, p1}, Lorg/zeromq/ZFrame;->recv(Lorg/zeromq/ZMQ$Socket;I)[B

    move-result-object v0

    .line 390
    .local v0, "data":[B
    if-nez v0, :cond_c

    .line 391
    const/4 v1, 0x0

    .line 393
    .end local v1    # "f":Lorg/zeromq/ZFrame;
    :cond_c
    return-object v1
.end method


# virtual methods
.method public destroy()V
    .registers 2

    .prologue
    .line 89
    invoke-virtual {p0}, Lorg/zeromq/ZFrame;->hasData()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 90
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/zeromq/ZFrame;->data:[B

    .line 92
    :cond_9
    return-void
.end method

.method public duplicate()Lorg/zeromq/ZFrame;
    .registers 3

    .prologue
    .line 222
    new-instance v0, Lorg/zeromq/ZFrame;

    iget-object v1, p0, Lorg/zeromq/ZFrame;->data:[B

    invoke-direct {v0, v1}, Lorg/zeromq/ZFrame;-><init>([B)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 300
    if-ne p0, p1, :cond_4

    .line 301
    const/4 v1, 0x1

    .line 307
    :goto_3
    return v1

    .line 303
    :cond_4
    if-eqz p1, :cond_10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_12

    .line 304
    :cond_10
    const/4 v1, 0x0

    goto :goto_3

    :cond_12
    move-object v0, p1

    .line 306
    check-cast v0, Lorg/zeromq/ZFrame;

    .line 307
    .local v0, "zFrame":Lorg/zeromq/ZFrame;
    iget-object v1, p0, Lorg/zeromq/ZFrame;->data:[B

    iget-object v2, v0, Lorg/zeromq/ZFrame;->data:[B

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    goto :goto_3
.end method

.method public getData()[B
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lorg/zeromq/ZFrame;->data:[B

    return-object v0
.end method

.method public hasData()Z
    .registers 2

    .prologue
    .line 132
    iget-object v0, p0, Lorg/zeromq/ZFrame;->data:[B

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public hasMore()Z
    .registers 2

    .prologue
    .line 107
    iget-boolean v0, p0, Lorg/zeromq/ZFrame;->more:Z

    return v0
.end method

.method public hasSameData(Lorg/zeromq/ZFrame;)Z
    .registers 5
    .param p1, "other"    # Lorg/zeromq/ZFrame;

    .prologue
    const/4 v0, 0x0

    .line 234
    if-nez p1, :cond_4

    .line 241
    :cond_3
    :goto_3
    return v0

    .line 238
    :cond_4
    invoke-virtual {p0}, Lorg/zeromq/ZFrame;->size()I

    move-result v1

    invoke-virtual {p1}, Lorg/zeromq/ZFrame;->size()I

    move-result v2

    if-ne v1, v2, :cond_3

    .line 239
    iget-object v0, p0, Lorg/zeromq/ZFrame;->data:[B

    iget-object v1, p1, Lorg/zeromq/ZFrame;->data:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    goto :goto_3
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 313
    iget-object v0, p0, Lorg/zeromq/ZFrame;->data:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method public print(Ljava/lang/String;)V
    .registers 15
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 398
    new-instance v7, Ljava/io/StringWriter;

    invoke-direct {v7}, Ljava/io/StringWriter;-><init>()V

    .line 399
    .local v7, "sw":Ljava/io/StringWriter;
    new-instance v5, Ljava/io/PrintWriter;

    invoke-direct {v5, v7}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 401
    .local v5, "pw":Ljava/io/PrintWriter;
    if-eqz p1, :cond_17

    .line 402
    const-string v8, "%s"

    new-array v9, v12, [Ljava/lang/Object;

    aput-object p1, v9, v11

    invoke-virtual {v5, v8, v9}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 404
    :cond_17
    invoke-virtual {p0}, Lorg/zeromq/ZFrame;->getData()[B

    move-result-object v1

    .line 405
    .local v1, "data":[B
    invoke-virtual {p0}, Lorg/zeromq/ZFrame;->size()I

    move-result v6

    .line 407
    .local v6, "size":I
    const/4 v3, 0x0

    .line 409
    .local v3, "isBin":Z
    const/4 v0, 0x0

    .local v0, "charNbr":I
    :goto_21
    if-ge v0, v6, :cond_33

    .line 410
    aget-byte v8, v1, v0

    const/16 v9, 0x9

    if-lt v8, v9, :cond_2f

    aget-byte v8, v1, v0

    const/16 v9, 0x7f

    if-le v8, v9, :cond_30

    .line 411
    :cond_2f
    const/4 v3, 0x1

    .line 409
    :cond_30
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 415
    :cond_33
    const-string v8, "[%03d] "

    new-array v9, v12, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-virtual {v5, v8, v9}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 416
    if-eqz v3, :cond_62

    const/16 v4, 0x23

    .line 417
    .local v4, "maxSize":I
    :goto_44
    const-string v2, ""

    .line 418
    .local v2, "elipsis":Ljava/lang/String;
    if-le v6, v4, :cond_4b

    .line 419
    move v6, v4

    .line 420
    const-string v2, "..."

    .line 422
    :cond_4b
    const/4 v0, 0x0

    :goto_4c
    if-ge v0, v6, :cond_75

    .line 423
    if-eqz v3, :cond_65

    .line 424
    const-string v8, "%02X"

    new-array v9, v12, [Ljava/lang/Object;

    aget-byte v10, v1, v0

    invoke-static {v10}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-virtual {v5, v8, v9}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 422
    :goto_5f
    add-int/lit8 v0, v0, 0x1

    goto :goto_4c

    .line 416
    .end local v2    # "elipsis":Ljava/lang/String;
    .end local v4    # "maxSize":I
    :cond_62
    const/16 v4, 0x46

    goto :goto_44

    .line 427
    .restart local v2    # "elipsis":Ljava/lang/String;
    .restart local v4    # "maxSize":I
    :cond_65
    const-string v8, "%c"

    new-array v9, v12, [Ljava/lang/Object;

    aget-byte v10, v1, v0

    invoke-static {v10}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-virtual {v5, v8, v9}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    goto :goto_5f

    .line 430
    :cond_75
    const-string v8, "%s\n"

    new-array v9, v12, [Ljava/lang/Object;

    aput-object v2, v9, v11

    invoke-virtual {v5, v8, v9}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 431
    invoke-virtual {v5}, Ljava/io/PrintWriter;->flush()V

    .line 432
    invoke-virtual {v5}, Ljava/io/PrintWriter;->close()V

    .line 434
    :try_start_84
    invoke-virtual {v7}, Ljava/io/StringWriter;->close()V
    :try_end_87
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_87} :catch_91

    .line 439
    :goto_87
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v7}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 440
    return-void

    .line 436
    :catch_91
    move-exception v8

    goto :goto_87
.end method

.method public reset(Ljava/lang/String;)V
    .registers 3
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 251
    sget-object v0, Lorg/zeromq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/zeromq/ZFrame;->data:[B

    .line 252
    return-void
.end method

.method public reset([B)V
    .registers 2
    .param p1, "data"    # [B

    .prologue
    .line 261
    iput-object p1, p0, Lorg/zeromq/ZFrame;->data:[B

    .line 262
    return-void
.end method

.method public send(Lorg/zeromq/ZMQ$Socket;I)Z
    .registers 5
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "flags"    # I

    .prologue
    .line 146
    if-nez p1, :cond_a

    .line 147
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "socket parameter must be set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 150
    :cond_a
    iget-object v0, p0, Lorg/zeromq/ZFrame;->data:[B

    invoke-virtual {p1, v0, p2}, Lorg/zeromq/ZMQ$Socket;->send([BI)Z

    move-result v0

    return v0
.end method

.method public sendAndDestroy(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 212
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/zeromq/ZFrame;->sendAndDestroy(Lorg/zeromq/ZMQ$Socket;I)Z

    move-result v0

    return v0
.end method

.method public sendAndDestroy(Lorg/zeromq/ZMQ$Socket;I)Z
    .registers 4
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "flags"    # I

    .prologue
    .line 194
    invoke-virtual {p0, p1, p2}, Lorg/zeromq/ZFrame;->send(Lorg/zeromq/ZMQ$Socket;I)Z

    move-result v0

    .line 195
    .local v0, "ret":Z
    if-eqz v0, :cond_9

    .line 196
    invoke-virtual {p0}, Lorg/zeromq/ZFrame;->destroy()V

    .line 198
    :cond_9
    return v0
.end method

.method public sendAndKeep(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 179
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/zeromq/ZFrame;->sendAndKeep(Lorg/zeromq/ZMQ$Socket;I)Z

    move-result v0

    return v0
.end method

.method public sendAndKeep(Lorg/zeromq/ZMQ$Socket;I)Z
    .registers 4
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "flags"    # I

    .prologue
    .line 165
    invoke-virtual {p0, p1, p2}, Lorg/zeromq/ZFrame;->send(Lorg/zeromq/ZMQ$Socket;I)Z

    move-result v0

    return v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 117
    invoke-virtual {p0}, Lorg/zeromq/ZFrame;->hasData()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 118
    iget-object v0, p0, Lorg/zeromq/ZFrame;->data:[B

    array-length v0, v0

    .line 121
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public streq(Ljava/lang/String;)Z
    .registers 6
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 291
    invoke-virtual {p0}, Lorg/zeromq/ZFrame;->hasData()Z

    move-result v1

    if-nez v1, :cond_8

    .line 294
    :cond_7
    :goto_7
    return v0

    :cond_8
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lorg/zeromq/ZFrame;->data:[B

    sget-object v3, Lorg/zeromq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v1, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_7

    const/4 v0, 0x1

    goto :goto_7
.end method

.method public strhex()Ljava/lang/String;
    .registers 10

    .prologue
    .line 269
    const-string v5, "0123456789ABCDEF"

    .line 271
    .local v5, "hexChar":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 272
    .local v2, "b":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/zeromq/ZFrame;->data:[B

    .local v1, "arr$":[B
    array-length v7, v1

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_b
    if-ge v6, v7, :cond_26

    aget-byte v0, v1, v6

    .line 273
    .local v0, "aData":B
    ushr-int/lit8 v8, v0, 0x4

    and-int/lit8 v3, v8, 0xf

    .line 274
    .local v3, "b1":I
    and-int/lit8 v4, v0, 0xf

    .line 275
    .local v4, "b2":I
    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 276
    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 272
    add-int/lit8 v6, v6, 0x1

    goto :goto_b

    .line 278
    .end local v0    # "aData":B
    .end local v3    # "b1":I
    .end local v4    # "b2":I
    :cond_26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method public toString()Ljava/lang/String;
    .registers 9

    .prologue
    .line 323
    invoke-virtual {p0}, Lorg/zeromq/ZFrame;->hasData()Z

    move-result v5

    if-nez v5, :cond_9

    .line 324
    const-string v5, ""

    .line 338
    :goto_8
    return-object v5

    .line 327
    :cond_9
    const/4 v3, 0x1

    .line 328
    .local v3, "isText":Z
    iget-object v1, p0, Lorg/zeromq/ZFrame;->data:[B

    .local v1, "arr$":[B
    array-length v4, v1

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_e
    if-ge v2, v4, :cond_17

    aget-byte v0, v1, v2

    .line 329
    .local v0, "aData":B
    const/16 v5, 0x20

    if-ge v0, v5, :cond_23

    .line 330
    const/4 v3, 0x0

    .line 334
    .end local v0    # "aData":B
    :cond_17
    if-eqz v3, :cond_26

    .line 335
    new-instance v5, Ljava/lang/String;

    iget-object v6, p0, Lorg/zeromq/ZFrame;->data:[B

    sget-object v7, Lorg/zeromq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v5, v6, v7}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    goto :goto_8

    .line 328
    .restart local v0    # "aData":B
    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 338
    .end local v0    # "aData":B
    :cond_26
    invoke-virtual {p0}, Lorg/zeromq/ZFrame;->strhex()Ljava/lang/String;

    move-result-object v5

    goto :goto_8
.end method
