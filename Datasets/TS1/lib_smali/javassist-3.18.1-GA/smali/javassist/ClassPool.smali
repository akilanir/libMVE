.class public Ljavassist/ClassPool;
.super Ljava/lang/Object;
.source "ClassPool.java"


# static fields
.field private static final COMPRESS_THRESHOLD:I = 0x64

.field private static final INIT_HASH_SIZE:I = 0xbf

.field private static defaultPool:Ljavassist/ClassPool;

.field private static defineClass1:Ljava/lang/reflect/Method;

.field private static defineClass2:Ljava/lang/reflect/Method;

.field private static definePackage:Ljava/lang/reflect/Method;

.field public static doPruning:Z

.field public static releaseUnmodifiedClassFile:Z


# instance fields
.field private cflow:Ljava/util/Hashtable;

.field public childFirstLookup:Z

.field protected classes:Ljava/util/Hashtable;

.field private compressCount:I

.field private importedPackages:Ljava/util/ArrayList;

.field protected parent:Ljavassist/ClassPool;

.field protected source:Ljavassist/ClassPoolTail;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 77
    :try_start_0
    new-instance v1, Ljavassist/ClassPool$1;

    invoke-direct {v1}, Ljavassist/ClassPool$1;-><init>()V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/security/PrivilegedActionException; {:try_start_0 .. :try_end_8} :catch_12

    .line 128
    const/4 v1, 0x0

    sput-boolean v1, Ljavassist/ClassPool;->doPruning:Z

    .line 143
    const/4 v1, 0x1

    sput-boolean v1, Ljavassist/ClassPool;->releaseUnmodifiedClassFile:Z

    .line 235
    const/4 v1, 0x0

    sput-object v1, Ljavassist/ClassPool;->defaultPool:Ljavassist/ClassPool;

    return-void

    .line 96
    :catch_12
    move-exception v0

    .line 97
    .local v0, "pae":Ljava/security/PrivilegedActionException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "cannot initialize ClassPool"

    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getException()Ljava/lang/Exception;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 162
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljavassist/ClassPool;-><init>(Ljavassist/ClassPool;)V

    .line 163
    return-void
.end method

.method public constructor <init>(Ljavassist/ClassPool;)V
    .registers 9
    .param p1, "parent"    # Ljavassist/ClassPool;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-boolean v5, p0, Ljavassist/ClassPool;->childFirstLookup:Z

    .line 152
    iput-object v6, p0, Ljavassist/ClassPool;->cflow:Ljava/util/Hashtable;

    .line 188
    new-instance v2, Ljava/util/Hashtable;

    const/16 v3, 0xbf

    invoke-direct {v2, v3}, Ljava/util/Hashtable;-><init>(I)V

    iput-object v2, p0, Ljavassist/ClassPool;->classes:Ljava/util/Hashtable;

    .line 189
    new-instance v2, Ljavassist/ClassPoolTail;

    invoke-direct {v2}, Ljavassist/ClassPoolTail;-><init>()V

    iput-object v2, p0, Ljavassist/ClassPool;->source:Ljavassist/ClassPoolTail;

    .line 190
    iput-object p1, p0, Ljavassist/ClassPool;->parent:Ljavassist/ClassPool;

    .line 191
    if-nez p1, :cond_33

    .line 192
    sget-object v1, Ljavassist/CtClass;->primitiveTypes:[Ljavassist/CtClass;

    .line 193
    .local v1, "pt":[Ljavassist/CtClass;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_20
    array-length v2, v1

    if-ge v0, v2, :cond_33

    .line 194
    iget-object v2, p0, Ljavassist/ClassPool;->classes:Ljava/util/Hashtable;

    aget-object v3, v1, v0

    invoke-virtual {v3}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 197
    .end local v0    # "i":I
    .end local v1    # "pt":[Ljavassist/CtClass;
    :cond_33
    iput-object v6, p0, Ljavassist/ClassPool;->cflow:Ljava/util/Hashtable;

    .line 198
    iput v5, p0, Ljavassist/ClassPool;->compressCount:I

    .line 199
    invoke-virtual {p0}, Ljavassist/ClassPool;->clearImportedPackages()V

    .line 200
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3
    .param p1, "useDefaultPath"    # Z

    .prologue
    .line 175
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljavassist/ClassPool;-><init>(Ljavassist/ClassPool;)V

    .line 176
    if-eqz p1, :cond_9

    .line 177
    invoke-virtual {p0}, Ljavassist/ClassPool;->appendSystemPath()Ljavassist/ClassPath;

    .line 178
    :cond_9
    return-void
.end method

.method static synthetic access$002(Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;
    .registers 1
    .param p0, "x0"    # Ljava/lang/reflect/Method;

    .prologue
    .line 70
    sput-object p0, Ljavassist/ClassPool;->defineClass1:Ljava/lang/reflect/Method;

    return-object p0
.end method

.method static synthetic access$102(Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;
    .registers 1
    .param p0, "x0"    # Ljava/lang/reflect/Method;

    .prologue
    .line 70
    sput-object p0, Ljavassist/ClassPool;->defineClass2:Ljava/lang/reflect/Method;

    return-object p0
.end method

.method static synthetic access$202(Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;
    .registers 1
    .param p0, "x0"    # Ljava/lang/reflect/Method;

    .prologue
    .line 70
    sput-object p0, Ljavassist/ClassPool;->definePackage:Ljava/lang/reflect/Method;

    return-object p0
.end method

.method static getContextClassLoader()Ljava/lang/ClassLoader;
    .registers 1

    .prologue
    .line 1022
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getDefault()Ljavassist/ClassPool;
    .registers 3

    .prologue
    .line 227
    const-class v1, Ljavassist/ClassPool;

    monitor-enter v1

    :try_start_3
    sget-object v0, Ljavassist/ClassPool;->defaultPool:Ljavassist/ClassPool;

    if-nez v0, :cond_14

    .line 228
    new-instance v0, Ljavassist/ClassPool;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Ljavassist/ClassPool;-><init>(Ljavassist/ClassPool;)V

    sput-object v0, Ljavassist/ClassPool;->defaultPool:Ljavassist/ClassPool;

    .line 229
    sget-object v0, Ljavassist/ClassPool;->defaultPool:Ljavassist/ClassPool;

    invoke-virtual {v0}, Ljavassist/ClassPool;->appendSystemPath()Ljavassist/ClassPath;

    .line 232
    :cond_14
    sget-object v0, Ljavassist/ClassPool;->defaultPool:Ljavassist/ClassPool;
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_18

    monitor-exit v1

    return-object v0

    .line 227
    :catchall_18
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static declared-synchronized toClass2(Ljava/lang/reflect/Method;Ljava/lang/ClassLoader;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1110
    const-class v1, Ljavassist/ClassPool;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_4
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_17

    .line 1112
    :try_start_7
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catchall {:try_start_7 .. :try_end_a} :catchall_11

    move-result-object v0

    .line 1115
    const/4 v2, 0x0

    :try_start_c
    invoke-virtual {p0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_17

    monitor-exit v1

    return-object v0

    :catchall_11
    move-exception v0

    const/4 v2, 0x0

    :try_start_13
    invoke-virtual {p0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    throw v0
    :try_end_17
    .catchall {:try_start_13 .. :try_end_17} :catchall_17

    .line 1110
    :catchall_17
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public appendClassPath(Ljava/lang/String;)Ljavassist/ClassPath;
    .registers 3
    .param p1, "pathname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 933
    iget-object v0, p0, Ljavassist/ClassPool;->source:Ljavassist/ClassPoolTail;

    invoke-virtual {v0, p1}, Ljavassist/ClassPoolTail;->appendClassPath(Ljava/lang/String;)Ljavassist/ClassPath;

    move-result-object v0

    return-object v0
.end method

.method public appendClassPath(Ljavassist/ClassPath;)Ljavassist/ClassPath;
    .registers 3
    .param p1, "cp"    # Ljavassist/ClassPath;

    .prologue
    .line 897
    iget-object v0, p0, Ljavassist/ClassPool;->source:Ljavassist/ClassPoolTail;

    invoke-virtual {v0, p1}, Ljavassist/ClassPoolTail;->appendClassPath(Ljavassist/ClassPath;)Ljavassist/ClassPath;

    move-result-object v0

    return-object v0
.end method

.method public appendPathList(Ljava/lang/String;)V
    .registers 6
    .param p1, "pathlist"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 958
    sget-char v2, Ljava/io/File;->pathSeparatorChar:C

    .line 959
    .local v2, "sep":C
    const/4 v0, 0x0

    .line 961
    .local v0, "i":I
    :goto_3
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 962
    .local v1, "j":I
    if-gez v1, :cond_11

    .line 963
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljavassist/ClassPool;->appendClassPath(Ljava/lang/String;)Ljavassist/ClassPath;

    .line 971
    return-void

    .line 967
    :cond_11
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljavassist/ClassPool;->appendClassPath(Ljava/lang/String;)Ljavassist/ClassPath;

    .line 968
    add-int/lit8 v0, v1, 0x1

    .line 970
    goto :goto_3
.end method

.method public appendSystemPath()Ljavassist/ClassPath;
    .registers 2

    .prologue
    .line 871
    iget-object v0, p0, Ljavassist/ClassPool;->source:Ljavassist/ClassPoolTail;

    invoke-virtual {v0}, Ljavassist/ClassPoolTail;->appendSystemPath()Ljavassist/ClassPath;

    move-result-object v0

    return-object v0
.end method

.method protected cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "c"    # Ljavassist/CtClass;
    .param p3, "dynamic"    # Z

    .prologue
    .line 256
    iget-object v0, p0, Ljavassist/ClassPool;->classes:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    return-void
.end method

.method checkNotExists(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 627
    invoke-virtual {p0, p1}, Ljavassist/ClassPool;->getCached(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 628
    .local v0, "clazz":Ljavassist/CtClass;
    if-nez v0, :cond_15

    .line 629
    iget-boolean v1, p0, Ljavassist/ClassPool;->childFirstLookup:Z

    if-nez v1, :cond_15

    iget-object v1, p0, Ljavassist/ClassPool;->parent:Ljavassist/ClassPool;

    if-eqz v1, :cond_15

    .line 631
    :try_start_e
    iget-object v1, p0, Ljavassist/ClassPool;->parent:Ljavassist/ClassPool;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Ljavassist/ClassPool;->get0(Ljava/lang/String;Z)Ljavassist/CtClass;
    :try_end_14
    .catch Ljavassist/NotFoundException; {:try_start_e .. :try_end_14} :catch_16

    move-result-object v0

    .line 636
    :cond_15
    :goto_15
    return-object v0

    .line 633
    :catch_16
    move-exception v1

    goto :goto_15
.end method

.method checkNotFrozen(Ljava/lang/String;)V
    .registers 6
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 602
    invoke-virtual {p0, p1}, Ljavassist/ClassPool;->getCached(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 603
    .local v0, "clazz":Ljavassist/CtClass;
    if-nez v0, :cond_30

    .line 604
    iget-boolean v1, p0, Ljavassist/ClassPool;->childFirstLookup:Z

    if-nez v1, :cond_4f

    iget-object v1, p0, Ljavassist/ClassPool;->parent:Ljavassist/ClassPool;

    if-eqz v1, :cond_4f

    .line 606
    :try_start_e
    iget-object v1, p0, Ljavassist/ClassPool;->parent:Ljavassist/ClassPool;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Ljavassist/ClassPool;->get0(Ljava/lang/String;Z)Ljavassist/CtClass;
    :try_end_14
    .catch Ljavassist/NotFoundException; {:try_start_e .. :try_end_14} :catch_50

    move-result-object v0

    .line 609
    :goto_15
    if-eqz v0, :cond_4f

    .line 610
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is in a parent ClassPool.  Use the parent."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 615
    :cond_30
    invoke-virtual {v0}, Ljavassist/CtClass;->isFrozen()Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 616
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": frozen class (cannot edit)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 618
    :cond_4f
    return-void

    .line 608
    :catch_50
    move-exception v1

    goto :goto_15
.end method

.method declared-synchronized classNameChanged(Ljava/lang/String;Ljavassist/CtClass;)V
    .registers 6
    .param p1, "oldname"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljavassist/CtClass;

    .prologue
    .line 417
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Ljavassist/ClassPool;->getCached(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 418
    .local v0, "c":Ljavassist/CtClass;
    if-ne v0, p2, :cond_a

    .line 419
    invoke-virtual {p0, p1}, Ljavassist/ClassPool;->removeCached(Ljava/lang/String;)Ljavassist/CtClass;

    .line 421
    :cond_a
    invoke-virtual {p2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    .line 422
    .local v1, "newName":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljavassist/ClassPool;->checkNotFrozen(Ljava/lang/String;)V

    .line 423
    const/4 v2, 0x0

    invoke-virtual {p0, v1, p2, v2}, Ljavassist/ClassPool;->cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_17

    .line 424
    monitor-exit p0

    return-void

    .line 417
    .end local v0    # "c":Ljavassist/CtClass;
    .end local v1    # "newName":Ljava/lang/String;
    :catchall_17
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public clearImportedPackages()V
    .registers 3

    .prologue
    .line 319
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/ClassPool;->importedPackages:Ljava/util/ArrayList;

    .line 320
    iget-object v0, p0, Ljavassist/ClassPool;->importedPackages:Ljava/util/ArrayList;

    const-string v1, "java.lang"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 321
    return-void
.end method

.method compress()V
    .registers 4

    .prologue
    .line 282
    iget v1, p0, Ljavassist/ClassPool;->compressCount:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Ljavassist/ClassPool;->compressCount:I

    const/16 v2, 0x64

    if-le v1, v2, :cond_23

    .line 283
    const/4 v1, 0x0

    iput v1, p0, Ljavassist/ClassPool;->compressCount:I

    .line 284
    iget-object v1, p0, Ljavassist/ClassPool;->classes:Ljava/util/Hashtable;

    invoke-virtual {v1}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 285
    .local v0, "e":Ljava/util/Enumeration;
    :goto_13
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 286
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/CtClass;

    invoke-virtual {v1}, Ljavassist/CtClass;->compress()V

    goto :goto_13

    .line 288
    .end local v0    # "e":Ljava/util/Enumeration;
    :cond_23
    return-void
.end method

.method protected createCtClass(Ljava/lang/String;Z)Ljavassist/CtClass;
    .registers 8
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "useCache"    # Z

    .prologue
    const/4 v1, 0x0

    const/16 v4, 0x5b

    const/4 v3, 0x0

    .line 563
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v4, :cond_e

    .line 564
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->toClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 566
    :cond_e
    const-string v2, "[]"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_33

    .line 567
    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 568
    .local v0, "base":Ljava/lang/String;
    if-eqz p2, :cond_26

    invoke-virtual {p0, v0}, Ljavassist/ClassPool;->getCached(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v2

    if-nez v2, :cond_2d

    :cond_26
    invoke-virtual {p0, v0}, Ljavassist/ClassPool;->find(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    if-nez v2, :cond_2d

    .line 577
    .end local v0    # "base":Ljava/lang/String;
    :cond_2c
    :goto_2c
    return-object v1

    .line 571
    .restart local v0    # "base":Ljava/lang/String;
    :cond_2d
    new-instance v1, Ljavassist/CtArray;

    invoke-direct {v1, p1, p0}, Ljavassist/CtArray;-><init>(Ljava/lang/String;Ljavassist/ClassPool;)V

    goto :goto_2c

    .line 574
    .end local v0    # "base":Ljava/lang/String;
    :cond_33
    invoke-virtual {p0, p1}, Ljavassist/ClassPool;->find(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    if-eqz v2, :cond_2c

    .line 577
    new-instance v1, Ljavassist/CtClassType;

    invoke-direct {v1, p1, p0}, Ljavassist/CtClassType;-><init>(Ljava/lang/String;Ljavassist/ClassPool;)V

    goto :goto_2c
.end method

.method public find(Ljava/lang/String;)Ljava/net/URL;
    .registers 3
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 590
    iget-object v0, p0, Ljavassist/ClassPool;->source:Ljavassist/ClassPoolTail;

    invoke-virtual {v0, p1}, Ljavassist/ClassPoolTail;->find(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 4
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 444
    if-nez p1, :cond_b

    .line 445
    const/4 v0, 0x0

    .line 449
    .local v0, "clazz":Ljavassist/CtClass;
    :goto_3
    if-nez v0, :cond_11

    .line 450
    new-instance v1, Ljavassist/NotFoundException;

    invoke-direct {v1, p1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 447
    .end local v0    # "clazz":Ljavassist/CtClass;
    :cond_b
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Ljavassist/ClassPool;->get0(Ljava/lang/String;Z)Ljavassist/CtClass;

    move-result-object v0

    .restart local v0    # "clazz":Ljavassist/CtClass;
    goto :goto_3

    .line 452
    :cond_11
    invoke-virtual {v0}, Ljavassist/CtClass;->incGetCounter()V

    .line 453
    return-object v0
.end method

.method public get([Ljava/lang/String;)[Ljavassist/CtClass;
    .registers 6
    .param p1, "classnames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 663
    if-nez p1, :cond_6

    .line 664
    const/4 v3, 0x0

    new-array v2, v3, [Ljavassist/CtClass;

    .line 671
    :cond_5
    return-object v2

    .line 666
    :cond_6
    array-length v1, p1

    .line 667
    .local v1, "num":I
    new-array v2, v1, [Ljavassist/CtClass;

    .line 668
    .local v2, "result":[Ljavassist/CtClass;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_5

    .line 669
    aget-object v3, p1, v0

    invoke-virtual {p0, v3}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v3

    aput-object v3, v2, v0

    .line 668
    add-int/lit8 v0, v0, 0x1

    goto :goto_a
.end method

.method protected declared-synchronized get0(Ljava/lang/String;Z)Ljavassist/CtClass;
    .registers 7
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "useCache"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 526
    monitor-enter p0

    const/4 v0, 0x0

    .line 527
    .local v0, "clazz":Ljavassist/CtClass;
    if-eqz p2, :cond_d

    .line 528
    :try_start_4
    invoke-virtual {p0, p1}, Ljavassist/ClassPool;->getCached(Ljava/lang/String;)Ljavassist/CtClass;
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_41

    move-result-object v0

    .line 529
    if-eqz v0, :cond_d

    move-object v1, v0

    .line 551
    .end local v0    # "clazz":Ljavassist/CtClass;
    .local v1, "clazz":Ljavassist/CtClass;
    :goto_b
    monitor-exit p0

    return-object v1

    .line 533
    .end local v1    # "clazz":Ljavassist/CtClass;
    .restart local v0    # "clazz":Ljavassist/CtClass;
    :cond_d
    :try_start_d
    iget-boolean v2, p0, Ljavassist/ClassPool;->childFirstLookup:Z

    if-nez v2, :cond_1f

    iget-object v2, p0, Ljavassist/ClassPool;->parent:Ljavassist/ClassPool;

    if-eqz v2, :cond_1f

    .line 534
    iget-object v2, p0, Ljavassist/ClassPool;->parent:Ljavassist/ClassPool;

    invoke-virtual {v2, p1, p2}, Ljavassist/ClassPool;->get0(Ljava/lang/String;Z)Ljavassist/CtClass;

    move-result-object v0

    .line 535
    if-eqz v0, :cond_1f

    move-object v1, v0

    .line 536
    .end local v0    # "clazz":Ljavassist/CtClass;
    .restart local v1    # "clazz":Ljavassist/CtClass;
    goto :goto_b

    .line 539
    .end local v1    # "clazz":Ljavassist/CtClass;
    .restart local v0    # "clazz":Ljavassist/CtClass;
    :cond_1f
    invoke-virtual {p0, p1, p2}, Ljavassist/ClassPool;->createCtClass(Ljava/lang/String;Z)Ljavassist/CtClass;

    move-result-object v0

    .line 540
    if-eqz v0, :cond_31

    .line 542
    if-eqz p2, :cond_2f

    .line 543
    invoke-virtual {v0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v0, v3}, Ljavassist/ClassPool;->cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V

    :cond_2f
    move-object v1, v0

    .line 545
    .end local v0    # "clazz":Ljavassist/CtClass;
    .restart local v1    # "clazz":Ljavassist/CtClass;
    goto :goto_b

    .line 548
    .end local v1    # "clazz":Ljavassist/CtClass;
    .restart local v0    # "clazz":Ljavassist/CtClass;
    :cond_31
    iget-boolean v2, p0, Ljavassist/ClassPool;->childFirstLookup:Z

    if-eqz v2, :cond_3f

    iget-object v2, p0, Ljavassist/ClassPool;->parent:Ljavassist/ClassPool;

    if-eqz v2, :cond_3f

    .line 549
    iget-object v2, p0, Ljavassist/ClassPool;->parent:Ljavassist/ClassPool;

    invoke-virtual {v2, p1, p2}, Ljavassist/ClassPool;->get0(Ljava/lang/String;Z)Ljavassist/CtClass;
    :try_end_3e
    .catchall {:try_start_d .. :try_end_3e} :catchall_41

    move-result-object v0

    :cond_3f
    move-object v1, v0

    .line 551
    .end local v0    # "clazz":Ljavassist/CtClass;
    .restart local v1    # "clazz":Ljavassist/CtClass;
    goto :goto_b

    .line 526
    .end local v1    # "clazz":Ljavassist/CtClass;
    .restart local v0    # "clazz":Ljavassist/CtClass;
    :catchall_41
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public getAndRename(Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtClass;
    .registers 5
    .param p1, "orgName"    # Ljava/lang/String;
    .param p2, "newName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 399
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Ljavassist/ClassPool;->get0(Ljava/lang/String;Z)Ljavassist/CtClass;

    move-result-object v0

    .line 400
    .local v0, "clazz":Ljavassist/CtClass;
    if-nez v0, :cond_d

    .line 401
    new-instance v1, Ljavassist/NotFoundException;

    invoke-direct {v1, p1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 403
    :cond_d
    instance-of v1, v0, Ljavassist/CtClassType;

    if-eqz v1, :cond_17

    move-object v1, v0

    .line 404
    check-cast v1, Ljavassist/CtClassType;

    invoke-virtual {v1, p0}, Ljavassist/CtClassType;->setClassPool(Ljavassist/ClassPool;)V

    .line 406
    :cond_17
    invoke-virtual {v0, p2}, Ljavassist/CtClass;->setName(Ljava/lang/String;)V

    .line 408
    return-object v0
.end method

.method protected getCached(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 3
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 245
    iget-object v0, p0, Ljavassist/ClassPool;->classes:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/CtClass;

    return-object v0
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 1014
    invoke-static {}, Ljavassist/ClassPool;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public getCtClass(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 4
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 512
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5b

    if-ne v0, v1, :cond_e

    .line 513
    invoke-static {p1, p0}, Ljavassist/bytecode/Descriptor;->toCtClass(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;

    move-result-object v0

    .line 515
    :goto_d
    return-object v0

    :cond_e
    invoke-virtual {p0, p1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    goto :goto_d
.end method

.method public getImportedPackages()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 330
    iget-object v0, p0, Ljavassist/ClassPool;->importedPackages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getMethod(Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtMethod;
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "methodname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 684
    invoke-virtual {p0, p1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 685
    .local v0, "c":Ljavassist/CtClass;
    invoke-virtual {v0, p2}, Ljavassist/CtClass;->getDeclaredMethod(Ljava/lang/String;)Ljavassist/CtMethod;

    move-result-object v1

    return-object v1
.end method

.method public getOrNull(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 4
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 472
    const/4 v0, 0x0

    .line 473
    .local v0, "clazz":Ljavassist/CtClass;
    if-nez p1, :cond_a

    .line 474
    const/4 v0, 0x0

    .line 485
    :goto_4
    if-eqz v0, :cond_9

    .line 486
    invoke-virtual {v0}, Ljavassist/CtClass;->incGetCounter()V

    .line 488
    :cond_9
    return-object v0

    .line 481
    :cond_a
    const/4 v1, 0x1

    :try_start_b
    invoke-virtual {p0, p1, v1}, Ljavassist/ClassPool;->get0(Ljava/lang/String;Z)Ljavassist/CtClass;
    :try_end_e
    .catch Ljavassist/NotFoundException; {:try_start_b .. :try_end_e} :catch_10

    move-result-object v0

    goto :goto_4

    .line 483
    :catch_10
    move-exception v1

    goto :goto_4
.end method

.method public importPackage(Ljava/lang/String;)V
    .registers 3
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 308
    iget-object v0, p0, Ljavassist/ClassPool;->importedPackages:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 309
    return-void
.end method

.method public insertClassPath(Ljava/lang/String;)Ljavassist/ClassPath;
    .registers 3
    .param p1, "pathname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 915
    iget-object v0, p0, Ljavassist/ClassPool;->source:Ljavassist/ClassPoolTail;

    invoke-virtual {v0, p1}, Ljavassist/ClassPoolTail;->insertClassPath(Ljava/lang/String;)Ljavassist/ClassPath;

    move-result-object v0

    return-object v0
.end method

.method public insertClassPath(Ljavassist/ClassPath;)Ljavassist/ClassPath;
    .registers 3
    .param p1, "cp"    # Ljavassist/ClassPath;

    .prologue
    .line 884
    iget-object v0, p0, Ljavassist/ClassPool;->source:Ljavassist/ClassPoolTail;

    invoke-virtual {v0, p1}, Ljavassist/ClassPoolTail;->insertClassPath(Ljavassist/ClassPath;)Ljavassist/ClassPath;

    move-result-object v0

    return-object v0
.end method

.method public lookupCflow(Ljava/lang/String;)[Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 372
    iget-object v0, p0, Ljavassist/ClassPool;->cflow:Ljava/util/Hashtable;

    if-nez v0, :cond_b

    .line 373
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Ljavassist/ClassPool;->cflow:Ljava/util/Hashtable;

    .line 375
    :cond_b
    iget-object v0, p0, Ljavassist/ClassPool;->cflow:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    return-object v0
.end method

.method public makeClass(Ljava/io/InputStream;)Ljavassist/CtClass;
    .registers 3
    .param p1, "classfile"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 706
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Ljavassist/ClassPool;->makeClass(Ljava/io/InputStream;Z)Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public makeClass(Ljava/io/InputStream;Z)Ljavassist/CtClass;
    .registers 7
    .param p1, "classfile"    # Ljava/io/InputStream;
    .param p2, "ifNotFrozen"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 726
    invoke-virtual {p0}, Ljavassist/ClassPool;->compress()V

    .line 727
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 728
    .end local p1    # "classfile":Ljava/io/InputStream;
    .local v0, "classfile":Ljava/io/InputStream;
    new-instance v2, Ljavassist/CtClassType;

    invoke-direct {v2, v0, p0}, Ljavassist/CtClassType;-><init>(Ljava/io/InputStream;Ljavassist/ClassPool;)V

    .line 729
    .local v2, "clazz":Ljavassist/CtClass;
    invoke-virtual {v2}, Ljavassist/CtClass;->checkModify()V

    .line 730
    invoke-virtual {v2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    .line 731
    .local v1, "classname":Ljava/lang/String;
    if-eqz p2, :cond_19

    .line 732
    invoke-virtual {p0, v1}, Ljavassist/ClassPool;->checkNotFrozen(Ljava/lang/String;)V

    .line 734
    :cond_19
    const/4 v3, 0x1

    invoke-virtual {p0, v1, v2, v3}, Ljavassist/ClassPool;->cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V

    .line 735
    return-object v2
.end method

.method public makeClass(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 3
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 787
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ljavassist/ClassPool;->makeClass(Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized makeClass(Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtClass;
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "superclass"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 810
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Ljavassist/ClassPool;->checkNotFrozen(Ljava/lang/String;)V

    .line 811
    new-instance v0, Ljavassist/CtNewClass;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p0, v1, p2}, Ljavassist/CtNewClass;-><init>(Ljava/lang/String;Ljavassist/ClassPool;ZLjavassist/CtClass;)V

    .line 812
    .local v0, "clazz":Ljavassist/CtClass;
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Ljavassist/ClassPool;->cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    .line 813
    monitor-exit p0

    return-object v0

    .line 810
    .end local v0    # "clazz":Ljavassist/CtClass;
    :catchall_10
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public makeClassIfNew(Ljava/io/InputStream;)Ljavassist/CtClass;
    .registers 7
    .param p1, "classfile"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 756
    invoke-virtual {p0}, Ljavassist/ClassPool;->compress()V

    .line 757
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 758
    .end local p1    # "classfile":Ljava/io/InputStream;
    .local v0, "classfile":Ljava/io/InputStream;
    new-instance v2, Ljavassist/CtClassType;

    invoke-direct {v2, v0, p0}, Ljavassist/CtClassType;-><init>(Ljava/io/InputStream;Ljavassist/ClassPool;)V

    .line 759
    .local v2, "clazz":Ljavassist/CtClass;
    invoke-virtual {v2}, Ljavassist/CtClass;->checkModify()V

    .line 760
    invoke-virtual {v2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    .line 761
    .local v1, "classname":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljavassist/ClassPool;->checkNotExists(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v3

    .line 762
    .local v3, "found":Ljavassist/CtClass;
    if-eqz v3, :cond_1b

    .line 766
    .end local v3    # "found":Ljavassist/CtClass;
    :goto_1a
    return-object v3

    .line 765
    .restart local v3    # "found":Ljavassist/CtClass;
    :cond_1b
    const/4 v4, 0x1

    invoke-virtual {p0, v1, v2, v4}, Ljavassist/ClassPool;->cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V

    move-object v3, v2

    .line 766
    goto :goto_1a
.end method

.method public makeInterface(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 839
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ljavassist/ClassPool;->makeInterface(Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized makeInterface(Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtClass;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "superclass"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 854
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Ljavassist/ClassPool;->checkNotFrozen(Ljava/lang/String;)V

    .line 855
    new-instance v0, Ljavassist/CtNewClass;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p0, v1, p2}, Ljavassist/CtNewClass;-><init>(Ljava/lang/String;Ljavassist/ClassPool;ZLjavassist/CtClass;)V

    .line 856
    .local v0, "clazz":Ljavassist/CtClass;
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Ljavassist/ClassPool;->cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    .line 857
    monitor-exit p0

    return-object v0

    .line 854
    .end local v0    # "clazz":Ljavassist/CtClass;
    :catchall_10
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized makeNestedClass(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 824
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Ljavassist/ClassPool;->checkNotFrozen(Ljava/lang/String;)V

    .line 825
    new-instance v0, Ljavassist/CtNewNestedClass;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p1, p0, v1, v2}, Ljavassist/CtNewNestedClass;-><init>(Ljava/lang/String;Ljavassist/ClassPool;ZLjavassist/CtClass;)V

    .line 826
    .local v0, "clazz":Ljavassist/CtClass;
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Ljavassist/ClassPool;->cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_11

    .line 827
    monitor-exit p0

    return-object v0

    .line 824
    .end local v0    # "clazz":Ljavassist/CtClass;
    :catchall_11
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public makePackage(Ljava/lang/ClassLoader;Ljava/lang/String;)V
    .registers 8
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 1139
    const/16 v3, 0x8

    new-array v0, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v0, v3

    const/4 v3, 0x1

    aput-object v4, v0, v3

    const/4 v3, 0x2

    aput-object v4, v0, v3

    const/4 v3, 0x3

    aput-object v4, v0, v3

    const/4 v3, 0x4

    aput-object v4, v0, v3

    const/4 v3, 0x5

    aput-object v4, v0, v3

    const/4 v3, 0x6

    aput-object v4, v0, v3

    const/4 v3, 0x7

    aput-object v4, v0, v3

    .line 1143
    .local v0, "args":[Ljava/lang/Object;
    :try_start_1d
    sget-object v3, Ljavassist/ClassPool;->definePackage:Ljava/lang/reflect/Method;

    invoke-static {v3, p1, v0}, Ljavassist/ClassPool;->toClass2(Ljava/lang/reflect/Method;Ljava/lang/ClassLoader;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1d .. :try_end_22} :catch_23
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_22} :catch_36

    .line 1153
    :goto_22
    return-void

    .line 1146
    :catch_23
    move-exception v1

    .line 1147
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v2

    .line 1148
    .local v2, "t":Ljava/lang/Throwable;
    if-nez v2, :cond_31

    .line 1149
    move-object v2, v1

    .line 1160
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :cond_2b
    :goto_2b
    new-instance v3, Ljavassist/CannotCompileException;

    invoke-direct {v3, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 1150
    .restart local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :cond_31
    instance-of v3, v2, Ljava/lang/IllegalArgumentException;

    if-eqz v3, :cond_2b

    goto :goto_22

    .line 1156
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v2    # "t":Ljava/lang/Throwable;
    :catch_36
    move-exception v1

    .line 1157
    .local v1, "e":Ljava/lang/Exception;
    move-object v2, v1

    .restart local v2    # "t":Ljava/lang/Throwable;
    goto :goto_2b
.end method

.method openClassfile(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 3
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 642
    iget-object v0, p0, Ljavassist/ClassPool;->source:Ljavassist/ClassPoolTail;

    invoke-virtual {v0, p1}, Ljavassist/ClassPoolTail;->openClassfile(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method recordCflow(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "cname"    # Ljava/lang/String;
    .param p3, "fname"    # Ljava/lang/String;

    .prologue
    .line 360
    iget-object v0, p0, Ljavassist/ClassPool;->cflow:Ljava/util/Hashtable;

    if-nez v0, :cond_b

    .line 361
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Ljavassist/ClassPool;->cflow:Ljava/util/Hashtable;

    .line 363
    :cond_b
    iget-object v0, p0, Ljavassist/ClassPool;->cflow:Ljava/util/Hashtable;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    aput-object p3, v1, v2

    invoke-virtual {v0, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    return-void
.end method

.method public recordInvalidClassName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 349
    return-void
.end method

.method protected removeCached(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 3
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 267
    iget-object v0, p0, Ljavassist/ClassPool;->classes:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/CtClass;

    return-object v0
.end method

.method public removeClassPath(Ljavassist/ClassPath;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/ClassPath;

    .prologue
    .line 942
    iget-object v0, p0, Ljavassist/ClassPool;->source:Ljavassist/ClassPoolTail;

    invoke-virtual {v0, p1}, Ljavassist/ClassPoolTail;->removeClassPath(Ljavassist/ClassPath;)V

    .line 943
    return-void
.end method

.method public toClass(Ljavassist/CtClass;)Ljava/lang/Class;
    .registers 3
    .param p1, "clazz"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1000
    invoke-virtual {p0}, Ljavassist/ClassPool;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ljavassist/ClassPool;->toClass(Ljavassist/CtClass;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public toClass(Ljavassist/CtClass;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 4
    .param p1, "ct"    # Ljavassist/CtClass;
    .param p2, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1042
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Ljavassist/ClassPool;->toClass(Ljavassist/CtClass;Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public toClass(Ljavassist/CtClass;Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)Ljava/lang/Class;
    .registers 11
    .param p1, "ct"    # Ljavassist/CtClass;
    .param p2, "loader"    # Ljava/lang/ClassLoader;
    .param p3, "domain"    # Ljava/security/ProtectionDomain;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1079
    :try_start_0
    invoke-virtual {p1}, Ljavassist/CtClass;->toBytecode()[B

    move-result-object v1

    .line 1082
    .local v1, "b":[B
    if-nez p3, :cond_2e

    .line 1083
    sget-object v3, Ljavassist/ClassPool;->defineClass1:Ljava/lang/reflect/Method;

    .line 1084
    .local v3, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x4

    new-array v0, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    const/4 v4, 0x1

    aput-object v1, v0, v4

    const/4 v4, 0x2

    new-instance v5, Ljava/lang/Integer;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Ljava/lang/Integer;-><init>(I)V

    aput-object v5, v0, v4

    const/4 v4, 0x3

    new-instance v5, Ljava/lang/Integer;

    array-length v6, v1

    invoke-direct {v5, v6}, Ljava/lang/Integer;-><init>(I)V

    aput-object v5, v0, v4

    .line 1093
    .local v0, "args":[Ljava/lang/Object;
    :goto_27
    invoke-static {v3, p2, v0}, Ljavassist/ClassPool;->toClass2(Ljava/lang/reflect/Method;Ljava/lang/ClassLoader;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    return-object v4

    .line 1088
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_2e
    sget-object v3, Ljavassist/ClassPool;->defineClass2:Ljava/lang/reflect/Method;

    .line 1089
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x5

    new-array v0, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    const/4 v4, 0x1

    aput-object v1, v0, v4

    const/4 v4, 0x2

    new-instance v5, Ljava/lang/Integer;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Ljava/lang/Integer;-><init>(I)V

    aput-object v5, v0, v4

    const/4 v4, 0x3

    new-instance v5, Ljava/lang/Integer;

    array-length v6, v1

    invoke-direct {v5, v6}, Ljava/lang/Integer;-><init>(I)V

    aput-object v5, v0, v4

    const/4 v4, 0x4

    aput-object p3, v0, v4
    :try_end_52
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_52} :catch_53
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_52} :catch_55
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_52} :catch_60

    .restart local v0    # "args":[Ljava/lang/Object;
    goto :goto_27

    .line 1095
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v1    # "b":[B
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :catch_53
    move-exception v2

    .line 1096
    .local v2, "e":Ljava/lang/RuntimeException;
    throw v2

    .line 1098
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :catch_55
    move-exception v2

    .line 1099
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 1101
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_60
    move-exception v2

    .line 1102
    .local v2, "e":Ljava/lang/Exception;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-direct {v4, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 274
    iget-object v0, p0, Ljavassist/ClassPool;->source:Ljavassist/ClassPoolTail;

    invoke-virtual {v0}, Ljavassist/ClassPoolTail;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method writeClassfile(Ljava/lang/String;Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;,
            Ljava/io/IOException;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 648
    iget-object v0, p0, Ljavassist/ClassPool;->source:Ljavassist/ClassPoolTail;

    invoke-virtual {v0, p1, p2}, Ljavassist/ClassPoolTail;->writeClassfile(Ljava/lang/String;Ljava/io/OutputStream;)V

    .line 649
    return-void
.end method
