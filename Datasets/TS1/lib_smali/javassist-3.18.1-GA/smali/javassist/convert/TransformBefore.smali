.class public Ljavassist/convert/TransformBefore;
.super Ljavassist/convert/TransformCall;
.source "TransformBefore.java"


# instance fields
.field protected loadCode:[B

.field protected locals:I

.field protected maxLocals:I

.field protected parameterTypes:[Ljavassist/CtClass;

.field protected saveCode:[B


# direct methods
.method public constructor <init>(Ljavassist/convert/Transformer;Ljavassist/CtMethod;Ljavassist/CtMethod;)V
    .registers 6
    .param p1, "next"    # Ljavassist/convert/Transformer;
    .param p2, "origMethod"    # Ljavassist/CtMethod;
    .param p3, "beforeMethod"    # Ljavassist/CtMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Ljavassist/convert/TransformCall;-><init>(Ljavassist/convert/Transformer;Ljavassist/CtMethod;Ljavassist/CtMethod;)V

    .line 37
    invoke-virtual {p2}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformBefore;->methodDescriptor:Ljava/lang/String;

    .line 39
    invoke-virtual {p2}, Ljavassist/CtMethod;->getParameterTypes()[Ljavassist/CtClass;

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformBefore;->parameterTypes:[Ljavassist/CtClass;

    .line 40
    iput v1, p0, Ljavassist/convert/TransformBefore;->locals:I

    .line 41
    iput v1, p0, Ljavassist/convert/TransformBefore;->maxLocals:I

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/convert/TransformBefore;->loadCode:[B

    iput-object v0, p0, Ljavassist/convert/TransformBefore;->saveCode:[B

    .line 43
    return-void
.end method

.method private makeCode2(Ljavassist/bytecode/Bytecode;Ljavassist/bytecode/Bytecode;II[Ljavassist/CtClass;I)V
    .registers 15
    .param p1, "save"    # Ljavassist/bytecode/Bytecode;
    .param p2, "load"    # Ljavassist/bytecode/Bytecode;
    .param p3, "i"    # I
    .param p4, "n"    # I
    .param p5, "paramTypes"    # [Ljavassist/CtClass;
    .param p6, "var"    # I

    .prologue
    .line 100
    if-ge p3, p4, :cond_1a

    .line 101
    aget-object v0, p5, p3

    invoke-virtual {p2, p6, v0}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    move-result v7

    .line 102
    .local v7, "size":I
    add-int/lit8 v3, p3, 0x1

    add-int v6, p6, v7

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Ljavassist/convert/TransformBefore;->makeCode2(Ljavassist/bytecode/Bytecode;Ljavassist/bytecode/Bytecode;II[Ljavassist/CtClass;I)V

    .line 103
    aget-object v0, p5, p3

    invoke-virtual {p1, p6, v0}, Ljavassist/bytecode/Bytecode;->addStore(ILjavassist/CtClass;)I

    .line 107
    .end local v7    # "size":I
    :goto_19
    return-void

    .line 106
    :cond_1a
    iget v0, p0, Ljavassist/convert/TransformBefore;->maxLocals:I

    sub-int v0, p6, v0

    iput v0, p0, Ljavassist/convert/TransformBefore;->locals:I

    goto :goto_19
.end method


# virtual methods
.method public extraLocals()I
    .registers 2

    .prologue
    .line 81
    iget v0, p0, Ljavassist/convert/TransformBefore;->locals:I

    return v0
.end method

.method public initialize(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/CodeAttribute;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "attr"    # Ljavassist/bytecode/CodeAttribute;

    .prologue
    .line 46
    invoke-super {p0, p1, p2}, Ljavassist/convert/TransformCall;->initialize(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/CodeAttribute;)V

    .line 47
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/convert/TransformBefore;->locals:I

    .line 48
    invoke-virtual {p2}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v0

    iput v0, p0, Ljavassist/convert/TransformBefore;->maxLocals:I

    .line 49
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/convert/TransformBefore;->loadCode:[B

    iput-object v0, p0, Ljavassist/convert/TransformBefore;->saveCode:[B

    .line 50
    return-void
.end method

.method protected makeCode([Ljavassist/CtClass;Ljavassist/bytecode/ConstPool;)V
    .registers 11
    .param p1, "paramTypes"    # [Ljavassist/CtClass;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    const/4 v3, 0x0

    .line 84
    new-instance v1, Ljavassist/bytecode/Bytecode;

    invoke-direct {v1, p2, v3, v3}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 85
    .local v1, "save":Ljavassist/bytecode/Bytecode;
    new-instance v2, Ljavassist/bytecode/Bytecode;

    invoke-direct {v2, p2, v3, v3}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 87
    .local v2, "load":Ljavassist/bytecode/Bytecode;
    iget v7, p0, Ljavassist/convert/TransformBefore;->maxLocals:I

    .line 88
    .local v7, "var":I
    if-nez p1, :cond_2a

    move v4, v3

    .line 89
    .local v4, "len":I
    :goto_10
    invoke-virtual {v2, v7}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 90
    add-int/lit8 v6, v7, 0x1

    move-object v0, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v6}, Ljavassist/convert/TransformBefore;->makeCode2(Ljavassist/bytecode/Bytecode;Ljavassist/bytecode/Bytecode;II[Ljavassist/CtClass;I)V

    .line 91
    invoke-virtual {v1, v7}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 93
    invoke-virtual {v1}, Ljavassist/bytecode/Bytecode;->get()[B

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformBefore;->saveCode:[B

    .line 94
    invoke-virtual {v2}, Ljavassist/bytecode/Bytecode;->get()[B

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformBefore;->loadCode:[B

    .line 95
    return-void

    .line 88
    .end local v4    # "len":I
    :cond_2a
    array-length v4, p1

    goto :goto_10
.end method

.method protected match(IILjavassist/bytecode/CodeIterator;ILjavassist/bytecode/ConstPool;)I
    .registers 11
    .param p1, "c"    # I
    .param p2, "pos"    # I
    .param p3, "iterator"    # Ljavassist/bytecode/CodeIterator;
    .param p4, "typedesc"    # I
    .param p5, "cp"    # Ljavassist/bytecode/ConstPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 55
    iget v3, p0, Ljavassist/convert/TransformBefore;->newIndex:I

    if-nez v3, :cond_37

    .line 56
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Ljavassist/convert/TransformBefore;->parameterTypes:[Ljavassist/CtClass;

    invoke-static {v4}, Ljavassist/bytecode/Descriptor;->ofParameters([Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x56

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 57
    .local v1, "desc":Ljava/lang/String;
    iget-object v3, p0, Ljavassist/convert/TransformBefore;->classname:Ljava/lang/String;

    invoke-static {v3, v1}, Ljavassist/bytecode/Descriptor;->insertParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 58
    iget-object v3, p0, Ljavassist/convert/TransformBefore;->newMethodname:Ljava/lang/String;

    invoke-virtual {p5, v3, v1}, Ljavassist/bytecode/ConstPool;->addNameAndTypeInfo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 59
    .local v2, "nt":I
    iget-object v3, p0, Ljavassist/convert/TransformBefore;->newClassname:Ljava/lang/String;

    invoke-virtual {p5, v3}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    .line 60
    .local v0, "ci":I
    invoke-virtual {p5, v0, v2}, Ljavassist/bytecode/ConstPool;->addMethodrefInfo(II)I

    move-result v3

    iput v3, p0, Ljavassist/convert/TransformBefore;->newIndex:I

    .line 61
    iput-object p5, p0, Ljavassist/convert/TransformBefore;->constPool:Ljavassist/bytecode/ConstPool;

    .line 64
    .end local v0    # "ci":I
    .end local v1    # "desc":Ljava/lang/String;
    .end local v2    # "nt":I
    :cond_37
    iget-object v3, p0, Ljavassist/convert/TransformBefore;->saveCode:[B

    if-nez v3, :cond_40

    .line 65
    iget-object v3, p0, Ljavassist/convert/TransformBefore;->parameterTypes:[Ljavassist/CtClass;

    invoke-virtual {p0, v3, p5}, Ljavassist/convert/TransformBefore;->makeCode([Ljavassist/CtClass;Ljavassist/bytecode/ConstPool;)V

    .line 67
    :cond_40
    invoke-virtual {p0, p2, p3}, Ljavassist/convert/TransformBefore;->match2(ILjavassist/bytecode/CodeIterator;)I

    move-result v3

    return v3
.end method

.method protected match2(ILjavassist/bytecode/CodeIterator;)I
    .registers 6
    .param p1, "pos"    # I
    .param p2, "iterator"    # Ljavassist/bytecode/CodeIterator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 71
    invoke-virtual {p2, p1}, Ljavassist/bytecode/CodeIterator;->move(I)V

    .line 72
    iget-object v1, p0, Ljavassist/convert/TransformBefore;->saveCode:[B

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->insert([B)I

    .line 73
    iget-object v1, p0, Ljavassist/convert/TransformBefore;->loadCode:[B

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->insert([B)I

    .line 74
    const/4 v1, 0x3

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->insertGap(I)I

    move-result v0

    .line 75
    .local v0, "p":I
    const/16 v1, 0xb8

    invoke-virtual {p2, v1, v0}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 76
    iget v1, p0, Ljavassist/convert/TransformBefore;->newIndex:I

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p2, v1, v2}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    .line 77
    iget-object v1, p0, Ljavassist/convert/TransformBefore;->loadCode:[B

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->insert([B)I

    .line 78
    invoke-virtual {p2}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v1

    return v1
.end method
