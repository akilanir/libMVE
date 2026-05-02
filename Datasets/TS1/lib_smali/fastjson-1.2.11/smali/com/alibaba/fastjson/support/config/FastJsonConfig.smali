.class public Lcom/alibaba/fastjson/support/config/FastJsonConfig;
.super Ljava/lang/Object;
.source "FastJsonConfig.java"


# instance fields
.field private charset:Ljava/nio/charset/Charset;

.field private classSerializeFilters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/serializer/SerializeFilter;",
            ">;"
        }
    .end annotation
.end field

.field private dateFormat:Ljava/lang/String;

.field private features:[Lcom/alibaba/fastjson/parser/Feature;

.field private parserConfig:Lcom/alibaba/fastjson/parser/ParserConfig;

.field private serializeConfig:Lcom/alibaba/fastjson/serializer/SerializeConfig;

.field private serializeFilters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;

.field private serializerFeatures:[Lcom/alibaba/fastjson/serializer/SerializerFeature;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->charset:Ljava/nio/charset/Charset;

    .line 61
    invoke-static {}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->getGlobalInstance()Lcom/alibaba/fastjson/serializer/SerializeConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->serializeConfig:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    .line 62
    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->parserConfig:Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 64
    new-array v0, v1, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->serializerFeatures:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 65
    new-array v0, v1, [Lcom/alibaba/fastjson/serializer/SerializeFilter;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->serializeFilters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    .line 66
    new-array v0, v1, [Lcom/alibaba/fastjson/parser/Feature;

    iput-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->features:[Lcom/alibaba/fastjson/parser/Feature;

    .line 67
    return-void
.end method


# virtual methods
.method public getCharset()Ljava/nio/charset/Charset;
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getClassSerializeFilters()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/serializer/SerializeFilter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 143
    iget-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->classSerializeFilters:Ljava/util/Map;

    return-object v0
.end method

.method public getDateFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->dateFormat:Ljava/lang/String;

    return-object v0
.end method

.method public getFeatures()[Lcom/alibaba/fastjson/parser/Feature;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->features:[Lcom/alibaba/fastjson/parser/Feature;

    return-object v0
.end method

.method public getParserConfig()Lcom/alibaba/fastjson/parser/ParserConfig;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->parserConfig:Lcom/alibaba/fastjson/parser/ParserConfig;

    return-object v0
.end method

.method public getSerializeConfig()Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->serializeConfig:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    return-object v0
.end method

.method public getSerializeFilters()[Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->serializeFilters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    return-object v0
.end method

.method public getSerializerFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->serializerFeatures:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    return-object v0
.end method

.method public setCharset(Ljava/nio/charset/Charset;)V
    .registers 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 187
    iput-object p1, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->charset:Ljava/nio/charset/Charset;

    .line 188
    return-void
.end method

.method public setClassSerializeFilters(Ljava/util/Map;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/serializer/SerializeFilter;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 152
    .local p1, "classSerializeFilters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lcom/alibaba/fastjson/serializer/SerializeFilter;>;"
    if-nez p1, :cond_3

    .line 160
    :goto_2
    return-void

    .line 155
    :cond_3
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_29

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 157
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Lcom/alibaba/fastjson/serializer/SerializeFilter;>;"
    iget-object v4, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->serializeConfig:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/alibaba/fastjson/serializer/SerializeFilter;

    invoke-virtual {v4, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->addFilter(Ljava/lang/Class;Lcom/alibaba/fastjson/serializer/SerializeFilter;)V

    goto :goto_b

    .line 159
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Lcom/alibaba/fastjson/serializer/SerializeFilter;>;"
    :cond_29
    iput-object p1, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->classSerializeFilters:Ljava/util/Map;

    goto :goto_2
.end method

.method public setDateFormat(Ljava/lang/String;)V
    .registers 2
    .param p1, "dateFormat"    # Ljava/lang/String;

    .prologue
    .line 173
    iput-object p1, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->dateFormat:Ljava/lang/String;

    .line 174
    return-void
.end method

.method public varargs setFeatures([Lcom/alibaba/fastjson/parser/Feature;)V
    .registers 2
    .param p1, "features"    # [Lcom/alibaba/fastjson/parser/Feature;

    .prologue
    .line 136
    iput-object p1, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->features:[Lcom/alibaba/fastjson/parser/Feature;

    .line 137
    return-void
.end method

.method public setParserConfig(Lcom/alibaba/fastjson/parser/ParserConfig;)V
    .registers 2
    .param p1, "parserConfig"    # Lcom/alibaba/fastjson/parser/ParserConfig;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->parserConfig:Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 95
    return-void
.end method

.method public setSerializeConfig(Lcom/alibaba/fastjson/serializer/SerializeConfig;)V
    .registers 2
    .param p1, "serializeConfig"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->serializeConfig:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    .line 81
    return-void
.end method

.method public varargs setSerializeFilters([Lcom/alibaba/fastjson/serializer/SerializeFilter;)V
    .registers 2
    .param p1, "serializeFilters"    # [Lcom/alibaba/fastjson/serializer/SerializeFilter;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->serializeFilters:[Lcom/alibaba/fastjson/serializer/SerializeFilter;

    .line 123
    return-void
.end method

.method public varargs setSerializerFeatures([Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .registers 2
    .param p1, "serializerFeatures"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/alibaba/fastjson/support/config/FastJsonConfig;->serializerFeatures:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 109
    return-void
.end method
