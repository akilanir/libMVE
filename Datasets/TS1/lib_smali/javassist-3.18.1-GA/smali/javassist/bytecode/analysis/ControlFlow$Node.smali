.class public Ljavassist/bytecode/analysis/ControlFlow$Node;
.super Ljava/lang/Object;
.source "ControlFlow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/analysis/ControlFlow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Node"
.end annotation


# instance fields
.field private block:Ljavassist/bytecode/analysis/ControlFlow$Block;

.field private children:[Ljavassist/bytecode/analysis/ControlFlow$Node;

.field private parent:Ljavassist/bytecode/analysis/ControlFlow$Node;


# direct methods
.method constructor <init>(Ljavassist/bytecode/analysis/ControlFlow$Block;)V
    .registers 3
    .param p1, "b"    # Ljavassist/bytecode/analysis/ControlFlow$Block;

    .prologue
    .line 333
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 334
    iput-object p1, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;

    .line 335
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    .line 336
    return-void
.end method

.method static synthetic access$100(Ljavassist/bytecode/analysis/ControlFlow$Node;)Ljavassist/bytecode/analysis/ControlFlow$Block;
    .registers 2
    .param p0, "x0"    # Ljavassist/bytecode/analysis/ControlFlow$Node;

    .prologue
    .line 328
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;

    return-object v0
.end method

.method static synthetic access$200([Ljavassist/bytecode/analysis/ControlFlow$Node;)V
    .registers 1
    .param p0, "x0"    # [Ljavassist/bytecode/analysis/ControlFlow$Node;

    .prologue
    .line 328
    invoke-static {p0}, Ljavassist/bytecode/analysis/ControlFlow$Node;->setChildren([Ljavassist/bytecode/analysis/ControlFlow$Node;)V

    return-void
.end method

.method private static getAncestor(Ljavassist/bytecode/analysis/ControlFlow$Node;Ljavassist/bytecode/analysis/ControlFlow$Node;[I)Ljavassist/bytecode/analysis/ControlFlow$Node;
    .registers 5
    .param p0, "n1"    # Ljavassist/bytecode/analysis/ControlFlow$Node;
    .param p1, "n2"    # Ljavassist/bytecode/analysis/ControlFlow$Node;
    .param p2, "distance"    # [I

    .prologue
    .line 430
    :cond_0
    if-eq p0, p1, :cond_17

    .line 431
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;

    iget v0, v0, Ljavassist/bytecode/analysis/ControlFlow$Block;->index:I

    aget v0, p2, v0

    iget-object v1, p1, Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;

    iget v1, v1, Ljavassist/bytecode/analysis/ControlFlow$Block;->index:I

    aget v1, p2, v1

    if-ge v0, v1, :cond_18

    .line 432
    iget-object p0, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    .line 436
    :goto_12
    if-eqz p0, :cond_16

    if-nez p1, :cond_0

    .line 437
    :cond_16
    const/4 p0, 0x0

    .line 440
    .end local p0    # "n1":Ljavassist/bytecode/analysis/ControlFlow$Node;
    :cond_17
    return-object p0

    .line 434
    .restart local p0    # "n1":Ljavassist/bytecode/analysis/ControlFlow$Node;
    :cond_18
    iget-object p1, p1, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    goto :goto_12
.end method

.method private static setChildren([Ljavassist/bytecode/analysis/ControlFlow$Node;)V
    .registers 10
    .param p0, "all"    # [Ljavassist/bytecode/analysis/ControlFlow$Node;

    .prologue
    const/4 v7, 0x0

    .line 444
    array-length v4, p0

    .line 445
    .local v4, "size":I
    new-array v2, v4, [I

    .line 446
    .local v2, "nchildren":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v4, :cond_c

    .line 447
    aput v7, v2, v0

    .line 446
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 449
    :cond_c
    const/4 v0, 0x0

    :goto_d
    if-ge v0, v4, :cond_22

    .line 450
    aget-object v5, p0, v0

    iget-object v3, v5, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    .line 451
    .local v3, "p":Ljavassist/bytecode/analysis/ControlFlow$Node;
    if-eqz v3, :cond_1f

    .line 452
    iget-object v5, v3, Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;

    iget v5, v5, Ljavassist/bytecode/analysis/ControlFlow$Block;->index:I

    aget v6, v2, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v2, v5

    .line 449
    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 455
    .end local v3    # "p":Ljavassist/bytecode/analysis/ControlFlow$Node;
    :cond_22
    const/4 v0, 0x0

    :goto_23
    if-ge v0, v4, :cond_30

    .line 456
    aget-object v5, p0, v0

    aget v6, v2, v0

    new-array v6, v6, [Ljavassist/bytecode/analysis/ControlFlow$Node;

    iput-object v6, v5, Ljavassist/bytecode/analysis/ControlFlow$Node;->children:[Ljavassist/bytecode/analysis/ControlFlow$Node;

    .line 455
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 458
    :cond_30
    const/4 v0, 0x0

    :goto_31
    if-ge v0, v4, :cond_38

    .line 459
    aput v7, v2, v0

    .line 458
    add-int/lit8 v0, v0, 0x1

    goto :goto_31

    .line 461
    :cond_38
    const/4 v0, 0x0

    :goto_39
    if-ge v0, v4, :cond_52

    .line 462
    aget-object v1, p0, v0

    .line 463
    .local v1, "n":Ljavassist/bytecode/analysis/ControlFlow$Node;
    iget-object v3, v1, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    .line 464
    .restart local v3    # "p":Ljavassist/bytecode/analysis/ControlFlow$Node;
    if-eqz v3, :cond_4f

    .line 465
    iget-object v5, v3, Ljavassist/bytecode/analysis/ControlFlow$Node;->children:[Ljavassist/bytecode/analysis/ControlFlow$Node;

    iget-object v6, v3, Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;

    iget v6, v6, Ljavassist/bytecode/analysis/ControlFlow$Block;->index:I

    aget v7, v2, v6

    add-int/lit8 v8, v7, 0x1

    aput v8, v2, v6

    aput-object v1, v5, v7

    .line 461
    :cond_4f
    add-int/lit8 v0, v0, 0x1

    goto :goto_39

    .line 467
    .end local v1    # "n":Ljavassist/bytecode/analysis/ControlFlow$Node;
    .end local v3    # "p":Ljavassist/bytecode/analysis/ControlFlow$Node;
    :cond_52
    return-void
.end method


# virtual methods
.method public block()Ljavassist/bytecode/analysis/ControlFlow$Block;
    .registers 2

    .prologue
    .line 357
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;

    return-object v0
.end method

.method public child(I)Ljavassist/bytecode/analysis/ControlFlow$Node;
    .registers 3
    .param p1, "n"    # I

    .prologue
    .line 374
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->children:[Ljavassist/bytecode/analysis/ControlFlow$Node;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public children()I
    .registers 2

    .prologue
    .line 367
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->children:[Ljavassist/bytecode/analysis/ControlFlow$Node;

    array-length v0, v0

    return v0
.end method

.method makeDepth1stTree(Ljavassist/bytecode/analysis/ControlFlow$Node;[ZI[ILjavassist/bytecode/analysis/ControlFlow$Access;)I
    .registers 16
    .param p1, "caller"    # Ljavassist/bytecode/analysis/ControlFlow$Node;
    .param p2, "visited"    # [Z
    .param p3, "counter"    # I
    .param p4, "distance"    # [I
    .param p5, "access"    # Ljavassist/bytecode/analysis/ControlFlow$Access;

    .prologue
    .line 382
    iget-object v1, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;

    iget v9, v1, Ljavassist/bytecode/analysis/ControlFlow$Block;->index:I

    .line 383
    .local v9, "index":I
    aget-boolean v1, p2, v9

    if-eqz v1, :cond_a

    move v6, p3

    .line 396
    .end local p3    # "counter":I
    :goto_9
    return v6

    .line 386
    .restart local p3    # "counter":I
    :cond_a
    const/4 v1, 0x1

    aput-boolean v1, p2, v9

    .line 387
    iput-object p1, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    .line 388
    invoke-virtual {p5, p0}, Ljavassist/bytecode/analysis/ControlFlow$Access;->exits(Ljavassist/bytecode/analysis/ControlFlow$Node;)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v7

    .line 389
    .local v7, "exits":[Ljavassist/bytecode/stackmap/BasicBlock;
    if-eqz v7, :cond_2b

    .line 390
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_16
    array-length v1, v7

    if-ge v8, v1, :cond_2b

    .line 391
    aget-object v1, v7, v8

    invoke-virtual {p5, v1}, Ljavassist/bytecode/analysis/ControlFlow$Access;->node(Ljavassist/bytecode/stackmap/BasicBlock;)Ljavassist/bytecode/analysis/ControlFlow$Node;

    move-result-object v0

    .local v0, "n":Ljavassist/bytecode/analysis/ControlFlow$Node;
    move-object v1, p0

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 392
    invoke-virtual/range {v0 .. v5}, Ljavassist/bytecode/analysis/ControlFlow$Node;->makeDepth1stTree(Ljavassist/bytecode/analysis/ControlFlow$Node;[ZI[ILjavassist/bytecode/analysis/ControlFlow$Access;)I

    move-result p3

    .line 390
    add-int/lit8 v8, v8, 0x1

    goto :goto_16

    .line 395
    .end local v0    # "n":Ljavassist/bytecode/analysis/ControlFlow$Node;
    .end local v8    # "i":I
    :cond_2b
    add-int/lit8 v6, p3, 0x1

    .end local p3    # "counter":I
    .local v6, "counter":I
    aput p3, p4, v9

    move p3, v6

    .line 396
    .end local v6    # "counter":I
    .restart local p3    # "counter":I
    goto :goto_9
.end method

.method makeDominatorTree([Z[ILjavassist/bytecode/analysis/ControlFlow$Access;)Z
    .registers 12
    .param p1, "visited"    # [Z
    .param p2, "distance"    # [I
    .param p3, "access"    # Ljavassist/bytecode/analysis/ControlFlow$Access;

    .prologue
    .line 400
    iget-object v6, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;

    iget v4, v6, Ljavassist/bytecode/analysis/ControlFlow$Block;->index:I

    .line 401
    .local v4, "index":I
    aget-boolean v6, p1, v4

    if-eqz v6, :cond_a

    .line 402
    const/4 v0, 0x0

    .line 426
    :cond_9
    return v0

    .line 404
    :cond_a
    const/4 v6, 0x1

    aput-boolean v6, p1, v4

    .line 405
    const/4 v0, 0x0

    .line 406
    .local v0, "changed":Z
    invoke-virtual {p3, p0}, Ljavassist/bytecode/analysis/ControlFlow$Access;->exits(Ljavassist/bytecode/analysis/ControlFlow$Node;)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v2

    .line 407
    .local v2, "exits":[Ljavassist/bytecode/stackmap/BasicBlock;
    if-eqz v2, :cond_28

    .line 408
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_15
    array-length v6, v2

    if-ge v3, v6, :cond_28

    .line 409
    aget-object v6, v2, v3

    invoke-virtual {p3, v6}, Ljavassist/bytecode/analysis/ControlFlow$Access;->node(Ljavassist/bytecode/stackmap/BasicBlock;)Ljavassist/bytecode/analysis/ControlFlow$Node;

    move-result-object v5

    .line 410
    .local v5, "n":Ljavassist/bytecode/analysis/ControlFlow$Node;
    invoke-virtual {v5, p1, p2, p3}, Ljavassist/bytecode/analysis/ControlFlow$Node;->makeDominatorTree([Z[ILjavassist/bytecode/analysis/ControlFlow$Access;)Z

    move-result v6

    if-eqz v6, :cond_25

    .line 411
    const/4 v0, 0x1

    .line 408
    :cond_25
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 414
    .end local v3    # "i":I
    .end local v5    # "n":Ljavassist/bytecode/analysis/ControlFlow$Node;
    :cond_28
    invoke-virtual {p3, p0}, Ljavassist/bytecode/analysis/ControlFlow$Access;->entrances(Ljavassist/bytecode/analysis/ControlFlow$Node;)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v1

    .line 415
    .local v1, "entrances":[Ljavassist/bytecode/stackmap/BasicBlock;
    if-eqz v1, :cond_9

    .line 416
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_2f
    array-length v6, v1

    if-ge v3, v6, :cond_9

    .line 417
    iget-object v6, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    if-eqz v6, :cond_49

    .line 418
    iget-object v6, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    aget-object v7, v1, v3

    invoke-virtual {p3, v7}, Ljavassist/bytecode/analysis/ControlFlow$Access;->node(Ljavassist/bytecode/stackmap/BasicBlock;)Ljavassist/bytecode/analysis/ControlFlow$Node;

    move-result-object v7

    invoke-static {v6, v7, p2}, Ljavassist/bytecode/analysis/ControlFlow$Node;->getAncestor(Ljavassist/bytecode/analysis/ControlFlow$Node;Ljavassist/bytecode/analysis/ControlFlow$Node;[I)Ljavassist/bytecode/analysis/ControlFlow$Node;

    move-result-object v5

    .line 419
    .restart local v5    # "n":Ljavassist/bytecode/analysis/ControlFlow$Node;
    iget-object v6, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    if-eq v5, v6, :cond_49

    .line 420
    iput-object v5, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    .line 421
    const/4 v0, 0x1

    .line 416
    .end local v5    # "n":Ljavassist/bytecode/analysis/ControlFlow$Node;
    :cond_49
    add-int/lit8 v3, v3, 0x1

    goto :goto_2f
.end method

.method public parent()Ljavassist/bytecode/analysis/ControlFlow$Node;
    .registers 2

    .prologue
    .line 362
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 342
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 343
    .local v1, "sbuf":Ljava/lang/StringBuffer;
    const-string v2, "Node[pos="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Ljavassist/bytecode/analysis/ControlFlow$Node;->block()Ljavassist/bytecode/analysis/ControlFlow$Block;

    move-result-object v3

    invoke-virtual {v3}, Ljavassist/bytecode/analysis/ControlFlow$Block;->position()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 344
    const-string v2, ", parent="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 345
    iget-object v2, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    if-nez v2, :cond_47

    const-string v2, "*"

    :goto_21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 346
    const-string v2, ", children{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 347
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2a
    iget-object v2, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->children:[Ljavassist/bytecode/analysis/ControlFlow$Node;

    array-length v2, v2

    if-ge v0, v2, :cond_56

    .line 348
    iget-object v2, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->children:[Ljavassist/bytecode/analysis/ControlFlow$Node;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Ljavassist/bytecode/analysis/ControlFlow$Node;->block()Ljavassist/bytecode/analysis/ControlFlow$Block;

    move-result-object v2

    invoke-virtual {v2}, Ljavassist/bytecode/analysis/ControlFlow$Block;->position()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 347
    add-int/lit8 v0, v0, 0x1

    goto :goto_2a

    .line 345
    .end local v0    # "i":I
    :cond_47
    iget-object v2, p0, Ljavassist/bytecode/analysis/ControlFlow$Node;->parent:Ljavassist/bytecode/analysis/ControlFlow$Node;

    invoke-virtual {v2}, Ljavassist/bytecode/analysis/ControlFlow$Node;->block()Ljavassist/bytecode/analysis/ControlFlow$Block;

    move-result-object v2

    invoke-virtual {v2}, Ljavassist/bytecode/analysis/ControlFlow$Block;->position()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_21

    .line 350
    .restart local v0    # "i":I
    :cond_56
    const-string v2, "}]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 351
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
