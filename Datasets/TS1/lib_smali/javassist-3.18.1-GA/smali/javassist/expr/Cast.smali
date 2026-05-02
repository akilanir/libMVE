.class public Ljavassist/expr/Cast;
.super Ljavassist/expr/Expr;
.source "Cast.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/expr/Cast$ProceedForCast;
    }
.end annotation


# direct methods
.method protected constructor <init>(ILjavassist/bytecode/CodeIterator;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "i"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "declaring"    # Ljavassist/CtClass;
    .param p4, "m"    # Ljavassist/bytecode/MethodInfo;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Ljavassist/expr/Expr;-><init>(ILjavassist/bytecode/CodeIterator;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V

    .line 33
    return-void
.end method


# virtual methods
.method public getFileName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    invoke-super {p0}, Ljavassist/expr/Expr;->getFileName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 48
    invoke-super {p0}, Ljavassist/expr/Expr;->getLineNumber()I

    move-result v0

    return v0
.end method

.method public getType()Ljavassist/CtClass;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-virtual {p0}, Ljavassist/expr/Cast;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 66
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    iget v3, p0, Ljavassist/expr/Cast;->currentPos:I

    .line 67
    .local v3, "pos":I
    iget-object v4, p0, Ljavassist/expr/Cast;->iterator:Ljavassist/bytecode/CodeIterator;

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v4, v5}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v1

    .line 68
    .local v1, "index":I
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "name":Ljava/lang/String;
    iget-object v4, p0, Ljavassist/expr/Cast;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v4}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljavassist/ClassPool;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v4

    return-object v4
.end method

.method public mayThrow()[Ljavassist/CtClass;
    .registers 2

    .prologue
    .line 79
    invoke-super {p0}, Ljavassist/expr/Expr;->mayThrow()[Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public replace(Ljava/lang/String;)V
    .registers 18
    .param p1, "statement"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 91
    move-object/from16 v0, p0

    iget-object v2, v0, Ljavassist/expr/Cast;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v2}, Ljavassist/CtClass;->getClassFile()Ljavassist/bytecode/ClassFile;

    .line 92
    invoke-virtual/range {p0 .. p0}, Ljavassist/expr/Cast;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v9

    .line 93
    .local v9, "constPool":Ljavassist/bytecode/ConstPool;
    move-object/from16 v0, p0

    iget v13, v0, Ljavassist/expr/Cast;->currentPos:I

    .line 94
    .local v13, "pos":I
    move-object/from16 v0, p0

    iget-object v2, v0, Ljavassist/expr/Cast;->iterator:Ljavassist/bytecode/CodeIterator;

    add-int/lit8 v4, v13, 0x1

    invoke-virtual {v2, v4}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v12

    .line 96
    .local v12, "index":I
    new-instance v1, Ljavassist/compiler/Javac;

    move-object/from16 v0, p0

    iget-object v2, v0, Ljavassist/expr/Cast;->thisClass:Ljavassist/CtClass;

    invoke-direct {v1, v2}, Ljavassist/compiler/Javac;-><init>(Ljavassist/CtClass;)V

    .line 97
    .local v1, "jc":Ljavassist/compiler/Javac;
    move-object/from16 v0, p0

    iget-object v2, v0, Ljavassist/expr/Cast;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v2}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v10

    .line 98
    .local v10, "cp":Ljavassist/ClassPool;
    move-object/from16 v0, p0

    iget-object v2, v0, Ljavassist/expr/Cast;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v2}, Ljavassist/bytecode/CodeIterator;->get()Ljavassist/bytecode/CodeAttribute;

    move-result-object v8

    .line 101
    .local v8, "ca":Ljavassist/bytecode/CodeAttribute;
    const/4 v2, 0x1

    :try_start_33
    new-array v3, v2, [Ljavassist/CtClass;

    const/4 v2, 0x0

    const-string v4, "java.lang.Object"

    invoke-virtual {v10, v4}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v4

    aput-object v4, v3, v2

    .line 103
    .local v3, "params":[Ljavassist/CtClass;
    invoke-virtual/range {p0 .. p0}, Ljavassist/expr/Cast;->getType()Ljavassist/CtClass;

    move-result-object v14

    .line 105
    .local v14, "retType":Ljavassist/CtClass;
    invoke-virtual {v8}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v5

    .line 106
    .local v5, "paramVar":I
    const-string v2, "java.lang.Object"

    const/4 v4, 0x1

    invoke-virtual/range {p0 .. p0}, Ljavassist/expr/Cast;->withinStatic()Z

    move-result v6

    invoke-virtual/range {v1 .. v6}, Ljavassist/compiler/Javac;->recordParams(Ljava/lang/String;[Ljavassist/CtClass;ZIZ)I

    .line 108
    const/4 v2, 0x1

    invoke-virtual {v1, v14, v2}, Ljavassist/compiler/Javac;->recordReturnType(Ljavassist/CtClass;Z)I

    move-result v15

    .line 109
    .local v15, "retVar":I
    new-instance v2, Ljavassist/expr/Cast$ProceedForCast;

    invoke-direct {v2, v12, v14}, Ljavassist/expr/Cast$ProceedForCast;-><init>(ILjavassist/CtClass;)V

    invoke-virtual {v1, v2}, Ljavassist/compiler/Javac;->recordProceed(Ljavassist/compiler/ProceedHandler;)V

    .line 113
    move-object/from16 v0, p1

    invoke-static {v14, v0}, Ljavassist/expr/Cast;->checkResultValue(Ljavassist/CtClass;Ljava/lang/String;)Z

    .line 115
    invoke-virtual {v1}, Ljavassist/compiler/Javac;->getBytecode()Ljavassist/bytecode/Bytecode;

    move-result-object v7

    .line 116
    .local v7, "bytecode":Ljavassist/bytecode/Bytecode;
    const/4 v2, 0x1

    invoke-static {v3, v2, v5, v7}, Ljavassist/expr/Cast;->storeStack([Ljavassist/CtClass;ZILjavassist/bytecode/Bytecode;)V

    .line 117
    invoke-virtual {v1, v8, v13}, Ljavassist/compiler/Javac;->recordLocalVariables(Ljavassist/bytecode/CodeAttribute;I)Z

    .line 119
    invoke-virtual {v7, v14}, Ljavassist/bytecode/Bytecode;->addConstZero(Ljavassist/CtClass;)V

    .line 120
    invoke-virtual {v7, v15, v14}, Ljavassist/bytecode/Bytecode;->addStore(ILjavassist/CtClass;)I

    .line 122
    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 123
    invoke-virtual {v7, v15, v14}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    .line 125
    const/4 v2, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v7, v2}, Ljavassist/expr/Cast;->replace0(ILjavassist/bytecode/Bytecode;I)V
    :try_end_81
    .catch Ljavassist/compiler/CompileError; {:try_start_33 .. :try_end_81} :catch_82
    .catch Ljavassist/NotFoundException; {:try_start_33 .. :try_end_81} :catch_89
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_33 .. :try_end_81} :catch_90

    .line 132
    return-void

    .line 127
    .end local v3    # "params":[Ljavassist/CtClass;
    .end local v5    # "paramVar":I
    .end local v7    # "bytecode":Ljavassist/bytecode/Bytecode;
    .end local v14    # "retType":Ljavassist/CtClass;
    .end local v15    # "retVar":I
    :catch_82
    move-exception v11

    .local v11, "e":Ljavassist/compiler/CompileError;
    new-instance v2, Ljavassist/CannotCompileException;

    invoke-direct {v2, v11}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v2

    .line 128
    .end local v11    # "e":Ljavassist/compiler/CompileError;
    :catch_89
    move-exception v11

    .local v11, "e":Ljavassist/NotFoundException;
    new-instance v2, Ljavassist/CannotCompileException;

    invoke-direct {v2, v11}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v2

    .line 129
    .end local v11    # "e":Ljavassist/NotFoundException;
    :catch_90
    move-exception v11

    .line 130
    .local v11, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v2, Ljavassist/CannotCompileException;

    const-string v4, "broken method"

    invoke-direct {v2, v4}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public where()Ljavassist/CtBehavior;
    .registers 2

    .prologue
    .line 39
    invoke-super {p0}, Ljavassist/expr/Expr;->where()Ljavassist/CtBehavior;

    move-result-object v0

    return-object v0
.end method
