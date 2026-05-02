.class public Lcom/koushikdutta/ion/gson/GsonSerializer;
.super Ljava/lang/Object;
.source "GsonSerializer.java"

# interfaces
.implements Lcom/koushikdutta/async/parser/AsyncParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/parser/AsyncParser",
        "<TT;>;"
    }
.end annotation


# instance fields
.field gson:Lcom/google/gson/Gson;

.field type:Ljava/lang/reflect/Type;


# direct methods
.method public constructor <init>(Lcom/google/gson/Gson;Lcom/google/gson/reflect/TypeToken;)V
    .registers 4
    .param p1, "gson"    # Lcom/google/gson/Gson;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/Gson;",
            "Lcom/google/gson/reflect/TypeToken",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonSerializer;, "Lcom/koushikdutta/ion/gson/GsonSerializer<TT;>;"
    .local p2, "token":Lcom/google/gson/reflect/TypeToken;, "Lcom/google/gson/reflect/TypeToken<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/koushikdutta/ion/gson/GsonSerializer;->gson:Lcom/google/gson/Gson;

    .line 34
    invoke-virtual {p2}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/gson/GsonSerializer;->type:Ljava/lang/reflect/Type;

    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/google/gson/Gson;Ljava/lang/Class;)V
    .registers 3
    .param p1, "gson"    # Lcom/google/gson/Gson;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/Gson;",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonSerializer;, "Lcom/koushikdutta/ion/gson/GsonSerializer<TT;>;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/koushikdutta/ion/gson/GsonSerializer;->gson:Lcom/google/gson/Gson;

    .line 30
    iput-object p2, p0, Lcom/koushikdutta/ion/gson/GsonSerializer;->type:Ljava/lang/reflect/Type;

    .line 31
    return-void
.end method


# virtual methods
.method public getType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 65
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonSerializer;, "Lcom/koushikdutta/ion/gson/GsonSerializer<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/gson/GsonSerializer;->type:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;
    .registers 4
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/DataEmitter;",
            ")",
            "Lcom/koushikdutta/async/future/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonSerializer;, "Lcom/koushikdutta/ion/gson/GsonSerializer<TT;>;"
    new-instance v0, Lcom/koushikdutta/async/parser/ByteBufferListParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/ByteBufferListParser;-><init>()V

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/parser/ByteBufferListParser;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/ion/gson/GsonSerializer$1;

    invoke-direct {v1, p0}, Lcom/koushikdutta/ion/gson/GsonSerializer$1;-><init>(Lcom/koushikdutta/ion/gson/GsonSerializer;)V

    .line 39
    invoke-interface {v0, v1}, Lcom/koushikdutta/async/future/Future;->then(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/future/Future;

    return-object v0
.end method

.method public write(Lcom/koushikdutta/async/DataSink;Ljava/lang/Object;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 9
    .param p1, "sink"    # Lcom/koushikdutta/async/DataSink;
    .param p3, "completed"    # Lcom/koushikdutta/async/callback/CompletedCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/koushikdutta/async/DataSink;",
            "TT;",
            "Lcom/koushikdutta/async/callback/CompletedCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonSerializer;, "Lcom/koushikdutta/ion/gson/GsonSerializer<TT;>;"
    .local p2, "pojo":Ljava/lang/Object;, "TT;"
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 52
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/io/OutputStreamWriter;

    invoke-direct {v2, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 53
    .local v2, "out":Ljava/io/OutputStreamWriter;
    iget-object v3, p0, Lcom/koushikdutta/ion/gson/GsonSerializer;->gson:Lcom/google/gson/Gson;

    iget-object v4, p0, Lcom/koushikdutta/ion/gson/GsonSerializer;->type:Ljava/lang/reflect/Type;

    invoke-virtual {v3, p2, v4, v2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/lang/Appendable;)V

    .line 55
    :try_start_11
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->flush()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_14} :catch_1c

    .line 60
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-static {p1, v3, p3}, Lcom/koushikdutta/async/Util;->writeAll(Lcom/koushikdutta/async/DataSink;[BLcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 61
    return-void

    .line 57
    :catch_1c
    move-exception v1

    .line 58
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method
