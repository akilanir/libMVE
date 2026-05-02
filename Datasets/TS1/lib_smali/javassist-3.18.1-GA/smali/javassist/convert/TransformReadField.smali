.class public Ljavassist/convert/TransformReadField;
.super Ljavassist/convert/Transformer;
.source "TransformReadField.java"


# instance fields
.field protected fieldClass:Ljavassist/CtClass;

.field protected fieldname:Ljava/lang/String;

.field protected isPrivate:Z

.field protected methodClassname:Ljava/lang/String;

.field protected methodName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljavassist/convert/Transformer;Ljavassist/CtField;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "next"    # Ljavassist/convert/Transformer;
    .param p2, "field"    # Ljavassist/CtField;
    .param p3, "methodClassname"    # Ljava/lang/String;
    .param p4, "methodName"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Ljavassist/convert/Transformer;-><init>(Ljavassist/convert/Transformer;)V

    .line 36
    invoke-virtual {p2}, Ljavassist/CtField;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformReadField;->fieldClass:Ljavassist/CtClass;

    .line 37
    invoke-virtual {p2}, Ljavassist/CtField;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformReadField;->fieldname:Ljava/lang/String;

    .line 38
    iput-object p3, p0, Ljavassist/convert/TransformReadField;->methodClassname:Ljava/lang/String;

    .line 39
    iput-object p4, p0, Ljavassist/convert/TransformReadField;->methodName:Ljava/lang/String;

    .line 40
    invoke-virtual {p2}, Ljavassist/CtField;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljavassist/Modifier;->isPrivate(I)Z

    move-result v0

    iput-boolean v0, p0, Ljavassist/convert/TransformReadField;->isPrivate:Z

    .line 41
    return-void
.end method

.method static isField(Ljavassist/ClassPool;Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;Ljava/lang/String;ZI)Ljava/lang/String;
    .registers 9
    .param p0, "pool"    # Ljavassist/ClassPool;
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "fclass"    # Ljavassist/CtClass;
    .param p3, "fname"    # Ljava/lang/String;
    .param p4, "is_private"    # Z
    .param p5, "index"    # I

    .prologue
    const/4 v1, 0x0

    .line 45
    invoke-virtual {p1, p5}, Ljavassist/bytecode/ConstPool;->getFieldrefName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 54
    :cond_b
    :goto_b
    return-object v1

    .line 49
    :cond_c
    :try_start_c
    invoke-virtual {p1, p5}, Ljavassist/bytecode/ConstPool;->getFieldrefClassName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 50
    .local v0, "c":Ljavassist/CtClass;
    if-eq v0, p2, :cond_1e

    if-nez p4, :cond_b

    invoke-static {v0, p2, p3}, Ljavassist/convert/TransformReadField;->isFieldInSuper(Ljavassist/CtClass;Ljavassist/CtClass;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 51
    :cond_1e
    invoke-virtual {p1, p5}, Ljavassist/bytecode/ConstPool;->getFieldrefType(I)Ljava/lang/String;
    :try_end_21
    .catch Ljavassist/NotFoundException; {:try_start_c .. :try_end_21} :catch_23

    move-result-object v1

    goto :goto_b

    .line 53
    .end local v0    # "c":Ljavassist/CtClass;
    :catch_23
    move-exception v2

    goto :goto_b
.end method

.method static isFieldInSuper(Ljavassist/CtClass;Ljavassist/CtClass;Ljava/lang/String;)Z
    .registers 6
    .param p0, "clazz"    # Ljavassist/CtClass;
    .param p1, "fclass"    # Ljavassist/CtClass;
    .param p2, "fname"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 58
    invoke-virtual {p0, p1}, Ljavassist/CtClass;->subclassOf(Ljavassist/CtClass;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 66
    :cond_7
    :goto_7
    return v1

    .line 62
    :cond_8
    :try_start_8
    invoke-virtual {p0, p2}, Ljavassist/CtClass;->getField(Ljava/lang/String;)Ljavassist/CtField;

    move-result-object v0

    .line 63
    .local v0, "f":Ljavassist/CtField;
    invoke-virtual {v0}, Ljavassist/CtField;->getDeclaringClass()Ljavassist/CtClass;
    :try_end_f
    .catch Ljavassist/NotFoundException; {:try_start_8 .. :try_end_f} :catch_14

    move-result-object v2

    if-ne v2, p1, :cond_7

    const/4 v1, 0x1

    goto :goto_7

    .line 65
    .end local v0    # "f":Ljavassist/CtField;
    :catch_14
    move-exception v2

    goto :goto_7
.end method


# virtual methods
.method public transform(Ljavassist/CtClass;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/ConstPool;)I
    .registers 18
    .param p1, "tclazz"    # Ljavassist/CtClass;
    .param p2, "pos"    # I
    .param p3, "iterator"    # Ljavassist/bytecode/CodeIterator;
    .param p4, "cp"    # Ljavassist/bytecode/ConstPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 72
    move-object/from16 v0, p3

    invoke-virtual {v0, p2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v7

    .line 73
    .local v7, "c":I
    const/16 v1, 0xb4

    if-eq v7, v1, :cond_e

    const/16 v1, 0xb2

    if-ne v7, v1, :cond_75

    .line 74
    :cond_e
    add-int/lit8 v1, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v6

    .line 75
    .local v6, "index":I
    invoke-virtual {p1}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v1

    iget-object v3, p0, Ljavassist/convert/TransformReadField;->fieldClass:Ljavassist/CtClass;

    iget-object v4, p0, Ljavassist/convert/TransformReadField;->fieldname:Ljava/lang/String;

    iget-boolean v5, p0, Ljavassist/convert/TransformReadField;->isPrivate:Z

    move-object/from16 v2, p4

    invoke-static/range {v1 .. v6}, Ljavassist/convert/TransformReadField;->isField(Ljavassist/ClassPool;Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;Ljava/lang/String;ZI)Ljava/lang/String;

    move-result-object v12

    .line 77
    .local v12, "typedesc":Ljava/lang/String;
    if-eqz v12, :cond_75

    .line 78
    const/16 v1, 0xb2

    if-ne v7, v1, :cond_42

    .line 79
    move-object/from16 v0, p3

    invoke-virtual {v0, p2}, Ljavassist/bytecode/CodeIterator;->move(I)V

    .line 80
    const/4 v1, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->insertGap(I)I

    move-result p2

    .line 81
    const/4 v1, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v1, p2}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 82
    invoke-virtual/range {p3 .. p3}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result p2

    .line 85
    :cond_42
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "(Ljava/lang/Object;)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 86
    .local v11, "type":Ljava/lang/String;
    iget-object v1, p0, Ljavassist/convert/TransformReadField;->methodClassname:Ljava/lang/String;

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v9

    .line 87
    .local v9, "mi":I
    iget-object v1, p0, Ljavassist/convert/TransformReadField;->methodName:Ljava/lang/String;

    move-object/from16 v0, p4

    invoke-virtual {v0, v9, v1, v11}, Ljavassist/bytecode/ConstPool;->addMethodrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v8

    .line 88
    .local v8, "methodref":I
    const/16 v1, 0xb8

    move-object/from16 v0, p3

    invoke-virtual {v0, v1, p2}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 89
    add-int/lit8 v1, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v8, v1}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    move v10, p2

    .line 94
    .end local v6    # "index":I
    .end local v8    # "methodref":I
    .end local v9    # "mi":I
    .end local v11    # "type":Ljava/lang/String;
    .end local v12    # "typedesc":Ljava/lang/String;
    .end local p2    # "pos":I
    .local v10, "pos":I
    :goto_74
    return v10

    .end local v10    # "pos":I
    .restart local p2    # "pos":I
    :cond_75
    move v10, p2

    .end local p2    # "pos":I
    .restart local v10    # "pos":I
    goto :goto_74
.end method
