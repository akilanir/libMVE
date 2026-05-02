.class public Lorg/apache/commons/lang3/concurrent/ConcurrentUtils;
.super Ljava/lang/Object;
.source "ConcurrentUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/concurrent/ConcurrentUtils$ConstantFuture;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method static checkedException(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .registers 4
    .param p0, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 144
    if-eqz p0, :cond_b

    instance-of v0, p0, Ljava/lang/RuntimeException;

    if-nez v0, :cond_b

    instance-of v0, p0, Ljava/lang/Error;

    if-nez v0, :cond_b

    .line 146
    return-object p0

    .line 148
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not a checked exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static constantFuture(Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ljava/util/concurrent/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 326
    .local p0, "value":Ljava/lang/Object;, "TT;"
    new-instance v0, Lorg/apache/commons/lang3/concurrent/ConcurrentUtils$ConstantFuture;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/concurrent/ConcurrentUtils$ConstantFuture;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static createIfAbsent(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/ConcurrentMap",
            "<TK;TV;>;TK;",
            "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer",
            "<TV;>;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/lang3/concurrent/ConcurrentException;
        }
    .end annotation

    .prologue
    .line 274
    .local p0, "map":Ljava/util/concurrent/ConcurrentMap;, "Ljava/util/concurrent/ConcurrentMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "init":Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;, "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer<TV;>;"
    if-eqz p0, :cond_4

    if-nez p2, :cond_6

    .line 275
    :cond_4
    const/4 v0, 0x0

    .line 282
    :cond_5
    :goto_5
    return-object v0

    .line 278
    :cond_6
    invoke-interface {p0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 279
    .local v0, "value":Ljava/lang/Object;, "TV;"
    if-nez v0, :cond_5

    .line 280
    invoke-interface {p2}, Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0, p1, v1}, Lorg/apache/commons/lang3/concurrent/ConcurrentUtils;->putIfAbsent(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_5
.end method

.method public static createIfAbsentUnchecked(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/ConcurrentMap",
            "<TK;TV;>;TK;",
            "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer",
            "<TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 303
    .local p0, "map":Ljava/util/concurrent/ConcurrentMap;, "Ljava/util/concurrent/ConcurrentMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "init":Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;, "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer<TV;>;"
    :try_start_0
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/concurrent/ConcurrentUtils;->createIfAbsent(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;)Ljava/lang/Object;
    :try_end_3
    .catch Lorg/apache/commons/lang3/concurrent/ConcurrentException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 304
    :catch_5
    move-exception v0

    .line 305
    .local v0, "cex":Lorg/apache/commons/lang3/concurrent/ConcurrentException;
    new-instance v1, Lorg/apache/commons/lang3/concurrent/ConcurrentRuntimeException;

    invoke-virtual {v0}, Lorg/apache/commons/lang3/concurrent/ConcurrentException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/lang3/concurrent/ConcurrentRuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static extractCause(Ljava/util/concurrent/ExecutionException;)Lorg/apache/commons/lang3/concurrent/ConcurrentException;
    .registers 4
    .param p0, "ex"    # Ljava/util/concurrent/ExecutionException;

    .prologue
    .line 61
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_a

    .line 62
    :cond_8
    const/4 v0, 0x0

    .line 66
    :goto_9
    return-object v0

    .line 65
    :cond_a
    invoke-static {p0}, Lorg/apache/commons/lang3/concurrent/ConcurrentUtils;->throwCause(Ljava/util/concurrent/ExecutionException;)V

    .line 66
    new-instance v0, Lorg/apache/commons/lang3/concurrent/ConcurrentException;

    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang3/concurrent/ConcurrentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_9
.end method

.method public static extractCauseUnchecked(Ljava/util/concurrent/ExecutionException;)Lorg/apache/commons/lang3/concurrent/ConcurrentRuntimeException;
    .registers 4
    .param p0, "ex"    # Ljava/util/concurrent/ExecutionException;

    .prologue
    .line 83
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_a

    .line 84
    :cond_8
    const/4 v0, 0x0

    .line 88
    :goto_9
    return-object v0

    .line 87
    :cond_a
    invoke-static {p0}, Lorg/apache/commons/lang3/concurrent/ConcurrentUtils;->throwCause(Ljava/util/concurrent/ExecutionException;)V

    .line 88
    new-instance v0, Lorg/apache/commons/lang3/concurrent/ConcurrentRuntimeException;

    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang3/concurrent/ConcurrentRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_9
.end method

.method public static handleCause(Ljava/util/concurrent/ExecutionException;)V
    .registers 2
    .param p0, "ex"    # Ljava/util/concurrent/ExecutionException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/lang3/concurrent/ConcurrentException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-static {p0}, Lorg/apache/commons/lang3/concurrent/ConcurrentUtils;->extractCause(Ljava/util/concurrent/ExecutionException;)Lorg/apache/commons/lang3/concurrent/ConcurrentException;

    move-result-object v0

    .line 108
    .local v0, "cex":Lorg/apache/commons/lang3/concurrent/ConcurrentException;
    if-eqz v0, :cond_7

    .line 109
    throw v0

    .line 111
    :cond_7
    return-void
.end method

.method public static handleCauseUnchecked(Ljava/util/concurrent/ExecutionException;)V
    .registers 2
    .param p0, "ex"    # Ljava/util/concurrent/ExecutionException;

    .prologue
    .line 127
    invoke-static {p0}, Lorg/apache/commons/lang3/concurrent/ConcurrentUtils;->extractCauseUnchecked(Ljava/util/concurrent/ExecutionException;)Lorg/apache/commons/lang3/concurrent/ConcurrentRuntimeException;

    move-result-object v0

    .line 129
    .local v0, "crex":Lorg/apache/commons/lang3/concurrent/ConcurrentRuntimeException;
    if-eqz v0, :cond_7

    .line 130
    throw v0

    .line 132
    :cond_7
    return-void
.end method

.method public static initialize(Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/lang3/concurrent/ConcurrentException;
        }
    .end annotation

    .prologue
    .line 184
    .local p0, "initializer":Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;, "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer<TT;>;"
    if-eqz p0, :cond_7

    invoke-interface {p0}, Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;->get()Ljava/lang/Object;

    move-result-object v0

    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static initializeUnchecked(Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 202
    .local p0, "initializer":Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;, "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer<TT;>;"
    :try_start_0
    invoke-static {p0}, Lorg/apache/commons/lang3/concurrent/ConcurrentUtils;->initialize(Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;)Ljava/lang/Object;
    :try_end_3
    .catch Lorg/apache/commons/lang3/concurrent/ConcurrentException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 203
    :catch_5
    move-exception v0

    .line 204
    .local v0, "cex":Lorg/apache/commons/lang3/concurrent/ConcurrentException;
    new-instance v1, Lorg/apache/commons/lang3/concurrent/ConcurrentRuntimeException;

    invoke-virtual {v0}, Lorg/apache/commons/lang3/concurrent/ConcurrentException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/lang3/concurrent/ConcurrentRuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static putIfAbsent(Ljava/util/concurrent/ConcurrentMap;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/ConcurrentMap",
            "<TK;TV;>;TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 244
    .local p0, "map":Ljava/util/concurrent/ConcurrentMap;, "Ljava/util/concurrent/ConcurrentMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    if-nez p0, :cond_4

    .line 245
    const/4 v0, 0x0

    .line 249
    :cond_3
    :goto_3
    return-object v0

    .line 248
    :cond_4
    invoke-interface {p0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 249
    .local v0, "result":Ljava/lang/Object;, "TV;"
    if-nez v0, :cond_3

    move-object v0, p2

    goto :goto_3
.end method

.method private static throwCause(Ljava/util/concurrent/ExecutionException;)V
    .registers 2
    .param p0, "ex"    # Ljava/util/concurrent/ExecutionException;

    .prologue
    .line 159
    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_f

    .line 160
    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    check-cast v0, Ljava/lang/RuntimeException;

    throw v0

    .line 163
    :cond_f
    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/Error;

    if-eqz v0, :cond_1e

    .line 164
    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    check-cast v0, Ljava/lang/Error;

    throw v0

    .line 166
    :cond_1e
    return-void
.end method
