.class public Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;
.super Ljava/lang/Object;
.source "FastJsonProvider.java"

# interfaces
.implements Ljavax/ws/rs/ext/MessageBodyReader;
.implements Ljavax/ws/rs/ext/MessageBodyWriter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljavax/ws/rs/ext/MessageBodyReader",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Ljavax/ws/rs/ext/MessageBodyWriter",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Ljavax/ws/rs/Consumes;
    value = {
        "*/*"
    }
.end annotation

.annotation runtime Ljavax/ws/rs/Produces;
    value = {
        "*/*"
    }
.end annotation

.annotation runtime Ljavax/ws/rs/ext/Provider;
.end annotation


# instance fields
.field protected charset:Ljava/nio/charset/Charset;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private clazzes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected dateFormat:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

.field protected features:[Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected filters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field uriInfo:Ljavax/ws/rs/core/UriInfo;
    .annotation runtime Ljavax/ws/rs/core/Context;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->charset:Ljava/nio/charset/Charset;

    .line 48
    new-array v0, v1, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->features:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 51
    new-array v0, v1, [Lcom/alibaba/fastjson/serializer/SerializeFilter;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->filters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    .line 58
    new-instance v0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-direct {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->clazzes:[Ljava/lang/Class;

    .line 90
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "charset"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->charset:Ljava/nio/charset/Charset;

    .line 48
    new-array v0, v1, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->features:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 51
    new-array v0, v1, [Lcom/alibaba/fastjson/serializer/SerializeFilter;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->filters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    .line 58
    new-instance v0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-direct {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->clazzes:[Ljava/lang/Class;

    .line 104
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->setCharset(Ljava/nio/charset/Charset;)V

    .line 105
    return-void
.end method

.method public constructor <init>([Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p1, "clazzes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->charset:Ljava/nio/charset/Charset;

    .line 48
    new-array v0, v1, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->features:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 51
    new-array v0, v1, [Lcom/alibaba/fastjson/serializer/SerializeFilter;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->filters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    .line 58
    new-instance v0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-direct {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->clazzes:[Ljava/lang/Class;

    .line 96
    iput-object p1, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->clazzes:[Ljava/lang/Class;

    .line 97
    return-void
.end method


# virtual methods
.method public getCharset()Ljava/nio/charset/Charset;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    return-object v0
.end method

.method public getDateFormat()Ljava/lang/String;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getDateFormat()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFastJsonConfig()Lcom/alibaba/fastjson/support/config/FastJsonConfig;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    return-object v0
.end method

.method public getFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getSerializerFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v0

    return-object v0
.end method

.method public getFilters()[Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 139
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getSerializeFilters()[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    move-result-object v0

    return-object v0
.end method

.method public getSize(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/reflect/Type;[Ljava/lang/annotation/Annotation;Ljavax/ws/rs/core/MediaType;)J
    .registers 8
    .param p1, "t"    # Ljava/lang/Object;
    .param p3, "genericType"    # Ljava/lang/reflect/Type;
    .param p4, "annotations"    # [Ljava/lang/annotation/Annotation;
    .param p5, "mediaType"    # Ljavax/ws/rs/core/MediaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            "[",
            "Ljava/lang/annotation/Annotation;",
            "Ljavax/ws/rs/core/MediaType;",
            ")J"
        }
    .end annotation

    .prologue
    .line 224
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method protected hasMatchingMediaType(Ljavax/ws/rs/core/MediaType;)Z
    .registers 5
    .param p1, "mediaType"    # Ljavax/ws/rs/core/MediaType;

    .prologue
    const/4 v1, 0x1

    .line 180
    if-eqz p1, :cond_3f

    .line 181
    invoke-virtual {p1}, Ljavax/ws/rs/core/MediaType;->getSubtype()Ljava/lang/String;

    move-result-object v0

    .line 183
    .local v0, "subtype":Ljava/lang/String;
    const-string v2, "json"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3f

    const-string v2, "+json"

    .line 184
    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3f

    const-string v2, "javascript"

    .line 185
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3f

    const-string v2, "x-javascript"

    .line 186
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3f

    const-string v2, "x-json"

    .line 187
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3f

    const-string v2, "x-www-form-urlencoded"

    .line 188
    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3f

    const-string v2, "x-www-form-urlencoded"

    .line 189
    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_40

    .line 191
    .end local v0    # "subtype":Ljava/lang/String;
    :cond_3f
    :goto_3f
    return v1

    .line 189
    .restart local v0    # "subtype":Ljava/lang/String;
    :cond_40
    const/4 v1, 0x0

    goto :goto_3f
.end method

.method public isReadable(Ljava/lang/Class;Ljava/lang/reflect/Type;[Ljava/lang/annotation/Annotation;Ljavax/ws/rs/core/MediaType;)Z
    .registers 6
    .param p2, "genericType"    # Ljava/lang/reflect/Type;
    .param p3, "annotations"    # [Ljava/lang/annotation/Annotation;
    .param p4, "mediaType"    # Ljavax/ws/rs/core/MediaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            "[",
            "Ljava/lang/annotation/Annotation;",
            "Ljavax/ws/rs/core/MediaType;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 281
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p4}, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->hasMatchingMediaType(Ljavax/ws/rs/core/MediaType;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 282
    const/4 v0, 0x0

    .line 285
    :goto_7
    return v0

    :cond_8
    invoke-virtual {p0, p1, p3}, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->isValidType(Ljava/lang/Class;[Ljava/lang/annotation/Annotation;)Z

    move-result v0

    goto :goto_7
.end method

.method protected isValidType(Ljava/lang/Class;[Ljava/lang/annotation/Annotation;)Z
    .registers 9
    .param p2, "classAnnotations"    # [Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/annotation/Annotation;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 156
    if-nez p1, :cond_5

    .line 169
    :cond_4
    :goto_4
    return v1

    .line 159
    :cond_5
    iget-object v3, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->clazzes:[Ljava/lang/Class;

    if-eqz v3, :cond_18

    .line 160
    iget-object v4, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->clazzes:[Ljava/lang/Class;

    array-length v5, v4

    move v3, v1

    :goto_d
    if-ge v3, v5, :cond_4

    aget-object v0, v4, v3

    .line 162
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-ne v0, p1, :cond_15

    move v1, v2

    .line 163
    goto :goto_4

    .line 160
    :cond_15
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_18
    move v1, v2

    .line 169
    goto :goto_4
.end method

.method public isWriteable(Ljava/lang/Class;Ljava/lang/reflect/Type;[Ljava/lang/annotation/Annotation;Ljavax/ws/rs/core/MediaType;)Z
    .registers 6
    .param p2, "genericType"    # Ljava/lang/reflect/Type;
    .param p3, "annotations"    # [Ljava/lang/annotation/Annotation;
    .param p4, "mediaType"    # Ljavax/ws/rs/core/MediaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            "[",
            "Ljava/lang/annotation/Annotation;",
            "Ljavax/ws/rs/core/MediaType;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 208
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p4}, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->hasMatchingMediaType(Ljavax/ws/rs/core/MediaType;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 209
    const/4 v0, 0x0

    .line 212
    :goto_7
    return v0

    :cond_8
    invoke-virtual {p0, p1, p3}, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->isValidType(Ljava/lang/Class;[Ljava/lang/annotation/Annotation;)Z

    move-result v0

    goto :goto_7
.end method

.method public readFrom(Ljava/lang/Class;Ljava/lang/reflect/Type;[Ljava/lang/annotation/Annotation;Ljavax/ws/rs/core/MediaType;Ljavax/ws/rs/core/MultivaluedMap;Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 9
    .param p2, "genericType"    # Ljava/lang/reflect/Type;
    .param p3, "annotations"    # [Ljava/lang/annotation/Annotation;
    .param p4, "mediaType"    # Ljavax/ws/rs/core/MediaType;
    .param p6, "entityStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/reflect/Type;",
            "[",
            "Ljava/lang/annotation/Annotation;",
            "Ljavax/ws/rs/core/MediaType;",
            "Ljavax/ws/rs/core/MultivaluedMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/io/InputStream;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/ws/rs/WebApplicationException;
        }
    .end annotation

    .prologue
    .line 297
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Object;>;"
    .local p5, "httpHeaders":Ljavax/ws/rs/core/MultivaluedMap;, "Ljavax/ws/rs/core/MultivaluedMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    iget-object v1, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getFeatures()[Lcom/alibaba/fastjson/parser/Feature;

    move-result-object v1

    invoke-static {p6, v0, p2, v1}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/io/InputStream;Ljava/nio/charset/Charset;Ljava/lang/reflect/Type;[Lcom/alibaba/fastjson/parser/Feature;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setCharset(Ljava/nio/charset/Charset;)V
    .registers 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 114
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->setCharset(Ljava/nio/charset/Charset;)V

    .line 115
    return-void
.end method

.method public setDateFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "dateFormat"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 124
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->setDateFormat(Ljava/lang/String;)V

    .line 125
    return-void
.end method

.method public setFastJsonConfig(Lcom/alibaba/fastjson/support/config/FastJsonConfig;)V
    .registers 2
    .param p1, "fastJsonConfig"    # Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 83
    return-void
.end method

.method public varargs setFeatures([Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .registers 3
    .param p1, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 134
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->setSerializerFeatures([Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 135
    return-void
.end method

.method public varargs setFilters([Lcom/alibaba/fastjson/serializer/SerializeFilter;)V
    .registers 3
    .param p1, "filters"    # [Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 144
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->setSerializeFilters([Lcom/alibaba/fastjson/serializer/SerializeFilter;)V

    .line 145
    return-void
.end method

.method public writeTo(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/reflect/Type;[Ljava/lang/annotation/Annotation;Ljavax/ws/rs/core/MediaType;Ljavax/ws/rs/core/MultivaluedMap;Ljava/io/OutputStream;)V
    .registers 18
    .param p1, "obj"    # Ljava/lang/Object;
    .param p3, "genericType"    # Ljava/lang/reflect/Type;
    .param p4, "annotations"    # [Ljava/lang/annotation/Annotation;
    .param p5, "mediaType"    # Ljavax/ws/rs/core/MediaType;
    .param p7, "entityStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            "[",
            "Ljava/lang/annotation/Annotation;",
            "Ljavax/ws/rs/core/MediaType;",
            "Ljavax/ws/rs/core/MultivaluedMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/ws/rs/WebApplicationException;
        }
    .end annotation

    .prologue
    .line 239
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p6, "httpHeaders":Ljavax/ws/rs/core/MultivaluedMap;, "Ljavax/ws/rs/core/MultivaluedMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getSerializerFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v9

    .line 240
    .local v9, "serializerFeatures":[Lcom/alibaba/fastjson/serializer/SerializerFeature;
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->uriInfo:Ljavax/ws/rs/core/UriInfo;

    if-eqz v0, :cond_27

    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->uriInfo:Ljavax/ws/rs/core/UriInfo;

    .line 241
    invoke-interface {v0}, Ljavax/ws/rs/core/UriInfo;->getQueryParameters()Ljavax/ws/rs/core/MultivaluedMap;

    move-result-object v0

    const-string v1, "pretty"

    invoke-interface {v0, v1}, Ljavax/ws/rs/core/MultivaluedMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 242
    if-nez v9, :cond_51

    .line 243
    const/4 v0, 0x1

    new-array v9, v0, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .end local v9    # "serializerFeatures":[Lcom/alibaba/fastjson/serializer/SerializerFeature;
    const/4 v0, 0x0

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    aput-object v1, v9, v0

    .line 250
    .restart local v9    # "serializerFeatures":[Lcom/alibaba/fastjson/serializer/SerializerFeature;
    :goto_22
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->setSerializerFeatures([Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 253
    :cond_27
    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 254
    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 256
    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getSerializeConfig()Lcom/alibaba/fastjson/serializer/SerializeConfig;

    move-result-object v3

    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 257
    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getSerializeFilters()[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    move-result-object v4

    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 258
    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getDateFormat()Ljava/lang/String;

    move-result-object v5

    sget v6, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    iget-object v0, p0, Lcom/alibaba/fastjson/support/jaxrs/FastJsonProvider;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 260
    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getSerializerFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v7

    move-object/from16 v0, p7

    move-object v2, p1

    .line 253
    invoke-static/range {v0 .. v7}, Lcom/alibaba/fastjson/JSON;->writeJSONString(Ljava/io/OutputStream;Ljava/nio/charset/Charset;Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    .line 262
    invoke-virtual/range {p7 .. p7}, Ljava/io/OutputStream;->flush()V

    .line 264
    return-void

    .line 245
    :cond_51
    new-instance v8, Ljava/util/ArrayList;

    .line 246
    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 247
    .local v8, "featureList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/SerializerFeature;>;"
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    invoke-interface {v8, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "serializerFeatures":[Lcom/alibaba/fastjson/serializer/SerializerFeature;
    check-cast v9, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .restart local v9    # "serializerFeatures":[Lcom/alibaba/fastjson/serializer/SerializerFeature;
    goto :goto_22
.end method
