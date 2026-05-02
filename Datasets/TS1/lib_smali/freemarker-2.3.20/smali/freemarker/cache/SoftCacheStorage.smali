.class public Lfreemarker/cache/SoftCacheStorage;
.super Ljava/lang/Object;
.source "SoftCacheStorage.java"

# interfaces
.implements Lfreemarker/cache/ConcurrentCacheStorage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/cache/SoftCacheStorage$SoftValueReference;
    }
.end annotation


# static fields
.field private static final atomicRemove:Ljava/lang/reflect/Method;

.field static class$java$lang$Object:Ljava/lang/Class;


# instance fields
.field private final concurrent:Z

.field private final map:Ljava/util/Map;

.field private final queue:Ljava/lang/ref/ReferenceQueue;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 80
    invoke-static {}, Lfreemarker/cache/SoftCacheStorage;->getAtomicRemoveMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/cache/SoftCacheStorage;->atomicRemove:Ljava/lang/reflect/Method;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 87
    invoke-static {}, Lfreemarker/core/_ConcurrentMapFactory;->newMaybeConcurrentHashMap()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v0}, Lfreemarker/cache/SoftCacheStorage;-><init>(Ljava/util/Map;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .registers 3
    .param p1, "backingMap"    # Ljava/util/Map;

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lfreemarker/cache/SoftCacheStorage;->queue:Ljava/lang/ref/ReferenceQueue;

    .line 95
    iput-object p1, p0, Lfreemarker/cache/SoftCacheStorage;->map:Ljava/util/Map;

    .line 96
    iget-object v0, p0, Lfreemarker/cache/SoftCacheStorage;->map:Ljava/util/Map;

    invoke-static {v0}, Lfreemarker/core/_ConcurrentMapFactory;->isConcurrent(Ljava/util/Map;)Z

    move-result v0

    iput-boolean v0, p0, Lfreemarker/cache/SoftCacheStorage;->concurrent:Z

    .line 97
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 159
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static getAtomicRemoveMethod()Ljava/lang/reflect/Method;
    .registers 6

    .prologue
    .line 159
    :try_start_0
    const-string v1, "java.util.concurrent.ConcurrentMap"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "remove"

    const/4 v1, 0x2

    new-array v4, v1, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v1, Lfreemarker/cache/SoftCacheStorage;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v1, :cond_2e

    const-string v1, "java.lang.Object"

    invoke-static {v1}, Lfreemarker/cache/SoftCacheStorage;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/cache/SoftCacheStorage;->class$java$lang$Object:Ljava/lang/Class;

    :goto_18
    aput-object v1, v4, v5

    const/4 v5, 0x1

    sget-object v1, Lfreemarker/cache/SoftCacheStorage;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v1, :cond_31

    const-string v1, "java.lang.Object"

    invoke-static {v1}, Lfreemarker/cache/SoftCacheStorage;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/cache/SoftCacheStorage;->class$java$lang$Object:Ljava/lang/Class;

    :goto_27
    aput-object v1, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 162
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    :goto_2d
    return-object v1

    .line 159
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :cond_2e
    sget-object v1, Lfreemarker/cache/SoftCacheStorage;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_18

    :cond_31
    sget-object v1, Lfreemarker/cache/SoftCacheStorage;->class$java$lang$Object:Ljava/lang/Class;
    :try_end_33
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_33} :catch_34
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_33} :catch_37

    goto :goto_27

    .line 161
    :catch_34
    move-exception v0

    .line 162
    .restart local v0    # "e":Ljava/lang/ClassNotFoundException;
    const/4 v1, 0x0

    goto :goto_2d

    .line 164
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catch_37
    move-exception v0

    .line 165
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private processQueue()V
    .registers 8

    .prologue
    .line 122
    :cond_0
    :goto_0
    iget-object v3, p0, Lfreemarker/cache/SoftCacheStorage;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v3}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v2

    check-cast v2, Lfreemarker/cache/SoftCacheStorage$SoftValueReference;

    .line 123
    .local v2, "ref":Lfreemarker/cache/SoftCacheStorage$SoftValueReference;
    if-nez v2, :cond_b

    .line 124
    return-void

    .line 126
    :cond_b
    invoke-virtual {v2}, Lfreemarker/cache/SoftCacheStorage$SoftValueReference;->getKey()Ljava/lang/Object;

    move-result-object v1

    .line 127
    .local v1, "key":Ljava/lang/Object;
    iget-boolean v3, p0, Lfreemarker/cache/SoftCacheStorage;->concurrent:Z

    if-eqz v3, :cond_32

    .line 129
    :try_start_13
    sget-object v3, Lfreemarker/cache/SoftCacheStorage;->atomicRemove:Ljava/lang/reflect/Method;

    iget-object v4, p0, Lfreemarker/cache/SoftCacheStorage;->map:Ljava/util/Map;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    const/4 v6, 0x1

    aput-object v2, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/IllegalAccessException; {:try_start_13 .. :try_end_23} :catch_24
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_13 .. :try_end_23} :catch_2b

    goto :goto_0

    .line 131
    :catch_24
    move-exception v0

    .line 132
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v3, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 134
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_2b
    move-exception v0

    .line 135
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v3, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v3, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 138
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :cond_32
    iget-object v3, p0, Lfreemarker/cache/SoftCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v2, :cond_0

    .line 139
    iget-object v3, p0, Lfreemarker/cache/SoftCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lfreemarker/cache/SoftCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 117
    invoke-direct {p0}, Lfreemarker/cache/SoftCacheStorage;->processQueue()V

    .line 118
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 100
    invoke-direct {p0}, Lfreemarker/cache/SoftCacheStorage;->processQueue()V

    .line 101
    iget-object v1, p0, Lfreemarker/cache/SoftCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;

    .line 102
    .local v0, "ref":Ljava/lang/ref/Reference;
    if-nez v0, :cond_f

    const/4 v1, 0x0

    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    goto :goto_e
.end method

.method public isConcurrent()Z
    .registers 2

    .prologue
    .line 91
    iget-boolean v0, p0, Lfreemarker/cache/SoftCacheStorage;->concurrent:Z

    return v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 106
    invoke-direct {p0}, Lfreemarker/cache/SoftCacheStorage;->processQueue()V

    .line 107
    iget-object v0, p0, Lfreemarker/cache/SoftCacheStorage;->map:Ljava/util/Map;

    new-instance v1, Lfreemarker/cache/SoftCacheStorage$SoftValueReference;

    iget-object v2, p0, Lfreemarker/cache/SoftCacheStorage;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v1, p1, p2, v2}, Lfreemarker/cache/SoftCacheStorage$SoftValueReference;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    return-void
.end method

.method public remove(Ljava/lang/Object;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 111
    invoke-direct {p0}, Lfreemarker/cache/SoftCacheStorage;->processQueue()V

    .line 112
    iget-object v0, p0, Lfreemarker/cache/SoftCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    return-void
.end method
