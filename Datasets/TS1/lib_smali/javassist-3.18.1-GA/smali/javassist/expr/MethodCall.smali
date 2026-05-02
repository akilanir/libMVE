.class public Ljavassist/expr/MethodCall;
.super Ljavassist/expr/Expr;
.source "MethodCall.java"


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

.method private getNameAndType(Ljavassist/bytecode/ConstPool;)I
    .registers 7
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 36
    iget v2, p0, Ljavassist/expr/MethodCall;->currentPos:I

    .line 37
    .local v2, "pos":I
    iget-object v3, p0, Ljavassist/expr/MethodCall;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v3, v2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v0

    .line 38
    .local v0, "c":I
    iget-object v3, p0, Ljavassist/expr/MethodCall;->iterator:Ljavassist/bytecode/CodeIterator;

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v3, v4}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v1

    .line 40
    .local v1, "index":I
    const/16 v3, 0xb9

    if-ne v0, v3, :cond_19

    .line 41
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->getInterfaceMethodrefNameAndType(I)I

    move-result v3

    .line 43
    :goto_18
    return v3

    :cond_19
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->getMethodrefNameAndType(I)I

    move-result v3

    goto :goto_18
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .registers 8

    .prologue
    .line 86
    invoke-virtual {p0}, Ljavassist/expr/MethodCall;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    .line 87
    .local v2, "cp":Ljavassist/bytecode/ConstPool;
    iget v4, p0, Ljavassist/expr/MethodCall;->currentPos:I

    .line 88
    .local v4, "pos":I
    iget-object v5, p0, Ljavassist/expr/MethodCall;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v5, v4}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v0

    .line 89
    .local v0, "c":I
    iget-object v5, p0, Ljavassist/expr/MethodCall;->iterator:Ljavassist/bytecode/CodeIterator;

    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v5, v6}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v3

    .line 91
    .local v3, "index":I
    const/16 v5, 0xb9

    if-ne v0, v5, :cond_2a

    .line 92
    invoke-virtual {v2, v3}, Ljavassist/bytecode/ConstPool;->getInterfaceMethodrefClassName(I)Ljava/lang/String;

    move-result-object v1

    .line 96
    .local v1, "cname":Ljava/lang/String;
    :goto_1c
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x5b

    if-ne v5, v6, :cond_29

    .line 97
    invoke-static {v1}, Ljavassist/bytecode/Descriptor;->toClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 99
    :cond_29
    return-object v1

    .line 94
    .end local v1    # "cname":Ljava/lang/String;
    :cond_2a
    invoke-virtual {v2, v3}, Ljavassist/bytecode/ConstPool;->getMethodrefClassName(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "cname":Ljava/lang/String;
    goto :goto_1c
.end method

.method protected getCtClass()Ljavassist/CtClass;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 76
    iget-object v0, p0, Ljavassist/expr/MethodCall;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/expr/MethodCall;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    invoke-super {p0}, Ljavassist/expr/Expr;->getFileName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 59
    invoke-super {p0}, Ljavassist/expr/Expr;->getLineNumber()I

    move-result v0

    return v0
.end method

.method public getMethod()Ljavassist/CtMethod;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-virtual {p0}, Ljavassist/expr/MethodCall;->getCtClass()Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/expr/MethodCall;->getMethodName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/expr/MethodCall;->getSignature()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljavassist/CtClass;->getMethod(Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtMethod;

    move-result-object v0

    return-object v0
.end method

.method public getMethodName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 106
    invoke-virtual {p0}, Ljavassist/expr/MethodCall;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 107
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-direct {p0, v0}, Ljavassist/expr/MethodCall;->getNameAndType(Ljavassist/bytecode/ConstPool;)I

    move-result v1

    .line 108
    .local v1, "nt":I
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getNameAndTypeName(I)I

    move-result v2

    invoke-virtual {v0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getSignature()Ljava/lang/String;
    .registers 4

    .prologue
    .line 129
    invoke-virtual {p0}, Ljavassist/expr/MethodCall;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 130
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-direct {p0, v0}, Ljavassist/expr/MethodCall;->getNameAndType(Ljavassist/bytecode/ConstPool;)I

    move-result v1

    .line 131
    .local v1, "nt":I
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getNameAndTypeDescriptor(I)I

    move-result v2

    invoke-virtual {v0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public isSuper()Z
    .registers 3

    .prologue
    .line 149
    iget-object v0, p0, Ljavassist/expr/MethodCall;->iterator:Ljavassist/bytecode/CodeIterator;

    iget v1, p0, Ljavassist/expr/MethodCall;->currentPos:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v0

    const/16 v1, 0xb7

    if-ne v0, v1, :cond_24

    invoke-virtual {p0}, Ljavassist/expr/MethodCall;->where()Ljavassist/CtBehavior;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/CtBehavior;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/expr/MethodCall;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    const/4 v0, 0x1

    :goto_23
    return v0

    :cond_24
    const/4 v0, 0x0

    goto :goto_23
.end method

.method public mayThrow()[Ljavassist/CtClass;
    .registers 2

    .prologue
    .line 141
    invoke-super {p0}, Ljavassist/expr/Expr;->mayThrow()[Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public replace(Ljava/lang/String;)V
    .registers 24
    .param p1, "statement"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 180
    move-object/from16 v0, p0

    iget-object v6, v0, Ljavassist/expr/MethodCall;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v6}, Ljavassist/CtClass;->getClassFile()Ljavassist/bytecode/ClassFile;

    .line 181
    invoke-virtual/range {p0 .. p0}, Ljavassist/expr/MethodCall;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v12

    .line 182
    .local v12, "constPool":Ljavassist/bytecode/ConstPool;
    move-object/from16 v0, p0

    iget v0, v0, Ljavassist/expr/MethodCall;->currentPos:I

    move/from16 v18, v0

    .line 183
    .local v18, "pos":I
    move-object/from16 v0, p0

    iget-object v6, v0, Ljavassist/expr/MethodCall;->iterator:Ljavassist/bytecode/CodeIterator;

    add-int/lit8 v8, v18, 0x1

    invoke-virtual {v6, v8}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v15

    .line 187
    .local v15, "index":I
    move-object/from16 v0, p0

    iget-object v6, v0, Ljavassist/expr/MethodCall;->iterator:Ljavassist/bytecode/CodeIterator;

    move/from16 v0, v18

    invoke-virtual {v6, v0}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v10

    .line 188
    .local v10, "c":I
    const/16 v6, 0xb9

    if-ne v10, v6, :cond_be

    .line 189
    const/16 v17, 0x5

    .line 190
    .local v17, "opcodeSize":I
    invoke-virtual {v12, v15}, Ljavassist/bytecode/ConstPool;->getInterfaceMethodrefClassName(I)Ljava/lang/String;

    move-result-object v4

    .line 191
    .local v4, "classname":Ljava/lang/String;
    invoke-virtual {v12, v15}, Ljavassist/bytecode/ConstPool;->getInterfaceMethodrefName(I)Ljava/lang/String;

    move-result-object v16

    .line 192
    .local v16, "methodname":Ljava/lang/String;
    invoke-virtual {v12, v15}, Ljavassist/bytecode/ConstPool;->getInterfaceMethodrefType(I)Ljava/lang/String;

    move-result-object v21

    .line 204
    .local v21, "signature":Ljava/lang/String;
    :goto_37
    new-instance v3, Ljavassist/compiler/Javac;

    move-object/from16 v0, p0

    iget-object v6, v0, Ljavassist/expr/MethodCall;->thisClass:Ljavassist/CtClass;

    invoke-direct {v3, v6}, Ljavassist/compiler/Javac;-><init>(Ljavassist/CtClass;)V

    .line 205
    .local v3, "jc":Ljavassist/compiler/Javac;
    move-object/from16 v0, p0

    iget-object v6, v0, Ljavassist/expr/MethodCall;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v6}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v13

    .line 206
    .local v13, "cp":Ljavassist/ClassPool;
    move-object/from16 v0, p0

    iget-object v6, v0, Ljavassist/expr/MethodCall;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v6}, Ljavassist/bytecode/CodeIterator;->get()Ljavassist/bytecode/CodeAttribute;

    move-result-object v11

    .line 208
    .local v11, "ca":Ljavassist/bytecode/CodeAttribute;
    :try_start_50
    move-object/from16 v0, v21

    invoke-static {v0, v13}, Ljavassist/bytecode/Descriptor;->getParameterTypes(Ljava/lang/String;Ljavassist/ClassPool;)[Ljavassist/CtClass;

    move-result-object v5

    .line 209
    .local v5, "params":[Ljavassist/CtClass;
    move-object/from16 v0, v21

    invoke-static {v0, v13}, Ljavassist/bytecode/Descriptor;->getReturnType(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;

    move-result-object v19

    .line 210
    .local v19, "retType":Ljavassist/CtClass;
    invoke-virtual {v11}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v7

    .line 211
    .local v7, "paramVar":I
    const/4 v6, 0x1

    invoke-virtual/range {p0 .. p0}, Ljavassist/expr/MethodCall;->withinStatic()Z

    move-result v8

    invoke-virtual/range {v3 .. v8}, Ljavassist/compiler/Javac;->recordParams(Ljava/lang/String;[Ljavassist/CtClass;ZIZ)I

    .line 213
    const/4 v6, 0x1

    move-object/from16 v0, v19

    invoke-virtual {v3, v0, v6}, Ljavassist/compiler/Javac;->recordReturnType(Ljavassist/CtClass;Z)I

    move-result v20

    .line 214
    .local v20, "retVar":I
    const/16 v6, 0xb8

    if-ne v10, v6, :cond_e2

    .line 215
    move-object/from16 v0, v16

    invoke-virtual {v3, v4, v0}, Ljavassist/compiler/Javac;->recordStaticProceed(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    :goto_78
    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Ljavassist/expr/MethodCall;->checkResultValue(Ljavassist/CtClass;Ljava/lang/String;)Z

    .line 226
    invoke-virtual {v3}, Ljavassist/compiler/Javac;->getBytecode()Ljavassist/bytecode/Bytecode;

    move-result-object v9

    .line 227
    .local v9, "bytecode":Ljavassist/bytecode/Bytecode;
    const/16 v6, 0xb8

    if-ne v10, v6, :cond_107

    const/4 v6, 0x1

    :goto_88
    invoke-static {v5, v6, v7, v9}, Ljavassist/expr/MethodCall;->storeStack([Ljavassist/CtClass;ZILjavassist/bytecode/Bytecode;)V

    .line 228
    move/from16 v0, v18

    invoke-virtual {v3, v11, v0}, Ljavassist/compiler/Javac;->recordLocalVariables(Ljavassist/bytecode/CodeAttribute;I)Z

    .line 230
    sget-object v6, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    move-object/from16 v0, v19

    if-eq v0, v6, :cond_a2

    .line 231
    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljavassist/bytecode/Bytecode;->addConstZero(Ljavassist/CtClass;)V

    .line 232
    move/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v9, v0, v1}, Ljavassist/bytecode/Bytecode;->addStore(ILjavassist/CtClass;)I

    .line 235
    :cond_a2
    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 236
    sget-object v6, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    move-object/from16 v0, v19

    if-eq v0, v6, :cond_b4

    .line 237
    move/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v9, v0, v1}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    .line 239
    :cond_b4
    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v17

    invoke-virtual {v0, v1, v9, v2}, Ljavassist/expr/MethodCall;->replace0(ILjavassist/bytecode/Bytecode;I)V
    :try_end_bd
    .catch Ljavassist/compiler/CompileError; {:try_start_50 .. :try_end_bd} :catch_f0
    .catch Ljavassist/NotFoundException; {:try_start_50 .. :try_end_bd} :catch_100
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_50 .. :try_end_bd} :catch_109

    .line 246
    return-void

    .line 194
    .end local v3    # "jc":Ljavassist/compiler/Javac;
    .end local v4    # "classname":Ljava/lang/String;
    .end local v5    # "params":[Ljavassist/CtClass;
    .end local v7    # "paramVar":I
    .end local v9    # "bytecode":Ljavassist/bytecode/Bytecode;
    .end local v11    # "ca":Ljavassist/bytecode/CodeAttribute;
    .end local v13    # "cp":Ljavassist/ClassPool;
    .end local v16    # "methodname":Ljava/lang/String;
    .end local v17    # "opcodeSize":I
    .end local v19    # "retType":Ljavassist/CtClass;
    .end local v20    # "retVar":I
    .end local v21    # "signature":Ljava/lang/String;
    :cond_be
    const/16 v6, 0xb8

    if-eq v10, v6, :cond_ca

    const/16 v6, 0xb7

    if-eq v10, v6, :cond_ca

    const/16 v6, 0xb6

    if-ne v10, v6, :cond_da

    .line 196
    :cond_ca
    const/16 v17, 0x3

    .line 197
    .restart local v17    # "opcodeSize":I
    invoke-virtual {v12, v15}, Ljavassist/bytecode/ConstPool;->getMethodrefClassName(I)Ljava/lang/String;

    move-result-object v4

    .line 198
    .restart local v4    # "classname":Ljava/lang/String;
    invoke-virtual {v12, v15}, Ljavassist/bytecode/ConstPool;->getMethodrefName(I)Ljava/lang/String;

    move-result-object v16

    .line 199
    .restart local v16    # "methodname":Ljava/lang/String;
    invoke-virtual {v12, v15}, Ljavassist/bytecode/ConstPool;->getMethodrefType(I)Ljava/lang/String;

    move-result-object v21

    .restart local v21    # "signature":Ljava/lang/String;
    goto/16 :goto_37

    .line 202
    .end local v4    # "classname":Ljava/lang/String;
    .end local v16    # "methodname":Ljava/lang/String;
    .end local v17    # "opcodeSize":I
    .end local v21    # "signature":Ljava/lang/String;
    :cond_da
    new-instance v6, Ljavassist/CannotCompileException;

    const-string v8, "not method invocation"

    invoke-direct {v6, v8}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 216
    .restart local v3    # "jc":Ljavassist/compiler/Javac;
    .restart local v4    # "classname":Ljava/lang/String;
    .restart local v5    # "params":[Ljavassist/CtClass;
    .restart local v7    # "paramVar":I
    .restart local v11    # "ca":Ljavassist/bytecode/CodeAttribute;
    .restart local v13    # "cp":Ljavassist/ClassPool;
    .restart local v16    # "methodname":Ljava/lang/String;
    .restart local v17    # "opcodeSize":I
    .restart local v19    # "retType":Ljavassist/CtClass;
    .restart local v20    # "retVar":I
    .restart local v21    # "signature":Ljava/lang/String;
    :cond_e2
    const/16 v6, 0xb7

    if-ne v10, v6, :cond_f7

    .line 217
    :try_start_e6
    const-string v6, "$0"

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v3, v6, v4, v0, v1}, Ljavassist/compiler/Javac;->recordSpecialProceed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_ef
    .catch Ljavassist/compiler/CompileError; {:try_start_e6 .. :try_end_ef} :catch_f0
    .catch Ljavassist/NotFoundException; {:try_start_e6 .. :try_end_ef} :catch_100
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_e6 .. :try_end_ef} :catch_109

    goto :goto_78

    .line 241
    .end local v5    # "params":[Ljavassist/CtClass;
    .end local v7    # "paramVar":I
    .end local v19    # "retType":Ljavassist/CtClass;
    .end local v20    # "retVar":I
    :catch_f0
    move-exception v14

    .local v14, "e":Ljavassist/compiler/CompileError;
    new-instance v6, Ljavassist/CannotCompileException;

    invoke-direct {v6, v14}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v6

    .line 220
    .end local v14    # "e":Ljavassist/compiler/CompileError;
    .restart local v5    # "params":[Ljavassist/CtClass;
    .restart local v7    # "paramVar":I
    .restart local v19    # "retType":Ljavassist/CtClass;
    .restart local v20    # "retVar":I
    :cond_f7
    :try_start_f7
    const-string v6, "$0"

    move-object/from16 v0, v16

    invoke-virtual {v3, v6, v0}, Ljavassist/compiler/Javac;->recordProceed(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_fe
    .catch Ljavassist/compiler/CompileError; {:try_start_f7 .. :try_end_fe} :catch_f0
    .catch Ljavassist/NotFoundException; {:try_start_f7 .. :try_end_fe} :catch_100
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_f7 .. :try_end_fe} :catch_109

    goto/16 :goto_78

    .line 242
    .end local v5    # "params":[Ljavassist/CtClass;
    .end local v7    # "paramVar":I
    .end local v19    # "retType":Ljavassist/CtClass;
    .end local v20    # "retVar":I
    :catch_100
    move-exception v14

    .local v14, "e":Ljavassist/NotFoundException;
    new-instance v6, Ljavassist/CannotCompileException;

    invoke-direct {v6, v14}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v6

    .line 227
    .end local v14    # "e":Ljavassist/NotFoundException;
    .restart local v5    # "params":[Ljavassist/CtClass;
    .restart local v7    # "paramVar":I
    .restart local v9    # "bytecode":Ljavassist/bytecode/Bytecode;
    .restart local v19    # "retType":Ljavassist/CtClass;
    .restart local v20    # "retVar":I
    :cond_107
    const/4 v6, 0x0

    goto :goto_88

    .line 243
    .end local v5    # "params":[Ljavassist/CtClass;
    .end local v7    # "paramVar":I
    .end local v9    # "bytecode":Ljavassist/bytecode/Bytecode;
    .end local v19    # "retType":Ljavassist/CtClass;
    .end local v20    # "retVar":I
    :catch_109
    move-exception v14

    .line 244
    .local v14, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v6, Ljavassist/CannotCompileException;

    const-string v8, "broken method"

    invoke-direct {v6, v8}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public where()Ljavassist/CtBehavior;
    .registers 2

    .prologue
    .line 50
    invoke-super {p0}, Ljavassist/expr/Expr;->where()Ljavassist/CtBehavior;

    move-result-object v0

    return-object v0
.end method
