.class public Ljavassist/expr/NewArray;
.super Ljavassist/expr/Expr;
.source "NewArray.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/expr/NewArray$ProceedForArray;
    }
.end annotation


# instance fields
.field opcode:I


# direct methods
.method protected constructor <init>(ILjavassist/bytecode/CodeIterator;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;I)V
    .registers 6
    .param p1, "pos"    # I
    .param p2, "i"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "declaring"    # Ljavassist/CtClass;
    .param p4, "m"    # Ljavassist/bytecode/MethodInfo;
    .param p5, "op"    # I

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3, p4}, Ljavassist/expr/Expr;-><init>(ILjavassist/bytecode/CodeIterator;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V

    .line 36
    iput p5, p0, Ljavassist/expr/NewArray;->opcode:I

    .line 37
    return-void
.end method

.method private replace2(Ljava/lang/String;)V
    .registers 22
    .param p1, "statement"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;,
            Ljavassist/NotFoundException;,
            Ljavassist/bytecode/BadBytecode;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 174
    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/expr/NewArray;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v3}, Ljavassist/CtClass;->getClassFile()Ljavassist/bytecode/ClassFile;

    .line 175
    invoke-virtual/range {p0 .. p0}, Ljavassist/expr/NewArray;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v11

    .line 176
    .local v11, "constPool":Ljavassist/bytecode/ConstPool;
    move-object/from16 v0, p0

    iget v0, v0, Ljavassist/expr/NewArray;->currentPos:I

    move/from16 v17, v0

    .line 179
    .local v17, "pos":I
    const/16 v16, 0x0

    .line 180
    .local v16, "index":I
    const/4 v14, 0x1

    .line 182
    .local v14, "dim":I
    move-object/from16 v0, p0

    iget v3, v0, Ljavassist/expr/NewArray;->opcode:I

    const/16 v5, 0xbc

    if-ne v3, v5, :cond_75

    .line 183
    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/expr/NewArray;->iterator:Ljavassist/bytecode/CodeIterator;

    move-object/from16 v0, p0

    iget v5, v0, Ljavassist/expr/NewArray;->currentPos:I

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    .line 184
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/expr/NewArray;->getPrimitiveType(I)Ljavassist/CtClass;

    move-result-object v12

    check-cast v12, Ljavassist/CtPrimitiveType;

    .line 185
    .local v12, "cpt":Ljavassist/CtPrimitiveType;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "["

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v12}, Ljavassist/CtPrimitiveType;->getDescriptor()C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 186
    .local v13, "desc":Ljava/lang/String;
    const/4 v10, 0x2

    .line 207
    .end local v12    # "cpt":Ljavassist/CtPrimitiveType;
    .local v10, "codeLength":I
    :goto_4c
    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/expr/NewArray;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v3}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v3

    invoke-static {v13, v3}, Ljavassist/bytecode/Descriptor;->toCtClass(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;

    move-result-object v18

    .line 209
    .local v18, "retType":Ljavassist/CtClass;
    new-instance v2, Ljavassist/compiler/Javac;

    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/expr/NewArray;->thisClass:Ljavassist/CtClass;

    invoke-direct {v2, v3}, Ljavassist/compiler/Javac;-><init>(Ljavassist/CtClass;)V

    .line 210
    .local v2, "jc":Ljavassist/compiler/Javac;
    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/expr/NewArray;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->get()Ljavassist/bytecode/CodeAttribute;

    move-result-object v9

    .line 212
    .local v9, "ca":Ljavassist/bytecode/CodeAttribute;
    new-array v4, v14, [Ljavassist/CtClass;

    .line 213
    .local v4, "params":[Ljavassist/CtClass;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_6c
    if-ge v15, v14, :cond_10e

    .line 214
    sget-object v3, Ljavassist/CtClass;->intType:Ljavassist/CtClass;

    aput-object v3, v4, v15

    .line 213
    add-int/lit8 v15, v15, 0x1

    goto :goto_6c

    .line 188
    .end local v2    # "jc":Ljavassist/compiler/Javac;
    .end local v4    # "params":[Ljavassist/CtClass;
    .end local v9    # "ca":Ljavassist/bytecode/CodeAttribute;
    .end local v10    # "codeLength":I
    .end local v13    # "desc":Ljava/lang/String;
    .end local v15    # "i":I
    .end local v18    # "retType":Ljavassist/CtClass;
    :cond_75
    move-object/from16 v0, p0

    iget v3, v0, Ljavassist/expr/NewArray;->opcode:I

    const/16 v5, 0xbd

    if-ne v3, v5, :cond_c4

    .line 189
    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/expr/NewArray;->iterator:Ljavassist/bytecode/CodeIterator;

    add-int/lit8 v5, v17, 0x1

    invoke-virtual {v3, v5}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v16

    .line 190
    move/from16 v0, v16

    invoke-virtual {v11, v0}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v13

    .line 191
    .restart local v13    # "desc":Ljava/lang/String;
    const-string v3, "["

    invoke-virtual {v13, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_aa

    .line 192
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "["

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 196
    :goto_a8
    const/4 v10, 0x3

    .restart local v10    # "codeLength":I
    goto :goto_4c

    .line 194
    .end local v10    # "codeLength":I
    :cond_aa
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[L"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ";"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto :goto_a8

    .line 198
    .end local v13    # "desc":Ljava/lang/String;
    :cond_c4
    move-object/from16 v0, p0

    iget v3, v0, Ljavassist/expr/NewArray;->opcode:I

    const/16 v5, 0xc5

    if-ne v3, v5, :cond_f1

    .line 199
    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/expr/NewArray;->iterator:Ljavassist/bytecode/CodeIterator;

    move-object/from16 v0, p0

    iget v5, v0, Ljavassist/expr/NewArray;->currentPos:I

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3, v5}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v16

    .line 200
    move/from16 v0, v16

    invoke-virtual {v11, v0}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v13

    .line 201
    .restart local v13    # "desc":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Ljavassist/expr/NewArray;->iterator:Ljavassist/bytecode/CodeIterator;

    move-object/from16 v0, p0

    iget v5, v0, Ljavassist/expr/NewArray;->currentPos:I

    add-int/lit8 v5, v5, 0x3

    invoke-virtual {v3, v5}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v14

    .line 202
    const/4 v10, 0x4

    .restart local v10    # "codeLength":I
    goto/16 :goto_4c

    .line 205
    .end local v10    # "codeLength":I
    .end local v13    # "desc":Ljava/lang/String;
    :cond_f1
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "bad opcode: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget v7, v0, Ljavassist/expr/NewArray;->opcode:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 216
    .restart local v2    # "jc":Ljavassist/compiler/Javac;
    .restart local v4    # "params":[Ljavassist/CtClass;
    .restart local v9    # "ca":Ljavassist/bytecode/CodeAttribute;
    .restart local v10    # "codeLength":I
    .restart local v13    # "desc":Ljava/lang/String;
    .restart local v15    # "i":I
    .restart local v18    # "retType":Ljavassist/CtClass;
    :cond_10e
    invoke-virtual {v9}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v6

    .line 217
    .local v6, "paramVar":I
    const-string v3, "java.lang.Object"

    const/4 v5, 0x1

    invoke-virtual/range {p0 .. p0}, Ljavassist/expr/NewArray;->withinStatic()Z

    move-result v7

    invoke-virtual/range {v2 .. v7}, Ljavassist/compiler/Javac;->recordParams(Ljava/lang/String;[Ljavassist/CtClass;ZIZ)I

    .line 222
    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Ljavassist/expr/NewArray;->checkResultValue(Ljavassist/CtClass;Ljava/lang/String;)Z

    .line 223
    const/4 v3, 0x1

    move-object/from16 v0, v18

    invoke-virtual {v2, v0, v3}, Ljavassist/compiler/Javac;->recordReturnType(Ljavassist/CtClass;Z)I

    move-result v19

    .line 224
    .local v19, "retVar":I
    new-instance v3, Ljavassist/expr/NewArray$ProceedForArray;

    move-object/from16 v0, p0

    iget v5, v0, Ljavassist/expr/NewArray;->opcode:I

    move-object/from16 v0, v18

    move/from16 v1, v16

    invoke-direct {v3, v0, v5, v1, v14}, Ljavassist/expr/NewArray$ProceedForArray;-><init>(Ljavassist/CtClass;III)V

    invoke-virtual {v2, v3}, Ljavassist/compiler/Javac;->recordProceed(Ljavassist/compiler/ProceedHandler;)V

    .line 226
    invoke-virtual {v2}, Ljavassist/compiler/Javac;->getBytecode()Ljavassist/bytecode/Bytecode;

    move-result-object v8

    .line 227
    .local v8, "bytecode":Ljavassist/bytecode/Bytecode;
    const/4 v3, 0x1

    invoke-static {v4, v3, v6, v8}, Ljavassist/expr/NewArray;->storeStack([Ljavassist/CtClass;ZILjavassist/bytecode/Bytecode;)V

    .line 228
    move/from16 v0, v17

    invoke-virtual {v2, v9, v0}, Ljavassist/compiler/Javac;->recordLocalVariables(Ljavassist/bytecode/CodeAttribute;I)Z

    .line 230
    const/4 v3, 0x1

    invoke-virtual {v8, v3}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 231
    move/from16 v0, v19

    invoke-virtual {v8, v0}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 233
    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 234
    move/from16 v0, v19

    invoke-virtual {v8, v0}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 236
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1, v8, v10}, Ljavassist/expr/NewArray;->replace0(ILjavassist/bytecode/Bytecode;I)V

    .line 237
    return-void
.end method


# virtual methods
.method public getComponentType()Ljavassist/CtClass;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 81
    iget v4, p0, Ljavassist/expr/NewArray;->opcode:I

    const/16 v5, 0xbc

    if-ne v4, v5, :cond_15

    .line 82
    iget-object v4, p0, Ljavassist/expr/NewArray;->iterator:Ljavassist/bytecode/CodeIterator;

    iget v5, p0, Ljavassist/expr/NewArray;->currentPos:I

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, v5}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v0

    .line 83
    .local v0, "atype":I
    invoke-virtual {p0, v0}, Ljavassist/expr/NewArray;->getPrimitiveType(I)Ljavassist/CtClass;

    move-result-object v4

    .line 91
    .end local v0    # "atype":I
    :goto_14
    return-object v4

    .line 85
    :cond_15
    iget v4, p0, Ljavassist/expr/NewArray;->opcode:I

    const/16 v5, 0xbd

    if-eq v4, v5, :cond_21

    iget v4, p0, Ljavassist/expr/NewArray;->opcode:I

    const/16 v5, 0xc5

    if-ne v4, v5, :cond_46

    .line 87
    :cond_21
    iget-object v4, p0, Ljavassist/expr/NewArray;->iterator:Ljavassist/bytecode/CodeIterator;

    iget v5, p0, Ljavassist/expr/NewArray;->currentPos:I

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, v5}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v3

    .line 88
    .local v3, "index":I
    invoke-virtual {p0}, Ljavassist/expr/NewArray;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v1

    .line 89
    .local v1, "desc":Ljava/lang/String;
    invoke-static {v1}, Ljavassist/bytecode/Descriptor;->arrayDimension(Ljava/lang/String;)I

    move-result v2

    .line 90
    .local v2, "dim":I
    invoke-static {v1, v2}, Ljavassist/bytecode/Descriptor;->toArrayComponent(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 91
    iget-object v4, p0, Ljavassist/expr/NewArray;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v4}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v4

    invoke-static {v1, v4}, Ljavassist/bytecode/Descriptor;->toCtClass(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;

    move-result-object v4

    goto :goto_14

    .line 94
    .end local v1    # "desc":Ljava/lang/String;
    .end local v2    # "dim":I
    .end local v3    # "index":I
    :cond_46
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bad opcode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Ljavassist/expr/NewArray;->opcode:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public getCreatedDimensions()I
    .registers 3

    .prologue
    .line 143
    iget v0, p0, Ljavassist/expr/NewArray;->opcode:I

    const/16 v1, 0xc5

    if-ne v0, v1, :cond_11

    .line 144
    iget-object v0, p0, Ljavassist/expr/NewArray;->iterator:Ljavassist/bytecode/CodeIterator;

    iget v1, p0, Ljavassist/expr/NewArray;->currentPos:I

    add-int/lit8 v1, v1, 0x3

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v0

    .line 146
    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x1

    goto :goto_10
.end method

.method public getDimension()I
    .registers 7

    .prologue
    const/16 v5, 0xbd

    const/4 v2, 0x1

    .line 124
    iget v3, p0, Ljavassist/expr/NewArray;->opcode:I

    const/16 v4, 0xbc

    if-ne v3, v4, :cond_a

    .line 130
    :goto_9
    return v2

    .line 126
    :cond_a
    iget v3, p0, Ljavassist/expr/NewArray;->opcode:I

    if-eq v3, v5, :cond_14

    iget v3, p0, Ljavassist/expr/NewArray;->opcode:I

    const/16 v4, 0xc5

    if-ne v3, v4, :cond_32

    .line 128
    :cond_14
    iget-object v3, p0, Ljavassist/expr/NewArray;->iterator:Ljavassist/bytecode/CodeIterator;

    iget v4, p0, Ljavassist/expr/NewArray;->currentPos:I

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v1

    .line 129
    .local v1, "index":I
    invoke-virtual {p0}, Ljavassist/expr/NewArray;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "desc":Ljava/lang/String;
    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->arrayDimension(Ljava/lang/String;)I

    move-result v3

    iget v4, p0, Ljavassist/expr/NewArray;->opcode:I

    if-ne v4, v5, :cond_30

    :goto_2e
    add-int/2addr v2, v3

    goto :goto_9

    :cond_30
    const/4 v2, 0x0

    goto :goto_2e

    .line 134
    .end local v0    # "desc":Ljava/lang/String;
    .end local v1    # "index":I
    :cond_32
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bad opcode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Ljavassist/expr/NewArray;->opcode:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getFileName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    invoke-super {p0}, Ljavassist/expr/Expr;->getFileName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 52
    invoke-super {p0}, Ljavassist/expr/Expr;->getLineNumber()I

    move-result v0

    return v0
.end method

.method getPrimitiveType(I)Ljavassist/CtClass;
    .registers 5
    .param p1, "atype"    # I

    .prologue
    .line 98
    packed-switch p1, :pswitch_data_34

    .line 116
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bad atype: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 100
    :pswitch_1c
    sget-object v0, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    .line 114
    :goto_1e
    return-object v0

    .line 102
    :pswitch_1f
    sget-object v0, Ljavassist/CtClass;->charType:Ljavassist/CtClass;

    goto :goto_1e

    .line 104
    :pswitch_22
    sget-object v0, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    goto :goto_1e

    .line 106
    :pswitch_25
    sget-object v0, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    goto :goto_1e

    .line 108
    :pswitch_28
    sget-object v0, Ljavassist/CtClass;->byteType:Ljavassist/CtClass;

    goto :goto_1e

    .line 110
    :pswitch_2b
    sget-object v0, Ljavassist/CtClass;->shortType:Ljavassist/CtClass;

    goto :goto_1e

    .line 112
    :pswitch_2e
    sget-object v0, Ljavassist/CtClass;->intType:Ljavassist/CtClass;

    goto :goto_1e

    .line 114
    :pswitch_31
    sget-object v0, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    goto :goto_1e

    .line 98
    :pswitch_data_34
    .packed-switch 0x4
        :pswitch_1c
        :pswitch_1f
        :pswitch_22
        :pswitch_25
        :pswitch_28
        :pswitch_2b
        :pswitch_2e
        :pswitch_31
    .end packed-switch
.end method

.method public mayThrow()[Ljavassist/CtClass;
    .registers 2

    .prologue
    .line 71
    invoke-super {p0}, Ljavassist/expr/Expr;->mayThrow()[Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public replace(Ljava/lang/String;)V
    .registers 5
    .param p1, "statement"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 161
    :try_start_0
    invoke-direct {p0, p1}, Ljavassist/expr/NewArray;->replace2(Ljava/lang/String;)V
    :try_end_3
    .catch Ljavassist/compiler/CompileError; {:try_start_0 .. :try_end_3} :catch_4
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_3} :catch_b
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_0 .. :try_end_3} :catch_12

    .line 168
    return-void

    .line 163
    :catch_4
    move-exception v0

    .local v0, "e":Ljavassist/compiler/CompileError;
    new-instance v1, Ljavassist/CannotCompileException;

    invoke-direct {v1, v0}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v1

    .line 164
    .end local v0    # "e":Ljavassist/compiler/CompileError;
    :catch_b
    move-exception v0

    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljavassist/CannotCompileException;

    invoke-direct {v1, v0}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v1

    .line 165
    .end local v0    # "e":Ljavassist/NotFoundException;
    :catch_12
    move-exception v0

    .line 166
    .local v0, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v1, Ljavassist/CannotCompileException;

    const-string v2, "broken method"

    invoke-direct {v1, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public where()Ljavassist/CtBehavior;
    .registers 2

    .prologue
    .line 43
    invoke-super {p0}, Ljavassist/expr/Expr;->where()Ljavassist/CtBehavior;

    move-result-object v0

    return-object v0
.end method
