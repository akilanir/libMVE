.class public Ljavassist/Loader;
.super Ljava/lang/ClassLoader;
.source "Loader.java"


# instance fields
.field public doDelegation:Z

.field private domain:Ljava/security/ProtectionDomain;

.field private notDefinedHere:Ljava/util/Hashtable;

.field private notDefinedPackages:Ljava/util/Vector;

.field private source:Ljavassist/ClassPool;

.field private translator:Ljavassist/Translator;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 160
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljavassist/Loader;-><init>(Ljavassist/ClassPool;)V

    .line 161
    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;Ljavassist/ClassPool;)V
    .registers 4
    .param p1, "parent"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;

    .prologue
    .line 180
    invoke-direct {p0, p1}, Ljava/lang/ClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    .line 154
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljavassist/Loader;->doDelegation:Z

    .line 181
    invoke-direct {p0, p2}, Ljavassist/Loader;->init(Ljavassist/ClassPool;)V

    .line 182
    return-void
.end method

.method public constructor <init>(Ljavassist/ClassPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/ClassPool;

    .prologue
    .line 168
    invoke-direct {p0}, Ljava/lang/ClassLoader;-><init>()V

    .line 154
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljavassist/Loader;->doDelegation:Z

    .line 169
    invoke-direct {p0, p1}, Ljavassist/Loader;->init(Ljavassist/ClassPool;)V

    .line 170
    return-void
.end method

.method private init(Ljavassist/ClassPool;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/ClassPool;

    .prologue
    const/4 v1, 0x0

    .line 185
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Ljavassist/Loader;->notDefinedHere:Ljava/util/Hashtable;

    .line 186
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Ljavassist/Loader;->notDefinedPackages:Ljava/util/Vector;

    .line 187
    iput-object p1, p0, Ljavassist/Loader;->source:Ljavassist/ClassPool;

    .line 188
    iput-object v1, p0, Ljavassist/Loader;->translator:Ljavassist/Translator;

    .line 189
    iput-object v1, p0, Ljavassist/Loader;->domain:Ljava/security/ProtectionDomain;

    .line 190
    const-string v0, "javassist.Loader"

    invoke-virtual {p0, v0}, Ljavassist/Loader;->delegateLoadingOf(Ljava/lang/String;)V

    .line 191
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 2
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 257
    new-instance v0, Ljavassist/Loader;

    invoke-direct {v0}, Ljavassist/Loader;-><init>()V

    .line 258
    .local v0, "cl":Ljavassist/Loader;
    invoke-virtual {v0, p0}, Ljavassist/Loader;->run([Ljava/lang/String;)V

    .line 259
    return-void
.end method

.method private notDelegated(Ljava/lang/String;)Z
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 413
    iget-object v2, p0, Ljavassist/Loader;->notDefinedHere:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_b

    move v2, v3

    .line 421
    :goto_a
    return v2

    .line 416
    :cond_b
    iget-object v2, p0, Ljavassist/Loader;->notDefinedPackages:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v1

    .line 417
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    if-ge v0, v1, :cond_27

    .line 418
    iget-object v2, p0, Ljavassist/Loader;->notDefinedPackages:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_24

    move v2, v3

    .line 419
    goto :goto_a

    .line 417
    :cond_24
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 421
    :cond_27
    const/4 v2, 0x0

    goto :goto_a
.end method


# virtual methods
.method public addTranslator(Ljavassist/ClassPool;Ljavassist/Translator;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/ClassPool;
    .param p2, "t"    # Ljavassist/Translator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 236
    iput-object p1, p0, Ljavassist/Loader;->source:Ljavassist/ClassPool;

    .line 237
    iput-object p2, p0, Ljavassist/Loader;->translator:Ljavassist/Translator;

    .line 238
    invoke-interface {p2, p1}, Ljavassist/Translator;->start(Ljavassist/ClassPool;)V

    .line 239
    return-void
.end method

.method public delegateLoadingOf(Ljava/lang/String;)V
    .registers 3
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 202
    const-string v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 203
    iget-object v0, p0, Ljavassist/Loader;->notDefinedPackages:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 206
    :goto_d
    return-void

    .line 205
    :cond_e
    iget-object v0, p0, Ljavassist/Loader;->notDefinedHere:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d
.end method

.method protected delegateToParent(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 427
    invoke-virtual {p0}, Ljavassist/Loader;->getParent()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 428
    .local v0, "cl":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_b

    .line 429
    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 431
    :goto_a
    return-object v1

    :cond_b
    invoke-virtual {p0, p1}, Ljavassist/Loader;->findSystemClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_a
.end method

.method protected findClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 16
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 339
    :try_start_0
    iget-object v0, p0, Ljavassist/Loader;->source:Ljavassist/ClassPool;

    if-eqz v0, :cond_46

    .line 340
    iget-object v0, p0, Ljavassist/Loader;->translator:Ljavassist/Translator;

    if-eqz v0, :cond_f

    .line 341
    iget-object v0, p0, Ljavassist/Loader;->translator:Ljavassist/Translator;

    iget-object v2, p0, Ljavassist/Loader;->source:Ljavassist/ClassPool;

    invoke-interface {v0, v2, p1}, Ljavassist/Translator;->onLoad(Ljavassist/ClassPool;Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_78

    .line 344
    :cond_f
    :try_start_f
    iget-object v0, p0, Ljavassist/Loader;->source:Ljavassist/ClassPool;

    invoke-virtual {v0, p1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/CtClass;->toBytecode()[B
    :try_end_18
    .catch Ljavassist/NotFoundException; {:try_start_f .. :try_end_18} :catch_43
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_18} :catch_78

    move-result-object v9

    .line 365
    .local v9, "classfile":[B
    :goto_19
    const/16 v0, 0x2e

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    .line 366
    .local v11, "i":I
    const/4 v0, -0x1

    if-eq v11, v0, :cond_38

    .line 367
    const/4 v0, 0x0

    invoke-virtual {p1, v0, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 368
    .local v1, "pname":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljavassist/Loader;->getPackage(Ljava/lang/String;)Ljava/lang/Package;

    move-result-object v0

    if-nez v0, :cond_38

    .line 370
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    :try_start_35
    invoke-virtual/range {v0 .. v8}, Ljavassist/Loader;->definePackage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)Ljava/lang/Package;
    :try_end_38
    .catch Ljava/lang/IllegalArgumentException; {:try_start_35 .. :try_end_38} :catch_9e

    .line 379
    .end local v1    # "pname":Ljava/lang/String;
    :cond_38
    :goto_38
    iget-object v0, p0, Ljavassist/Loader;->domain:Ljava/security/ProtectionDomain;

    if-nez v0, :cond_92

    .line 380
    const/4 v0, 0x0

    array-length v2, v9

    invoke-virtual {p0, p1, v9, v0, v2}, Ljavassist/Loader;->defineClass(Ljava/lang/String;[BII)Ljava/lang/Class;

    move-result-object v0

    .line 382
    .end local v9    # "classfile":[B
    .end local v11    # "i":I
    :goto_42
    return-object v0

    .line 346
    :catch_43
    move-exception v10

    .line 347
    .local v10, "e":Ljavassist/NotFoundException;
    const/4 v0, 0x0

    goto :goto_42

    .line 351
    .end local v10    # "e":Ljavassist/NotFoundException;
    :cond_46
    :try_start_46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v2, 0x2e

    const/16 v3, 0x2f

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ".class"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 352
    .local v13, "jarname":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v12

    .line 353
    .local v12, "in":Ljava/io/InputStream;
    if-nez v12, :cond_73

    .line 354
    const/4 v0, 0x0

    goto :goto_42

    .line 356
    :cond_73
    invoke-static {v12}, Ljavassist/ClassPoolTail;->readStream(Ljava/io/InputStream;)[B
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_76} :catch_78

    move-result-object v9

    .restart local v9    # "classfile":[B
    goto :goto_19

    .line 359
    .end local v9    # "classfile":[B
    .end local v12    # "in":Ljava/io/InputStream;
    .end local v13    # "jarname":Ljava/lang/String;
    :catch_78
    move-exception v10

    .line 360
    .local v10, "e":Ljava/lang/Exception;
    new-instance v0, Ljava/lang/ClassNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "caught an exception while obtaining a class file for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v10}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 382
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v9    # "classfile":[B
    .restart local v11    # "i":I
    :cond_92
    const/4 v5, 0x0

    array-length v6, v9

    iget-object v7, p0, Ljavassist/Loader;->domain:Ljava/security/ProtectionDomain;

    move-object v2, p0

    move-object v3, p1

    move-object v4, v9

    invoke-virtual/range {v2 .. v7}, Ljavassist/Loader;->defineClass(Ljava/lang/String;[BIILjava/security/ProtectionDomain;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_42

    .line 373
    .restart local v1    # "pname":Ljava/lang/String;
    :catch_9e
    move-exception v0

    goto :goto_38
.end method

.method protected loadClass(Ljava/lang/String;Z)Ljava/lang/Class;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "resolve"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassFormatError;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 305
    invoke-virtual {p1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p1

    .line 306
    monitor-enter p1

    .line 307
    :try_start_5
    invoke-virtual {p0, p1}, Ljavassist/Loader;->findLoadedClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 308
    .local v0, "c":Ljava/lang/Class;
    if-nez v0, :cond_f

    .line 309
    invoke-virtual {p0, p1}, Ljavassist/Loader;->loadClassByDelegation(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 311
    :cond_f
    if-nez v0, :cond_15

    .line 312
    invoke-virtual {p0, p1}, Ljavassist/Loader;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 314
    :cond_15
    if-nez v0, :cond_1b

    .line 315
    invoke-virtual {p0, p1}, Ljavassist/Loader;->delegateToParent(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 317
    :cond_1b
    if-eqz p2, :cond_20

    .line 318
    invoke-virtual {p0, v0}, Ljavassist/Loader;->resolveClass(Ljava/lang/Class;)V

    .line 320
    :cond_20
    monitor-exit p1

    return-object v0

    .line 321
    .end local v0    # "c":Ljava/lang/Class;
    :catchall_22
    move-exception v1

    monitor-exit p1
    :try_end_24
    .catchall {:try_start_5 .. :try_end_24} :catchall_22

    throw v1
.end method

.method protected loadClassByDelegation(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 398
    const/4 v0, 0x0

    .line 399
    .local v0, "c":Ljava/lang/Class;
    iget-boolean v1, p0, Ljavassist/Loader;->doDelegation:Z

    if-eqz v1, :cond_3f

    .line 400
    const-string v1, "java."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3b

    const-string v1, "javax."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3b

    const-string v1, "sun."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3b

    const-string v1, "com.sun."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3b

    const-string v1, "org.w3c."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3b

    const-string v1, "org.xml."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3b

    invoke-direct {p0, p1}, Ljavassist/Loader;->notDelegated(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 407
    :cond_3b
    invoke-virtual {p0, p1}, Ljavassist/Loader;->delegateToParent(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 409
    :cond_3f
    return-object v0
.end method

.method public run(Ljava/lang/String;[Ljava/lang/String;)V
    .registers 9
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 289
    invoke-virtual {p0, p1}, Ljavassist/Loader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 291
    .local v0, "c":Ljava/lang/Class;
    :try_start_4
    const-string v2, "main"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, [Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_1c} :catch_1d

    .line 298
    return-void

    .line 295
    :catch_1d
    move-exception v1

    .line 296
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v2

    throw v2
.end method

.method public run([Ljava/lang/String;)V
    .registers 6
    .param p1, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 272
    array-length v3, p1

    add-int/lit8 v2, v3, -0x1

    .line 273
    .local v2, "n":I
    if-ltz v2, :cond_19

    .line 274
    new-array v0, v2, [Ljava/lang/String;

    .line 275
    .local v0, "args2":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v2, :cond_13

    .line 276
    add-int/lit8 v3, v1, 0x1

    aget-object v3, p1, v3

    aput-object v3, v0, v1

    .line 275
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 278
    :cond_13
    const/4 v3, 0x0

    aget-object v3, p1, v3

    invoke-virtual {p0, v3, v0}, Ljavassist/Loader;->run(Ljava/lang/String;[Ljava/lang/String;)V

    .line 280
    .end local v0    # "args2":[Ljava/lang/String;
    .end local v1    # "i":I
    :cond_19
    return-void
.end method

.method public setClassPool(Ljavassist/ClassPool;)V
    .registers 2
    .param p1, "cp"    # Ljavassist/ClassPool;

    .prologue
    .line 222
    iput-object p1, p0, Ljavassist/Loader;->source:Ljavassist/ClassPool;

    .line 223
    return-void
.end method

.method public setDomain(Ljava/security/ProtectionDomain;)V
    .registers 2
    .param p1, "d"    # Ljava/security/ProtectionDomain;

    .prologue
    .line 215
    iput-object p1, p0, Ljavassist/Loader;->domain:Ljava/security/ProtectionDomain;

    .line 216
    return-void
.end method
