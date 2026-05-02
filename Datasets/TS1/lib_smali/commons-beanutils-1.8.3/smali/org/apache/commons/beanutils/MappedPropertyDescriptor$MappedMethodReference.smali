.class Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;
.super Ljava/lang/Object;
.source "MappedPropertyDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/beanutils/MappedPropertyDescriptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MappedMethodReference"
.end annotation


# instance fields
.field private className:Ljava/lang/String;

.field private classRef:Ljava/lang/ref/Reference;

.field private methodName:Ljava/lang/String;

.field private methodRef:Ljava/lang/ref/Reference;

.field private writeParamClassNames:[Ljava/lang/String;

.field private writeParamTypeRef0:Ljava/lang/ref/Reference;

.field private writeParamTypeRef1:Ljava/lang/ref/Reference;


# direct methods
.method constructor <init>(Ljava/lang/reflect/Method;)V
    .registers 8
    .param p1, "m"    # Ljava/lang/reflect/Method;

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 437
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 438
    if-eqz p1, :cond_5b

    .line 439
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->className:Ljava/lang/String;

    .line 440
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->methodName:Ljava/lang/String;

    .line 441
    new-instance v1, Ljava/lang/ref/SoftReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->methodRef:Ljava/lang/ref/Reference;

    .line 442
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->classRef:Ljava/lang/ref/Reference;

    .line 443
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    .line 444
    .local v0, "types":[Ljava/lang/Class;
    array-length v1, v0

    if-ne v1, v5, :cond_5b

    .line 445
    new-instance v1, Ljava/lang/ref/WeakReference;

    aget-object v2, v0, v3

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamTypeRef0:Ljava/lang/ref/Reference;

    .line 446
    new-instance v1, Ljava/lang/ref/WeakReference;

    aget-object v2, v0, v4

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamTypeRef1:Ljava/lang/ref/Reference;

    .line 447
    new-array v1, v5, [Ljava/lang/String;

    iput-object v1, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamClassNames:[Ljava/lang/String;

    .line 448
    iget-object v1, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamClassNames:[Ljava/lang/String;

    aget-object v2, v0, v3

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    .line 449
    iget-object v1, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamClassNames:[Ljava/lang/String;

    aget-object v2, v0, v4

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    .line 452
    .end local v0    # "types":[Ljava/lang/Class;
    :cond_5b
    return-void
.end method

.method static access$000(Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;)Ljava/lang/reflect/Method;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    .prologue
    .line 429
    invoke-direct {p0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->get()Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method private get()Ljava/lang/reflect/Method;
    .registers 8

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 454
    iget-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->methodRef:Ljava/lang/ref/Reference;

    if-nez v4, :cond_8

    .line 455
    const/4 v2, 0x0

    .line 500
    :cond_7
    :goto_7
    return-object v2

    .line 457
    :cond_8
    iget-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->methodRef:Ljava/lang/ref/Reference;

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Method;

    .line 458
    .local v2, "m":Ljava/lang/reflect/Method;
    if-nez v2, :cond_7

    .line 459
    iget-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->classRef:Ljava/lang/ref/Reference;

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 460
    .local v0, "clazz":Ljava/lang/Class;
    if-nez v0, :cond_29

    .line 461
    invoke-direct {p0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->reLoadClass()Ljava/lang/Class;

    move-result-object v0

    .line 462
    if-eqz v0, :cond_29

    .line 463
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->classRef:Ljava/lang/ref/Reference;

    .line 466
    :cond_29
    if-nez v0, :cond_58

    .line 467
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Method "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->methodName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->className:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " could not be reconstructed - class reference has gone"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 470
    :cond_58
    const/4 v3, 0x0

    .line 471
    .local v3, "paramTypes":[Ljava/lang/Class;
    iget-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamClassNames:[Ljava/lang/String;

    if-eqz v4, :cond_b9

    .line 472
    const/4 v4, 0x2

    new-array v3, v4, [Ljava/lang/Class;

    .line 473
    iget-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamTypeRef0:Ljava/lang/ref/Reference;

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    aput-object v4, v3, v5

    .line 474
    aget-object v4, v3, v5

    if-nez v4, :cond_85

    .line 475
    iget-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamClassNames:[Ljava/lang/String;

    aget-object v4, v4, v5

    invoke-direct {p0, v4}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->reLoadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v3, v5

    .line 476
    aget-object v4, v3, v5

    if-eqz v4, :cond_85

    .line 477
    new-instance v4, Ljava/lang/ref/WeakReference;

    aget-object v5, v3, v5

    invoke-direct {v4, v5}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamTypeRef0:Ljava/lang/ref/Reference;

    .line 480
    :cond_85
    iget-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamTypeRef1:Ljava/lang/ref/Reference;

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    aput-object v4, v3, v6

    .line 481
    aget-object v4, v3, v6

    if-nez v4, :cond_aa

    .line 482
    iget-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamClassNames:[Ljava/lang/String;

    aget-object v4, v4, v6

    invoke-direct {p0, v4}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->reLoadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v3, v6

    .line 483
    aget-object v4, v3, v6

    if-eqz v4, :cond_aa

    .line 484
    new-instance v4, Ljava/lang/ref/WeakReference;

    aget-object v5, v3, v6

    invoke-direct {v4, v5}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->writeParamTypeRef1:Ljava/lang/ref/Reference;

    .line 491
    :cond_aa
    :goto_aa
    :try_start_aa
    iget-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->methodName:Ljava/lang/String;

    invoke-virtual {v0, v4, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_af
    .catch Ljava/lang/NoSuchMethodException; {:try_start_aa .. :try_end_af} :catch_be

    move-result-object v2

    .line 498
    new-instance v4, Ljava/lang/ref/SoftReference;

    invoke-direct {v4, v2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v4, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->methodRef:Ljava/lang/ref/Reference;

    goto/16 :goto_7

    .line 488
    :cond_b9
    invoke-static {}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->access$100()[Ljava/lang/Class;

    move-result-object v3

    goto :goto_aa

    .line 494
    :catch_be
    move-exception v1

    .line 495
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Method "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->methodName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->className:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " could not be reconstructed - method not found"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private reLoadClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 507
    iget-object v0, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->className:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->reLoadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method private reLoadClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 515
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 518
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_10

    .line 520
    :try_start_a
    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_a .. :try_end_d} :catch_f

    move-result-object v2

    .line 531
    :goto_e
    return-object v2

    .line 521
    :catch_f
    move-exception v2

    .line 527
    :cond_10
    sget-object v2, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$org$apache$commons$beanutils$MappedPropertyDescriptor:Ljava/lang/Class;

    if-nez v2, :cond_25

    const-string v2, "org.apache.commons.beanutils.MappedPropertyDescriptor"

    invoke-static {v2}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$org$apache$commons$beanutils$MappedPropertyDescriptor:Ljava/lang/Class;

    :goto_1c
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 529
    :try_start_20
    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_23
    .catch Ljava/lang/ClassNotFoundException; {:try_start_20 .. :try_end_23} :catch_28

    move-result-object v2

    goto :goto_e

    .line 527
    :cond_25
    sget-object v2, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$org$apache$commons$beanutils$MappedPropertyDescriptor:Ljava/lang/Class;

    goto :goto_1c

    .line 530
    :catch_28
    move-exception v1

    .line 531
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    const/4 v2, 0x0

    goto :goto_e
.end method
