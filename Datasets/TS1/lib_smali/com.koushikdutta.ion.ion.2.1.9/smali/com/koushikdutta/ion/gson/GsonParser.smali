.class public abstract Lcom/koushikdutta/ion/gson/GsonParser;
.super Ljava/lang/Object;
.source "GsonParser.java"

# interfaces
.implements Lcom/koushikdutta/async/parser/AsyncParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/google/gson/JsonElement;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/parser/AsyncParser",
        "<TT;>;"
    }
.end annotation


# instance fields
.field clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lcom/google/gson/JsonElement;",
            ">;"
        }
    .end annotation
.end field

.field forcedCharset:Ljava/nio/charset/Charset;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonParser;, "Lcom/koushikdutta/ion/gson/GsonParser<TT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/koushikdutta/ion/gson/GsonParser;->clazz:Ljava/lang/Class;

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/nio/charset/Charset;)V
    .registers 3
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+TT;>;",
            "Ljava/nio/charset/Charset;",
            ")V"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonParser;, "Lcom/koushikdutta/ion/gson/GsonParser<TT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+TT;>;"
    invoke-direct {p0, p1}, Lcom/koushikdutta/ion/gson/GsonParser;-><init>(Ljava/lang/Class;)V

    .line 34
    iput-object p2, p0, Lcom/koushikdutta/ion/gson/GsonParser;->forcedCharset:Ljava/nio/charset/Charset;

    .line 35
    return-void
.end method


# virtual methods
.method public getType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 70
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonParser;, "Lcom/koushikdutta/ion/gson/GsonParser<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/gson/GsonParser;->clazz:Ljava/lang/Class;

    return-object v0
.end method

.method public parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;
    .registers 5
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
    .line 39
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonParser;, "Lcom/koushikdutta/ion/gson/GsonParser<TT;>;"
    invoke-interface {p1}, Lcom/koushikdutta/async/DataEmitter;->charset()Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "charset":Ljava/lang/String;
    new-instance v1, Lcom/koushikdutta/async/parser/ByteBufferListParser;

    invoke-direct {v1}, Lcom/koushikdutta/async/parser/ByteBufferListParser;-><init>()V

    invoke-virtual {v1, p1}, Lcom/koushikdutta/async/parser/ByteBufferListParser;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;

    move-result-object v1

    new-instance v2, Lcom/koushikdutta/ion/gson/GsonParser$1;

    invoke-direct {v2, p0, v0}, Lcom/koushikdutta/ion/gson/GsonParser$1;-><init>(Lcom/koushikdutta/ion/gson/GsonParser;Ljava/lang/String;)V

    .line 41
    invoke-interface {v1, v2}, Lcom/koushikdutta/async/future/Future;->then(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/future/Future;

    return-object v1
.end method

.method public write(Lcom/koushikdutta/async/DataSink;Lcom/google/gson/JsonElement;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 6
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
    .line 65
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonParser;, "Lcom/koushikdutta/ion/gson/GsonParser<TT;>;"
    .local p2, "value":Lcom/google/gson/JsonElement;, "TT;"
    new-instance v0, Lcom/koushikdutta/async/parser/StringParser;

    invoke-direct {v0}, Lcom/koushikdutta/async/parser/StringParser;-><init>()V

    invoke-virtual {p2}, Lcom/google/gson/JsonElement;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1, p3}, Lcom/koushikdutta/async/parser/StringParser;->write(Lcom/koushikdutta/async/DataSink;Ljava/lang/String;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 66
    return-void
.end method

.method public bridge synthetic write(Lcom/koushikdutta/async/DataSink;Ljava/lang/Object;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 4
    .param p1, "x0"    # Lcom/koushikdutta/async/DataSink;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 25
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonParser;, "Lcom/koushikdutta/ion/gson/GsonParser<TT;>;"
    check-cast p2, Lcom/google/gson/JsonElement;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lcom/koushikdutta/ion/gson/GsonParser;->write(Lcom/koushikdutta/async/DataSink;Lcom/google/gson/JsonElement;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    return-void
.end method
