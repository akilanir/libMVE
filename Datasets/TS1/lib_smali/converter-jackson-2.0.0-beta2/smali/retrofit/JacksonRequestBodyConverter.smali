.class final Lretrofit/JacksonRequestBodyConverter;
.super Ljava/lang/Object;
.source "JacksonRequestBodyConverter.java"

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
        "<TT;",
        "Lcom/squareup/okhttp/RequestBody;",
        ">;"
    }
.end annotation


# static fields
.field private static final MEDIA_TYPE:Lcom/squareup/okhttp/MediaType;


# instance fields
.field private final adapter:Lcom/fasterxml/jackson/databind/ObjectWriter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 24
    const-string v0, "application/json; charset=UTF-8"

    invoke-static {v0}, Lcom/squareup/okhttp/MediaType;->parse(Ljava/lang/String;)Lcom/squareup/okhttp/MediaType;

    move-result-object v0

    sput-object v0, Lretrofit/JacksonRequestBodyConverter;->MEDIA_TYPE:Lcom/squareup/okhttp/MediaType;

    return-void
.end method

.method constructor <init>(Lcom/fasterxml/jackson/databind/ObjectWriter;)V
    .registers 2
    .param p1, "adapter"    # Lcom/fasterxml/jackson/databind/ObjectWriter;

    .prologue
    .line 28
    .local p0, "this":Lretrofit/JacksonRequestBodyConverter;, "Lretrofit/JacksonRequestBodyConverter<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lretrofit/JacksonRequestBodyConverter;->adapter:Lcom/fasterxml/jackson/databind/ObjectWriter;

    .line 30
    return-void
.end method


# virtual methods
.method public convert(Ljava/lang/Object;)Lcom/squareup/okhttp/RequestBody;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/squareup/okhttp/RequestBody;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lretrofit/JacksonRequestBodyConverter;, "Lretrofit/JacksonRequestBodyConverter<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lretrofit/JacksonRequestBodyConverter;->adapter:Lcom/fasterxml/jackson/databind/ObjectWriter;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->writeValueAsBytes(Ljava/lang/Object;)[B

    move-result-object v0

    .line 34
    .local v0, "bytes":[B
    sget-object v1, Lretrofit/JacksonRequestBodyConverter;->MEDIA_TYPE:Lcom/squareup/okhttp/MediaType;

    invoke-static {v1, v0}, Lcom/squareup/okhttp/RequestBody;->create(Lcom/squareup/okhttp/MediaType;[B)Lcom/squareup/okhttp/RequestBody;

    move-result-object v1

    return-object v1
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
    .local p0, "this":Lretrofit/JacksonRequestBodyConverter;, "Lretrofit/JacksonRequestBodyConverter<TT;>;"
    invoke-virtual {p0, p1}, Lretrofit/JacksonRequestBodyConverter;->convert(Ljava/lang/Object;)Lcom/squareup/okhttp/RequestBody;

    move-result-object v0

    return-object v0
.end method
