.class Lcom/google/common/eventbus/AnnotatedHandlerFinder;
.super Ljava/lang/Object;
.source "AnnotatedHandlerFinder.java"

# interfaces
.implements Lcom/google/common/eventbus/HandlerFindingStrategy;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/eventbus/AnnotatedHandlerFinder$MethodIdentifier;
    }
.end annotation


# static fields
.field private static final handlerMethodsCache:Lcom/google/common/cache/LoadingCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/cache/LoadingCache",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 53
    invoke-static {}, Lcom/google/common/cache/CacheBuilder;->newBuilder()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/cache/CacheBuilder;->weakKeys()Lcom/google/common/cache/CacheBuilder;

    move-result-object v0

    new-instance v1, Lcom/google/common/eventbus/AnnotatedHandlerFinder$1;

    invoke-direct {v1}, Lcom/google/common/eventbus/AnnotatedHandlerFinder$1;-><init>()V

    invoke-virtual {v0, v1}, Lcom/google/common/cache/CacheBuilder;->build(Lcom/google/common/cache/CacheLoader;)Lcom/google/common/cache/LoadingCache;

    move-result-object v0

    sput-object v0, Lcom/google/common/eventbus/AnnotatedHandlerFinder;->handlerMethodsCache:Lcom/google/common/cache/LoadingCache;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    return-void
.end method

.method static synthetic access$000(Ljava/lang/Class;)Lcom/google/common/collect/ImmutableList;
    .registers 2
    .param p0, "x0"    # Ljava/lang/Class;

    .prologue
    .line 46
    invoke-static {p0}, Lcom/google/common/eventbus/AnnotatedHandlerFinder;->getAnnotatedMethodsInternal(Ljava/lang/Class;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    return-object v0
.end method

.method private static getAnnotatedMethods(Ljava/lang/Class;)Lcom/google/common/collect/ImmutableList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    sget-object v1, Lcom/google/common/eventbus/AnnotatedHandlerFinder;->handlerMethodsCache:Lcom/google/common/cache/LoadingCache;

    invoke-interface {v1, p0}, Lcom/google/common/cache/LoadingCache;->getUnchecked(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/collect/ImmutableList;
    :try_end_8
    .catch Lcom/google/common/util/concurrent/UncheckedExecutionException; {:try_start_0 .. :try_end_8} :catch_9

    return-object v1

    .line 84
    :catch_9
    move-exception v0

    .line 85
    .local v0, "e":Lcom/google/common/util/concurrent/UncheckedExecutionException;
    invoke-virtual {v0}, Lcom/google/common/util/concurrent/UncheckedExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Throwables;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method private static getAnnotatedMethodsInternal(Ljava/lang/Class;)Lcom/google/common/collect/ImmutableList;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .prologue
    .line 114
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/google/common/reflect/TypeToken;->of(Ljava/lang/Class;)Lcom/google/common/reflect/TypeToken;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/common/reflect/TypeToken;->getTypes()Lcom/google/common/reflect/TypeToken$TypeSet;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/common/reflect/TypeToken$TypeSet;->rawTypes()Ljava/util/Set;

    move-result-object v9

    .line 115
    .local v9, "supers":Ljava/util/Set;, "Ljava/util/Set<+Ljava/lang/Class<*>;>;"
    invoke-static {}, Lcom/google/common/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v4

    .line 116
    .local v4, "identifiers":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/common/eventbus/AnnotatedHandlerFinder$MethodIdentifier;Ljava/lang/reflect/Method;>;"
    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_75

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Class;

    .line 117
    .local v7, "superClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v7}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_26
    if-ge v2, v5, :cond_14

    aget-object v8, v0, v2

    .line 118
    .local v8, "superClazzMethod":Ljava/lang/reflect/Method;
    const-class v10, Lcom/google/common/eventbus/Subscribe;

    invoke-virtual {v8, v10}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_72

    .line 119
    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    .line 120
    .local v6, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v10, v6

    const/4 v11, 0x1

    if-eq v10, v11, :cond_64

    .line 121
    new-instance v10, Ljava/lang/IllegalArgumentException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Method "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " has @Subscribe annotation, but requires "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    array-length v12, v6

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " arguments.  Event handler methods must require a single argument."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 126
    :cond_64
    new-instance v3, Lcom/google/common/eventbus/AnnotatedHandlerFinder$MethodIdentifier;

    invoke-direct {v3, v8}, Lcom/google/common/eventbus/AnnotatedHandlerFinder$MethodIdentifier;-><init>(Ljava/lang/reflect/Method;)V

    .line 127
    .local v3, "ident":Lcom/google/common/eventbus/AnnotatedHandlerFinder$MethodIdentifier;
    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_72

    .line 128
    invoke-interface {v4, v3, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .end local v3    # "ident":Lcom/google/common/eventbus/AnnotatedHandlerFinder$MethodIdentifier;
    .end local v6    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_72
    add-int/lit8 v2, v2, 0x1

    goto :goto_26

    .line 133
    .end local v0    # "arr$":[Ljava/lang/reflect/Method;
    .end local v2    # "i$":I
    .end local v5    # "len$":I
    .end local v7    # "superClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "superClazzMethod":Ljava/lang/reflect/Method;
    :cond_75
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v10

    invoke-static {v10}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v10

    return-object v10
.end method

.method private static makeHandler(Ljava/lang/Object;Ljava/lang/reflect/Method;)Lcom/google/common/eventbus/EventHandler;
    .registers 4
    .param p0, "listener"    # Ljava/lang/Object;
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 149
    invoke-static {p1}, Lcom/google/common/eventbus/AnnotatedHandlerFinder;->methodIsDeclaredThreadSafe(Ljava/lang/reflect/Method;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 150
    new-instance v0, Lcom/google/common/eventbus/EventHandler;

    invoke-direct {v0, p0, p1}, Lcom/google/common/eventbus/EventHandler;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Method;)V

    .line 154
    .local v0, "wrapper":Lcom/google/common/eventbus/EventHandler;
    :goto_b
    return-object v0

    .line 152
    .end local v0    # "wrapper":Lcom/google/common/eventbus/EventHandler;
    :cond_c
    new-instance v0, Lcom/google/common/eventbus/SynchronizedEventHandler;

    invoke-direct {v0, p0, p1}, Lcom/google/common/eventbus/SynchronizedEventHandler;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Method;)V

    .restart local v0    # "wrapper":Lcom/google/common/eventbus/EventHandler;
    goto :goto_b
.end method

.method private static methodIsDeclaredThreadSafe(Ljava/lang/reflect/Method;)Z
    .registers 2
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 166
    const-class v0, Lcom/google/common/eventbus/AllowConcurrentEvents;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method


# virtual methods
.method public findAllHandlers(Ljava/lang/Object;)Lcom/google/common/collect/Multimap;
    .registers 10
    .param p1, "listener"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/common/collect/Multimap",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/google/common/eventbus/EventHandler;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    invoke-static {}, Lcom/google/common/collect/HashMultimap;->create()Lcom/google/common/collect/HashMultimap;

    move-result-object v5

    .line 71
    .local v5, "methodsInListener":Lcom/google/common/collect/Multimap;, "Lcom/google/common/collect/Multimap<Ljava/lang/Class<*>;Lcom/google/common/eventbus/EventHandler;>;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 72
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v0}, Lcom/google/common/eventbus/AnnotatedHandlerFinder;->getAnnotatedMethods(Ljava/lang/Class;)Lcom/google/common/collect/ImmutableList;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/common/collect/ImmutableList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Method;

    .line 73
    .local v4, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    .line 74
    .local v6, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v7, 0x0

    aget-object v1, v6, v7

    .line 75
    .local v1, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1, v4}, Lcom/google/common/eventbus/AnnotatedHandlerFinder;->makeHandler(Ljava/lang/Object;Ljava/lang/reflect/Method;)Lcom/google/common/eventbus/EventHandler;

    move-result-object v2

    .line 76
    .local v2, "handler":Lcom/google/common/eventbus/EventHandler;
    invoke-interface {v5, v1, v2}, Lcom/google/common/collect/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_10

    .line 78
    .end local v1    # "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "handler":Lcom/google/common/eventbus/EventHandler;
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v6    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_2b
    return-object v5
.end method
