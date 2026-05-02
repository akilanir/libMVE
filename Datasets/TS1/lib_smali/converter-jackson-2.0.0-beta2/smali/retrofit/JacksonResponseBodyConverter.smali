.class final Lretrofit/JacksonResponseBodyConverter;
.super Ljava/lang/Object;
.source "JacksonResponseBodyConverter.java"

# interfaces
.implements Lretrofit/Converter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lretrofit/Converter",
        "<",
        "Lcom/squareup/okhttp/ResponseBody;",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final adapter:Lcom/fasterxml/jackson/databind/ObjectReader;


# direct methods
.method constructor <init>(Lcom/fasterxml/jackson/databind/ObjectReader;)V
    .registers 2
    .param p1, "adapter"    # Lcom/fasterxml/jackson/databind/ObjectReader;

    .prologue
    .line 26
    .local p0, "this":Lretrofit/JacksonResponseBodyConverter;, "Lretrofit/JacksonResponseBodyConverter<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lretrofit/JacksonResponseBodyConverter;->adapter:Lcom/fasterxml/jackson/databind/ObjectReader;

    .line 28
    return-void
.end method


# virtual methods
.method public convert(Lcom/squareup/okhttp/ResponseBody;)Ljava/lang/Object;
    .registers 4
    .param p1, "value"    # Lcom/squareup/okhttp/ResponseBody;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/squareup/okhttp/ResponseBody;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lretrofit/JacksonResponseBodyConverter;, "Lretrofit/JacksonResponseBodyConverter<TT;>;"
    invoke-virtual {p1}, Lcom/squareup/okhttp/ResponseBody;->charStream()Ljava/io/Reader;

    move-result-object v0

    .line 33
    .local v0, "reader":Ljava/io/Reader;
    :try_start_4
    iget-object v1, p0, Lretrofit/JacksonResponseBodyConverter;->adapter:Lcom/fasterxml/jackson/databind/ObjectReader;

    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/databind/ObjectReader;->readValue(Ljava/io/Reader;)Ljava/lang/Object;
    :try_end_9
    .catchall {:try_start_4 .. :try_end_9} :catchall_e

    move-result-object v1

    .line 35
    invoke-static {v0}, Lretrofit/Utils;->closeQuietly(Ljava/io/Closeable;)V

    return-object v1

    :catchall_e
    move-exception v1

    invoke-static {v0}, Lretrofit/Utils;->closeQuietly(Ljava/io/Closeable;)V

    throw v1
.end method

.method public bridge synthetic convert(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lretrofit/JacksonResponseBodyConverter;, "Lretrofit/JacksonResponseBodyConverter<TT;>;"
    check-cast p1, Lcom/squareup/okhttp/ResponseBody;

    invoke-virtual {p0, p1}, Lretrofit/JacksonResponseBodyConverter;->convert(Lcom/squareup/okhttp/ResponseBody;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
