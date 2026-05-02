.class public Ljavassist/CtNewMethod;
.super Ljava/lang/Object;
.source "CtNewMethod.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static abstractMethod(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtClass;)Ljavassist/CtMethod;
    .registers 6
    .param p0, "returnType"    # Ljavassist/CtClass;
    .param p1, "mname"    # Ljava/lang/String;
    .param p2, "parameters"    # [Ljavassist/CtClass;
    .param p3, "exceptions"    # [Ljavassist/CtClass;
    .param p4, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 208
    new-instance v0, Ljavassist/CtMethod;

    invoke-direct {v0, p0, p1, p2, p4}, Ljavassist/CtMethod;-><init>(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;Ljavassist/CtClass;)V

    .line 209
    .local v0, "cm":Ljavassist/CtMethod;
    invoke-virtual {v0, p3}, Ljavassist/CtMethod;->setExceptionTypes([Ljavassist/CtClass;)V

    .line 210
    return-object v0
.end method

.method public static copy(Ljavassist/CtMethod;Ljava/lang/String;Ljavassist/CtClass;Ljavassist/ClassMap;)Ljavassist/CtMethod;
    .registers 5
    .param p0, "src"    # Ljavassist/CtMethod;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "declaring"    # Ljavassist/CtClass;
    .param p3, "map"    # Ljavassist/ClassMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 185
    new-instance v0, Ljavassist/CtMethod;

    invoke-direct {v0, p0, p2, p3}, Ljavassist/CtMethod;-><init>(Ljavassist/CtMethod;Ljavassist/CtClass;Ljavassist/ClassMap;)V

    .line 186
    .local v0, "cm":Ljavassist/CtMethod;
    invoke-virtual {v0, p1}, Ljavassist/CtMethod;->setName(Ljava/lang/String;)V

    .line 187
    return-object v0
.end method

.method public static copy(Ljavassist/CtMethod;Ljavassist/CtClass;Ljavassist/ClassMap;)Ljavassist/CtMethod;
    .registers 4
    .param p0, "src"    # Ljavassist/CtMethod;
    .param p1, "declaring"    # Ljavassist/CtClass;
    .param p2, "map"    # Ljavassist/ClassMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 163
    new-instance v0, Ljavassist/CtMethod;

    invoke-direct {v0, p0, p1, p2}, Ljavassist/CtMethod;-><init>(Ljavassist/CtMethod;Ljavassist/CtClass;Ljavassist/ClassMap;)V

    return-object v0
.end method

.method public static delegator(Ljavassist/CtMethod;Ljavassist/CtClass;)Ljavassist/CtMethod;
    .registers 4
    .param p0, "delegate"    # Ljavassist/CtMethod;
    .param p1, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 325
    :try_start_0
    invoke-static {p0, p1}, Ljavassist/CtNewMethod;->delegator0(Ljavassist/CtMethod;Ljavassist/CtClass;)Ljavassist/CtMethod;
    :try_end_3
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 327
    :catch_5
    move-exception v0

    .line 328
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljavassist/CannotCompileException;

    invoke-direct {v1, v0}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v1
.end method

.method private static delegator0(Ljavassist/CtMethod;Ljavassist/CtClass;)Ljavassist/CtMethod;
    .registers 16
    .param p0, "delegate"    # Ljavassist/CtMethod;
    .param p1, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x2

    const/4 v13, 0x0

    .line 335
    invoke-virtual {p0}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v3

    .line 336
    .local v3, "deleInfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v3}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v7

    .line 337
    .local v7, "methodName":Ljava/lang/String;
    invoke-virtual {v3}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v4

    .line 338
    .local v4, "desc":Ljava/lang/String;
    invoke-virtual {p1}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v11

    invoke-virtual {v11}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v1

    .line 339
    .local v1, "cp":Ljavassist/bytecode/ConstPool;
    new-instance v8, Ljavassist/bytecode/MethodInfo;

    invoke-direct {v8, v1, v7, v4}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    .local v8, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v3}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v11

    invoke-virtual {v8, v11}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 342
    invoke-virtual {v3}, Ljavassist/bytecode/MethodInfo;->getExceptionsAttribute()Ljavassist/bytecode/ExceptionsAttribute;

    move-result-object v5

    .line 343
    .local v5, "eattr":Ljavassist/bytecode/ExceptionsAttribute;
    if-eqz v5, :cond_32

    .line 344
    const/4 v11, 0x0

    invoke-virtual {v5, v1, v11}, Ljavassist/bytecode/ExceptionsAttribute;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v11

    check-cast v11, Ljavassist/bytecode/ExceptionsAttribute;

    invoke-virtual {v8, v11}, Ljavassist/bytecode/MethodInfo;->setExceptionsAttribute(Ljavassist/bytecode/ExceptionsAttribute;)V

    .line 347
    :cond_32
    new-instance v0, Ljavassist/bytecode/Bytecode;

    invoke-direct {v0, v1, v13, v13}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 348
    .local v0, "code":Ljavassist/bytecode/Bytecode;
    invoke-virtual {p0}, Ljavassist/CtMethod;->getModifiers()I

    move-result v11

    invoke-static {v11}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v6

    .line 349
    .local v6, "isStatic":Z
    invoke-virtual {p0}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v2

    .line 350
    .local v2, "deleClass":Ljavassist/CtClass;
    invoke-virtual {p0}, Ljavassist/CtMethod;->getParameterTypes()[Ljavassist/CtClass;

    move-result-object v9

    .line 352
    .local v9, "params":[Ljavassist/CtClass;
    if-eqz v6, :cond_6f

    .line 353
    invoke-virtual {v0, v9, v13}, Ljavassist/bytecode/Bytecode;->addLoadParameters([Ljavassist/CtClass;I)I

    move-result v10

    .line 354
    .local v10, "s":I
    invoke-virtual {v0, v2, v7, v4}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    :goto_50
    invoke-virtual {p0}, Ljavassist/CtMethod;->getReturnType()Ljavassist/CtClass;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljavassist/bytecode/Bytecode;->addReturn(Ljavassist/CtClass;)V

    .line 363
    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->setMaxLocals(I)V

    .line 364
    if-ge v10, v12, :cond_5f

    move v10, v12

    .end local v10    # "s":I
    :cond_5f
    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->setMaxStack(I)V

    .line 365
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 367
    new-instance v11, Ljavassist/CtMethod;

    invoke-direct {v11, v8, p1}, Ljavassist/CtMethod;-><init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V

    return-object v11

    .line 357
    :cond_6f
    invoke-virtual {v0, v13, v2}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    .line 358
    const/4 v11, 0x1

    invoke-virtual {v0, v9, v11}, Ljavassist/bytecode/Bytecode;->addLoadParameters([Ljavassist/CtClass;I)I

    move-result v10

    .line 359
    .restart local v10    # "s":I
    invoke-virtual {v0, v2, v7, v4}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_50
.end method

.method public static getter(Ljava/lang/String;Ljavassist/CtField;)Ljavassist/CtMethod;
    .registers 14
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "field"    # Ljavassist/CtField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 225
    invoke-virtual {p1}, Ljavassist/CtField;->getFieldInfo2()Ljavassist/bytecode/FieldInfo;

    move-result-object v7

    .line 226
    .local v7, "finfo":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v7}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v6

    .line 227
    .local v6, "fieldType":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "()"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 228
    .local v3, "desc":Ljava/lang/String;
    invoke-virtual {v7}, Ljavassist/bytecode/FieldInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    .line 229
    .local v2, "cp":Ljavassist/bytecode/ConstPool;
    new-instance v8, Ljavassist/bytecode/MethodInfo;

    invoke-direct {v8, v2, p0, v3}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    .local v8, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v8, v11}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 232
    new-instance v1, Ljavassist/bytecode/Bytecode;

    const/4 v9, 0x2

    invoke-direct {v1, v2, v9, v11}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 234
    .local v1, "code":Ljavassist/bytecode/Bytecode;
    :try_start_2e
    invoke-virtual {v7}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v5

    .line 235
    .local v5, "fieldName":Ljava/lang/String;
    invoke-virtual {v7}, Ljavassist/bytecode/FieldInfo;->getAccessFlags()I

    move-result v9

    and-int/lit8 v9, v9, 0x8

    if-nez v9, :cond_5b

    .line 236
    const/4 v9, 0x0

    invoke-virtual {v1, v9}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 237
    sget-object v9, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {v1, v9, v5, v6}, Ljavassist/bytecode/Bytecode;->addGetfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    :goto_43
    invoke-virtual {p1}, Ljavassist/CtField;->getType()Ljavassist/CtClass;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljavassist/bytecode/Bytecode;->addReturn(Ljavassist/CtClass;)V
    :try_end_4a
    .catch Ljavassist/NotFoundException; {:try_start_2e .. :try_end_4a} :catch_61

    .line 248
    invoke-virtual {v1}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 249
    invoke-virtual {p1}, Ljavassist/CtField;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    .line 251
    .local v0, "cc":Ljavassist/CtClass;
    new-instance v9, Ljavassist/CtMethod;

    invoke-direct {v9, v8, v0}, Ljavassist/CtMethod;-><init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V

    return-object v9

    .line 240
    .end local v0    # "cc":Ljavassist/CtClass;
    :cond_5b
    :try_start_5b
    sget-object v9, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {v1, v9, v5, v6}, Ljavassist/bytecode/Bytecode;->addGetstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_60
    .catch Ljavassist/NotFoundException; {:try_start_5b .. :try_end_60} :catch_61

    goto :goto_43

    .line 244
    .end local v5    # "fieldName":Ljava/lang/String;
    :catch_61
    move-exception v4

    .line 245
    .local v4, "e":Ljavassist/NotFoundException;
    new-instance v9, Ljavassist/CannotCompileException;

    invoke-direct {v9, v4}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v9
.end method

.method public static make(ILjavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtMethod;
    .registers 10
    .param p0, "modifiers"    # I
    .param p1, "returnType"    # Ljavassist/CtClass;
    .param p2, "mname"    # Ljava/lang/String;
    .param p3, "parameters"    # [Ljavassist/CtClass;
    .param p4, "exceptions"    # [Ljavassist/CtClass;
    .param p5, "body"    # Ljava/lang/String;
    .param p6, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 134
    :try_start_0
    new-instance v0, Ljavassist/CtMethod;

    invoke-direct {v0, p1, p2, p3, p6}, Ljavassist/CtMethod;-><init>(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;Ljavassist/CtClass;)V

    .line 136
    .local v0, "cm":Ljavassist/CtMethod;
    invoke-virtual {v0, p0}, Ljavassist/CtMethod;->setModifiers(I)V

    .line 137
    invoke-virtual {v0, p4}, Ljavassist/CtMethod;->setExceptionTypes([Ljavassist/CtClass;)V

    .line 138
    invoke-virtual {v0, p5}, Ljavassist/CtMethod;->setBody(Ljava/lang/String;)V
    :try_end_e
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_e} :catch_f

    .line 139
    return-object v0

    .line 141
    .end local v0    # "cm":Ljavassist/CtMethod;
    :catch_f
    move-exception v1

    .line 142
    .local v1, "e":Ljavassist/NotFoundException;
    new-instance v2, Ljavassist/CannotCompileException;

    invoke-direct {v2, v1}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v2
.end method

.method public static make(Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtMethod;
    .registers 3
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 45
    invoke-static {p0, p1, v0, v0}, Ljavassist/CtNewMethod;->make(Ljava/lang/String;Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtMethod;

    move-result-object v0

    return-object v0
.end method

.method public static make(Ljava/lang/String;Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtMethod;
    .registers 9
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "declaring"    # Ljavassist/CtClass;
    .param p2, "delegateObj"    # Ljava/lang/String;
    .param p3, "delegateMethod"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 69
    new-instance v0, Ljavassist/compiler/Javac;

    invoke-direct {v0, p1}, Ljavassist/compiler/Javac;-><init>(Ljavassist/CtClass;)V

    .line 71
    .local v0, "compiler":Ljavassist/compiler/Javac;
    if-eqz p3, :cond_a

    .line 72
    :try_start_7
    invoke-virtual {v0, p2, p3}, Ljavassist/compiler/Javac;->recordProceed(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    :cond_a
    invoke-virtual {v0, p0}, Ljavassist/compiler/Javac;->compile(Ljava/lang/String;)Ljavassist/CtMember;

    move-result-object v2

    .line 75
    .local v2, "obj":Ljavassist/CtMember;
    instance-of v3, v2, Ljavassist/CtMethod;

    if-eqz v3, :cond_1c

    .line 76
    check-cast v2, Ljavassist/CtMethod;
    :try_end_14
    .catch Ljavassist/compiler/CompileError; {:try_start_7 .. :try_end_14} :catch_15

    .end local v2    # "obj":Ljavassist/CtMember;
    return-object v2

    .line 78
    :catch_15
    move-exception v1

    .line 79
    .local v1, "e":Ljavassist/compiler/CompileError;
    new-instance v3, Ljavassist/CannotCompileException;

    invoke-direct {v3, v1}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v3

    .line 82
    .end local v1    # "e":Ljavassist/compiler/CompileError;
    .restart local v2    # "obj":Ljavassist/CtMember;
    :cond_1c
    new-instance v3, Ljavassist/CannotCompileException;

    const-string v4, "not a method"

    invoke-direct {v3, v4}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static make(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtMethod;
    .registers 13
    .param p0, "returnType"    # Ljavassist/CtClass;
    .param p1, "mname"    # Ljava/lang/String;
    .param p2, "parameters"    # [Ljavassist/CtClass;
    .param p3, "exceptions"    # [Ljavassist/CtClass;
    .param p4, "body"    # Ljava/lang/String;
    .param p5, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 106
    const/4 v0, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Ljavassist/CtNewMethod;->make(ILjavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtMethod;

    move-result-object v0

    return-object v0
.end method

.method public static setter(Ljava/lang/String;Ljavassist/CtField;)Ljavassist/CtMethod;
    .registers 15
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "field"    # Ljavassist/CtField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x1

    .line 268
    invoke-virtual {p1}, Ljavassist/CtField;->getFieldInfo2()Ljavassist/bytecode/FieldInfo;

    move-result-object v7

    .line 269
    .local v7, "finfo":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v7}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v6

    .line 270
    .local v6, "fieldType":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ")V"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 271
    .local v3, "desc":Ljava/lang/String;
    invoke-virtual {v7}, Ljavassist/bytecode/FieldInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    .line 272
    .local v2, "cp":Ljavassist/bytecode/ConstPool;
    new-instance v8, Ljavassist/bytecode/MethodInfo;

    invoke-direct {v8, v2, p0, v3}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    .local v8, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v8, v11}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 275
    new-instance v1, Ljavassist/bytecode/Bytecode;

    invoke-direct {v1, v2, v12, v12}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 277
    .local v1, "code":Ljavassist/bytecode/Bytecode;
    :try_start_34
    invoke-virtual {v7}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v5

    .line 278
    .local v5, "fieldName":Ljava/lang/String;
    invoke-virtual {v7}, Ljavassist/bytecode/FieldInfo;->getAccessFlags()I

    move-result v9

    and-int/lit8 v9, v9, 0x8

    if-nez v9, :cond_66

    .line 279
    const/4 v9, 0x0

    invoke-virtual {v1, v9}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 280
    const/4 v9, 0x1

    invoke-virtual {p1}, Ljavassist/CtField;->getType()Ljavassist/CtClass;

    move-result-object v10

    invoke-virtual {v1, v9, v10}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    .line 281
    sget-object v9, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {v1, v9, v5, v6}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    :goto_51
    const/4 v9, 0x0

    invoke-virtual {v1, v9}, Ljavassist/bytecode/Bytecode;->addReturn(Ljavassist/CtClass;)V
    :try_end_55
    .catch Ljavassist/NotFoundException; {:try_start_34 .. :try_end_55} :catch_74

    .line 294
    invoke-virtual {v1}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 295
    invoke-virtual {p1}, Ljavassist/CtField;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    .line 297
    .local v0, "cc":Ljavassist/CtClass;
    new-instance v9, Ljavassist/CtMethod;

    invoke-direct {v9, v8, v0}, Ljavassist/CtMethod;-><init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V

    return-object v9

    .line 284
    .end local v0    # "cc":Ljavassist/CtClass;
    :cond_66
    const/4 v9, 0x1

    :try_start_67
    invoke-virtual {p1}, Ljavassist/CtField;->getType()Ljavassist/CtClass;

    move-result-object v10

    invoke-virtual {v1, v9, v10}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    .line 285
    sget-object v9, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-virtual {v1, v9, v5, v6}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_73
    .catch Ljavassist/NotFoundException; {:try_start_67 .. :try_end_73} :catch_74

    goto :goto_51

    .line 290
    .end local v5    # "fieldName":Ljava/lang/String;
    :catch_74
    move-exception v4

    .line 291
    .local v4, "e":Ljavassist/NotFoundException;
    new-instance v9, Ljavassist/CannotCompileException;

    invoke-direct {v9, v4}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v9
.end method

.method public static wrapped(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtMethod;
    .registers 8
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
    .line 473
    invoke-static/range {p0 .. p6}, Ljavassist/CtNewWrappedMethod;->wrapped(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtMethod;

    move-result-object v0

    return-object v0
.end method
