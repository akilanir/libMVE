.class public Ljavassist/CodeConverter;
.super Ljava/lang/Object;
.source "CodeConverter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/CodeConverter$DefaultArrayAccessReplacementMethodNames;,
        Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;
    }
.end annotation


# instance fields
.field protected transformers:Ljavassist/convert/Transformer;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    .line 661
    return-void
.end method


# virtual methods
.method protected doit(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/ConstPool;)V
    .registers 15
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .param p3, "cp"    # Ljavassist/bytecode/ConstPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 497
    invoke-virtual {p2}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v1

    .line 498
    .local v1, "codeAttr":Ljavassist/bytecode/CodeAttribute;
    if-eqz v1, :cond_a

    iget-object v9, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    if-nez v9, :cond_b

    .line 543
    :cond_a
    :goto_a
    return-void

    .line 500
    :cond_b
    iget-object v8, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    .local v8, "t":Ljavassist/convert/Transformer;
    :goto_d
    if-eqz v8, :cond_17

    .line 501
    invoke-virtual {v8, p3, p1, p2}, Ljavassist/convert/Transformer;->initialize(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V

    .line 500
    invoke-virtual {v8}, Ljavassist/convert/Transformer;->getNext()Ljavassist/convert/Transformer;

    move-result-object v8

    goto :goto_d

    .line 503
    :cond_17
    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v3

    .line 504
    .local v3, "iterator":Ljavassist/bytecode/CodeIterator;
    :cond_1b
    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_39

    .line 506
    :try_start_21
    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v5

    .line 507
    .local v5, "pos":I
    iget-object v8, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    :goto_27
    if-eqz v8, :cond_1b

    .line 508
    invoke-virtual {v8, p1, v5, v3, p3}, Ljavassist/convert/Transformer;->transform(Ljavassist/CtClass;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/ConstPool;)I

    move-result v5

    .line 507
    invoke-virtual {v8}, Ljavassist/convert/Transformer;->getNext()Ljavassist/convert/Transformer;
    :try_end_30
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_21 .. :try_end_30} :catch_32

    move-result-object v8

    goto :goto_27

    .line 510
    .end local v5    # "pos":I
    :catch_32
    move-exception v2

    .line 511
    .local v2, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v9, Ljavassist/CannotCompileException;

    invoke-direct {v9, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 515
    .end local v2    # "e":Ljavassist/bytecode/BadBytecode;
    :cond_39
    const/4 v4, 0x0

    .line 516
    .local v4, "locals":I
    const/4 v7, 0x0

    .line 517
    .local v7, "stack":I
    iget-object v8, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    :goto_3d
    if-eqz v8, :cond_52

    .line 518
    invoke-virtual {v8}, Ljavassist/convert/Transformer;->extraLocals()I

    move-result v6

    .line 519
    .local v6, "s":I
    if-le v6, v4, :cond_46

    .line 520
    move v4, v6

    .line 522
    :cond_46
    invoke-virtual {v8}, Ljavassist/convert/Transformer;->extraStack()I

    move-result v6

    .line 523
    if-le v6, v7, :cond_4d

    .line 524
    move v7, v6

    .line 517
    :cond_4d
    invoke-virtual {v8}, Ljavassist/convert/Transformer;->getNext()Ljavassist/convert/Transformer;

    move-result-object v8

    goto :goto_3d

    .line 527
    .end local v6    # "s":I
    :cond_52
    iget-object v8, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    :goto_54
    if-eqz v8, :cond_5e

    .line 528
    invoke-virtual {v8}, Ljavassist/convert/Transformer;->clean()V

    .line 527
    invoke-virtual {v8}, Ljavassist/convert/Transformer;->getNext()Ljavassist/convert/Transformer;

    move-result-object v8

    goto :goto_54

    .line 530
    :cond_5e
    if-lez v4, :cond_68

    .line 531
    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v9

    add-int/2addr v9, v4

    invoke-virtual {v1, v9}, Ljavassist/bytecode/CodeAttribute;->setMaxLocals(I)V

    .line 533
    :cond_68
    if-lez v7, :cond_72

    .line 534
    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v9

    add-int/2addr v9, v7

    invoke-virtual {v1, v9}, Ljavassist/bytecode/CodeAttribute;->setMaxStack(I)V

    .line 537
    :cond_72
    :try_start_72
    invoke-virtual {p1}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v9

    invoke-virtual {p1}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v10

    invoke-virtual {p2, v9, v10}, Ljavassist/bytecode/MethodInfo;->rebuildStackMapIf6(Ljavassist/ClassPool;Ljavassist/bytecode/ClassFile;)V
    :try_end_7d
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_72 .. :try_end_7d} :catch_7e

    goto :goto_a

    .line 540
    :catch_7e
    move-exception v0

    .line 541
    .local v0, "b":Ljavassist/bytecode/BadBytecode;
    new-instance v9, Ljavassist/CannotCompileException;

    invoke-virtual {v0}, Ljavassist/bytecode/BadBytecode;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v0}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9
.end method

.method public insertAfterMethod(Ljavassist/CtMethod;Ljavassist/CtMethod;)V
    .registers 6
    .param p1, "origMethod"    # Ljavassist/CtMethod;
    .param p2, "afterMethod"    # Ljavassist/CtMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 482
    :try_start_0
    new-instance v1, Ljavassist/convert/TransformAfter;

    iget-object v2, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    invoke-direct {v1, v2, p1, p2}, Ljavassist/convert/TransformAfter;-><init>(Ljavassist/convert/Transformer;Ljavassist/CtMethod;Ljavassist/CtMethod;)V

    iput-object v1, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;
    :try_end_9
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_9} :catch_a

    .line 488
    return-void

    .line 485
    :catch_a
    move-exception v0

    .line 486
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljavassist/CannotCompileException;

    invoke-direct {v1, v0}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v1
.end method

.method public insertBeforeMethod(Ljavassist/CtMethod;Ljavassist/CtMethod;)V
    .registers 6
    .param p1, "origMethod"    # Ljavassist/CtMethod;
    .param p2, "beforeMethod"    # Ljavassist/CtMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 435
    :try_start_0
    new-instance v1, Ljavassist/convert/TransformBefore;

    iget-object v2, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    invoke-direct {v1, v2, p1, p2}, Ljavassist/convert/TransformBefore;-><init>(Ljavassist/convert/Transformer;Ljavassist/CtMethod;Ljavassist/CtMethod;)V

    iput-object v1, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;
    :try_end_9
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_9} :catch_a

    .line 441
    return-void

    .line 438
    :catch_a
    move-exception v0

    .line 439
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljavassist/CannotCompileException;

    invoke-direct {v1, v0}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v1
.end method

.method public redirectFieldAccess(Ljavassist/CtField;Ljavassist/CtClass;Ljava/lang/String;)V
    .registers 7
    .param p1, "field"    # Ljavassist/CtField;
    .param p2, "newClass"    # Ljavassist/CtClass;
    .param p3, "newFieldname"    # Ljava/lang/String;

    .prologue
    .line 146
    new-instance v0, Ljavassist/convert/TransformFieldAccess;

    iget-object v1, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    invoke-virtual {p2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2, p3}, Ljavassist/convert/TransformFieldAccess;-><init>(Ljavassist/convert/Transformer;Ljavassist/CtField;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    .line 149
    return-void
.end method

.method public redirectMethodCall(Ljava/lang/String;Ljavassist/CtMethod;)V
    .registers 5
    .param p1, "oldMethodName"    # Ljava/lang/String;
    .param p2, "newMethod"    # Ljavassist/CtMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 392
    new-instance v0, Ljavassist/convert/TransformCall;

    iget-object v1, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    invoke-direct {v0, v1, p1, p2}, Ljavassist/convert/TransformCall;-><init>(Ljavassist/convert/Transformer;Ljava/lang/String;Ljavassist/CtMethod;)V

    iput-object v0, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    .line 394
    return-void
.end method

.method public redirectMethodCall(Ljavassist/CtMethod;Ljavassist/CtMethod;)V
    .registers 10
    .param p1, "origMethod"    # Ljavassist/CtMethod;
    .param p2, "substMethod"    # Ljavassist/CtMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 352
    invoke-virtual {p1}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v4

    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 353
    .local v0, "d1":Ljava/lang/String;
    invoke-virtual {p2}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v4

    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v1

    .line 354
    .local v1, "d2":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_33

    .line 355
    new-instance v4, Ljavassist/CannotCompileException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "signature mismatch: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Ljavassist/CtMethod;->getLongName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 358
    :cond_33
    invoke-virtual {p1}, Ljavassist/CtMethod;->getModifiers()I

    move-result v2

    .line 359
    .local v2, "mod1":I
    invoke-virtual {p2}, Ljavassist/CtMethod;->getModifiers()I

    move-result v3

    .line 360
    .local v3, "mod2":I
    invoke-static {v2}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v4

    invoke-static {v3}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v5

    if-ne v4, v5, :cond_63

    invoke-static {v2}, Ljavassist/Modifier;->isPrivate(I)Z

    move-result v4

    if-eqz v4, :cond_51

    invoke-static {v3}, Ljavassist/Modifier;->isPrivate(I)Z

    move-result v4

    if-eqz v4, :cond_63

    :cond_51
    invoke-virtual {p1}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v4

    invoke-virtual {v4}, Ljavassist/CtClass;->isInterface()Z

    move-result v4

    invoke-virtual {p2}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v5

    invoke-virtual {v5}, Ljavassist/CtClass;->isInterface()Z

    move-result v5

    if-eq v4, v5, :cond_80

    .line 364
    :cond_63
    new-instance v4, Ljavassist/CannotCompileException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "invoke-type mismatch "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Ljavassist/CtMethod;->getLongName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 367
    :cond_80
    new-instance v4, Ljavassist/convert/TransformCall;

    iget-object v5, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    invoke-direct {v4, v5, p1, p2}, Ljavassist/convert/TransformCall;-><init>(Ljavassist/convert/Transformer;Ljavassist/CtMethod;Ljavassist/CtMethod;)V

    iput-object v4, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    .line 369
    return-void
.end method

.method public replaceArrayAccess(Ljavassist/CtClass;Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;)V
    .registers 6
    .param p1, "calledClass"    # Ljavassist/CtClass;
    .param p2, "names"    # Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 330
    new-instance v0, Ljavassist/convert/TransformAccessArrayField;

    iget-object v1, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2, p2}, Ljavassist/convert/TransformAccessArrayField;-><init>(Ljavassist/convert/Transformer;Ljava/lang/String;Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;)V

    iput-object v0, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    .line 331
    return-void
.end method

.method public replaceFieldRead(Ljavassist/CtField;Ljavassist/CtClass;Ljava/lang/String;)V
    .registers 7
    .param p1, "field"    # Ljavassist/CtField;
    .param p2, "calledClass"    # Ljavassist/CtClass;
    .param p3, "calledMethod"    # Ljava/lang/String;

    .prologue
    .line 186
    new-instance v0, Ljavassist/convert/TransformReadField;

    iget-object v1, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    invoke-virtual {p2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2, p3}, Ljavassist/convert/TransformReadField;-><init>(Ljavassist/convert/Transformer;Ljavassist/CtField;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    .line 189
    return-void
.end method

.method public replaceFieldWrite(Ljavassist/CtField;Ljavassist/CtClass;Ljava/lang/String;)V
    .registers 7
    .param p1, "field"    # Ljavassist/CtField;
    .param p2, "calledClass"    # Ljavassist/CtClass;
    .param p3, "calledMethod"    # Ljava/lang/String;

    .prologue
    .line 227
    new-instance v0, Ljavassist/convert/TransformWriteField;

    iget-object v1, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    invoke-virtual {p2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2, p3}, Ljavassist/convert/TransformWriteField;-><init>(Ljavassist/convert/Transformer;Ljavassist/CtField;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    .line 230
    return-void
.end method

.method public replaceNew(Ljavassist/CtClass;Ljavassist/CtClass;)V
    .registers 7
    .param p1, "oldClass"    # Ljavassist/CtClass;
    .param p2, "newClass"    # Ljavassist/CtClass;

    .prologue
    .line 123
    new-instance v0, Ljavassist/convert/TransformNewClass;

    iget-object v1, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Ljavassist/convert/TransformNewClass;-><init>(Ljavassist/convert/Transformer;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    .line 125
    return-void
.end method

.method public replaceNew(Ljavassist/CtClass;Ljavassist/CtClass;Ljava/lang/String;)V
    .registers 8
    .param p1, "newClass"    # Ljavassist/CtClass;
    .param p2, "calledClass"    # Ljavassist/CtClass;
    .param p3, "calledMethod"    # Ljava/lang/String;

    .prologue
    .line 97
    new-instance v0, Ljavassist/convert/TransformNew;

    iget-object v1, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3, p3}, Ljavassist/convert/TransformNew;-><init>(Ljavassist/convert/Transformer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Ljavassist/CodeConverter;->transformers:Ljavassist/convert/Transformer;

    .line 99
    return-void
.end method
