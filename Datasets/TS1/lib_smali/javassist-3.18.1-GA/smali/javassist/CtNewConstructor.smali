.class public Ljavassist/CtNewConstructor;
.super Ljava/lang/Object;
.source "CtNewConstructor.java"


# static fields
.field public static final PASS_ARRAY:I = 0x1

.field public static final PASS_NONE:I = 0x0

.field public static final PASS_PARAMS:I = 0x2


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copy(Ljavassist/CtConstructor;Ljavassist/CtClass;Ljavassist/ClassMap;)Ljavassist/CtConstructor;
    .registers 4
    .param p0, "c"    # Ljavassist/CtConstructor;
    .param p1, "declaring"    # Ljavassist/CtClass;
    .param p2, "map"    # Ljavassist/ClassMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Ljavassist/CtConstructor;

    invoke-direct {v0, p0, p1, p2}, Ljavassist/CtConstructor;-><init>(Ljavassist/CtConstructor;Ljavassist/CtClass;Ljavassist/ClassMap;)V

    return-object v0
.end method

.method public static defaultConstructor(Ljavassist/CtClass;)Ljavassist/CtConstructor;
    .registers 8
    .param p0, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 139
    new-instance v1, Ljavassist/CtConstructor;

    const/4 v4, 0x0

    check-cast v4, [Ljavassist/CtClass;

    invoke-direct {v1, v4, p0}, Ljavassist/CtConstructor;-><init>([Ljavassist/CtClass;Ljavassist/CtClass;)V

    .line 141
    .local v1, "cons":Ljavassist/CtConstructor;
    invoke-virtual {p0}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v4

    invoke-virtual {v4}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    .line 142
    .local v2, "cp":Ljavassist/bytecode/ConstPool;
    new-instance v0, Ljavassist/bytecode/Bytecode;

    invoke-direct {v0, v2, v5, v5}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 143
    .local v0, "code":Ljavassist/bytecode/Bytecode;
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 145
    :try_start_1a
    invoke-virtual {p0}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v4

    const-string v5, "<init>"

    const-string v6, "()V"

    invoke-virtual {v0, v4, v5, v6}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_25
    .catch Ljavassist/NotFoundException; {:try_start_1a .. :try_end_25} :catch_36

    .line 152
    const/16 v4, 0xb1

    invoke-virtual {v0, v4}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 155
    invoke-virtual {v1}, Ljavassist/CtConstructor;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v4

    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 156
    return-object v1

    .line 148
    :catch_36
    move-exception v3

    .line 149
    .local v3, "e":Ljavassist/NotFoundException;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-direct {v4, v3}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v4
.end method

.method public static make(Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtConstructor;
    .registers 7
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 68
    new-instance v0, Ljavassist/compiler/Javac;

    invoke-direct {v0, p1}, Ljavassist/compiler/Javac;-><init>(Ljavassist/CtClass;)V

    .line 70
    .local v0, "compiler":Ljavassist/compiler/Javac;
    :try_start_5
    invoke-virtual {v0, p0}, Ljavassist/compiler/Javac;->compile(Ljava/lang/String;)Ljavassist/CtMember;

    move-result-object v2

    .line 71
    .local v2, "obj":Ljavassist/CtMember;
    instance-of v3, v2, Ljavassist/CtConstructor;

    if-eqz v3, :cond_17

    .line 73
    check-cast v2, Ljavassist/CtConstructor;
    :try_end_f
    .catch Ljavassist/compiler/CompileError; {:try_start_5 .. :try_end_f} :catch_10

    .end local v2    # "obj":Ljavassist/CtMember;
    return-object v2

    .line 76
    :catch_10
    move-exception v1

    .line 77
    .local v1, "e":Ljavassist/compiler/CompileError;
    new-instance v3, Ljavassist/CannotCompileException;

    invoke-direct {v3, v1}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v3

    .line 80
    .end local v1    # "e":Ljavassist/compiler/CompileError;
    .restart local v2    # "obj":Ljavassist/CtMember;
    :cond_17
    new-instance v3, Ljavassist/CannotCompileException;

    const-string v4, "not a constructor"

    invoke-direct {v3, v4}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static make([Ljavassist/CtClass;[Ljavassist/CtClass;ILjavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtConstructor;
    .registers 7
    .param p0, "parameters"    # [Ljavassist/CtClass;
    .param p1, "exceptions"    # [Ljavassist/CtClass;
    .param p2, "howto"    # I
    .param p3, "body"    # Ljavassist/CtMethod;
    .param p4, "cparam"    # Ljavassist/CtMethod$ConstParameter;
    .param p5, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 314
    invoke-static/range {p0 .. p5}, Ljavassist/CtNewWrappedConstructor;->wrapped([Ljavassist/CtClass;[Ljavassist/CtClass;ILjavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtConstructor;

    move-result-object v0

    return-object v0
.end method

.method public static make([Ljavassist/CtClass;[Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtConstructor;
    .registers 7
    .param p0, "parameters"    # [Ljavassist/CtClass;
    .param p1, "exceptions"    # [Ljavassist/CtClass;
    .param p2, "body"    # Ljava/lang/String;
    .param p3, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 101
    :try_start_0
    new-instance v0, Ljavassist/CtConstructor;

    invoke-direct {v0, p0, p3}, Ljavassist/CtConstructor;-><init>([Ljavassist/CtClass;Ljavassist/CtClass;)V

    .line 102
    .local v0, "cc":Ljavassist/CtConstructor;
    invoke-virtual {v0, p1}, Ljavassist/CtConstructor;->setExceptionTypes([Ljavassist/CtClass;)V

    .line 103
    invoke-virtual {v0, p2}, Ljavassist/CtConstructor;->setBody(Ljava/lang/String;)V
    :try_end_b
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_b} :catch_c

    .line 104
    return-object v0

    .line 106
    .end local v0    # "cc":Ljavassist/CtConstructor;
    :catch_c
    move-exception v1

    .line 107
    .local v1, "e":Ljavassist/NotFoundException;
    new-instance v2, Ljavassist/CannotCompileException;

    invoke-direct {v2, v1}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v2
.end method

.method public static make([Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtClass;)Ljavassist/CtConstructor;
    .registers 9
    .param p0, "parameters"    # [Ljavassist/CtClass;
    .param p1, "exceptions"    # [Ljavassist/CtClass;
    .param p2, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 200
    const/4 v2, 0x2

    move-object v0, p0

    move-object v1, p1

    move-object v4, v3

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Ljavassist/CtNewConstructor;->make([Ljavassist/CtClass;[Ljavassist/CtClass;ILjavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtConstructor;

    move-result-object v0

    return-object v0
.end method

.method public static skeleton([Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtClass;)Ljavassist/CtConstructor;
    .registers 9
    .param p0, "parameters"    # [Ljavassist/CtClass;
    .param p1, "exceptions"    # [Ljavassist/CtClass;
    .param p2, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 181
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v4, v3

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Ljavassist/CtNewConstructor;->make([Ljavassist/CtClass;[Ljavassist/CtClass;ILjavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtConstructor;

    move-result-object v0

    return-object v0
.end method
