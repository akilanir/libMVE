.class public Lcom/koushikdutta/ion/FileCacheStore;
.super Ljava/lang/Object;
.source "FileCacheStore.java"


# instance fields
.field cache:Lcom/koushikdutta/async/util/FileCache;

.field ion:Lcom/koushikdutta/ion/Ion;

.field rawKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/util/FileCache;Ljava/lang/String;)V
    .registers 4
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "cache"    # Lcom/koushikdutta/async/util/FileCache;
    .param p3, "rawKey"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/koushikdutta/ion/FileCacheStore;->ion:Lcom/koushikdutta/ion/Ion;

    .line 31
    iput-object p2, p0, Lcom/koushikdutta/ion/FileCacheStore;->cache:Lcom/koushikdutta/async/util/FileCache;

    .line 32
    iput-object p3, p0, Lcom/koushikdutta/ion/FileCacheStore;->rawKey:Ljava/lang/String;

    .line 33
    return-void
.end method

.method static synthetic access$000(Lcom/koushikdutta/ion/FileCacheStore;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/ion/FileCacheStore;

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/koushikdutta/ion/FileCacheStore;->computeKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private as(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/parser/AsyncParser",
            "<TT;>;)",
            "Lcom/koushikdutta/async/future/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 96
    .local p1, "parser":Lcom/koushikdutta/async/parser/AsyncParser;, "Lcom/koushikdutta/async/parser/AsyncParser<TT;>;"
    new-instance v0, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v0}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 98
    .local v0, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<TT;>;"
    invoke-static {}, Lcom/koushikdutta/ion/Ion;->getIoExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/koushikdutta/ion/FileCacheStore$2;

    invoke-direct {v2, p0, v0, p1}, Lcom/koushikdutta/ion/FileCacheStore$2;-><init>(Lcom/koushikdutta/ion/FileCacheStore;Lcom/koushikdutta/async/future/SimpleFuture;Lcom/koushikdutta/async/parser/AsyncParser;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 118
    return-object v0
.end method

.method private computeKey()Ljava/lang/String;
    .registers 4

    .prologue
    .line 183
    iget-object v0, p0, Lcom/koushikdutta/ion/FileCacheStore;->rawKey:Ljava/lang/String;

    const-string v1, ":"

    const-string v2, "_"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private get(Lcom/koushikdutta/async/parser/AsyncParser;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/async/parser/AsyncParser",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 123
    .local p1, "parser":Lcom/koushikdutta/async/parser/AsyncParser;, "Lcom/koushikdutta/async/parser/AsyncParser<TT;>;"
    :try_start_0
    invoke-direct {p0}, Lcom/koushikdutta/ion/FileCacheStore;->computeKey()Ljava/lang/String;

    move-result-object v2

    .line 124
    .local v2, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/koushikdutta/ion/FileCacheStore;->cache:Lcom/koushikdutta/async/util/FileCache;

    invoke-virtual {v3, v2}, Lcom/koushikdutta/async/util/FileCache;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 125
    .local v1, "file":Ljava/io/File;
    iget-object v3, p0, Lcom/koushikdutta/ion/FileCacheStore;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v4, p0, Lcom/koushikdutta/ion/FileCacheStore;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/Ion;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/koushikdutta/ion/Ion;->build(Landroid/content/Context;)Lcom/koushikdutta/ion/builder/LoadBuilder;

    move-result-object v3

    invoke-interface {v3, v1}, Lcom/koushikdutta/ion/builder/LoadBuilder;->load(Ljava/io/File;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/koushikdutta/ion/builder/Builders$Any$B;

    .line 126
    invoke-interface {v3, p1}, Lcom/koushikdutta/ion/builder/Builders$Any$B;->as(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v3

    .line 127
    invoke-interface {v3}, Lcom/koushikdutta/ion/future/ResponseFuture;->get()Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_23} :catch_25

    move-result-object v3

    .line 130
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "key":Ljava/lang/String;
    :goto_24
    return-object v3

    .line 129
    :catch_25
    move-exception v0

    .line 130
    .local v0, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    goto :goto_24
.end method

.method private put(Ljava/lang/Object;Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/koushikdutta/async/parser/AsyncParser",
            "<TT;>;)",
            "Lcom/koushikdutta/async/future/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 36
    .local p1, "value":Ljava/lang/Object;, "TT;"
    .local p2, "parser":Lcom/koushikdutta/async/parser/AsyncParser;, "Lcom/koushikdutta/async/parser/AsyncParser<TT;>;"
    new-instance v0, Lcom/koushikdutta/async/future/SimpleFuture;

    invoke-direct {v0}, Lcom/koushikdutta/async/future/SimpleFuture;-><init>()V

    .line 37
    .local v0, "ret":Lcom/koushikdutta/async/future/SimpleFuture;, "Lcom/koushikdutta/async/future/SimpleFuture<TT;>;"
    invoke-static {}, Lcom/koushikdutta/ion/Ion;->getIoExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/koushikdutta/ion/FileCacheStore$1;

    invoke-direct {v2, p0, p2, p1, v0}, Lcom/koushikdutta/ion/FileCacheStore$1;-><init>(Lcom/koushikdutta/ion/FileCacheStore;Lcom/koushikdutta/async/parser/AsyncParser;Ljava/lang/Object;Lcom/koushikdutta/async/future/SimpleFuture;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 58
    return-object v0
.end method


# virtual methods
.method public as(Lcom/google/gson/reflect/TypeToken;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/gson/reflect/TypeToken",
            "<TT;>;)",
            "Lcom/koushikdutta/async/future/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 175
    .local p1, "token":Lcom/google/gson/reflect/TypeToken;, "Lcom/google/gson/reflect/TypeToken<TT;>;"
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonSerializer;

    iget-object v1, p0, Lcom/koushikdutta/ion/FileCacheStore;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/koushikdutta/ion/gson/GsonSerializer;-><init>(Lcom/google/gson/Gson;Lcom/google/gson/reflect/TypeToken;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->as(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public as(Ljava/lang/Class;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/koushikdutta/async/future/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 167
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonSerializer;

    iget-object v1, p0, Lcom/koushikdutta/ion/FileCacheStore;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/koushikdutta/ion/gson/GsonSerializer;-><init>(Lcom/google/gson/Gson;Ljava/lang/Class;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->as(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public asDocument()Lcom/koushikdutta/async/future/Future;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lorg/w3c/dom/Document;",
            ">;"
        }
    .end annotation

    .prologue
    .line 159
    new-instance v0, Lcom/koushikdutta/async/parser/DocumentParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/DocumentParser;-><init>()V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->as(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public asJsonArray()Lcom/koushikdutta/async/future/Future;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/google/gson/JsonArray;",
            ">;"
        }
    .end annotation

    .prologue
    .line 151
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonArrayParser;

    invoke-direct {v0}, Lcom/koushikdutta/ion/gson/GsonArrayParser;-><init>()V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->as(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public asJsonObject()Lcom/koushikdutta/async/future/Future;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/google/gson/JsonObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 143
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonObjectParser;

    invoke-direct {v0}, Lcom/koushikdutta/ion/gson/GsonObjectParser;-><init>()V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->as(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public asString()Lcom/koushikdutta/async/future/Future;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 139
    new-instance v0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/StringParser;-><init>()V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->as(Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public get(Lcom/google/gson/reflect/TypeToken;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/gson/reflect/TypeToken",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 179
    .local p1, "token":Lcom/google/gson/reflect/TypeToken;, "Lcom/google/gson/reflect/TypeToken<TT;>;"
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonSerializer;

    iget-object v1, p0, Lcom/koushikdutta/ion/FileCacheStore;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/koushikdutta/ion/gson/GsonSerializer;-><init>(Lcom/google/gson/Gson;Lcom/google/gson/reflect/TypeToken;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->get(Lcom/koushikdutta/async/parser/AsyncParser;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Class;)Ljava/lang/Object;
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

    .prologue
    .line 171
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonSerializer;

    iget-object v1, p0, Lcom/koushikdutta/ion/FileCacheStore;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/koushikdutta/ion/gson/GsonSerializer;-><init>(Lcom/google/gson/Gson;Ljava/lang/Class;)V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->get(Lcom/koushikdutta/async/parser/AsyncParser;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getDocument()Lorg/w3c/dom/Document;
    .registers 2

    .prologue
    .line 163
    new-instance v0, Lcom/koushikdutta/async/parser/DocumentParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/DocumentParser;-><init>()V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->get(Lcom/koushikdutta/async/parser/AsyncParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Document;

    return-object v0
.end method

.method public getJsonArray()Lcom/google/gson/JsonArray;
    .registers 2

    .prologue
    .line 155
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonArrayParser;

    invoke-direct {v0}, Lcom/koushikdutta/ion/gson/GsonArrayParser;-><init>()V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->get(Lcom/koushikdutta/async/parser/AsyncParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/JsonArray;

    return-object v0
.end method

.method public getJsonObject()Lcom/google/gson/JsonObject;
    .registers 2

    .prologue
    .line 147
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonObjectParser;

    invoke-direct {v0}, Lcom/koushikdutta/ion/gson/GsonObjectParser;-><init>()V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->get(Lcom/koushikdutta/async/parser/AsyncParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/gson/JsonObject;

    return-object v0
.end method

.method public getString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 135
    new-instance v0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/StringParser;-><init>()V

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/FileCacheStore;->get(Lcom/koushikdutta/async/parser/AsyncParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public put(Ljava/lang/Object;Lcom/google/gson/reflect/TypeToken;)Lcom/koushikdutta/async/future/Future;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/gson/reflect/TypeToken",
            "<TT;>;)",
            "Lcom/koushikdutta/async/future/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "value":Ljava/lang/Object;, "TT;"
    .local p2, "token":Lcom/google/gson/reflect/TypeToken;, "Lcom/google/gson/reflect/TypeToken<TT;>;"
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonSerializer;

    iget-object v1, p0, Lcom/koushikdutta/ion/FileCacheStore;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lcom/koushikdutta/ion/gson/GsonSerializer;-><init>(Lcom/google/gson/Gson;Lcom/google/gson/reflect/TypeToken;)V

    invoke-direct {p0, p1, v0}, Lcom/koushikdutta/ion/FileCacheStore;->put(Ljava/lang/Object;Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Class;)Lcom/koushikdutta/async/future/Future;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/koushikdutta/async/future/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 88
    .local p1, "value":Ljava/lang/Object;, "TT;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonSerializer;

    iget-object v1, p0, Lcom/koushikdutta/ion/FileCacheStore;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lcom/koushikdutta/ion/gson/GsonSerializer;-><init>(Lcom/google/gson/Gson;Ljava/lang/Class;)V

    invoke-direct {p0, p1, v0}, Lcom/koushikdutta/ion/FileCacheStore;->put(Ljava/lang/Object;Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public putDocument(Lorg/w3c/dom/Document;)Lcom/koushikdutta/async/future/Future;
    .registers 3
    .param p1, "value"    # Lorg/w3c/dom/Document;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Document;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lorg/w3c/dom/Document;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    new-instance v0, Lcom/koushikdutta/async/parser/DocumentParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/DocumentParser;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/koushikdutta/ion/FileCacheStore;->put(Ljava/lang/Object;Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public putJsonArray(Lcom/google/gson/JsonArray;)Lcom/koushikdutta/async/future/Future;
    .registers 3
    .param p1, "value"    # Lcom/google/gson/JsonArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/JsonArray;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/google/gson/JsonArray;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonArrayParser;

    invoke-direct {v0}, Lcom/koushikdutta/ion/gson/GsonArrayParser;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/koushikdutta/ion/FileCacheStore;->put(Ljava/lang/Object;Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public putJsonObject(Lcom/google/gson/JsonObject;)Lcom/koushikdutta/async/future/Future;
    .registers 3
    .param p1, "value"    # Lcom/google/gson/JsonObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/JsonObject;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Lcom/google/gson/JsonObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    new-instance v0, Lcom/koushikdutta/ion/gson/GsonObjectParser;

    invoke-direct {v0}, Lcom/koushikdutta/ion/gson/GsonObjectParser;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/koushikdutta/ion/FileCacheStore;->put(Ljava/lang/Object;Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public putString(Ljava/lang/String;)Lcom/koushikdutta/async/future/Future;
    .registers 3
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/StringParser;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/koushikdutta/ion/FileCacheStore;->put(Ljava/lang/Object;Lcom/koushikdutta/async/parser/AsyncParser;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .registers 3

    .prologue
    .line 187
    invoke-direct {p0}, Lcom/koushikdutta/ion/FileCacheStore;->computeKey()Ljava/lang/String;

    move-result-object v0

    .line 188
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lcom/koushikdutta/ion/FileCacheStore;->cache:Lcom/koushikdutta/async/util/FileCache;

    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/util/FileCache;->remove(Ljava/lang/String;)V

    .line 189
    return-void
.end method
