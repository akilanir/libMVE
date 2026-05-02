.class public Ljavassist/bytecode/analysis/Type;
.super Ljava/lang/Object;
.source "Type.java"


# static fields
.field public static final BOGUS:Ljavassist/bytecode/analysis/Type;

.field public static final BOOLEAN:Ljavassist/bytecode/analysis/Type;

.field public static final BYTE:Ljavassist/bytecode/analysis/Type;

.field public static final CHAR:Ljavassist/bytecode/analysis/Type;

.field public static final CLONEABLE:Ljavassist/bytecode/analysis/Type;

.field public static final DOUBLE:Ljavassist/bytecode/analysis/Type;

.field public static final FLOAT:Ljavassist/bytecode/analysis/Type;

.field public static final INTEGER:Ljavassist/bytecode/analysis/Type;

.field public static final LONG:Ljavassist/bytecode/analysis/Type;

.field public static final OBJECT:Ljavassist/bytecode/analysis/Type;

.field public static final RETURN_ADDRESS:Ljavassist/bytecode/analysis/Type;

.field public static final SERIALIZABLE:Ljavassist/bytecode/analysis/Type;

.field public static final SHORT:Ljavassist/bytecode/analysis/Type;

.field public static final THROWABLE:Ljavassist/bytecode/analysis/Type;

.field public static final TOP:Ljavassist/bytecode/analysis/Type;

.field public static final UNINIT:Ljavassist/bytecode/analysis/Type;

.field public static final VOID:Ljavassist/bytecode/analysis/Type;

.field private static final prims:Ljava/util/Map;


# instance fields
.field private final clazz:Ljavassist/CtClass;

.field private final special:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 47
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    .line 49
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    sget-object v1, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    .line 51
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    sget-object v1, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->BOOLEAN:Ljavassist/bytecode/analysis/Type;

    .line 53
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    sget-object v1, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    .line 55
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    sget-object v1, Ljavassist/CtClass;->charType:Ljavassist/CtClass;

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->CHAR:Ljavassist/bytecode/analysis/Type;

    .line 57
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    sget-object v1, Ljavassist/CtClass;->byteType:Ljavassist/CtClass;

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->BYTE:Ljavassist/bytecode/analysis/Type;

    .line 59
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    sget-object v1, Ljavassist/CtClass;->shortType:Ljavassist/CtClass;

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->SHORT:Ljavassist/bytecode/analysis/Type;

    .line 61
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    sget-object v1, Ljavassist/CtClass;->intType:Ljavassist/CtClass;

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    .line 63
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    sget-object v1, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    .line 65
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    sget-object v1, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->VOID:Ljavassist/bytecode/analysis/Type;

    .line 76
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    invoke-direct {v0, v2}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->UNINIT:Ljavassist/bytecode/analysis/Type;

    .line 82
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    invoke-direct {v0, v2, v3}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;Z)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->RETURN_ADDRESS:Ljavassist/bytecode/analysis/Type;

    .line 85
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    invoke-direct {v0, v2, v3}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;Z)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    .line 94
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    invoke-direct {v0, v2, v3}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;Z)V

    sput-object v0, Ljavassist/bytecode/analysis/Type;->BOGUS:Ljavassist/bytecode/analysis/Type;

    .line 97
    const-string v0, "java.lang.Object"

    invoke-static {v0}, Ljavassist/bytecode/analysis/Type;->lookupType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    sput-object v0, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    .line 99
    const-string v0, "java.io.Serializable"

    invoke-static {v0}, Ljavassist/bytecode/analysis/Type;->lookupType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    sput-object v0, Ljavassist/bytecode/analysis/Type;->SERIALIZABLE:Ljavassist/bytecode/analysis/Type;

    .line 101
    const-string v0, "java.lang.Cloneable"

    invoke-static {v0}, Ljavassist/bytecode/analysis/Type;->lookupType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    sput-object v0, Ljavassist/bytecode/analysis/Type;->CLONEABLE:Ljavassist/bytecode/analysis/Type;

    .line 103
    const-string v0, "java.lang.Throwable"

    invoke-static {v0}, Ljavassist/bytecode/analysis/Type;->lookupType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    sput-object v0, Ljavassist/bytecode/analysis/Type;->THROWABLE:Ljavassist/bytecode/analysis/Type;

    .line 106
    sget-object v0, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    sget-object v1, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    sget-object v2, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    sget-object v1, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    sget-object v2, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    sget-object v1, Ljavassist/CtClass;->charType:Ljavassist/CtClass;

    sget-object v2, Ljavassist/bytecode/analysis/Type;->CHAR:Ljavassist/bytecode/analysis/Type;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    sget-object v1, Ljavassist/CtClass;->shortType:Ljavassist/CtClass;

    sget-object v2, Ljavassist/bytecode/analysis/Type;->SHORT:Ljavassist/bytecode/analysis/Type;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    sget-object v1, Ljavassist/CtClass;->intType:Ljavassist/CtClass;

    sget-object v2, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v0, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    sget-object v1, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    sget-object v2, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    sget-object v1, Ljavassist/CtClass;->byteType:Ljavassist/CtClass;

    sget-object v2, Ljavassist/bytecode/analysis/Type;->BYTE:Ljavassist/bytecode/analysis/Type;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    sget-object v1, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    sget-object v2, Ljavassist/bytecode/analysis/Type;->BOOLEAN:Ljavassist/bytecode/analysis/Type;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    sget-object v1, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    sget-object v2, Ljavassist/bytecode/analysis/Type;->VOID:Ljavassist/bytecode/analysis/Type;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    return-void
.end method

.method constructor <init>(Ljavassist/CtClass;)V
    .registers 3
    .param p1, "clazz"    # Ljavassist/CtClass;

    .prologue
    .line 140
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;Z)V

    .line 141
    return-void
.end method

.method private constructor <init>(Ljavassist/CtClass;Z)V
    .registers 3
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "special"    # Z

    .prologue
    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    iput-object p1, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    .line 145
    iput-boolean p2, p0, Ljavassist/bytecode/analysis/Type;->special:Z

    .line 146
    return-void
.end method

.method private createArray(Ljavassist/bytecode/analysis/Type;I)Ljavassist/bytecode/analysis/Type;
    .registers 7
    .param p1, "rootComponent"    # Ljavassist/bytecode/analysis/Type;
    .param p2, "dims"    # I

    .prologue
    .line 321
    instance-of v3, p1, Ljavassist/bytecode/analysis/MultiType;

    if-eqz v3, :cond_c

    .line 322
    new-instance v2, Ljavassist/bytecode/analysis/MultiArrayType;

    check-cast p1, Ljavassist/bytecode/analysis/MultiType;

    .end local p1    # "rootComponent":Ljavassist/bytecode/analysis/Type;
    invoke-direct {v2, p1, p2}, Ljavassist/bytecode/analysis/MultiArrayType;-><init>(Ljavassist/bytecode/analysis/MultiType;I)V

    .line 333
    :goto_b
    return-object v2

    .line 324
    .restart local p1    # "rootComponent":Ljavassist/bytecode/analysis/Type;
    :cond_c
    iget-object v3, p1, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {v3}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, p2}, Ljavassist/bytecode/analysis/Type;->arrayName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 328
    .local v1, "name":Ljava/lang/String;
    :try_start_16
    invoke-direct {p0, p1}, Ljavassist/bytecode/analysis/Type;->getClassPool(Ljavassist/bytecode/analysis/Type;)Ljavassist/ClassPool;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v3

    invoke-static {v3}, Ljavassist/bytecode/analysis/Type;->get(Ljavassist/CtClass;)Ljavassist/bytecode/analysis/Type;
    :try_end_21
    .catch Ljavassist/NotFoundException; {:try_start_16 .. :try_end_21} :catch_23

    move-result-object v2

    .local v2, "type":Ljavassist/bytecode/analysis/Type;
    goto :goto_b

    .line 329
    .end local v2    # "type":Ljavassist/bytecode/analysis/Type;
    :catch_23
    move-exception v0

    .line 330
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method static eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z
    .registers 4
    .param p0, "one"    # Ljavassist/CtClass;
    .param p1, "two"    # Ljavassist/CtClass;

    .prologue
    .line 578
    if-eq p0, p1, :cond_14

    if-eqz p0, :cond_16

    if-eqz p1, :cond_16

    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private findCommonInterfaces(Ljavassist/bytecode/analysis/Type;)Ljava/util/Map;
    .registers 6
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;

    .prologue
    const/4 v3, 0x0

    .line 474
    iget-object v2, p1, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {p0, v2, v3}, Ljavassist/bytecode/analysis/Type;->getAllInterfaces(Ljavassist/CtClass;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 475
    .local v1, "typeMap":Ljava/util/Map;
    iget-object v2, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {p0, v2, v3}, Ljavassist/bytecode/analysis/Type;->getAllInterfaces(Ljavassist/CtClass;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 477
    .local v0, "thisMap":Ljava/util/Map;
    invoke-virtual {p0, v1, v0}, Ljavassist/bytecode/analysis/Type;->findCommonInterfaces(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    return-object v2
.end method

.method private static findCommonSuperClass(Ljavassist/CtClass;Ljavassist/CtClass;)Ljavassist/CtClass;
    .registers 10
    .param p0, "one"    # Ljavassist/CtClass;
    .param p1, "two"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 393
    move-object v2, p0

    .line 394
    .local v2, "deep":Ljavassist/CtClass;
    move-object v5, p1

    .line 395
    .local v5, "shallow":Ljavassist/CtClass;
    move-object v1, v5

    .line 396
    .local v1, "backupShallow":Ljavassist/CtClass;
    move-object v0, v2

    .line 401
    .local v0, "backupDeep":Ljavassist/CtClass;
    :goto_4
    invoke-static {v2, v5}, Ljavassist/bytecode/analysis/Type;->eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v7

    if-eqz v7, :cond_12

    invoke-virtual {v2}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v7

    if-eqz v7, :cond_12

    move-object v3, v2

    .line 446
    .end local v2    # "deep":Ljavassist/CtClass;
    .local v3, "deep":Ljavassist/CtClass;
    :goto_11
    return-object v3

    .line 404
    .end local v3    # "deep":Ljavassist/CtClass;
    .restart local v2    # "deep":Ljavassist/CtClass;
    :cond_12
    invoke-virtual {v2}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v4

    .line 405
    .local v4, "deepSuper":Ljavassist/CtClass;
    invoke-virtual {v5}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v6

    .line 407
    .local v6, "shallowSuper":Ljavassist/CtClass;
    if-nez v6, :cond_33

    .line 409
    move-object v5, v1

    .line 430
    :goto_1d
    invoke-virtual {v2}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v2

    .line 431
    if-nez v2, :cond_3e

    .line 437
    move-object v2, v0

    .line 441
    :goto_24
    invoke-static {v2, v5}, Ljavassist/bytecode/analysis/Type;->eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v7

    if-nez v7, :cond_43

    .line 442
    invoke-virtual {v2}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v2

    .line 443
    invoke-virtual {v5}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v5

    goto :goto_24

    .line 413
    :cond_33
    if-nez v4, :cond_3b

    .line 415
    move-object v2, v0

    .line 416
    move-object v0, v1

    .line 417
    move-object v1, v2

    .line 419
    move-object v2, v5

    .line 420
    move-object v5, v1

    .line 421
    goto :goto_1d

    .line 424
    :cond_3b
    move-object v2, v4

    .line 425
    move-object v5, v6

    .line 426
    goto :goto_4

    .line 434
    :cond_3e
    invoke-virtual {v0}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v0

    goto :goto_1d

    :cond_43
    move-object v3, v2

    .line 446
    .end local v2    # "deep":Ljavassist/CtClass;
    .restart local v3    # "deep":Ljavassist/CtClass;
    goto :goto_11
.end method

.method private findExclusiveDeclaredInterfaces(Ljavassist/bytecode/analysis/Type;Ljavassist/CtClass;)Ljava/util/Map;
    .registers 10
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;
    .param p2, "exclude"    # Ljavassist/CtClass;

    .prologue
    const/4 v6, 0x0

    .line 481
    iget-object v5, p1, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {p0, v5, v6}, Ljavassist/bytecode/analysis/Type;->getDeclaredInterfaces(Ljavassist/CtClass;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    .line 482
    .local v4, "typeMap":Ljava/util/Map;
    iget-object v5, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {p0, v5, v6}, Ljavassist/bytecode/analysis/Type;->getDeclaredInterfaces(Ljavassist/CtClass;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    .line 483
    .local v3, "thisMap":Ljava/util/Map;
    invoke-virtual {p0, p2, v6}, Ljavassist/bytecode/analysis/Type;->getAllInterfaces(Ljavassist/CtClass;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 485
    .local v0, "excludeMap":Ljava/util/Map;
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 486
    .local v1, "i":Ljava/util/Iterator;
    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 487
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 488
    .local v2, "intf":Ljava/lang/Object;
    invoke-interface {v4, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_19

    .line 492
    .end local v2    # "intf":Ljava/lang/Object;
    :cond_2a
    invoke-virtual {p0, v4, v3}, Ljavassist/bytecode/analysis/Type;->findCommonInterfaces(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v5

    return-object v5
.end method

.method public static get(Ljavassist/CtClass;)Ljavassist/bytecode/analysis/Type;
    .registers 3
    .param p0, "clazz"    # Ljavassist/CtClass;

    .prologue
    .line 127
    sget-object v1, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/analysis/Type;

    .line 128
    .local v0, "type":Ljavassist/bytecode/analysis/Type;
    if-eqz v0, :cond_b

    .end local v0    # "type":Ljavassist/bytecode/analysis/Type;
    :goto_a
    return-object v0

    .restart local v0    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_b
    new-instance v0, Ljavassist/bytecode/analysis/Type;

    .end local v0    # "type":Ljavassist/bytecode/analysis/Type;
    invoke-direct {v0, p0}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    goto :goto_a
.end method

.method private getClassPool(Ljavassist/bytecode/analysis/Type;)Ljavassist/ClassPool;
    .registers 4
    .param p1, "rootComponent"    # Ljavassist/bytecode/analysis/Type;

    .prologue
    .line 352
    iget-object v1, p1, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {v1}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v0

    .line 353
    .local v0, "pool":Ljavassist/ClassPool;
    if-eqz v0, :cond_9

    .end local v0    # "pool":Ljavassist/ClassPool;
    :goto_8
    return-object v0

    .restart local v0    # "pool":Ljavassist/ClassPool;
    :cond_9
    invoke-static {}, Ljavassist/ClassPool;->getDefault()Ljavassist/ClassPool;

    move-result-object v0

    goto :goto_8
.end method

.method private static lookupType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 133
    :try_start_0
    new-instance v1, Ljavassist/bytecode/analysis/Type;

    invoke-static {}, Ljavassist/ClassPool;->getDefault()Ljavassist/ClassPool;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V
    :try_end_d
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_d} :catch_e

    return-object v1

    .line 134
    :catch_e
    move-exception v0

    .line 135
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private mergeArray(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;
    .registers 11
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;

    .prologue
    .line 357
    invoke-virtual {p0, p1}, Ljavassist/bytecode/analysis/Type;->getRootComponent(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v6

    .line 358
    .local v6, "typeRoot":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {p0, p0}, Ljavassist/bytecode/analysis/Type;->getRootComponent(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v4

    .line 359
    .local v4, "thisRoot":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->getDimensions()I

    move-result v5

    .line 360
    .local v5, "typeDims":I
    invoke-virtual {p0}, Ljavassist/bytecode/analysis/Type;->getDimensions()I

    move-result v3

    .line 363
    .local v3, "thisDims":I
    if-ne v5, v3, :cond_22

    .line 364
    invoke-virtual {v4, v6}, Ljavassist/bytecode/analysis/Type;->merge(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 368
    .local v0, "mergedComponent":Ljavassist/bytecode/analysis/Type;
    sget-object v7, Ljavassist/bytecode/analysis/Type;->BOGUS:Ljavassist/bytecode/analysis/Type;

    if-ne v0, v7, :cond_1d

    .line 369
    sget-object v7, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    .line 389
    .end local v0    # "mergedComponent":Ljavassist/bytecode/analysis/Type;
    :goto_1c
    return-object v7

    .line 371
    .restart local v0    # "mergedComponent":Ljavassist/bytecode/analysis/Type;
    :cond_1d
    invoke-direct {p0, v0, v3}, Ljavassist/bytecode/analysis/Type;->createArray(Ljavassist/bytecode/analysis/Type;I)Ljavassist/bytecode/analysis/Type;

    move-result-object v7

    goto :goto_1c

    .line 377
    .end local v0    # "mergedComponent":Ljavassist/bytecode/analysis/Type;
    :cond_22
    if-ge v5, v3, :cond_43

    .line 378
    move-object v2, v6

    .line 379
    .local v2, "targetRoot":Ljavassist/bytecode/analysis/Type;
    move v1, v5

    .line 386
    .local v1, "targetDims":I
    :goto_26
    sget-object v7, Ljavassist/bytecode/analysis/Type;->CLONEABLE:Ljavassist/bytecode/analysis/Type;

    iget-object v7, v7, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    iget-object v8, v2, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-static {v7, v8}, Ljavassist/bytecode/analysis/Type;->eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v7

    if-nez v7, :cond_3e

    sget-object v7, Ljavassist/bytecode/analysis/Type;->SERIALIZABLE:Ljavassist/bytecode/analysis/Type;

    iget-object v7, v7, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    iget-object v8, v2, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-static {v7, v8}, Ljavassist/bytecode/analysis/Type;->eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v7

    if-eqz v7, :cond_46

    .line 387
    :cond_3e
    invoke-direct {p0, v2, v1}, Ljavassist/bytecode/analysis/Type;->createArray(Ljavassist/bytecode/analysis/Type;I)Ljavassist/bytecode/analysis/Type;

    move-result-object v7

    goto :goto_1c

    .line 381
    .end local v1    # "targetDims":I
    .end local v2    # "targetRoot":Ljavassist/bytecode/analysis/Type;
    :cond_43
    move-object v2, v4

    .line 382
    .restart local v2    # "targetRoot":Ljavassist/bytecode/analysis/Type;
    move v1, v3

    .restart local v1    # "targetDims":I
    goto :goto_26

    .line 389
    :cond_46
    sget-object v7, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v7, v1}, Ljavassist/bytecode/analysis/Type;->createArray(Ljavassist/bytecode/analysis/Type;I)Ljavassist/bytecode/analysis/Type;

    move-result-object v7

    goto :goto_1c
.end method

.method private mergeClasses(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;
    .registers 8
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 450
    iget-object v3, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    iget-object v4, p1, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-static {v3, v4}, Ljavassist/bytecode/analysis/Type;->findCommonSuperClass(Ljavassist/CtClass;Ljavassist/CtClass;)Ljavassist/CtClass;

    move-result-object v2

    .line 453
    .local v2, "superClass":Ljavassist/CtClass;
    invoke-virtual {v2}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v3

    if-nez v3, :cond_40

    .line 454
    invoke-direct {p0, p1}, Ljavassist/bytecode/analysis/Type;->findCommonInterfaces(Ljavassist/bytecode/analysis/Type;)Ljava/util/Map;

    move-result-object v1

    .line 455
    .local v1, "interfaces":Ljava/util/Map;
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v3

    if-ne v3, v5, :cond_2e

    .line 456
    new-instance v4, Ljavassist/bytecode/analysis/Type;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavassist/CtClass;

    invoke-direct {v4, v3}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    move-object v3, v4

    .line 470
    .end local v1    # "interfaces":Ljava/util/Map;
    :goto_2d
    return-object v3

    .line 457
    .restart local v1    # "interfaces":Ljava/util/Map;
    :cond_2e
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v3

    if-le v3, v5, :cond_3a

    .line 458
    new-instance v3, Ljavassist/bytecode/analysis/MultiType;

    invoke-direct {v3, v1}, Ljavassist/bytecode/analysis/MultiType;-><init>(Ljava/util/Map;)V

    goto :goto_2d

    .line 461
    :cond_3a
    new-instance v3, Ljavassist/bytecode/analysis/Type;

    invoke-direct {v3, v2}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    goto :goto_2d

    .line 465
    .end local v1    # "interfaces":Ljava/util/Map;
    :cond_40
    invoke-direct {p0, p1, v2}, Ljavassist/bytecode/analysis/Type;->findExclusiveDeclaredInterfaces(Ljavassist/bytecode/analysis/Type;Ljavassist/CtClass;)Ljava/util/Map;

    move-result-object v0

    .line 466
    .local v0, "commonDeclared":Ljava/util/Map;
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v3

    if-lez v3, :cond_55

    .line 467
    new-instance v3, Ljavassist/bytecode/analysis/MultiType;

    new-instance v4, Ljavassist/bytecode/analysis/Type;

    invoke-direct {v4, v2}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    invoke-direct {v3, v0, v4}, Ljavassist/bytecode/analysis/MultiType;-><init>(Ljava/util/Map;Ljavassist/bytecode/analysis/Type;)V

    goto :goto_2d

    .line 470
    :cond_55
    new-instance v3, Ljavassist/bytecode/analysis/Type;

    invoke-direct {v3, v2}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    goto :goto_2d
.end method


# virtual methods
.method arrayName(Ljava/lang/String;I)Ljava/lang/String;
    .registers 9
    .param p1, "component"    # Ljava/lang/String;
    .param p2, "dims"    # I

    .prologue
    const/4 v5, 0x0

    .line 339
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 340
    .local v0, "i":I
    mul-int/lit8 v4, p2, 0x2

    add-int v2, v0, v4

    .line 341
    .local v2, "size":I
    new-array v3, v2, [C

    .line 342
    .local v3, "string":[C
    invoke-virtual {p1, v5, v0, v3, v5}, Ljava/lang/String;->getChars(II[CI)V

    move v1, v0

    .line 343
    .end local v0    # "i":I
    .local v1, "i":I
    :goto_f
    if-ge v1, v2, :cond_1e

    .line 344
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    const/16 v4, 0x5b

    aput-char v4, v3, v1

    .line 345
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .restart local v1    # "i":I
    const/16 v4, 0x5d

    aput-char v4, v3, v0

    goto :goto_f

    .line 347
    :cond_1e
    new-instance p1, Ljava/lang/String;

    .end local p1    # "component":Ljava/lang/String;
    invoke-direct {p1, v3}, Ljava/lang/String;-><init>([C)V

    .line 348
    .restart local p1    # "component":Ljava/lang/String;
    return-object p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 571
    instance-of v1, p1, Ljavassist/bytecode/analysis/Type;

    if-nez v1, :cond_6

    .line 574
    .end local p1    # "o":Ljava/lang/Object;
    :cond_5
    :goto_5
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_5

    iget-object v1, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    check-cast p1, Ljavassist/bytecode/analysis/Type;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v2, p1, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-static {v1, v2}, Ljavassist/bytecode/analysis/Type;->eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v0, 0x1

    goto :goto_5
.end method

.method findCommonInterfaces(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;
    .registers 10
    .param p1, "typeMap"    # Ljava/util/Map;
    .param p2, "alterMap"    # Ljava/util/Map;

    .prologue
    .line 497
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 498
    .local v2, "i":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 499
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_8

    .line 500
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_8

    .line 506
    :cond_1c
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 507
    :cond_29
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_50

    .line 508
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavassist/CtClass;

    .line 511
    .local v4, "intf":Ljavassist/CtClass;
    :try_start_35
    invoke-virtual {v4}, Ljavassist/CtClass;->getInterfaces()[Ljavassist/CtClass;
    :try_end_38
    .catch Ljavassist/NotFoundException; {:try_start_35 .. :try_end_38} :catch_49

    move-result-object v3

    .line 516
    .local v3, "interfaces":[Ljavassist/CtClass;
    const/4 v0, 0x0

    .local v0, "c":I
    :goto_3a
    array-length v5, v3

    if-ge v0, v5, :cond_29

    .line 517
    aget-object v5, v3, v0

    invoke-virtual {v5}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 516
    add-int/lit8 v0, v0, 0x1

    goto :goto_3a

    .line 512
    .end local v0    # "c":I
    .end local v3    # "interfaces":[Ljavassist/CtClass;
    :catch_49
    move-exception v1

    .line 513
    .local v1, "e":Ljavassist/NotFoundException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 520
    .end local v1    # "e":Ljavassist/NotFoundException;
    .end local v4    # "intf":Ljavassist/CtClass;
    :cond_50
    return-object p2
.end method

.method getAllInterfaces(Ljavassist/CtClass;Ljava/util/Map;)Ljava/util/Map;
    .registers 8
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "map"    # Ljava/util/Map;

    .prologue
    .line 524
    if-nez p2, :cond_7

    .line 525
    new-instance p2, Ljava/util/HashMap;

    .end local p2    # "map":Ljava/util/Map;
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 527
    .restart local p2    # "map":Ljava/util/Map;
    :cond_7
    invoke-virtual {p1}, Ljavassist/CtClass;->isInterface()Z

    move-result v4

    if-eqz v4, :cond_14

    .line 528
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    :cond_14
    :try_start_14
    invoke-virtual {p1}, Ljavassist/CtClass;->getInterfaces()[Ljavassist/CtClass;

    move-result-object v2

    .line 532
    .local v2, "interfaces":[Ljavassist/CtClass;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    array-length v4, v2

    if-ge v1, v4, :cond_2b

    .line 533
    aget-object v3, v2, v1

    .line 534
    .local v3, "intf":Ljavassist/CtClass;
    invoke-virtual {v3}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    invoke-virtual {p0, v3, p2}, Ljavassist/bytecode/analysis/Type;->getAllInterfaces(Ljavassist/CtClass;Ljava/util/Map;)Ljava/util/Map;

    .line 532
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 538
    .end local v3    # "intf":Ljavassist/CtClass;
    :cond_2b
    invoke-virtual {p1}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;
    :try_end_2e
    .catch Ljavassist/NotFoundException; {:try_start_14 .. :try_end_2e} :catch_32

    move-result-object p1

    .line 542
    if-nez p1, :cond_14

    .line 544
    return-object p2

    .line 539
    .end local v1    # "i":I
    .end local v2    # "interfaces":[Ljavassist/CtClass;
    :catch_32
    move-exception v0

    .line 540
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public getComponent()Ljavassist/bytecode/analysis/Type;
    .registers 5

    .prologue
    .line 227
    iget-object v3, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    if-eqz v3, :cond_c

    iget-object v3, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {v3}, Ljavassist/CtClass;->isArray()Z

    move-result v3

    if-nez v3, :cond_e

    .line 228
    :cond_c
    const/4 v2, 0x0

    .line 238
    :cond_d
    :goto_d
    return-object v2

    .line 232
    :cond_e
    :try_start_e
    iget-object v3, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {v3}, Ljavassist/CtClass;->getComponentType()Ljavassist/CtClass;
    :try_end_13
    .catch Ljavassist/NotFoundException; {:try_start_e .. :try_end_13} :catch_24

    move-result-object v0

    .line 237
    .local v0, "component":Ljavassist/CtClass;
    sget-object v3, Ljavassist/bytecode/analysis/Type;->prims:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavassist/bytecode/analysis/Type;

    .line 238
    .local v2, "type":Ljavassist/bytecode/analysis/Type;
    if-nez v2, :cond_d

    new-instance v2, Ljavassist/bytecode/analysis/Type;

    .end local v2    # "type":Ljavassist/bytecode/analysis/Type;
    invoke-direct {v2, v0}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    goto :goto_d

    .line 233
    .end local v0    # "component":Ljavassist/CtClass;
    :catch_24
    move-exception v1

    .line 234
    .local v1, "e":Ljavassist/NotFoundException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public getCtClass()Ljavassist/CtClass;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    return-object v0
.end method

.method getDeclaredInterfaces(Ljavassist/CtClass;Ljava/util/Map;)Ljava/util/Map;
    .registers 8
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "map"    # Ljava/util/Map;

    .prologue
    .line 548
    if-nez p2, :cond_7

    .line 549
    new-instance p2, Ljava/util/HashMap;

    .end local p2    # "map":Ljava/util/Map;
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 551
    .restart local p2    # "map":Ljava/util/Map;
    :cond_7
    invoke-virtual {p1}, Ljavassist/CtClass;->isInterface()Z

    move-result v4

    if-eqz v4, :cond_14

    .line 552
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 556
    :cond_14
    :try_start_14
    invoke-virtual {p1}, Ljavassist/CtClass;->getInterfaces()[Ljavassist/CtClass;
    :try_end_17
    .catch Ljavassist/NotFoundException; {:try_start_14 .. :try_end_17} :catch_2b

    move-result-object v2

    .line 561
    .local v2, "interfaces":[Ljavassist/CtClass;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    array-length v4, v2

    if-ge v1, v4, :cond_32

    .line 562
    aget-object v3, v2, v1

    .line 563
    .local v3, "intf":Ljavassist/CtClass;
    invoke-virtual {v3}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 564
    invoke-virtual {p0, v3, p2}, Ljavassist/bytecode/analysis/Type;->getDeclaredInterfaces(Ljavassist/CtClass;Ljava/util/Map;)Ljava/util/Map;

    .line 561
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 557
    .end local v1    # "i":I
    .end local v2    # "interfaces":[Ljavassist/CtClass;
    .end local v3    # "intf":Ljavassist/CtClass;
    :catch_2b
    move-exception v0

    .line 558
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 567
    .end local v0    # "e":Ljavassist/NotFoundException;
    .restart local v1    # "i":I
    .restart local v2    # "interfaces":[Ljavassist/CtClass;
    :cond_32
    return-object p2
.end method

.method public getDimensions()I
    .registers 6

    .prologue
    .line 207
    invoke-virtual {p0}, Ljavassist/bytecode/analysis/Type;->isArray()Z

    move-result v3

    if-nez v3, :cond_8

    const/4 v0, 0x0

    .line 217
    :cond_7
    return v0

    .line 209
    :cond_8
    iget-object v3, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {v3}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    .line 210
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .line 211
    .local v2, "pos":I
    const/4 v0, 0x0

    .line 212
    .local v0, "count":I
    :goto_15
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5d

    if-ne v3, v4, :cond_7

    .line 213
    add-int/lit8 v2, v2, -0x2

    .line 214
    add-int/lit8 v0, v0, 0x1

    goto :goto_15
.end method

.method getRootComponent(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;
    .registers 3
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;

    .prologue
    .line 314
    :goto_0
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->isArray()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 315
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->getComponent()Ljavassist/bytecode/analysis/Type;

    move-result-object p1

    goto :goto_0

    .line 317
    :cond_b
    return-object p1
.end method

.method public getSize()I
    .registers 3

    .prologue
    .line 160
    iget-object v0, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    sget-object v1, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    if-eq v0, v1, :cond_10

    iget-object v0, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    sget-object v1, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    if-eq v0, v1, :cond_10

    sget-object v0, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    if-ne p0, v0, :cond_12

    :cond_10
    const/4 v0, 0x2

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x1

    goto :goto_11
.end method

.method public isArray()Z
    .registers 2

    .prologue
    .line 197
    iget-object v0, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    if-eqz v0, :cond_e

    iget-object v0, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->isArray()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isAssignableFrom(Ljavassist/bytecode/analysis/Type;)Z
    .registers 5
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;

    .prologue
    const/4 v1, 0x1

    .line 250
    if-ne p0, p1, :cond_4

    .line 268
    .end local p1    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_3
    :goto_3
    return v1

    .line 253
    .restart local p1    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_4
    sget-object v2, Ljavassist/bytecode/analysis/Type;->UNINIT:Ljavassist/bytecode/analysis/Type;

    if-ne p1, v2, :cond_e

    invoke-virtual {p0}, Ljavassist/bytecode/analysis/Type;->isReference()Z

    move-result v2

    if-nez v2, :cond_3

    :cond_e
    sget-object v2, Ljavassist/bytecode/analysis/Type;->UNINIT:Ljavassist/bytecode/analysis/Type;

    if-ne p0, v2, :cond_18

    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->isReference()Z

    move-result v2

    if-nez v2, :cond_3

    .line 256
    :cond_18
    instance-of v1, p1, Ljavassist/bytecode/analysis/MultiType;

    if-eqz v1, :cond_23

    .line 257
    check-cast p1, Ljavassist/bytecode/analysis/MultiType;

    .end local p1    # "type":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {p1, p0}, Ljavassist/bytecode/analysis/MultiType;->isAssignableTo(Ljavassist/bytecode/analysis/Type;)Z

    move-result v1

    goto :goto_3

    .line 259
    .restart local p1    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_23
    instance-of v1, p1, Ljavassist/bytecode/analysis/MultiArrayType;

    if-eqz v1, :cond_2e

    .line 260
    check-cast p1, Ljavassist/bytecode/analysis/MultiArrayType;

    .end local p1    # "type":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {p1, p0}, Ljavassist/bytecode/analysis/MultiArrayType;->isAssignableTo(Ljavassist/bytecode/analysis/Type;)Z

    move-result v1

    goto :goto_3

    .line 264
    .restart local p1    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_2e
    iget-object v1, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    if-eqz v1, :cond_3a

    iget-object v1, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {v1}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 265
    :cond_3a
    const/4 v1, 0x0

    goto :goto_3

    .line 268
    :cond_3c
    :try_start_3c
    iget-object v1, p1, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    iget-object v2, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {v1, v2}, Ljavassist/CtClass;->subtypeOf(Ljavassist/CtClass;)Z
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_43} :catch_45

    move-result v1

    goto :goto_3

    .line 269
    :catch_45
    move-exception v0

    .line 270
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public isReference()Z
    .registers 2

    .prologue
    .line 178
    iget-boolean v0, p0, Ljavassist/bytecode/analysis/Type;->special:Z

    if-nez v0, :cond_12

    iget-object v0, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    if-eqz v0, :cond_10

    iget-object v0, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public isSpecial()Z
    .registers 2

    .prologue
    .line 188
    iget-boolean v0, p0, Ljavassist/bytecode/analysis/Type;->special:Z

    return v0
.end method

.method public merge(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;
    .registers 4
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;

    .prologue
    .line 286
    if-ne p1, p0, :cond_3

    .line 307
    .end local p0    # "this":Ljavassist/bytecode/analysis/Type;
    :cond_2
    :goto_2
    return-object p0

    .line 288
    .restart local p0    # "this":Ljavassist/bytecode/analysis/Type;
    :cond_3
    if-eqz p1, :cond_2

    .line 290
    sget-object v1, Ljavassist/bytecode/analysis/Type;->UNINIT:Ljavassist/bytecode/analysis/Type;

    if-eq p1, v1, :cond_2

    .line 292
    sget-object v1, Ljavassist/bytecode/analysis/Type;->UNINIT:Ljavassist/bytecode/analysis/Type;

    if-ne p0, v1, :cond_f

    move-object p0, p1

    .line 293
    goto :goto_2

    .line 296
    :cond_f
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->isReference()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-virtual {p0}, Ljavassist/bytecode/analysis/Type;->isReference()Z

    move-result v1

    if-nez v1, :cond_1e

    .line 297
    :cond_1b
    sget-object p0, Ljavassist/bytecode/analysis/Type;->BOGUS:Ljavassist/bytecode/analysis/Type;

    goto :goto_2

    .line 300
    :cond_1e
    instance-of v1, p1, Ljavassist/bytecode/analysis/MultiType;

    if-eqz v1, :cond_27

    .line 301
    invoke-virtual {p1, p0}, Ljavassist/bytecode/analysis/Type;->merge(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object p0

    goto :goto_2

    .line 303
    :cond_27
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->isArray()Z

    move-result v1

    if-eqz v1, :cond_38

    invoke-virtual {p0}, Ljavassist/bytecode/analysis/Type;->isArray()Z

    move-result v1

    if-eqz v1, :cond_38

    .line 304
    invoke-direct {p0, p1}, Ljavassist/bytecode/analysis/Type;->mergeArray(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object p0

    goto :goto_2

    .line 307
    :cond_38
    :try_start_38
    invoke-direct {p0, p1}, Ljavassist/bytecode/analysis/Type;->mergeClasses(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;
    :try_end_3b
    .catch Ljavassist/NotFoundException; {:try_start_38 .. :try_end_3b} :catch_3d

    move-result-object p0

    goto :goto_2

    .line 308
    :catch_3d
    move-exception v0

    .line 309
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method popChanged()Z
    .registers 2

    .prologue
    .line 150
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 582
    sget-object v0, Ljavassist/bytecode/analysis/Type;->BOGUS:Ljavassist/bytecode/analysis/Type;

    if-ne p0, v0, :cond_7

    .line 583
    const-string v0, "BOGUS"

    .line 591
    :goto_6
    return-object v0

    .line 584
    :cond_7
    sget-object v0, Ljavassist/bytecode/analysis/Type;->UNINIT:Ljavassist/bytecode/analysis/Type;

    if-ne p0, v0, :cond_e

    .line 585
    const-string v0, "UNINIT"

    goto :goto_6

    .line 586
    :cond_e
    sget-object v0, Ljavassist/bytecode/analysis/Type;->RETURN_ADDRESS:Ljavassist/bytecode/analysis/Type;

    if-ne p0, v0, :cond_15

    .line 587
    const-string v0, "RETURN ADDRESS"

    goto :goto_6

    .line 588
    :cond_15
    sget-object v0, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    if-ne p0, v0, :cond_1c

    .line 589
    const-string v0, "TOP"

    goto :goto_6

    .line 591
    :cond_1c
    iget-object v0, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    if-nez v0, :cond_23

    const-string v0, "null"

    goto :goto_6

    :cond_23
    iget-object v0, p0, Ljavassist/bytecode/analysis/Type;->clazz:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
