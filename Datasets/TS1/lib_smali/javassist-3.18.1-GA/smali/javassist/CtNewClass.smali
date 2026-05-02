.class Ljavassist/CtNewClass;
.super Ljavassist/CtClassType;
.source "CtNewClass.java"


# instance fields
.field protected hasConstructor:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Ljavassist/ClassPool;ZLjavassist/CtClass;)V
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "isInterface"    # Z
    .param p4, "superclass"    # Ljavassist/CtClass;

    .prologue
    const/4 v2, 0x1

    .line 30
    invoke-direct {p0, p1, p2}, Ljavassist/CtClassType;-><init>(Ljava/lang/String;Ljavassist/ClassPool;)V

    .line 31
    iput-boolean v2, p0, Ljavassist/CtNewClass;->wasChanged:Z

    .line 33
    if-nez p3, :cond_a

    if-nez p4, :cond_32

    .line 34
    :cond_a
    const/4 v0, 0x0

    .line 38
    .local v0, "superName":Ljava/lang/String;
    :goto_b
    new-instance v1, Ljavassist/bytecode/ClassFile;

    invoke-direct {v1, p3, p1, v0}, Ljavassist/bytecode/ClassFile;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Ljavassist/CtNewClass;->classfile:Ljavassist/bytecode/ClassFile;

    .line 39
    if-eqz p3, :cond_24

    if-eqz p4, :cond_24

    .line 40
    iget-object v1, p0, Ljavassist/CtNewClass;->classfile:Ljavassist/bytecode/ClassFile;

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {p4}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ClassFile;->setInterfaces([Ljava/lang/String;)V

    .line 42
    :cond_24
    invoke-virtual {p0}, Ljavassist/CtNewClass;->getModifiers()I

    move-result v1

    invoke-static {v1}, Ljavassist/Modifier;->setPublic(I)I

    move-result v1

    invoke-virtual {p0, v1}, Ljavassist/CtNewClass;->setModifiers(I)V

    .line 43
    iput-boolean p3, p0, Ljavassist/CtNewClass;->hasConstructor:Z

    .line 44
    return-void

    .line 36
    .end local v0    # "superName":Ljava/lang/String;
    :cond_32
    invoke-virtual {p4}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "superName":Ljava/lang/String;
    goto :goto_b
.end method

.method private isInheritable(ILjavassist/CtClass;)Z
    .registers 8
    .param p1, "mod"    # I
    .param p2, "superclazz"    # Ljavassist/CtClass;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 112
    invoke-static {p1}, Ljavassist/Modifier;->isPrivate(I)Z

    move-result v4

    if-eqz v4, :cond_a

    move v2, v3

    .line 124
    :cond_9
    :goto_9
    return v2

    .line 115
    :cond_a
    invoke-static {p1}, Ljavassist/Modifier;->isPackage(I)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 116
    invoke-virtual {p0}, Ljavassist/CtNewClass;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "pname":Ljava/lang/String;
    invoke-virtual {p2}, Ljavassist/CtClass;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 118
    .local v1, "pname2":Ljava/lang/String;
    if-nez v0, :cond_1e

    .line 119
    if-eqz v1, :cond_9

    move v2, v3

    goto :goto_9

    .line 121
    :cond_1e
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_9
.end method


# virtual methods
.method public addConstructor(Ljavassist/CtConstructor;)V
    .registers 3
    .param p1, "c"    # Ljavassist/CtConstructor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljavassist/CtNewClass;->hasConstructor:Z

    .line 57
    invoke-super {p0, p1}, Ljavassist/CtClassType;->addConstructor(Ljavassist/CtConstructor;)V

    .line 58
    return-void
.end method

.method protected extendToString(Ljava/lang/StringBuffer;)V
    .registers 3
    .param p1, "buffer"    # Ljava/lang/StringBuffer;

    .prologue
    .line 47
    iget-boolean v0, p0, Ljavassist/CtNewClass;->hasConstructor:Z

    if-eqz v0, :cond_9

    .line 48
    const-string v0, "hasConstructor "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 50
    :cond_9
    invoke-super {p0, p1}, Ljavassist/CtClassType;->extendToString(Ljava/lang/StringBuffer;)V

    .line 51
    return-void
.end method

.method public inheritAllConstructors()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 88
    invoke-virtual {p0}, Ljavassist/CtNewClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v6

    .line 89
    .local v6, "superclazz":Ljavassist/CtClass;
    invoke-virtual {v6}, Ljavassist/CtClass;->getDeclaredConstructors()[Ljavassist/CtConstructor;

    move-result-object v2

    .line 91
    .local v2, "cs":[Ljavassist/CtConstructor;
    const/4 v5, 0x0

    .line 92
    .local v5, "n":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_a
    array-length v7, v2

    if-ge v3, v7, :cond_32

    .line 93
    aget-object v0, v2, v3

    .line 94
    .local v0, "c":Ljavassist/CtConstructor;
    invoke-virtual {v0}, Ljavassist/CtConstructor;->getModifiers()I

    move-result v4

    .line 95
    .local v4, "mod":I
    invoke-direct {p0, v4, v6}, Ljavassist/CtNewClass;->isInheritable(ILjavassist/CtClass;)Z

    move-result v7

    if-eqz v7, :cond_2f

    .line 96
    invoke-virtual {v0}, Ljavassist/CtConstructor;->getParameterTypes()[Ljavassist/CtClass;

    move-result-object v7

    invoke-virtual {v0}, Ljavassist/CtConstructor;->getExceptionTypes()[Ljavassist/CtClass;

    move-result-object v8

    invoke-static {v7, v8, p0}, Ljavassist/CtNewConstructor;->make([Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtClass;)Ljavassist/CtConstructor;

    move-result-object v1

    .line 99
    .local v1, "cons":Ljavassist/CtConstructor;
    and-int/lit8 v7, v4, 0x7

    invoke-virtual {v1, v7}, Ljavassist/CtConstructor;->setModifiers(I)V

    .line 100
    invoke-virtual {p0, v1}, Ljavassist/CtNewClass;->addConstructor(Ljavassist/CtConstructor;)V

    .line 101
    add-int/lit8 v5, v5, 0x1

    .line 92
    .end local v1    # "cons":Ljavassist/CtConstructor;
    :cond_2f
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 105
    .end local v0    # "c":Ljavassist/CtConstructor;
    .end local v4    # "mod":I
    :cond_32
    const/4 v7, 0x1

    if-ge v5, v7, :cond_52

    .line 106
    new-instance v7, Ljavassist/CannotCompileException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "no inheritable constructor in "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 109
    :cond_52
    return-void
.end method

.method public toBytecode(Ljava/io/DataOutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    iget-boolean v1, p0, Ljavassist/CtNewClass;->hasConstructor:Z

    if-nez v1, :cond_a

    .line 65
    :try_start_4
    invoke-virtual {p0}, Ljavassist/CtNewClass;->inheritAllConstructors()V

    .line 66
    const/4 v1, 0x1

    iput-boolean v1, p0, Ljavassist/CtNewClass;->hasConstructor:Z
    :try_end_a
    .catch Ljavassist/NotFoundException; {:try_start_4 .. :try_end_a} :catch_e

    .line 72
    :cond_a
    invoke-super {p0, p1}, Ljavassist/CtClassType;->toBytecode(Ljava/io/DataOutputStream;)V

    .line 73
    return-void

    .line 68
    :catch_e
    move-exception v0

    .line 69
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljavassist/CannotCompileException;

    invoke-direct {v1, v0}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v1
.end method
