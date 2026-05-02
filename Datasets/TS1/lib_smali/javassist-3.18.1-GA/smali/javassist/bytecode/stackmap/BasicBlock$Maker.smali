.class public Ljavassist/bytecode/stackmap/BasicBlock$Maker;
.super Ljava/lang/Object;
.source "BasicBlock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/BasicBlock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Maker"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private addCatchers([Ljavassist/bytecode/stackmap/BasicBlock;Ljavassist/bytecode/ExceptionTable;)V
    .registers 13
    .param p1, "blocks"    # [Ljavassist/bytecode/stackmap/BasicBlock;
    .param p2, "et"    # Ljavassist/bytecode/ExceptionTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 389
    if-nez p2, :cond_3

    .line 408
    :cond_2
    return-void

    .line 392
    :cond_3
    invoke-virtual {p2}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v3

    .line 393
    .local v3, "i":I
    :cond_7
    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_2

    .line 394
    invoke-virtual {p2, v3}, Ljavassist/bytecode/ExceptionTable;->handlerPc(I)I

    move-result v8

    invoke-static {p1, v8}, Ljavassist/bytecode/stackmap/BasicBlock;->find([Ljavassist/bytecode/stackmap/BasicBlock;I)Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v2

    .line 395
    .local v2, "handler":Ljavassist/bytecode/stackmap/BasicBlock;
    invoke-virtual {p2, v3}, Ljavassist/bytecode/ExceptionTable;->startPc(I)I

    move-result v6

    .line 396
    .local v6, "start":I
    invoke-virtual {p2, v3}, Ljavassist/bytecode/ExceptionTable;->endPc(I)I

    move-result v1

    .line 397
    .local v1, "end":I
    invoke-virtual {p2, v3}, Ljavassist/bytecode/ExceptionTable;->catchType(I)I

    move-result v7

    .line 398
    .local v7, "type":I
    iget v8, v2, Ljavassist/bytecode/stackmap/BasicBlock;->incoming:I

    add-int/lit8 v8, v8, -0x1

    iput v8, v2, Ljavassist/bytecode/stackmap/BasicBlock;->incoming:I

    .line 399
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_26
    array-length v8, p1

    if-ge v5, v8, :cond_7

    .line 400
    aget-object v0, p1, v5

    .line 401
    .local v0, "bb":Ljavassist/bytecode/stackmap/BasicBlock;
    iget v4, v0, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    .line 402
    .local v4, "iPos":I
    if-gt v6, v4, :cond_40

    if-ge v4, v1, :cond_40

    .line 403
    new-instance v8, Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    iget-object v9, v0, Ljavassist/bytecode/stackmap/BasicBlock;->toCatch:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    invoke-direct {v8, v2, v7, v9}, Ljavassist/bytecode/stackmap/BasicBlock$Catch;-><init>(Ljavassist/bytecode/stackmap/BasicBlock;ILjavassist/bytecode/stackmap/BasicBlock$Catch;)V

    iput-object v8, v0, Ljavassist/bytecode/stackmap/BasicBlock;->toCatch:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    .line 404
    iget v8, v2, Ljavassist/bytecode/stackmap/BasicBlock;->incoming:I

    add-int/lit8 v8, v8, 0x1

    iput v8, v2, Ljavassist/bytecode/stackmap/BasicBlock;->incoming:I

    .line 399
    :cond_40
    add-int/lit8 v5, v5, 0x1

    goto :goto_26
.end method

.method private static getBBlock(Ljavassist/bytecode/stackmap/BasicBlock$Mark;)Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 3
    .param p0, "m"    # Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    .prologue
    .line 376
    iget-object v0, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    .line 377
    .local v0, "b":Ljavassist/bytecode/stackmap/BasicBlock;
    if-eqz v0, :cond_14

    iget v1, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->size:I

    if-lez v1, :cond_14

    .line 378
    iget-object v1, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->jump:[Ljavassist/bytecode/stackmap/BasicBlock;

    iput-object v1, v0, Ljavassist/bytecode/stackmap/BasicBlock;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    .line 379
    iget v1, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->size:I

    iput v1, v0, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    .line 380
    iget-boolean v1, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->alwaysJmp:Z

    iput-boolean v1, v0, Ljavassist/bytecode/stackmap/BasicBlock;->stop:Z

    .line 383
    :cond_14
    return-object v0
.end method

.method private makeArray(Ljavassist/bytecode/stackmap/BasicBlock;)[Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 4
    .param p1, "b"    # Ljavassist/bytecode/stackmap/BasicBlock;

    .prologue
    .line 150
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeArray(I)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v0

    .line 151
    .local v0, "array":[Ljavassist/bytecode/stackmap/BasicBlock;
    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 152
    return-object v0
.end method

.method private makeArray(Ljavassist/bytecode/stackmap/BasicBlock;Ljavassist/bytecode/stackmap/BasicBlock;)[Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 5
    .param p1, "b1"    # Ljavassist/bytecode/stackmap/BasicBlock;
    .param p2, "b2"    # Ljavassist/bytecode/stackmap/BasicBlock;

    .prologue
    .line 156
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeArray(I)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v0

    .line 157
    .local v0, "array":[Ljavassist/bytecode/stackmap/BasicBlock;
    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 158
    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 159
    return-object v0
.end method

.method private makeBlocks(Ljava/util/HashMap;)[Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 12
    .param p1, "markTable"    # Ljava/util/HashMap;

    .prologue
    const/4 v9, 0x0

    .line 320
    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result v8

    new-array v8, v8, [Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    invoke-interface {v7, v8}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    move-object v5, v7

    check-cast v5, [Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    .line 322
    .local v5, "marks":[Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    invoke-static {v5}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 323
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 324
    .local v1, "blocks":Ljava/util/ArrayList;
    const/4 v2, 0x0

    .line 326
    .local v2, "i":I
    array-length v7, v5

    if-lez v7, :cond_69

    aget-object v7, v5, v9

    iget v7, v7, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->position:I

    if-nez v7, :cond_69

    aget-object v7, v5, v9

    iget-object v7, v7, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    if-eqz v7, :cond_69

    .line 327
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    aget-object v7, v5, v2

    invoke-static {v7}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->getBBlock(Ljavassist/bytecode/stackmap/BasicBlock$Mark;)Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v6

    .local v6, "prev":Ljavassist/bytecode/stackmap/BasicBlock;
    move v2, v3

    .line 331
    .end local v3    # "i":I
    .restart local v2    # "i":I
    :goto_35
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 332
    :goto_38
    array-length v7, v5

    if-ge v2, v7, :cond_ad

    .line 333
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    aget-object v4, v5, v2

    .line 334
    .local v4, "m":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    invoke-static {v4}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->getBBlock(Ljavassist/bytecode/stackmap/BasicBlock$Mark;)Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v0

    .line 335
    .local v0, "bb":Ljavassist/bytecode/stackmap/BasicBlock;
    if-nez v0, :cond_6e

    .line 337
    iget v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    if-lez v7, :cond_55

    .line 339
    iget v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    iget v8, v6, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    add-int/2addr v7, v8

    invoke-virtual {p0, v7}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeBlock(I)Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v6

    .line 340
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 343
    :cond_55
    iget v7, v4, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->position:I

    iget v8, v4, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->size:I

    add-int/2addr v7, v8

    iget v8, v6, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    sub-int/2addr v7, v8

    iput v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    .line 344
    iget-object v7, v4, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->jump:[Ljavassist/bytecode/stackmap/BasicBlock;

    iput-object v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    .line 345
    iget-boolean v7, v4, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->alwaysJmp:Z

    iput-boolean v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->stop:Z

    :goto_67
    move v2, v3

    .line 370
    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_38

    .line 329
    .end local v0    # "bb":Ljavassist/bytecode/stackmap/BasicBlock;
    .end local v4    # "m":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    .end local v6    # "prev":Ljavassist/bytecode/stackmap/BasicBlock;
    :cond_69
    invoke-virtual {p0, v9}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeBlock(I)Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v6

    .restart local v6    # "prev":Ljavassist/bytecode/stackmap/BasicBlock;
    goto :goto_35

    .line 349
    .end local v2    # "i":I
    .restart local v0    # "bb":Ljavassist/bytecode/stackmap/BasicBlock;
    .restart local v3    # "i":I
    .restart local v4    # "m":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    :cond_6e
    iget v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    if-nez v7, :cond_8a

    .line 350
    iget v7, v4, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->position:I

    iget v8, v6, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    sub-int/2addr v7, v8

    iput v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    .line 351
    iget v7, v0, Ljavassist/bytecode/stackmap/BasicBlock;->incoming:I

    add-int/lit8 v7, v7, 0x1

    iput v7, v0, Ljavassist/bytecode/stackmap/BasicBlock;->incoming:I

    .line 352
    invoke-direct {p0, v0}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeArray(Ljavassist/bytecode/stackmap/BasicBlock;)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v7

    iput-object v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    .line 367
    :cond_85
    :goto_85
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 368
    move-object v6, v0

    goto :goto_67

    .line 356
    :cond_8a
    iget v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    iget v8, v6, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    add-int/2addr v7, v8

    iget v8, v4, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->position:I

    if-ge v7, v8, :cond_85

    .line 358
    iget v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    iget v8, v6, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    add-int/2addr v7, v8

    invoke-virtual {p0, v7}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeBlock(I)Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v6

    .line 359
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 360
    iget v7, v4, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->position:I

    iget v8, v6, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    sub-int/2addr v7, v8

    iput v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    .line 363
    invoke-direct {p0, v0}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeArray(Ljavassist/bytecode/stackmap/BasicBlock;)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v7

    iput-object v7, v6, Ljavassist/bytecode/stackmap/BasicBlock;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    goto :goto_85

    .line 372
    .end local v0    # "bb":Ljavassist/bytecode/stackmap/BasicBlock;
    .end local v3    # "i":I
    .end local v4    # "m":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    .restart local v2    # "i":I
    :cond_ad
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {p0, v7}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeArray(I)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljavassist/bytecode/stackmap/BasicBlock;

    check-cast v7, [Ljavassist/bytecode/stackmap/BasicBlock;

    return-object v7
.end method

.method private makeGoto(Ljava/util/HashMap;III)V
    .registers 12
    .param p1, "marks"    # Ljava/util/HashMap;
    .param p2, "pos"    # I
    .param p3, "target"    # I
    .param p4, "size"    # I

    .prologue
    .line 300
    invoke-direct {p0, p1, p3}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    move-result-object v6

    .line 301
    .local v6, "to":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    iget-object v0, v6, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    invoke-direct {p0, v0}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeArray(Ljavassist/bytecode/stackmap/BasicBlock;)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v3

    .line 302
    .local v3, "jumps":[Ljavassist/bytecode/stackmap/BasicBlock;
    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p4

    invoke-direct/range {v0 .. v5}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I[Ljavassist/bytecode/stackmap/BasicBlock;IZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    .line 303
    return-void
.end method

.method private makeMark(Ljava/util/HashMap;I)Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    .registers 4
    .param p1, "table"    # Ljava/util/HashMap;
    .param p2, "pos"    # I

    .prologue
    const/4 v0, 0x1

    .line 184
    invoke-direct {p0, p1, p2, v0, v0}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark0(Ljava/util/HashMap;IZZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    move-result-object v0

    return-object v0
.end method

.method private makeMark(Ljava/util/HashMap;I[Ljavassist/bytecode/stackmap/BasicBlock;IZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    .registers 8
    .param p1, "table"    # Ljava/util/HashMap;
    .param p2, "pos"    # I
    .param p3, "jump"    # [Ljavassist/bytecode/stackmap/BasicBlock;
    .param p4, "size"    # I
    .param p5, "always"    # Z

    .prologue
    const/4 v1, 0x0

    .line 192
    invoke-direct {p0, p1, p2, v1, v1}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark0(Ljava/util/HashMap;IZZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    move-result-object v0

    .line 193
    .local v0, "m":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    invoke-virtual {v0, p3, p4, p5}, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->setJump([Ljavassist/bytecode/stackmap/BasicBlock;IZ)V

    .line 194
    return-object v0
.end method

.method private makeMark0(Ljava/util/HashMap;IZZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    .registers 9
    .param p1, "table"    # Ljava/util/HashMap;
    .param p2, "pos"    # I
    .param p3, "isBlockBegin"    # Z
    .param p4, "isTarget"    # Z

    .prologue
    .line 199
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p2}, Ljava/lang/Integer;-><init>(I)V

    .line 200
    .local v1, "p":Ljava/lang/Integer;
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    .line 201
    .local v0, "m":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    if-nez v0, :cond_15

    .line 202
    new-instance v0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    .end local v0    # "m":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    invoke-direct {v0, p2}, Ljavassist/bytecode/stackmap/BasicBlock$Mark;-><init>(I)V

    .line 203
    .restart local v0    # "m":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    :cond_15
    if-eqz p3, :cond_2b

    .line 207
    iget-object v2, v0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    if-nez v2, :cond_21

    .line 208
    invoke-virtual {p0, p2}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeBlock(I)Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v2

    iput-object v2, v0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    .line 210
    :cond_21
    if-eqz p4, :cond_2b

    .line 211
    iget-object v2, v0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    iget v3, v2, Ljavassist/bytecode/stackmap/BasicBlock;->incoming:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Ljavassist/bytecode/stackmap/BasicBlock;->incoming:I

    .line 214
    :cond_2b
    return-object v0
.end method

.method private makeMarks(Ljavassist/bytecode/CodeIterator;IILjavassist/bytecode/ExceptionTable;)Ljava/util/HashMap;
    .registers 28
    .param p1, "ci"    # Ljavassist/bytecode/CodeIterator;
    .param p2, "begin"    # I
    .param p3, "end"    # I
    .param p4, "et"    # Ljavassist/bytecode/ExceptionTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 221
    invoke-virtual/range {p1 .. p1}, Ljavassist/bytecode/CodeIterator;->begin()V

    .line 222
    invoke-virtual/range {p1 .. p2}, Ljavassist/bytecode/CodeIterator;->move(I)V

    .line 223
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 224
    .local v3, "marks":Ljava/util/HashMap;
    :cond_b
    :goto_b
    invoke-virtual/range {p1 .. p1}, Ljavassist/bytecode/CodeIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 225
    invoke-virtual/range {p1 .. p1}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v4

    .line 226
    .local v4, "index":I
    move/from16 v0, p3

    if-lt v4, v0, :cond_3c

    .line 288
    .end local v4    # "index":I
    :cond_19
    if-eqz p4, :cond_1ee

    .line 289
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v13

    .line 290
    .local v13, "i":I
    :goto_1f
    add-int/lit8 v13, v13, -0x1

    if-ltz v13, :cond_1ee

    .line 291
    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljavassist/bytecode/ExceptionTable;->startPc(I)I

    move-result v2

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v2, v6, v7}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark0(Ljava/util/HashMap;IZZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    .line 292
    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljavassist/bytecode/ExceptionTable;->handlerPc(I)I

    move-result v2

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v2}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    goto :goto_1f

    .line 229
    .end local v13    # "i":I
    .restart local v4    # "index":I
    :cond_3c
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v20

    .line 230
    .local v20, "op":I
    const/16 v2, 0x99

    move/from16 v0, v20

    if-gt v2, v0, :cond_4e

    const/16 v2, 0xa6

    move/from16 v0, v20

    if-le v0, v2, :cond_5a

    :cond_4e
    const/16 v2, 0xc6

    move/from16 v0, v20

    if-eq v0, v2, :cond_5a

    const/16 v2, 0xc7

    move/from16 v0, v20

    if-ne v0, v2, :cond_85

    .line 232
    :cond_5a
    add-int/lit8 v2, v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljavassist/bytecode/CodeIterator;->s16bitAt(I)I

    move-result v2

    add-int/2addr v2, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v2}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    move-result-object v5

    .line 233
    .local v5, "to":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    add-int/lit8 v2, v4, 0x3

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v2}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    move-result-object v19

    .line 234
    .local v19, "next":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    iget-object v2, v5, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    move-object/from16 v0, v19

    iget-object v6, v0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v6}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeArray(Ljavassist/bytecode/stackmap/BasicBlock;Ljavassist/bytecode/stackmap/BasicBlock;)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v5

    .end local v5    # "to":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    const/4 v6, 0x3

    const/4 v7, 0x0

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I[Ljavassist/bytecode/stackmap/BasicBlock;IZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    goto :goto_b

    .line 236
    .end local v19    # "next":Ljavassist/bytecode/stackmap/BasicBlock$Mark;
    :cond_85
    const/16 v2, 0xa7

    move/from16 v0, v20

    if-gt v2, v0, :cond_184

    const/16 v2, 0xab

    move/from16 v0, v20

    if-gt v0, v2, :cond_184

    .line 237
    packed-switch v20, :pswitch_data_1f0

    goto/16 :goto_b

    .line 239
    :pswitch_96
    add-int/lit8 v2, v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljavassist/bytecode/CodeIterator;->s16bitAt(I)I

    move-result v2

    add-int/2addr v2, v4

    const/4 v6, 0x3

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4, v2, v6}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeGoto(Ljava/util/HashMap;III)V

    goto/16 :goto_b

    .line 242
    :pswitch_a7
    add-int/lit8 v2, v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljavassist/bytecode/CodeIterator;->s16bitAt(I)I

    move-result v2

    add-int/2addr v2, v4

    const/4 v6, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4, v2, v6}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeJsr(Ljava/util/HashMap;III)V

    goto/16 :goto_b

    .line 245
    :pswitch_b8
    const/4 v5, 0x0

    const/4 v6, 0x2

    const/4 v7, 0x1

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I[Ljavassist/bytecode/stackmap/BasicBlock;IZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    goto/16 :goto_b

    .line 248
    :pswitch_c2
    and-int/lit8 v2, v4, -0x4

    add-int/lit8 v22, v2, 0x4

    .line 249
    .local v22, "pos":I
    add-int/lit8 v2, v22, 0x4

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v16

    .line 250
    .local v16, "low":I
    add-int/lit8 v2, v22, 0x8

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v12

    .line 251
    .local v12, "high":I
    sub-int v2, v12, v16

    add-int/lit8 v18, v2, 0x1

    .line 252
    .local v18, "ncases":I
    add-int/lit8 v2, v18, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeArray(I)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v5

    .line 253
    .local v5, "to":[Ljavassist/bytecode/stackmap/BasicBlock;
    const/4 v2, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v6

    add-int/2addr v6, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v6}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    move-result-object v6

    iget-object v6, v6, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    aput-object v6, v5, v2

    .line 254
    add-int/lit8 v21, v22, 0xc

    .line 255
    .local v21, "p":I
    mul-int/lit8 v2, v18, 0x4

    add-int v17, v21, v2

    .line 256
    .local v17, "n":I
    const/4 v14, 0x1

    .local v14, "k":I
    move v15, v14

    .line 257
    .end local v14    # "k":I
    .local v15, "k":I
    :goto_fe
    move/from16 v0, v21

    move/from16 v1, v17

    if-ge v0, v1, :cond_11d

    .line 258
    add-int/lit8 v14, v15, 0x1

    .end local v15    # "k":I
    .restart local v14    # "k":I
    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v2

    add-int/2addr v2, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v2}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    move-result-object v2

    iget-object v2, v2, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    aput-object v2, v5, v15

    .line 259
    add-int/lit8 v21, v21, 0x4

    move v15, v14

    .end local v14    # "k":I
    .restart local v15    # "k":I
    goto :goto_fe

    .line 261
    :cond_11d
    sub-int v6, v17, v4

    const/4 v7, 0x1

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I[Ljavassist/bytecode/stackmap/BasicBlock;IZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    goto/16 :goto_b

    .line 264
    .end local v5    # "to":[Ljavassist/bytecode/stackmap/BasicBlock;
    .end local v12    # "high":I
    .end local v15    # "k":I
    .end local v16    # "low":I
    .end local v17    # "n":I
    .end local v18    # "ncases":I
    .end local v21    # "p":I
    .end local v22    # "pos":I
    :pswitch_127
    and-int/lit8 v2, v4, -0x4

    add-int/lit8 v22, v2, 0x4

    .line 265
    .restart local v22    # "pos":I
    add-int/lit8 v2, v22, 0x4

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v18

    .line 266
    .restart local v18    # "ncases":I
    add-int/lit8 v2, v18, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeArray(I)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v5

    .line 267
    .restart local v5    # "to":[Ljavassist/bytecode/stackmap/BasicBlock;
    const/4 v2, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v6

    add-int/2addr v6, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v6}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    move-result-object v6

    iget-object v6, v6, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    aput-object v6, v5, v2

    .line 268
    add-int/lit8 v2, v22, 0x8

    add-int/lit8 v21, v2, 0x4

    .line 269
    .restart local v21    # "p":I
    mul-int/lit8 v2, v18, 0x8

    add-int v2, v2, v21

    add-int/lit8 v17, v2, -0x4

    .line 270
    .restart local v17    # "n":I
    const/4 v14, 0x1

    .restart local v14    # "k":I
    move v15, v14

    .line 271
    .end local v14    # "k":I
    .restart local v15    # "k":I
    :goto_15b
    move/from16 v0, v21

    move/from16 v1, v17

    if-ge v0, v1, :cond_17a

    .line 272
    add-int/lit8 v14, v15, 0x1

    .end local v15    # "k":I
    .restart local v14    # "k":I
    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v2

    add-int/2addr v2, v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v2}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    move-result-object v2

    iget-object v2, v2, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    aput-object v2, v5, v15

    .line 273
    add-int/lit8 v21, v21, 0x8

    move v15, v14

    .end local v14    # "k":I
    .restart local v15    # "k":I
    goto :goto_15b

    .line 275
    :cond_17a
    sub-int v6, v17, v4

    const/4 v7, 0x1

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I[Ljavassist/bytecode/stackmap/BasicBlock;IZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    goto/16 :goto_b

    .line 278
    .end local v5    # "to":[Ljavassist/bytecode/stackmap/BasicBlock;
    .end local v15    # "k":I
    .end local v17    # "n":I
    .end local v18    # "ncases":I
    .end local v21    # "p":I
    .end local v22    # "pos":I
    :cond_184
    const/16 v2, 0xac

    move/from16 v0, v20

    if-gt v2, v0, :cond_190

    const/16 v2, 0xb1

    move/from16 v0, v20

    if-le v0, v2, :cond_196

    :cond_190
    const/16 v2, 0xbf

    move/from16 v0, v20

    if-ne v0, v2, :cond_1a2

    .line 279
    :cond_196
    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x1

    move-object/from16 v6, p0

    move-object v7, v3

    move v8, v4

    invoke-direct/range {v6 .. v11}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I[Ljavassist/bytecode/stackmap/BasicBlock;IZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    goto/16 :goto_b

    .line 280
    :cond_1a2
    const/16 v2, 0xc8

    move/from16 v0, v20

    if-ne v0, v2, :cond_1b9

    .line 281
    add-int/lit8 v2, v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v2

    add-int/2addr v2, v4

    const/4 v6, 0x5

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4, v2, v6}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeGoto(Ljava/util/HashMap;III)V

    goto/16 :goto_b

    .line 282
    :cond_1b9
    const/16 v2, 0xc9

    move/from16 v0, v20

    if-ne v0, v2, :cond_1d0

    .line 283
    add-int/lit8 v2, v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljavassist/bytecode/CodeIterator;->s32bitAt(I)I

    move-result v2

    add-int/2addr v2, v4

    const/4 v6, 0x5

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4, v2, v6}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeJsr(Ljava/util/HashMap;III)V

    goto/16 :goto_b

    .line 284
    :cond_1d0
    const/16 v2, 0xc4

    move/from16 v0, v20

    if-ne v0, v2, :cond_b

    add-int/lit8 v2, v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v2

    const/16 v6, 0xa9

    if-ne v2, v6, :cond_b

    .line 285
    const/4 v9, 0x0

    const/4 v10, 0x4

    const/4 v11, 0x1

    move-object/from16 v6, p0

    move-object v7, v3

    move v8, v4

    invoke-direct/range {v6 .. v11}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMark(Ljava/util/HashMap;I[Ljavassist/bytecode/stackmap/BasicBlock;IZ)Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    goto/16 :goto_b

    .line 296
    .end local v4    # "index":I
    .end local v20    # "op":I
    :cond_1ee
    return-object v3

    .line 237
    nop

    :pswitch_data_1f0
    .packed-switch 0xa7
        :pswitch_96
        :pswitch_a7
        :pswitch_b8
        :pswitch_c2
        :pswitch_127
    .end packed-switch
.end method


# virtual methods
.method public make(Ljavassist/bytecode/CodeIterator;IILjavassist/bytecode/ExceptionTable;)[Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 7
    .param p1, "ci"    # Ljavassist/bytecode/CodeIterator;
    .param p2, "begin"    # I
    .param p3, "end"    # I
    .param p4, "et"    # Ljavassist/bytecode/ExceptionTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 175
    invoke-direct {p0, p1, p2, p3, p4}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeMarks(Ljavassist/bytecode/CodeIterator;IILjavassist/bytecode/ExceptionTable;)Ljava/util/HashMap;

    move-result-object v1

    .line 176
    .local v1, "marks":Ljava/util/HashMap;
    invoke-direct {p0, v1}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->makeBlocks(Ljava/util/HashMap;)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v0

    .line 177
    .local v0, "bb":[Ljavassist/bytecode/stackmap/BasicBlock;
    invoke-direct {p0, v0, p4}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->addCatchers([Ljavassist/bytecode/stackmap/BasicBlock;Ljavassist/bytecode/ExceptionTable;)V

    .line 178
    return-object v0
.end method

.method public make(Ljavassist/bytecode/MethodInfo;)[Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 7
    .param p1, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 163
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 164
    .local v0, "ca":Ljavassist/bytecode/CodeAttribute;
    if-nez v0, :cond_8

    .line 165
    const/4 v2, 0x0

    .line 168
    :goto_7
    return-object v2

    .line 167
    :cond_8
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v1

    .line 168
    .local v1, "ci":Ljavassist/bytecode/CodeIterator;
    const/4 v2, 0x0

    invoke-virtual {v1}, Ljavassist/bytecode/CodeIterator;->getCodeLength()I

    move-result v3

    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v4

    invoke-virtual {p0, v1, v2, v3, v4}, Ljavassist/bytecode/stackmap/BasicBlock$Maker;->make(Ljavassist/bytecode/CodeIterator;IILjavassist/bytecode/ExceptionTable;)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v2

    goto :goto_7
.end method

.method protected makeArray(I)[Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 146
    new-array v0, p1, [Ljavassist/bytecode/stackmap/BasicBlock;

    return-object v0
.end method

.method protected makeBlock(I)Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 142
    new-instance v0, Ljavassist/bytecode/stackmap/BasicBlock;

    invoke-direct {v0, p1}, Ljavassist/bytecode/stackmap/BasicBlock;-><init>(I)V

    return-object v0
.end method

.method protected makeJsr(Ljava/util/HashMap;III)V
    .registers 6
    .param p1, "marks"    # Ljava/util/HashMap;
    .param p2, "pos"    # I
    .param p3, "target"    # I
    .param p4, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 316
    new-instance v0, Ljavassist/bytecode/stackmap/BasicBlock$JsrBytecode;

    invoke-direct {v0}, Ljavassist/bytecode/stackmap/BasicBlock$JsrBytecode;-><init>()V

    throw v0
.end method
