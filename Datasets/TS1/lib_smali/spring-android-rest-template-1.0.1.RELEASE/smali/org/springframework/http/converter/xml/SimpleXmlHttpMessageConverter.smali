.class public Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;
.super Lorg/springframework/http/converter/AbstractHttpMessageConverter;
.source "SimpleXmlHttpMessageConverter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/springframework/http/converter/AbstractHttpMessageConverter",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field public static final DEFAULT_CHARSET:Ljava/nio/charset/Charset;


# instance fields
.field private serializer:Lorg/simpleframework/xml/Serializer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 61
    new-instance v0, Lorg/simpleframework/xml/core/Persister;

    invoke-direct {v0}, Lorg/simpleframework/xml/core/Persister;-><init>()V

    invoke-direct {p0, v0}, Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;-><init>(Lorg/simpleframework/xml/Serializer;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Lorg/simpleframework/xml/Serializer;)V
    .registers 5
    .param p1, "serializer"    # Lorg/simpleframework/xml/Serializer;

    .prologue
    .line 70
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/springframework/http/MediaType;

    const/4 v1, 0x0

    sget-object v2, Lorg/springframework/http/MediaType;->APPLICATION_XML:Lorg/springframework/http/MediaType;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lorg/springframework/http/MediaType;->TEXT_XML:Lorg/springframework/http/MediaType;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lorg/springframework/http/MediaType;->APPLICATION_WILDCARD_XML:Lorg/springframework/http/MediaType;

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lorg/springframework/http/converter/AbstractHttpMessageConverter;-><init>([Lorg/springframework/http/MediaType;)V

    .line 71
    invoke-virtual {p0, p1}, Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;->setSerializer(Lorg/simpleframework/xml/Serializer;)V

    .line 72
    return-void
.end method

.method private getCharset(Lorg/springframework/http/HttpHeaders;)Ljava/nio/charset/Charset;
    .registers 3
    .param p1, "headers"    # Lorg/springframework/http/HttpHeaders;

    .prologue
    .line 137
    if-eqz p1, :cond_1b

    invoke-virtual {p1}, Lorg/springframework/http/HttpHeaders;->getContentType()Lorg/springframework/http/MediaType;

    move-result-object v0

    if-eqz v0, :cond_1b

    invoke-virtual {p1}, Lorg/springframework/http/HttpHeaders;->getContentType()Lorg/springframework/http/MediaType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/springframework/http/MediaType;->getCharSet()Ljava/nio/charset/Charset;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 139
    invoke-virtual {p1}, Lorg/springframework/http/HttpHeaders;->getContentType()Lorg/springframework/http/MediaType;

    move-result-object v0

    invoke-virtual {v0}, Lorg/springframework/http/MediaType;->getCharSet()Ljava/nio/charset/Charset;

    move-result-object v0

    .line 141
    :goto_1a
    return-object v0

    :cond_1b
    sget-object v0, Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    goto :goto_1a
.end method


# virtual methods
.method public canRead(Ljava/lang/Class;Lorg/springframework/http/MediaType;)Z
    .registers 4
    .param p2, "mediaType"    # Lorg/springframework/http/MediaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/springframework/http/MediaType;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 88
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p2}, Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;->canRead(Lorg/springframework/http/MediaType;)Z

    move-result v0

    return v0
.end method

.method public canWrite(Ljava/lang/Class;Lorg/springframework/http/MediaType;)Z
    .registers 4
    .param p2, "mediaType"    # Lorg/springframework/http/MediaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/springframework/http/MediaType;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 93
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Lorg/simpleframework/xml/Root;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p0, p2}, Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;->canWrite(Lorg/springframework/http/MediaType;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method protected readInternal(Ljava/lang/Class;Lorg/springframework/http/HttpInputMessage;)Ljava/lang/Object;
    .registers 9
    .param p2, "inputMessage"    # Lorg/springframework/http/HttpInputMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Object;",
            ">;",
            "Lorg/springframework/http/HttpInputMessage;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/springframework/http/converter/HttpMessageNotReadableException;
        }
    .end annotation

    .prologue
    .line 106
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Object;>;"
    new-instance v2, Ljava/io/InputStreamReader;

    invoke-interface {p2}, Lorg/springframework/http/HttpInputMessage;->getBody()Ljava/io/InputStream;

    move-result-object v3

    invoke-interface {p2}, Lorg/springframework/http/HttpInputMessage;->getHeaders()Lorg/springframework/http/HttpHeaders;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;->getCharset(Lorg/springframework/http/HttpHeaders;)Ljava/nio/charset/Charset;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 109
    .local v2, "source":Ljava/io/Reader;
    :try_start_11
    iget-object v3, p0, Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;->serializer:Lorg/simpleframework/xml/Serializer;

    invoke-interface {v3, p1, v2}, Lorg/simpleframework/xml/Serializer;->read(Ljava/lang/Class;Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v1

    .line 110
    .local v1, "result":Ljava/lang/Object;
    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_43

    .line 111
    new-instance v3, Lorg/springframework/beans/TypeMismatchException;

    invoke-direct {v3, v1, p1}, Lorg/springframework/beans/TypeMismatchException;-><init>(Ljava/lang/Object;Ljava/lang/Class;)V

    throw v3
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_23} :catch_23

    .line 114
    .end local v1    # "result":Ljava/lang/Object;
    :catch_23
    move-exception v0

    .line 115
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v3, Lorg/springframework/http/converter/HttpMessageNotReadableException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not read ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/springframework/http/converter/HttpMessageNotReadableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 113
    .end local v0    # "ex":Ljava/lang/Exception;
    .restart local v1    # "result":Ljava/lang/Object;
    :cond_43
    return-object v1
.end method

.method public setSerializer(Lorg/simpleframework/xml/Serializer;)V
    .registers 3
    .param p1, "serializer"    # Lorg/simpleframework/xml/Serializer;

    .prologue
    .line 82
    const-string v0, "\'serializer\' must not be null"

    invoke-static {p1, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    iput-object p1, p0, Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;->serializer:Lorg/simpleframework/xml/Serializer;

    .line 84
    return-void
.end method

.method protected supports(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected writeInternal(Ljava/lang/Object;Lorg/springframework/http/HttpOutputMessage;)V
    .registers 8
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "outputMessage"    # Lorg/springframework/http/HttpOutputMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/springframework/http/converter/HttpMessageNotWritableException;
        }
    .end annotation

    .prologue
    .line 123
    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-interface {p2}, Lorg/springframework/http/HttpOutputMessage;->getBody()Ljava/io/OutputStream;

    move-result-object v2

    invoke-interface {p2}, Lorg/springframework/http/HttpOutputMessage;->getHeaders()Lorg/springframework/http/HttpHeaders;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;->getCharset(Lorg/springframework/http/HttpHeaders;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    .line 126
    .local v1, "out":Ljava/io/Writer;
    :try_start_11
    iget-object v2, p0, Lorg/springframework/http/converter/xml/SimpleXmlHttpMessageConverter;->serializer:Lorg/simpleframework/xml/Serializer;

    invoke-interface {v2, p1, v1}, Lorg/simpleframework/xml/Serializer;->write(Ljava/lang/Object;Ljava/io/Writer;)V

    .line 127
    invoke-virtual {v1}, Ljava/io/Writer;->close()V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_19} :catch_1a

    .line 131
    return-void

    .line 128
    :catch_1a
    move-exception v0

    .line 129
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v2, Lorg/springframework/http/converter/HttpMessageNotWritableException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not write ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/springframework/http/converter/HttpMessageNotWritableException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
