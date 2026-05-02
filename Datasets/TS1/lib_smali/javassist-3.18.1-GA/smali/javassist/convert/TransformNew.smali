.class public final Ljavassist/convert/TransformNew;
.super Ljavassist/convert/Transformer;
.source "TransformNew.java"


# instance fields
.field private classname:Ljava/lang/String;

.field private nested:I

.field private trapClass:Ljava/lang/String;

.field private trapMethod:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljavassist/convert/Transformer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "next"    # Ljavassist/convert/Transformer;
    .param p2, "classname"    # Ljava/lang/String;
    .param p3, "trapClass"    # Ljava/lang/String;
    .param p4, "trapMethod"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Ljavassist/convert/Transformer;-><init>(Ljavassist/convert/Transformer;)V

    .line 30
    iput-object p2, p0, Ljavassist/convert/TransformNew;->classname:Ljava/lang/String;

    .line 31
    iput-object p3, p0, Ljavassist/convert/TransformNew;->trapClass:Ljava/lang/String;

    .line 32
    iput-object p4, p0, Ljavassist/convert/TransformNew;->trapMethod:Ljava/lang/String;

    .line 33
    return-void
.end method

.method private computeMethodref(ILjavassist/bytecode/ConstPool;)I
    .registers 7
    .param p1, "typedesc"    # I
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 95
    iget-object v2, p0, Ljavassist/convert/TransformNew;->trapClass:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    .line 96
    .local v0, "classIndex":I
    iget-object v2, p0, Ljavassist/convert/TransformNew;->trapMethod:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    .line 97
    .local v1, "mnameIndex":I
    iget-object v2, p0, Ljavassist/convert/TransformNew;->classname:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Ljavassist/bytecode/Descriptor;->changeReturnType(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result p1

    .line 100
    invoke-virtual {p2, v1, p1}, Ljavassist/bytecode/ConstPool;->addNameAndTypeInfo(II)I

    move-result v2

    invoke-virtual {p2, v0, v2}, Ljavassist/bytecode/ConstPool;->addMethodrefInfo(II)I

    move-result v2

    return v2
.end method


# virtual methods
.method public initialize(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/CodeAttribute;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "attr"    # Ljavassist/bytecode/CodeAttribute;

    .prologue
    .line 36
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/convert/TransformNew;->nested:I

    .line 37
    return-void
.end method

.method public transform(Ljavassist/CtClass;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/ConstPool;)I
    .registers 14
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "pos"    # I
    .param p3, "iterator"    # Ljavassist/bytecode/CodeIterator;
    .param p4, "cp"    # Ljavassist/bytecode/ConstPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 55
    invoke-virtual {p3, p2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v0

    .line 56
    .local v0, "c":I
    const/16 v6, 0xbb

    if-ne v0, v6, :cond_68

    .line 57
    add-int/lit8 v6, p2, 0x1

    invoke-virtual {p3, v6}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v1

    .line 58
    .local v1, "index":I
    invoke-virtual {p4, v1}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Ljavassist/convert/TransformNew;->classname:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_67

    .line 59
    add-int/lit8 v6, p2, 0x3

    invoke-virtual {p3, v6}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v6

    const/16 v7, 0x59

    if-eq v6, v7, :cond_2d

    .line 60
    new-instance v6, Ljavassist/CannotCompileException;

    const-string v7, "NEW followed by no DUP was found"

    invoke-direct {v6, v7}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 63
    :cond_2d
    invoke-virtual {p3, v8, p2}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 64
    add-int/lit8 v6, p2, 0x1

    invoke-virtual {p3, v8, v6}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 65
    add-int/lit8 v6, p2, 0x2

    invoke-virtual {p3, v8, v6}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 66
    add-int/lit8 v6, p2, 0x3

    invoke-virtual {p3, v8, v6}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 67
    iget v6, p0, Ljavassist/convert/TransformNew;->nested:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Ljavassist/convert/TransformNew;->nested:I

    .line 69
    invoke-virtual {p3}, Ljavassist/bytecode/CodeIterator;->get()Ljavassist/bytecode/CodeAttribute;

    move-result-object v6

    const-string v7, "StackMapTable"

    invoke-virtual {v6, v7}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v4

    check-cast v4, Ljavassist/bytecode/StackMapTable;

    .line 71
    .local v4, "smt":Ljavassist/bytecode/StackMapTable;
    if-eqz v4, :cond_56

    .line 72
    invoke-virtual {v4, p2}, Ljavassist/bytecode/StackMapTable;->removeNew(I)V

    .line 74
    :cond_56
    invoke-virtual {p3}, Ljavassist/bytecode/CodeIterator;->get()Ljavassist/bytecode/CodeAttribute;

    move-result-object v6

    const-string v7, "StackMap"

    invoke-virtual {v6, v7}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v3

    check-cast v3, Ljavassist/bytecode/StackMap;

    .line 76
    .local v3, "sm":Ljavassist/bytecode/StackMap;
    if-eqz v3, :cond_67

    .line 77
    invoke-virtual {v3, p2}, Ljavassist/bytecode/StackMap;->removeNew(I)V

    .line 91
    .end local v1    # "index":I
    .end local v3    # "sm":Ljavassist/bytecode/StackMap;
    .end local v4    # "smt":Ljavassist/bytecode/StackMapTable;
    :cond_67
    :goto_67
    return p2

    .line 80
    :cond_68
    const/16 v6, 0xb7

    if-ne v0, v6, :cond_67

    .line 81
    add-int/lit8 v6, p2, 0x1

    invoke-virtual {p3, v6}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v1

    .line 82
    .restart local v1    # "index":I
    iget-object v6, p0, Ljavassist/convert/TransformNew;->classname:Ljava/lang/String;

    invoke-virtual {p4, v6, v1}, Ljavassist/bytecode/ConstPool;->isConstructor(Ljava/lang/String;I)I

    move-result v5

    .line 83
    .local v5, "typedesc":I
    if-eqz v5, :cond_67

    iget v6, p0, Ljavassist/convert/TransformNew;->nested:I

    if-lez v6, :cond_67

    .line 84
    invoke-direct {p0, v5, p4}, Ljavassist/convert/TransformNew;->computeMethodref(ILjavassist/bytecode/ConstPool;)I

    move-result v2

    .line 85
    .local v2, "methodref":I
    const/16 v6, 0xb8

    invoke-virtual {p3, v6, p2}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 86
    add-int/lit8 v6, p2, 0x1

    invoke-virtual {p3, v2, v6}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    .line 87
    iget v6, p0, Ljavassist/convert/TransformNew;->nested:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Ljavassist/convert/TransformNew;->nested:I

    goto :goto_67
.end method
