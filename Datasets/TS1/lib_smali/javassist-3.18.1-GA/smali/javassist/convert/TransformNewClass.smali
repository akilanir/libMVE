.class public final Ljavassist/convert/TransformNewClass;
.super Ljavassist/convert/Transformer;
.source "TransformNewClass.java"


# instance fields
.field private classname:Ljava/lang/String;

.field private nested:I

.field private newClassIndex:I

.field private newClassName:Ljava/lang/String;

.field private newMethodIndex:I

.field private newMethodNTIndex:I


# direct methods
.method public constructor <init>(Ljavassist/convert/Transformer;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "next"    # Ljavassist/convert/Transformer;
    .param p2, "classname"    # Ljava/lang/String;
    .param p3, "newClassName"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Ljavassist/convert/Transformer;-><init>(Ljavassist/convert/Transformer;)V

    .line 31
    iput-object p2, p0, Ljavassist/convert/TransformNewClass;->classname:Ljava/lang/String;

    .line 32
    iput-object p3, p0, Ljavassist/convert/TransformNewClass;->newClassName:Ljava/lang/String;

    .line 33
    return-void
.end method


# virtual methods
.method public initialize(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/CodeAttribute;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "attr"    # Ljavassist/bytecode/CodeAttribute;

    .prologue
    const/4 v0, 0x0

    .line 36
    iput v0, p0, Ljavassist/convert/TransformNewClass;->nested:I

    .line 37
    iput v0, p0, Ljavassist/convert/TransformNewClass;->newMethodIndex:I

    iput v0, p0, Ljavassist/convert/TransformNewClass;->newMethodNTIndex:I

    iput v0, p0, Ljavassist/convert/TransformNewClass;->newClassIndex:I

    .line 38
    return-void
.end method

.method public transform(Ljavassist/CtClass;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/ConstPool;)I
    .registers 11
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
    .line 51
    invoke-virtual {p3, p2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v0

    .line 52
    .local v0, "c":I
    const/16 v4, 0xbb

    if-ne v0, v4, :cond_46

    .line 53
    add-int/lit8 v4, p2, 0x1

    invoke-virtual {p3, v4}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v1

    .line 54
    .local v1, "index":I
    invoke-virtual {p4, v1}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Ljavassist/convert/TransformNewClass;->classname:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_45

    .line 55
    add-int/lit8 v4, p2, 0x3

    invoke-virtual {p3, v4}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v4

    const/16 v5, 0x59

    if-eq v4, v5, :cond_2c

    .line 56
    new-instance v4, Ljavassist/CannotCompileException;

    const-string v5, "NEW followed by no DUP was found"

    invoke-direct {v4, v5}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 59
    :cond_2c
    iget v4, p0, Ljavassist/convert/TransformNewClass;->newClassIndex:I

    if-nez v4, :cond_38

    .line 60
    iget-object v4, p0, Ljavassist/convert/TransformNewClass;->newClassName:Ljava/lang/String;

    invoke-virtual {p4, v4}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Ljavassist/convert/TransformNewClass;->newClassIndex:I

    .line 62
    :cond_38
    iget v4, p0, Ljavassist/convert/TransformNewClass;->newClassIndex:I

    add-int/lit8 v5, p2, 0x1

    invoke-virtual {p3, v4, v5}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    .line 63
    iget v4, p0, Ljavassist/convert/TransformNewClass;->nested:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Ljavassist/convert/TransformNewClass;->nested:I

    .line 81
    .end local v1    # "index":I
    :cond_45
    :goto_45
    return p2

    .line 66
    :cond_46
    const/16 v4, 0xb7

    if-ne v0, v4, :cond_45

    .line 67
    add-int/lit8 v4, p2, 0x1

    invoke-virtual {p3, v4}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v1

    .line 68
    .restart local v1    # "index":I
    iget-object v4, p0, Ljavassist/convert/TransformNewClass;->classname:Ljava/lang/String;

    invoke-virtual {p4, v4, v1}, Ljavassist/bytecode/ConstPool;->isConstructor(Ljava/lang/String;I)I

    move-result v3

    .line 69
    .local v3, "typedesc":I
    if-eqz v3, :cond_45

    iget v4, p0, Ljavassist/convert/TransformNewClass;->nested:I

    if-lez v4, :cond_45

    .line 70
    invoke-virtual {p4, v1}, Ljavassist/bytecode/ConstPool;->getMethodrefNameAndType(I)I

    move-result v2

    .line 71
    .local v2, "nt":I
    iget v4, p0, Ljavassist/convert/TransformNewClass;->newMethodNTIndex:I

    if-eq v4, v2, :cond_6e

    .line 72
    iput v2, p0, Ljavassist/convert/TransformNewClass;->newMethodNTIndex:I

    .line 73
    iget v4, p0, Ljavassist/convert/TransformNewClass;->newClassIndex:I

    invoke-virtual {p4, v4, v2}, Ljavassist/bytecode/ConstPool;->addMethodrefInfo(II)I

    move-result v4

    iput v4, p0, Ljavassist/convert/TransformNewClass;->newMethodIndex:I

    .line 76
    :cond_6e
    iget v4, p0, Ljavassist/convert/TransformNewClass;->newMethodIndex:I

    add-int/lit8 v5, p2, 0x1

    invoke-virtual {p3, v4, v5}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    .line 77
    iget v4, p0, Ljavassist/convert/TransformNewClass;->nested:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Ljavassist/convert/TransformNewClass;->nested:I

    goto :goto_45
.end method
