.class final Lcom/sun/mail/util/logging/LogManagerProperties;
.super Ljava/util/Properties;
.source "LogManagerProperties.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final LOG_MANAGER:Ljava/util/logging/LogManager;

.field private static volatile REFLECT_NAMES:[Ljava/lang/String; = null

.field private static final serialVersionUID:J = -0x1f1604fcef521d6cL


# instance fields
.field private final prefix:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 77
    const-class v0, Lcom/sun/mail/util/logging/LogManagerProperties;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/util/logging/LogManagerProperties;->$assertionsDisabled:Z

    .line 86
    invoke-static {}, Ljava/util/logging/LogManager;->getLogManager()Ljava/util/logging/LogManager;

    move-result-object v0

    sput-object v0, Lcom/sun/mail/util/logging/LogManagerProperties;->LOG_MANAGER:Ljava/util/logging/LogManager;

    return-void

    .line 77
    :cond_12
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Ljava/util/Properties;Ljava/lang/String;)V
    .registers 4
    .param p1, "parent"    # Ljava/util/Properties;
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    .line 563
    invoke-direct {p0, p1}, Ljava/util/Properties;-><init>(Ljava/util/Properties;)V

    .line 564
    invoke-virtual {p1}, Ljava/util/Properties;->isEmpty()Z

    .line 565
    if-nez p2, :cond_e

    .line 566
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 568
    :cond_e
    iput-object p2, p0, Lcom/sun/mail/util/logging/LogManagerProperties;->prefix:Ljava/lang/String;

    .line 571
    invoke-super {p0}, Ljava/util/Properties;->isEmpty()Z

    .line 572
    return-void
.end method

.method private exportCopy(Ljava/util/Properties;)Ljava/util/Properties;
    .registers 3
    .param p1, "parent"    # Ljava/util/Properties;

    .prologue
    .line 788
    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 789
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0, p1}, Ljava/util/Properties;-><init>(Ljava/util/Properties;)V

    .line 790
    .local v0, "child":Ljava/util/Properties;
    invoke-virtual {v0, p0}, Ljava/util/Properties;->putAll(Ljava/util/Map;)V

    .line 791
    return-object v0
.end method

.method private static findClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 8
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 493
    invoke-static {}, Lcom/sun/mail/util/logging/LogManagerProperties;->getClassLoaders()[Ljava/lang/ClassLoader;

    move-result-object v1

    .line 494
    .local v1, "loaders":[Ljava/lang/ClassLoader;
    sget-boolean v3, Lcom/sun/mail/util/logging/LogManagerProperties;->$assertionsDisabled:Z

    if-nez v3, :cond_15

    array-length v3, v1

    const/4 v4, 0x2

    if-eq v3, v4, :cond_15

    new-instance v3, Ljava/lang/AssertionError;

    array-length v4, v1

    invoke-direct {v3, v4}, Ljava/lang/AssertionError;-><init>(I)V

    throw v3

    .line 496
    :cond_15
    aget-object v3, v1, v5

    if-eqz v3, :cond_2a

    .line 498
    const/4 v3, 0x0

    const/4 v4, 0x0

    :try_start_1b
    aget-object v4, v1, v4

    invoke-static {p0, v3, v4}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_20
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1b .. :try_end_20} :catch_22

    move-result-object v0

    .line 505
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_21
    return-object v0

    .line 499
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_22
    move-exception v2

    .line 500
    .local v2, "tryContext":Ljava/lang/ClassNotFoundException;
    aget-object v3, v1, v6

    invoke-static {p0, v3}, Lcom/sun/mail/util/logging/LogManagerProperties;->tryLoad(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 501
    .restart local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_21

    .line 503
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "tryContext":Ljava/lang/ClassNotFoundException;
    :cond_2a
    aget-object v3, v1, v6

    invoke-static {p0, v3}, Lcom/sun/mail/util/logging/LogManagerProperties;->tryLoad(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .restart local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_21
.end method

.method private static getClassLoaders()[Ljava/lang/ClassLoader;
    .registers 1

    .prologue
    .line 530
    new-instance v0, Lcom/sun/mail/util/logging/LogManagerProperties$1;

    invoke-direct {v0}, Lcom/sun/mail/util/logging/LogManagerProperties$1;-><init>()V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/ClassLoader;

    return-object v0
.end method

.method static getLogManager()Ljava/util/logging/LogManager;
    .registers 1

    .prologue
    .line 102
    sget-object v0, Lcom/sun/mail/util/logging/LogManagerProperties;->LOG_MANAGER:Ljava/util/logging/LogManager;

    return-object v0
.end method

.method static isReflectionClass(Ljava/lang/String;)Z
    .registers 7
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 342
    sget-object v0, Lcom/sun/mail/util/logging/LogManagerProperties;->REFLECT_NAMES:[Ljava/lang/String;

    .local v0, "names":[Ljava/lang/String;
    if-nez v0, :cond_b

    .line 343
    invoke-static {}, Lcom/sun/mail/util/logging/LogManagerProperties;->reflectionClassNames()[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sun/mail/util/logging/LogManagerProperties;->REFLECT_NAMES:[Ljava/lang/String;

    .line 346
    :cond_b
    array-length v4, v0

    move v3, v2

    :goto_d
    if-ge v3, v4, :cond_1c

    aget-object v1, v0, v3

    .line 347
    .local v1, "rf":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    .line 348
    const/4 v2, 0x1

    .line 353
    .end local v1    # "rf":Ljava/lang/String;
    :goto_18
    return v2

    .line 346
    .restart local v1    # "rf":Ljava/lang/String;
    :cond_19
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 352
    .end local v1    # "rf":Ljava/lang/String;
    :cond_1c
    invoke-static {p0}, Lcom/sun/mail/util/logging/LogManagerProperties;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    goto :goto_18
.end method

.method static isStaticUtilityClass(Ljava/lang/String;)Z
    .registers 9
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 307
    invoke-static {p0}, Lcom/sun/mail/util/logging/LogManagerProperties;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 308
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v3, Ljava/lang/Object;

    .line 309
    .local v3, "obj":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v2

    .line 311
    .local v2, "methods":[Ljava/lang/reflect/Method;
    if-eq v0, v3, :cond_2b

    array-length v5, v2

    if-eqz v5, :cond_2b

    .line 312
    const/4 v4, 0x1

    .line 313
    .local v4, "util":Z
    array-length v6, v2

    const/4 v5, 0x0

    :goto_12
    if-ge v5, v6, :cond_27

    aget-object v1, v2, v5

    .line 314
    .local v1, "m":Ljava/lang/reflect/Method;
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    if-eq v7, v3, :cond_28

    .line 315
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    if-nez v7, :cond_28

    .line 316
    const/4 v4, 0x0

    .line 323
    .end local v1    # "m":Ljava/lang/reflect/Method;
    :cond_27
    :goto_27
    return v4

    .line 313
    .restart local v1    # "m":Ljava/lang/reflect/Method;
    :cond_28
    add-int/lit8 v5, v5, 0x1

    goto :goto_12

    .line 321
    .end local v1    # "m":Ljava/lang/reflect/Method;
    .end local v4    # "util":Z
    :cond_2b
    const/4 v4, 0x0

    .restart local v4    # "util":Z
    goto :goto_27
.end method

.method static newAuthenticator(Ljava/lang/String;)Lkorex/mail/Authenticator;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 290
    const-class v0, Lkorex/mail/Authenticator;

    invoke-static {p0, v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->newObjectFrom(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkorex/mail/Authenticator;

    return-object v0
.end method

.method static newComparator(Ljava/lang/String;)Ljava/util/Comparator;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Comparator",
            "<-",
            "Ljava/util/logging/LogRecord;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 198
    const-class v0, Ljava/util/Comparator;

    invoke-static {p0, v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->newObjectFrom(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Comparator;

    return-object v0
.end method

.method static newErrorManager(Ljava/lang/String;)Ljava/util/logging/ErrorManager;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 269
    const-class v0, Ljava/util/logging/ErrorManager;

    invoke-static {p0, v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->newObjectFrom(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/logging/ErrorManager;

    return-object v0
.end method

.method static newFilter(Ljava/lang/String;)Ljava/util/logging/Filter;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 154
    const-class v0, Ljava/util/logging/Filter;

    invoke-static {p0, v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->newObjectFrom(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/logging/Filter;

    return-object v0
.end method

.method static newFormatter(Ljava/lang/String;)Ljava/util/logging/Formatter;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 175
    const-class v0, Ljava/util/logging/Formatter;

    invoke-static {p0, v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->newObjectFrom(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/logging/Formatter;

    return-object v0
.end method

.method private static newObjectFrom(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 9
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 414
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    invoke-static {p0}, Lcom/sun/mail/util/logging/LogManagerProperties;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 417
    .local v3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z
    :try_end_7
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_7} :catch_23
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_0 .. :try_end_7} :catch_53

    move-result v4

    if-eqz v4, :cond_2e

    .line 419
    const/4 v4, 0x0

    :try_start_b
    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_b .. :try_end_1b} :catch_1d
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_b .. :try_end_1b} :catch_23
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_b .. :try_end_1b} :catch_53

    move-result-object v4

    return-object v4

    .line 420
    :catch_1d
    move-exception v1

    .line 421
    .local v1, "ITE":Ljava/lang/reflect/InvocationTargetException;
    :try_start_1e
    invoke-static {v1}, Lcom/sun/mail/util/logging/LogManagerProperties;->paramOrError(Ljava/lang/reflect/InvocationTargetException;)Ljava/lang/Exception;

    move-result-object v4

    throw v4
    :try_end_23
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1e .. :try_end_23} :catch_23
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_1e .. :try_end_23} :catch_53

    .line 427
    .end local v1    # "ITE":Ljava/lang/reflect/InvocationTargetException;
    .end local v3    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_23
    move-exception v2

    .line 433
    .local v2, "NCDFE":Ljava/lang/NoClassDefFoundError;
    new-instance v4, Ljava/lang/ClassNotFoundException;

    invoke-virtual {v2}, Ljava/lang/NoClassDefFoundError;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 424
    .end local v2    # "NCDFE":Ljava/lang/NoClassDefFoundError;
    .restart local v3    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2e
    :try_start_2e
    new-instance v4, Ljava/lang/ClassCastException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " cannot be cast to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 425
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_53
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_2e .. :try_end_53} :catch_23
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_2e .. :try_end_53} :catch_53

    .line 434
    .end local v3    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_53
    move-exception v0

    .line 435
    .local v0, "EIIE":Ljava/lang/ExceptionInInitializerError;
    invoke-static {v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->wrapOrThrow(Ljava/lang/ExceptionInInitializerError;)Ljava/lang/reflect/InvocationTargetException;

    move-result-object v4

    throw v4
.end method

.method private static paramOrError(Ljava/lang/reflect/InvocationTargetException;)Ljava/lang/Exception;
    .registers 3
    .param p0, "ite"    # Ljava/lang/reflect/InvocationTargetException;

    .prologue
    .line 449
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 450
    .local v0, "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_11

    .line 451
    instance-of v1, v0, Ljava/lang/VirtualMachineError;

    if-nez v1, :cond_e

    instance-of v1, v0, Ljava/lang/ThreadDeath;

    if-eqz v1, :cond_11

    .line 453
    :cond_e
    check-cast v0, Ljava/lang/Error;

    .end local v0    # "cause":Ljava/lang/Throwable;
    throw v0

    .line 456
    .restart local v0    # "cause":Ljava/lang/Throwable;
    :cond_11
    return-object p0
.end method

.method private preWrite(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 770
    sget-boolean v1, Lcom/sun/mail/util/logging/LogManagerProperties;->$assertionsDisabled:Z

    if-nez v1, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 772
    :cond_10
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_21

    invoke-super {p0, p1}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_21

    .line 773
    check-cast p1, Ljava/lang/String;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/LogManagerProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 777
    :goto_20
    return-object v0

    .line 775
    .restart local p1    # "key":Ljava/lang/Object;
    :cond_21
    const/4 v0, 0x0

    .local v0, "value":Ljava/lang/Object;
    goto :goto_20
.end method

.method private static reflectionClassNames()[Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 366
    const-class v3, Lcom/sun/mail/util/logging/LogManagerProperties;

    .line 367
    .local v3, "thisClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-boolean v6, Lcom/sun/mail/util/logging/LogManagerProperties;->$assertionsDisabled:Z

    if-nez v6, :cond_17

    invoke-virtual {v3}, Ljava/lang/Class;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v6

    if-nez v6, :cond_17

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5

    .line 369
    :cond_17
    :try_start_17
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 370
    .local v4, "traces":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const-class v6, Ljava/lang/Throwable;

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Class;

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    .line 371
    .local v2, "t":Ljava/lang/Throwable;
    invoke-virtual {v2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v7

    array-length v8, v7

    move v6, v5

    :goto_34
    if-ge v6, v8, :cond_50

    aget-object v1, v7, v6

    .line 372
    .local v1, "ste":Ljava/lang/StackTraceElement;
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_50

    .line 373
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 371
    add-int/lit8 v6, v6, 0x1

    goto :goto_34

    .line 379
    .end local v1    # "ste":Ljava/lang/StackTraceElement;
    :cond_50
    const-class v6, Ljava/lang/Throwable;

    const-string v7, "fillInStackTrace"

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Class;

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v6, v2, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    invoke-virtual {v2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v6

    array-length v7, v6

    :goto_66
    if-ge v5, v7, :cond_82

    aget-object v1, v6, v5

    .line 381
    .restart local v1    # "ste":Ljava/lang/StackTraceElement;
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_82

    .line 382
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 380
    add-int/lit8 v5, v5, 0x1

    goto :goto_66

    .line 387
    .end local v1    # "ste":Ljava/lang/StackTraceElement;
    :cond_82
    invoke-virtual {v4}, Ljava/util/HashSet;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;
    :try_end_8e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_17 .. :try_end_8e} :catch_8f

    return-object v5

    .line 388
    .end local v2    # "t":Ljava/lang/Throwable;
    .end local v4    # "traces":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :catch_8f
    move-exception v0

    .line 389
    .local v0, "ITE":Ljava/lang/reflect/InvocationTargetException;
    invoke-static {v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->paramOrError(Ljava/lang/reflect/InvocationTargetException;)Ljava/lang/Exception;

    move-result-object v5

    throw v5
.end method

.method static reverseOrder(Ljava/util/Comparator;)Ljava/util/Comparator;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator",
            "<TT;>;)",
            "Ljava/util/Comparator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 218
    .local p0, "c":Ljava/util/Comparator;, "Ljava/util/Comparator<TT;>;"
    if-nez p0, :cond_8

    .line 219
    new-instance v5, Ljava/lang/NullPointerException;

    invoke-direct {v5}, Ljava/lang/NullPointerException;-><init>()V

    throw v5

    .line 222
    :cond_8
    const/4 v4, 0x0

    .line 229
    .local v4, "reverse":Ljava/util/Comparator;, "Ljava/util/Comparator<TT;>;"
    :try_start_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "reversed"

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Class;

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 230
    .local v3, "m":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v5

    if-nez v5, :cond_37

    const-class v5, Ljava/util/Comparator;

    .line 231
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z
    :try_end_29
    .catch Ljava/lang/NoSuchMethodException; {:try_start_9 .. :try_end_29} :catch_44
    .catch Ljava/lang/IllegalAccessException; {:try_start_9 .. :try_end_29} :catch_4d
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_29} :catch_4b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_9 .. :try_end_29} :catch_46

    move-result v5

    if-eqz v5, :cond_37

    .line 233
    const/4 v5, 0x0

    :try_start_2d
    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/util/Comparator;

    move-object v4, v0
    :try_end_37
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_2d .. :try_end_37} :catch_3e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2d .. :try_end_37} :catch_44
    .catch Ljava/lang/IllegalAccessException; {:try_start_2d .. :try_end_37} :catch_4d
    .catch Ljava/lang/RuntimeException; {:try_start_2d .. :try_end_37} :catch_4b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2d .. :try_end_37} :catch_46

    .line 245
    .end local v3    # "m":Ljava/lang/reflect/Method;
    :cond_37
    :goto_37
    if-nez v4, :cond_3d

    .line 246
    invoke-static {p0}, Ljava/util/Collections;->reverseOrder(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v4

    .line 248
    :cond_3d
    return-object v4

    .line 234
    .restart local v3    # "m":Ljava/lang/reflect/Method;
    :catch_3e
    move-exception v1

    .line 235
    .local v1, "eiie":Ljava/lang/ExceptionInInitializerError;
    :try_start_3f
    invoke-static {v1}, Lcom/sun/mail/util/logging/LogManagerProperties;->wrapOrThrow(Ljava/lang/ExceptionInInitializerError;)Ljava/lang/reflect/InvocationTargetException;

    move-result-object v5

    throw v5
    :try_end_44
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3f .. :try_end_44} :catch_44
    .catch Ljava/lang/IllegalAccessException; {:try_start_3f .. :try_end_44} :catch_4d
    .catch Ljava/lang/RuntimeException; {:try_start_3f .. :try_end_44} :catch_4b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3f .. :try_end_44} :catch_46

    .line 238
    .end local v1    # "eiie":Ljava/lang/ExceptionInInitializerError;
    .end local v3    # "m":Ljava/lang/reflect/Method;
    :catch_44
    move-exception v5

    goto :goto_37

    .line 241
    :catch_46
    move-exception v2

    .line 242
    .local v2, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-static {v2}, Lcom/sun/mail/util/logging/LogManagerProperties;->paramOrError(Ljava/lang/reflect/InvocationTargetException;)Ljava/lang/Exception;

    goto :goto_37

    .line 240
    .end local v2    # "ite":Ljava/lang/reflect/InvocationTargetException;
    :catch_4b
    move-exception v5

    goto :goto_37

    .line 239
    :catch_4d
    move-exception v5

    goto :goto_37
.end method

.method static toLanguageTag(Ljava/util/Locale;)Ljava/lang/String;
    .registers 10
    .param p0, "locale"    # Ljava/util/Locale;

    .prologue
    const/16 v8, 0x2d

    const/4 v7, 0x0

    .line 114
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    .line 115
    .local v3, "l":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, "c":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v4

    .line 117
    .local v4, "v":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x2

    new-array v0, v5, [C

    .line 118
    .local v0, "b":[C
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    .line 119
    .local v2, "count":I
    invoke-virtual {v3, v7, v2, v0, v7}, Ljava/lang/String;->getChars(II[CI)V

    .line 120
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_3a

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_4a

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_4a

    .line 121
    :cond_3a
    aput-char v8, v0, v2

    .line 122
    add-int/lit8 v2, v2, 0x1

    .line 123
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v1, v7, v5, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 124
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v2, v5

    .line 127
    :cond_4a
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_6c

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_5c

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_6c

    .line 128
    :cond_5c
    aput-char v8, v0, v2

    .line 129
    add-int/lit8 v2, v2, 0x1

    .line 130
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v4, v7, v5, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 131
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v2, v5

    .line 133
    :cond_6c
    invoke-static {v0, v7, v2}, Ljava/lang/String;->valueOf([CII)Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private static tryLoad(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "l"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 517
    if-eqz p1, :cond_8

    .line 518
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 520
    :goto_7
    return-object v0

    :cond_8
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_7
.end method

.method private static wrapOrThrow(Ljava/lang/ExceptionInInitializerError;)Ljava/lang/reflect/InvocationTargetException;
    .registers 2
    .param p0, "eiie"    # Ljava/lang/ExceptionInInitializerError;

    .prologue
    .line 471
    invoke-virtual {p0}, Ljava/lang/ExceptionInInitializerError;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/Error;

    if-eqz v0, :cond_9

    .line 472
    throw p0

    .line 476
    :cond_9
    new-instance v0, Ljava/lang/reflect/InvocationTargetException;

    invoke-direct {v0, p0}, Ljava/lang/reflect/InvocationTargetException;-><init>(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method private declared-synchronized writeReplace()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .prologue
    .line 803
    monitor-enter p0

    :try_start_1
    sget-boolean v0, Lcom/sun/mail/util/logging/LogManagerProperties;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_b

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0

    .line 804
    :cond_e
    :try_start_e
    iget-object v0, p0, Lcom/sun/mail/util/logging/LogManagerProperties;->defaults:Ljava/util/Properties;

    invoke-virtual {v0}, Ljava/util/Properties;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Properties;

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->exportCopy(Ljava/util/Properties;)Ljava/util/Properties;
    :try_end_19
    .catchall {:try_start_e .. :try_end_19} :catchall_b

    move-result-object v0

    monitor-exit p0

    return-object v0
.end method


# virtual methods
.method public declared-synchronized clone()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 585
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/logging/LogManagerProperties;->defaults:Ljava/util/Properties;

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->exportCopy(Ljava/util/Properties;)Ljava/util/Properties;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 693
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_10

    .line 694
    check-cast p1, Ljava/lang/String;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/LogManagerProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    .line 696
    :goto_d
    return v0

    .line 694
    :cond_e
    const/4 v0, 0x0

    goto :goto_d

    .line 696
    .restart local p1    # "key":Ljava/lang/Object;
    :cond_10
    invoke-super {p0, p1}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_d
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 736
    if-nez p1, :cond_4

    .line 746
    :cond_3
    :goto_3
    return v0

    .line 739
    :cond_4
    if-ne p1, p0, :cond_8

    .line 740
    const/4 v0, 0x1

    goto :goto_3

    .line 742
    :cond_8
    instance-of v1, p1, Ljava/util/Properties;

    if-eqz v1, :cond_3

    .line 745
    sget-boolean v0, Lcom/sun/mail/util/logging/LogManagerProperties;->$assertionsDisabled:Z

    if-nez v0, :cond_18

    new-instance v0, Ljava/lang/AssertionError;

    iget-object v1, p0, Lcom/sun/mail/util/logging/LogManagerProperties;->prefix:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 746
    :cond_18
    invoke-super {p0, p1}, Ljava/util/Properties;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 649
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 650
    check-cast p1, Ljava/lang/String;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/LogManagerProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 652
    :goto_a
    return-object v0

    .restart local p1    # "key":Ljava/lang/Object;
    :cond_b
    invoke-super {p0, p1}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_a
.end method

.method public declared-synchronized getProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 597
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lcom/sun/mail/util/logging/LogManagerProperties;->defaults:Ljava/util/Properties;

    invoke-virtual {v3, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 598
    .local v2, "value":Ljava/lang/String;
    if-nez v2, :cond_3b

    .line 599
    invoke-static {}, Lcom/sun/mail/util/logging/LogManagerProperties;->getLogManager()Ljava/util/logging/LogManager;

    move-result-object v0

    .line 600
    .local v0, "manager":Ljava/util/logging/LogManager;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_30

    .line 601
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/sun/mail/util/logging/LogManagerProperties;->prefix:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 604
    :cond_30
    if-nez v2, :cond_36

    .line 605
    invoke-virtual {v0, p1}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 614
    :cond_36
    if-eqz v2, :cond_3d

    .line 615
    invoke-super {p0, p1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3b
    .catchall {:try_start_1 .. :try_end_3b} :catchall_4b

    .line 621
    .end local v0    # "manager":Ljava/util/logging/LogManager;
    :cond_3b
    :goto_3b
    monitor-exit p0

    return-object v2

    .line 617
    .restart local v0    # "manager":Ljava/util/logging/LogManager;
    :cond_3d
    :try_start_3d
    invoke-super {p0, p1}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 618
    .local v1, "v":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_49

    check-cast v1, Ljava/lang/String;
    :try_end_47
    .catchall {:try_start_3d .. :try_end_47} :catchall_4b

    .end local v1    # "v":Ljava/lang/Object;
    move-object v2, v1

    :goto_48
    goto :goto_3b

    .restart local v1    # "v":Ljava/lang/Object;
    :cond_49
    const/4 v2, 0x0

    goto :goto_48

    .line 597
    .end local v0    # "manager":Ljava/util/logging/LogManager;
    .end local v1    # "v":Ljava/lang/Object;
    .end local v2    # "value":Ljava/lang/String;
    :catchall_4b
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "def"    # Ljava/lang/String;

    .prologue
    .line 635
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/LogManagerProperties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 636
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_7

    .end local p2    # "def":Ljava/lang/String;
    :goto_6
    return-object p2

    .restart local p2    # "def":Ljava/lang/String;
    :cond_7
    move-object p2, v0

    goto :goto_6
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 756
    sget-boolean v0, Lcom/sun/mail/util/logging/LogManagerProperties;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    iget-object v1, p0, Lcom/sun/mail/util/logging/LogManagerProperties;->prefix:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(I)V

    throw v0

    .line 757
    :cond_10
    invoke-super {p0}, Ljava/util/Properties;->hashCode()I

    move-result v0

    return v0
.end method

.method public propertyNames()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 723
    sget-boolean v0, Lcom/sun/mail/util/logging/LogManagerProperties;->$assertionsDisabled:Z

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 724
    :cond_a
    invoke-super {p0}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 666
    monitor-enter p0

    :try_start_1
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/LogManagerProperties;->preWrite(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 667
    .local v0, "def":Ljava/lang/Object;
    invoke-super {p0, p1, p2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_f

    move-result-object v1

    .line 668
    .local v1, "man":Ljava/lang/Object;
    if-nez v1, :cond_d

    .end local v0    # "def":Ljava/lang/Object;
    :goto_b
    monitor-exit p0

    return-object v0

    .restart local v0    # "def":Ljava/lang/Object;
    :cond_d
    move-object v0, v1

    goto :goto_b

    .line 666
    .end local v0    # "def":Ljava/lang/Object;
    .end local v1    # "man":Ljava/lang/Object;
    :catchall_f
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 710
    monitor-enter p0

    :try_start_1
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/LogManagerProperties;->preWrite(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 711
    .local v0, "def":Ljava/lang/Object;
    invoke-super {p0, p1}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_f

    move-result-object v1

    .line 712
    .local v1, "man":Ljava/lang/Object;
    if-nez v1, :cond_d

    .end local v0    # "def":Ljava/lang/Object;
    :goto_b
    monitor-exit p0

    return-object v0

    .restart local v0    # "def":Ljava/lang/Object;
    :cond_d
    move-object v0, v1

    goto :goto_b

    .line 710
    .end local v0    # "def":Ljava/lang/Object;
    .end local v1    # "man":Ljava/lang/Object;
    :catchall_f
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 680
    invoke-virtual {p0, p1, p2}, Lcom/sun/mail/util/logging/LogManagerProperties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
