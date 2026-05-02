.class public final Ljavassist/CtConstructor;
.super Ljavassist/CtBehavior;
.source "CtConstructor.java"


# direct methods
.method public constructor <init>(Ljavassist/CtConstructor;Ljavassist/CtClass;Ljavassist/ClassMap;)V
    .registers 5
    .param p1, "src"    # Ljavassist/CtConstructor;
    .param p2, "declaring"    # Ljavassist/CtClass;
    .param p3, "map"    # Ljavassist/ClassMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 101
    const/4 v0, 0x0

    check-cast v0, Ljavassist/bytecode/MethodInfo;

    invoke-direct {p0, v0, p2}, Ljavassist/CtConstructor;-><init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V

    .line 102
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0, p3}, Ljavassist/CtConstructor;->copy(Ljavassist/CtBehavior;ZLjavassist/ClassMap;)V

    .line 103
    return-void
.end method

.method protected constructor <init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V
    .registers 3
    .param p1, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .param p2, "declaring"    # Ljavassist/CtClass;

    .prologue
    .line 38
    invoke-direct {p0, p2, p1}, Ljavassist/CtBehavior;-><init>(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V

    .line 39
    return-void
.end method

.method public constructor <init>([Ljavassist/CtClass;Ljavassist/CtClass;)V
    .registers 7
    .param p1, "parameters"    # [Ljavassist/CtClass;
    .param p2, "declaring"    # Ljavassist/CtClass;

    .prologue
    .line 57
    const/4 v2, 0x0

    check-cast v2, Ljavassist/bytecode/MethodInfo;

    invoke-direct {p0, v2, p2}, Ljavassist/CtConstructor;-><init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V

    .line 58
    invoke-virtual {p2}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v2

    invoke-virtual {v2}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 59
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->ofConstructor([Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "desc":Ljava/lang/String;
    new-instance v2, Ljavassist/bytecode/MethodInfo;

    const-string v3, "<init>"

    invoke-direct {v2, v0, v3, v1}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Ljavassist/CtConstructor;->methodInfo:Ljavassist/bytecode/MethodInfo;

    .line 61
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljavassist/CtConstructor;->setModifiers(I)V

    .line 62
    return-void
.end method

.method private getSuperclassName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 176
    iget-object v1, p0, Ljavassist/CtConstructor;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v1}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v0

    .line 177
    .local v0, "cf":Ljavassist/bytecode/ClassFile;
    invoke-virtual {v0}, Ljavassist/bytecode/ClassFile;->getSuperclass()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static removeConsCall(Ljavassist/bytecode/CodeAttribute;)V
    .registers 12
    .param p0, "ca"    # Ljavassist/bytecode/CodeAttribute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x57

    .line 375
    invoke-virtual {p0}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v3

    .line 377
    .local v3, "iterator":Ljavassist/bytecode/CodeIterator;
    :try_start_6
    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->skipConstructor()I

    move-result v6

    .line 378
    .local v6, "pos":I
    if-ltz v6, :cond_66

    .line 379
    add-int/lit8 v8, v6, 0x1

    invoke-virtual {v3, v8}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v4

    .line 380
    .local v4, "mref":I
    invoke-virtual {p0}, Ljavassist/bytecode/CodeAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljavassist/bytecode/ConstPool;->getMethodrefType(I)Ljava/lang/String;

    move-result-object v0

    .line 381
    .local v0, "desc":Ljava/lang/String;
    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->numOfParameters(Ljava/lang/String;)I

    move-result v8

    add-int/lit8 v5, v8, 0x1

    .line 382
    .local v5, "num":I
    const/4 v8, 0x3

    if-le v5, v8, :cond_67

    .line 383
    add-int/lit8 v8, v5, -0x3

    const/4 v10, 0x0

    invoke-virtual {v3, v6, v8, v10}, Ljavassist/bytecode/CodeIterator;->insertGapAt(IIZ)Ljavassist/bytecode/CodeIterator$Gap;

    move-result-object v8

    iget v6, v8, Ljavassist/bytecode/CodeIterator$Gap;->position:I

    move v7, v6

    .line 385
    .end local v6    # "pos":I
    .local v7, "pos":I
    :goto_2d
    const/16 v8, 0x57

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "pos":I
    .restart local v6    # "pos":I
    invoke-virtual {v3, v8, v7}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 386
    const/4 v8, 0x0

    invoke-virtual {v3, v8, v6}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 387
    const/4 v8, 0x0

    add-int/lit8 v10, v6, 0x1

    invoke-virtual {v3, v8, v10}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 388
    new-instance v2, Ljavassist/bytecode/Descriptor$Iterator;

    invoke-direct {v2, v0}, Ljavassist/bytecode/Descriptor$Iterator;-><init>(Ljava/lang/String;)V

    .local v2, "it":Ljavassist/bytecode/Descriptor$Iterator;
    move v7, v6

    .line 390
    .end local v6    # "pos":I
    .restart local v7    # "pos":I
    :goto_44
    invoke-virtual {v2}, Ljavassist/bytecode/Descriptor$Iterator;->next()I

    .line 391
    invoke-virtual {v2}, Ljavassist/bytecode/Descriptor$Iterator;->isParameter()Z

    move-result v8

    if-eqz v8, :cond_65

    .line 392
    invoke-virtual {v2}, Ljavassist/bytecode/Descriptor$Iterator;->is2byte()Z

    move-result v8

    if-eqz v8, :cond_5c

    const/16 v8, 0x58

    :goto_55
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "pos":I
    .restart local v6    # "pos":I
    invoke-virtual {v3, v8, v7}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V
    :try_end_5a
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_6 .. :try_end_5a} :catch_5e

    move v7, v6

    .end local v6    # "pos":I
    .restart local v7    # "pos":I
    goto :goto_44

    :cond_5c
    move v8, v9

    goto :goto_55

    .line 399
    .end local v0    # "desc":Ljava/lang/String;
    .end local v2    # "it":Ljavassist/bytecode/Descriptor$Iterator;
    .end local v4    # "mref":I
    .end local v5    # "num":I
    .end local v7    # "pos":I
    :catch_5e
    move-exception v1

    .line 400
    .local v1, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v8, Ljavassist/CannotCompileException;

    invoke-direct {v8, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .end local v1    # "e":Ljavassist/bytecode/BadBytecode;
    .restart local v0    # "desc":Ljava/lang/String;
    .restart local v2    # "it":Ljavassist/bytecode/Descriptor$Iterator;
    .restart local v4    # "mref":I
    .restart local v5    # "num":I
    .restart local v7    # "pos":I
    :cond_65
    move v6, v7

    .line 402
    .end local v0    # "desc":Ljava/lang/String;
    .end local v2    # "it":Ljavassist/bytecode/Descriptor$Iterator;
    .end local v4    # "mref":I
    .end local v5    # "num":I
    .end local v7    # "pos":I
    .restart local v6    # "pos":I
    :cond_66
    return-void

    .restart local v0    # "desc":Ljava/lang/String;
    .restart local v4    # "mref":I
    .restart local v5    # "num":I
    :cond_67
    move v7, v6

    .end local v6    # "pos":I
    .restart local v7    # "pos":I
    goto :goto_2d
.end method


# virtual methods
.method public callsSuper()Z
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 186
    iget-object v5, p0, Ljavassist/CtConstructor;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v5}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 187
    .local v0, "codeAttr":Ljavassist/bytecode/CodeAttribute;
    if-eqz v0, :cond_14

    .line 188
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v3

    .line 190
    .local v3, "it":Ljavassist/bytecode/CodeIterator;
    :try_start_d
    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->skipSuperConstructor()I
    :try_end_10
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_d .. :try_end_10} :catch_15

    move-result v2

    .line 191
    .local v2, "index":I
    if-ltz v2, :cond_14

    const/4 v4, 0x1

    .line 198
    .end local v2    # "index":I
    .end local v3    # "it":Ljavassist/bytecode/CodeIterator;
    :cond_14
    return v4

    .line 193
    .restart local v3    # "it":Ljavassist/bytecode/CodeIterator;
    :catch_15
    move-exception v1

    .line 194
    .local v1, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-direct {v4, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public getLongName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/CtConstructor;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v1

    invoke-virtual {v1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/CtConstructor;->isConstructor()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-virtual {p0}, Ljavassist/CtConstructor;->getSignature()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1f
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_28
    const-string v0, ".<clinit>()"

    goto :goto_1f
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Ljavassist/CtConstructor;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->isStaticInitializer()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 139
    const-string v0, "<clinit>"

    .line 141
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Ljavassist/CtConstructor;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method getStartPosOfBody(Ljavassist/bytecode/CodeAttribute;)I
    .registers 5
    .param p1, "ca"    # Ljavassist/bytecode/CodeAttribute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 284
    invoke-virtual {p1}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v0

    .line 286
    .local v0, "ci":Ljavassist/bytecode/CodeIterator;
    :try_start_4
    invoke-virtual {v0}, Ljavassist/bytecode/CodeIterator;->skipConstructor()I

    .line 287
    invoke-virtual {v0}, Ljavassist/bytecode/CodeIterator;->next()I
    :try_end_a
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_4 .. :try_end_a} :catch_c

    move-result v2

    return v2

    .line 289
    :catch_c
    move-exception v1

    .line 290
    .local v1, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v2, Ljavassist/CannotCompileException;

    invoke-direct {v2, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public insertBeforeBody(Ljava/lang/String;)V
    .registers 12
    .param p1, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 248
    iget-object v2, p0, Ljavassist/CtConstructor;->declaringClass:Ljavassist/CtClass;

    .line 249
    .local v2, "cc":Ljavassist/CtClass;
    invoke-virtual {v2}, Ljavassist/CtClass;->checkModify()V

    .line 250
    invoke-virtual {p0}, Ljavassist/CtConstructor;->isClassInitializer()Z

    move-result v7

    if-eqz v7, :cond_13

    .line 251
    new-instance v7, Ljavassist/CannotCompileException;

    const-string v8, "class initializer"

    invoke-direct {v7, v8}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 253
    :cond_13
    iget-object v7, p0, Ljavassist/CtConstructor;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v7}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v1

    .line 254
    .local v1, "ca":Ljavassist/bytecode/CodeAttribute;
    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v4

    .line 255
    .local v4, "iterator":Ljavassist/bytecode/CodeIterator;
    new-instance v0, Ljavassist/bytecode/Bytecode;

    iget-object v7, p0, Ljavassist/CtConstructor;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v7}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v7

    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v8

    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v9

    invoke-direct {v0, v7, v8, v9}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 257
    .local v0, "b":Ljavassist/bytecode/Bytecode;
    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v7

    invoke-virtual {v0, v7}, Ljavassist/bytecode/Bytecode;->setStackDepth(I)V

    .line 258
    new-instance v5, Ljavassist/compiler/Javac;

    invoke-direct {v5, v0, v2}, Ljavassist/compiler/Javac;-><init>(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;)V

    .line 260
    .local v5, "jv":Ljavassist/compiler/Javac;
    :try_start_3c
    invoke-virtual {p0}, Ljavassist/CtConstructor;->getParameterTypes()[Ljavassist/CtClass;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8}, Ljavassist/compiler/Javac;->recordParams([Ljavassist/CtClass;Z)I

    .line 261
    invoke-virtual {v5, p1}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 262
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->getMaxStack()I

    move-result v7

    invoke-virtual {v1, v7}, Ljavassist/bytecode/CodeAttribute;->setMaxStack(I)V

    .line 263
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->getMaxLocals()I

    move-result v7

    invoke-virtual {v1, v7}, Ljavassist/bytecode/CodeAttribute;->setMaxLocals(I)V

    .line 264
    invoke-virtual {v4}, Ljavassist/bytecode/CodeIterator;->skipConstructor()I

    .line 265
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->get()[B

    move-result-object v7

    invoke-virtual {v4, v7}, Ljavassist/bytecode/CodeIterator;->insertEx([B)I

    move-result v6

    .line 266
    .local v6, "pos":I
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v7

    invoke-virtual {v4, v7, v6}, Ljavassist/bytecode/CodeIterator;->insert(Ljavassist/bytecode/ExceptionTable;I)V

    .line 267
    iget-object v7, p0, Ljavassist/CtConstructor;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v2}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v8

    invoke-virtual {v2}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljavassist/bytecode/MethodInfo;->rebuildStackMapIf6(Ljavassist/ClassPool;Ljavassist/bytecode/ClassFile;)V
    :try_end_74
    .catch Ljavassist/NotFoundException; {:try_start_3c .. :try_end_74} :catch_75
    .catch Ljavassist/compiler/CompileError; {:try_start_3c .. :try_end_74} :catch_7c
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_3c .. :try_end_74} :catch_83

    .line 278
    return-void

    .line 269
    .end local v6    # "pos":I
    :catch_75
    move-exception v3

    .line 270
    .local v3, "e":Ljavassist/NotFoundException;
    new-instance v7, Ljavassist/CannotCompileException;

    invoke-direct {v7, v3}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v7

    .line 272
    .end local v3    # "e":Ljavassist/NotFoundException;
    :catch_7c
    move-exception v3

    .line 273
    .local v3, "e":Ljavassist/compiler/CompileError;
    new-instance v7, Ljavassist/CannotCompileException;

    invoke-direct {v7, v3}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v7

    .line 275
    .end local v3    # "e":Ljavassist/compiler/CompileError;
    :catch_83
    move-exception v3

    .line 276
    .local v3, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v7, Ljavassist/CannotCompileException;

    invoke-direct {v7, v3}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v7
.end method

.method public isClassInitializer()Z
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Ljavassist/CtConstructor;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->isStaticInitializer()Z

    move-result v0

    return v0
.end method

.method public isConstructor()Z
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Ljavassist/CtConstructor;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->isConstructor()Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 11

    .prologue
    const/16 v9, 0xb1

    const/4 v6, 0x0

    .line 152
    invoke-virtual {p0}, Ljavassist/CtConstructor;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v7

    invoke-virtual {v7}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 153
    .local v0, "ca":Ljavassist/bytecode/CodeAttribute;
    if-nez v0, :cond_e

    .line 172
    :cond_d
    :goto_d
    return v6

    .line 157
    :cond_e
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v1

    .line 158
    .local v1, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v3

    .line 161
    .local v3, "it":Ljavassist/bytecode/CodeIterator;
    :try_start_16
    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v7

    invoke-virtual {v3, v7}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v4

    .line 162
    .local v4, "op0":I
    if-eq v4, v9, :cond_5c

    const/16 v7, 0x2a

    if-ne v4, v7, :cond_d

    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v5

    .local v5, "pos":I
    invoke-virtual {v3, v5}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v7

    const/16 v8, 0xb7

    if-ne v7, v8, :cond_d

    invoke-direct {p0}, Ljavassist/CtConstructor;->getSuperclassName()Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v8, v5, 0x1

    invoke-virtual {v3, v8}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v8

    invoke-virtual {v1, v7, v8}, Ljavassist/bytecode/ConstPool;->isConstructor(Ljava/lang/String;I)I

    move-result v2

    .local v2, "desc":I
    if-eqz v2, :cond_d

    const-string v7, "()V"

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d

    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v7

    invoke-virtual {v3, v7}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v7

    if-ne v7, v9, :cond_d

    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->hasNext()Z
    :try_end_59
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_16 .. :try_end_59} :catch_5e

    move-result v7

    if-nez v7, :cond_d

    .end local v2    # "desc":I
    .end local v5    # "pos":I
    :cond_5c
    const/4 v6, 0x1

    goto :goto_d

    .line 171
    .end local v4    # "op0":I
    :catch_5e
    move-exception v7

    goto :goto_d
.end method

.method public setBody(Ljava/lang/String;)V
    .registers 3
    .param p1, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 211
    if-nez p1, :cond_a

    .line 212
    invoke-virtual {p0}, Ljavassist/CtConstructor;->isClassInitializer()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 213
    const-string p1, ";"

    .line 217
    :cond_a
    :goto_a
    invoke-super {p0, p1}, Ljavassist/CtBehavior;->setBody(Ljava/lang/String;)V

    .line 218
    return-void

    .line 215
    :cond_e
    const-string p1, "super();"

    goto :goto_a
.end method

.method public setBody(Ljavassist/CtConstructor;Ljavassist/ClassMap;)V
    .registers 7
    .param p1, "src"    # Ljavassist/CtConstructor;
    .param p2, "map"    # Ljavassist/ClassMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 235
    iget-object v0, p1, Ljavassist/CtConstructor;->declaringClass:Ljavassist/CtClass;

    iget-object v1, p1, Ljavassist/CtConstructor;->methodInfo:Ljavassist/bytecode/MethodInfo;

    iget-object v2, p0, Ljavassist/CtConstructor;->declaringClass:Ljavassist/CtClass;

    iget-object v3, p0, Ljavassist/CtConstructor;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-static {v0, v1, v2, v3, p2}, Ljavassist/CtConstructor;->setBody0(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;Ljavassist/ClassMap;)V

    .line 237
    return-void
.end method

.method public toMethod(Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtMethod;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 317
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Ljavassist/CtConstructor;->toMethod(Ljava/lang/String;Ljavassist/CtClass;Ljavassist/ClassMap;)Ljavassist/CtMethod;

    move-result-object v0

    return-object v0
.end method

.method public toMethod(Ljava/lang/String;Ljavassist/CtClass;Ljavassist/ClassMap;)Ljavassist/CtMethod;
    .registers 11
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "declaring"    # Ljavassist/CtClass;
    .param p3, "map"    # Ljavassist/ClassMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 351
    new-instance v2, Ljavassist/CtMethod;

    const/4 v4, 0x0

    invoke-direct {v2, v4, p2}, Ljavassist/CtMethod;-><init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V

    .line 352
    .local v2, "method":Ljavassist/CtMethod;
    const/4 v4, 0x0

    invoke-virtual {v2, p0, v4, p3}, Ljavassist/CtMethod;->copy(Ljavassist/CtBehavior;ZLjavassist/ClassMap;)V

    .line 353
    invoke-virtual {p0}, Ljavassist/CtConstructor;->isConstructor()Z

    move-result v4

    if-eqz v4, :cond_2a

    .line 354
    invoke-virtual {v2}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v3

    .line 355
    .local v3, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v3}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 356
    .local v0, "ca":Ljavassist/bytecode/CodeAttribute;
    if-eqz v0, :cond_2a

    .line 357
    invoke-static {v0}, Ljavassist/CtConstructor;->removeConsCall(Ljavassist/bytecode/CodeAttribute;)V

    .line 359
    :try_start_1d
    iget-object v4, p0, Ljavassist/CtConstructor;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {p2}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v5

    invoke-virtual {p2}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljavassist/bytecode/MethodInfo;->rebuildStackMapIf6(Ljavassist/ClassPool;Ljavassist/bytecode/ClassFile;)V
    :try_end_2a
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_1d .. :try_end_2a} :catch_2e

    .line 368
    .end local v0    # "ca":Ljavassist/bytecode/CodeAttribute;
    .end local v3    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_2a
    invoke-virtual {v2, p1}, Ljavassist/CtMethod;->setName(Ljava/lang/String;)V

    .line 369
    return-object v2

    .line 362
    .restart local v0    # "ca":Ljavassist/bytecode/CodeAttribute;
    .restart local v3    # "minfo":Ljavassist/bytecode/MethodInfo;
    :catch_2e
    move-exception v1

    .line 363
    .local v1, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-direct {v4, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method
