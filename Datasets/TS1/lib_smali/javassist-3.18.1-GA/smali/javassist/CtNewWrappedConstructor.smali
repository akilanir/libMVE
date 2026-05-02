.class Ljavassist/CtNewWrappedConstructor;
.super Ljavassist/CtNewWrappedMethod;
.source "CtNewWrappedConstructor.java"


# static fields
.field private static final PASS_NONE:I = 0x0

.field private static final PASS_PARAMS:I = 0x2


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljavassist/CtNewWrappedMethod;-><init>()V

    return-void
.end method

.method protected static makeBody(Ljavassist/CtClass;Ljavassist/bytecode/ClassFile;ILjavassist/CtMethod;[Ljavassist/CtClass;Ljavassist/CtMethod$ConstParameter;)Ljavassist/bytecode/Bytecode;
    .registers 19
    .param p0, "declaring"    # Ljavassist/CtClass;
    .param p1, "classfile"    # Ljavassist/bytecode/ClassFile;
    .param p2, "howToCallSuper"    # I
    .param p3, "wrappedBody"    # Ljavassist/CtMethod;
    .param p4, "parameters"    # [Ljavassist/CtClass;
    .param p5, "cparam"    # Ljavassist/CtMethod$ConstParameter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-virtual {p1}, Ljavassist/bytecode/ClassFile;->getSuperclassId()I

    move-result v12

    .line 60
    .local v12, "superclazz":I
    new-instance v8, Ljavassist/bytecode/Bytecode;

    invoke-virtual {p1}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v8, v1, v2, v3}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 61
    .local v8, "code":Ljavassist/bytecode/Bytecode;
    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v8, v1, v0, v2}, Ljavassist/bytecode/Bytecode;->setMaxLocals(Z[Ljavassist/CtClass;I)V

    .line 62
    const/4 v1, 0x0

    invoke-virtual {v8, v1}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 63
    if-nez p2, :cond_2f

    .line 64
    const/4 v10, 0x1

    .line 65
    .local v10, "stacksize":I
    const-string v1, "<init>"

    const-string v2, "()V"

    invoke-virtual {v8, v12, v1, v2}, Ljavassist/bytecode/Bytecode;->addInvokespecial(ILjava/lang/String;Ljava/lang/String;)V

    .line 90
    :goto_24
    if-nez p3, :cond_69

    .line 91
    const/16 v1, 0xb1

    invoke-virtual {v8, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 100
    :cond_2b
    :goto_2b
    invoke-virtual {v8, v10}, Ljavassist/bytecode/Bytecode;->setMaxStack(I)V

    .line 101
    return-object v8

    .line 67
    .end local v10    # "stacksize":I
    :cond_2f
    const/4 v1, 0x2

    if-ne p2, v1, :cond_45

    .line 68
    const/4 v1, 0x1

    move-object/from16 v0, p4

    invoke-virtual {v8, v0, v1}, Ljavassist/bytecode/Bytecode;->addLoadParameters([Ljavassist/CtClass;I)I

    move-result v1

    add-int/lit8 v10, v1, 0x1

    .line 69
    .restart local v10    # "stacksize":I
    const-string v1, "<init>"

    invoke-static/range {p4 .. p4}, Ljavassist/bytecode/Descriptor;->ofConstructor([Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v12, v1, v2}, Ljavassist/bytecode/Bytecode;->addInvokespecial(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_24

    .line 73
    .end local v10    # "stacksize":I
    :cond_45
    const/4 v1, 0x1

    move-object/from16 v0, p4

    invoke-static {v8, v0, v1}, Ljavassist/CtNewWrappedConstructor;->compileParameterList(Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;I)I

    move-result v10

    .line 75
    .restart local v10    # "stacksize":I
    if-nez p5, :cond_5c

    .line 76
    const/4 v11, 0x2

    .line 77
    .local v11, "stacksize2":I
    invoke-static {}, Ljavassist/CtMethod$ConstParameter;->defaultConstDescriptor()Ljava/lang/String;

    move-result-object v9

    .line 84
    .local v9, "desc":Ljava/lang/String;
    :goto_53
    if-ge v10, v11, :cond_56

    .line 85
    move v10, v11

    .line 87
    :cond_56
    const-string v1, "<init>"

    invoke-virtual {v8, v12, v1, v9}, Ljavassist/bytecode/Bytecode;->addInvokespecial(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_24

    .line 80
    .end local v9    # "desc":Ljava/lang/String;
    .end local v11    # "stacksize2":I
    :cond_5c
    move-object/from16 v0, p5

    invoke-virtual {v0, v8}, Ljavassist/CtMethod$ConstParameter;->compile(Ljavassist/bytecode/Bytecode;)I

    move-result v1

    add-int/lit8 v11, v1, 0x2

    .line 81
    .restart local v11    # "stacksize2":I
    invoke-virtual/range {p5 .. p5}, Ljavassist/CtMethod$ConstParameter;->constDescriptor()Ljava/lang/String;

    move-result-object v9

    .restart local v9    # "desc":Ljava/lang/String;
    goto :goto_53

    .line 93
    .end local v9    # "desc":Ljava/lang/String;
    .end local v11    # "stacksize2":I
    :cond_69
    const/4 v4, 0x0

    sget-object v6, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    move-object v1, p0

    move-object v2, p1

    move-object/from16 v3, p3

    move-object/from16 v5, p4

    move-object/from16 v7, p5

    invoke-static/range {v1 .. v8}, Ljavassist/CtNewWrappedConstructor;->makeBody0(Ljavassist/CtClass;Ljavassist/bytecode/ClassFile;Ljavassist/CtMethod;Z[Ljavassist/CtClass;Ljavassist/CtClass;Ljavassist/CtMethod$ConstParameter;Ljavassist/bytecode/Bytecode;)I

    move-result v11

    .line 96
    .restart local v11    # "stacksize2":I
    if-ge v10, v11, :cond_2b

    .line 97
    move v10, v11

    goto :goto_2b
.end method

.method public static wrapped([Ljavassist/CtClass;[Ljavassist/CtClass;ILjavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtConstructor;
    .registers 15
    .param p0, "parameterTypes"    # [Ljavassist/CtClass;
    .param p1, "exceptionTypes"    # [Ljavassist/CtClass;
    .param p2, "howToCallSuper"    # I
    .param p3, "body"    # Ljavassist/CtMethod;
    .param p4, "constParam"    # Ljavassist/CtMethod$ConstParameter;
    .param p5, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 36
    :try_start_0
    new-instance v7, Ljavassist/CtConstructor;

    invoke-direct {v7, p0, p5}, Ljavassist/CtConstructor;-><init>([Ljavassist/CtClass;Ljavassist/CtClass;)V

    .line 37
    .local v7, "cons":Ljavassist/CtConstructor;
    invoke-virtual {v7, p1}, Ljavassist/CtConstructor;->setExceptionTypes([Ljavassist/CtClass;)V

    .line 38
    invoke-virtual {p5}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v1

    move-object v0, p5

    move v2, p2

    move-object v3, p3

    move-object v4, p0

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Ljavassist/CtNewWrappedConstructor;->makeBody(Ljavassist/CtClass;Ljavassist/bytecode/ClassFile;ILjavassist/CtMethod;[Ljavassist/CtClass;Ljavassist/CtMethod$ConstParameter;)Ljavassist/bytecode/Bytecode;

    move-result-object v6

    .line 41
    .local v6, "code":Ljavassist/bytecode/Bytecode;
    invoke-virtual {v7}, Ljavassist/CtConstructor;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v0

    invoke-virtual {v6}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V
    :try_end_20
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_20} :catch_21

    .line 43
    return-object v7

    .line 45
    .end local v6    # "code":Ljavassist/bytecode/Bytecode;
    .end local v7    # "cons":Ljavassist/CtConstructor;
    :catch_21
    move-exception v8

    .line 46
    .local v8, "e":Ljavassist/NotFoundException;
    new-instance v0, Ljavassist/CannotCompileException;

    invoke-direct {v0, v8}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v0
.end method
