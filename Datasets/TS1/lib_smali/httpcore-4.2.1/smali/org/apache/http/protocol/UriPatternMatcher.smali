.class public Lorg/apache/http/protocol/UriPatternMatcher;
.super Ljava/lang/Object;
.source "UriPatternMatcher.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 59
    .local p0, "this":Lorg/apache/http/protocol/UriPatternMatcher;, "Lorg/apache/http/protocol/UriPatternMatcher<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/protocol/UriPatternMatcher;->map:Ljava/util/Map;

    .line 61
    return-void
.end method


# virtual methods
.method public declared-synchronized getObjects()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "this":Lorg/apache/http/protocol/UriPatternMatcher;, "Lorg/apache/http/protocol/UriPatternMatcher<TT;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/protocol/UriPatternMatcher;->map:Ljava/util/Map;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized lookup(Ljava/lang/String;)Ljava/lang/Object;
    .registers 9
    .param p1, "requestURI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lorg/apache/http/protocol/UriPatternMatcher;, "Lorg/apache/http/protocol/UriPatternMatcher<TT;>;"
    monitor-enter p0

    if-nez p1, :cond_e

    .line 130
    :try_start_3
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Request URI may not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 129
    :catchall_b
    move-exception v5

    monitor-exit p0

    throw v5

    .line 133
    :cond_e
    :try_start_e
    const-string v5, "?"

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 134
    .local v1, "index":I
    const/4 v5, -0x1

    if-eq v1, v5, :cond_1c

    .line 135
    const/4 v5, 0x0

    invoke-virtual {p1, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 139
    :cond_1c
    iget-object v5, p0, Lorg/apache/http/protocol/UriPatternMatcher;->map:Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 140
    .local v3, "obj":Ljava/lang/Object;, "TT;"
    if-nez v3, :cond_67

    .line 142
    const/4 v0, 0x0

    .line 143
    .local v0, "bestMatch":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/http/protocol/UriPatternMatcher;->map:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2f
    :goto_2f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_67

    .line 144
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 145
    .local v4, "pattern":Ljava/lang/String;
    invoke-virtual {p0, v4, p1}, Lorg/apache/http/protocol/UriPatternMatcher;->matchUriRequestPattern(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 147
    if-eqz v0, :cond_5f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-lt v5, v6, :cond_5f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v5, v6, :cond_2f

    const-string v5, "*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 150
    :cond_5f
    iget-object v5, p0, Lorg/apache/http/protocol/UriPatternMatcher;->map:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_64
    .catchall {:try_start_e .. :try_end_64} :catchall_b

    move-result-object v3

    .line 151
    move-object v0, v4

    goto :goto_2f

    .line 156
    .end local v0    # "bestMatch":Ljava/lang/String;
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "pattern":Ljava/lang/String;
    :cond_67
    monitor-exit p0

    return-object v3
.end method

.method protected matchUriRequestPattern(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "requestUri"    # Ljava/lang/String;

    .prologue
    .local p0, "this":Lorg/apache/http/protocol/UriPatternMatcher;, "Lorg/apache/http/protocol/UriPatternMatcher<TT;>;"
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 168
    const-string v2, "*"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 171
    :goto_a
    return v1

    :cond_b
    const-string v2, "*"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_23

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_39

    :cond_23
    const-string v2, "*"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3a

    :cond_39
    move v0, v1

    :cond_3a
    move v1, v0

    goto :goto_a
.end method

.method public declared-synchronized register(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lorg/apache/http/protocol/UriPatternMatcher;, "Lorg/apache/http/protocol/UriPatternMatcher<TT;>;"
    .local p2, "obj":Ljava/lang/Object;, "TT;"
    monitor-enter p0

    if-nez p1, :cond_e

    .line 71
    :try_start_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "URI request pattern may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 70
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0

    .line 73
    :cond_e
    :try_start_e
    iget-object v0, p0, Lorg/apache/http/protocol/UriPatternMatcher;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_13
    .catchall {:try_start_e .. :try_end_13} :catchall_b

    .line 74
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setHandlers(Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TT;>;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 93
    .local p0, "this":Lorg/apache/http/protocol/UriPatternMatcher;, "Lorg/apache/http/protocol/UriPatternMatcher<TT;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;TT;>;"
    monitor-enter p0

    if-nez p1, :cond_e

    .line 94
    :try_start_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Map of handlers may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 93
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0

    .line 96
    :cond_e
    :try_start_e
    iget-object v0, p0, Lorg/apache/http/protocol/UriPatternMatcher;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 97
    iget-object v0, p0, Lorg/apache/http/protocol/UriPatternMatcher;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V
    :try_end_18
    .catchall {:try_start_e .. :try_end_18} :catchall_b

    .line 98
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setObjects(Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TT;>;)V"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, "this":Lorg/apache/http/protocol/UriPatternMatcher;, "Lorg/apache/http/protocol/UriPatternMatcher<TT;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;TT;>;"
    monitor-enter p0

    if-nez p1, :cond_e

    .line 106
    :try_start_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Map of handlers may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 105
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0

    .line 108
    :cond_e
    :try_start_e
    iget-object v0, p0, Lorg/apache/http/protocol/UriPatternMatcher;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 109
    iget-object v0, p0, Lorg/apache/http/protocol/UriPatternMatcher;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V
    :try_end_18
    .catchall {:try_start_e .. :try_end_18} :catchall_b

    .line 110
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized unregister(Ljava/lang/String;)V
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 82
    .local p0, "this":Lorg/apache/http/protocol/UriPatternMatcher;, "Lorg/apache/http/protocol/UriPatternMatcher<TT;>;"
    monitor-enter p0

    if-nez p1, :cond_5

    .line 86
    :goto_3
    monitor-exit p0

    return-void

    .line 85
    :cond_5
    :try_start_5
    iget-object v0, p0, Lorg/apache/http/protocol/UriPatternMatcher;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_b

    goto :goto_3

    .line 82
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method
