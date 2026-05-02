.class public Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;
.super Lorg/springframework/web/servlet/view/AbstractView;
.source "FastJsonJsonView.java"


# static fields
.field public static final DEFAULT_CONTENT_TYPE:Ljava/lang/String; = "application/json;charset=UTF-8"


# instance fields
.field protected charset:Ljava/nio/charset/Charset;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected dateFormat:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private disableCaching:Z

.field private extractValueFromSingleKeyModel:Z

.field private fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

.field protected features:[Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected filters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private renderedAttributes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private updateContentLength:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 69
    invoke-direct {p0}, Lorg/springframework/web/servlet/view/AbstractView;-><init>()V

    .line 39
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->charset:Ljava/nio/charset/Charset;

    .line 42
    new-array v0, v1, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->features:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 45
    new-array v0, v1, [Lcom/alibaba/fastjson/serializer/SerializeFilter;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->filters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    .line 55
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->disableCaching:Z

    .line 58
    iput-boolean v1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->updateContentLength:Z

    .line 61
    iput-boolean v1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->extractValueFromSingleKeyModel:Z

    .line 64
    new-instance v0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-direct {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 71
    const-string v0, "application/json;charset=UTF-8"

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->setContentType(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->setExposePathVariables(Z)V

    .line 73
    return-void
.end method


# virtual methods
.method protected filterModel(Ljava/util/Map;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 237
    .local p1, "model":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v2, Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    .line 238
    .local v2, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v3, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->renderedAttributes:Ljava/util/Set;

    invoke-static {v3}, Lorg/springframework/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_45

    iget-object v1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->renderedAttributes:Ljava/util/Set;

    .line 242
    .local v1, "renderedAttributes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :goto_13
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1b
    :goto_1b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 243
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Lorg/springframework/validation/BindingResult;

    if-nez v4, :cond_1b

    .line 244
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 245
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1b

    .line 240
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "renderedAttributes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_45
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    goto :goto_13

    .line 248
    .restart local v1    # "renderedAttributes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_4a
    iget-boolean v3, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->extractValueFromSingleKeyModel:Z

    if-eqz v3, :cond_6d

    .line 249
    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_6d

    .line 250
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 251
    .restart local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 255
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_6d
    return-object v2
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    return-object v0
.end method

.method public getDateFormat()Ljava/lang/String;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getDateFormat()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFastJsonConfig()Lcom/alibaba/fastjson/support/config/FastJsonConfig;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    return-object v0
.end method

.method public getFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getSerializerFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v0

    return-object v0
.end method

.method public getFilters()[Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getSerializeFilters()[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    move-result-object v0

    return-object v0
.end method

.method public isExtractValueFromSingleKeyModel()Z
    .registers 2

    .prologue
    .line 153
    iget-boolean v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->extractValueFromSingleKeyModel:Z

    return v0
.end method

.method protected prepareResponse(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 6
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;

    .prologue
    .line 194
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->setResponseContentType(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 195
    iget-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Ljavax/servlet/http/HttpServletResponse;->setCharacterEncoding(Ljava/lang/String;)V

    .line 196
    iget-boolean v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->disableCaching:Z

    if-eqz v0, :cond_29

    .line 197
    const-string v0, "Pragma"

    const-string v1, "no-cache"

    invoke-interface {p2, v0, v1}, Ljavax/servlet/http/HttpServletResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    const-string v0, "Cache-Control"

    const-string v1, "no-cache, no-store, max-age=0"

    invoke-interface {p2, v0, v1}, Ljavax/servlet/http/HttpServletResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    const-string v0, "Expires"

    const-wide/16 v1, 0x1

    invoke-interface {p2, v0, v1, v2}, Ljavax/servlet/http/HttpServletResponse;->addDateHeader(Ljava/lang/String;J)V

    .line 201
    :cond_29
    return-void
.end method

.method protected renderMergedOutputModel(Ljava/util/Map;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 12
    .param p2, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p3, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljavax/servlet/http/HttpServletRequest;",
            "Ljavax/servlet/http/HttpServletResponse;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 171
    .local p1, "model":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->filterModel(Ljava/util/Map;)Ljava/lang/Object;

    move-result-object v2

    .line 172
    .local v2, "value":Ljava/lang/Object;
    iget-boolean v1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->updateContentLength:Z

    if-eqz v1, :cond_3c

    invoke-virtual {p0}, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->createTemporaryOutputStream()Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 174
    .local v0, "stream":Ljava/io/OutputStream;
    :goto_c
    iget-object v1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 175
    invoke-virtual {v1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    iget-object v3, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 177
    invoke-virtual {v3}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getSerializeConfig()Lcom/alibaba/fastjson/serializer/SerializeConfig;

    move-result-object v3

    iget-object v4, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 178
    invoke-virtual {v4}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getSerializeFilters()[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    move-result-object v4

    iget-object v5, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 179
    invoke-virtual {v5}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getDateFormat()Ljava/lang/String;

    move-result-object v5

    sget v6, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    iget-object v7, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 181
    invoke-virtual {v7}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->getSerializerFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v7

    .line 174
    invoke-static/range {v0 .. v7}, Lcom/alibaba/fastjson/JSON;->writeJSONString(Ljava/io/OutputStream;Ljava/nio/charset/Charset;Ljava/lang/Object;Lcom/alibaba/fastjson/serializer/SerializeConfig;[Lcom/alibaba/fastjson/serializer/SerializeFilter;Ljava/lang/String;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    .line 183
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 185
    iget-boolean v1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->updateContentLength:Z

    if-eqz v1, :cond_3b

    .line 186
    check-cast v0, Ljava/io/ByteArrayOutputStream;

    .end local v0    # "stream":Ljava/io/OutputStream;
    invoke-virtual {p0, p3, v0}, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->writeToResponse(Ljavax/servlet/http/HttpServletResponse;Ljava/io/ByteArrayOutputStream;)V

    .line 188
    :cond_3b
    return-void

    .line 173
    :cond_3c
    invoke-interface {p3}, Ljavax/servlet/http/HttpServletResponse;->getOutputStream()Ljavax/servlet/ServletOutputStream;

    move-result-object v0

    goto :goto_c
.end method

.method public setCharset(Ljava/nio/charset/Charset;)V
    .registers 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->setCharset(Ljava/nio/charset/Charset;)V

    .line 106
    return-void
.end method

.method public setDateFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "dateFormat"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->setDateFormat(Ljava/lang/String;)V

    .line 116
    return-void
.end method

.method public setDisableCaching(Z)V
    .registers 2
    .param p1, "disableCaching"    # Z

    .prologue
    .line 210
    iput-boolean p1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->disableCaching:Z

    .line 211
    return-void
.end method

.method public setExtractValueFromSingleKeyModel(Z)V
    .registers 2
    .param p1, "extractValueFromSingleKeyModel"    # Z

    .prologue
    .line 163
    iput-boolean p1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->extractValueFromSingleKeyModel:Z

    .line 164
    return-void
.end method

.method public setFastJsonConfig(Lcom/alibaba/fastjson/support/config/FastJsonConfig;)V
    .registers 2
    .param p1, "fastJsonConfig"    # Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    .line 91
    return-void
.end method

.method public varargs setFeatures([Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .registers 3
    .param p1, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->setSerializerFeatures([Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 126
    return-void
.end method

.method public varargs setFilters([Lcom/alibaba/fastjson/serializer/SerializeFilter;)V
    .registers 3
    .param p1, "filters"    # [Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->setSerializeFilters([Lcom/alibaba/fastjson/serializer/SerializeFilter;)V

    .line 136
    return-void
.end method

.method public setRenderedAttributes(Ljava/util/Set;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 144
    .local p1, "renderedAttributes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->renderedAttributes:Ljava/util/Set;

    .line 145
    return-void
.end method

.method public varargs setSerializerFeature([Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .registers 3
    .param p1, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 95
    iget-object v0, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->fastJsonConfig:Lcom/alibaba/fastjson/support/config/FastJsonConfig;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->setSerializerFeatures([Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 96
    return-void
.end method

.method public setUpdateContentLength(Z)V
    .registers 2
    .param p1, "updateContentLength"    # Z

    .prologue
    .line 221
    iput-boolean p1, p0, Lcom/alibaba/fastjson/support/spring/FastJsonJsonView;->updateContentLength:Z

    .line 222
    return-void
.end method
