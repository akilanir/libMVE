.class Lorg/mozilla/javascript/optimizer/Block;
.super Ljava/lang/Object;
.source "Block.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/optimizer/Block$1;,
        Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    }
.end annotation


# static fields
.field static final DEBUG:Z

.field private static debug_blockCount:I


# instance fields
.field private itsBlockID:I

.field private itsEndNodeIndex:I

.field private itsLiveOnEntrySet:Ljava/util/BitSet;

.field private itsLiveOnExitSet:Ljava/util/BitSet;

.field private itsNotDefSet:Ljava/util/BitSet;

.field private itsPredecessors:[Lorg/mozilla/javascript/optimizer/Block;

.field private itsStartNodeIndex:I

.field private itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

.field private itsUseBeforeDefSet:Ljava/util/BitSet;


# direct methods
.method constructor <init>(II)V
    .registers 3
    .param p1, "startNodeIndex"    # I
    .param p2, "endNodeIndex"    # I

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput p1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsStartNodeIndex:I

    .line 55
    iput p2, p0, Lorg/mozilla/javascript/optimizer/Block;->itsEndNodeIndex:I

    .line 56
    return-void
.end method

.method private static assignType([III)Z
    .registers 5
    .param p0, "varTypes"    # [I
    .param p1, "index"    # I
    .param p2, "type"    # I

    .prologue
    .line 333
    aget v0, p0, p1

    .line 334
    .local v0, "prev":I
    aget v1, p0, p1

    or-int/2addr v1, p2

    aput v1, p0, p1

    if-eq v0, v1, :cond_b

    const/4 v1, 0x1

    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method private static buildBlocks([Lorg/mozilla/javascript/Node;)[Lorg/mozilla/javascript/optimizer/Block;
    .registers 15
    .param p0, "statementNodes"    # [Lorg/mozilla/javascript/Node;

    .prologue
    .line 107
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 108
    .local v11, "theTargetBlocks":Ljava/util/Map;, "Ljava/util/Map<Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/optimizer/Block$FatBlock;>;"
    new-instance v10, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v10}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    .line 111
    .local v10, "theBlocks":Lorg/mozilla/javascript/ObjArray;
    const/4 v1, 0x0

    .line 113
    .local v1, "beginNodeIndex":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_c
    array-length v12, p0

    if-ge v7, v12, :cond_50

    .line 114
    aget-object v12, p0, v7

    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v12

    sparse-switch v12, :sswitch_data_f0

    .line 113
    :cond_18
    :goto_18
    add-int/lit8 v7, v7, 0x1

    goto :goto_c

    .line 117
    :sswitch_1b
    if-eq v7, v1, :cond_18

    .line 118
    add-int/lit8 v12, v7, -0x1

    invoke-static {v1, v12}, Lorg/mozilla/javascript/optimizer/Block;->newFatBlock(II)Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-result-object v6

    .line 119
    .local v6, "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    aget-object v12, p0, v1

    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v12

    const/16 v13, 0x83

    if-ne v12, v13, :cond_32

    .line 120
    aget-object v12, p0, v1

    invoke-interface {v11, v12, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    :cond_32
    invoke-virtual {v10, v6}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 124
    move v1, v7

    .line 125
    goto :goto_18

    .line 132
    .end local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :sswitch_37
    invoke-static {v1, v7}, Lorg/mozilla/javascript/optimizer/Block;->newFatBlock(II)Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-result-object v6

    .line 133
    .restart local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    aget-object v12, p0, v1

    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v12

    const/16 v13, 0x83

    if-ne v12, v13, :cond_4a

    .line 134
    aget-object v12, p0, v1

    invoke-interface {v11, v12, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    :cond_4a
    invoke-virtual {v10, v6}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 138
    add-int/lit8 v1, v7, 0x1

    goto :goto_18

    .line 144
    .end local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :cond_50
    array-length v12, p0

    if-eq v1, v12, :cond_6c

    .line 145
    array-length v12, p0

    add-int/lit8 v12, v12, -0x1

    invoke-static {v1, v12}, Lorg/mozilla/javascript/optimizer/Block;->newFatBlock(II)Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-result-object v6

    .line 146
    .restart local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    aget-object v12, p0, v1

    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v12

    const/16 v13, 0x83

    if-ne v12, v13, :cond_69

    .line 147
    aget-object v12, p0, v1

    invoke-interface {v11, v12, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    :cond_69
    invoke-virtual {v10, v6}, Lorg/mozilla/javascript/ObjArray;->add(Ljava/lang/Object;)V

    .line 154
    .end local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :cond_6c
    const/4 v7, 0x0

    :goto_6d
    invoke-virtual {v10}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v12

    if-ge v7, v12, :cond_c4

    .line 155
    invoke-virtual {v10, v7}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-object v6, v12

    check-cast v6, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    .line 157
    .restart local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    iget-object v12, v6, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->realBlock:Lorg/mozilla/javascript/optimizer/Block;

    iget v12, v12, Lorg/mozilla/javascript/optimizer/Block;->itsEndNodeIndex:I

    aget-object v2, p0, v12

    .line 158
    .local v2, "blockEndNode":Lorg/mozilla/javascript/Node;
    invoke-virtual {v2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    .line 160
    .local v3, "blockEndNodeType":I
    const/4 v12, 0x5

    if-eq v3, v12, :cond_a2

    invoke-virtual {v10}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    if-ge v7, v12, :cond_a2

    .line 161
    add-int/lit8 v12, v7, 0x1

    invoke-virtual {v10, v12}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-object v5, v12

    check-cast v5, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    .line 162
    .local v5, "fallThruTarget":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    invoke-virtual {v6, v5}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->addSuccessor(Lorg/mozilla/javascript/optimizer/Block$FatBlock;)V

    .line 163
    invoke-virtual {v5, v6}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->addPredecessor(Lorg/mozilla/javascript/optimizer/Block$FatBlock;)V

    .line 167
    .end local v5    # "fallThruTarget":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :cond_a2
    const/4 v12, 0x7

    if-eq v3, v12, :cond_ab

    const/4 v12, 0x6

    if-eq v3, v12, :cond_ab

    const/4 v12, 0x5

    if-ne v3, v12, :cond_c1

    .line 170
    :cond_ab
    check-cast v2, Lorg/mozilla/javascript/ast/Jump;

    .end local v2    # "blockEndNode":Lorg/mozilla/javascript/Node;
    iget-object v9, v2, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    .line 171
    .local v9, "target":Lorg/mozilla/javascript/Node;
    invoke-interface {v11, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    .line 172
    .local v4, "branchTargetBlock":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    const/4 v12, 0x6

    iget-object v13, v4, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->realBlock:Lorg/mozilla/javascript/optimizer/Block;

    invoke-virtual {v9, v12, v13}, Lorg/mozilla/javascript/Node;->putProp(ILjava/lang/Object;)V

    .line 173
    invoke-virtual {v6, v4}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->addSuccessor(Lorg/mozilla/javascript/optimizer/Block$FatBlock;)V

    .line 174
    invoke-virtual {v4, v6}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->addPredecessor(Lorg/mozilla/javascript/optimizer/Block$FatBlock;)V

    .line 154
    .end local v4    # "branchTargetBlock":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    .end local v9    # "target":Lorg/mozilla/javascript/Node;
    :cond_c1
    add-int/lit8 v7, v7, 0x1

    goto :goto_6d

    .line 178
    .end local v3    # "blockEndNodeType":I
    .end local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :cond_c4
    invoke-virtual {v10}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v12

    new-array v8, v12, [Lorg/mozilla/javascript/optimizer/Block;

    .line 180
    .local v8, "result":[Lorg/mozilla/javascript/optimizer/Block;
    const/4 v7, 0x0

    :goto_cb
    invoke-virtual {v10}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v12

    if-ge v7, v12, :cond_ef

    .line 181
    invoke-virtual {v10, v7}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    move-object v6, v12

    check-cast v6, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    .line 182
    .restart local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    iget-object v0, v6, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->realBlock:Lorg/mozilla/javascript/optimizer/Block;

    .line 183
    .local v0, "b":Lorg/mozilla/javascript/optimizer/Block;
    invoke-virtual {v6}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->getSuccessors()[Lorg/mozilla/javascript/optimizer/Block;

    move-result-object v12

    iput-object v12, v0, Lorg/mozilla/javascript/optimizer/Block;->itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

    .line 184
    invoke-virtual {v6}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->getPredecessors()[Lorg/mozilla/javascript/optimizer/Block;

    move-result-object v12

    iput-object v12, v0, Lorg/mozilla/javascript/optimizer/Block;->itsPredecessors:[Lorg/mozilla/javascript/optimizer/Block;

    .line 185
    iput v7, v0, Lorg/mozilla/javascript/optimizer/Block;->itsBlockID:I

    .line 186
    aput-object v0, v8, v7

    .line 180
    add-int/lit8 v7, v7, 0x1

    goto :goto_cb

    .line 189
    .end local v0    # "b":Lorg/mozilla/javascript/optimizer/Block;
    .end local v6    # "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    :cond_ef
    return-object v8

    .line 114
    :sswitch_data_f0
    .sparse-switch
        0x5 -> :sswitch_37
        0x6 -> :sswitch_37
        0x7 -> :sswitch_37
        0x83 -> :sswitch_1b
    .end sparse-switch
.end method

.method private doReachedUseDataFlow()Z
    .registers 6

    .prologue
    .line 434
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->clear()V

    .line 435
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

    if-eqz v1, :cond_1d

    .line 436
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

    array-length v1, v1

    if-ge v0, v1, :cond_1d

    .line 437
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/Block;->itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

    aget-object v2, v2, v0

    iget-object v2, v2, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 436
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 440
    .end local v0    # "i":I
    :cond_1d
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-direct {p0, v1, v2, v3, v4}, Lorg/mozilla/javascript/optimizer/Block;->updateEntrySet(Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;)Z

    move-result v1

    return v1
.end method

.method private doTypeFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[I)Z
    .registers 8
    .param p1, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p2, "statementNodes"    # [Lorg/mozilla/javascript/Node;
    .param p3, "varTypes"    # [I

    .prologue
    .line 607
    const/4 v0, 0x0

    .line 609
    .local v0, "changed":Z
    iget v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsStartNodeIndex:I

    .local v1, "i":I
    :goto_3
    iget v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsEndNodeIndex:I

    if-gt v1, v3, :cond_13

    .line 610
    aget-object v2, p2, v1

    .line 611
    .local v2, "n":Lorg/mozilla/javascript/Node;
    if-eqz v2, :cond_10

    .line 612
    invoke-static {p1, v2, p3}, Lorg/mozilla/javascript/optimizer/Block;->findDefPoints(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)Z

    move-result v3

    or-int/2addr v0, v3

    .line 609
    :cond_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 616
    .end local v2    # "n":Lorg/mozilla/javascript/Node;
    :cond_13
    return v0
.end method

.method private static findDefPoints(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)Z
    .registers 11
    .param p0, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p1, "n"    # Lorg/mozilla/javascript/Node;
    .param p2, "varTypes"    # [I

    .prologue
    .line 573
    const/4 v4, 0x0

    .line 574
    .local v4, "result":Z
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 575
    .local v0, "first":Lorg/mozilla/javascript/Node;
    move-object v2, v0

    .local v2, "next":Lorg/mozilla/javascript/Node;
    :goto_6
    if-eqz v2, :cond_12

    .line 576
    invoke-static {p0, v2, p2}, Lorg/mozilla/javascript/optimizer/Block;->findDefPoints(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)Z

    move-result v6

    or-int/2addr v4, v6

    .line 575
    invoke-virtual {v2}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v2

    goto :goto_6

    .line 578
    :cond_12
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v6

    sparse-switch v6, :sswitch_data_5c

    .line 601
    :cond_19
    :goto_19
    return v4

    .line 581
    :sswitch_1a
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v6

    const/16 v7, 0x37

    if-ne v6, v7, :cond_19

    .line 583
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v1

    .line 584
    .local v1, "i":I
    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v6

    aget-boolean v6, v6, v1

    if-nez v6, :cond_19

    .line 585
    const/4 v6, 0x1

    invoke-static {p2, v1, v6}, Lorg/mozilla/javascript/optimizer/Block;->assignType([III)Z

    move-result v6

    or-int/2addr v4, v6

    goto :goto_19

    .line 591
    .end local v1    # "i":I
    :sswitch_37
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 592
    .local v3, "rValue":Lorg/mozilla/javascript/Node;
    invoke-static {p0, v3, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v5

    .line 593
    .local v5, "theType":I
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v1

    .line 594
    .restart local v1    # "i":I
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v6

    const/16 v7, 0x38

    if-ne v6, v7, :cond_55

    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarConst()[Z

    move-result-object v6

    aget-boolean v6, v6, v1

    if-nez v6, :cond_19

    .line 596
    :cond_55
    invoke-static {p2, v1, v5}, Lorg/mozilla/javascript/optimizer/Block;->assignType([III)Z

    move-result v6

    or-int/2addr v4, v6

    goto :goto_19

    .line 578
    nop

    :sswitch_data_5c
    .sparse-switch
        0x38 -> :sswitch_37
        0x6a -> :sswitch_1a
        0x6b -> :sswitch_1a
        0x9c -> :sswitch_37
    .end sparse-switch
.end method

.method private static findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I
    .registers 13
    .param p0, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p1, "n"    # Lorg/mozilla/javascript/Node;
    .param p2, "varTypes"    # [I

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x3

    .line 462
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v9

    sparse-switch v9, :sswitch_data_64

    move v7, v8

    .line 567
    :goto_a
    :sswitch_a
    return v7

    :sswitch_b
    move v7, v8

    .line 469
    goto :goto_a

    :sswitch_d
    move v7, v8

    .line 475
    goto :goto_a

    .line 478
    :sswitch_f
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v7

    aget v7, p2, v7

    goto :goto_a

    :sswitch_16
    move v7, v8

    .line 499
    goto :goto_a

    :sswitch_18
    move v7, v8

    .line 517
    goto :goto_a

    :sswitch_1a
    move v7, v8

    .line 523
    goto :goto_a

    :sswitch_1c
    move v7, v8

    .line 530
    goto :goto_a

    .line 536
    :sswitch_1e
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 537
    .local v0, "child":Lorg/mozilla/javascript/Node;
    invoke-static {p0, v0, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v5

    .line 538
    .local v5, "lType":I
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-static {p0, v7, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v6

    .line 539
    .local v6, "rType":I
    or-int v7, v5, v6

    goto :goto_a

    .line 543
    .end local v0    # "child":Lorg/mozilla/javascript/Node;
    .end local v5    # "lType":I
    .end local v6    # "rType":I
    :sswitch_31
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-virtual {v7}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 544
    .local v3, "ifTrue":Lorg/mozilla/javascript/Node;
    invoke-virtual {v3}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v1

    .line 545
    .local v1, "ifFalse":Lorg/mozilla/javascript/Node;
    invoke-static {p0, v3, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v4

    .line 546
    .local v4, "ifTrueType":I
    invoke-static {p0, v1, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v2

    .line 547
    .local v2, "ifFalseType":I
    or-int v7, v4, v2

    goto :goto_a

    .line 556
    .end local v1    # "ifFalse":Lorg/mozilla/javascript/Node;
    .end local v2    # "ifFalseType":I
    .end local v3    # "ifTrue":Lorg/mozilla/javascript/Node;
    .end local v4    # "ifTrueType":I
    :sswitch_48
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getLastChild()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-static {p0, v7, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v7

    goto :goto_a

    .line 560
    :sswitch_51
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 561
    .restart local v0    # "child":Lorg/mozilla/javascript/Node;
    invoke-static {p0, v0, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v5

    .line 562
    .restart local v5    # "lType":I
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v7

    invoke-static {p0, v7, p2}, Lorg/mozilla/javascript/optimizer/Block;->findExpressionType(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;[I)I

    move-result v6

    .line 563
    .restart local v6    # "rType":I
    or-int v7, v5, v6

    goto :goto_a

    .line 462
    :sswitch_data_64
    .sparse-switch
        0x8 -> :sswitch_48
        0x9 -> :sswitch_a
        0xa -> :sswitch_a
        0xb -> :sswitch_a
        0xc -> :sswitch_18
        0xd -> :sswitch_18
        0xe -> :sswitch_18
        0xf -> :sswitch_18
        0x10 -> :sswitch_18
        0x11 -> :sswitch_18
        0x12 -> :sswitch_a
        0x13 -> :sswitch_a
        0x14 -> :sswitch_a
        0x15 -> :sswitch_1e
        0x16 -> :sswitch_a
        0x17 -> :sswitch_a
        0x18 -> :sswitch_a
        0x19 -> :sswitch_a
        0x1a -> :sswitch_18
        0x1b -> :sswitch_a
        0x1c -> :sswitch_a
        0x1d -> :sswitch_a
        0x1e -> :sswitch_b
        0x1f -> :sswitch_18
        0x20 -> :sswitch_1a
        0x21 -> :sswitch_d
        0x23 -> :sswitch_48
        0x24 -> :sswitch_d
        0x25 -> :sswitch_48
        0x26 -> :sswitch_b
        0x27 -> :sswitch_d
        0x28 -> :sswitch_a
        0x29 -> :sswitch_1a
        0x2a -> :sswitch_1c
        0x2b -> :sswitch_d
        0x2c -> :sswitch_18
        0x2d -> :sswitch_18
        0x2e -> :sswitch_18
        0x2f -> :sswitch_18
        0x30 -> :sswitch_1c
        0x34 -> :sswitch_18
        0x35 -> :sswitch_18
        0x37 -> :sswitch_f
        0x38 -> :sswitch_48
        0x41 -> :sswitch_1c
        0x42 -> :sswitch_1c
        0x45 -> :sswitch_18
        0x46 -> :sswitch_b
        0x59 -> :sswitch_48
        0x66 -> :sswitch_31
        0x68 -> :sswitch_51
        0x69 -> :sswitch_51
        0x6a -> :sswitch_a
        0x6b -> :sswitch_a
        0x7e -> :sswitch_16
        0x89 -> :sswitch_1a
        0x9c -> :sswitch_48
        0x9d -> :sswitch_1c
    .end sparse-switch
.end method

.method private initLiveOnEntrySets(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;)V
    .registers 8
    .param p1, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p2, "statementNodes"    # [Lorg/mozilla/javascript/Node;

    .prologue
    .line 414
    invoke-virtual {p1}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarCount()I

    move-result v1

    .line 415
    .local v1, "listLength":I
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    .line 416
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    .line 417
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    .line 418
    new-instance v3, Ljava/util/BitSet;

    invoke-direct {v3, v1}, Ljava/util/BitSet;-><init>(I)V

    iput-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnExitSet:Ljava/util/BitSet;

    .line 419
    iget v0, p0, Lorg/mozilla/javascript/optimizer/Block;->itsStartNodeIndex:I

    .local v0, "i":I
    :goto_22
    iget v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsEndNodeIndex:I

    if-gt v0, v3, :cond_2e

    .line 420
    aget-object v2, p2, v0

    .line 421
    .local v2, "n":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, p1, v2}, Lorg/mozilla/javascript/optimizer/Block;->lookForVariableAccess(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;)V

    .line 419
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    .line 423
    .end local v2    # "n":Lorg/mozilla/javascript/Node;
    :cond_2e
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v1}, Ljava/util/BitSet;->flip(II)V

    .line 424
    return-void
.end method

.method private lookForVariableAccess(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;)V
    .registers 9
    .param p1, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p2, "n"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 357
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v4

    sparse-switch v4, :sswitch_data_7a

    .line 398
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 399
    .local v0, "child":Lorg/mozilla/javascript/Node;
    :goto_b
    if-eqz v0, :cond_2b

    .line 400
    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/optimizer/Block;->lookForVariableAccess(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;)V

    .line 401
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    goto :goto_b

    .line 362
    .end local v0    # "child":Lorg/mozilla/javascript/Node;
    :sswitch_15
    iget-object v4, p1, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v4, p2}, Lorg/mozilla/javascript/ast/FunctionNode;->getIndexForNameNode(Lorg/mozilla/javascript/Node;)I

    move-result v3

    .line 363
    .local v3, "varIndex":I
    const/4 v4, -0x1

    if-le v3, v4, :cond_2b

    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-nez v4, :cond_2b

    .line 364
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->set(I)V

    .line 405
    .end local v3    # "varIndex":I
    :cond_2b
    :goto_2b
    return-void

    .line 370
    :sswitch_2c
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    .line 371
    .restart local v0    # "child":Lorg/mozilla/javascript/Node;
    invoke-virtual {v0}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v4

    const/16 v5, 0x37

    if-ne v4, v5, :cond_4f

    .line 372
    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v3

    .line 373
    .restart local v3    # "varIndex":I
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-nez v4, :cond_49

    .line 374
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->set(I)V

    .line 375
    :cond_49
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->set(I)V

    goto :goto_2b

    .line 377
    .end local v3    # "varIndex":I
    :cond_4f
    invoke-direct {p0, p1, v0}, Lorg/mozilla/javascript/optimizer/Block;->lookForVariableAccess(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;)V

    goto :goto_2b

    .line 384
    .end local v0    # "child":Lorg/mozilla/javascript/Node;
    :sswitch_53
    invoke-virtual {p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v1

    .line 385
    .local v1, "lhs":Lorg/mozilla/javascript/Node;
    invoke-virtual {v1}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v2

    .line 386
    .local v2, "rhs":Lorg/mozilla/javascript/Node;
    invoke-direct {p0, p1, v2}, Lorg/mozilla/javascript/optimizer/Block;->lookForVariableAccess(Lorg/mozilla/javascript/optimizer/OptFunctionNode;Lorg/mozilla/javascript/Node;)V

    .line 387
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {p1, p2}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/util/BitSet;->set(I)V

    goto :goto_2b

    .line 392
    .end local v1    # "lhs":Lorg/mozilla/javascript/Node;
    .end local v2    # "rhs":Lorg/mozilla/javascript/Node;
    :sswitch_68
    invoke-virtual {p1, p2}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->getVarIndex(Lorg/mozilla/javascript/Node;)I

    move-result v3

    .line 393
    .restart local v3    # "varIndex":I
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsNotDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-nez v4, :cond_2b

    .line 394
    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/Block;->itsUseBeforeDefSet:Ljava/util/BitSet;

    invoke-virtual {v4, v3}, Ljava/util/BitSet;->set(I)V

    goto :goto_2b

    .line 357
    :sswitch_data_7a
    .sparse-switch
        0x37 -> :sswitch_68
        0x38 -> :sswitch_53
        0x6a -> :sswitch_2c
        0x6b -> :sswitch_2c
        0x89 -> :sswitch_15
        0x9c -> :sswitch_53
    .end sparse-switch
.end method

.method private markAnyTypeVariables([I)V
    .registers 4
    .param p1, "varTypes"    # [I

    .prologue
    .line 339
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-eq v0, v1, :cond_13

    .line 340
    iget-object v1, p0, Lorg/mozilla/javascript/optimizer/Block;->itsLiveOnEntrySet:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 341
    const/4 v1, 0x3

    invoke-static {p1, v0, v1}, Lorg/mozilla/javascript/optimizer/Block;->assignType([III)Z

    .line 339
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 345
    :cond_13
    return-void
.end method

.method private static newFatBlock(II)Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    .registers 4
    .param p0, "startNodeIndex"    # I
    .param p1, "endNodeIndex"    # I

    .prologue
    .line 194
    new-instance v0, Lorg/mozilla/javascript/optimizer/Block$FatBlock;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/optimizer/Block$FatBlock;-><init>(Lorg/mozilla/javascript/optimizer/Block$1;)V

    .line 195
    .local v0, "fb":Lorg/mozilla/javascript/optimizer/Block$FatBlock;
    new-instance v1, Lorg/mozilla/javascript/optimizer/Block;

    invoke-direct {v1, p0, p1}, Lorg/mozilla/javascript/optimizer/Block;-><init>(II)V

    iput-object v1, v0, Lorg/mozilla/javascript/optimizer/Block$FatBlock;->realBlock:Lorg/mozilla/javascript/optimizer/Block;

    .line 196
    return-object v0
.end method

.method private printLiveOnEntrySet(Lorg/mozilla/javascript/optimizer/OptFunctionNode;)V
    .registers 2
    .param p1, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;

    .prologue
    .line 634
    return-void
.end method

.method private static reachingDefDataFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[Lorg/mozilla/javascript/optimizer/Block;[I)V
    .registers 14
    .param p0, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p1, "statementNodes"    # [Lorg/mozilla/javascript/Node;
    .param p2, "theBlocks"    # [Lorg/mozilla/javascript/optimizer/Block;
    .param p3, "varTypes"    # [I

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 246
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    array-length v7, p2

    if-ge v1, v7, :cond_e

    .line 247
    aget-object v7, p2, v1

    invoke-direct {v7, p0, p1}, Lorg/mozilla/javascript/optimizer/Block;->initLiveOnEntrySets(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;)V

    .line 246
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 254
    :cond_e
    array-length v7, p2

    new-array v6, v7, [Z

    .line 255
    .local v6, "visit":[Z
    array-length v7, p2

    new-array v0, v7, [Z

    .line 256
    .local v0, "doneOnce":[Z
    array-length v7, p2

    add-int/lit8 v5, v7, -0x1

    .line 257
    .local v5, "vIndex":I
    const/4 v3, 0x0

    .line 258
    .local v3, "needRescan":Z
    aput-boolean v8, v6, v5

    .line 260
    :goto_1a
    aget-boolean v7, v6, v5

    if-nez v7, :cond_22

    aget-boolean v7, v0, v5

    if-nez v7, :cond_47

    .line 261
    :cond_22
    aput-boolean v8, v0, v5

    .line 262
    aput-boolean v9, v6, v5

    .line 263
    aget-object v7, p2, v5

    invoke-direct {v7}, Lorg/mozilla/javascript/optimizer/Block;->doReachedUseDataFlow()Z

    move-result v7

    if-eqz v7, :cond_47

    .line 264
    aget-object v7, p2, v5

    iget-object v4, v7, Lorg/mozilla/javascript/optimizer/Block;->itsPredecessors:[Lorg/mozilla/javascript/optimizer/Block;

    .line 265
    .local v4, "pred":[Lorg/mozilla/javascript/optimizer/Block;
    if-eqz v4, :cond_47

    .line 266
    const/4 v1, 0x0

    :goto_35
    array-length v7, v4

    if-ge v1, v7, :cond_47

    .line 267
    aget-object v7, v4, v1

    iget v2, v7, Lorg/mozilla/javascript/optimizer/Block;->itsBlockID:I

    .line 268
    .local v2, "index":I
    aput-boolean v8, v6, v2

    .line 269
    if-le v2, v5, :cond_45

    move v7, v8

    :goto_41
    or-int/2addr v3, v7

    .line 266
    add-int/lit8 v1, v1, 0x1

    goto :goto_35

    :cond_45
    move v7, v9

    .line 269
    goto :goto_41

    .line 274
    .end local v2    # "index":I
    .end local v4    # "pred":[Lorg/mozilla/javascript/optimizer/Block;
    :cond_47
    if-nez v5, :cond_50

    .line 275
    if-eqz v3, :cond_53

    .line 276
    array-length v7, p2

    add-int/lit8 v5, v7, -0x1

    .line 277
    const/4 v3, 0x0

    goto :goto_1a

    .line 282
    :cond_50
    add-int/lit8 v5, v5, -0x1

    goto :goto_1a

    .line 291
    :cond_53
    aget-object v7, p2, v9

    invoke-direct {v7, p3}, Lorg/mozilla/javascript/optimizer/Block;->markAnyTypeVariables([I)V

    .line 292
    return-void
.end method

.method static runFlowAnalyzes(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;)V
    .registers 9
    .param p0, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p1, "statementNodes"    # [Lorg/mozilla/javascript/Node;

    .prologue
    .line 60
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamCount()I

    move-result v1

    .line 61
    .local v1, "paramCount":I
    iget-object v5, p0, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->fnode:Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v5}, Lorg/mozilla/javascript/ast/FunctionNode;->getParamAndVarCount()I

    move-result v3

    .line 62
    .local v3, "varCount":I
    new-array v4, v3, [I

    .line 64
    .local v4, "varTypes":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    if-eq v0, v1, :cond_17

    .line 65
    const/4 v5, 0x3

    aput v5, v4, v0

    .line 64
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 69
    :cond_17
    move v0, v1

    :goto_18
    if-eq v0, v3, :cond_20

    .line 70
    const/4 v5, 0x0

    aput v5, v4, v0

    .line 69
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 73
    :cond_20
    invoke-static {p1}, Lorg/mozilla/javascript/optimizer/Block;->buildBlocks([Lorg/mozilla/javascript/Node;)[Lorg/mozilla/javascript/optimizer/Block;

    move-result-object v2

    .line 82
    .local v2, "theBlocks":[Lorg/mozilla/javascript/optimizer/Block;
    invoke-static {p0, p1, v2, v4}, Lorg/mozilla/javascript/optimizer/Block;->reachingDefDataFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[Lorg/mozilla/javascript/optimizer/Block;[I)V

    .line 83
    invoke-static {p0, p1, v2, v4}, Lorg/mozilla/javascript/optimizer/Block;->typeFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[Lorg/mozilla/javascript/optimizer/Block;[I)V

    .line 96
    move v0, v1

    :goto_2b
    if-eq v0, v3, :cond_38

    .line 97
    aget v5, v4, v0

    const/4 v6, 0x1

    if-ne v5, v6, :cond_35

    .line 98
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/optimizer/OptFunctionNode;->setIsNumberVar(I)V

    .line 96
    :cond_35
    add-int/lit8 v0, v0, 0x1

    goto :goto_2b

    .line 102
    :cond_38
    return-void
.end method

.method private static toString([Lorg/mozilla/javascript/optimizer/Block;[Lorg/mozilla/javascript/Node;)Ljava/lang/String;
    .registers 3
    .param p0, "blockList"    # [Lorg/mozilla/javascript/optimizer/Block;
    .param p1, "statementNodes"    # [Lorg/mozilla/javascript/Node;

    .prologue
    .line 201
    const/4 v0, 0x0

    return-object v0
.end method

.method private static typeFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[Lorg/mozilla/javascript/optimizer/Block;[I)V
    .registers 14
    .param p0, "fn"    # Lorg/mozilla/javascript/optimizer/OptFunctionNode;
    .param p1, "statementNodes"    # [Lorg/mozilla/javascript/Node;
    .param p2, "theBlocks"    # [Lorg/mozilla/javascript/optimizer/Block;
    .param p3, "varTypes"    # [I

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 297
    array-length v7, p2

    new-array v6, v7, [Z

    .line 298
    .local v6, "visit":[Z
    array-length v7, p2

    new-array v0, v7, [Z

    .line 299
    .local v0, "doneOnce":[Z
    const/4 v5, 0x0

    .line 300
    .local v5, "vIndex":I
    const/4 v3, 0x0

    .line 301
    .local v3, "needRescan":Z
    aput-boolean v8, v6, v5

    .line 303
    :goto_c
    aget-boolean v7, v6, v5

    if-nez v7, :cond_14

    aget-boolean v7, v0, v5

    if-nez v7, :cond_39

    .line 304
    :cond_14
    aput-boolean v8, v0, v5

    .line 305
    aput-boolean v9, v6, v5

    .line 306
    aget-object v7, p2, v5

    invoke-direct {v7, p0, p1, p3}, Lorg/mozilla/javascript/optimizer/Block;->doTypeFlow(Lorg/mozilla/javascript/optimizer/OptFunctionNode;[Lorg/mozilla/javascript/Node;[I)Z

    move-result v7

    if-eqz v7, :cond_39

    .line 308
    aget-object v7, p2, v5

    iget-object v4, v7, Lorg/mozilla/javascript/optimizer/Block;->itsSuccessors:[Lorg/mozilla/javascript/optimizer/Block;

    .line 309
    .local v4, "succ":[Lorg/mozilla/javascript/optimizer/Block;
    if-eqz v4, :cond_39

    .line 310
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_27
    array-length v7, v4

    if-ge v1, v7, :cond_39

    .line 311
    aget-object v7, v4, v1

    iget v2, v7, Lorg/mozilla/javascript/optimizer/Block;->itsBlockID:I

    .line 312
    .local v2, "index":I
    aput-boolean v8, v6, v2

    .line 313
    if-ge v2, v5, :cond_37

    move v7, v8

    :goto_33
    or-int/2addr v3, v7

    .line 310
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    :cond_37
    move v7, v9

    .line 313
    goto :goto_33

    .line 318
    .end local v1    # "i":I
    .end local v2    # "index":I
    .end local v4    # "succ":[Lorg/mozilla/javascript/optimizer/Block;
    :cond_39
    array-length v7, p2

    add-int/lit8 v7, v7, -0x1

    if-ne v5, v7, :cond_43

    .line 319
    if-eqz v3, :cond_46

    .line 320
    const/4 v5, 0x0

    .line 321
    const/4 v3, 0x0

    goto :goto_c

    .line 326
    :cond_43
    add-int/lit8 v5, v5, 0x1

    goto :goto_c

    .line 329
    :cond_46
    return-void
.end method

.method private updateEntrySet(Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;Ljava/util/BitSet;)Z
    .registers 7
    .param p1, "entrySet"    # Ljava/util/BitSet;
    .param p2, "exitSet"    # Ljava/util/BitSet;
    .param p3, "useBeforeDef"    # Ljava/util/BitSet;
    .param p4, "notDef"    # Ljava/util/BitSet;

    .prologue
    .line 446
    invoke-virtual {p1}, Ljava/util/BitSet;->cardinality()I

    move-result v0

    .line 447
    .local v0, "card":I
    invoke-virtual {p1, p2}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 448
    invoke-virtual {p1, p4}, Ljava/util/BitSet;->and(Ljava/util/BitSet;)V

    .line 449
    invoke-virtual {p1, p3}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 450
    invoke-virtual {p1}, Ljava/util/BitSet;->cardinality()I

    move-result v1

    if-eq v1, v0, :cond_15

    const/4 v1, 0x1

    :goto_14
    return v1

    :cond_15
    const/4 v1, 0x0

    goto :goto_14
.end method
