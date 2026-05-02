.class public Ljavassist/tools/reflect/Reflection;
.super Ljava/lang/Object;
.source "Reflection.java"

# interfaces
.implements Ljavassist/Translator;


# static fields
.field static final classMetaobjectClassName:Ljava/lang/String; = "javassist.tools.reflect.ClassMetaobject"

.field static final classobjectAccessor:Ljava/lang/String; = "_getClass"

.field static final classobjectField:Ljava/lang/String; = "_classobject"

.field static final metaobjectClassName:Ljava/lang/String; = "javassist.tools.reflect.Metaobject"

.field static final metaobjectField:Ljava/lang/String; = "_metaobject"

.field static final metaobjectGetter:Ljava/lang/String; = "_getMetaobject"

.field static final metaobjectSetter:Ljava/lang/String; = "_setMetaobject"

.field static final readPrefix:Ljava/lang/String; = "_r_"

.field static final writePrefix:Ljava/lang/String; = "_w_"


# instance fields
.field protected classPool:Ljavassist/ClassPool;

.field protected converter:Ljavassist/CodeConverter;

.field protected readParam:[Ljavassist/CtClass;

.field protected trapMethod:Ljavassist/CtMethod;

.field protected trapRead:Ljavassist/CtMethod;

.field protected trapStaticMethod:Ljavassist/CtMethod;

.field protected trapWrite:Ljavassist/CtMethod;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    .line 102
    new-instance v0, Ljavassist/CodeConverter;

    invoke-direct {v0}, Ljavassist/CodeConverter;-><init>()V

    iput-object v0, p0, Ljavassist/tools/reflect/Reflection;->converter:Ljavassist/CodeConverter;

    .line 103
    return-void
.end method

.method private findOriginal(Ljavassist/CtMethod;Z)Ljavassist/CtMethod;
    .registers 9
    .param p1, "m"    # Ljavassist/CtMethod;
    .param p2, "dontSearch"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 346
    if-eqz p2, :cond_3

    .line 359
    .end local p1    # "m":Ljavassist/CtMethod;
    :cond_2
    :goto_2
    return-object p1

    .line 349
    .restart local p1    # "m":Ljavassist/CtMethod;
    :cond_3
    invoke-virtual {p1}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v2

    .line 350
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p1}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v4

    invoke-virtual {v4}, Ljavassist/CtClass;->getDeclaredMethods()[Ljavassist/CtMethod;

    move-result-object v1

    .line 351
    .local v1, "ms":[Ljavassist/CtMethod;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    array-length v4, v1

    if-ge v0, v4, :cond_2

    .line 352
    aget-object v4, v1, v0

    invoke-virtual {v4}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v3

    .line 353
    .local v3, "orgName":Ljava/lang/String;
    invoke-virtual {v3, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3a

    const-string v4, "_m_"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3a

    aget-object v4, v1, v0

    invoke-virtual {v4}, Ljavassist/CtMethod;->getSignature()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Ljavassist/CtMethod;->getSignature()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3a

    .line 356
    aget-object p1, v1, v0

    goto :goto_2

    .line 351
    :cond_3a
    add-int/lit8 v0, v0, 0x1

    goto :goto_10
.end method

.method private isExcluded(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 89
    const-string v0, "_m_"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "_getClass"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "_setMetaobject"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "_getMetaobject"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "_r_"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_30

    const-string v0, "_w_"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_32

    :cond_30
    const/4 v0, 0x1

    :goto_31
    return v0

    :cond_32
    const/4 v0, 0x0

    goto :goto_31
.end method

.method private modifyClassfile(Ljavassist/CtClass;Ljavassist/CtClass;Ljavassist/CtClass;)Z
    .registers 11
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "metaobject"    # Ljavassist/CtClass;
    .param p3, "metaclass"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 249
    const-string v5, "Reflective"

    invoke-virtual {p1, v5}, Ljavassist/CtClass;->getAttribute(Ljava/lang/String;)[B

    move-result-object v5

    if-eqz v5, :cond_b

    .line 280
    :goto_a
    return v3

    .line 252
    :cond_b
    const-string v5, "Reflective"

    new-array v6, v3, [B

    invoke-virtual {p1, v5, v6}, Ljavassist/CtClass;->setAttribute(Ljava/lang/String;[B)V

    .line 254
    iget-object v5, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    const-string v6, "javassist.tools.reflect.Metalevel"

    invoke-virtual {v5, v6}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v2

    .line 255
    .local v2, "mlevel":Ljavassist/CtClass;
    invoke-virtual {p1, v2}, Ljavassist/CtClass;->subtypeOf(Ljavassist/CtClass;)Z

    move-result v5

    if-nez v5, :cond_88

    move v0, v4

    .line 256
    .local v0, "addMeta":Z
    :goto_21
    if-eqz v0, :cond_26

    .line 257
    invoke-virtual {p1, v2}, Ljavassist/CtClass;->addInterface(Ljavassist/CtClass;)V

    .line 259
    :cond_26
    invoke-direct {p0, p1, v0}, Ljavassist/tools/reflect/Reflection;->processMethods(Ljavassist/CtClass;Z)V

    .line 260
    invoke-direct {p0, p1}, Ljavassist/tools/reflect/Reflection;->processFields(Ljavassist/CtClass;)V

    .line 263
    if-eqz v0, :cond_5a

    .line 264
    new-instance v1, Ljavassist/CtField;

    iget-object v5, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    const-string v6, "javassist.tools.reflect.Metaobject"

    invoke-virtual {v5, v6}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v5

    const-string v6, "_metaobject"

    invoke-direct {v1, v5, v6, p1}, Ljavassist/CtField;-><init>(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)V

    .line 266
    .local v1, "f":Ljavassist/CtField;
    const/4 v5, 0x4

    invoke-virtual {v1, v5}, Ljavassist/CtField;->setModifiers(I)V

    .line 267
    invoke-static {p2}, Ljavassist/CtField$Initializer;->byNewWithParams(Ljavassist/CtClass;)Ljavassist/CtField$Initializer;

    move-result-object v5

    invoke-virtual {p1, v1, v5}, Ljavassist/CtClass;->addField(Ljavassist/CtField;Ljavassist/CtField$Initializer;)V

    .line 269
    const-string v5, "_getMetaobject"

    invoke-static {v5, v1}, Ljavassist/CtNewMethod;->getter(Ljava/lang/String;Ljavassist/CtField;)Ljavassist/CtMethod;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljavassist/CtClass;->addMethod(Ljavassist/CtMethod;)V

    .line 270
    const-string v5, "_setMetaobject"

    invoke-static {v5, v1}, Ljavassist/CtNewMethod;->setter(Ljava/lang/String;Ljavassist/CtField;)Ljavassist/CtMethod;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljavassist/CtClass;->addMethod(Ljavassist/CtMethod;)V

    .line 273
    .end local v1    # "f":Ljavassist/CtField;
    :cond_5a
    new-instance v1, Ljavassist/CtField;

    iget-object v5, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    const-string v6, "javassist.tools.reflect.ClassMetaobject"

    invoke-virtual {v5, v6}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v5

    const-string v6, "_classobject"

    invoke-direct {v1, v5, v6, p1}, Ljavassist/CtField;-><init>(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)V

    .line 275
    .restart local v1    # "f":Ljavassist/CtField;
    const/16 v5, 0xa

    invoke-virtual {v1, v5}, Ljavassist/CtField;->setModifiers(I)V

    .line 276
    new-array v5, v4, [Ljava/lang/String;

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {p3, v5}, Ljavassist/CtField$Initializer;->byNew(Ljavassist/CtClass;[Ljava/lang/String;)Ljavassist/CtField$Initializer;

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Ljavassist/CtClass;->addField(Ljavassist/CtField;Ljavassist/CtField$Initializer;)V

    .line 279
    const-string v3, "_getClass"

    invoke-static {v3, v1}, Ljavassist/CtNewMethod;->getter(Ljava/lang/String;Ljavassist/CtField;)Ljavassist/CtMethod;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljavassist/CtClass;->addMethod(Ljavassist/CtMethod;)V

    move v3, v4

    .line 280
    goto :goto_a

    .end local v0    # "addMeta":Z
    .end local v1    # "f":Ljavassist/CtField;
    :cond_88
    move v0, v3

    .line 255
    goto :goto_21
.end method

.method private processFields(Ljavassist/CtClass;)V
    .registers 16
    .param p1, "clazz"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 365
    invoke-virtual {p1}, Ljavassist/CtClass;->getDeclaredFields()[Ljavassist/CtField;

    move-result-object v9

    .line 366
    .local v9, "fs":[Ljavassist/CtField;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_5
    array-length v1, v9

    if-ge v10, v1, :cond_82

    .line 367
    aget-object v8, v9, v10

    .line 368
    .local v8, "f":Ljavassist/CtField;
    invoke-virtual {v8}, Ljavassist/CtField;->getModifiers()I

    move-result v11

    .line 369
    .local v11, "mod":I
    and-int/lit8 v1, v11, 0x1

    if-eqz v1, :cond_7f

    and-int/lit8 v1, v11, 0x10

    if-nez v1, :cond_7f

    .line 370
    or-int/lit8 v11, v11, 0x8

    .line 371
    invoke-virtual {v8}, Ljavassist/CtField;->getName()Ljava/lang/String;

    move-result-object v12

    .line 372
    .local v12, "name":Ljava/lang/String;
    invoke-virtual {v8}, Ljavassist/CtField;->getType()Ljavassist/CtClass;

    move-result-object v0

    .line 373
    .local v0, "ftype":Ljavassist/CtClass;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_r_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Ljavassist/tools/reflect/Reflection;->readParam:[Ljavassist/CtClass;

    const/4 v3, 0x0

    iget-object v4, p0, Ljavassist/tools/reflect/Reflection;->trapRead:Ljavassist/CtMethod;

    invoke-static {v12}, Ljavassist/CtMethod$ConstParameter;->string(Ljava/lang/String;)Ljavassist/CtMethod$ConstParameter;

    move-result-object v5

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Ljavassist/CtNewMethod;->wrapped(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtMethod;

    move-result-object v13

    .line 378
    .local v13, "wmethod":Ljavassist/CtMethod;
    invoke-virtual {v13, v11}, Ljavassist/CtMethod;->setModifiers(I)V

    .line 379
    invoke-virtual {p1, v13}, Ljavassist/CtClass;->addMethod(Ljavassist/CtMethod;)V

    .line 380
    const/4 v1, 0x2

    new-array v3, v1, [Ljavassist/CtClass;

    .line 381
    .local v3, "writeParam":[Ljavassist/CtClass;
    const/4 v1, 0x0

    iget-object v2, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    const-string v4, "java.lang.Object"

    invoke-virtual {v2, v4}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v2

    aput-object v2, v3, v1

    .line 382
    const/4 v1, 0x1

    aput-object v0, v3, v1

    .line 383
    sget-object v1, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_w_"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    iget-object v5, p0, Ljavassist/tools/reflect/Reflection;->trapWrite:Ljavassist/CtMethod;

    invoke-static {v12}, Ljavassist/CtMethod$ConstParameter;->string(Ljava/lang/String;)Ljavassist/CtMethod$ConstParameter;

    move-result-object v6

    move-object v7, p1

    invoke-static/range {v1 .. v7}, Ljavassist/CtNewMethod;->wrapped(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtMethod;

    move-result-object v13

    .line 387
    invoke-virtual {v13, v11}, Ljavassist/CtMethod;->setModifiers(I)V

    .line 388
    invoke-virtual {p1, v13}, Ljavassist/CtClass;->addMethod(Ljavassist/CtMethod;)V

    .line 366
    .end local v0    # "ftype":Ljavassist/CtClass;
    .end local v3    # "writeParam":[Ljavassist/CtClass;
    .end local v12    # "name":Ljava/lang/String;
    .end local v13    # "wmethod":Ljavassist/CtMethod;
    :cond_7f
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 391
    .end local v8    # "f":Ljavassist/CtField;
    .end local v11    # "mod":I
    :cond_82
    return-void
.end method

.method private processMethods(Ljavassist/CtClass;Z)V
    .registers 10
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "dontSearch"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 286
    invoke-virtual {p1}, Ljavassist/CtClass;->getMethods()[Ljavassist/CtMethod;

    move-result-object v6

    .line 287
    .local v6, "ms":[Ljavassist/CtMethod;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_5
    array-length v0, v6

    if-ge v4, v0, :cond_23

    .line 288
    aget-object v3, v6, v4

    .line 289
    .local v3, "m":Ljavassist/CtMethod;
    invoke-virtual {v3}, Ljavassist/CtMethod;->getModifiers()I

    move-result v1

    .line 290
    .local v1, "mod":I
    invoke-static {v1}, Ljavassist/Modifier;->isPublic(I)Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {v1}, Ljavassist/Modifier;->isAbstract(I)Z

    move-result v0

    if-nez v0, :cond_20

    move-object v0, p0

    move-object v2, p1

    move v5, p2

    .line 291
    invoke-direct/range {v0 .. v5}, Ljavassist/tools/reflect/Reflection;->processMethods0(ILjavassist/CtClass;Ljavassist/CtMethod;IZ)V

    .line 287
    :cond_20
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 293
    .end local v1    # "mod":I
    .end local v3    # "m":Ljavassist/CtMethod;
    :cond_23
    return-void
.end method

.method private processMethods0(ILjavassist/CtClass;Ljavassist/CtMethod;IZ)V
    .registers 15
    .param p1, "mod"    # I
    .param p2, "clazz"    # Ljavassist/CtClass;
    .param p3, "m"    # Ljavassist/CtMethod;
    .param p4, "identifier"    # I
    .param p5, "dontSearch"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 300
    invoke-virtual {p3}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v1

    .line 302
    .local v1, "name":Ljava/lang/String;
    invoke-direct {p0, v1}, Ljavassist/tools/reflect/Reflection;->isExcluded(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 341
    :cond_a
    :goto_a
    return-void

    .line 306
    :cond_b
    invoke-virtual {p3}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    if-ne v0, p2, :cond_67

    .line 307
    invoke-static {p1}, Ljavassist/Modifier;->isNative(I)Z

    move-result v0

    if-nez v0, :cond_a

    .line 310
    move-object v7, p3

    .line 311
    .local v7, "m2":Ljavassist/CtMethod;
    invoke-static {p1}, Ljavassist/Modifier;->isFinal(I)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 312
    and-int/lit8 p1, p1, -0x11

    .line 313
    invoke-virtual {v7, p1}, Ljavassist/CtMethod;->setModifiers(I)V

    .line 326
    :cond_23
    :goto_23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_m_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljavassist/CtMethod;->setName(Ljava/lang/String;)V

    .line 329
    invoke-static {p1}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v0

    if-eqz v0, :cond_7e

    .line 330
    iget-object v4, p0, Ljavassist/tools/reflect/Reflection;->trapStaticMethod:Ljavassist/CtMethod;

    .line 334
    .local v4, "body":Ljavassist/CtMethod;
    :goto_4b
    invoke-virtual {p3}, Ljavassist/CtMethod;->getReturnType()Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {p3}, Ljavassist/CtMethod;->getParameterTypes()[Ljavassist/CtClass;

    move-result-object v2

    invoke-virtual {p3}, Ljavassist/CtMethod;->getExceptionTypes()[Ljavassist/CtClass;

    move-result-object v3

    invoke-static {p4}, Ljavassist/CtMethod$ConstParameter;->integer(I)Ljavassist/CtMethod$ConstParameter;

    move-result-object v5

    move-object v6, p2

    invoke-static/range {v0 .. v6}, Ljavassist/CtNewMethod;->wrapped(Ljavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtMethod;Ljavassist/CtMethod$ConstParameter;Ljavassist/CtClass;)Ljavassist/CtMethod;

    move-result-object v8

    .line 339
    .local v8, "wmethod":Ljavassist/CtMethod;
    invoke-virtual {v8, p1}, Ljavassist/CtMethod;->setModifiers(I)V

    .line 340
    invoke-virtual {p2, v8}, Ljavassist/CtClass;->addMethod(Ljavassist/CtMethod;)V

    goto :goto_a

    .line 317
    .end local v4    # "body":Ljavassist/CtMethod;
    .end local v7    # "m2":Ljavassist/CtMethod;
    .end local v8    # "wmethod":Ljavassist/CtMethod;
    :cond_67
    invoke-static {p1}, Ljavassist/Modifier;->isFinal(I)Z

    move-result v0

    if-nez v0, :cond_a

    .line 320
    and-int/lit16 p1, p1, -0x101

    .line 321
    invoke-direct {p0, p3, p5}, Ljavassist/tools/reflect/Reflection;->findOriginal(Ljavassist/CtMethod;Z)Ljavassist/CtMethod;

    move-result-object v0

    invoke-static {v0, p2}, Ljavassist/CtNewMethod;->delegator(Ljavassist/CtMethod;Ljavassist/CtClass;)Ljavassist/CtMethod;

    move-result-object v7

    .line 322
    .restart local v7    # "m2":Ljavassist/CtMethod;
    invoke-virtual {v7, p1}, Ljavassist/CtMethod;->setModifiers(I)V

    .line 323
    invoke-virtual {p2, v7}, Ljavassist/CtClass;->addMethod(Ljavassist/CtMethod;)V

    goto :goto_23

    .line 332
    :cond_7e
    iget-object v4, p0, Ljavassist/tools/reflect/Reflection;->trapMethod:Ljavassist/CtMethod;

    .restart local v4    # "body":Ljavassist/CtMethod;
    goto :goto_4b
.end method

.method private registerReflectiveClass(Ljavassist/CtClass;)V
    .registers 10
    .param p1, "clazz"    # Ljavassist/CtClass;

    .prologue
    .line 233
    invoke-virtual {p1}, Ljavassist/CtClass;->getDeclaredFields()[Ljavassist/CtField;

    move-result-object v1

    .line 234
    .local v1, "fs":[Ljavassist/CtField;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    array-length v5, v1

    if-ge v2, v5, :cond_4d

    .line 235
    aget-object v0, v1, v2

    .line 236
    .local v0, "f":Ljavassist/CtField;
    invoke-virtual {v0}, Ljavassist/CtField;->getModifiers()I

    move-result v3

    .line 237
    .local v3, "mod":I
    and-int/lit8 v5, v3, 0x1

    if-eqz v5, :cond_4a

    and-int/lit8 v5, v3, 0x10

    if-nez v5, :cond_4a

    .line 238
    invoke-virtual {v0}, Ljavassist/CtField;->getName()Ljava/lang/String;

    move-result-object v4

    .line 239
    .local v4, "name":Ljava/lang/String;
    iget-object v5, p0, Ljavassist/tools/reflect/Reflection;->converter:Ljavassist/CodeConverter;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "_r_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v0, p1, v6}, Ljavassist/CodeConverter;->replaceFieldRead(Ljavassist/CtField;Ljavassist/CtClass;Ljava/lang/String;)V

    .line 240
    iget-object v5, p0, Ljavassist/tools/reflect/Reflection;->converter:Ljavassist/CodeConverter;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "_w_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v0, p1, v6}, Ljavassist/CodeConverter;->replaceFieldWrite(Ljavassist/CtField;Ljavassist/CtClass;Ljava/lang/String;)V

    .line 234
    .end local v4    # "name":Ljava/lang/String;
    :cond_4a
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 243
    .end local v0    # "f":Ljavassist/CtField;
    .end local v3    # "mod":I
    :cond_4d
    return-void
.end method


# virtual methods
.method public makeReflective(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)Z
    .registers 7
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "metaobject"    # Ljava/lang/Class;
    .param p3, "metaclass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 183
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Ljavassist/tools/reflect/Reflection;->makeReflective(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public makeReflective(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 7
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "metaobject"    # Ljava/lang/String;
    .param p3, "metaclass"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 157
    iget-object v0, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    invoke-virtual {v0, p1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    iget-object v1, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    invoke-virtual {v1, p2}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    iget-object v2, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    invoke-virtual {v2, p3}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Ljavassist/tools/reflect/Reflection;->makeReflective(Ljavassist/CtClass;Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v0

    return v0
.end method

.method public makeReflective(Ljavassist/CtClass;Ljavassist/CtClass;Ljavassist/CtClass;)Z
    .registers 7
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "metaobject"    # Ljavassist/CtClass;
    .param p3, "metaclass"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/tools/reflect/CannotReflectException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 210
    invoke-virtual {p1}, Ljavassist/CtClass;->isInterface()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 211
    new-instance v0, Ljavassist/tools/reflect/CannotReflectException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot reflect an interface: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/tools/reflect/CannotReflectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_23
    iget-object v0, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    const-string v1, "javassist.tools.reflect.ClassMetaobject"

    invoke-virtual {v0, v1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavassist/CtClass;->subclassOf(Ljavassist/CtClass;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 215
    new-instance v0, Ljavassist/tools/reflect/CannotReflectException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot reflect a subclass of ClassMetaobject: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/tools/reflect/CannotReflectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_4e
    iget-object v0, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    const-string v1, "javassist.tools.reflect.Metaobject"

    invoke-virtual {v0, v1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavassist/CtClass;->subclassOf(Ljavassist/CtClass;)Z

    move-result v0

    if-eqz v0, :cond_79

    .line 220
    new-instance v0, Ljavassist/tools/reflect/CannotReflectException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot reflect a subclass of Metaobject: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/tools/reflect/CannotReflectException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 224
    :cond_79
    invoke-direct {p0, p1}, Ljavassist/tools/reflect/Reflection;->registerReflectiveClass(Ljavassist/CtClass;)V

    .line 225
    invoke-direct {p0, p1, p2, p3}, Ljavassist/tools/reflect/Reflection;->modifyClassfile(Ljavassist/CtClass;Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v0

    return v0
.end method

.method public onLoad(Ljavassist/ClassPool;Ljava/lang/String;)V
    .registers 5
    .param p1, "pool"    # Ljavassist/ClassPool;
    .param p2, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 136
    invoke-virtual {p1, p2}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 137
    .local v0, "clazz":Ljavassist/CtClass;
    iget-object v1, p0, Ljavassist/tools/reflect/Reflection;->converter:Ljavassist/CodeConverter;

    invoke-virtual {v0, v1}, Ljavassist/CtClass;->instrument(Ljavassist/CodeConverter;)V

    .line 138
    return-void
.end method

.method public rebuildClassFile(Ljavassist/bytecode/ClassFile;)V
    .registers 6
    .param p1, "cf"    # Ljavassist/bytecode/ClassFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 394
    sget v2, Ljavassist/bytecode/ClassFile;->MAJOR_VERSION:I

    const/16 v3, 0x32

    if-ge v2, v3, :cond_7

    .line 402
    :cond_6
    return-void

    .line 397
    :cond_7
    invoke-virtual {p1}, Ljavassist/bytecode/ClassFile;->getMethods()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 398
    .local v0, "methods":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 399
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/MethodInfo;

    .line 400
    .local v1, "mi":Ljavassist/bytecode/MethodInfo;
    iget-object v2, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    invoke-virtual {v1, v2}, Ljavassist/bytecode/MethodInfo;->rebuildStackMap(Ljavassist/ClassPool;)V

    goto :goto_f
.end method

.method public start(Ljavassist/ClassPool;)V
    .registers 9
    .param p1, "pool"    # Ljavassist/ClassPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 109
    iput-object p1, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    .line 110
    const-string v2, "javassist.tools.reflect.Sample is not found or broken."

    .line 113
    .local v2, "msg":Ljava/lang/String;
    :try_start_4
    iget-object v3, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    const-string v4, "javassist.tools.reflect.Sample"

    invoke-virtual {v3, v4}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 114
    .local v0, "c":Ljavassist/CtClass;
    invoke-virtual {v0}, Ljavassist/CtClass;->getClassFile()Ljavassist/bytecode/ClassFile;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljavassist/tools/reflect/Reflection;->rebuildClassFile(Ljavassist/bytecode/ClassFile;)V

    .line 115
    const-string v3, "trap"

    invoke-virtual {v0, v3}, Ljavassist/CtClass;->getDeclaredMethod(Ljava/lang/String;)Ljavassist/CtMethod;

    move-result-object v3

    iput-object v3, p0, Ljavassist/tools/reflect/Reflection;->trapMethod:Ljavassist/CtMethod;

    .line 116
    const-string v3, "trapStatic"

    invoke-virtual {v0, v3}, Ljavassist/CtClass;->getDeclaredMethod(Ljava/lang/String;)Ljavassist/CtMethod;

    move-result-object v3

    iput-object v3, p0, Ljavassist/tools/reflect/Reflection;->trapStaticMethod:Ljavassist/CtMethod;

    .line 117
    const-string v3, "trapRead"

    invoke-virtual {v0, v3}, Ljavassist/CtClass;->getDeclaredMethod(Ljava/lang/String;)Ljavassist/CtMethod;

    move-result-object v3

    iput-object v3, p0, Ljavassist/tools/reflect/Reflection;->trapRead:Ljavassist/CtMethod;

    .line 118
    const-string v3, "trapWrite"

    invoke-virtual {v0, v3}, Ljavassist/CtClass;->getDeclaredMethod(Ljava/lang/String;)Ljavassist/CtMethod;

    move-result-object v3

    iput-object v3, p0, Ljavassist/tools/reflect/Reflection;->trapWrite:Ljavassist/CtMethod;

    .line 119
    const/4 v3, 0x1

    new-array v3, v3, [Ljavassist/CtClass;

    const/4 v4, 0x0

    iget-object v5, p0, Ljavassist/tools/reflect/Reflection;->classPool:Ljavassist/ClassPool;

    const-string v6, "java.lang.Object"

    invoke-virtual {v5, v6}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v5

    aput-object v5, v3, v4

    iput-object v3, p0, Ljavassist/tools/reflect/Reflection;->readParam:[Ljavassist/CtClass;
    :try_end_43
    .catch Ljavassist/NotFoundException; {:try_start_4 .. :try_end_43} :catch_44
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_4 .. :try_end_43} :catch_4d

    .line 127
    return-void

    .line 122
    .end local v0    # "c":Ljavassist/CtClass;
    :catch_44
    move-exception v1

    .line 123
    .local v1, "e":Ljavassist/NotFoundException;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "javassist.tools.reflect.Sample is not found or broken."

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 124
    .end local v1    # "e":Ljavassist/NotFoundException;
    :catch_4d
    move-exception v1

    .line 125
    .local v1, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "javassist.tools.reflect.Sample is not found or broken."

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
