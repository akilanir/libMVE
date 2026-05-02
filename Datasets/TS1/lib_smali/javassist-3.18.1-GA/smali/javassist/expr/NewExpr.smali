.class public Ljavassist/expr/NewExpr;
.super Ljavassist/expr/Expr;
.source "NewExpr.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/expr/NewExpr$ProceedForNew;
    }
.end annotation


# instance fields
.field newPos:I

.field newTypeName:Ljava/lang/String;


# direct methods
.method protected constructor <init>(ILjavassist/bytecode/CodeIterator;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;Ljava/lang/String;I)V
    .registers 7
    .param p1, "pos"    # I
    .param p2, "i"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "declaring"    # Ljavassist/CtClass;
    .param p4, "m"    # Ljavassist/bytecode/MethodInfo;
    .param p5, "type"    # Ljava/lang/String;
    .param p6, "np"    # I

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3, p4}, Ljavassist/expr/Expr;-><init>(ILjavassist/bytecode/CodeIterator;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V

    .line 37
    iput-object p5, p0, Ljavassist/expr/NewExpr;->newTypeName:Ljava/lang/String;

    .line 38
    iput p6, p0, Ljavassist/expr/NewExpr;->newPos:I

    .line 39
    return-void
.end method

.method private canReplace()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 142
    iget-object v1, p0, Ljavassist/expr/NewExpr;->iterator:Ljavassist/bytecode/CodeIterator;

    iget v2, p0, Ljavassist/expr/NewExpr;->newPos:I

    add-int/lit8 v2, v2, 0x3

    invoke-virtual {v1, v2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v0

    .line 143
    .local v0, "op":I
    const/16 v1, 0x59

    if-ne v0, v1, :cond_10

    .line 144
    const/4 v1, 0x4

    .line 149
    :goto_f
    return v1

    .line 145
    :cond_10
    const/16 v1, 0x5a

    if-ne v0, v1, :cond_24

    iget-object v1, p0, Ljavassist/expr/NewExpr;->iterator:Ljavassist/bytecode/CodeIterator;

    iget v2, p0, Ljavassist/expr/NewExpr;->newPos:I

    add-int/lit8 v2, v2, 0x4

    invoke-virtual {v1, v2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v1

    const/16 v2, 0x5f

    if-ne v1, v2, :cond_24

    .line 147
    const/4 v1, 0x5

    goto :goto_f

    .line 149
    :cond_24
    const/4 v1, 0x3

    goto :goto_f
.end method

.method private getCtClass()Ljavassist/CtClass;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 84
    iget-object v0, p0, Ljavassist/expr/NewExpr;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v0

    iget-object v1, p0, Ljavassist/expr/NewExpr;->newTypeName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Ljavassist/expr/NewExpr;->newTypeName:Ljava/lang/String;

    return-object v0
.end method

.method public getConstructor()Ljavassist/CtConstructor;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-virtual {p0}, Ljavassist/expr/NewExpr;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 115
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    iget-object v3, p0, Ljavassist/expr/NewExpr;->iterator:Ljavassist/bytecode/CodeIterator;

    iget v4, p0, Ljavassist/expr/NewExpr;->currentPos:I

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v2

    .line 116
    .local v2, "index":I
    invoke-virtual {v0, v2}, Ljavassist/bytecode/ConstPool;->getMethodrefType(I)Ljava/lang/String;

    move-result-object v1

    .line 117
    .local v1, "desc":Ljava/lang/String;
    invoke-direct {p0}, Ljavassist/expr/NewExpr;->getCtClass()Ljavassist/CtClass;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljavassist/CtClass;->getConstructor(Ljava/lang/String;)Ljavassist/CtConstructor;

    move-result-object v3

    return-object v3
.end method

.method public getFileName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 77
    invoke-super {p0}, Ljavassist/expr/Expr;->getFileName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 68
    invoke-super {p0}, Ljavassist/expr/Expr;->getLineNumber()I

    move-result v0

    return v0
.end method

.method public getSignature()Ljava/lang/String;
    .registers 5

    .prologue
    .line 105
    invoke-virtual {p0}, Ljavassist/expr/NewExpr;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 106
    .local v0, "constPool":Ljavassist/bytecode/ConstPool;
    iget-object v2, p0, Ljavassist/expr/NewExpr;->iterator:Ljavassist/bytecode/CodeIterator;

    iget v3, p0, Ljavassist/expr/NewExpr;->currentPos:I

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v1

    .line 107
    .local v1, "methodIndex":I
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getMethodrefType(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public mayThrow()[Ljavassist/CtClass;
    .registers 2

    .prologue
    .line 127
    invoke-super {p0}, Ljavassist/expr/Expr;->mayThrow()[Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public replace(Ljava/lang/String;)V
    .registers 26
    .param p1, "statement"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 163
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/expr/NewExpr;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v4}, Ljavassist/CtClass;->getClassFile()Ljavassist/bytecode/ClassFile;

    .line 165
    const/4 v10, 0x3

    .line 166
    .local v10, "bytecodeSize":I
    move-object/from16 v0, p0

    iget v0, v0, Ljavassist/expr/NewExpr;->newPos:I

    move/from16 v21, v0

    .line 168
    .local v21, "pos":I
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/expr/NewExpr;->iterator:Ljavassist/bytecode/CodeIterator;

    add-int/lit8 v6, v21, 0x1

    invoke-virtual {v4, v6}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v19

    .line 172
    .local v19, "newIndex":I
    invoke-direct/range {p0 .. p0}, Ljavassist/expr/NewExpr;->canReplace()I

    move-result v12

    .line 173
    .local v12, "codeSize":I
    add-int v16, v21, v12

    .line 174
    .local v16, "end":I
    move/from16 v17, v21

    .local v17, "i":I
    :goto_20
    move/from16 v0, v17

    move/from16 v1, v16

    if-ge v0, v1, :cond_33

    .line 175
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/expr/NewExpr;->iterator:Ljavassist/bytecode/CodeIterator;

    const/4 v6, 0x0

    move/from16 v0, v17

    invoke-virtual {v4, v6, v0}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 174
    add-int/lit8 v17, v17, 0x1

    goto :goto_20

    .line 177
    :cond_33
    invoke-virtual/range {p0 .. p0}, Ljavassist/expr/NewExpr;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v13

    .line 178
    .local v13, "constPool":Ljavassist/bytecode/ConstPool;
    move-object/from16 v0, p0

    iget v0, v0, Ljavassist/expr/NewExpr;->currentPos:I

    move/from16 v21, v0

    .line 179
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/expr/NewExpr;->iterator:Ljavassist/bytecode/CodeIterator;

    add-int/lit8 v6, v21, 0x1

    invoke-virtual {v4, v6}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v18

    .line 181
    .local v18, "methodIndex":I
    move/from16 v0, v18

    invoke-virtual {v13, v0}, Ljavassist/bytecode/ConstPool;->getMethodrefType(I)Ljava/lang/String;

    move-result-object v23

    .line 183
    .local v23, "signature":Ljava/lang/String;
    new-instance v3, Ljavassist/compiler/Javac;

    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/expr/NewExpr;->thisClass:Ljavassist/CtClass;

    invoke-direct {v3, v4}, Ljavassist/compiler/Javac;-><init>(Ljavassist/CtClass;)V

    .line 184
    .local v3, "jc":Ljavassist/compiler/Javac;
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/expr/NewExpr;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v4}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v14

    .line 185
    .local v14, "cp":Ljavassist/ClassPool;
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/expr/NewExpr;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v4}, Ljavassist/bytecode/CodeIterator;->get()Ljavassist/bytecode/CodeAttribute;

    move-result-object v11

    .line 187
    .local v11, "ca":Ljavassist/bytecode/CodeAttribute;
    :try_start_66
    move-object/from16 v0, v23

    invoke-static {v0, v14}, Ljavassist/bytecode/Descriptor;->getParameterTypes(Ljava/lang/String;Ljavassist/ClassPool;)[Ljavassist/CtClass;

    move-result-object v5

    .line 188
    .local v5, "params":[Ljavassist/CtClass;
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/expr/NewExpr;->newTypeName:Ljava/lang/String;

    invoke-virtual {v14, v4}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v20

    .line 189
    .local v20, "newType":Ljavassist/CtClass;
    invoke-virtual {v11}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v7

    .line 190
    .local v7, "paramVar":I
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/expr/NewExpr;->newTypeName:Ljava/lang/String;

    const/4 v6, 0x1

    invoke-virtual/range {p0 .. p0}, Ljavassist/expr/NewExpr;->withinStatic()Z

    move-result v8

    invoke-virtual/range {v3 .. v8}, Ljavassist/compiler/Javac;->recordParams(Ljava/lang/String;[Ljavassist/CtClass;ZIZ)I

    .line 192
    const/4 v4, 0x1

    move-object/from16 v0, v20

    invoke-virtual {v3, v0, v4}, Ljavassist/compiler/Javac;->recordReturnType(Ljavassist/CtClass;Z)I

    move-result v22

    .line 193
    .local v22, "retVar":I
    new-instance v4, Ljavassist/expr/NewExpr$ProceedForNew;

    move-object/from16 v0, v20

    move/from16 v1, v19

    move/from16 v2, v18

    invoke-direct {v4, v0, v1, v2}, Ljavassist/expr/NewExpr$ProceedForNew;-><init>(Ljavassist/CtClass;II)V

    invoke-virtual {v3, v4}, Ljavassist/compiler/Javac;->recordProceed(Ljavassist/compiler/ProceedHandler;)V

    .line 198
    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Ljavassist/expr/NewExpr;->checkResultValue(Ljavassist/CtClass;Ljava/lang/String;)Z

    .line 200
    invoke-virtual {v3}, Ljavassist/compiler/Javac;->getBytecode()Ljavassist/bytecode/Bytecode;

    move-result-object v9

    .line 201
    .local v9, "bytecode":Ljavassist/bytecode/Bytecode;
    const/4 v4, 0x1

    invoke-static {v5, v4, v7, v9}, Ljavassist/expr/NewExpr;->storeStack([Ljavassist/CtClass;ZILjavassist/bytecode/Bytecode;)V

    .line 202
    move/from16 v0, v21

    invoke-virtual {v3, v11, v0}, Ljavassist/compiler/Javac;->recordLocalVariables(Ljavassist/bytecode/CodeAttribute;I)Z

    .line 204
    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Ljavassist/bytecode/Bytecode;->addConstZero(Ljavassist/CtClass;)V

    .line 205
    move/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v9, v0, v1}, Ljavassist/bytecode/Bytecode;->addStore(ILjavassist/CtClass;)I

    .line 207
    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 208
    const/4 v4, 0x3

    if-le v12, v4, :cond_c6

    .line 209
    move/from16 v0, v22

    invoke-virtual {v9, v0}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 211
    :cond_c6
    const/4 v4, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1, v9, v4}, Ljavassist/expr/NewExpr;->replace0(ILjavassist/bytecode/Bytecode;I)V
    :try_end_ce
    .catch Ljavassist/compiler/CompileError; {:try_start_66 .. :try_end_ce} :catch_cf
    .catch Ljavassist/NotFoundException; {:try_start_66 .. :try_end_ce} :catch_d6
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_66 .. :try_end_ce} :catch_dd

    .line 218
    return-void

    .line 213
    .end local v5    # "params":[Ljavassist/CtClass;
    .end local v7    # "paramVar":I
    .end local v9    # "bytecode":Ljavassist/bytecode/Bytecode;
    .end local v20    # "newType":Ljavassist/CtClass;
    .end local v22    # "retVar":I
    :catch_cf
    move-exception v15

    .local v15, "e":Ljavassist/compiler/CompileError;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-direct {v4, v15}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v4

    .line 214
    .end local v15    # "e":Ljavassist/compiler/CompileError;
    :catch_d6
    move-exception v15

    .local v15, "e":Ljavassist/NotFoundException;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-direct {v4, v15}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v4

    .line 215
    .end local v15    # "e":Ljavassist/NotFoundException;
    :catch_dd
    move-exception v15

    .line 216
    .local v15, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v4, Ljavassist/CannotCompileException;

    const-string v6, "broken method"

    invoke-direct {v4, v6}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public where()Ljavassist/CtBehavior;
    .registers 2

    .prologue
    .line 59
    invoke-super {p0}, Ljavassist/expr/Expr;->where()Ljavassist/CtBehavior;

    move-result-object v0

    return-object v0
.end method
