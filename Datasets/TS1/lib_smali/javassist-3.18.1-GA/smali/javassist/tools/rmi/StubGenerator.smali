.class public Ljavassist/tools/rmi/StubGenerator;
.super Ljava/lang/Object;
.source "StubGenerator.java"

# interfaces
.implements Ljavassist/Translator;


# static fields
.field private static final accessorObjectId:Ljava/lang/String; = "_getObjectId"

.field private static final fieldImporter:Ljava/lang/String; = "importer"

.field private static final fieldObjectId:Ljava/lang/String; = "objectId"

.field private static final sampleClass:Ljava/lang/String; = "javassist.tools.rmi.Sample"


# instance fields
.field private classPool:Ljavassist/ClassPool;

.field private exceptionForProxy:[Ljavassist/CtClass;

.field private forwardMethod:Ljavassist/CtMethod;

.field private forwardStaticMethod:Ljavassist/CtMethod;

.field private interfacesForProxy:[Ljavassist/CtClass;

.field private proxyClasses:Ljava/util/Hashtable;

.field private proxyConstructorParamTypes:[Ljavassist/CtClass;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Ljavassist/tools/rmi/StubGenerator;->proxyClasses:Ljava/util/Hashtable;

    .line 63
    return-void
.end method

.method private addMethods(Ljavassist/CtClass;[Ljava/lang/reflect/Method;)V
    .registers 14
    .param p1, "proxy"    # Ljavassist/CtClass;
    .param p2, "ms"    # [Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 202
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    array-length v0, p2

    if-ge v7, v0, :cond_65

    .line 203
    aget-object v8, p2, v7

    .line 204
    .local v8, "m":Ljava/lang/reflect/Method;
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v9

    .line 205
    .local v9, "mod":I
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Object;

    if-eq v0, v1, :cond_4b

    invoke-static {v9}, Ljavassist/Modifier;->isFinal(I)Z

    move-result v0

    if-nez v0, :cond_4b

    .line 207
    invoke-static {v9}, Ljavassist/Modifier;->isPublic(I)Z

    move-result v0

    if-eqz v0, :cond_51

    .line 209
    invoke-static {v9}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 210
    iget-object v4, p0, Ljavassist/tools/rmi/StubGenerator;->forwardStaticMethod:Ljavassist/CtMethod;

    .line 214
    .local v4, "body":Ljavassist/CtMethod;
    :goto_26
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0}, Ljavassist/tools/rmi/StubGenerator;->toCtClass(Ljava/lang/Class;)Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    invoke-direct {p0, v2}, Ljavassist/tools/rmi/StubGenerator;->toCtClass([Ljava/lang/Class;)[Ljavassist/CtClass;

    move-result-object v2

    iget-object v3, p0, Ljavassist/tools/rmi/StubGenerator;->exceptionForProxy:[Ljavassist/CtClass;

    invoke-static {v7}, Ljavassist/CtMethod$ConstParameter;->integer(I)Ljavassist/CtMethod$ConstParameter;

    move-result-object v5

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Ljavassist/CtNewMethod;->wrapped(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtMethod;

    move-result-object v10

    .line 222
    .local v10, "wmethod":Ljavassist/CtMethod;
    invoke-virtual {v10, v9}, Ljavassist/CtMethod;->setModifiers(I)V

    .line 223
    invoke-virtual {p1, v10}, Ljavassist/CtClass;->addMethod(Ljavassist/CtMethod;)V

    .line 202
    .end local v4    # "body":Ljavassist/CtMethod;
    .end local v10    # "wmethod":Ljavassist/CtMethod;
    :cond_4b
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 212
    :cond_4e
    iget-object v4, p0, Ljavassist/tools/rmi/StubGenerator;->forwardMethod:Ljavassist/CtMethod;

    .restart local v4    # "body":Ljavassist/CtMethod;
    goto :goto_26

    .line 225
    .end local v4    # "body":Ljavassist/CtMethod;
    :cond_51
    invoke-static {v9}, Ljavassist/Modifier;->isProtected(I)Z

    move-result v0

    if-nez v0, :cond_4b

    invoke-static {v9}, Ljavassist/Modifier;->isPrivate(I)Z

    move-result v0

    if-nez v0, :cond_4b

    .line 228
    new-instance v0, Ljavassist/CannotCompileException;

    const-string v1, "the methods must be public, protected, or private."

    invoke-direct {v0, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 231
    .end local v8    # "m":Ljava/lang/reflect/Method;
    .end local v9    # "mod":I
    :cond_65
    return-void
.end method

.method private modifySuperclass(Ljavassist/CtClass;)V
    .registers 4
    .param p1, "orgclass"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 241
    :goto_0
    invoke-virtual {p1}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v0

    .line 242
    .local v0, "superclazz":Ljavassist/CtClass;
    if-nez v0, :cond_7

    .line 255
    :goto_6
    return-void

    .line 246
    :cond_7
    const/4 v1, 0x0

    :try_start_8
    invoke-virtual {v0, v1}, Ljavassist/CtClass;->getDeclaredConstructor([Ljavassist/CtClass;)Ljavassist/CtConstructor;
    :try_end_b
    .catch Ljavassist/NotFoundException; {:try_start_8 .. :try_end_b} :catch_c

    goto :goto_6

    .line 249
    :catch_c
    move-exception v1

    .line 252
    invoke-static {v0}, Ljavassist/CtNewConstructor;->defaultConstructor(Ljavassist/CtClass;)Ljavassist/CtConstructor;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavassist/CtClass;->addConstructor(Ljavassist/CtConstructor;)V

    .line 240
    move-object p1, v0

    goto :goto_0
.end method

.method private produceProxyClass(Ljavassist/CtClass;Ljava/lang/Class;)Ljavassist/CtClass;
    .registers 12
    .param p1, "orgclass"    # Ljavassist/CtClass;
    .param p2, "orgRtClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x2

    .line 131
    invoke-virtual {p1}, Ljavassist/CtClass;->getModifiers()I

    move-result v3

    .line 132
    .local v3, "modify":I
    invoke-static {v3}, Ljavassist/Modifier;->isAbstract(I)Z

    move-result v5

    if-nez v5, :cond_17

    invoke-static {v3}, Ljavassist/Modifier;->isNative(I)Z

    move-result v5

    if-nez v5, :cond_17

    invoke-static {v3}, Ljavassist/Modifier;->isPublic(I)Z

    move-result v5

    if-nez v5, :cond_34

    .line 134
    :cond_17
    new-instance v5, Ljavassist/CannotCompileException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " must be public, non-native, and non-abstract."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 137
    :cond_34
    iget-object v5, p0, Ljavassist/tools/rmi/StubGenerator;->classPool:Ljavassist/ClassPool;

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljavassist/ClassPool;->makeClass(Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtClass;

    move-result-object v4

    .line 140
    .local v4, "proxy":Ljavassist/CtClass;
    iget-object v5, p0, Ljavassist/tools/rmi/StubGenerator;->interfacesForProxy:[Ljavassist/CtClass;

    invoke-virtual {v4, v5}, Ljavassist/CtClass;->setInterfaces([Ljavassist/CtClass;)V

    .line 142
    new-instance v2, Ljavassist/CtField;

    iget-object v5, p0, Ljavassist/tools/rmi/StubGenerator;->classPool:Ljavassist/ClassPool;

    const-string v6, "javassist.tools.rmi.ObjectImporter"

    invoke-virtual {v5, v6}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v5

    const-string v6, "importer"

    invoke-direct {v2, v5, v6, v4}, Ljavassist/CtField;-><init>(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)V

    .line 145
    .local v2, "f":Ljavassist/CtField;
    invoke-virtual {v2, v8}, Ljavassist/CtField;->setModifiers(I)V

    .line 146
    const/4 v5, 0x0

    invoke-static {v5}, Ljavassist/CtField$Initializer;->byParameter(I)Ljavassist/CtField$Initializer;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Ljavassist/CtClass;->addField(Ljavassist/CtField;Ljavassist/CtField$Initializer;)V

    .line 148
    new-instance v2, Ljavassist/CtField;

    .end local v2    # "f":Ljavassist/CtField;
    sget-object v5, Ljavassist/CtClass;->intType:Ljavassist/CtClass;

    const-string v6, "objectId"

    invoke-direct {v2, v5, v6, v4}, Ljavassist/CtField;-><init>(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)V

    .line 149
    .restart local v2    # "f":Ljavassist/CtField;
    invoke-virtual {v2, v8}, Ljavassist/CtField;->setModifiers(I)V

    .line 150
    const/4 v5, 0x1

    invoke-static {v5}, Ljavassist/CtField$Initializer;->byParameter(I)Ljavassist/CtField$Initializer;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Ljavassist/CtClass;->addField(Ljavassist/CtField;Ljavassist/CtField$Initializer;)V

    .line 152
    const-string v5, "_getObjectId"

    invoke-static {v5, v2}, Ljavassist/CtNewMethod;->getter(Ljava/lang/String;Ljavassist/CtField;)Ljavassist/CtMethod;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavassist/CtClass;->addMethod(Ljavassist/CtMethod;)V

    .line 154
    invoke-static {v4}, Ljavassist/CtNewConstructor;->defaultConstructor(Ljavassist/CtClass;)Ljavassist/CtConstructor;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavassist/CtClass;->addConstructor(Ljavassist/CtConstructor;)V

    .line 155
    iget-object v5, p0, Ljavassist/tools/rmi/StubGenerator;->proxyConstructorParamTypes:[Ljavassist/CtClass;

    const/4 v6, 0x0

    invoke-static {v5, v6, v4}, Ljavassist/CtNewConstructor;->skeleton([Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtClass;)Ljavassist/CtConstructor;

    move-result-object v0

    .line 158
    .local v0, "cons":Ljavassist/CtConstructor;
    invoke-virtual {v4, v0}, Ljavassist/CtClass;->addConstructor(Ljavassist/CtConstructor;)V

    .line 161
    :try_start_8f
    invoke-virtual {p2}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Ljavassist/tools/rmi/StubGenerator;->addMethods(Ljavassist/CtClass;[Ljava/lang/reflect/Method;)V
    :try_end_96
    .catch Ljava/lang/SecurityException; {:try_start_8f .. :try_end_96} :catch_97

    .line 162
    return-object v4

    .line 164
    :catch_97
    move-exception v1

    .line 165
    .local v1, "e":Ljava/lang/SecurityException;
    new-instance v5, Ljavassist/CannotCompileException;

    invoke-direct {v5, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method private toCtClass(Ljava/lang/Class;)Ljavassist/CtClass;
    .registers 6
    .param p1, "rtclass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 171
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-nez v2, :cond_11

    .line 172
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 183
    .local v0, "name":Ljava/lang/String;
    :goto_a
    iget-object v2, p0, Ljavassist/tools/rmi/StubGenerator;->classPool:Ljavassist/ClassPool;

    invoke-virtual {v2, v0}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v2

    return-object v2

    .line 174
    .end local v0    # "name":Ljava/lang/String;
    :cond_11
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 176
    .local v1, "sbuf":Ljava/lang/StringBuffer;
    :cond_16
    const-string v2, "[]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 177
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    .line 178
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-nez v2, :cond_16

    .line 179
    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 180
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "name":Ljava/lang/String;
    goto :goto_a
.end method

.method private toCtClass([Ljava/lang/Class;)[Ljavassist/CtClass;
    .registers 6
    .param p1, "rtclasses"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 187
    array-length v2, p1

    .line 188
    .local v2, "n":I
    new-array v0, v2, [Ljavassist/CtClass;

    .line 189
    .local v0, "ctclasses":[Ljavassist/CtClass;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    if-ge v1, v2, :cond_11

    .line 190
    aget-object v3, p1, v1

    invoke-direct {p0, v3}, Ljavassist/tools/rmi/StubGenerator;->toCtClass(Ljava/lang/Class;)Ljavassist/CtClass;

    move-result-object v3

    aput-object v3, v0, v1

    .line 189
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 192
    :cond_11
    return-object v0
.end method


# virtual methods
.method public isProxyClass(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 101
    iget-object v0, p0, Ljavassist/tools/rmi/StubGenerator;->proxyClasses:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public declared-synchronized makeProxyClass(Ljava/lang/Class;)Z
    .registers 5
    .param p1, "clazz"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 116
    monitor-enter p0

    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "classname":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/tools/rmi/StubGenerator;->proxyClasses:Ljava/util/Hashtable;

    invoke-virtual {v2, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_24

    move-result-object v2

    if-eqz v2, :cond_10

    .line 118
    const/4 v2, 0x0

    .line 124
    :goto_e
    monitor-exit p0

    return v2

    .line 120
    :cond_10
    :try_start_10
    iget-object v2, p0, Ljavassist/tools/rmi/StubGenerator;->classPool:Ljavassist/ClassPool;

    invoke-virtual {v2, v0}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v2

    invoke-direct {p0, v2, p1}, Ljavassist/tools/rmi/StubGenerator;->produceProxyClass(Ljavassist/CtClass;Ljava/lang/Class;)Ljavassist/CtClass;

    move-result-object v1

    .line 122
    .local v1, "ctclazz":Ljavassist/CtClass;
    iget-object v2, p0, Ljavassist/tools/rmi/StubGenerator;->proxyClasses:Ljava/util/Hashtable;

    invoke-virtual {v2, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    invoke-direct {p0, v1}, Ljavassist/tools/rmi/StubGenerator;->modifySuperclass(Ljavassist/CtClass;)V
    :try_end_22
    .catchall {:try_start_10 .. :try_end_22} :catchall_24

    .line 124
    const/4 v2, 0x1

    goto :goto_e

    .line 116
    .end local v0    # "classname":Ljava/lang/String;
    .end local v1    # "ctclazz":Ljavassist/CtClass;
    :catchall_24
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public onLoad(Ljavassist/ClassPool;Ljava/lang/String;)V
    .registers 3
    .param p1, "pool"    # Ljavassist/ClassPool;
    .param p2, "classname"    # Ljava/lang/String;

    .prologue
    .line 92
    return-void
.end method

.method public start(Ljavassist/ClassPool;)V
    .registers 8
    .param p1, "pool"    # Ljavassist/ClassPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 72
    iput-object p1, p0, Ljavassist/tools/rmi/StubGenerator;->classPool:Ljavassist/ClassPool;

    .line 73
    const-string v1, "javassist.tools.rmi.Sample"

    invoke-virtual {p1, v1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 74
    .local v0, "c":Ljavassist/CtClass;
    const-string v1, "forward"

    invoke-virtual {v0, v1}, Ljavassist/CtClass;->getDeclaredMethod(Ljava/lang/String;)Ljavassist/CtMethod;

    move-result-object v1

    iput-object v1, p0, Ljavassist/tools/rmi/StubGenerator;->forwardMethod:Ljavassist/CtMethod;

    .line 75
    const-string v1, "forwardStatic"

    invoke-virtual {v0, v1}, Ljavassist/CtClass;->getDeclaredMethod(Ljava/lang/String;)Ljavassist/CtMethod;

    move-result-object v1

    iput-object v1, p0, Ljavassist/tools/rmi/StubGenerator;->forwardStaticMethod:Ljavassist/CtMethod;

    .line 77
    new-array v1, v5, [Ljava/lang/String;

    const-string v2, "javassist.tools.rmi.ObjectImporter"

    aput-object v2, v1, v3

    const-string v2, "int"

    aput-object v2, v1, v4

    invoke-virtual {p1, v1}, Ljavassist/ClassPool;->get([Ljava/lang/String;)[Ljavassist/CtClass;

    move-result-object v1

    iput-object v1, p0, Ljavassist/tools/rmi/StubGenerator;->proxyConstructorParamTypes:[Ljavassist/CtClass;

    .line 80
    new-array v1, v5, [Ljava/lang/String;

    const-string v2, "java.io.Serializable"

    aput-object v2, v1, v3

    const-string v2, "javassist.tools.rmi.Proxy"

    aput-object v2, v1, v4

    invoke-virtual {p1, v1}, Ljavassist/ClassPool;->get([Ljava/lang/String;)[Ljavassist/CtClass;

    move-result-object v1

    iput-object v1, p0, Ljavassist/tools/rmi/StubGenerator;->interfacesForProxy:[Ljavassist/CtClass;

    .line 83
    new-array v1, v4, [Ljavassist/CtClass;

    const-string v2, "javassist.tools.rmi.RemoteException"

    invoke-virtual {p1, v2}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v2

    aput-object v2, v1, v3

    iput-object v1, p0, Ljavassist/tools/rmi/StubGenerator;->exceptionForProxy:[Ljavassist/CtClass;

    .line 85
    return-void
.end method
