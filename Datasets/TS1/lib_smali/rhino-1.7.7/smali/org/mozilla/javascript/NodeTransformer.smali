.class public Lorg/mozilla/javascript/NodeTransformer;
.super Ljava/lang/Object;
.source "NodeTransformer.java"


# instance fields
.field private hasFinally:Z

.field private loopEnds:Lorg/mozilla/javascript/ObjArray;

.field private loops:Lorg/mozilla/javascript/ObjArray;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method private static addBeforeCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    .registers 5
    .param p0, "parent"    # Lorg/mozilla/javascript/Node;
    .param p1, "previous"    # Lorg/mozilla/javascript/Node;
    .param p2, "current"    # Lorg/mozilla/javascript/Node;
    .param p3, "toAdd"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 526
    if-nez p1, :cond_f

    .line 527
    invoke-virtual {p0}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    if-eq p2, v0, :cond_b

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 528
    :cond_b
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/Node;->addChildToFront(Lorg/mozilla/javascript/Node;)V

    .line 533
    :goto_e
    return-object p3

    .line 530
    :cond_f
    invoke-virtual {p1}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v0

    if-eq p2, v0, :cond_18

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 531
    :cond_18
    invoke-virtual {p0, p3, p1}, Lorg/mozilla/javascript/Node;->addChildAfter(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_e
.end method

.method private static replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    .registers 5
    .param p0, "parent"    # Lorg/mozilla/javascript/Node;
    .param p1, "previous"    # Lorg/mozilla/javascript/Node;
    .param p2, "current"    # Lorg/mozilla/javascript/Node;
    .param p3, "replacement"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 539
    if-nez p1, :cond_f

    .line 540
    invoke-virtual {p0}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v0

    if-eq p2, v0, :cond_b

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 541
    :cond_b
    invoke-virtual {p0, p2, p3}, Lorg/mozilla/javascript/Node;->replaceChild(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 549
    :goto_e
    return-object p3

    .line 542
    :cond_f
    iget-object v0, p1, Lorg/mozilla/javascript/Node;->next:Lorg/mozilla/javascript/Node;

    if-ne v0, p2, :cond_17

    .line 545
    invoke-virtual {p0, p1, p3}, Lorg/mozilla/javascript/Node;->replaceChildAfter(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_e

    .line 547
    :cond_17
    invoke-virtual {p0, p2, p3}, Lorg/mozilla/javascript/Node;->replaceChild(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    goto :goto_e
.end method

.method private transformCompilationUnit(Lorg/mozilla/javascript/ast/ScriptNode;)V
    .registers 8
    .param p1, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 43
    new-instance v0, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    .line 44
    new-instance v0, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v0}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    .line 47
    iput-boolean v2, p0, Lorg/mozilla/javascript/NodeTransformer;->hasFinally:Z

    .line 50
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v0

    const/16 v3, 0x6d

    if-ne v0, v3, :cond_23

    move-object v0, p1

    check-cast v0, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/FunctionNode;->requiresActivation()Z

    move-result v0

    if-eqz v0, :cond_40

    :cond_23
    move v4, v1

    .line 52
    .local v4, "createScopeObjects":Z
    :goto_24
    if-nez v4, :cond_42

    move v0, v1

    :goto_27
    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/ast/ScriptNode;->flattenSymbolTable(Z)V

    .line 56
    instance-of v0, p1, Lorg/mozilla/javascript/ast/AstRoot;

    if-eqz v0, :cond_44

    move-object v0, p1

    check-cast v0, Lorg/mozilla/javascript/ast/AstRoot;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstRoot;->isInStrictMode()Z

    move-result v0

    if-eqz v0, :cond_44

    move v5, v1

    .local v5, "inStrictMode":Z
    :goto_38
    move-object v0, p0

    move-object v1, p1

    move-object v2, p1

    move-object v3, p1

    .line 58
    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/NodeTransformer;->transformCompilationUnit_r(Lorg/mozilla/javascript/ast/ScriptNode;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/Scope;ZZ)V

    .line 60
    return-void

    .end local v4    # "createScopeObjects":Z
    .end local v5    # "inStrictMode":Z
    :cond_40
    move v4, v2

    .line 50
    goto :goto_24

    .restart local v4    # "createScopeObjects":Z
    :cond_42
    move v0, v2

    .line 52
    goto :goto_27

    :cond_44
    move v5, v2

    .line 56
    goto :goto_38
.end method

.method private transformCompilationUnit_r(Lorg/mozilla/javascript/ast/ScriptNode;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/Scope;ZZ)V
    .registers 54
    .param p1, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;
    .param p2, "parent"    # Lorg/mozilla/javascript/Node;
    .param p3, "scope"    # Lorg/mozilla/javascript/ast/Scope;
    .param p4, "createScopeObjects"    # Z
    .param p5, "inStrictMode"    # Z

    .prologue
    .line 68
    const/4 v8, 0x0

    .line 71
    .local v8, "node":Lorg/mozilla/javascript/Node;
    :goto_1
    const/16 v40, 0x0

    .line 72
    .local v40, "previous":Lorg/mozilla/javascript/Node;
    if-nez v8, :cond_c

    .line 73
    invoke-virtual/range {p2 .. p2}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 78
    :goto_9
    if-nez v8, :cond_13

    .line 403
    return-void

    .line 75
    :cond_c
    move-object/from16 v40, v8

    .line 76
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v8

    goto :goto_9

    .line 82
    :cond_13
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v45

    .line 83
    .local v45, "type":I
    if-eqz p4, :cond_9e

    const/16 v3, 0x81

    move/from16 v0, v45

    if-eq v0, v3, :cond_2b

    const/16 v3, 0x84

    move/from16 v0, v45

    if-eq v0, v3, :cond_2b

    const/16 v3, 0x9d

    move/from16 v0, v45

    if-ne v0, v3, :cond_9e

    :cond_2b
    instance-of v3, v8, Lorg/mozilla/javascript/ast/Scope;

    if-eqz v3, :cond_9e

    move-object/from16 v36, v8

    .line 88
    check-cast v36, Lorg/mozilla/javascript/ast/Scope;

    .line 89
    .local v36, "newScope":Lorg/mozilla/javascript/ast/Scope;
    invoke-virtual/range {v36 .. v36}, Lorg/mozilla/javascript/ast/Scope;->getSymbolTable()Ljava/util/Map;

    move-result-object v3

    if-eqz v3, :cond_9e

    .line 92
    new-instance v31, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x9d

    move/from16 v0, v45

    if-ne v0, v3, :cond_7e

    const/16 v3, 0x9e

    :goto_43
    move-object/from16 v0, v31

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 94
    .local v31, "let":Lorg/mozilla/javascript/Node;
    new-instance v22, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x99

    move-object/from16 v0, v22

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 95
    .local v22, "innerLet":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v31

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 96
    invoke-virtual/range {v36 .. v36}, Lorg/mozilla/javascript/ast/Scope;->getSymbolTable()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .local v20, "i$":Ljava/util/Iterator;
    :goto_64
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_81

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Ljava/lang/String;

    .line 97
    .local v34, "name":Ljava/lang/String;
    const/16 v3, 0x27

    move-object/from16 v0, v34

    invoke-static {v3, v0}, Lorg/mozilla/javascript/Node;->newString(ILjava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    goto :goto_64

    .line 92
    .end local v20    # "i$":Ljava/util/Iterator;
    .end local v22    # "innerLet":Lorg/mozilla/javascript/Node;
    .end local v31    # "let":Lorg/mozilla/javascript/Node;
    .end local v34    # "name":Ljava/lang/String;
    :cond_7e
    const/16 v3, 0x99

    goto :goto_43

    .line 99
    .restart local v20    # "i$":Ljava/util/Iterator;
    .restart local v22    # "innerLet":Lorg/mozilla/javascript/Node;
    .restart local v31    # "let":Lorg/mozilla/javascript/Node;
    :cond_81
    const/4 v3, 0x0

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/Scope;->setSymbolTable(Ljava/util/Map;)V

    .line 100
    move-object/from16 v38, v8

    .line 101
    .local v38, "oldNode":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v31

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 102
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v45

    .line 103
    move-object/from16 v0, v31

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 107
    .end local v20    # "i$":Ljava/util/Iterator;
    .end local v22    # "innerLet":Lorg/mozilla/javascript/Node;
    .end local v31    # "let":Lorg/mozilla/javascript/Node;
    .end local v36    # "newScope":Lorg/mozilla/javascript/ast/Scope;
    .end local v38    # "oldNode":Lorg/mozilla/javascript/Node;
    :cond_9e
    sparse-switch v45, :sswitch_data_47e

    .line 399
    :cond_a1
    :goto_a1
    instance-of v3, v8, Lorg/mozilla/javascript/ast/Scope;

    if-eqz v3, :cond_479

    move-object v3, v8

    check-cast v3, Lorg/mozilla/javascript/ast/Scope;

    move-object v9, v3

    :goto_a9
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move/from16 v10, p4

    move/from16 v11, p5

    invoke-direct/range {v6 .. v11}, Lorg/mozilla/javascript/NodeTransformer;->transformCompilationUnit_r(Lorg/mozilla/javascript/ast/ScriptNode;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/Scope;ZZ)V

    goto/16 :goto_1

    .line 112
    :sswitch_b6
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3, v8}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    .line 113
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    move-object v3, v8

    check-cast v3, Lorg/mozilla/javascript/ast/Jump;

    iget-object v3, v3, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    invoke-virtual {v4, v3}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    goto :goto_a1

    .line 118
    :sswitch_ca
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3, v8}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    .line 119
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v30

    .line 120
    .local v30, "leave":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v30 .. v30}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_df

    .line 121
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 123
    :cond_df
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v0, v30

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    goto :goto_a1

    .end local v30    # "leave":Lorg/mozilla/javascript/Node;
    :sswitch_e9
    move-object/from16 v27, v8

    .line 129
    check-cast v27, Lorg/mozilla/javascript/ast/Jump;

    .line 130
    .local v27, "jump":Lorg/mozilla/javascript/ast/Jump;
    invoke-virtual/range {v27 .. v27}, Lorg/mozilla/javascript/ast/Jump;->getFinally()Lorg/mozilla/javascript/Node;

    move-result-object v17

    .line 131
    .local v17, "finallytarget":Lorg/mozilla/javascript/Node;
    if-eqz v17, :cond_a1

    .line 132
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lorg/mozilla/javascript/NodeTransformer;->hasFinally:Z

    .line 133
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3, v8}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    .line 134
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    goto :goto_a1

    .line 141
    .end local v17    # "finallytarget":Lorg/mozilla/javascript/Node;
    .end local v27    # "jump":Lorg/mozilla/javascript/ast/Jump;
    :sswitch_109
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_a1

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->peek()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v8, :cond_a1

    .line 142
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loopEnds:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->pop()Ljava/lang/Object;

    .line 143
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->pop()Ljava/lang/Object;

    goto/16 :goto_a1

    :sswitch_12d
    move-object/from16 v3, p1

    .line 148
    check-cast v3, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v3, v8}, Lorg/mozilla/javascript/ast/FunctionNode;->addResumptionPoint(Lorg/mozilla/javascript/Node;)V

    goto/16 :goto_a1

    .line 153
    :sswitch_136
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v3

    const/16 v4, 0x6d

    if-ne v3, v4, :cond_1b8

    move-object/from16 v3, p1

    check-cast v3, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/FunctionNode;->isGenerator()Z

    move-result v3

    if-eqz v3, :cond_1b8

    const/16 v23, 0x1

    .line 155
    .local v23, "isGenerator":Z
    :goto_14a
    if-eqz v23, :cond_152

    .line 156
    const/16 v3, 0x14

    const/4 v4, 0x1

    invoke-virtual {v8, v3, v4}, Lorg/mozilla/javascript/Node;->putIntProp(II)V

    .line 165
    :cond_152
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/mozilla/javascript/NodeTransformer;->hasFinally:Z

    if-eqz v3, :cond_a1

    .line 167
    const/16 v47, 0x0

    .line 168
    .local v47, "unwindBlock":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v3

    add-int/lit8 v19, v3, -0x1

    .local v19, "i":I
    :goto_164
    if-ltz v19, :cond_1c4

    .line 169
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lorg/mozilla/javascript/Node;

    .line 170
    .local v32, "n":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v16

    .line 171
    .local v16, "elemtype":I
    const/16 v3, 0x51

    move/from16 v0, v16

    if-eq v0, v3, :cond_182

    const/16 v3, 0x7b

    move/from16 v0, v16

    if-ne v0, v3, :cond_1b5

    .line 173
    :cond_182
    const/16 v3, 0x51

    move/from16 v0, v16

    if-ne v0, v3, :cond_1bb

    .line 174
    new-instance v25, Lorg/mozilla/javascript/ast/Jump;

    const/16 v3, 0x87

    move-object/from16 v0, v25

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/ast/Jump;-><init>(I)V

    .line 175
    .local v25, "jsrnode":Lorg/mozilla/javascript/ast/Jump;
    check-cast v32, Lorg/mozilla/javascript/ast/Jump;

    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/ast/Jump;->getFinally()Lorg/mozilla/javascript/Node;

    move-result-object v26

    .line 176
    .local v26, "jsrtarget":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v26

    move-object/from16 v1, v25

    iput-object v0, v1, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    .line 177
    move-object/from16 v46, v25

    .line 181
    .end local v25    # "jsrnode":Lorg/mozilla/javascript/ast/Jump;
    .end local v26    # "jsrtarget":Lorg/mozilla/javascript/Node;
    .local v46, "unwind":Lorg/mozilla/javascript/Node;
    :goto_19f
    if-nez v47, :cond_1ae

    .line 182
    new-instance v47, Lorg/mozilla/javascript/Node;

    .end local v47    # "unwindBlock":Lorg/mozilla/javascript/Node;
    const/16 v3, 0x81

    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getLineno()I

    move-result v4

    move-object/from16 v0, v47

    invoke-direct {v0, v3, v4}, Lorg/mozilla/javascript/Node;-><init>(II)V

    .line 185
    .restart local v47    # "unwindBlock":Lorg/mozilla/javascript/Node;
    :cond_1ae
    move-object/from16 v0, v47

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 168
    .end local v46    # "unwind":Lorg/mozilla/javascript/Node;
    :cond_1b5
    add-int/lit8 v19, v19, -0x1

    goto :goto_164

    .line 153
    .end local v16    # "elemtype":I
    .end local v19    # "i":I
    .end local v23    # "isGenerator":Z
    .end local v47    # "unwindBlock":Lorg/mozilla/javascript/Node;
    :cond_1b8
    const/16 v23, 0x0

    goto :goto_14a

    .line 179
    .restart local v16    # "elemtype":I
    .restart local v19    # "i":I
    .restart local v23    # "isGenerator":Z
    .restart local v32    # "n":Lorg/mozilla/javascript/Node;
    .restart local v47    # "unwindBlock":Lorg/mozilla/javascript/Node;
    :cond_1bb
    new-instance v46, Lorg/mozilla/javascript/Node;

    const/4 v3, 0x3

    move-object/from16 v0, v46

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .restart local v46    # "unwind":Lorg/mozilla/javascript/Node;
    goto :goto_19f

    .line 188
    .end local v16    # "elemtype":I
    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    .end local v46    # "unwind":Lorg/mozilla/javascript/Node;
    :cond_1c4
    if-eqz v47, :cond_a1

    .line 189
    move-object/from16 v43, v8

    .line 190
    .local v43, "returnNode":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v43 .. v43}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v42

    .line 191
    .local v42, "returnExpr":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v47

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v37

    .line 192
    .end local v8    # "node":Lorg/mozilla/javascript/Node;
    .local v37, "node":Lorg/mozilla/javascript/Node;
    if-eqz v42, :cond_1da

    if-eqz v23, :cond_1e5

    .line 193
    :cond_1da
    move-object/from16 v0, v47

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    move-object/from16 v8, v37

    .end local v37    # "node":Lorg/mozilla/javascript/Node;
    .restart local v8    # "node":Lorg/mozilla/javascript/Node;
    goto/16 :goto_1

    .line 195
    .end local v8    # "node":Lorg/mozilla/javascript/Node;
    .restart local v37    # "node":Lorg/mozilla/javascript/Node;
    :cond_1e5
    new-instance v5, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x86

    move-object/from16 v0, v42

    invoke-direct {v5, v3, v0}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    .line 196
    .local v5, "store":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v47

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/Node;->addChildToFront(Lorg/mozilla/javascript/Node;)V

    .line 197
    new-instance v43, Lorg/mozilla/javascript/Node;

    .end local v43    # "returnNode":Lorg/mozilla/javascript/Node;
    const/16 v3, 0x40

    move-object/from16 v0, v43

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 198
    .restart local v43    # "returnNode":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v47

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    .line 200
    invoke-direct/range {v3 .. v8}, Lorg/mozilla/javascript/NodeTransformer;->transformCompilationUnit_r(Lorg/mozilla/javascript/ast/ScriptNode;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/Scope;ZZ)V

    move-object/from16 v8, v37

    .line 205
    .end local v37    # "node":Lorg/mozilla/javascript/Node;
    .restart local v8    # "node":Lorg/mozilla/javascript/Node;
    goto/16 :goto_1

    .end local v5    # "store":Lorg/mozilla/javascript/Node;
    .end local v19    # "i":I
    .end local v23    # "isGenerator":Z
    .end local v42    # "returnExpr":Lorg/mozilla/javascript/Node;
    .end local v43    # "returnNode":Lorg/mozilla/javascript/Node;
    .end local v47    # "unwindBlock":Lorg/mozilla/javascript/Node;
    :sswitch_214
    move-object/from16 v27, v8

    .line 213
    check-cast v27, Lorg/mozilla/javascript/ast/Jump;

    .line 214
    .restart local v27    # "jump":Lorg/mozilla/javascript/ast/Jump;
    invoke-virtual/range {v27 .. v27}, Lorg/mozilla/javascript/ast/Jump;->getJumpStatement()Lorg/mozilla/javascript/ast/Jump;

    move-result-object v28

    .line 215
    .local v28, "jumpStatement":Lorg/mozilla/javascript/ast/Jump;
    if-nez v28, :cond_221

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 217
    :cond_221
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v19

    .line 218
    .restart local v19    # "i":I
    :cond_229
    :goto_229
    if-nez v19, :cond_230

    .line 222
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 224
    :cond_230
    add-int/lit8 v19, v19, -0x1

    .line 225
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/mozilla/javascript/NodeTransformer;->loops:Lorg/mozilla/javascript/ObjArray;

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/ObjArray;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lorg/mozilla/javascript/Node;

    .line 226
    .restart local v32    # "n":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v32

    move-object/from16 v1, v28

    if-ne v0, v1, :cond_25a

    .line 244
    const/16 v3, 0x78

    move/from16 v0, v45

    if-ne v0, v3, :cond_29d

    .line 245
    move-object/from16 v0, v28

    iget-object v3, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    move-object/from16 v0, v27

    iput-object v3, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    .line 249
    :goto_252
    const/4 v3, 0x5

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/Jump;->setType(I)Lorg/mozilla/javascript/Node;

    goto/16 :goto_a1

    .line 230
    :cond_25a
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v16

    .line 231
    .restart local v16    # "elemtype":I
    const/16 v3, 0x7b

    move/from16 v0, v16

    if-ne v0, v3, :cond_277

    .line 232
    new-instance v30, Lorg/mozilla/javascript/Node;

    const/4 v3, 0x3

    move-object/from16 v0, v30

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 233
    .restart local v30    # "leave":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v30

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->addBeforeCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v40

    .line 235
    goto :goto_229

    .end local v30    # "leave":Lorg/mozilla/javascript/Node;
    :cond_277
    const/16 v3, 0x51

    move/from16 v0, v16

    if-ne v0, v3, :cond_229

    move-object/from16 v44, v32

    .line 236
    check-cast v44, Lorg/mozilla/javascript/ast/Jump;

    .line 237
    .local v44, "tryNode":Lorg/mozilla/javascript/ast/Jump;
    new-instance v24, Lorg/mozilla/javascript/ast/Jump;

    const/16 v3, 0x87

    move-object/from16 v0, v24

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/ast/Jump;-><init>(I)V

    .line 238
    .local v24, "jsrFinally":Lorg/mozilla/javascript/ast/Jump;
    invoke-virtual/range {v44 .. v44}, Lorg/mozilla/javascript/ast/Jump;->getFinally()Lorg/mozilla/javascript/Node;

    move-result-object v3

    move-object/from16 v0, v24

    iput-object v3, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    .line 239
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v24

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->addBeforeCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v40

    goto :goto_229

    .line 247
    .end local v16    # "elemtype":I
    .end local v24    # "jsrFinally":Lorg/mozilla/javascript/ast/Jump;
    .end local v44    # "tryNode":Lorg/mozilla/javascript/ast/Jump;
    :cond_29d
    invoke-virtual/range {v28 .. v28}, Lorg/mozilla/javascript/ast/Jump;->getContinue()Lorg/mozilla/javascript/Node;

    move-result-object v3

    move-object/from16 v0, v27

    iput-object v3, v0, Lorg/mozilla/javascript/ast/Jump;->target:Lorg/mozilla/javascript/Node;

    goto :goto_252

    .line 255
    .end local v19    # "i":I
    .end local v27    # "jump":Lorg/mozilla/javascript/ast/Jump;
    .end local v28    # "jumpStatement":Lorg/mozilla/javascript/ast/Jump;
    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    :sswitch_2a6
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v8, v1}, Lorg/mozilla/javascript/NodeTransformer;->visitCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V

    goto/16 :goto_a1

    .line 259
    :sswitch_2af
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v8, v1}, Lorg/mozilla/javascript/NodeTransformer;->visitNew(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V

    goto/16 :goto_a1

    .line 264
    :sswitch_2b8
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v12

    .line 265
    .local v12, "child":Lorg/mozilla/javascript/Node;
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x99

    if-ne v3, v4, :cond_2e5

    .line 268
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getType()I

    move-result v3

    const/16 v4, 0x6d

    if-ne v3, v4, :cond_2d6

    move-object/from16 v3, p1

    check-cast v3, Lorg/mozilla/javascript/ast/FunctionNode;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ast/FunctionNode;->requiresActivation()Z

    move-result v3

    if-eqz v3, :cond_2e3

    :cond_2d6
    const/4 v13, 0x1

    .line 270
    .local v13, "createWith":Z
    :goto_2d7
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v40

    invoke-virtual {v0, v13, v1, v2, v8}, Lorg/mozilla/javascript/NodeTransformer;->visitLet(ZLorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 271
    goto/16 :goto_a1

    .line 268
    .end local v13    # "createWith":Z
    :cond_2e3
    const/4 v13, 0x0

    goto :goto_2d7

    .line 280
    .end local v12    # "child":Lorg/mozilla/javascript/Node;
    :cond_2e5
    :sswitch_2e5
    new-instance v41, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x81

    move-object/from16 v0, v41

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 281
    .local v41, "result":Lorg/mozilla/javascript/Node;
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v14

    .local v14, "cursor":Lorg/mozilla/javascript/Node;
    :cond_2f2
    :goto_2f2
    if-eqz v14, :cond_356

    .line 284
    move-object/from16 v32, v14

    .line 285
    .restart local v32    # "n":Lorg/mozilla/javascript/Node;
    invoke-virtual {v14}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v14

    .line 286
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x27

    if-ne v3, v4, :cond_349

    .line 287
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->hasChildren()Z

    move-result v3

    if-eqz v3, :cond_2f2

    .line 289
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v21

    .line 290
    .local v21, "init":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v32

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 291
    const/16 v3, 0x31

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 292
    new-instance v33, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x9a

    move/from16 v0, v45

    if-ne v0, v3, :cond_346

    const/16 v3, 0x9b

    :goto_324
    move-object/from16 v0, v33

    move-object/from16 v1, v32

    move-object/from16 v2, v21

    invoke-direct {v0, v3, v1, v2}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    .local v33, "n":Lorg/mozilla/javascript/Node;
    move-object/from16 v32, v33

    .line 302
    .end local v21    # "init":Lorg/mozilla/javascript/Node;
    .end local v33    # "n":Lorg/mozilla/javascript/Node;
    .restart local v32    # "n":Lorg/mozilla/javascript/Node;
    :cond_32f
    new-instance v39, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x85

    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getLineno()I

    move-result v4

    move-object/from16 v0, v39

    move-object/from16 v1, v32

    invoke-direct {v0, v3, v1, v4}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;I)V

    .line 303
    .local v39, "pop":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, v41

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    goto :goto_2f2

    .line 292
    .end local v39    # "pop":Lorg/mozilla/javascript/Node;
    .restart local v21    # "init":Lorg/mozilla/javascript/Node;
    :cond_346
    const/16 v3, 0x8

    goto :goto_324

    .line 299
    .end local v21    # "init":Lorg/mozilla/javascript/Node;
    :cond_349
    invoke-virtual/range {v32 .. v32}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x9e

    if-eq v3, v4, :cond_32f

    .line 300
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 305
    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    :cond_356
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v41

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 306
    goto/16 :goto_a1

    .line 310
    .end local v14    # "cursor":Lorg/mozilla/javascript/Node;
    .end local v41    # "result":Lorg/mozilla/javascript/Node;
    :sswitch_362
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/Scope;->getDefiningScope(Ljava/lang/String;)Lorg/mozilla/javascript/ast/Scope;

    move-result-object v15

    .line 311
    .local v15, "defining":Lorg/mozilla/javascript/ast/Scope;
    if-eqz v15, :cond_a1

    .line 312
    invoke-virtual {v8, v15}, Lorg/mozilla/javascript/Node;->setScope(Lorg/mozilla/javascript/ast/Scope;)V

    goto/16 :goto_a1

    .line 323
    .end local v15    # "defining":Lorg/mozilla/javascript/ast/Scope;
    :sswitch_373
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v12

    .line 324
    .restart local v12    # "child":Lorg/mozilla/javascript/Node;
    const/4 v3, 0x7

    move/from16 v0, v45

    if-ne v0, v3, :cond_3b7

    .line 325
    :goto_37c
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x1a

    if-ne v3, v4, :cond_389

    .line 326
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v12

    goto :goto_37c

    .line 328
    :cond_389
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0xc

    if-eq v3, v4, :cond_399

    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0xd

    if-ne v3, v4, :cond_3b7

    .line 331
    :cond_399
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v18

    .line 332
    .local v18, "first":Lorg/mozilla/javascript/Node;
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getLastChild()Lorg/mozilla/javascript/Node;

    move-result-object v29

    .line 333
    .local v29, "last":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x27

    if-ne v3, v4, :cond_3c6

    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "undefined"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c6

    .line 335
    move-object/from16 v12, v29

    .line 341
    .end local v18    # "first":Lorg/mozilla/javascript/Node;
    .end local v29    # "last":Lorg/mozilla/javascript/Node;
    :cond_3b7
    :goto_3b7
    invoke-virtual {v12}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x21

    if-ne v3, v4, :cond_a1

    .line 342
    const/16 v3, 0x22

    invoke-virtual {v12, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    goto/16 :goto_a1

    .line 336
    .restart local v18    # "first":Lorg/mozilla/javascript/Node;
    .restart local v29    # "last":Lorg/mozilla/javascript/Node;
    :cond_3c6
    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x27

    if-ne v3, v4, :cond_3b7

    invoke-virtual/range {v29 .. v29}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "undefined"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3b7

    .line 338
    move-object/from16 v12, v18

    goto :goto_3b7

    .line 347
    .end local v12    # "child":Lorg/mozilla/javascript/Node;
    .end local v18    # "first":Lorg/mozilla/javascript/Node;
    .end local v29    # "last":Lorg/mozilla/javascript/Node;
    :sswitch_3dd
    if-eqz p5, :cond_3e4

    .line 348
    const/16 v3, 0x49

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 356
    :cond_3e4
    :sswitch_3e4
    if-nez p4, :cond_a1

    .line 360
    const/16 v3, 0x27

    move/from16 v0, v45

    if-ne v0, v3, :cond_414

    .line 361
    move-object/from16 v35, v8

    .line 371
    .local v35, "nameSource":Lorg/mozilla/javascript/Node;
    :cond_3ee
    invoke-virtual/range {v35 .. v35}, Lorg/mozilla/javascript/Node;->getScope()Lorg/mozilla/javascript/ast/Scope;

    move-result-object v3

    if-nez v3, :cond_a1

    .line 374
    invoke-virtual/range {v35 .. v35}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v34

    .line 375
    .restart local v34    # "name":Ljava/lang/String;
    move-object/from16 v0, p3

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ast/Scope;->getDefiningScope(Ljava/lang/String;)Lorg/mozilla/javascript/ast/Scope;

    move-result-object v15

    .line 376
    .restart local v15    # "defining":Lorg/mozilla/javascript/ast/Scope;
    if-eqz v15, :cond_a1

    .line 377
    move-object/from16 v0, v35

    invoke-virtual {v0, v15}, Lorg/mozilla/javascript/Node;->setScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 378
    const/16 v3, 0x27

    move/from16 v0, v45

    if-ne v0, v3, :cond_42b

    .line 379
    const/16 v3, 0x37

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    goto/16 :goto_a1

    .line 363
    .end local v15    # "defining":Lorg/mozilla/javascript/ast/Scope;
    .end local v34    # "name":Ljava/lang/String;
    .end local v35    # "nameSource":Lorg/mozilla/javascript/Node;
    :cond_414
    invoke-virtual {v8}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v35

    .line 364
    .restart local v35    # "nameSource":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v35 .. v35}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v3

    const/16 v4, 0x31

    if-eq v3, v4, :cond_3ee

    .line 365
    const/16 v3, 0x1f

    move/from16 v0, v45

    if-eq v0, v3, :cond_a1

    .line 368
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 380
    .restart local v15    # "defining":Lorg/mozilla/javascript/ast/Scope;
    .restart local v34    # "name":Ljava/lang/String;
    :cond_42b
    const/16 v3, 0x8

    move/from16 v0, v45

    if-eq v0, v3, :cond_437

    const/16 v3, 0x49

    move/from16 v0, v45

    if-ne v0, v3, :cond_445

    .line 382
    :cond_437
    const/16 v3, 0x38

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 383
    const/16 v3, 0x29

    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    goto/16 :goto_a1

    .line 384
    :cond_445
    const/16 v3, 0x9b

    move/from16 v0, v45

    if-ne v0, v3, :cond_459

    .line 385
    const/16 v3, 0x9c

    invoke-virtual {v8, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 386
    const/16 v3, 0x29

    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    goto/16 :goto_a1

    .line 387
    :cond_459
    const/16 v3, 0x1f

    move/from16 v0, v45

    if-ne v0, v3, :cond_474

    .line 389
    new-instance v32, Lorg/mozilla/javascript/Node;

    const/16 v3, 0x2c

    move-object/from16 v0, v32

    invoke-direct {v0, v3}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 390
    .restart local v32    # "n":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, v40

    move-object/from16 v2, v32

    invoke-static {v0, v1, v8, v2}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v8

    .line 391
    goto/16 :goto_a1

    .line 392
    .end local v32    # "n":Lorg/mozilla/javascript/Node;
    :cond_474
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .end local v15    # "defining":Lorg/mozilla/javascript/ast/Scope;
    .end local v34    # "name":Ljava/lang/String;
    .end local v35    # "nameSource":Lorg/mozilla/javascript/Node;
    :cond_479
    move-object/from16 v9, p3

    .line 399
    goto/16 :goto_a9

    .line 107
    nop

    :sswitch_data_47e
    .sparse-switch
        0x3 -> :sswitch_109
        0x4 -> :sswitch_136
        0x7 -> :sswitch_373
        0x8 -> :sswitch_3dd
        0x1e -> :sswitch_2af
        0x1f -> :sswitch_3e4
        0x20 -> :sswitch_373
        0x26 -> :sswitch_2a6
        0x27 -> :sswitch_3e4
        0x48 -> :sswitch_12d
        0x51 -> :sswitch_e9
        0x72 -> :sswitch_b6
        0x78 -> :sswitch_214
        0x79 -> :sswitch_214
        0x7a -> :sswitch_2e5
        0x7b -> :sswitch_ca
        0x82 -> :sswitch_b6
        0x83 -> :sswitch_109
        0x84 -> :sswitch_b6
        0x89 -> :sswitch_362
        0x99 -> :sswitch_2b8
        0x9a -> :sswitch_2e5
        0x9b -> :sswitch_3e4
        0x9e -> :sswitch_2b8
    .end sparse-switch
.end method


# virtual methods
.method public final transform(Lorg/mozilla/javascript/ast/ScriptNode;)V
    .registers 5
    .param p1, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/NodeTransformer;->transformCompilationUnit(Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 35
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionCount()I

    move-result v2

    if-eq v1, v2, :cond_14

    .line 36
    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/ast/ScriptNode;->getFunctionNode(I)Lorg/mozilla/javascript/ast/FunctionNode;

    move-result-object v0

    .line 37
    .local v0, "fn":Lorg/mozilla/javascript/ast/FunctionNode;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NodeTransformer;->transform(Lorg/mozilla/javascript/ast/ScriptNode;)V

    .line 35
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 39
    .end local v0    # "fn":Lorg/mozilla/javascript/ast/FunctionNode;
    :cond_14
    return-void
.end method

.method protected visitCall(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V
    .registers 3
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 409
    return-void
.end method

.method protected visitLet(ZLorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    .registers 28
    .param p1, "createWith"    # Z
    .param p2, "parent"    # Lorg/mozilla/javascript/Node;
    .param p3, "previous"    # Lorg/mozilla/javascript/Node;
    .param p4, "scopeNode"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 414
    invoke-virtual/range {p4 .. p4}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v18

    .line 415
    .local v18, "vars":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v3

    .line 416
    .local v3, "body":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p4

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 417
    move-object/from16 v0, p4

    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/Node;->removeChild(Lorg/mozilla/javascript/Node;)V

    .line 418
    invoke-virtual/range {p4 .. p4}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v19

    const/16 v20, 0x9e

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_7a

    const/4 v10, 0x1

    .line 421
    .local v10, "isExpression":Z
    :goto_21
    if-eqz p1, :cond_144

    .line 422
    new-instance v14, Lorg/mozilla/javascript/Node;

    if-eqz v10, :cond_7c

    const/16 v19, 0x9f

    :goto_29
    move/from16 v0, v19

    invoke-direct {v14, v0}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 423
    .local v14, "result":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-static {v0, v1, v2, v14}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v14

    .line 424
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 425
    .local v11, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v13, Lorg/mozilla/javascript/Node;

    const/16 v19, 0x42

    move/from16 v0, v19

    invoke-direct {v13, v0}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 426
    .local v13, "objectLiteral":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v17

    .local v17, "v":Lorg/mozilla/javascript/Node;
    move-object v4, v3

    .end local v3    # "body":Lorg/mozilla/javascript/Node;
    .local v4, "body":Lorg/mozilla/javascript/Node;
    :goto_4b
    if-eqz v17, :cond_10d

    .line 427
    move-object/from16 v6, v17

    .line 428
    .local v6, "current":Lorg/mozilla/javascript/Node;
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v19

    const/16 v20, 0x9e

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_29e

    .line 430
    const/16 v19, 0x16

    move/from16 v0, v19

    invoke-virtual {v6, v0}, Lorg/mozilla/javascript/Node;->getProp(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 432
    .local v7, "destructuringNames":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v5

    .line 433
    .local v5, "c":Lorg/mozilla/javascript/Node;
    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v19

    const/16 v20, 0x99

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_7f

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v19

    throw v19

    .line 418
    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .end local v5    # "c":Lorg/mozilla/javascript/Node;
    .end local v6    # "current":Lorg/mozilla/javascript/Node;
    .end local v7    # "destructuringNames":Ljava/util/List;, "Ljava/util/List<*>;"
    .end local v10    # "isExpression":Z
    .end local v11    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v13    # "objectLiteral":Lorg/mozilla/javascript/Node;
    .end local v14    # "result":Lorg/mozilla/javascript/Node;
    .end local v17    # "v":Lorg/mozilla/javascript/Node;
    .restart local v3    # "body":Lorg/mozilla/javascript/Node;
    :cond_7a
    const/4 v10, 0x0

    goto :goto_21

    .line 422
    .restart local v10    # "isExpression":Z
    :cond_7c
    const/16 v19, 0x81

    goto :goto_29

    .line 435
    .end local v3    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v5    # "c":Lorg/mozilla/javascript/Node;
    .restart local v6    # "current":Lorg/mozilla/javascript/Node;
    .restart local v7    # "destructuringNames":Ljava/util/List;, "Ljava/util/List<*>;"
    .restart local v11    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v13    # "objectLiteral":Lorg/mozilla/javascript/Node;
    .restart local v14    # "result":Lorg/mozilla/javascript/Node;
    .restart local v17    # "v":Lorg/mozilla/javascript/Node;
    :cond_7f
    if-eqz v10, :cond_b3

    .line 436
    new-instance v3, Lorg/mozilla/javascript/Node;

    const/16 v19, 0x59

    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v3, v0, v1, v4}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 444
    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v3    # "body":Lorg/mozilla/javascript/Node;
    :goto_90
    if-eqz v7, :cond_ca

    .line 445
    invoke-virtual {v11, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 446
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_96
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v8, v0, :cond_ca

    .line 447
    new-instance v19, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x7e

    const-wide/16 v21, 0x0

    invoke-static/range {v21 .. v22}, Lorg/mozilla/javascript/Node;->newNumber(D)Lorg/mozilla/javascript/Node;

    move-result-object v21

    invoke-direct/range {v19 .. v21}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 446
    add-int/lit8 v8, v8, 0x1

    goto :goto_96

    .line 438
    .end local v3    # "body":Lorg/mozilla/javascript/Node;
    .end local v8    # "i":I
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    :cond_b3
    new-instance v3, Lorg/mozilla/javascript/Node;

    const/16 v19, 0x81

    new-instance v20, Lorg/mozilla/javascript/Node;

    const/16 v21, 0x85

    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v22

    invoke-direct/range {v20 .. v22}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v3, v0, v1, v4}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v3    # "body":Lorg/mozilla/javascript/Node;
    goto :goto_90

    .line 451
    :cond_ca
    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 453
    .end local v5    # "c":Lorg/mozilla/javascript/Node;
    .end local v7    # "destructuringNames":Ljava/util/List;, "Ljava/util/List<*>;"
    :goto_ce
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v19

    const/16 v20, 0x27

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_df

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v19

    throw v19

    .line 454
    :cond_df
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->getIndexObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 455
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v9

    .line 456
    .local v9, "init":Lorg/mozilla/javascript/Node;
    if-nez v9, :cond_103

    .line 457
    new-instance v9, Lorg/mozilla/javascript/Node;

    .end local v9    # "init":Lorg/mozilla/javascript/Node;
    const/16 v19, 0x7e

    const-wide/16 v20, 0x0

    invoke-static/range {v20 .. v21}, Lorg/mozilla/javascript/Node;->newNumber(D)Lorg/mozilla/javascript/Node;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v9, v0, v1}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    .line 459
    .restart local v9    # "init":Lorg/mozilla/javascript/Node;
    :cond_103
    invoke-virtual {v13, v9}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 426
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v17

    move-object v4, v3

    .end local v3    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_4b

    .line 461
    .end local v6    # "current":Lorg/mozilla/javascript/Node;
    .end local v9    # "init":Lorg/mozilla/javascript/Node;
    :cond_10d
    const/16 v19, 0xc

    invoke-virtual {v11}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Lorg/mozilla/javascript/Node;->putProp(ILjava/lang/Object;)V

    .line 462
    new-instance v12, Lorg/mozilla/javascript/Node;

    const/16 v19, 0x2

    move/from16 v0, v19

    invoke-direct {v12, v0, v13}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    .line 463
    .local v12, "newVars":Lorg/mozilla/javascript/Node;
    invoke-virtual {v14, v12}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 464
    new-instance v19, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x7b

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-direct {v0, v1, v4}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 465
    new-instance v19, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x3

    invoke-direct/range {v19 .. v20}, Lorg/mozilla/javascript/Node;-><init>(I)V

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    move-object v3, v4

    .line 520
    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .end local v11    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v13    # "objectLiteral":Lorg/mozilla/javascript/Node;
    .end local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    .restart local v3    # "body":Lorg/mozilla/javascript/Node;
    :goto_143
    return-object v14

    .line 467
    .end local v12    # "newVars":Lorg/mozilla/javascript/Node;
    .end local v14    # "result":Lorg/mozilla/javascript/Node;
    .end local v17    # "v":Lorg/mozilla/javascript/Node;
    .restart local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    :cond_144
    new-instance v14, Lorg/mozilla/javascript/Node;

    if-eqz v10, :cond_18c

    const/16 v19, 0x59

    :goto_14a
    move/from16 v0, v19

    invoke-direct {v14, v0}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 468
    .restart local v14    # "result":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-static {v0, v1, v2, v14}, Lorg/mozilla/javascript/NodeTransformer;->replaceCurrent(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v14

    .line 469
    new-instance v12, Lorg/mozilla/javascript/Node;

    const/16 v19, 0x59

    move/from16 v0, v19

    invoke-direct {v12, v0}, Lorg/mozilla/javascript/Node;-><init>(I)V

    .line 470
    .restart local v12    # "newVars":Lorg/mozilla/javascript/Node;
    invoke-virtual/range {v18 .. v18}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v17

    .restart local v17    # "v":Lorg/mozilla/javascript/Node;
    move-object v4, v3

    .end local v3    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    :goto_167
    if-eqz v17, :cond_21a

    .line 471
    move-object/from16 v6, v17

    .line 472
    .restart local v6    # "current":Lorg/mozilla/javascript/Node;
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v19

    const/16 v20, 0x9e

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_29b

    .line 474
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v5

    .line 475
    .restart local v5    # "c":Lorg/mozilla/javascript/Node;
    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v19

    const/16 v20, 0x99

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_18f

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v19

    throw v19

    .line 467
    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .end local v5    # "c":Lorg/mozilla/javascript/Node;
    .end local v6    # "current":Lorg/mozilla/javascript/Node;
    .end local v12    # "newVars":Lorg/mozilla/javascript/Node;
    .end local v14    # "result":Lorg/mozilla/javascript/Node;
    .end local v17    # "v":Lorg/mozilla/javascript/Node;
    .restart local v3    # "body":Lorg/mozilla/javascript/Node;
    :cond_18c
    const/16 v19, 0x81

    goto :goto_14a

    .line 477
    .end local v3    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v5    # "c":Lorg/mozilla/javascript/Node;
    .restart local v6    # "current":Lorg/mozilla/javascript/Node;
    .restart local v12    # "newVars":Lorg/mozilla/javascript/Node;
    .restart local v14    # "result":Lorg/mozilla/javascript/Node;
    .restart local v17    # "v":Lorg/mozilla/javascript/Node;
    :cond_18f
    if-eqz v10, :cond_1c0

    .line 478
    new-instance v3, Lorg/mozilla/javascript/Node;

    const/16 v19, 0x59

    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v3, v0, v1, v4}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .line 485
    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v3    # "body":Lorg/mozilla/javascript/Node;
    :goto_1a0
    check-cast v6, Lorg/mozilla/javascript/ast/Scope;

    .end local v6    # "current":Lorg/mozilla/javascript/Node;
    move-object/from16 v19, p4

    check-cast v19, Lorg/mozilla/javascript/ast/Scope;

    move-object/from16 v0, v19

    invoke-static {v6, v0}, Lorg/mozilla/javascript/ast/Scope;->joinScopes(Lorg/mozilla/javascript/ast/Scope;Lorg/mozilla/javascript/ast/Scope;)V

    .line 487
    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v6

    .line 489
    .end local v5    # "c":Lorg/mozilla/javascript/Node;
    .restart local v6    # "current":Lorg/mozilla/javascript/Node;
    :goto_1af
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getType()I

    move-result v19

    const/16 v20, 0x27

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_1d7

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v19

    throw v19

    .line 480
    .end local v3    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v5    # "c":Lorg/mozilla/javascript/Node;
    :cond_1c0
    new-instance v3, Lorg/mozilla/javascript/Node;

    const/16 v19, 0x81

    new-instance v20, Lorg/mozilla/javascript/Node;

    const/16 v21, 0x85

    invoke-virtual {v5}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v22

    invoke-direct/range {v20 .. v22}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v3, v0, v1, v4}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v3    # "body":Lorg/mozilla/javascript/Node;
    goto :goto_1a0

    .line 490
    .end local v5    # "c":Lorg/mozilla/javascript/Node;
    :cond_1d7
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/Node;->newString(Ljava/lang/String;)Lorg/mozilla/javascript/Node;

    move-result-object v16

    .local v16, "stringNode":Lorg/mozilla/javascript/Node;
    move-object/from16 v19, p4

    .line 491
    check-cast v19, Lorg/mozilla/javascript/ast/Scope;

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->setScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 492
    invoke-virtual {v6}, Lorg/mozilla/javascript/Node;->getFirstChild()Lorg/mozilla/javascript/Node;

    move-result-object v9

    .line 493
    .restart local v9    # "init":Lorg/mozilla/javascript/Node;
    if-nez v9, :cond_201

    .line 494
    new-instance v9, Lorg/mozilla/javascript/Node;

    .end local v9    # "init":Lorg/mozilla/javascript/Node;
    const/16 v19, 0x7e

    const-wide/16 v20, 0x0

    invoke-static/range {v20 .. v21}, Lorg/mozilla/javascript/Node;->newNumber(D)Lorg/mozilla/javascript/Node;

    move-result-object v20

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v9, v0, v1}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    .line 496
    .restart local v9    # "init":Lorg/mozilla/javascript/Node;
    :cond_201
    new-instance v19, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x38

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2, v9}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;Lorg/mozilla/javascript/Node;)V

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 470
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/Node;->getNext()Lorg/mozilla/javascript/Node;

    move-result-object v17

    move-object v4, v3

    .end local v3    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_167

    .line 498
    .end local v6    # "current":Lorg/mozilla/javascript/Node;
    .end local v9    # "init":Lorg/mozilla/javascript/Node;
    .end local v16    # "stringNode":Lorg/mozilla/javascript/Node;
    :cond_21a
    if-eqz v10, :cond_255

    .line 499
    invoke-virtual {v14, v12}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 500
    const/16 v19, 0x59

    move-object/from16 v0, p4

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 501
    move-object/from16 v0, p4

    invoke-virtual {v14, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 502
    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 503
    instance-of v0, v4, Lorg/mozilla/javascript/ast/Scope;

    move/from16 v19, v0

    if-eqz v19, :cond_298

    move-object/from16 v19, v4

    .line 504
    check-cast v19, Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/ast/Scope;->getParentScope()Lorg/mozilla/javascript/ast/Scope;

    move-result-object v15

    .local v15, "scopeParent":Lorg/mozilla/javascript/ast/Scope;
    move-object/from16 v19, v4

    .line 505
    check-cast v19, Lorg/mozilla/javascript/ast/Scope;

    move-object/from16 v20, p4

    check-cast v20, Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual/range {v19 .. v20}, Lorg/mozilla/javascript/ast/Scope;->setParentScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 506
    check-cast p4, Lorg/mozilla/javascript/ast/Scope;

    .end local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Lorg/mozilla/javascript/ast/Scope;->setParentScope(Lorg/mozilla/javascript/ast/Scope;)V

    move-object v3, v4

    .line 507
    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v3    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_143

    .line 509
    .end local v3    # "body":Lorg/mozilla/javascript/Node;
    .end local v15    # "scopeParent":Lorg/mozilla/javascript/ast/Scope;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    :cond_255
    new-instance v19, Lorg/mozilla/javascript/Node;

    const/16 v20, 0x85

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-direct {v0, v1, v12}, Lorg/mozilla/javascript/Node;-><init>(ILorg/mozilla/javascript/Node;)V

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 510
    const/16 v19, 0x81

    move-object/from16 v0, p4

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Node;->setType(I)Lorg/mozilla/javascript/Node;

    .line 511
    move-object/from16 v0, p4

    invoke-virtual {v14, v0}, Lorg/mozilla/javascript/Node;->addChildToBack(Lorg/mozilla/javascript/Node;)V

    .line 512
    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/Node;->addChildrenToBack(Lorg/mozilla/javascript/Node;)V

    .line 513
    instance-of v0, v4, Lorg/mozilla/javascript/ast/Scope;

    move/from16 v19, v0

    if-eqz v19, :cond_298

    move-object/from16 v19, v4

    .line 514
    check-cast v19, Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual/range {v19 .. v19}, Lorg/mozilla/javascript/ast/Scope;->getParentScope()Lorg/mozilla/javascript/ast/Scope;

    move-result-object v15

    .restart local v15    # "scopeParent":Lorg/mozilla/javascript/ast/Scope;
    move-object/from16 v19, v4

    .line 515
    check-cast v19, Lorg/mozilla/javascript/ast/Scope;

    move-object/from16 v20, p4

    check-cast v20, Lorg/mozilla/javascript/ast/Scope;

    invoke-virtual/range {v19 .. v20}, Lorg/mozilla/javascript/ast/Scope;->setParentScope(Lorg/mozilla/javascript/ast/Scope;)V

    .line 516
    check-cast p4, Lorg/mozilla/javascript/ast/Scope;

    .end local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Lorg/mozilla/javascript/ast/Scope;->setParentScope(Lorg/mozilla/javascript/ast/Scope;)V

    .end local v15    # "scopeParent":Lorg/mozilla/javascript/ast/Scope;
    :cond_298
    move-object v3, v4

    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v3    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_143

    .end local v3    # "body":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v6    # "current":Lorg/mozilla/javascript/Node;
    .restart local p4    # "scopeNode":Lorg/mozilla/javascript/Node;
    :cond_29b
    move-object v3, v4

    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v3    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_1af

    .end local v3    # "body":Lorg/mozilla/javascript/Node;
    .end local v12    # "newVars":Lorg/mozilla/javascript/Node;
    .restart local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v11    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v13    # "objectLiteral":Lorg/mozilla/javascript/Node;
    :cond_29e
    move-object v3, v4

    .end local v4    # "body":Lorg/mozilla/javascript/Node;
    .restart local v3    # "body":Lorg/mozilla/javascript/Node;
    goto/16 :goto_ce
.end method

.method protected visitNew(Lorg/mozilla/javascript/Node;Lorg/mozilla/javascript/ast/ScriptNode;)V
    .registers 3
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;

    .prologue
    .line 406
    return-void
.end method
