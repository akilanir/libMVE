.class Ljavassist/CtNewWrappedMethod;
.super Ljava/lang/Object;
.source "CtNewWrappedMethod.java"


# static fields
.field private static final addedWrappedMethod:Ljava/lang/String; = "_added_m$"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addBodyMethod(Ljavassist/CtClassType;Ljavassist/bytecode/ClassFile;Ljavassist/CtMethod;)Ljava/lang/String;
    .registers 11
    .param p0, "clazz"    # Ljavassist/CtClassType;
    .param p1, "classfile"    # Ljavassist/bytecode/ClassFile;
    .param p2, "src"    # Ljavassist/CtMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-virtual {p0}, Ljavassist/CtClassType;->getHiddenMethods()Ljava/util/Hashtable;

    move-result-object v1

    .line 143
    .local v1, "bodies":Ljava/util/Hashtable;
    invoke-virtual {v1, p2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 144
    .local v3, "bodyname":Ljava/lang/String;
    if-nez v3, :cond_75

    .line 146
    :cond_c
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "_added_m$"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljavassist/CtClassType;->getUniqueNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 147
    invoke-virtual {p1, v3}, Ljavassist/bytecode/ClassFile;->getMethod(Ljava/lang/String;)Ljavassist/bytecode/MethodInfo;

    move-result-object v6

    if-nez v6, :cond_c

    .line 148
    new-instance v5, Ljavassist/ClassMap;

    invoke-direct {v5}, Ljavassist/ClassMap;-><init>()V

    .line 149
    .local v5, "map":Ljavassist/ClassMap;
    invoke-virtual {p2}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v6

    invoke-virtual {v6}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Ljavassist/CtClassType;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljavassist/ClassMap;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    new-instance v2, Ljavassist/bytecode/MethodInfo;

    invoke-virtual {p1}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v6

    invoke-virtual {p2}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v7

    invoke-direct {v2, v6, v3, v7, v5}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljavassist/bytecode/MethodInfo;Ljava/util/Map;)V

    .line 153
    .local v2, "body":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v2}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v0

    .line 154
    .local v0, "acc":I
    invoke-static {v0}, Ljavassist/bytecode/AccessFlag;->setPrivate(I)I

    move-result v6

    invoke-virtual {v2, v6}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 155
    new-instance v6, Ljavassist/bytecode/SyntheticAttribute;

    invoke-virtual {p1}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v7

    invoke-direct {v6, v7}, Ljavassist/bytecode/SyntheticAttribute;-><init>(Ljavassist/bytecode/ConstPool;)V

    invoke-virtual {v2, v6}, Ljavassist/bytecode/MethodInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 157
    invoke-virtual {p1, v2}, Ljavassist/bytecode/ClassFile;->addMethod(Ljavassist/bytecode/MethodInfo;)V

    .line 158
    invoke-virtual {v1, p2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    invoke-virtual {p0}, Ljavassist/CtClassType;->hasMemberCache()Ljavassist/CtMember$Cache;

    move-result-object v4

    .line 160
    .local v4, "cache":Ljavassist/CtMember$Cache;
    if-eqz v4, :cond_75

    .line 161
    new-instance v6, Ljavassist/CtMethod;

    invoke-direct {v6, v2, p0}, Ljavassist/CtMethod;-><init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V

    invoke-virtual {v4, v6}, Ljavassist/CtMember$Cache;->addMethod(Ljavassist/CtMember;)V

    .line 164
    .end local v0    # "acc":I
    .end local v2    # "body":Ljavassist/bytecode/MethodInfo;
    .end local v4    # "cache":Ljavassist/CtMember$Cache;
    .end local v5    # "map":Ljavassist/ClassMap;
    :cond_75
    return-object v3
.end method

.method private static checkSignature(Ljavassist/CtMethod;Ljava/lang/String;)V
    .registers 5
    .param p0, "wrappedBody"    # Ljavassist/CtMethod;
    .param p1, "descriptor"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-virtual {p0}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3d

    .line 131
    new-instance v0, Ljavassist/CannotCompileException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "wrapped method with a bad signature: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v2

    invoke-virtual {v2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_3d
    return-void
.end method

.method static compileParameterList(Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;I)I
    .registers 4
    .param p0, "code"    # Ljavassist/bytecode/Bytecode;
    .param p1, "params"    # [Ljavassist/CtClass;
    .param p2, "regno"    # I

    .prologue
    .line 176
    invoke-static {p0, p1, p2}, Ljavassist/compiler/JvstCodeGen;->compileParameterList(Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;I)I

    move-result v0

    return v0
.end method

.method private static compileReturn(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;)V
    .registers 6
    .param p0, "code"    # Ljavassist/bytecode/Bytecode;
    .param p1, "type"    # Ljavassist/CtClass;

    .prologue
    .line 183
    invoke-virtual {p1}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_27

    move-object v0, p1

    .line 184
    check-cast v0, Ljavassist/CtPrimitiveType;

    .line 185
    .local v0, "pt":Ljavassist/CtPrimitiveType;
    sget-object v2, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    if-eq v0, v2, :cond_1f

    .line 186
    invoke-virtual {v0}, Ljavassist/CtPrimitiveType;->getWrapperName()Ljava/lang/String;

    move-result-object v1

    .line 187
    .local v1, "wrapper":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addCheckcast(Ljava/lang/String;)V

    .line 188
    invoke-virtual {v0}, Ljavassist/CtPrimitiveType;->getGetMethodName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljavassist/CtPrimitiveType;->getGetMethodDescriptor()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v1, v2, v3}, Ljavassist/bytecode/Bytecode;->addInvokevirtual(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .end local v1    # "wrapper":Ljava/lang/String;
    :cond_1f
    invoke-virtual {v0}, Ljavassist/CtPrimitiveType;->getReturnOp()I

    move-result v2

    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 198
    .end local v0    # "pt":Ljavassist/CtPrimitiveType;
    :goto_26
    return-void

    .line 195
    :cond_27
    invoke-virtual {p0, p1}, Ljavassist/bytecode/Bytecode;->addCheckcast(Ljavassist/CtClass;)V

    .line 196
    const/16 v2, 0xb0

    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_26
.end method

.method static makeBody(Ljavassist/CtClass;Ljavassist/bytecode/ClassFile;Ljavassist/CtMethod;[Ljavassist/CtClass;Ljavassist/CtClass;Ljavassist/CtMethod$ConstParameter;)Ljavassist/bytecode/Bytecode;
    .registers 16
    .param p0, "clazz"    # Ljavassist/CtClass;
    .param p1, "classfile"    # Ljavassist/bytecode/ClassFile;
    .param p2, "wrappedBody"    # Ljavassist/CtMethod;
    .param p3, "parameters"    # [Ljavassist/CtClass;
    .param p4, "returnType"    # Ljavassist/CtClass;
    .param p5, "cparam"    # Ljavassist/CtMethod$ConstParameter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 60
    invoke-virtual {p2}, Ljavassist/CtMethod;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v3

    .line 61
    .local v3, "isStatic":Z
    new-instance v7, Ljavassist/bytecode/Bytecode;

    invoke-virtual {p1}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    invoke-direct {v7, v0, v9, v9}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .local v7, "code":Ljavassist/bytecode/Bytecode;
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .line 62
    invoke-static/range {v0 .. v7}, Ljavassist/CtNewWrappedMethod;->makeBody0(Ljavassist/CtClass;Ljavassist/bytecode/ClassFile;Ljavassist/CtMethod;Z[Ljavassist/CtClass;Ljavassist/CtClass;Ljavassist/CtMethod$ConstParameter;Ljavassist/bytecode/Bytecode;)I

    move-result v8

    .line 64
    .local v8, "stacksize":I
    invoke-virtual {v7, v8}, Ljavassist/bytecode/Bytecode;->setMaxStack(I)V

    .line 65
    invoke-virtual {v7, v3, p3, v9}, Ljavassist/bytecode/Bytecode;->setMaxLocals(Z[Ljavassist/CtClass;I)V

    .line 66
    return-object v7
.end method

.method protected static makeBody0(Ljavassist/CtClass;Ljavassist/bytecode/ClassFile;Ljavassist/CtMethod;Z[Ljavassist/CtClass;Ljavassist/CtClass;Ljavassist/CtMethod$ConstParameter;Ljavassist/bytecode/Bytecode;)I
    .registers 16
    .param p0, "clazz"    # Ljavassist/CtClass;
    .param p1, "classfile"    # Ljavassist/bytecode/ClassFile;
    .param p2, "wrappedBody"    # Ljavassist/CtMethod;
    .param p3, "isStatic"    # Z
    .param p4, "parameters"    # [Ljavassist/CtClass;
    .param p5, "returnType"    # Ljavassist/CtClass;
    .param p6, "cparam"    # Ljavassist/CtMethod$ConstParameter;
    .param p7, "code"    # Ljavassist/bytecode/Bytecode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 79
    instance-of v6, p0, Ljavassist/CtClassType;

    if-nez v6, :cond_22

    .line 80
    new-instance v5, Ljavassist/CannotCompileException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "bad declaring class"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 83
    :cond_22
    if-nez p3, :cond_27

    .line 84
    invoke-virtual {p7, v5}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 86
    :cond_27
    if-eqz p3, :cond_4e

    :goto_29
    invoke-static {p7, p4, v5}, Ljavassist/CtNewWrappedMethod;->compileParameterList(Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;I)I

    move-result v3

    .line 90
    .local v3, "stacksize":I
    if-nez p6, :cond_50

    .line 91
    const/4 v4, 0x0

    .line 92
    .local v4, "stacksize2":I
    invoke-static {}, Ljavassist/CtMethod$ConstParameter;->defaultDescriptor()Ljava/lang/String;

    move-result-object v1

    .line 99
    .local v1, "desc":Ljava/lang/String;
    :goto_34
    invoke-static {p2, v1}, Ljavassist/CtNewWrappedMethod;->checkSignature(Ljavassist/CtMethod;Ljava/lang/String;)V

    .line 103
    :try_start_37
    check-cast p0, Ljavassist/CtClassType;

    .end local p0    # "clazz":Ljavassist/CtClass;
    invoke-static {p0, p1, p2}, Ljavassist/CtNewWrappedMethod;->addBodyMethod(Ljavassist/CtClassType;Ljavassist/bytecode/ClassFile;Ljavassist/CtMethod;)Ljava/lang/String;
    :try_end_3c
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_37 .. :try_end_3c} :catch_59

    move-result-object v0

    .line 113
    .local v0, "bodyname":Ljava/lang/String;
    if-eqz p3, :cond_60

    .line 114
    sget-object v5, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {p7, v5, v0, v1}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    :goto_44
    invoke-static {p7, p5}, Ljavassist/CtNewWrappedMethod;->compileReturn(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;)V

    .line 120
    add-int/lit8 v5, v4, 0x2

    if-ge v3, v5, :cond_4d

    .line 121
    add-int/lit8 v3, v4, 0x2

    .line 123
    :cond_4d
    return v3

    .line 86
    .end local v0    # "bodyname":Ljava/lang/String;
    .end local v1    # "desc":Ljava/lang/String;
    .end local v3    # "stacksize":I
    .end local v4    # "stacksize2":I
    .restart local p0    # "clazz":Ljavassist/CtClass;
    :cond_4e
    const/4 v5, 0x1

    goto :goto_29

    .line 95
    .restart local v3    # "stacksize":I
    :cond_50
    invoke-virtual {p6, p7}, Ljavassist/CtMethod$ConstParameter;->compile(Ljavassist/bytecode/Bytecode;)I

    move-result v4

    .line 96
    .restart local v4    # "stacksize2":I
    invoke-virtual {p6}, Ljavassist/CtMethod$ConstParameter;->descriptor()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "desc":Ljava/lang/String;
    goto :goto_34

    .line 109
    .end local p0    # "clazz":Ljavassist/CtClass;
    :catch_59
    move-exception v2

    .line 110
    .local v2, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v5, Ljavassist/CannotCompileException;

    invoke-direct {v5, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 116
    .end local v2    # "e":Ljavassist/bytecode/BadBytecode;
    .restart local v0    # "bodyname":Ljava/lang/String;
    :cond_60
    sget-object v5, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {p7, v5, v0, v1}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_44
.end method

.method public static wrapped(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtMethod;
    .registers 18
    .param p0, "returnType"    # Ljavassist/CtClass;
    .param p1, "mname"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljavassist/CtClass;
    .param p3, "exceptionTypes"    # [Ljavassist/CtClass;
    .param p4, "body"    # Ljavassist/CtMethod;
    .param p5, "constParam"    # Ljavassist/CtMethod$ConstParameter;
    .param p6, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 35
    new-instance v10, Ljavassist/CtMethod;

    move-object/from16 v0, p6

    invoke-direct {v10, p0, p1, p2, v0}, Ljavassist/CtMethod;-><init>(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;Ljavassist/CtClass;)V

    .line 37
    .local v10, "mt":Ljavassist/CtMethod;
    invoke-virtual {p4}, Ljavassist/CtMethod;->getModifiers()I

    move-result v1

    invoke-virtual {v10, v1}, Ljavassist/CtMethod;->setModifiers(I)V

    .line 39
    :try_start_e
    invoke-virtual {v10, p3}, Ljavassist/CtMethod;->setExceptionTypes([Ljavassist/CtClass;)V
    :try_end_11
    .catch Ljavassist/NotFoundException; {:try_start_e .. :try_end_11} :catch_2c

    .line 45
    invoke-virtual/range {p6 .. p6}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v2

    move-object/from16 v1, p6

    move-object v3, p4

    move-object v4, p2

    move-object v5, p0

    move-object/from16 v6, p5

    invoke-static/range {v1 .. v6}, Ljavassist/CtNewWrappedMethod;->makeBody(Ljavassist/CtClass;Ljavassist/bytecode/ClassFile;Ljavassist/CtMethod;[Ljavassist/CtClass;Ljavassist/CtClass;Ljavassist/CtMethod$ConstParameter;)Ljavassist/bytecode/Bytecode;

    move-result-object v7

    .line 47
    .local v7, "code":Ljavassist/bytecode/Bytecode;
    invoke-virtual {v10}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v9

    .line 48
    .local v9, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v7}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 50
    return-object v10

    .line 41
    .end local v7    # "code":Ljavassist/bytecode/Bytecode;
    .end local v9    # "minfo":Ljavassist/bytecode/MethodInfo;
    :catch_2c
    move-exception v8

    .line 42
    .local v8, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljavassist/CannotCompileException;

    invoke-direct {v1, v8}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v1
.end method
