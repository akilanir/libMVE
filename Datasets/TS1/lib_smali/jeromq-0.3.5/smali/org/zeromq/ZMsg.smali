.class public Lorg/zeromq/ZMsg;
.super Ljava/lang/Object;
.source "ZMsg.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/util/Deque;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/zeromq/ZFrame;",
        ">;",
        "Ljava/util/Deque",
        "<",
        "Lorg/zeromq/ZFrame;",
        ">;"
    }
.end annotation


# instance fields
.field private frames:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque",
            "<",
            "Lorg/zeromq/ZFrame;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    .line 76
    return-void
.end method

.method public static load(Ljava/io/DataInputStream;)Lorg/zeromq/ZMsg;
    .registers 9
    .param p0, "file"    # Ljava/io/DataInputStream;

    .prologue
    const/4 v6, 0x0

    .line 313
    if-nez p0, :cond_5

    move-object v5, v6

    .line 332
    :cond_4
    :goto_4
    return-object v5

    .line 316
    :cond_5
    new-instance v5, Lorg/zeromq/ZMsg;

    invoke-direct {v5}, Lorg/zeromq/ZMsg;-><init>()V

    .line 319
    .local v5, "rcvMsg":Lorg/zeromq/ZMsg;
    :try_start_a
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 320
    .local v4, "msgSize":I
    if-lez v4, :cond_4

    .line 321
    const/4 v3, 0x0

    .line 322
    .local v3, "msgNbr":I
    :goto_11
    add-int/lit8 v3, v3, 0x1

    if-gt v3, v4, :cond_4

    .line 323
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    .line 324
    .local v2, "frameSize":I
    new-array v0, v2, [B

    .line 325
    .local v0, "data":[B
    invoke-virtual {p0, v0}, Ljava/io/DataInputStream;->read([B)I

    .line 326
    new-instance v7, Lorg/zeromq/ZFrame;

    invoke-direct {v7, v0}, Lorg/zeromq/ZFrame;-><init>([B)V

    invoke-virtual {v5, v7}, Lorg/zeromq/ZMsg;->add(Lorg/zeromq/ZFrame;)Z
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_26} :catch_27

    goto :goto_11

    .line 331
    .end local v0    # "data":[B
    .end local v2    # "frameSize":I
    .end local v3    # "msgNbr":I
    .end local v4    # "msgSize":I
    :catch_27
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    move-object v5, v6

    .line 332
    goto :goto_4
.end method

.method public static varargs newStringMsg([Ljava/lang/String;)Lorg/zeromq/ZMsg;
    .registers 6
    .param p0, "strings"    # [Ljava/lang/String;

    .prologue
    .line 346
    new-instance v4, Lorg/zeromq/ZMsg;

    invoke-direct {v4}, Lorg/zeromq/ZMsg;-><init>()V

    .line 347
    .local v4, "msg":Lorg/zeromq/ZMsg;
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_8
    if-ge v2, v3, :cond_12

    aget-object v1, v0, v2

    .line 348
    .local v1, "data":Ljava/lang/String;
    invoke-virtual {v4, v1}, Lorg/zeromq/ZMsg;->addString(Ljava/lang/String;)V

    .line 347
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 350
    .end local v1    # "data":Ljava/lang/String;
    :cond_12
    return-object v4
.end method

.method public static recvMsg(Lorg/zeromq/ZMQ$Socket;)Lorg/zeromq/ZMsg;
    .registers 2
    .param p0, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 228
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/zeromq/ZMsg;->recvMsg(Lorg/zeromq/ZMQ$Socket;I)Lorg/zeromq/ZMsg;

    move-result-object v0

    return-object v0
.end method

.method public static recvMsg(Lorg/zeromq/ZMQ$Socket;I)Lorg/zeromq/ZMsg;
    .registers 6
    .param p0, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p1, "flag"    # I

    .prologue
    .line 241
    if-nez p0, :cond_a

    .line 242
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "socket is null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 245
    :cond_a
    new-instance v1, Lorg/zeromq/ZMsg;

    invoke-direct {v1}, Lorg/zeromq/ZMsg;-><init>()V

    .line 248
    .local v1, "msg":Lorg/zeromq/ZMsg;
    :cond_f
    invoke-static {p0, p1}, Lorg/zeromq/ZFrame;->recvFrame(Lorg/zeromq/ZMQ$Socket;I)Lorg/zeromq/ZFrame;

    move-result-object v0

    .line 249
    .local v0, "f":Lorg/zeromq/ZFrame;
    if-nez v0, :cond_1a

    .line 251
    invoke-virtual {v1}, Lorg/zeromq/ZMsg;->destroy()V

    .line 252
    const/4 v1, 0x0

    .line 260
    :goto_19
    return-object v1

    .line 255
    :cond_1a
    invoke-virtual {v1, v0}, Lorg/zeromq/ZMsg;->add(Lorg/zeromq/ZFrame;)Z

    .line 256
    invoke-virtual {v0}, Lorg/zeromq/ZFrame;->hasMore()Z

    move-result v2

    if-nez v2, :cond_f

    goto :goto_19
.end method

.method public static save(Lorg/zeromq/ZMsg;Ljava/io/DataOutputStream;)Z
    .registers 7
    .param p0, "msg"    # Lorg/zeromq/ZMsg;
    .param p1, "file"    # Ljava/io/DataOutputStream;

    .prologue
    const/4 v3, 0x0

    .line 281
    if-nez p0, :cond_4

    .line 299
    :goto_3
    return v3

    .line 287
    :cond_4
    :try_start_4
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->size()I

    move-result v4

    invoke-virtual {p1, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 288
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->size()I

    move-result v4

    if-lez v4, :cond_32

    .line 289
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_32

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZFrame;

    .line 291
    .local v1, "f":Lorg/zeromq/ZFrame;
    invoke-virtual {v1}, Lorg/zeromq/ZFrame;->size()I

    move-result v4

    invoke-virtual {p1, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 293
    invoke-virtual {v1}, Lorg/zeromq/ZFrame;->getData()[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/DataOutputStream;->write([B)V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_2f} :catch_30

    goto :goto_15

    .line 298
    .end local v1    # "f":Lorg/zeromq/ZFrame;
    .end local v2    # "i$":Ljava/util/Iterator;
    :catch_30
    move-exception v0

    .line 299
    .local v0, "e":Ljava/io/IOException;
    goto :goto_3

    .line 296
    .end local v0    # "e":Ljava/io/IOException;
    :cond_32
    const/4 v3, 0x1

    goto :goto_3
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 63
    check-cast p1, Lorg/zeromq/ZFrame;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/zeromq/ZMsg;->add(Lorg/zeromq/ZFrame;)Z

    move-result v0

    return v0
.end method

.method public add(Ljava/lang/String;)Z
    .registers 3
    .param p1, "stringValue"    # Ljava/lang/String;

    .prologue
    .line 460
    new-instance v0, Lorg/zeromq/ZFrame;

    invoke-direct {v0, p1}, Lorg/zeromq/ZFrame;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/zeromq/ZMsg;->add(Lorg/zeromq/ZFrame;)Z

    move-result v0

    return v0
.end method

.method public add(Lorg/zeromq/ZFrame;)Z
    .registers 3
    .param p1, "e"    # Lorg/zeromq/ZFrame;

    .prologue
    .line 528
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-nez v0, :cond_b

    .line 529
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    .line 531
    :cond_b
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public add([B)Z
    .registers 3
    .param p1, "data"    # [B

    .prologue
    .line 465
    new-instance v0, Lorg/zeromq/ZFrame;

    invoke-direct {v0, p1}, Lorg/zeromq/ZFrame;-><init>([B)V

    invoke-virtual {p0, v0}, Lorg/zeromq/ZMsg;->add(Lorg/zeromq/ZFrame;)Z

    move-result v0

    return v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lorg/zeromq/ZFrame;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 480
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<+Lorg/zeromq/ZFrame;>;"
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->addAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic addFirst(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 63
    check-cast p1, Lorg/zeromq/ZFrame;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/zeromq/ZMsg;->addFirst(Lorg/zeromq/ZFrame;)V

    return-void
.end method

.method public addFirst(Ljava/lang/String;)V
    .registers 3
    .param p1, "stringValue"    # Ljava/lang/String;

    .prologue
    .line 428
    new-instance v0, Lorg/zeromq/ZFrame;

    invoke-direct {v0, p1}, Lorg/zeromq/ZFrame;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/zeromq/ZMsg;->addFirst(Lorg/zeromq/ZFrame;)V

    .line 429
    return-void
.end method

.method public addFirst(Lorg/zeromq/ZFrame;)V
    .registers 3
    .param p1, "e"    # Lorg/zeromq/ZFrame;

    .prologue
    .line 537
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-nez v0, :cond_b

    .line 538
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    .line 540
    :cond_b
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    .line 541
    return-void
.end method

.method public addFirst([B)V
    .registers 3
    .param p1, "data"    # [B

    .prologue
    .line 433
    new-instance v0, Lorg/zeromq/ZFrame;

    invoke-direct {v0, p1}, Lorg/zeromq/ZFrame;-><init>([B)V

    invoke-virtual {p0, v0}, Lorg/zeromq/ZMsg;->addFirst(Lorg/zeromq/ZFrame;)V

    .line 434
    return-void
.end method

.method public bridge synthetic addLast(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 63
    check-cast p1, Lorg/zeromq/ZFrame;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/zeromq/ZMsg;->addLast(Lorg/zeromq/ZFrame;)V

    return-void
.end method

.method public addLast(Ljava/lang/String;)V
    .registers 3
    .param p1, "stringValue"    # Ljava/lang/String;

    .prologue
    .line 438
    new-instance v0, Lorg/zeromq/ZFrame;

    invoke-direct {v0, p1}, Lorg/zeromq/ZFrame;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/zeromq/ZMsg;->addLast(Lorg/zeromq/ZFrame;)V

    .line 439
    return-void
.end method

.method public addLast(Lorg/zeromq/ZFrame;)V
    .registers 3
    .param p1, "e"    # Lorg/zeromq/ZFrame;

    .prologue
    .line 546
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-nez v0, :cond_b

    .line 547
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    .line 549
    :cond_b
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 550
    return-void
.end method

.method public addLast([B)V
    .registers 3
    .param p1, "data"    # [B

    .prologue
    .line 443
    new-instance v0, Lorg/zeromq/ZFrame;

    invoke-direct {v0, p1}, Lorg/zeromq/ZFrame;-><init>([B)V

    invoke-virtual {p0, v0}, Lorg/zeromq/ZMsg;->addLast(Lorg/zeromq/ZFrame;)V

    .line 444
    return-void
.end method

.method public addString(Ljava/lang/String;)V
    .registers 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 113
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-nez v0, :cond_b

    .line 114
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    .line 116
    :cond_b
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    new-instance v1, Lorg/zeromq/ZFrame;

    invoke-direct {v1, p1}, Lorg/zeromq/ZFrame;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 117
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 486
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 487
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 555
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 492
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public contentSize()J
    .registers 7

    .prologue
    .line 99
    const-wide/16 v2, 0x0

    .line 100
    .local v2, "size":J
    iget-object v4, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v4}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZFrame;

    .line 101
    .local v0, "f":Lorg/zeromq/ZFrame;
    invoke-virtual {v0}, Lorg/zeromq/ZFrame;->size()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    .line 102
    goto :goto_8

    .line 103
    .end local v0    # "f":Lorg/zeromq/ZFrame;
    :cond_1b
    return-wide v2
.end method

.method public descendingIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/zeromq/ZFrame;",
            ">;"
        }
    .end annotation

    .prologue
    .line 561
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->descendingIterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public destroy()V
    .registers 4

    .prologue
    .line 84
    iget-object v2, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-nez v2, :cond_5

    .line 92
    :goto_4
    return-void

    .line 87
    :cond_5
    iget-object v2, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZFrame;

    .line 88
    .local v0, "f":Lorg/zeromq/ZFrame;
    invoke-virtual {v0}, Lorg/zeromq/ZFrame;->destroy()V

    goto :goto_b

    .line 90
    .end local v0    # "f":Lorg/zeromq/ZFrame;
    :cond_1b
    iget-object v2, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->clear()V

    .line 91
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    goto :goto_4
.end method

.method public dump()V
    .registers 2

    .prologue
    .line 421
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Lorg/zeromq/ZMsg;->dump(Ljava/lang/Appendable;)V

    .line 422
    return-void
.end method

.method public dump(Ljava/lang/Appendable;)V
    .registers 11
    .param p1, "out"    # Ljava/lang/Appendable;

    .prologue
    .line 403
    :try_start_0
    new-instance v4, Ljava/io/StringWriter;

    invoke-direct {v4}, Ljava/io/StringWriter;-><init>()V

    .line 404
    .local v4, "sw":Ljava/io/StringWriter;
    new-instance v3, Ljava/io/PrintWriter;

    invoke-direct {v3, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 405
    .local v3, "pw":Ljava/io/PrintWriter;
    const-string v5, "--------------------------------------\n"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v3, v5, v6}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;

    .line 406
    iget-object v5, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v5}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZFrame;

    .line 407
    .local v1, "frame":Lorg/zeromq/ZFrame;
    const-string v5, "[%03d] %s\n"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v1}, Lorg/zeromq/ZFrame;->size()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-virtual {v1}, Lorg/zeromq/ZFrame;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v3, v5, v6}, Ljava/io/PrintWriter;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintWriter;
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3e} :catch_3f

    goto :goto_18

    .line 413
    .end local v1    # "frame":Lorg/zeromq/ZFrame;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "pw":Ljava/io/PrintWriter;
    .end local v4    # "sw":Ljava/io/StringWriter;
    :catch_3f
    move-exception v0

    .line 414
    .local v0, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Message dump exception "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 410
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "pw":Ljava/io/PrintWriter;
    .restart local v4    # "sw":Ljava/io/StringWriter;
    :cond_5d
    :try_start_5d
    invoke-virtual {v4}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 411
    invoke-virtual {v4}, Ljava/io/StringWriter;->close()V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_5d .. :try_end_67} :catch_3f

    .line 417
    return-void
.end method

.method public duplicate()Lorg/zeromq/ZMsg;
    .registers 5

    .prologue
    .line 127
    iget-object v3, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-eqz v3, :cond_23

    .line 128
    new-instance v2, Lorg/zeromq/ZMsg;

    invoke-direct {v2}, Lorg/zeromq/ZMsg;-><init>()V

    .line 129
    .local v2, "msg":Lorg/zeromq/ZMsg;
    iget-object v3, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZFrame;

    .line 130
    .local v0, "f":Lorg/zeromq/ZFrame;
    invoke-virtual {v0}, Lorg/zeromq/ZFrame;->duplicate()Lorg/zeromq/ZFrame;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/zeromq/ZMsg;->add(Lorg/zeromq/ZFrame;)Z

    goto :goto_f

    .line 135
    .end local v0    # "f":Lorg/zeromq/ZFrame;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "msg":Lorg/zeromq/ZMsg;
    :cond_23
    const/4 v2, 0x0

    :cond_24
    return-object v2
.end method

.method public bridge synthetic element()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->element()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public element()Lorg/zeromq/ZFrame;
    .registers 2

    .prologue
    .line 567
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->element()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZFrame;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 11
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 356
    if-ne p0, p1, :cond_6

    move v6, v5

    .line 378
    :cond_5
    :goto_5
    return v6

    .line 359
    :cond_6
    if-eqz p1, :cond_5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    if-ne v7, v8, :cond_5

    move-object v4, p1

    .line 362
    check-cast v4, Lorg/zeromq/ZMsg;

    .line 364
    .local v4, "zMsg":Lorg/zeromq/ZMsg;
    iget-object v7, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-eqz v7, :cond_5

    iget-object v7, v4, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-eqz v7, :cond_5

    .line 369
    iget-object v7, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v7}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 370
    .local v0, "e1":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/zeromq/ZFrame;>;"
    iget-object v7, v4, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v7}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 371
    .local v1, "e2":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/zeromq/ZFrame;>;"
    :cond_29
    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4d

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 372
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/zeromq/ZFrame;

    .line 373
    .local v2, "o1":Lorg/zeromq/ZFrame;
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/zeromq/ZFrame;

    .line 374
    .local v3, "o2":Lorg/zeromq/ZFrame;
    if-nez v2, :cond_46

    if-nez v3, :cond_5

    goto :goto_29

    :cond_46
    invoke-virtual {v2, v3}, Lorg/zeromq/ZFrame;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_29

    goto :goto_5

    .line 378
    .end local v2    # "o1":Lorg/zeromq/ZFrame;
    .end local v3    # "o2":Lorg/zeromq/ZFrame;
    :cond_4d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_5b

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_5b

    :goto_59
    move v6, v5

    goto :goto_5

    :cond_5b
    move v5, v6

    goto :goto_59
.end method

.method public bridge synthetic getFirst()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->getFirst()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public getFirst()Lorg/zeromq/ZFrame;
    .registers 3

    .prologue
    .line 574
    :try_start_0
    iget-object v1, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZFrame;
    :try_end_8
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_8} :catch_9

    .line 577
    :goto_8
    return-object v1

    .line 576
    :catch_9
    move-exception v0

    .line 577
    .local v0, "e":Ljava/util/NoSuchElementException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public bridge synthetic getLast()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->getLast()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public getLast()Lorg/zeromq/ZFrame;
    .registers 3

    .prologue
    .line 585
    :try_start_0
    iget-object v1, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZFrame;
    :try_end_8
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_8} :catch_9

    .line 588
    :goto_8
    return-object v1

    .line 587
    :catch_9
    move-exception v0

    .line 588
    .local v0, "e":Ljava/util/NoSuchElementException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public hashCode()I
    .registers 7

    .prologue
    const/4 v4, 0x0

    .line 384
    iget-object v3, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-eqz v3, :cond_d

    iget-object v3, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->size()I

    move-result v3

    if-nez v3, :cond_f

    :cond_d
    move v2, v4

    .line 393
    :cond_e
    return v2

    .line 388
    :cond_f
    const/4 v2, 0x1

    .line 389
    .local v2, "result":I
    iget-object v3, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZFrame;

    .line 390
    .local v0, "frame":Lorg/zeromq/ZFrame;
    mul-int/lit8 v5, v2, 0x1f

    if-nez v0, :cond_2a

    move v3, v4

    :goto_27
    add-int v2, v5, v3

    .line 391
    goto :goto_16

    .line 390
    :cond_2a
    invoke-virtual {v0}, Lorg/zeromq/ZFrame;->hashCode()I

    move-result v3

    goto :goto_27
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 498
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/zeromq/ZFrame;",
            ">;"
        }
    .end annotation

    .prologue
    .line 473
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic offer(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 63
    check-cast p1, Lorg/zeromq/ZFrame;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/zeromq/ZMsg;->offer(Lorg/zeromq/ZFrame;)Z

    move-result v0

    return v0
.end method

.method public offer(Lorg/zeromq/ZFrame;)Z
    .registers 3
    .param p1, "e"    # Lorg/zeromq/ZFrame;

    .prologue
    .line 595
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-nez v0, :cond_b

    .line 596
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    .line 598
    :cond_b
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic offerFirst(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 63
    check-cast p1, Lorg/zeromq/ZFrame;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/zeromq/ZMsg;->offerFirst(Lorg/zeromq/ZFrame;)Z

    move-result v0

    return v0
.end method

.method public offerFirst(Lorg/zeromq/ZFrame;)Z
    .registers 3
    .param p1, "e"    # Lorg/zeromq/ZFrame;

    .prologue
    .line 604
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-nez v0, :cond_b

    .line 605
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    .line 607
    :cond_b
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->offerFirst(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic offerLast(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 63
    check-cast p1, Lorg/zeromq/ZFrame;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/zeromq/ZMsg;->offerLast(Lorg/zeromq/ZFrame;)Z

    move-result v0

    return v0
.end method

.method public offerLast(Lorg/zeromq/ZFrame;)Z
    .registers 3
    .param p1, "e"    # Lorg/zeromq/ZFrame;

    .prologue
    .line 613
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-nez v0, :cond_b

    .line 614
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    .line 616
    :cond_b
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->offerLast(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic peek()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->peek()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public peek()Lorg/zeromq/ZFrame;
    .registers 2

    .prologue
    .line 622
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZFrame;

    return-object v0
.end method

.method public bridge synthetic peekFirst()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->peekFirst()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public peekFirst()Lorg/zeromq/ZFrame;
    .registers 3

    .prologue
    .line 629
    :try_start_0
    iget-object v1, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peekFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZFrame;
    :try_end_8
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_8} :catch_9

    .line 632
    :goto_8
    return-object v1

    .line 631
    :catch_9
    move-exception v0

    .line 632
    .local v0, "e":Ljava/util/NoSuchElementException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public bridge synthetic peekLast()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->peekLast()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public peekLast()Lorg/zeromq/ZFrame;
    .registers 3

    .prologue
    .line 640
    :try_start_0
    iget-object v1, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peekLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZFrame;
    :try_end_8
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_8} :catch_9

    .line 643
    :goto_8
    return-object v1

    .line 642
    :catch_9
    move-exception v0

    .line 643
    .local v0, "e":Ljava/util/NoSuchElementException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public bridge synthetic poll()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->poll()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public poll()Lorg/zeromq/ZFrame;
    .registers 2

    .prologue
    .line 650
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZFrame;

    return-object v0
.end method

.method public bridge synthetic pollFirst()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->pollFirst()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public pollFirst()Lorg/zeromq/ZFrame;
    .registers 2

    .prologue
    .line 656
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZFrame;

    return-object v0
.end method

.method public bridge synthetic pollLast()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->pollLast()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public pollLast()Lorg/zeromq/ZFrame;
    .registers 2

    .prologue
    .line 662
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pollLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZFrame;

    return-object v0
.end method

.method public bridge synthetic pop()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->pop()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public pop()Lorg/zeromq/ZFrame;
    .registers 3

    .prologue
    .line 668
    iget-object v1, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-nez v1, :cond_b

    .line 669
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v1, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    .line 672
    :cond_b
    :try_start_b
    iget-object v1, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZFrame;
    :try_end_13
    .catch Ljava/util/NoSuchElementException; {:try_start_b .. :try_end_13} :catch_14

    .line 675
    :goto_13
    return-object v1

    .line 674
    :catch_14
    move-exception v0

    .line 675
    .local v0, "e":Ljava/util/NoSuchElementException;
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public popString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 686
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->pop()Lorg/zeromq/ZFrame;

    move-result-object v0

    .line 687
    .local v0, "frame":Lorg/zeromq/ZFrame;
    if-nez v0, :cond_8

    .line 688
    const/4 v1, 0x0

    .line 691
    :goto_7
    return-object v1

    :cond_8
    invoke-virtual {v0}, Lorg/zeromq/ZFrame;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method public bridge synthetic push(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 63
    check-cast p1, Lorg/zeromq/ZFrame;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/zeromq/ZMsg;->push(Lorg/zeromq/ZFrame;)V

    return-void
.end method

.method public push(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 450
    new-instance v0, Lorg/zeromq/ZFrame;

    invoke-direct {v0, p1}, Lorg/zeromq/ZFrame;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/zeromq/ZMsg;->push(Lorg/zeromq/ZFrame;)V

    .line 451
    return-void
.end method

.method public push(Lorg/zeromq/ZFrame;)V
    .registers 3
    .param p1, "e"    # Lorg/zeromq/ZFrame;

    .prologue
    .line 697
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-nez v0, :cond_b

    .line 698
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    .line 700
    :cond_b
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 701
    return-void
.end method

.method public push([B)V
    .registers 3
    .param p1, "data"    # [B

    .prologue
    .line 455
    new-instance v0, Lorg/zeromq/ZFrame;

    invoke-direct {v0, p1}, Lorg/zeromq/ZFrame;-><init>([B)V

    invoke-virtual {p0, v0}, Lorg/zeromq/ZMsg;->push(Lorg/zeromq/ZFrame;)V

    .line 456
    return-void
.end method

.method public bridge synthetic remove()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->remove()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public remove()Lorg/zeromq/ZFrame;
    .registers 2

    .prologue
    .line 706
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZFrame;

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 712
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 504
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic removeFirst()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->removeFirst()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public removeFirst()Lorg/zeromq/ZFrame;
    .registers 3

    .prologue
    .line 719
    :try_start_0
    iget-object v1, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZFrame;
    :try_end_8
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_8} :catch_9

    .line 722
    :goto_8
    return-object v1

    .line 721
    :catch_9
    move-exception v0

    .line 722
    .local v0, "e":Ljava/util/NoSuchElementException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public removeFirstOccurrence(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 729
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->removeFirstOccurrence(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic removeLast()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->removeLast()Lorg/zeromq/ZFrame;

    move-result-object v0

    return-object v0
.end method

.method public removeLast()Lorg/zeromq/ZFrame;
    .registers 3

    .prologue
    .line 736
    :try_start_0
    iget-object v1, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->removeLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZFrame;
    :try_end_8
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_8} :catch_9

    .line 739
    :goto_8
    return-object v1

    .line 738
    :catch_9
    move-exception v0

    .line 739
    .local v0, "e":Ljava/util/NoSuchElementException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public removeLastOccurrence(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 746
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->removeLastOccurrence(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 510
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public send(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 182
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/zeromq/ZMsg;->send(Lorg/zeromq/ZMQ$Socket;Z)Z

    move-result v0

    return v0
.end method

.method public send(Lorg/zeromq/ZMQ$Socket;Z)Z
    .registers 8
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "destroy"    # Z

    .prologue
    .line 194
    if-nez p1, :cond_a

    .line 195
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "socket is null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 198
    :cond_a
    iget-object v3, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    if-nez v3, :cond_16

    .line 199
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "destroyed message"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 202
    :cond_16
    iget-object v3, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->size()I

    move-result v3

    if-nez v3, :cond_20

    .line 203
    const/4 v2, 0x1

    .line 215
    :cond_1f
    :goto_1f
    return v2

    .line 206
    :cond_20
    const/4 v2, 0x1

    .line 207
    .local v2, "ret":Z
    iget-object v3, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 208
    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/zeromq/ZFrame;>;"
    :goto_27
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_41

    .line 209
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZFrame;

    .line 210
    .local v0, "f":Lorg/zeromq/ZFrame;
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3f

    const/4 v3, 0x2

    :goto_3a
    invoke-virtual {v0, p1, v3}, Lorg/zeromq/ZFrame;->sendAndKeep(Lorg/zeromq/ZMQ$Socket;I)Z

    move-result v2

    .line 211
    goto :goto_27

    .line 210
    :cond_3f
    const/4 v3, 0x0

    goto :goto_3a

    .line 212
    .end local v0    # "f":Lorg/zeromq/ZFrame;
    :cond_41
    if-eqz p2, :cond_1f

    .line 213
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->destroy()V

    goto :goto_1f
.end method

.method public size()I
    .registers 2

    .prologue
    .line 752
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->size()I

    move-result v0

    return v0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 516
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->toArray()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 522
    .local p1, "arg0":[Ljava/lang/Object;, "[TT;"
    iget-object v0, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 764
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "[ "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 765
    .local v1, "out":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lorg/zeromq/ZMsg;->frames:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 766
    .local v0, "frameIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/zeromq/ZFrame;>;"
    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 767
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 768
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 769
    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_d

    .line 772
    :cond_26
    const-string v2, " ]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 773
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public unwrap()Lorg/zeromq/ZFrame;
    .registers 4

    .prologue
    .line 161
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->size()I

    move-result v2

    if-nez v2, :cond_8

    .line 162
    const/4 v1, 0x0

    .line 170
    :cond_7
    :goto_7
    return-object v1

    .line 164
    :cond_8
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->pop()Lorg/zeromq/ZFrame;

    move-result-object v1

    .line 165
    .local v1, "f":Lorg/zeromq/ZFrame;
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->getFirst()Lorg/zeromq/ZFrame;

    move-result-object v0

    .line 166
    .local v0, "empty":Lorg/zeromq/ZFrame;
    invoke-virtual {v0}, Lorg/zeromq/ZFrame;->hasData()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v0}, Lorg/zeromq/ZFrame;->size()I

    move-result v2

    if-nez v2, :cond_7

    .line 167
    invoke-virtual {p0}, Lorg/zeromq/ZMsg;->pop()Lorg/zeromq/ZFrame;

    move-result-object v0

    .line 168
    invoke-virtual {v0}, Lorg/zeromq/ZFrame;->destroy()V

    goto :goto_7
.end method

.method public wrap(Lorg/zeromq/ZFrame;)V
    .registers 4
    .param p1, "frame"    # Lorg/zeromq/ZFrame;

    .prologue
    .line 146
    if-eqz p1, :cond_f

    .line 147
    new-instance v0, Lorg/zeromq/ZFrame;

    const-string v1, ""

    invoke-direct {v0, v1}, Lorg/zeromq/ZFrame;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/zeromq/ZMsg;->push(Lorg/zeromq/ZFrame;)V

    .line 148
    invoke-virtual {p0, p1}, Lorg/zeromq/ZMsg;->push(Lorg/zeromq/ZFrame;)V

    .line 150
    :cond_f
    return-void
.end method
