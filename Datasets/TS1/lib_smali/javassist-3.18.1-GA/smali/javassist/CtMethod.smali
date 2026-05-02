.class public final Ljavassist/CtMethod;
.super Ljavassist/CtBehavior;
.source "CtMethod.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/CtMethod$StringConstParameter;,
        Ljavassist/CtMethod$LongConstParameter;,
        Ljavassist/CtMethod$IntConstParameter;,
        Ljavassist/CtMethod$ConstParameter;
    }
.end annotation


# instance fields
.field protected cachedStringRep:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;Ljavassist/CtClass;)V
    .registers 8
    .param p1, "returnType"    # Ljavassist/CtClass;
    .param p2, "mname"    # Ljava/lang/String;
    .param p3, "parameters"    # [Ljavassist/CtClass;
    .param p4, "declaring"    # Ljavassist/CtClass;

    .prologue
    .line 55
    const/4 v2, 0x0

    invoke-direct {p0, v2, p4}, Ljavassist/CtMethod;-><init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V

    .line 56
    invoke-virtual {p4}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v2

    invoke-virtual {v2}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 57
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-static {p1, p3}, Ljavassist/bytecode/Descriptor;->ofMethod(Ljavassist/CtClass;[Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    .line 58
    .local v1, "desc":Ljava/lang/String;
    new-instance v2, Ljavassist/bytecode/MethodInfo;

    invoke-direct {v2, v0, p2, v1}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Ljavassist/CtMethod;->methodInfo:Ljavassist/bytecode/MethodInfo;

    .line 59
    const/16 v2, 0x401

    invoke-virtual {p0, v2}, Ljavassist/CtMethod;->setModifiers(I)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljavassist/CtMethod;Ljavassist/CtClass;Ljavassist/ClassMap;)V
    .registers 5
    .param p1, "src"    # Ljavassist/CtMethod;
    .param p2, "declaring"    # Ljavassist/CtClass;
    .param p3, "map"    # Ljavassist/ClassMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 113
    const/4 v0, 0x0

    invoke-direct {p0, v0, p2}, Ljavassist/CtMethod;-><init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V

    .line 114
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p3}, Ljavassist/CtMethod;->copy(Ljavassist/CtBehavior;ZLjavassist/ClassMap;)V

    .line 115
    return-void
.end method

.method constructor <init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V
    .registers 4
    .param p1, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .param p2, "declaring"    # Ljavassist/CtClass;

    .prologue
    .line 38
    invoke-direct {p0, p2, p1}, Ljavassist/CtBehavior;-><init>(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/CtMethod;->cachedStringRep:Ljava/lang/String;

    .line 40
    return-void
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
    .line 130
    invoke-static {p0, p1}, Ljavassist/CtNewMethod;->make(Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtMethod;

    move-result-object v0

    return-object v0
.end method

.method public static make(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)Ljavassist/CtMethod;
    .registers 4
    .param p0, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .param p1, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 145
    invoke-virtual {p1}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v1

    if-eq v0, v1, :cond_16

    .line 146
    new-instance v0, Ljavassist/CannotCompileException;

    const-string v1, "bad declaring class"

    invoke-direct {v0, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_16
    new-instance v0, Ljavassist/CtMethod;

    invoke-direct {v0, p0, p1}, Ljavassist/CtMethod;-><init>(Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 183
    if-eqz p1, :cond_18

    instance-of v0, p1, Ljavassist/CtMethod;

    if-eqz v0, :cond_18

    check-cast p1, Ljavassist/CtMethod;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljavassist/CtMethod;->getStringRep()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/CtMethod;->getStringRep()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public getLongName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v1

    invoke-virtual {v1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/CtMethod;->getSignature()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljavassist/bytecode/Descriptor;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 202
    iget-object v0, p0, Ljavassist/CtMethod;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getReturnType()Ljavassist/CtClass;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 217
    invoke-virtual {p0}, Ljavassist/CtMethod;->getReturnType0()Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method final getStringRep()Ljava/lang/String;
    .registers 3

    .prologue
    .line 171
    iget-object v0, p0, Ljavassist/CtMethod;->cachedStringRep:Ljava/lang/String;

    if-nez v0, :cond_27

    .line 172
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Ljavassist/CtMethod;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v1}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ljavassist/CtMethod;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v1}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljavassist/bytecode/Descriptor;->getParamDescriptor(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/CtMethod;->cachedStringRep:Ljava/lang/String;

    .line 175
    :cond_27
    iget-object v0, p0, Ljavassist/CtMethod;->cachedStringRep:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 157
    invoke-virtual {p0}, Ljavassist/CtMethod;->getStringRep()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 7

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 225
    invoke-virtual {p0}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v4

    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 226
    .local v0, "ca":Ljavassist/bytecode/CodeAttribute;
    if-nez v0, :cond_17

    .line 227
    invoke-virtual {p0}, Ljavassist/CtMethod;->getModifiers()I

    move-result v4

    and-int/lit16 v4, v4, 0x400

    if-eqz v4, :cond_15

    .line 235
    :cond_14
    :goto_14
    return v2

    :cond_15
    move v2, v3

    .line 227
    goto :goto_14

    .line 229
    :cond_17
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v1

    .line 231
    .local v1, "it":Ljavassist/bytecode/CodeIterator;
    :try_start_1b
    invoke-virtual {v1}, Ljavassist/bytecode/CodeIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_33

    invoke-virtual {v1}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v4

    invoke-virtual {v1, v4}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v4

    const/16 v5, 0xb1

    if-ne v4, v5, :cond_33

    invoke-virtual {v1}, Ljavassist/bytecode/CodeIterator;->hasNext()Z
    :try_end_30
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_1b .. :try_end_30} :catch_35

    move-result v4

    if-eqz v4, :cond_14

    :cond_33
    move v2, v3

    goto :goto_14

    .line 234
    :catch_35
    move-exception v2

    move v2, v3

    .line 235
    goto :goto_14
.end method

.method nameReplaced()V
    .registers 2

    .prologue
    .line 165
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/CtMethod;->cachedStringRep:Ljava/lang/String;

    .line 166
    return-void
.end method

.method public setBody(Ljavassist/CtMethod;Ljavassist/ClassMap;)V
    .registers 7
    .param p1, "src"    # Ljavassist/CtMethod;
    .param p2, "map"    # Ljavassist/ClassMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 255
    iget-object v0, p1, Ljavassist/CtMethod;->declaringClass:Ljavassist/CtClass;

    iget-object v1, p1, Ljavassist/CtMethod;->methodInfo:Ljavassist/bytecode/MethodInfo;

    iget-object v2, p0, Ljavassist/CtMethod;->declaringClass:Ljavassist/CtClass;

    iget-object v3, p0, Ljavassist/CtMethod;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-static {v0, v1, v2, v3, p2}, Ljavassist/CtMethod;->setBody0(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;Ljavassist/ClassMap;)V

    .line 257
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "newname"    # Ljava/lang/String;

    .prologue
    .line 209
    iget-object v0, p0, Ljavassist/CtMethod;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 210
    iget-object v0, p0, Ljavassist/CtMethod;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/MethodInfo;->setName(Ljava/lang/String;)V

    .line 211
    return-void
.end method

.method public setWrappedBody(Ljavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;)V
    .registers 12
    .param p1, "mbody"    # Ljavassist/CtMethod;
    .param p2, "constParam"    # Ljavassist/CtMethod$ConstParameter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 273
    iget-object v1, p0, Ljavassist/CtMethod;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v1}, Ljavassist/CtClass;->checkModify()V

    .line 275
    invoke-virtual {p0}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    .line 279
    .local v0, "clazz":Ljavassist/CtClass;
    :try_start_9
    invoke-virtual {p0}, Ljavassist/CtMethod;->getParameterTypes()[Ljavassist/CtClass;

    move-result-object v3

    .line 280
    .local v3, "params":[Ljavassist/CtClass;
    invoke-virtual {p0}, Ljavassist/CtMethod;->getReturnType()Ljavassist/CtClass;
    :try_end_10
    .catch Ljavassist/NotFoundException; {:try_start_9 .. :try_end_10} :catch_32

    move-result-object v4

    .line 286
    .local v4, "retType":Ljavassist/CtClass;
    invoke-virtual {v0}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v1

    move-object v2, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Ljavassist/CtNewWrappedMethod;->makeBody(Ljavassist/CtClass;Ljavassist/bytecode/ClassFile;Ljavassist/CtMethod;[Ljavassist/CtClass;Ljavassist/CtClass;Ljavassist/CtMethod$ConstParameter;)Ljavassist/bytecode/Bytecode;

    move-result-object v7

    .line 291
    .local v7, "code":Ljavassist/bytecode/Bytecode;
    invoke-virtual {v7}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v6

    .line 292
    .local v6, "cattr":Ljavassist/bytecode/CodeAttribute;
    iget-object v1, p0, Ljavassist/CtMethod;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v1, v6}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 293
    iget-object v1, p0, Ljavassist/CtMethod;->methodInfo:Ljavassist/bytecode/MethodInfo;

    iget-object v2, p0, Ljavassist/CtMethod;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v2}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v2

    and-int/lit16 v2, v2, -0x401

    invoke-virtual {v1, v2}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 296
    return-void

    .line 282
    .end local v3    # "params":[Ljavassist/CtClass;
    .end local v4    # "retType":Ljavassist/CtClass;
    .end local v6    # "cattr":Ljavassist/bytecode/CodeAttribute;
    .end local v7    # "code":Ljavassist/bytecode/Bytecode;
    :catch_32
    move-exception v8

    .line 283
    .local v8, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljavassist/CannotCompileException;

    invoke-direct {v1, v8}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v1
.end method
