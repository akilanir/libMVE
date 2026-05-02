.class public Lfreemarker/core/_ConcurrentMapFactory;
.super Ljava/lang/Object;
.source "_ConcurrentMapFactory.java"


# static fields
.field private static final bestHashMapClass:Ljava/lang/Class;

.field static class$java$util$HashMap:Ljava/lang/Class;

.field private static final concurrentMapClass:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 21
    invoke-static {}, Lfreemarker/core/_ConcurrentMapFactory;->getConcurrentMapClass()Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/core/_ConcurrentMapFactory;->concurrentMapClass:Ljava/lang/Class;

    .line 22
    invoke-static {}, Lfreemarker/core/_ConcurrentMapFactory;->getBestHashMapClass()Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/core/_ConcurrentMapFactory;->bestHashMapClass:Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 64
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

.method public static concurrentMapsAvailable()Z
    .registers 1

    .prologue
    .line 42
    sget-object v0, Lfreemarker/core/_ConcurrentMapFactory;->concurrentMapClass:Ljava/lang/Class;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private static getBestHashMapClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 62
    :try_start_0
    const-string v1, "java.util.concurrent.ConcurrentHashMap"

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 64
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    :goto_6
    return-object v1

    .line 63
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catch_7
    move-exception v0

    .line 64
    .restart local v0    # "e":Ljava/lang/ClassNotFoundException;
    sget-object v1, Lfreemarker/core/_ConcurrentMapFactory;->class$java$util$HashMap:Ljava/lang/Class;

    if-nez v1, :cond_15

    const-string v1, "java.util.HashMap"

    invoke-static {v1}, Lfreemarker/core/_ConcurrentMapFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/core/_ConcurrentMapFactory;->class$java$util$HashMap:Ljava/lang/Class;

    goto :goto_6

    :cond_15
    sget-object v1, Lfreemarker/core/_ConcurrentMapFactory;->class$java$util$HashMap:Ljava/lang/Class;

    goto :goto_6
.end method

.method private static getConcurrentMapClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 54
    :try_start_0
    const-string v1, "java.util.concurrent.ConcurrentMap"

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 56
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    :goto_6
    return-object v1

    .line 55
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catch_7
    move-exception v0

    .line 56
    .restart local v0    # "e":Ljava/lang/ClassNotFoundException;
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public static isConcurrent(Ljava/util/Map;)Z
    .registers 2
    .param p0, "map"    # Ljava/util/Map;

    .prologue
    .line 49
    sget-object v0, Lfreemarker/core/_ConcurrentMapFactory;->concurrentMapClass:Ljava/lang/Class;

    if-eqz v0, :cond_e

    sget-object v0, Lfreemarker/core/_ConcurrentMapFactory;->concurrentMapClass:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public static newMaybeConcurrentHashMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 26
    :try_start_0
    sget-object v1, Lfreemarker/core/_ConcurrentMapFactory;->bestHashMapClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_9

    return-object v1

    .line 27
    :catch_9
    move-exception v0

    .line 28
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static newThreadSafeMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 37
    invoke-static {}, Lfreemarker/core/_ConcurrentMapFactory;->newMaybeConcurrentHashMap()Ljava/util/Map;

    move-result-object v0

    .line 38
    .local v0, "map":Ljava/util/Map;
    invoke-static {v0}, Lfreemarker/core/_ConcurrentMapFactory;->isConcurrent(Ljava/util/Map;)Z

    move-result v1

    if-eqz v1, :cond_b

    .end local v0    # "map":Ljava/util/Map;
    :goto_a
    return-object v0

    .restart local v0    # "map":Ljava/util/Map;
    :cond_b
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_a
.end method
