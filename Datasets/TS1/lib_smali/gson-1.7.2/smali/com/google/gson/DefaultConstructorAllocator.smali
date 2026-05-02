.class final Lcom/google/gson/DefaultConstructorAllocator;
.super Ljava/lang/Object;
.source "DefaultConstructorAllocator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/gson/DefaultConstructorAllocator$Null;
    }
.end annotation


# static fields
.field private static final NULL_CONSTRUCTOR:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<",
            "Lcom/google/gson/DefaultConstructorAllocator$Null;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final constructorCache:Lcom/google/gson/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/gson/Cache",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Constructor",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    invoke-static {}, Lcom/google/gson/DefaultConstructorAllocator;->createNullConstructor()Ljava/lang/reflect/Constructor;

    move-result-object v0

    sput-object v0, Lcom/google/gson/DefaultConstructorAllocator;->NULL_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 33
    const/16 v0, 0xc8

    invoke-direct {p0, v0}, Lcom/google/gson/DefaultConstructorAllocator;-><init>(I)V

    .line 34
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "cacheSize"    # I

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lcom/google/gson/LruCache;

    invoke-direct {v0, p1}, Lcom/google/gson/LruCache;-><init>(I)V

    iput-object v0, p0, Lcom/google/gson/DefaultConstructorAllocator;->constructorCache:Lcom/google/gson/Cache;

    .line 38
    return-void
.end method

.method private static final createNullConstructor()Ljava/lang/reflect/Constructor;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/reflect/Constructor",
            "<",
            "Lcom/google/gson/DefaultConstructorAllocator$Null;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    :try_start_0
    const-class v1, Lcom/google/gson/DefaultConstructorAllocator$Null;

    invoke-static {v1}, Lcom/google/gson/DefaultConstructorAllocator;->getNoArgsConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 49
    .local v0, "e":Ljava/lang/Exception;
    :goto_6
    return-object v1

    .line 48
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_7
    move-exception v0

    .line 49
    .restart local v0    # "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_6
.end method

.method private findConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/lang/reflect/Constructor",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 60
    .local p1, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v2, p0, Lcom/google/gson/DefaultConstructorAllocator;->constructorCache:Lcom/google/gson/Cache;

    invoke-interface {v2, p1}, Lcom/google/gson/Cache;->getElement(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Constructor;

    .line 61
    .local v0, "cachedElement":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    if-eqz v0, :cond_10

    .line 62
    sget-object v2, Lcom/google/gson/DefaultConstructorAllocator;->NULL_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    if-ne v0, v2, :cond_f

    .line 63
    const/4 v0, 0x0

    .line 75
    .end local v0    # "cachedElement":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    :cond_f
    :goto_f
    return-object v0

    .line 69
    .restart local v0    # "cachedElement":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    :cond_10
    invoke-static {p1}, Lcom/google/gson/DefaultConstructorAllocator;->getNoArgsConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 70
    .local v1, "noArgsConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    if-eqz v1, :cond_1d

    .line 71
    iget-object v2, p0, Lcom/google/gson/DefaultConstructorAllocator;->constructorCache:Lcom/google/gson/Cache;

    invoke-interface {v2, p1, v1}, Lcom/google/gson/Cache;->addElement(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_1b
    move-object v0, v1

    .line 75
    goto :goto_f

    .line 73
    :cond_1d
    iget-object v2, p0, Lcom/google/gson/DefaultConstructorAllocator;->constructorCache:Lcom/google/gson/Cache;

    sget-object v3, Lcom/google/gson/DefaultConstructorAllocator;->NULL_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    invoke-interface {v2, p1, v3}, Lcom/google/gson/Cache;->addElement(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1b
.end method

.method private static getNoArgsConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/lang/reflect/Constructor",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v2, 0x0

    :try_start_1
    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {p0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 81
    .local v0, "declaredConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_b} :catch_c

    .line 84
    .end local v0    # "declaredConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    :goto_b
    return-object v0

    .line 83
    :catch_c
    move-exception v1

    .line 84
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    goto :goto_b
.end method


# virtual methods
.method final isInCache(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "cacheKey":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/google/gson/DefaultConstructorAllocator;->constructorCache:Lcom/google/gson/Cache;

    invoke-interface {v0, p1}, Lcom/google/gson/Cache;->getElement(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public newInstance(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
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
    .line 54
    .local p1, "c":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1}, Lcom/google/gson/DefaultConstructorAllocator;->findConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 55
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    if-eqz v0, :cond_e

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :goto_d
    return-object v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method
