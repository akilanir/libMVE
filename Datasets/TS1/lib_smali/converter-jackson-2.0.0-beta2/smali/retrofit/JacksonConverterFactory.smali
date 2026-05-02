.class public final Lretrofit/JacksonConverterFactory;
.super Lretrofit/Converter$Factory;
.source "JacksonConverterFactory.java"


# instance fields
.field private final mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;


# direct methods
.method private constructor <init>(Lcom/fasterxml/jackson/databind/ObjectMapper;)V
    .registers 4
    .param p1, "mapper"    # Lcom/fasterxml/jackson/databind/ObjectMapper;

    .prologue
    .line 48
    invoke-direct {p0}, Lretrofit/Converter$Factory;-><init>()V

    .line 49
    if-nez p1, :cond_d

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "mapper == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_d
    iput-object p1, p0, Lretrofit/JacksonConverterFactory;->mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;

    .line 51
    return-void
.end method

.method public static create()Lretrofit/JacksonConverterFactory;
    .registers 1

    .prologue
    .line 38
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;-><init>()V

    invoke-static {v0}, Lretrofit/JacksonConverterFactory;->create(Lcom/fasterxml/jackson/databind/ObjectMapper;)Lretrofit/JacksonConverterFactory;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lcom/fasterxml/jackson/databind/ObjectMapper;)Lretrofit/JacksonConverterFactory;
    .registers 2
    .param p0, "mapper"    # Lcom/fasterxml/jackson/databind/ObjectMapper;

    .prologue
    .line 43
    new-instance v0, Lretrofit/JacksonConverterFactory;

    invoke-direct {v0, p0}, Lretrofit/JacksonConverterFactory;-><init>(Lcom/fasterxml/jackson/databind/ObjectMapper;)V

    return-object v0
.end method


# virtual methods
.method public fromResponseBody(Ljava/lang/reflect/Type;[Ljava/lang/annotation/Annotation;)Lretrofit/Converter;
    .registers 6
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "annotations"    # [Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "[",
            "Ljava/lang/annotation/Annotation;",
            ")",
            "Lretrofit/Converter",
            "<",
            "Lcom/squareup/okhttp/ResponseBody;",
            "*>;"
        }
    .end annotation

    .prologue
    .line 55
    iget-object v2, p0, Lretrofit/JacksonConverterFactory;->mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/databind/ObjectMapper;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    .line 56
    .local v0, "javaType":Lcom/fasterxml/jackson/databind/JavaType;
    iget-object v2, p0, Lretrofit/JacksonConverterFactory;->mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-virtual {v2, v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;->reader(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ObjectReader;

    move-result-object v1

    .line 57
    .local v1, "reader":Lcom/fasterxml/jackson/databind/ObjectReader;
    new-instance v2, Lretrofit/JacksonResponseBodyConverter;

    invoke-direct {v2, v1}, Lretrofit/JacksonResponseBodyConverter;-><init>(Lcom/fasterxml/jackson/databind/ObjectReader;)V

    return-object v2
.end method

.method public toRequestBody(Ljava/lang/reflect/Type;[Ljava/lang/annotation/Annotation;)Lretrofit/Converter;
    .registers 6
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "annotations"    # [Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "[",
            "Ljava/lang/annotation/Annotation;",
            ")",
            "Lretrofit/Converter",
            "<*",
            "Lcom/squareup/okhttp/RequestBody;",
            ">;"
        }
    .end annotation

    .prologue
    .line 61
    iget-object v2, p0, Lretrofit/JacksonConverterFactory;->mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/databind/ObjectMapper;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    .line 62
    .local v0, "javaType":Lcom/fasterxml/jackson/databind/JavaType;
    iget-object v2, p0, Lretrofit/JacksonConverterFactory;->mapper:Lcom/fasterxml/jackson/databind/ObjectMapper;

    invoke-virtual {v2, v0}, Lcom/fasterxml/jackson/databind/ObjectMapper;->writerWithType(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v1

    .line 63
    .local v1, "writer":Lcom/fasterxml/jackson/databind/ObjectWriter;
    new-instance v2, Lretrofit/JacksonRequestBodyConverter;

    invoke-direct {v2, v1}, Lretrofit/JacksonRequestBodyConverter;-><init>(Lcom/fasterxml/jackson/databind/ObjectWriter;)V

    return-object v2
.end method
