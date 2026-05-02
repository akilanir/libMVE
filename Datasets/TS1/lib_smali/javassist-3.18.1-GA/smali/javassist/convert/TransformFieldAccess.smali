.class public final Ljavassist/convert/TransformFieldAccess;
.super Ljavassist/convert/Transformer;
.source "TransformFieldAccess.java"


# instance fields
.field private constPool:Ljavassist/bytecode/ConstPool;

.field private fieldClass:Ljavassist/CtClass;

.field private fieldname:Ljava/lang/String;

.field private isPrivate:Z

.field private newClassname:Ljava/lang/String;

.field private newFieldname:Ljava/lang/String;

.field private newIndex:I


# direct methods
.method public constructor <init>(Ljavassist/convert/Transformer;Ljavassist/CtField;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "next"    # Ljavassist/convert/Transformer;
    .param p2, "field"    # Ljavassist/CtField;
    .param p3, "newClassname"    # Ljava/lang/String;
    .param p4, "newFieldname"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Ljavassist/convert/Transformer;-><init>(Ljavassist/convert/Transformer;)V

    .line 38
    invoke-virtual {p2}, Ljavassist/CtField;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformFieldAccess;->fieldClass:Ljavassist/CtClass;

    .line 39
    invoke-virtual {p2}, Ljavassist/CtField;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformFieldAccess;->fieldname:Ljava/lang/String;

    .line 40
    invoke-virtual {p2}, Ljavassist/CtField;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljavassist/Modifier;->isPrivate(I)Z

    move-result v0

    iput-boolean v0, p0, Ljavassist/convert/TransformFieldAccess;->isPrivate:Z

    .line 41
    iput-object p3, p0, Ljavassist/convert/TransformFieldAccess;->newClassname:Ljava/lang/String;

    .line 42
    iput-object p4, p0, Ljavassist/convert/TransformFieldAccess;->newFieldname:Ljava/lang/String;

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/convert/TransformFieldAccess;->constPool:Ljavassist/bytecode/ConstPool;

    .line 44
    return-void
.end method


# virtual methods
.method public initialize(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/CodeAttribute;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "attr"    # Ljavassist/bytecode/CodeAttribute;

    .prologue
    .line 47
    iget-object v0, p0, Ljavassist/convert/TransformFieldAccess;->constPool:Ljavassist/bytecode/ConstPool;

    if-eq v0, p1, :cond_7

    .line 48
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/convert/TransformFieldAccess;->newIndex:I

    .line 49
    :cond_7
    return-void
.end method

.method public transform(Ljavassist/CtClass;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/ConstPool;)I
    .registers 14
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "pos"    # I
    .param p3, "iterator"    # Ljavassist/bytecode/CodeIterator;
    .param p4, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 60
    invoke-virtual {p3, p2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v6

    .line 61
    .local v6, "c":I
    const/16 v0, 0xb4

    if-eq v6, v0, :cond_14

    const/16 v0, 0xb2

    if-eq v6, v0, :cond_14

    const/16 v0, 0xb5

    if-eq v6, v0, :cond_14

    const/16 v0, 0xb3

    if-ne v6, v0, :cond_4a

    .line 63
    :cond_14
    add-int/lit8 v0, p2, 0x1

    invoke-virtual {p3, v0}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v5

    .line 64
    .local v5, "index":I
    invoke-virtual {p1}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v0

    iget-object v2, p0, Ljavassist/convert/TransformFieldAccess;->fieldClass:Ljavassist/CtClass;

    iget-object v3, p0, Ljavassist/convert/TransformFieldAccess;->fieldname:Ljava/lang/String;

    iget-boolean v4, p0, Ljavassist/convert/TransformFieldAccess;->isPrivate:Z

    move-object v1, p4

    invoke-static/range {v0 .. v5}, Ljavassist/convert/TransformReadField;->isField(Ljavassist/ClassPool;Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;Ljava/lang/String;ZI)Ljava/lang/String;

    move-result-object v8

    .line 67
    .local v8, "typedesc":Ljava/lang/String;
    if-eqz v8, :cond_4a

    .line 68
    iget v0, p0, Ljavassist/convert/TransformFieldAccess;->newIndex:I

    if-nez v0, :cond_43

    .line 69
    iget-object v0, p0, Ljavassist/convert/TransformFieldAccess;->newFieldname:Ljava/lang/String;

    invoke-virtual {p4, v0, v8}, Ljavassist/bytecode/ConstPool;->addNameAndTypeInfo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    .line 71
    .local v7, "nt":I
    iget-object v0, p0, Ljavassist/convert/TransformFieldAccess;->newClassname:Ljava/lang/String;

    invoke-virtual {p4, v0}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p4, v0, v7}, Ljavassist/bytecode/ConstPool;->addFieldrefInfo(II)I

    move-result v0

    iput v0, p0, Ljavassist/convert/TransformFieldAccess;->newIndex:I

    .line 73
    iput-object p4, p0, Ljavassist/convert/TransformFieldAccess;->constPool:Ljavassist/bytecode/ConstPool;

    .line 76
    .end local v7    # "nt":I
    :cond_43
    iget v0, p0, Ljavassist/convert/TransformFieldAccess;->newIndex:I

    add-int/lit8 v1, p2, 0x1

    invoke-virtual {p3, v0, v1}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    .line 80
    .end local v5    # "index":I
    .end local v8    # "typedesc":Ljava/lang/String;
    :cond_4a
    return p2
.end method
