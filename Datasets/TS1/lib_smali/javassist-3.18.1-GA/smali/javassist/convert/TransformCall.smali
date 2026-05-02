.class public Ljavassist/convert/TransformCall;
.super Ljavassist/convert/Transformer;
.source "TransformCall.java"


# instance fields
.field protected classname:Ljava/lang/String;

.field protected constPool:Ljavassist/bytecode/ConstPool;

.field protected methodDescriptor:Ljava/lang/String;

.field protected methodname:Ljava/lang/String;

.field protected newClassname:Ljava/lang/String;

.field protected newIndex:I

.field protected newMethodIsPrivate:Z

.field protected newMethodname:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljavassist/convert/Transformer;Ljava/lang/String;Ljavassist/CtMethod;)V
    .registers 5
    .param p1, "next"    # Ljavassist/convert/Transformer;
    .param p2, "oldMethodName"    # Ljava/lang/String;
    .param p3, "substMethod"    # Ljavassist/CtMethod;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Ljavassist/convert/Transformer;-><init>(Ljavassist/convert/Transformer;)V

    .line 46
    iput-object p2, p0, Ljavassist/convert/TransformCall;->methodname:Ljava/lang/String;

    .line 47
    invoke-virtual {p3}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformCall;->methodDescriptor:Ljava/lang/String;

    .line 48
    invoke-virtual {p3}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformCall;->newClassname:Ljava/lang/String;

    iput-object v0, p0, Ljavassist/convert/TransformCall;->classname:Ljava/lang/String;

    .line 49
    invoke-virtual {p3}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformCall;->newMethodname:Ljava/lang/String;

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/convert/TransformCall;->constPool:Ljavassist/bytecode/ConstPool;

    .line 51
    invoke-virtual {p3}, Ljavassist/CtMethod;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljavassist/Modifier;->isPrivate(I)Z

    move-result v0

    iput-boolean v0, p0, Ljavassist/convert/TransformCall;->newMethodIsPrivate:Z

    .line 52
    return-void
.end method

.method public constructor <init>(Ljavassist/convert/Transformer;Ljavassist/CtMethod;Ljavassist/CtMethod;)V
    .registers 5
    .param p1, "next"    # Ljavassist/convert/Transformer;
    .param p2, "origMethod"    # Ljavassist/CtMethod;
    .param p3, "substMethod"    # Ljavassist/CtMethod;

    .prologue
    .line 38
    invoke-virtual {p2}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Ljavassist/convert/TransformCall;-><init>(Ljavassist/convert/Transformer;Ljava/lang/String;Ljavassist/CtMethod;)V

    .line 39
    invoke-virtual {p2}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformCall;->classname:Ljava/lang/String;

    .line 40
    return-void
.end method

.method private matchClass(Ljava/lang/String;Ljavassist/ClassPool;)Z
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "pool"    # Ljavassist/ClassPool;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 85
    iget-object v6, p0, Ljavassist/convert/TransformCall;->classname:Ljava/lang/String;

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 105
    :goto_a
    return v4

    .line 89
    :cond_b
    :try_start_b
    invoke-virtual {p2, p1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 90
    .local v0, "clazz":Ljavassist/CtClass;
    iget-object v6, p0, Ljavassist/convert/TransformCall;->classname:Ljava/lang/String;

    invoke-virtual {p2, v6}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    .line 91
    .local v1, "declClazz":Ljavassist/CtClass;
    invoke-virtual {v0, v1}, Ljavassist/CtClass;->subtypeOf(Ljavassist/CtClass;)Z
    :try_end_18
    .catch Ljavassist/NotFoundException; {:try_start_b .. :try_end_18} :catch_34

    move-result v6

    if-eqz v6, :cond_37

    .line 93
    :try_start_1b
    iget-object v5, p0, Ljavassist/convert/TransformCall;->methodname:Ljava/lang/String;

    iget-object v6, p0, Ljavassist/convert/TransformCall;->methodDescriptor:Ljava/lang/String;

    invoke-virtual {v0, v5, v6}, Ljavassist/CtClass;->getMethod(Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtMethod;

    move-result-object v3

    .line 94
    .local v3, "m":Ljavassist/CtMethod;
    invoke-virtual {v3}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v5

    invoke-virtual {v5}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Ljavassist/convert/TransformCall;->classname:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_30
    .catch Ljavassist/NotFoundException; {:try_start_1b .. :try_end_30} :catch_32

    move-result v4

    goto :goto_a

    .line 96
    .end local v3    # "m":Ljavassist/CtMethod;
    :catch_32
    move-exception v2

    .line 98
    .local v2, "e":Ljavassist/NotFoundException;
    goto :goto_a

    .line 101
    .end local v0    # "clazz":Ljavassist/CtClass;
    .end local v1    # "declClazz":Ljavassist/CtClass;
    .end local v2    # "e":Ljavassist/NotFoundException;
    :catch_34
    move-exception v2

    .restart local v2    # "e":Ljavassist/NotFoundException;
    move v4, v5

    .line 102
    goto :goto_a

    .end local v2    # "e":Ljavassist/NotFoundException;
    .restart local v0    # "clazz":Ljavassist/CtClass;
    .restart local v1    # "declClazz":Ljavassist/CtClass;
    :cond_37
    move v4, v5

    .line 105
    goto :goto_a
.end method


# virtual methods
.method public initialize(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/CodeAttribute;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "attr"    # Ljavassist/bytecode/CodeAttribute;

    .prologue
    .line 55
    iget-object v0, p0, Ljavassist/convert/TransformCall;->constPool:Ljavassist/bytecode/ConstPool;

    if-eq v0, p1, :cond_7

    .line 56
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/convert/TransformCall;->newIndex:I

    .line 57
    :cond_7
    return-void
.end method

.method protected match(IILjavassist/bytecode/CodeIterator;ILjavassist/bytecode/ConstPool;)I
    .registers 10
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
    .line 111
    iget v2, p0, Ljavassist/convert/TransformCall;->newIndex:I

    if-nez v2, :cond_20

    .line 112
    iget-object v2, p0, Ljavassist/convert/TransformCall;->newMethodname:Ljava/lang/String;

    invoke-virtual {p5, v2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p5, v2, p4}, Ljavassist/bytecode/ConstPool;->addNameAndTypeInfo(II)I

    move-result v1

    .line 114
    .local v1, "nt":I
    iget-object v2, p0, Ljavassist/convert/TransformCall;->newClassname:Ljava/lang/String;

    invoke-virtual {p5, v2}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    .line 115
    .local v0, "ci":I
    const/16 v2, 0xb9

    if-ne p1, v2, :cond_28

    .line 116
    invoke-virtual {p5, v0, v1}, Ljavassist/bytecode/ConstPool;->addInterfaceMethodrefInfo(II)I

    move-result v2

    iput v2, p0, Ljavassist/convert/TransformCall;->newIndex:I

    .line 124
    :goto_1e
    iput-object p5, p0, Ljavassist/convert/TransformCall;->constPool:Ljavassist/bytecode/ConstPool;

    .line 127
    .end local v0    # "ci":I
    .end local v1    # "nt":I
    :cond_20
    iget v2, p0, Ljavassist/convert/TransformCall;->newIndex:I

    add-int/lit8 v3, p2, 0x1

    invoke-virtual {p3, v2, v3}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    .line 128
    return p2

    .line 118
    .restart local v0    # "ci":I
    .restart local v1    # "nt":I
    :cond_28
    iget-boolean v2, p0, Ljavassist/convert/TransformCall;->newMethodIsPrivate:Z

    if-eqz v2, :cond_35

    const/16 v2, 0xb6

    if-ne p1, v2, :cond_35

    .line 119
    const/16 v2, 0xb7

    invoke-virtual {p3, v2, p2}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 121
    :cond_35
    invoke-virtual {p5, v0, v1}, Ljavassist/bytecode/ConstPool;->addMethodrefInfo(II)I

    move-result v2

    iput v2, p0, Ljavassist/convert/TransformCall;->newIndex:I

    goto :goto_1e
.end method

.method public transform(Ljavassist/CtClass;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/ConstPool;)I
    .registers 14
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "pos"    # I
    .param p3, "iterator"    # Ljavassist/bytecode/CodeIterator;
    .param p4, "cp"    # Ljavassist/bytecode/ConstPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 69
    invoke-virtual {p3, p2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v1

    .line 70
    .local v1, "c":I
    const/16 v0, 0xb9

    if-eq v1, v0, :cond_14

    const/16 v0, 0xb7

    if-eq v1, v0, :cond_14

    const/16 v0, 0xb8

    if-eq v1, v0, :cond_14

    const/16 v0, 0xb6

    if-ne v1, v0, :cond_3e

    .line 72
    :cond_14
    add-int/lit8 v0, p2, 0x1

    invoke-virtual {p3, v0}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v7

    .line 73
    .local v7, "index":I
    iget-object v0, p0, Ljavassist/convert/TransformCall;->methodname:Ljava/lang/String;

    iget-object v2, p0, Ljavassist/convert/TransformCall;->methodDescriptor:Ljava/lang/String;

    invoke-virtual {p4, v0, v2, v7}, Ljavassist/bytecode/ConstPool;->eqMember(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    .line 74
    .local v6, "cname":Ljava/lang/String;
    if-eqz v6, :cond_3e

    invoke-virtual {p1}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v0

    invoke-direct {p0, v6, v0}, Ljavassist/convert/TransformCall;->matchClass(Ljava/lang/String;Ljavassist/ClassPool;)Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 75
    invoke-virtual {p4, v7}, Ljavassist/bytecode/ConstPool;->getMemberNameAndType(I)I

    move-result v8

    .line 76
    .local v8, "ntinfo":I
    invoke-virtual {p4, v8}, Ljavassist/bytecode/ConstPool;->getNameAndTypeDescriptor(I)I

    move-result v4

    move-object v0, p0

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Ljavassist/convert/TransformCall;->match(IILjavassist/bytecode/CodeIterator;ILjavassist/bytecode/ConstPool;)I

    move-result p2

    .line 81
    .end local v6    # "cname":Ljava/lang/String;
    .end local v7    # "index":I
    .end local v8    # "ntinfo":I
    :cond_3e
    return p2
.end method
