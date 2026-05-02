.class public Ljavassist/compiler/AccessorMaker;
.super Ljava/lang/Object;
.source "AccessorMaker.java"


# static fields
.field static final lastParamType:Ljava/lang/String; = "javassist.runtime.Inner"


# instance fields
.field private accessors:Ljava/util/HashMap;

.field private clazz:Ljavassist/CtClass;

.field private uniqueNumber:I


# direct methods
.method public constructor <init>(Ljavassist/CtClass;)V
    .registers 3
    .param p1, "c"    # Ljavassist/CtClass;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    .line 36
    const/4 v0, 0x1

    iput v0, p0, Ljavassist/compiler/AccessorMaker;->uniqueNumber:I

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ljavassist/compiler/AccessorMaker;->accessors:Ljava/util/HashMap;

    .line 38
    return-void
.end method

.method private findAccessorName(Ljavassist/bytecode/ClassFile;)Ljava/lang/String;
    .registers 6
    .param p1, "cf"    # Ljavassist/bytecode/ClassFile;

    .prologue
    .line 256
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "access$"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Ljavassist/compiler/AccessorMaker;->uniqueNumber:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Ljavassist/compiler/AccessorMaker;->uniqueNumber:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 257
    .local v0, "accName":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljavassist/bytecode/ClassFile;->getMethod(Ljava/lang/String;)Ljavassist/bytecode/MethodInfo;

    move-result-object v1

    if-nez v1, :cond_0

    .line 258
    return-object v0
.end method


# virtual methods
.method public getConstructor(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/MethodInfo;)Ljava/lang/String;
    .registers 20
    .param p1, "c"    # Ljavassist/CtClass;
    .param p2, "desc"    # Ljava/lang/String;
    .param p3, "orig"    # Ljavassist/bytecode/MethodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 43
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "<init>:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 44
    .local v9, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Ljavassist/compiler/AccessorMaker;->accessors:Ljava/util/HashMap;

    invoke-virtual {v14, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 45
    .local v3, "consDesc":Ljava/lang/String;
    if-eqz v3, :cond_23

    move-object v4, v3

    .line 82
    .end local v3    # "consDesc":Ljava/lang/String;
    .local v4, "consDesc":Ljava/lang/String;
    :goto_22
    return-object v4

    .line 48
    .end local v4    # "consDesc":Ljava/lang/String;
    .restart local v3    # "consDesc":Ljava/lang/String;
    :cond_23
    const-string v14, "javassist.runtime.Inner"

    move-object/from16 v0, p2

    invoke-static {v14, v0}, Ljavassist/bytecode/Descriptor;->appendParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 49
    move-object/from16 v0, p0

    iget-object v14, v0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    invoke-virtual {v14}, Ljavassist/CtClass;->getClassFile()Ljavassist/bytecode/ClassFile;

    move-result-object v1

    .line 51
    .local v1, "cf":Ljavassist/bytecode/ClassFile;
    :try_start_33
    invoke-virtual {v1}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v5

    .line 52
    .local v5, "cp":Ljavassist/bytecode/ConstPool;
    move-object/from16 v0, p0

    iget-object v14, v0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    invoke-virtual {v14}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v12

    .line 53
    .local v12, "pool":Ljavassist/ClassPool;
    new-instance v10, Ljavassist/bytecode/MethodInfo;

    const-string v14, "<init>"

    invoke-direct {v10, v5, v14, v3}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .local v10, "minfo":Ljavassist/bytecode/MethodInfo;
    const/4 v14, 0x0

    invoke-virtual {v10, v14}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 56
    new-instance v14, Ljavassist/bytecode/SyntheticAttribute;

    invoke-direct {v14, v5}, Ljavassist/bytecode/SyntheticAttribute;-><init>(Ljavassist/bytecode/ConstPool;)V

    invoke-virtual {v10, v14}, Ljavassist/bytecode/MethodInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 57
    invoke-virtual/range {p3 .. p3}, Ljavassist/bytecode/MethodInfo;->getExceptionsAttribute()Ljavassist/bytecode/ExceptionsAttribute;

    move-result-object v7

    .line 58
    .local v7, "ea":Ljavassist/bytecode/ExceptionsAttribute;
    if-eqz v7, :cond_60

    .line 59
    const/4 v14, 0x0

    invoke-virtual {v7, v5, v14}, Ljavassist/bytecode/ExceptionsAttribute;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v14

    invoke-virtual {v10, v14}, Ljavassist/bytecode/MethodInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 61
    :cond_60
    move-object/from16 v0, p2

    invoke-static {v0, v12}, Ljavassist/bytecode/Descriptor;->getParameterTypes(Ljava/lang/String;Ljavassist/ClassPool;)[Ljavassist/CtClass;

    move-result-object v11

    .line 62
    .local v11, "params":[Ljavassist/CtClass;
    new-instance v2, Ljavassist/bytecode/Bytecode;

    invoke-direct {v2, v5}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 63
    .local v2, "code":Ljavassist/bytecode/Bytecode;
    const/4 v14, 0x0

    invoke-virtual {v2, v14}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 64
    const/4 v13, 0x1

    .line 65
    .local v13, "regno":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_71
    array-length v14, v11

    if-ge v8, v14, :cond_7e

    .line 66
    aget-object v14, v11, v8

    invoke-virtual {v2, v13, v14}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    move-result v14

    add-int/2addr v13, v14

    .line 65
    add-int/lit8 v8, v8, 0x1

    goto :goto_71

    .line 67
    :cond_7e
    add-int/lit8 v14, v13, 0x1

    invoke-virtual {v2, v14}, Ljavassist/bytecode/Bytecode;->setMaxLocals(I)V

    .line 68
    move-object/from16 v0, p0

    iget-object v14, v0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    const-string v15, "<init>"

    move-object/from16 v0, p2

    invoke-virtual {v2, v14, v15, v0}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const/4 v14, 0x0

    invoke-virtual {v2, v14}, Ljavassist/bytecode/Bytecode;->addReturn(Ljavassist/CtClass;)V

    .line 71
    invoke-virtual {v2}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v14

    invoke-virtual {v10, v14}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 72
    invoke-virtual {v1, v10}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V
    :try_end_9c
    .catch Ljavassist/CannotCompileException; {:try_start_33 .. :try_end_9c} :catch_a6
    .catch Ljavassist/NotFoundException; {:try_start_33 .. :try_end_9c} :catch_ad

    .line 81
    move-object/from16 v0, p0

    iget-object v14, v0, Ljavassist/compiler/AccessorMaker;->accessors:Ljava/util/HashMap;

    invoke-virtual {v14, v9, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v4, v3

    .line 82
    .end local v3    # "consDesc":Ljava/lang/String;
    .restart local v4    # "consDesc":Ljava/lang/String;
    goto/16 :goto_22

    .line 74
    .end local v2    # "code":Ljavassist/bytecode/Bytecode;
    .end local v4    # "consDesc":Ljava/lang/String;
    .end local v5    # "cp":Ljavassist/bytecode/ConstPool;
    .end local v7    # "ea":Ljavassist/bytecode/ExceptionsAttribute;
    .end local v8    # "i":I
    .end local v10    # "minfo":Ljavassist/bytecode/MethodInfo;
    .end local v11    # "params":[Ljavassist/CtClass;
    .end local v12    # "pool":Ljavassist/ClassPool;
    .end local v13    # "regno":I
    .restart local v3    # "consDesc":Ljava/lang/String;
    :catch_a6
    move-exception v6

    .line 75
    .local v6, "e":Ljavassist/CannotCompileException;
    new-instance v14, Ljavassist/compiler/CompileError;

    invoke-direct {v14, v6}, Ljavassist/compiler/CompileError;-><init>(Ljavassist/CannotCompileException;)V

    throw v14

    .line 77
    .end local v6    # "e":Ljavassist/CannotCompileException;
    :catch_ad
    move-exception v6

    .line 78
    .local v6, "e":Ljavassist/NotFoundException;
    new-instance v14, Ljavassist/compiler/CompileError;

    invoke-direct {v14, v6}, Ljavassist/compiler/CompileError;-><init>(Ljavassist/NotFoundException;)V

    throw v14
.end method

.method public getFieldGetter(Ljavassist/bytecode/FieldInfo;Z)Ljavassist/bytecode/MethodInfo;
    .registers 17
    .param p1, "finfo"    # Ljavassist/bytecode/FieldInfo;
    .param p2, "is_static"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 153
    invoke-virtual {p1}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v6

    .line 154
    .local v6, "fieldName":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ":getter"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 155
    .local v8, "key":Ljava/lang/String;
    iget-object v12, p0, Ljavassist/compiler/AccessorMaker;->accessors:Ljava/util/HashMap;

    invoke-virtual {v12, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 156
    .local v11, "res":Ljava/lang/Object;
    if-eqz v11, :cond_22

    .line 157
    check-cast v11, Ljavassist/bytecode/MethodInfo;

    .line 188
    .end local v11    # "res":Ljava/lang/Object;
    :goto_21
    return-object v11

    .line 159
    .restart local v11    # "res":Ljava/lang/Object;
    :cond_22
    iget-object v12, p0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    invoke-virtual {v12}, Ljavassist/CtClass;->getClassFile()Ljavassist/bytecode/ClassFile;

    move-result-object v2

    .line 160
    .local v2, "cf":Ljavassist/bytecode/ClassFile;
    invoke-direct {p0, v2}, Ljavassist/compiler/AccessorMaker;->findAccessorName(Ljavassist/bytecode/ClassFile;)Ljava/lang/String;

    move-result-object v1

    .line 162
    .local v1, "accName":Ljava/lang/String;
    :try_start_2c
    invoke-virtual {v2}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v4

    .line 163
    .local v4, "cp":Ljavassist/bytecode/ConstPool;
    iget-object v12, p0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    invoke-virtual {v12}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v10

    .line 164
    .local v10, "pool":Ljavassist/ClassPool;
    invoke-virtual {p1}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v7

    .line 166
    .local v7, "fieldType":Ljava/lang/String;
    if-eqz p2, :cond_85

    .line 167
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "()"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 171
    .local v0, "accDesc":Ljava/lang/String;
    :goto_4f
    new-instance v9, Ljavassist/bytecode/MethodInfo;

    invoke-direct {v9, v4, v1, v0}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .local v9, "minfo":Ljavassist/bytecode/MethodInfo;
    const/16 v12, 0x8

    invoke-virtual {v9, v12}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 173
    new-instance v12, Ljavassist/bytecode/SyntheticAttribute;

    invoke-direct {v12, v4}, Ljavassist/bytecode/SyntheticAttribute;-><init>(Ljavassist/bytecode/ConstPool;)V

    invoke-virtual {v9, v12}, Ljavassist/bytecode/MethodInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 174
    new-instance v3, Ljavassist/bytecode/Bytecode;

    invoke-direct {v3, v4}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 175
    .local v3, "code":Ljavassist/bytecode/Bytecode;
    if-eqz p2, :cond_a9

    .line 176
    sget-object v12, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {v3, v12, v6, v7}, Ljavassist/bytecode/Bytecode;->addGetstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    :goto_6d
    invoke-static {v7, v10}, Ljavassist/bytecode/Descriptor;->toCtClass(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;

    move-result-object v12

    invoke-virtual {v3, v12}, Ljavassist/bytecode/Bytecode;->addReturn(Ljavassist/CtClass;)V

    .line 185
    invoke-virtual {v3}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 186
    invoke-virtual {v2, v9}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V

    .line 187
    iget-object v12, p0, Ljavassist/compiler/AccessorMaker;->accessors:Ljava/util/HashMap;

    invoke-virtual {v12, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v11, v9

    .line 188
    goto :goto_21

    .line 169
    .end local v0    # "accDesc":Ljava/lang/String;
    .end local v3    # "code":Ljavassist/bytecode/Bytecode;
    .end local v9    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_85
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    invoke-static {v13}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ")"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "accDesc":Ljava/lang/String;
    goto :goto_4f

    .line 179
    .restart local v3    # "code":Ljavassist/bytecode/Bytecode;
    .restart local v9    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_a9
    const/4 v12, 0x0

    invoke-virtual {v3, v12}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 180
    sget-object v12, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {v3, v12, v6, v7}, Ljavassist/bytecode/Bytecode;->addGetfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    const/4 v12, 0x1

    invoke-virtual {v3, v12}, Ljavassist/bytecode/Bytecode;->setMaxLocals(I)V
    :try_end_b6
    .catch Ljavassist/CannotCompileException; {:try_start_2c .. :try_end_b6} :catch_b7
    .catch Ljavassist/NotFoundException; {:try_start_2c .. :try_end_b6} :catch_be

    goto :goto_6d

    .line 190
    .end local v0    # "accDesc":Ljava/lang/String;
    .end local v3    # "code":Ljavassist/bytecode/Bytecode;
    .end local v4    # "cp":Ljavassist/bytecode/ConstPool;
    .end local v7    # "fieldType":Ljava/lang/String;
    .end local v9    # "minfo":Ljavassist/bytecode/MethodInfo;
    .end local v10    # "pool":Ljavassist/ClassPool;
    :catch_b7
    move-exception v5

    .line 191
    .local v5, "e":Ljavassist/CannotCompileException;
    new-instance v12, Ljavassist/compiler/CompileError;

    invoke-direct {v12, v5}, Ljavassist/compiler/CompileError;-><init>(Ljavassist/CannotCompileException;)V

    throw v12

    .line 193
    .end local v5    # "e":Ljavassist/CannotCompileException;
    :catch_be
    move-exception v5

    .line 194
    .local v5, "e":Ljavassist/NotFoundException;
    new-instance v12, Ljavassist/compiler/CompileError;

    invoke-direct {v12, v5}, Ljavassist/compiler/CompileError;-><init>(Ljavassist/NotFoundException;)V

    throw v12
.end method

.method public getFieldSetter(Ljavassist/bytecode/FieldInfo;Z)Ljavassist/bytecode/MethodInfo;
    .registers 18
    .param p1, "finfo"    # Ljavassist/bytecode/FieldInfo;
    .param p2, "is_static"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 204
    invoke-virtual/range {p1 .. p1}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v6

    .line 205
    .local v6, "fieldName":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ":setter"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 206
    .local v8, "key":Ljava/lang/String;
    iget-object v13, p0, Ljavassist/compiler/AccessorMaker;->accessors:Ljava/util/HashMap;

    invoke-virtual {v13, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 207
    .local v12, "res":Ljava/lang/Object;
    if-eqz v12, :cond_22

    .line 208
    check-cast v12, Ljavassist/bytecode/MethodInfo;

    .line 243
    .end local v12    # "res":Ljava/lang/Object;
    :goto_21
    return-object v12

    .line 210
    .restart local v12    # "res":Ljava/lang/Object;
    :cond_22
    iget-object v13, p0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    invoke-virtual {v13}, Ljavassist/CtClass;->getClassFile()Ljavassist/bytecode/ClassFile;

    move-result-object v2

    .line 211
    .local v2, "cf":Ljavassist/bytecode/ClassFile;
    invoke-direct {p0, v2}, Ljavassist/compiler/AccessorMaker;->findAccessorName(Ljavassist/bytecode/ClassFile;)Ljava/lang/String;

    move-result-object v1

    .line 213
    .local v1, "accName":Ljava/lang/String;
    :try_start_2c
    invoke-virtual {v2}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v4

    .line 214
    .local v4, "cp":Ljavassist/bytecode/ConstPool;
    iget-object v13, p0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    invoke-virtual {v13}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v10

    .line 215
    .local v10, "pool":Ljavassist/ClassPool;
    invoke-virtual/range {p1 .. p1}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v7

    .line 217
    .local v7, "fieldType":Ljava/lang/String;
    if-eqz p2, :cond_94

    .line 218
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ")V"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 222
    .local v0, "accDesc":Ljava/lang/String;
    :goto_55
    new-instance v9, Ljavassist/bytecode/MethodInfo;

    invoke-direct {v9, v4, v1, v0}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .local v9, "minfo":Ljavassist/bytecode/MethodInfo;
    const/16 v13, 0x8

    invoke-virtual {v9, v13}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 224
    new-instance v13, Ljavassist/bytecode/SyntheticAttribute;

    invoke-direct {v13, v4}, Ljavassist/bytecode/SyntheticAttribute;-><init>(Ljavassist/bytecode/ConstPool;)V

    invoke-virtual {v9, v13}, Ljavassist/bytecode/MethodInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 225
    new-instance v3, Ljavassist/bytecode/Bytecode;

    invoke-direct {v3, v4}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 227
    .local v3, "code":Ljavassist/bytecode/Bytecode;
    if-eqz p2, :cond_b8

    .line 228
    const/4 v13, 0x0

    invoke-static {v7, v10}, Ljavassist/bytecode/Descriptor;->toCtClass(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;

    move-result-object v14

    invoke-virtual {v3, v13, v14}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    move-result v11

    .line 229
    .local v11, "reg":I
    sget-object v13, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {v3, v13, v6, v7}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    :goto_7c
    const/4 v13, 0x0

    invoke-virtual {v3, v13}, Ljavassist/bytecode/Bytecode;->addReturn(Ljavassist/CtClass;)V

    .line 239
    invoke-virtual {v3, v11}, Ljavassist/bytecode/Bytecode;->setMaxLocals(I)V

    .line 240
    invoke-virtual {v3}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 241
    invoke-virtual {v2, v9}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V

    .line 242
    iget-object v13, p0, Ljavassist/compiler/AccessorMaker;->accessors:Ljava/util/HashMap;

    invoke-virtual {v13, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v12, v9

    .line 243
    goto :goto_21

    .line 220
    .end local v0    # "accDesc":Ljava/lang/String;
    .end local v3    # "code":Ljavassist/bytecode/Bytecode;
    .end local v9    # "minfo":Ljavassist/bytecode/MethodInfo;
    .end local v11    # "reg":I
    :cond_94
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    invoke-static {v14}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ")V"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "accDesc":Ljava/lang/String;
    goto :goto_55

    .line 232
    .restart local v3    # "code":Ljavassist/bytecode/Bytecode;
    .restart local v9    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_b8
    const/4 v13, 0x0

    invoke-virtual {v3, v13}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 233
    const/4 v13, 0x1

    invoke-static {v7, v10}, Ljavassist/bytecode/Descriptor;->toCtClass(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;

    move-result-object v14

    invoke-virtual {v3, v13, v14}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    move-result v13

    add-int/lit8 v11, v13, 0x1

    .line 235
    .restart local v11    # "reg":I
    sget-object v13, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {v3, v13, v6, v7}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_cc
    .catch Ljavassist/CannotCompileException; {:try_start_2c .. :try_end_cc} :catch_cd
    .catch Ljavassist/NotFoundException; {:try_start_2c .. :try_end_cc} :catch_d4

    goto :goto_7c

    .line 245
    .end local v0    # "accDesc":Ljava/lang/String;
    .end local v3    # "code":Ljavassist/bytecode/Bytecode;
    .end local v4    # "cp":Ljavassist/bytecode/ConstPool;
    .end local v7    # "fieldType":Ljava/lang/String;
    .end local v9    # "minfo":Ljavassist/bytecode/MethodInfo;
    .end local v10    # "pool":Ljavassist/ClassPool;
    .end local v11    # "reg":I
    :catch_cd
    move-exception v5

    .line 246
    .local v5, "e":Ljavassist/CannotCompileException;
    new-instance v13, Ljavassist/compiler/CompileError;

    invoke-direct {v13, v5}, Ljavassist/compiler/CompileError;-><init>(Ljavassist/CannotCompileException;)V

    throw v13

    .line 248
    .end local v5    # "e":Ljavassist/CannotCompileException;
    :catch_d4
    move-exception v5

    .line 249
    .local v5, "e":Ljavassist/NotFoundException;
    new-instance v13, Ljavassist/compiler/CompileError;

    invoke-direct {v13, v5}, Ljavassist/compiler/CompileError;-><init>(Ljavassist/NotFoundException;)V

    throw v13
.end method

.method public getMethodAccessor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljavassist/bytecode/MethodInfo;)Ljava/lang/String;
    .registers 22
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/String;
    .param p3, "accDesc"    # Ljava/lang/String;
    .param p4, "orig"    # Ljavassist/bytecode/MethodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 102
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ":"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 103
    .local v10, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Ljavassist/compiler/AccessorMaker;->accessors:Ljava/util/HashMap;

    invoke-virtual {v15, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 104
    .local v2, "accName":Ljava/lang/String;
    if-eqz v2, :cond_29

    move-object v3, v2

    .line 144
    .end local v2    # "accName":Ljava/lang/String;
    .local v3, "accName":Ljava/lang/String;
    :goto_28
    return-object v3

    .line 107
    .end local v3    # "accName":Ljava/lang/String;
    .restart local v2    # "accName":Ljava/lang/String;
    :cond_29
    move-object/from16 v0, p0

    iget-object v15, v0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    invoke-virtual {v15}, Ljavassist/CtClass;->getClassFile()Ljavassist/bytecode/ClassFile;

    move-result-object v4

    .line 108
    .local v4, "cf":Ljavassist/bytecode/ClassFile;
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Ljavassist/compiler/AccessorMaker;->findAccessorName(Ljavassist/bytecode/ClassFile;)Ljava/lang/String;

    move-result-object v2

    .line 110
    :try_start_37
    invoke-virtual {v4}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v6

    .line 111
    .local v6, "cp":Ljavassist/bytecode/ConstPool;
    move-object/from16 v0, p0

    iget-object v15, v0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    invoke-virtual {v15}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v13

    .line 112
    .local v13, "pool":Ljavassist/ClassPool;
    new-instance v11, Ljavassist/bytecode/MethodInfo;

    move-object/from16 v0, p3

    invoke-direct {v11, v6, v2, v0}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .local v11, "minfo":Ljavassist/bytecode/MethodInfo;
    const/16 v15, 0x8

    invoke-virtual {v11, v15}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 115
    new-instance v15, Ljavassist/bytecode/SyntheticAttribute;

    invoke-direct {v15, v6}, Ljavassist/bytecode/SyntheticAttribute;-><init>(Ljavassist/bytecode/ConstPool;)V

    invoke-virtual {v11, v15}, Ljavassist/bytecode/MethodInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 116
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/MethodInfo;->getExceptionsAttribute()Ljavassist/bytecode/ExceptionsAttribute;

    move-result-object v8

    .line 117
    .local v8, "ea":Ljavassist/bytecode/ExceptionsAttribute;
    if-eqz v8, :cond_65

    .line 118
    const/4 v15, 0x0

    invoke-virtual {v8, v6, v15}, Ljavassist/bytecode/ExceptionsAttribute;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v15

    invoke-virtual {v11, v15}, Ljavassist/bytecode/MethodInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 120
    :cond_65
    move-object/from16 v0, p3

    invoke-static {v0, v13}, Ljavassist/bytecode/Descriptor;->getParameterTypes(Ljava/lang/String;Ljavassist/ClassPool;)[Ljavassist/CtClass;

    move-result-object v12

    .line 121
    .local v12, "params":[Ljavassist/CtClass;
    const/4 v14, 0x0

    .line 122
    .local v14, "regno":I
    new-instance v5, Ljavassist/bytecode/Bytecode;

    invoke-direct {v5, v6}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 123
    .local v5, "code":Ljavassist/bytecode/Bytecode;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_72
    array-length v15, v12

    if-ge v9, v15, :cond_7f

    .line 124
    aget-object v15, v12, v9

    invoke-virtual {v5, v14, v15}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    move-result v15

    add-int/2addr v14, v15

    .line 123
    add-int/lit8 v9, v9, 0x1

    goto :goto_72

    .line 126
    :cond_7f
    invoke-virtual {v5, v14}, Ljavassist/bytecode/Bytecode;->setMaxLocals(I)V

    .line 127
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    if-ne v0, v1, :cond_b0

    .line 128
    move-object/from16 v0, p0

    iget-object v15, v0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v5, v15, v0, v1}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    :goto_93
    move-object/from16 v0, p2

    invoke-static {v0, v13}, Ljavassist/bytecode/Descriptor;->getReturnType(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;

    move-result-object v15

    invoke-virtual {v5, v15}, Ljavassist/bytecode/Bytecode;->addReturn(Ljavassist/CtClass;)V

    .line 133
    invoke-virtual {v5}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v15

    invoke-virtual {v11, v15}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 134
    invoke-virtual {v4, v11}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V
    :try_end_a6
    .catch Ljavassist/CannotCompileException; {:try_start_37 .. :try_end_a6} :catch_bc
    .catch Ljavassist/NotFoundException; {:try_start_37 .. :try_end_a6} :catch_c3

    .line 143
    move-object/from16 v0, p0

    iget-object v15, v0, Ljavassist/compiler/AccessorMaker;->accessors:Ljava/util/HashMap;

    invoke-virtual {v15, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    .line 144
    .end local v2    # "accName":Ljava/lang/String;
    .restart local v3    # "accName":Ljava/lang/String;
    goto/16 :goto_28

    .line 130
    .end local v3    # "accName":Ljava/lang/String;
    .restart local v2    # "accName":Ljava/lang/String;
    :cond_b0
    :try_start_b0
    move-object/from16 v0, p0

    iget-object v15, v0, Ljavassist/compiler/AccessorMaker;->clazz:Ljavassist/CtClass;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v5, v15, v0, v1}, Ljavassist/bytecode/Bytecode;->addInvokevirtual(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_bb
    .catch Ljavassist/CannotCompileException; {:try_start_b0 .. :try_end_bb} :catch_bc
    .catch Ljavassist/NotFoundException; {:try_start_b0 .. :try_end_bb} :catch_c3

    goto :goto_93

    .line 136
    .end local v5    # "code":Ljavassist/bytecode/Bytecode;
    .end local v6    # "cp":Ljavassist/bytecode/ConstPool;
    .end local v8    # "ea":Ljavassist/bytecode/ExceptionsAttribute;
    .end local v9    # "i":I
    .end local v11    # "minfo":Ljavassist/bytecode/MethodInfo;
    .end local v12    # "params":[Ljavassist/CtClass;
    .end local v13    # "pool":Ljavassist/ClassPool;
    .end local v14    # "regno":I
    :catch_bc
    move-exception v7

    .line 137
    .local v7, "e":Ljavassist/CannotCompileException;
    new-instance v15, Ljavassist/compiler/CompileError;

    invoke-direct {v15, v7}, Ljavassist/compiler/CompileError;-><init>(Ljavassist/CannotCompileException;)V

    throw v15

    .line 139
    .end local v7    # "e":Ljavassist/CannotCompileException;
    :catch_c3
    move-exception v7

    .line 140
    .local v7, "e":Ljavassist/NotFoundException;
    new-instance v15, Ljavassist/compiler/CompileError;

    invoke-direct {v15, v7}, Ljavassist/compiler/CompileError;-><init>(Ljavassist/NotFoundException;)V

    throw v15
.end method
