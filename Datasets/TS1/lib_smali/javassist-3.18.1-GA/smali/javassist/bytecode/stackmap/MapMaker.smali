.class public Ljavassist/bytecode/stackmap/MapMaker;
.super Ljavassist/bytecode/stackmap/Tracer;
.source "MapMaker.java"


# direct methods
.method public constructor <init>(Ljavassist/ClassPool;Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/CodeAttribute;)V
    .registers 10
    .param p1, "classes"    # Ljavassist/ClassPool;
    .param p2, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .param p3, "ca"    # Ljavassist/bytecode/CodeAttribute;

    .prologue
    .line 151
    invoke-virtual {p2}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    invoke-virtual {p3}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v3

    invoke-virtual {p3}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v4

    invoke-virtual {p2}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljavassist/bytecode/stackmap/TypedBlock;->getRetType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Ljavassist/bytecode/stackmap/Tracer;-><init>(Ljavassist/ClassPool;Ljavassist/bytecode/ConstPool;IILjava/lang/String;)V

    .line 154
    return-void
.end method

.method protected constructor <init>(Ljavassist/bytecode/stackmap/MapMaker;)V
    .registers 2
    .param p1, "old"    # Ljavassist/bytecode/stackmap/MapMaker;

    .prologue
    .line 156
    invoke-direct {p0, p1}, Ljavassist/bytecode/stackmap/Tracer;-><init>(Ljavassist/bytecode/stackmap/Tracer;)V

    return-void
.end method

.method protected static copyTypeData(I[Ljavassist/bytecode/stackmap/TypeData;[Ljavassist/bytecode/stackmap/TypeData;)V
    .registers 5
    .param p0, "n"    # I
    .param p1, "srcTypes"    # [Ljavassist/bytecode/stackmap/TypeData;
    .param p2, "destTypes"    # [Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 304
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p0, :cond_a

    .line 305
    aget-object v1, p1, v0

    aput-object v1, p2, v0

    .line 304
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 306
    :cond_a
    return-void
.end method

.method private static diffSize([Ljavassist/bytecode/stackmap/TypeData;II)I
    .registers 7
    .param p0, "types"    # [Ljavassist/bytecode/stackmap/TypeData;
    .param p1, "offset"    # I
    .param p2, "len"    # I

    .prologue
    .line 539
    const/4 v0, 0x0

    .local v0, "num":I
    move v1, p1

    .line 540
    .end local p1    # "offset":I
    .local v1, "offset":I
    :goto_2
    if-ge v1, p2, :cond_14

    .line 541
    add-int/lit8 p1, v1, 0x1

    .end local v1    # "offset":I
    .restart local p1    # "offset":I
    aget-object v2, p0, v1

    .line 542
    .local v2, "td":Ljavassist/bytecode/stackmap/TypeData;
    add-int/lit8 v0, v0, 0x1

    .line 543
    invoke-virtual {v2}, Ljavassist/bytecode/stackmap/TypeData;->is2WordType()Z

    move-result v3

    if-eqz v3, :cond_12

    .line 544
    add-int/lit8 p1, p1, 0x1

    :cond_12
    move v1, p1

    .line 545
    .end local p1    # "offset":I
    .restart local v1    # "offset":I
    goto :goto_2

    .line 547
    .end local v2    # "td":Ljavassist/bytecode/stackmap/TypeData;
    :cond_14
    return v0
.end method

.method private fillStackMap(II[I[Ljavassist/bytecode/stackmap/TypeData;)[I
    .registers 12
    .param p1, "num"    # I
    .param p2, "offset"    # I
    .param p3, "data"    # [I
    .param p4, "types"    # [Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 493
    add-int v6, p2, p1

    invoke-static {p4, p2, v6}, Ljavassist/bytecode/stackmap/MapMaker;->diffSize([Ljavassist/bytecode/stackmap/TypeData;II)I

    move-result v3

    .line 494
    .local v3, "realNum":I
    iget-object v0, p0, Ljavassist/bytecode/stackmap/MapMaker;->cpool:Ljavassist/bytecode/ConstPool;

    .line 495
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    new-array v4, v3, [I

    .line 496
    .local v4, "tags":[I
    const/4 v2, 0x0

    .line 497
    .local v2, "j":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, p1, :cond_2b

    .line 498
    add-int v6, p2, v1

    aget-object v5, p4, v6

    .line 499
    .local v5, "td":Ljavassist/bytecode/stackmap/TypeData;
    invoke-virtual {v5}, Ljavassist/bytecode/stackmap/TypeData;->getTypeTag()I

    move-result v6

    aput v6, v4, v2

    .line 500
    invoke-virtual {v5, v0}, Ljavassist/bytecode/stackmap/TypeData;->getTypeData(Ljavassist/bytecode/ConstPool;)I

    move-result v6

    aput v6, p3, v2

    .line 501
    invoke-virtual {v5}, Ljavassist/bytecode/stackmap/TypeData;->is2WordType()Z

    move-result v6

    if-eqz v6, :cond_26

    .line 502
    add-int/lit8 v1, v1, 0x1

    .line 504
    :cond_26
    add-int/lit8 v2, v2, 0x1

    .line 497
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 507
    .end local v5    # "td":Ljavassist/bytecode/stackmap/TypeData;
    :cond_2b
    return-object v4
.end method

.method private findDeadCatchers([B[Ljavassist/bytecode/stackmap/TypedBlock;)V
    .registers 9
    .param p1, "code"    # [B
    .param p2, "blocks"    # [Ljavassist/bytecode/stackmap/TypedBlock;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 326
    array-length v3, p2

    .line 327
    .local v3, "len":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    if-ge v2, v3, :cond_2b

    .line 328
    aget-object v0, p2, v2

    .line 329
    .local v0, "block":Ljavassist/bytecode/stackmap/TypedBlock;
    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypedBlock;->alreadySet()Z

    move-result v5

    if-nez v5, :cond_28

    .line 330
    invoke-direct {p0, p1, v0}, Ljavassist/bytecode/stackmap/MapMaker;->fixDeadcode([BLjavassist/bytecode/stackmap/TypedBlock;)V

    .line 331
    iget-object v1, v0, Ljavassist/bytecode/stackmap/TypedBlock;->toCatch:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    .line 332
    .local v1, "handler":Ljavassist/bytecode/stackmap/BasicBlock$Catch;
    if-eqz v1, :cond_28

    .line 333
    iget-object v4, v1, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->body:Ljavassist/bytecode/stackmap/BasicBlock;

    check-cast v4, Ljavassist/bytecode/stackmap/TypedBlock;

    .line 334
    .local v4, "tb":Ljavassist/bytecode/stackmap/TypedBlock;
    invoke-virtual {v4}, Ljavassist/bytecode/stackmap/TypedBlock;->alreadySet()Z

    move-result v5

    if-nez v5, :cond_28

    .line 337
    iget v5, v1, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->typeIndex:I

    invoke-direct {p0, v4, v5}, Ljavassist/bytecode/stackmap/MapMaker;->recordStackMap(Ljavassist/bytecode/stackmap/TypedBlock;I)V

    .line 338
    invoke-direct {p0, p1, v4}, Ljavassist/bytecode/stackmap/MapMaker;->fixDeadcode([BLjavassist/bytecode/stackmap/TypedBlock;)V

    .line 339
    const/4 v5, 0x1

    iput v5, v4, Ljavassist/bytecode/stackmap/TypedBlock;->incoming:I

    .line 327
    .end local v1    # "handler":Ljavassist/bytecode/stackmap/BasicBlock$Catch;
    .end local v4    # "tb":Ljavassist/bytecode/stackmap/TypedBlock;
    :cond_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 345
    .end local v0    # "block":Ljavassist/bytecode/stackmap/TypedBlock;
    :cond_2b
    return-void
.end method

.method private fixDeadcode([BLjavassist/bytecode/stackmap/TypedBlock;)V
    .registers 9
    .param p1, "code"    # [B
    .param p2, "block"    # Ljavassist/bytecode/stackmap/TypedBlock;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 348
    iget v2, p2, Ljavassist/bytecode/stackmap/TypedBlock;->position:I

    .line 349
    .local v2, "pos":I
    iget v3, p2, Ljavassist/bytecode/stackmap/TypedBlock;->length:I

    add-int/lit8 v1, v3, -0x3

    .line 350
    .local v1, "len":I
    if-gez v1, :cond_1e

    .line 352
    const/4 v3, -0x1

    if-ne v1, v3, :cond_e

    .line 353
    aput-byte v5, p1, v2

    .line 355
    :cond_e
    iget v3, p2, Ljavassist/bytecode/stackmap/TypedBlock;->length:I

    add-int/2addr v3, v2

    add-int/lit8 v3, v3, -0x1

    const/16 v4, -0x41

    aput-byte v4, p1, v3

    .line 356
    const/4 v3, 0x1

    iput v3, p2, Ljavassist/bytecode/stackmap/TypedBlock;->incoming:I

    .line 357
    invoke-direct {p0, p2, v5}, Ljavassist/bytecode/stackmap/MapMaker;->recordStackMap(Ljavassist/bytecode/stackmap/TypedBlock;I)V

    .line 370
    :goto_1d
    return-void

    .line 363
    :cond_1e
    iput v5, p2, Ljavassist/bytecode/stackmap/TypedBlock;->incoming:I

    .line 365
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_21
    if-ge v0, v1, :cond_2a

    .line 366
    add-int v3, v2, v0

    aput-byte v5, p1, v3

    .line 365
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 368
    :cond_2a
    add-int v3, v2, v1

    const/16 v4, -0x59

    aput-byte v4, p1, v3

    .line 369
    neg-int v3, v1

    add-int v4, v2, v1

    add-int/lit8 v4, v4, 0x1

    invoke-static {v3, p1, v4}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    goto :goto_1d
.end method

.method private fixTypes([B[Ljavassist/bytecode/stackmap/TypedBlock;)V
    .registers 12
    .param p1, "code"    # [B
    .param p2, "blocks"    # [Ljavassist/bytecode/stackmap/TypedBlock;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;,
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 382
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 383
    .local v6, "preOrder":Ljava/util/ArrayList;
    array-length v4, p2

    .line 384
    .local v4, "len":I
    const/4 v2, 0x0

    .line 385
    .local v2, "index":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v4, :cond_3a

    .line 386
    aget-object v0, p2, v1

    .line 387
    .local v0, "block":Ljavassist/bytecode/stackmap/TypedBlock;
    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypedBlock;->alreadySet()Z

    move-result v7

    if-eqz v7, :cond_37

    .line 388
    iget-object v7, v0, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    array-length v5, v7

    .line 389
    .local v5, "n":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_16
    if-ge v3, v5, :cond_25

    .line 390
    iget-object v7, v0, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    aget-object v7, v7, v3

    iget-object v8, p0, Ljavassist/bytecode/stackmap/MapMaker;->classPool:Ljavassist/ClassPool;

    invoke-virtual {v7, v6, v2, v8}, Ljavassist/bytecode/stackmap/TypeData;->dfs(Ljava/util/ArrayList;ILjavassist/ClassPool;)I

    move-result v2

    .line 389
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 392
    :cond_25
    iget v5, v0, Ljavassist/bytecode/stackmap/TypedBlock;->stackTop:I

    .line 393
    const/4 v3, 0x0

    :goto_28
    if-ge v3, v5, :cond_37

    .line 394
    iget-object v7, v0, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    aget-object v7, v7, v3

    iget-object v8, p0, Ljavassist/bytecode/stackmap/MapMaker;->classPool:Ljavassist/ClassPool;

    invoke-virtual {v7, v6, v2, v8}, Ljavassist/bytecode/stackmap/TypeData;->dfs(Ljava/util/ArrayList;ILjavassist/ClassPool;)I

    move-result v2

    .line 393
    add-int/lit8 v3, v3, 0x1

    goto :goto_28

    .line 385
    .end local v3    # "j":I
    .end local v5    # "n":I
    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 397
    .end local v0    # "block":Ljavassist/bytecode/stackmap/TypedBlock;
    :cond_3a
    return-void
.end method

.method private isTarget(Ljavassist/bytecode/stackmap/TypedBlock;Ljavassist/bytecode/stackmap/TypedBlock;)Z
    .registers 5
    .param p1, "cur"    # Ljavassist/bytecode/stackmap/TypedBlock;
    .param p2, "prev"    # Ljavassist/bytecode/stackmap/TypedBlock;

    .prologue
    const/4 v1, 0x1

    .line 438
    iget v0, p1, Ljavassist/bytecode/stackmap/TypedBlock;->incoming:I

    .line 439
    .local v0, "in":I
    if-le v0, v1, :cond_6

    .line 444
    :goto_5
    return v1

    .line 441
    :cond_6
    if-ge v0, v1, :cond_a

    .line 442
    const/4 v1, 0x0

    goto :goto_5

    .line 444
    :cond_a
    iget-boolean v1, p2, Ljavassist/bytecode/stackmap/TypedBlock;->stop:Z

    goto :goto_5
.end method

.method public static make(Ljavassist/ClassPool;Ljavassist/bytecode/MethodInfo;)Ljavassist/bytecode/StackMapTable;
    .registers 9
    .param p0, "classes"    # Ljavassist/ClassPool;
    .param p1, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 91
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v2

    .line 92
    .local v2, "ca":Ljavassist/bytecode/CodeAttribute;
    if-nez v2, :cond_8

    .line 114
    :cond_7
    :goto_7
    return-object v5

    .line 97
    :cond_8
    const/4 v6, 0x1

    :try_start_9
    invoke-static {p1, v2, v6}, Ljavassist/bytecode/stackmap/TypedBlock;->makeBlocks(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/CodeAttribute;Z)[Ljavassist/bytecode/stackmap/TypedBlock;
    :try_end_c
    .catch Ljavassist/bytecode/stackmap/BasicBlock$JsrBytecode; {:try_start_9 .. :try_end_c} :catch_20

    move-result-object v1

    .line 103
    .local v1, "blocks":[Ljavassist/bytecode/stackmap/TypedBlock;
    if-eqz v1, :cond_7

    .line 106
    new-instance v4, Ljavassist/bytecode/stackmap/MapMaker;

    invoke-direct {v4, p0, p1, v2}, Ljavassist/bytecode/stackmap/MapMaker;-><init>(Ljavassist/ClassPool;Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/CodeAttribute;)V

    .line 108
    .local v4, "mm":Ljavassist/bytecode/stackmap/MapMaker;
    :try_start_14
    invoke-virtual {v2}, Ljavassist/bytecode/CodeAttribute;->getCode()[B

    move-result-object v5

    invoke-virtual {v4, v1, v5}, Ljavassist/bytecode/stackmap/MapMaker;->make([Ljavassist/bytecode/stackmap/TypedBlock;[B)V
    :try_end_1b
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_14 .. :try_end_1b} :catch_22

    .line 114
    invoke-virtual {v4, v1}, Ljavassist/bytecode/stackmap/MapMaker;->toStackMap([Ljavassist/bytecode/stackmap/TypedBlock;)Ljavassist/bytecode/StackMapTable;

    move-result-object v5

    goto :goto_7

    .line 99
    .end local v1    # "blocks":[Ljavassist/bytecode/stackmap/TypedBlock;
    .end local v4    # "mm":Ljavassist/bytecode/stackmap/MapMaker;
    :catch_20
    move-exception v3

    .line 100
    .local v3, "e":Ljavassist/bytecode/stackmap/BasicBlock$JsrBytecode;
    goto :goto_7

    .line 110
    .end local v3    # "e":Ljavassist/bytecode/stackmap/BasicBlock$JsrBytecode;
    .restart local v1    # "blocks":[Ljavassist/bytecode/stackmap/TypedBlock;
    .restart local v4    # "mm":Ljavassist/bytecode/stackmap/MapMaker;
    :catch_22
    move-exception v0

    .line 111
    .local v0, "bb":Ljavassist/bytecode/BadBytecode;
    new-instance v5, Ljavassist/bytecode/BadBytecode;

    invoke-direct {v5, p1, v0}, Ljavassist/bytecode/BadBytecode;-><init>(Ljavassist/bytecode/MethodInfo;Ljava/lang/Throwable;)V

    throw v5
.end method

.method private make([BLjavassist/bytecode/stackmap/TypedBlock;)V
    .registers 11
    .param p1, "code"    # [B
    .param p2, "tb"    # Ljavassist/bytecode/stackmap/TypedBlock;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 178
    iget v5, p2, Ljavassist/bytecode/stackmap/TypedBlock;->stackTop:I

    iget-object v6, p2, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    iget-object v7, p0, Ljavassist/bytecode/stackmap/MapMaker;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    invoke-static {v5, v6, v7}, Ljavassist/bytecode/stackmap/MapMaker;->copyTypeData(I[Ljavassist/bytecode/stackmap/TypeData;[Ljavassist/bytecode/stackmap/TypeData;)V

    .line 179
    iget v5, p2, Ljavassist/bytecode/stackmap/TypedBlock;->stackTop:I

    iput v5, p0, Ljavassist/bytecode/stackmap/MapMaker;->stackTop:I

    .line 180
    iget-object v5, p2, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    array-length v5, v5

    iget-object v6, p2, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    iget-object v7, p0, Ljavassist/bytecode/stackmap/MapMaker;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    invoke-static {v5, v6, v7}, Ljavassist/bytecode/stackmap/MapMaker;->copyTypeData(I[Ljavassist/bytecode/stackmap/TypeData;[Ljavassist/bytecode/stackmap/TypeData;)V

    .line 182
    iget-object v5, p2, Ljavassist/bytecode/stackmap/TypedBlock;->toCatch:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    invoke-direct {p0, p1, v5}, Ljavassist/bytecode/stackmap/MapMaker;->traceException([BLjavassist/bytecode/stackmap/BasicBlock$Catch;)V

    .line 184
    iget v4, p2, Ljavassist/bytecode/stackmap/TypedBlock;->position:I

    .line 185
    .local v4, "pos":I
    iget v5, p2, Ljavassist/bytecode/stackmap/TypedBlock;->length:I

    add-int v1, v4, v5

    .line 186
    .local v1, "end":I
    :goto_22
    if-ge v4, v1, :cond_2a

    .line 187
    invoke-virtual {p0, v4, p1}, Ljavassist/bytecode/stackmap/MapMaker;->doOpcode(I[B)I

    move-result v5

    add-int/2addr v4, v5

    goto :goto_22

    .line 189
    :cond_2a
    iget-object v5, p2, Ljavassist/bytecode/stackmap/TypedBlock;->toCatch:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    invoke-direct {p0, p1, v5}, Ljavassist/bytecode/stackmap/MapMaker;->traceException([BLjavassist/bytecode/stackmap/BasicBlock$Catch;)V

    .line 191
    iget-object v5, p2, Ljavassist/bytecode/stackmap/TypedBlock;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    if-eqz v5, :cond_58

    .line 192
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_34
    iget-object v5, p2, Ljavassist/bytecode/stackmap/TypedBlock;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    array-length v5, v5

    if-ge v2, v5, :cond_58

    .line 193
    iget-object v5, p2, Ljavassist/bytecode/stackmap/TypedBlock;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    aget-object v0, v5, v2

    check-cast v0, Ljavassist/bytecode/stackmap/TypedBlock;

    .line 194
    .local v0, "e":Ljavassist/bytecode/stackmap/TypedBlock;
    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypedBlock;->alreadySet()Z

    move-result v5

    if-eqz v5, :cond_4c

    .line 195
    const/4 v5, 0x1

    invoke-direct {p0, v0, v5}, Ljavassist/bytecode/stackmap/MapMaker;->mergeMap(Ljavassist/bytecode/stackmap/TypedBlock;Z)V

    .line 192
    :goto_49
    add-int/lit8 v2, v2, 0x1

    goto :goto_34

    .line 197
    :cond_4c
    invoke-direct {p0, v0}, Ljavassist/bytecode/stackmap/MapMaker;->recordStackMap(Ljavassist/bytecode/stackmap/TypedBlock;)V

    .line 198
    new-instance v3, Ljavassist/bytecode/stackmap/MapMaker;

    invoke-direct {v3, p0}, Ljavassist/bytecode/stackmap/MapMaker;-><init>(Ljavassist/bytecode/stackmap/MapMaker;)V

    .line 199
    .local v3, "maker":Ljavassist/bytecode/stackmap/MapMaker;
    invoke-direct {v3, p1, v0}, Ljavassist/bytecode/stackmap/MapMaker;->make([BLjavassist/bytecode/stackmap/TypedBlock;)V

    goto :goto_49

    .line 203
    .end local v0    # "e":Ljavassist/bytecode/stackmap/TypedBlock;
    .end local v2    # "i":I
    .end local v3    # "maker":Ljavassist/bytecode/stackmap/MapMaker;
    :cond_58
    return-void
.end method

.method public static make2(Ljavassist/ClassPool;Ljavassist/bytecode/MethodInfo;)Ljavassist/bytecode/StackMap;
    .registers 9
    .param p0, "classes"    # Ljavassist/ClassPool;
    .param p1, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 125
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v2

    .line 126
    .local v2, "ca":Ljavassist/bytecode/CodeAttribute;
    if-nez v2, :cond_8

    .line 147
    :cond_7
    :goto_7
    return-object v5

    .line 131
    :cond_8
    const/4 v6, 0x1

    :try_start_9
    invoke-static {p1, v2, v6}, Ljavassist/bytecode/stackmap/TypedBlock;->makeBlocks(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/CodeAttribute;Z)[Ljavassist/bytecode/stackmap/TypedBlock;
    :try_end_c
    .catch Ljavassist/bytecode/stackmap/BasicBlock$JsrBytecode; {:try_start_9 .. :try_end_c} :catch_24

    move-result-object v1

    .line 137
    .local v1, "blocks":[Ljavassist/bytecode/stackmap/TypedBlock;
    if-eqz v1, :cond_7

    .line 140
    new-instance v4, Ljavassist/bytecode/stackmap/MapMaker;

    invoke-direct {v4, p0, p1, v2}, Ljavassist/bytecode/stackmap/MapMaker;-><init>(Ljavassist/ClassPool;Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/CodeAttribute;)V

    .line 142
    .local v4, "mm":Ljavassist/bytecode/stackmap/MapMaker;
    :try_start_14
    invoke-virtual {v2}, Ljavassist/bytecode/CodeAttribute;->getCode()[B

    move-result-object v5

    invoke-virtual {v4, v1, v5}, Ljavassist/bytecode/stackmap/MapMaker;->make([Ljavassist/bytecode/stackmap/TypedBlock;[B)V
    :try_end_1b
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_14 .. :try_end_1b} :catch_26

    .line 147
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Ljavassist/bytecode/stackmap/MapMaker;->toStackMap2(Ljavassist/bytecode/ConstPool;[Ljavassist/bytecode/stackmap/TypedBlock;)Ljavassist/bytecode/StackMap;

    move-result-object v5

    goto :goto_7

    .line 133
    .end local v1    # "blocks":[Ljavassist/bytecode/stackmap/TypedBlock;
    .end local v4    # "mm":Ljavassist/bytecode/stackmap/MapMaker;
    :catch_24
    move-exception v3

    .line 134
    .local v3, "e":Ljavassist/bytecode/stackmap/BasicBlock$JsrBytecode;
    goto :goto_7

    .line 144
    .end local v3    # "e":Ljavassist/bytecode/stackmap/BasicBlock$JsrBytecode;
    .restart local v1    # "blocks":[Ljavassist/bytecode/stackmap/TypedBlock;
    .restart local v4    # "mm":Ljavassist/bytecode/stackmap/MapMaker;
    :catch_26
    move-exception v0

    .line 145
    .local v0, "bb":Ljavassist/bytecode/BadBytecode;
    new-instance v5, Ljavassist/bytecode/BadBytecode;

    invoke-direct {v5, p1, v0}, Ljavassist/bytecode/BadBytecode;-><init>(Ljavassist/bytecode/MethodInfo;Ljava/lang/Throwable;)V

    throw v5
.end method

.method private merge(Ljavassist/bytecode/stackmap/TypeData;Ljavassist/bytecode/stackmap/TypeData;)Ljavassist/bytecode/stackmap/TypeData;
    .registers 5
    .param p1, "src"    # Ljavassist/bytecode/stackmap/TypeData;
    .param p2, "target"    # Ljavassist/bytecode/stackmap/TypeData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 242
    if-ne p1, p2, :cond_3

    .line 249
    :cond_2
    :goto_2
    return-object p2

    .line 244
    :cond_3
    instance-of v0, p2, Ljavassist/bytecode/stackmap/TypeData$ClassName;

    if-nez v0, :cond_2

    instance-of v0, p2, Ljavassist/bytecode/stackmap/TypeData$BasicType;

    if-nez v0, :cond_2

    .line 247
    instance-of v0, p2, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    if-eqz v0, :cond_16

    move-object v0, p2

    .line 248
    check-cast v0, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->merge(Ljavassist/bytecode/stackmap/TypeData;)V

    goto :goto_2

    .line 252
    :cond_16
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "fatal: this should never happen"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private mergeMap(Ljavassist/bytecode/stackmap/TypedBlock;Z)V
    .registers 8
    .param p1, "dest"    # Ljavassist/bytecode/stackmap/TypedBlock;
    .param p2, "mergeStack"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 229
    iget-object v2, p0, Ljavassist/bytecode/stackmap/MapMaker;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    array-length v1, v2

    .line 230
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, v1, :cond_1b

    .line 231
    iget-object v2, p1, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    iget-object v3, p0, Ljavassist/bytecode/stackmap/MapMaker;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    invoke-static {v3, v1, v0}, Ljavassist/bytecode/stackmap/MapMaker;->validateTypeData([Ljavassist/bytecode/stackmap/TypeData;II)Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v3

    iget-object v4, p1, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    aget-object v4, v4, v0

    invoke-direct {p0, v3, v4}, Ljavassist/bytecode/stackmap/MapMaker;->merge(Ljavassist/bytecode/stackmap/TypeData;Ljavassist/bytecode/stackmap/TypeData;)Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v3

    aput-object v3, v2, v0

    .line 230
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 234
    :cond_1b
    if-eqz p2, :cond_35

    .line 235
    iget v1, p0, Ljavassist/bytecode/stackmap/MapMaker;->stackTop:I

    .line 236
    const/4 v0, 0x0

    :goto_20
    if-ge v0, v1, :cond_35

    .line 237
    iget-object v2, p1, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    iget-object v3, p0, Ljavassist/bytecode/stackmap/MapMaker;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    aget-object v3, v3, v0

    iget-object v4, p1, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    aget-object v4, v4, v0

    invoke-direct {p0, v3, v4}, Ljavassist/bytecode/stackmap/MapMaker;->merge(Ljavassist/bytecode/stackmap/TypeData;Ljavassist/bytecode/stackmap/TypeData;)Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v3

    aput-object v3, v2, v0

    .line 236
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 239
    :cond_35
    return-void
.end method

.method private recordStackMap(Ljavassist/bytecode/stackmap/TypedBlock;)V
    .registers 5
    .param p1, "target"    # Ljavassist/bytecode/stackmap/TypedBlock;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 258
    iget-object v2, p0, Ljavassist/bytecode/stackmap/MapMaker;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    array-length v2, v2

    invoke-static {v2}, Ljavassist/bytecode/stackmap/TypeData;->make(I)[Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v1

    .line 259
    .local v1, "tStackTypes":[Ljavassist/bytecode/stackmap/TypeData;
    iget v0, p0, Ljavassist/bytecode/stackmap/MapMaker;->stackTop:I

    .line 260
    .local v0, "st":I
    iget-object v2, p0, Ljavassist/bytecode/stackmap/MapMaker;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    invoke-static {v0, v2, v1}, Ljavassist/bytecode/stackmap/MapMaker;->recordTypeData(I[Ljavassist/bytecode/stackmap/TypeData;[Ljavassist/bytecode/stackmap/TypeData;)I

    .line 261
    invoke-direct {p0, p1, v0, v1}, Ljavassist/bytecode/stackmap/MapMaker;->recordStackMap0(Ljavassist/bytecode/stackmap/TypedBlock;I[Ljavassist/bytecode/stackmap/TypeData;)V

    .line 262
    return-void
.end method

.method private recordStackMap(Ljavassist/bytecode/stackmap/TypedBlock;I)V
    .registers 6
    .param p1, "target"    # Ljavassist/bytecode/stackmap/TypedBlock;
    .param p2, "exceptionType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 267
    iget-object v1, p0, Ljavassist/bytecode/stackmap/MapMaker;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    array-length v1, v1

    invoke-static {v1}, Ljavassist/bytecode/stackmap/TypeData;->make(I)[Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v0

    .line 268
    .local v0, "tStackTypes":[Ljavassist/bytecode/stackmap/TypeData;
    const/4 v1, 0x0

    invoke-direct {p0, p2}, Ljavassist/bytecode/stackmap/MapMaker;->toExceptionType(I)Ljavassist/bytecode/stackmap/TypeData$ClassName;

    move-result-object v2

    invoke-virtual {v2}, Ljavassist/bytecode/stackmap/TypeData$ClassName;->join()Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v2

    aput-object v2, v0, v1

    .line 269
    const/4 v1, 0x1

    invoke-direct {p0, p1, v1, v0}, Ljavassist/bytecode/stackmap/MapMaker;->recordStackMap0(Ljavassist/bytecode/stackmap/TypedBlock;I[Ljavassist/bytecode/stackmap/TypeData;)V

    .line 270
    return-void
.end method

.method private recordStackMap0(Ljavassist/bytecode/stackmap/TypedBlock;I[Ljavassist/bytecode/stackmap/TypeData;)V
    .registers 8
    .param p1, "target"    # Ljavassist/bytecode/stackmap/TypedBlock;
    .param p2, "st"    # I
    .param p3, "tStackTypes"    # [Ljavassist/bytecode/stackmap/TypeData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 285
    iget-object v3, p0, Ljavassist/bytecode/stackmap/MapMaker;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    array-length v1, v3

    .line 286
    .local v1, "n":I
    invoke-static {v1}, Ljavassist/bytecode/stackmap/TypeData;->make(I)[Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v2

    .line 287
    .local v2, "tLocalsTypes":[Ljavassist/bytecode/stackmap/TypeData;
    iget-object v3, p0, Ljavassist/bytecode/stackmap/MapMaker;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    invoke-static {v1, v3, v2}, Ljavassist/bytecode/stackmap/MapMaker;->recordTypeData(I[Ljavassist/bytecode/stackmap/TypeData;[Ljavassist/bytecode/stackmap/TypeData;)I

    move-result v0

    .line 288
    .local v0, "k":I
    invoke-virtual {p1, p2, p3, v0, v2}, Ljavassist/bytecode/stackmap/TypedBlock;->setStackMap(I[Ljavassist/bytecode/stackmap/TypeData;I[Ljavassist/bytecode/stackmap/TypeData;)V

    .line 289
    return-void
.end method

.method protected static recordTypeData(I[Ljavassist/bytecode/stackmap/TypeData;[Ljavassist/bytecode/stackmap/TypeData;)I
    .registers 7
    .param p0, "n"    # I
    .param p1, "srcTypes"    # [Ljavassist/bytecode/stackmap/TypeData;
    .param p2, "destTypes"    # [Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 292
    const/4 v1, -0x1

    .line 293
    .local v1, "k":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-ge v0, p0, :cond_17

    .line 294
    invoke-static {p1, p0, v0}, Ljavassist/bytecode/stackmap/MapMaker;->validateTypeData([Ljavassist/bytecode/stackmap/TypeData;II)Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v2

    .line 295
    .local v2, "t":Ljavassist/bytecode/stackmap/TypeData;
    invoke-virtual {v2}, Ljavassist/bytecode/stackmap/TypeData;->join()Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v3

    aput-object v3, p2, v0

    .line 296
    sget-object v3, Ljavassist/bytecode/stackmap/MapMaker;->TOP:Ljavassist/bytecode/stackmap/TypeData;

    if-eq v2, v3, :cond_14

    .line 297
    add-int/lit8 v1, v0, 0x1

    .line 293
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 300
    .end local v2    # "t":Ljavassist/bytecode/stackmap/TypeData;
    :cond_17
    add-int/lit8 v3, v1, 0x1

    return v3
.end method

.method private static stackMapDiff(I[Ljavassist/bytecode/stackmap/TypeData;I[Ljavassist/bytecode/stackmap/TypeData;)I
    .registers 7
    .param p0, "oldTdLen"    # I
    .param p1, "oldTd"    # [Ljavassist/bytecode/stackmap/TypeData;
    .param p2, "newTdLen"    # I
    .param p3, "newTd"    # [Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 513
    sub-int v0, p2, p0

    .line 515
    .local v0, "diff":I
    if-lez v0, :cond_12

    .line 516
    move v1, p0

    .line 520
    .local v1, "len":I
    :goto_5
    invoke-static {p1, p3, v1}, Ljavassist/bytecode/stackmap/MapMaker;->stackMapEq([Ljavassist/bytecode/stackmap/TypeData;[Ljavassist/bytecode/stackmap/TypeData;I)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 521
    if-lez v0, :cond_14

    .line 522
    invoke-static {p3, v1, p2}, Ljavassist/bytecode/stackmap/MapMaker;->diffSize([Ljavassist/bytecode/stackmap/TypeData;II)I

    move-result v2

    .line 526
    :goto_11
    return v2

    .line 518
    .end local v1    # "len":I
    :cond_12
    move v1, p2

    .restart local v1    # "len":I
    goto :goto_5

    .line 524
    :cond_14
    invoke-static {p1, v1, p0}, Ljavassist/bytecode/stackmap/MapMaker;->diffSize([Ljavassist/bytecode/stackmap/TypeData;II)I

    move-result v2

    neg-int v2, v2

    goto :goto_11

    .line 526
    :cond_1a
    const/16 v2, -0x64

    goto :goto_11
.end method

.method private static stackMapEq([Ljavassist/bytecode/stackmap/TypeData;[Ljavassist/bytecode/stackmap/TypeData;I)Z
    .registers 6
    .param p0, "oldTd"    # [Ljavassist/bytecode/stackmap/TypeData;
    .param p1, "newTd"    # [Ljavassist/bytecode/stackmap/TypeData;
    .param p2, "len"    # I

    .prologue
    .line 530
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_12

    .line 531
    aget-object v1, p0, v0

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljavassist/bytecode/stackmap/TypeData;->eq(Ljavassist/bytecode/stackmap/TypeData;)Z

    move-result v1

    if-nez v1, :cond_f

    .line 532
    const/4 v1, 0x0

    .line 535
    :goto_e
    return v1

    .line 530
    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 535
    :cond_12
    const/4 v1, 0x1

    goto :goto_e
.end method

.method private toExceptionType(I)Ljavassist/bytecode/stackmap/TypeData$ClassName;
    .registers 4
    .param p1, "exceptionType"    # I

    .prologue
    .line 274
    if-nez p1, :cond_a

    .line 275
    const-string v0, "java.lang.Throwable"

    .line 279
    .local v0, "type":Ljava/lang/String;
    :goto_4
    new-instance v1, Ljavassist/bytecode/stackmap/TypeData$ClassName;

    invoke-direct {v1, v0}, Ljavassist/bytecode/stackmap/TypeData$ClassName;-><init>(Ljava/lang/String;)V

    return-object v1

    .line 277
    .end local v0    # "type":Ljava/lang/String;
    :cond_a
    iget-object v1, p0, Ljavassist/bytecode/stackmap/MapMaker;->cpool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "type":Ljava/lang/String;
    goto :goto_4
.end method

.method private toStackMapBody(Ljavassist/bytecode/StackMapTable$Writer;Ljavassist/bytecode/stackmap/TypedBlock;IILjavassist/bytecode/stackmap/TypedBlock;)V
    .registers 18
    .param p1, "writer"    # Ljavassist/bytecode/StackMapTable$Writer;
    .param p2, "bb"    # Ljavassist/bytecode/stackmap/TypedBlock;
    .param p3, "diffL"    # I
    .param p4, "offsetDelta"    # I
    .param p5, "prev"    # Ljavassist/bytecode/stackmap/TypedBlock;

    .prologue
    .line 452
    iget v8, p2, Ljavassist/bytecode/stackmap/TypedBlock;->stackTop:I

    .line 453
    .local v8, "stackTop":I
    if-nez v8, :cond_36

    .line 454
    if-nez p3, :cond_c

    .line 455
    move/from16 v0, p4

    invoke-virtual {p1, v0}, Ljavassist/bytecode/StackMapTable$Writer;->sameFrame(I)V

    .line 490
    :goto_b
    return-void

    .line 458
    :cond_c
    if-gez p3, :cond_18

    const/4 v1, -0x3

    if-lt p3, v1, :cond_18

    .line 459
    neg-int v1, p3

    move/from16 v0, p4

    invoke-virtual {p1, v0, v1}, Ljavassist/bytecode/StackMapTable$Writer;->chopFrame(II)V

    goto :goto_b

    .line 462
    :cond_18
    if-lez p3, :cond_70

    const/4 v1, 0x3

    if-gt p3, v1, :cond_70

    .line 463
    new-array v7, p3, [I

    .line 464
    .local v7, "data":[I
    iget v1, p2, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    move-object/from16 v0, p5

    iget v2, v0, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    sub-int/2addr v1, v2

    move-object/from16 v0, p5

    iget v2, v0, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    iget-object v11, p2, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    invoke-direct {p0, v1, v2, v7, v11}, Ljavassist/bytecode/stackmap/MapMaker;->fillStackMap(II[I[Ljavassist/bytecode/stackmap/TypeData;)[I

    move-result-object v9

    .line 467
    .local v9, "tags":[I
    move/from16 v0, p4

    invoke-virtual {p1, v0, v9, v7}, Ljavassist/bytecode/StackMapTable$Writer;->appendFrame(I[I[I)V

    goto :goto_b

    .line 471
    .end local v7    # "data":[I
    .end local v9    # "tags":[I
    :cond_36
    const/4 v1, 0x1

    if-ne v8, v1, :cond_50

    if-nez p3, :cond_50

    .line 472
    iget-object v1, p2, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    const/4 v2, 0x0

    aget-object v10, v1, v2

    .line 473
    .local v10, "td":Ljavassist/bytecode/stackmap/TypeData;
    invoke-virtual {v10}, Ljavassist/bytecode/stackmap/TypeData;->getTypeTag()I

    move-result v1

    iget-object v2, p0, Ljavassist/bytecode/stackmap/MapMaker;->cpool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v10, v2}, Ljavassist/bytecode/stackmap/TypeData;->getTypeData(Ljavassist/bytecode/ConstPool;)I

    move-result v2

    move/from16 v0, p4

    invoke-virtual {p1, v0, v1, v2}, Ljavassist/bytecode/StackMapTable$Writer;->sameLocals(III)V

    goto :goto_b

    .line 476
    .end local v10    # "td":Ljavassist/bytecode/stackmap/TypeData;
    :cond_50
    const/4 v1, 0x2

    if-ne v8, v1, :cond_70

    if-nez p3, :cond_70

    .line 477
    iget-object v1, p2, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    const/4 v2, 0x0

    aget-object v10, v1, v2

    .line 478
    .restart local v10    # "td":Ljavassist/bytecode/stackmap/TypeData;
    invoke-virtual {v10}, Ljavassist/bytecode/stackmap/TypeData;->is2WordType()Z

    move-result v1

    if-eqz v1, :cond_70

    .line 480
    invoke-virtual {v10}, Ljavassist/bytecode/stackmap/TypeData;->getTypeTag()I

    move-result v1

    iget-object v2, p0, Ljavassist/bytecode/stackmap/MapMaker;->cpool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v10, v2}, Ljavassist/bytecode/stackmap/TypeData;->getTypeData(Ljavassist/bytecode/ConstPool;)I

    move-result v2

    move/from16 v0, p4

    invoke-virtual {p1, v0, v1, v2}, Ljavassist/bytecode/StackMapTable$Writer;->sameLocals(III)V

    goto :goto_b

    .line 485
    .end local v10    # "td":Ljavassist/bytecode/stackmap/TypeData;
    :cond_70
    new-array v6, v8, [I

    .line 486
    .local v6, "sdata":[I
    const/4 v1, 0x0

    iget-object v2, p2, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    invoke-direct {p0, v8, v1, v6, v2}, Ljavassist/bytecode/stackmap/MapMaker;->fillStackMap(II[I[Ljavassist/bytecode/stackmap/TypeData;)[I

    move-result-object v5

    .line 487
    .local v5, "stags":[I
    iget v1, p2, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    new-array v4, v1, [I

    .line 488
    .local v4, "ldata":[I
    iget v1, p2, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    const/4 v2, 0x0

    iget-object v11, p2, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    invoke-direct {p0, v1, v2, v4, v11}, Ljavassist/bytecode/stackmap/MapMaker;->fillStackMap(II[I[Ljavassist/bytecode/stackmap/TypeData;)[I

    move-result-object v3

    .local v3, "ltags":[I
    move-object v1, p1

    move/from16 v2, p4

    .line 489
    invoke-virtual/range {v1 .. v6}, Ljavassist/bytecode/StackMapTable$Writer;->fullFrame(I[I[I[I[I)V

    goto/16 :goto_b
.end method

.method private traceException([BLjavassist/bytecode/stackmap/BasicBlock$Catch;)V
    .registers 9
    .param p1, "code"    # [B
    .param p2, "handler"    # Ljavassist/bytecode/stackmap/BasicBlock$Catch;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 208
    :goto_1
    if-eqz p2, :cond_53

    .line 209
    iget-object v1, p2, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->body:Ljavassist/bytecode/stackmap/BasicBlock;

    check-cast v1, Ljavassist/bytecode/stackmap/TypedBlock;

    .line 210
    .local v1, "tb":Ljavassist/bytecode/stackmap/TypedBlock;
    invoke-virtual {v1}, Ljavassist/bytecode/stackmap/TypedBlock;->alreadySet()Z

    move-result v2

    if-eqz v2, :cond_45

    .line 211
    invoke-direct {p0, v1, v5}, Ljavassist/bytecode/stackmap/MapMaker;->mergeMap(Ljavassist/bytecode/stackmap/TypedBlock;Z)V

    .line 212
    iget v2, v1, Ljavassist/bytecode/stackmap/TypedBlock;->stackTop:I

    const/4 v3, 0x1

    if-ge v2, v3, :cond_30

    .line 213
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bad catch clause: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p2, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->typeIndex:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2

    .line 215
    :cond_30
    iget-object v2, v1, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    iget v3, p2, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->typeIndex:I

    invoke-direct {p0, v3}, Ljavassist/bytecode/stackmap/MapMaker;->toExceptionType(I)Ljavassist/bytecode/stackmap/TypeData$ClassName;

    move-result-object v3

    iget-object v4, v1, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    aget-object v4, v4, v5

    invoke-direct {p0, v3, v4}, Ljavassist/bytecode/stackmap/MapMaker;->merge(Ljavassist/bytecode/stackmap/TypeData;Ljavassist/bytecode/stackmap/TypeData;)Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v3

    aput-object v3, v2, v5

    .line 224
    :goto_42
    iget-object p2, p2, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->next:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    .line 225
    goto :goto_1

    .line 219
    :cond_45
    iget v2, p2, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->typeIndex:I

    invoke-direct {p0, v1, v2}, Ljavassist/bytecode/stackmap/MapMaker;->recordStackMap(Ljavassist/bytecode/stackmap/TypedBlock;I)V

    .line 220
    new-instance v0, Ljavassist/bytecode/stackmap/MapMaker;

    invoke-direct {v0, p0}, Ljavassist/bytecode/stackmap/MapMaker;-><init>(Ljavassist/bytecode/stackmap/MapMaker;)V

    .line 221
    .local v0, "maker":Ljavassist/bytecode/stackmap/MapMaker;
    invoke-direct {v0, p1, v1}, Ljavassist/bytecode/stackmap/MapMaker;->make([BLjavassist/bytecode/stackmap/TypedBlock;)V

    goto :goto_42

    .line 226
    .end local v0    # "maker":Ljavassist/bytecode/stackmap/MapMaker;
    .end local v1    # "tb":Ljavassist/bytecode/stackmap/TypedBlock;
    :cond_53
    return-void
.end method

.method private static validateTypeData([Ljavassist/bytecode/stackmap/TypeData;II)Ljavassist/bytecode/stackmap/TypeData;
    .registers 6
    .param p0, "data"    # [Ljavassist/bytecode/stackmap/TypeData;
    .param p1, "length"    # I
    .param p2, "index"    # I

    .prologue
    .line 309
    aget-object v0, p0, p2

    .line 310
    .local v0, "td":Ljavassist/bytecode/stackmap/TypeData;
    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData;->is2WordType()Z

    move-result v1

    if-eqz v1, :cond_16

    add-int/lit8 v1, p2, 0x1

    if-ge v1, p1, :cond_16

    .line 311
    add-int/lit8 v1, p2, 0x1

    aget-object v1, p0, v1

    sget-object v2, Ljavassist/bytecode/stackmap/MapMaker;->TOP:Ljavassist/bytecode/stackmap/TypeData;

    if-eq v1, v2, :cond_16

    .line 312
    sget-object v0, Ljavassist/bytecode/stackmap/MapMaker;->TOP:Ljavassist/bytecode/stackmap/TypeData;

    .line 314
    .end local v0    # "td":Ljavassist/bytecode/stackmap/TypeData;
    :cond_16
    return-object v0
.end method

.method private writeStackFrame(Ljavassist/bytecode/StackMap$Writer;Ljavassist/bytecode/ConstPool;ILjavassist/bytecode/stackmap/TypedBlock;)V
    .registers 7
    .param p1, "writer"    # Ljavassist/bytecode/StackMap$Writer;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p3, "offset"    # I
    .param p4, "tb"    # Ljavassist/bytecode/stackmap/TypedBlock;

    .prologue
    .line 583
    invoke-virtual {p1, p3}, Ljavassist/bytecode/StackMap$Writer;->write16bit(I)V

    .line 584
    iget-object v0, p4, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    iget v1, p4, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    invoke-direct {p0, p1, p2, v0, v1}, Ljavassist/bytecode/stackmap/MapMaker;->writeVerifyTypeInfo(Ljavassist/bytecode/StackMap$Writer;Ljavassist/bytecode/ConstPool;[Ljavassist/bytecode/stackmap/TypeData;I)V

    .line 585
    iget-object v0, p4, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    iget v1, p4, Ljavassist/bytecode/stackmap/TypedBlock;->stackTop:I

    invoke-direct {p0, p1, p2, v0, v1}, Ljavassist/bytecode/stackmap/MapMaker;->writeVerifyTypeInfo(Ljavassist/bytecode/StackMap$Writer;Ljavassist/bytecode/ConstPool;[Ljavassist/bytecode/stackmap/TypeData;I)V

    .line 586
    return-void
.end method

.method private writeVerifyTypeInfo(Ljavassist/bytecode/StackMap$Writer;Ljavassist/bytecode/ConstPool;[Ljavassist/bytecode/stackmap/TypeData;I)V
    .registers 10
    .param p1, "writer"    # Ljavassist/bytecode/StackMap$Writer;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p3, "types"    # [Ljavassist/bytecode/stackmap/TypeData;
    .param p4, "num"    # I

    .prologue
    .line 589
    const/4 v1, 0x0

    .line 590
    .local v1, "numDWord":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-ge v0, p4, :cond_15

    .line 591
    aget-object v2, p3, v0

    .line 592
    .local v2, "td":Ljavassist/bytecode/stackmap/TypeData;
    if-eqz v2, :cond_12

    invoke-virtual {v2}, Ljavassist/bytecode/stackmap/TypeData;->is2WordType()Z

    move-result v3

    if-eqz v3, :cond_12

    .line 593
    add-int/lit8 v1, v1, 0x1

    .line 594
    add-int/lit8 v0, v0, 0x1

    .line 590
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 598
    .end local v2    # "td":Ljavassist/bytecode/stackmap/TypeData;
    :cond_15
    sub-int v3, p4, v1

    invoke-virtual {p1, v3}, Ljavassist/bytecode/StackMap$Writer;->write16bit(I)V

    .line 599
    const/4 v0, 0x0

    :goto_1b
    if-ge v0, p4, :cond_35

    .line 600
    aget-object v2, p3, v0

    .line 601
    .restart local v2    # "td":Ljavassist/bytecode/stackmap/TypeData;
    invoke-virtual {v2}, Ljavassist/bytecode/stackmap/TypeData;->getTypeTag()I

    move-result v3

    invoke-virtual {v2, p2}, Ljavassist/bytecode/stackmap/TypeData;->getTypeData(Ljavassist/bytecode/ConstPool;)I

    move-result v4

    invoke-virtual {p1, v3, v4}, Ljavassist/bytecode/StackMap$Writer;->writeVerifyTypeInfo(II)V

    .line 602
    invoke-virtual {v2}, Ljavassist/bytecode/stackmap/TypeData;->is2WordType()Z

    move-result v3

    if-eqz v3, :cond_32

    .line 603
    add-int/lit8 v0, v0, 0x1

    .line 599
    :cond_32
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 605
    .end local v2    # "td":Ljavassist/bytecode/stackmap/TypeData;
    :cond_35
    return-void
.end method


# virtual methods
.method make([Ljavassist/bytecode/stackmap/TypedBlock;[B)V
    .registers 6
    .param p1, "blocks"    # [Ljavassist/bytecode/stackmap/TypedBlock;
    .param p2, "code"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 164
    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-direct {p0, p2, v1}, Ljavassist/bytecode/stackmap/MapMaker;->make([BLjavassist/bytecode/stackmap/TypedBlock;)V

    .line 165
    invoke-direct {p0, p2, p1}, Ljavassist/bytecode/stackmap/MapMaker;->findDeadCatchers([B[Ljavassist/bytecode/stackmap/TypedBlock;)V

    .line 167
    :try_start_9
    invoke-direct {p0, p2, p1}, Ljavassist/bytecode/stackmap/MapMaker;->fixTypes([B[Ljavassist/bytecode/stackmap/TypedBlock;)V
    :try_end_c
    .catch Ljavassist/NotFoundException; {:try_start_9 .. :try_end_c} :catch_d

    .line 171
    return-void

    .line 168
    :catch_d
    move-exception v0

    .line 169
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljavassist/bytecode/BadBytecode;

    const-string v2, "failed to resolve types"

    invoke-direct {v1, v2, v0}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public toStackMap([Ljavassist/bytecode/stackmap/TypedBlock;)Ljavassist/bytecode/StackMapTable;
    .registers 13
    .param p1, "blocks"    # [Ljavassist/bytecode/stackmap/TypedBlock;

    .prologue
    const/4 v8, 0x0

    .line 402
    new-instance v1, Ljavassist/bytecode/StackMapTable$Writer;

    const/16 v0, 0x20

    invoke-direct {v1, v0}, Ljavassist/bytecode/StackMapTable$Writer;-><init>(I)V

    .line 403
    .local v1, "writer":Ljavassist/bytecode/StackMapTable$Writer;
    array-length v7, p1

    .line 404
    .local v7, "n":I
    aget-object v5, p1, v8

    .line 405
    .local v5, "prev":Ljavassist/bytecode/stackmap/TypedBlock;
    iget v4, v5, Ljavassist/bytecode/stackmap/TypedBlock;->length:I

    .line 406
    .local v4, "offsetDelta":I
    iget v0, v5, Ljavassist/bytecode/stackmap/TypedBlock;->incoming:I

    if-lez v0, :cond_16

    .line 407
    invoke-virtual {v1, v8}, Ljavassist/bytecode/StackMapTable$Writer;->sameFrame(I)V

    .line 408
    add-int/lit8 v4, v4, -0x1

    .line 411
    :cond_16
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_17
    if-ge v6, v7, :cond_51

    .line 412
    aget-object v2, p1, v6

    .line 413
    .local v2, "bb":Ljavassist/bytecode/stackmap/TypedBlock;
    add-int/lit8 v0, v6, -0x1

    aget-object v0, p1, v0

    invoke-direct {p0, v2, v0}, Ljavassist/bytecode/stackmap/MapMaker;->isTarget(Ljavassist/bytecode/stackmap/TypedBlock;Ljavassist/bytecode/stackmap/TypedBlock;)Z

    move-result v0

    if-eqz v0, :cond_40

    .line 414
    invoke-virtual {v2}, Ljavassist/bytecode/stackmap/TypedBlock;->resetNumLocals()V

    .line 415
    iget v0, v5, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    iget-object v8, v5, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    iget v9, v2, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    iget-object v10, v2, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    invoke-static {v0, v8, v9, v10}, Ljavassist/bytecode/stackmap/MapMaker;->stackMapDiff(I[Ljavassist/bytecode/stackmap/TypeData;I[Ljavassist/bytecode/stackmap/TypeData;)I

    move-result v3

    .local v3, "diffL":I
    move-object v0, p0

    .line 417
    invoke-direct/range {v0 .. v5}, Ljavassist/bytecode/stackmap/MapMaker;->toStackMapBody(Ljavassist/bytecode/StackMapTable$Writer;Ljavassist/bytecode/stackmap/TypedBlock;IILjavassist/bytecode/stackmap/TypedBlock;)V

    .line 418
    iget v0, v2, Ljavassist/bytecode/stackmap/TypedBlock;->length:I

    add-int/lit8 v4, v0, -0x1

    .line 419
    move-object v5, v2

    .line 411
    .end local v3    # "diffL":I
    :goto_3d
    add-int/lit8 v6, v6, 0x1

    goto :goto_17

    .line 421
    :cond_40
    iget v0, v2, Ljavassist/bytecode/stackmap/TypedBlock;->incoming:I

    if-nez v0, :cond_4d

    .line 423
    invoke-virtual {v1, v4}, Ljavassist/bytecode/StackMapTable$Writer;->sameFrame(I)V

    .line 424
    iget v0, v2, Ljavassist/bytecode/stackmap/TypedBlock;->length:I

    add-int/lit8 v4, v0, -0x1

    .line 425
    move-object v5, v2

    goto :goto_3d

    .line 428
    :cond_4d
    iget v0, v2, Ljavassist/bytecode/stackmap/TypedBlock;->length:I

    add-int/2addr v4, v0

    goto :goto_3d

    .line 431
    .end local v2    # "bb":Ljavassist/bytecode/stackmap/TypedBlock;
    :cond_51
    iget-object v0, p0, Ljavassist/bytecode/stackmap/MapMaker;->cpool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, v0}, Ljavassist/bytecode/StackMapTable$Writer;->toStackMapTable(Ljavassist/bytecode/ConstPool;)Ljavassist/bytecode/StackMapTable;

    move-result-object v0

    return-object v0
.end method

.method public toStackMap2(Ljavassist/bytecode/ConstPool;[Ljavassist/bytecode/stackmap/TypedBlock;)Ljavassist/bytecode/StackMap;
    .registers 13
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "blocks"    # [Ljavassist/bytecode/stackmap/TypedBlock;

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 553
    new-instance v6, Ljavassist/bytecode/StackMap$Writer;

    invoke-direct {v6}, Ljavassist/bytecode/StackMap$Writer;-><init>()V

    .line 554
    .local v6, "writer":Ljavassist/bytecode/StackMap$Writer;
    array-length v3, p2

    .line 555
    .local v3, "n":I
    new-array v1, v3, [Z

    .line 556
    .local v1, "effective":[Z
    aget-object v5, p2, v9

    .line 559
    .local v5, "prev":Ljavassist/bytecode/stackmap/TypedBlock;
    iget v7, v5, Ljavassist/bytecode/stackmap/TypedBlock;->incoming:I

    if-lez v7, :cond_32

    move v7, v8

    :goto_11
    aput-boolean v7, v1, v9

    .line 561
    aget-boolean v7, v1, v9

    if-eqz v7, :cond_34

    move v4, v8

    .line 562
    .local v4, "num":I
    :goto_18
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_19
    if-ge v2, v3, :cond_36

    .line 563
    aget-object v0, p2, v2

    .line 564
    .local v0, "bb":Ljavassist/bytecode/stackmap/TypedBlock;
    add-int/lit8 v7, v2, -0x1

    aget-object v7, p2, v7

    invoke-direct {p0, v0, v7}, Ljavassist/bytecode/stackmap/MapMaker;->isTarget(Ljavassist/bytecode/stackmap/TypedBlock;Ljavassist/bytecode/stackmap/TypedBlock;)Z

    move-result v7

    aput-boolean v7, v1, v2

    if-eqz v7, :cond_2f

    .line 565
    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypedBlock;->resetNumLocals()V

    .line 566
    move-object v5, v0

    .line 567
    add-int/lit8 v4, v4, 0x1

    .line 562
    :cond_2f
    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    .end local v0    # "bb":Ljavassist/bytecode/stackmap/TypedBlock;
    .end local v2    # "i":I
    .end local v4    # "num":I
    :cond_32
    move v7, v9

    .line 559
    goto :goto_11

    :cond_34
    move v4, v9

    .line 561
    goto :goto_18

    .line 571
    .restart local v2    # "i":I
    .restart local v4    # "num":I
    :cond_36
    if-nez v4, :cond_3a

    .line 572
    const/4 v7, 0x0

    .line 579
    :goto_39
    return-object v7

    .line 574
    :cond_3a
    invoke-virtual {v6, v4}, Ljavassist/bytecode/StackMap$Writer;->write16bit(I)V

    .line 575
    const/4 v2, 0x0

    :goto_3e
    if-ge v2, v3, :cond_50

    .line 576
    aget-boolean v7, v1, v2

    if-eqz v7, :cond_4d

    .line 577
    aget-object v7, p2, v2

    iget v7, v7, Ljavassist/bytecode/stackmap/TypedBlock;->position:I

    aget-object v8, p2, v2

    invoke-direct {p0, v6, p1, v7, v8}, Ljavassist/bytecode/stackmap/MapMaker;->writeStackFrame(Ljavassist/bytecode/StackMap$Writer;Ljavassist/bytecode/ConstPool;ILjavassist/bytecode/stackmap/TypedBlock;)V

    .line 575
    :cond_4d
    add-int/lit8 v2, v2, 0x1

    goto :goto_3e

    .line 579
    :cond_50
    invoke-virtual {v6, p1}, Ljavassist/bytecode/StackMap$Writer;->toStackMap(Ljavassist/bytecode/ConstPool;)Ljavassist/bytecode/StackMap;

    move-result-object v7

    goto :goto_39
.end method
