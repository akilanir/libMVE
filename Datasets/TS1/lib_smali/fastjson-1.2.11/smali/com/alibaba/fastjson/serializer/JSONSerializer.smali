.class public Lcom/alibaba/fastjson/serializer/JSONSerializer;
.super Lcom/alibaba/fastjson/serializer/SerializeFilterable;
.source "JSONSerializer.java"


# instance fields
.field private final config:Lcom/alibaba/fastjson/serializer/SerializeConfig;

.field protected context:Lcom/alibaba/fastjson/serializer/SerialContext;

.field private dateFormat:Ljava/text/DateFormat;

.field private dateFormatPattern:Ljava/lang/String;

.field private indent:Ljava/lang/String;

.field private indentCount:I

.field protected locale:Ljava/util/Locale;

.field public final out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

.field protected references:Ljava/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/IdentityHashMap",
            "<",
            "Ljava/lang/Object;",
            "Lcom/alibaba/fastjson/serializer/SerialContext;",
            ">;"
        }
    .end annotation
.end field

.field protected timeZone:Ljava/util/TimeZone;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 54
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>()V

    invoke-static {}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->getGlobalInstance()Lcom/alibaba/fastjson/serializer/SerializeConfig;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;Lcom/alibaba/fastjson/serializer/SerializeConfig;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Lcom/alibaba/fastjson/serializer/SerializeConfig;)V
    .registers 3
    .param p1, "config"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;

    .prologue
    .line 62
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>()V

    invoke-direct {p0, v0, p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;Lcom/alibaba/fastjson/serializer/SerializeConfig;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;)V
    .registers 3
    .param p1, "out"    # Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .prologue
    .line 58
    invoke-static {}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->getGlobalInstance()Lcom/alibaba/fastjson/serializer/SerializeConfig;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;Lcom/alibaba/fastjson/serializer/SerializeConfig;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;Lcom/alibaba/fastjson/serializer/SerializeConfig;)V
    .registers 4
    .param p1, "out"    # Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .param p2, "config"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->indentCount:I

    .line 42
    const-string v0, "\t"

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->indent:Ljava/lang/String;

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->references:Ljava/util/IdentityHashMap;

    .line 50
    sget-object v0, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->timeZone:Ljava/util/TimeZone;

    .line 51
    sget-object v0, Lcom/alibaba/fastjson/JSON;->defaultLocale:Ljava/util/Locale;

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->locale:Ljava/util/Locale;

    .line 66
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 67
    iput-object p2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->config:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    .line 68
    return-void
.end method

.method public static write(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/lang/Object;)V
    .registers 3
    .param p0, "out"    # Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 252
    new-instance v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;)V

    .line 253
    .local v0, "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 254
    return-void
.end method

.method public static write(Ljava/io/Writer;Ljava/lang/Object;)V
    .registers 7
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 239
    new-instance v2, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-direct {v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>()V

    .line 241
    .local v2, "writer":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_start_5
    new-instance v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;)V

    .line 242
    .local v1, "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    invoke-virtual {v1, p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 243
    invoke-virtual {v2, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeTo(Ljava/io/Writer;)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_10} :catch_14
    .catchall {:try_start_5 .. :try_end_10} :catchall_1f

    .line 247
    invoke-virtual {v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    .line 249
    return-void

    .line 244
    .end local v1    # "serializer":Lcom/alibaba/fastjson/serializer/JSONSerializer;
    :catch_14
    move-exception v0

    .line 245
    .local v0, "ex":Ljava/io/IOException;
    :try_start_15
    new-instance v3, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_1f
    .catchall {:try_start_15 .. :try_end_1f} :catchall_1f

    .line 247
    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_1f
    move-exception v3

    invoke-virtual {v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    throw v3
.end method


# virtual methods
.method public apply(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z
    .registers 9
    .param p1, "javaBeanDeser"    # Lcom/alibaba/fastjson/serializer/SerializeFilterable;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "propertyValue"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 428
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->propertyFilters:Ljava/util/List;

    if-eqz v2, :cond_1e

    .line 429
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->propertyFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/PropertyFilter;

    .line 430
    .local v0, "propertyFilter":Lcom/alibaba/fastjson/serializer/PropertyFilter;
    invoke-interface {v0, p2, p3, p4}, Lcom/alibaba/fastjson/serializer/PropertyFilter;->apply(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b

    .line 444
    .end local v0    # "propertyFilter":Lcom/alibaba/fastjson/serializer/PropertyFilter;
    :goto_1d
    return v1

    .line 436
    :cond_1e
    iget-object v2, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyFilters:Ljava/util/List;

    if-eqz v2, :cond_3b

    .line 437
    iget-object v2, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_28
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/PropertyFilter;

    .line 438
    .restart local v0    # "propertyFilter":Lcom/alibaba/fastjson/serializer/PropertyFilter;
    invoke-interface {v0, p2, p3, p4}, Lcom/alibaba/fastjson/serializer/PropertyFilter;->apply(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_28

    goto :goto_1d

    .line 444
    .end local v0    # "propertyFilter":Lcom/alibaba/fastjson/serializer/PropertyFilter;
    :cond_3b
    const/4 v1, 0x1

    goto :goto_1d
.end method

.method public applyLabel(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/String;)Z
    .registers 7
    .param p1, "javaBeanDeser"    # Lcom/alibaba/fastjson/serializer/SerializeFilterable;
    .param p2, "label"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 481
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->labelFilters:Ljava/util/List;

    if-eqz v2, :cond_1e

    .line 482
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->labelFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/LabelFilter;

    .line 483
    .local v0, "propertyFilter":Lcom/alibaba/fastjson/serializer/LabelFilter;
    invoke-interface {v0, p2}, Lcom/alibaba/fastjson/serializer/LabelFilter;->apply(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_b

    .line 497
    .end local v0    # "propertyFilter":Lcom/alibaba/fastjson/serializer/LabelFilter;
    :goto_1d
    return v1

    .line 489
    :cond_1e
    iget-object v2, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->labelFilters:Ljava/util/List;

    if-eqz v2, :cond_3b

    .line 490
    iget-object v2, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->labelFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_28
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/LabelFilter;

    .line 491
    .restart local v0    # "propertyFilter":Lcom/alibaba/fastjson/serializer/LabelFilter;
    invoke-interface {v0, p2}, Lcom/alibaba/fastjson/serializer/LabelFilter;->apply(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_28

    goto :goto_1d

    .line 497
    .end local v0    # "propertyFilter":Lcom/alibaba/fastjson/serializer/LabelFilter;
    :cond_3b
    const/4 v1, 0x1

    goto :goto_1d
.end method

.method public applyName(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 8
    .param p1, "javaBeanDeser"    # Lcom/alibaba/fastjson/serializer/SerializeFilterable;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "key"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 406
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->propertyPreFilters:Ljava/util/List;

    if-eqz v2, :cond_1e

    .line 407
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->propertyPreFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/PropertyPreFilter;

    .line 408
    .local v0, "filter":Lcom/alibaba/fastjson/serializer/PropertyPreFilter;
    invoke-interface {v0, p0, p2, p3}, Lcom/alibaba/fastjson/serializer/PropertyPreFilter;->apply(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_b

    .line 422
    .end local v0    # "filter":Lcom/alibaba/fastjson/serializer/PropertyPreFilter;
    :goto_1d
    return v1

    .line 414
    :cond_1e
    iget-object v2, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyPreFilters:Ljava/util/List;

    if-eqz v2, :cond_3b

    .line 415
    iget-object v2, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->propertyPreFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_28
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/PropertyPreFilter;

    .line 416
    .restart local v0    # "filter":Lcom/alibaba/fastjson/serializer/PropertyPreFilter;
    invoke-interface {v0, p0, p2, p3}, Lcom/alibaba/fastjson/serializer/PropertyPreFilter;->apply(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_28

    goto :goto_1d

    .line 422
    .end local v0    # "filter":Lcom/alibaba/fastjson/serializer/PropertyPreFilter;
    :cond_3b
    const/4 v1, 0x1

    goto :goto_1d
.end method

.method public checkValue(Lcom/alibaba/fastjson/serializer/SerializeFilterable;)Z
    .registers 3
    .param p1, "filterable"    # Lcom/alibaba/fastjson/serializer/SerializeFilterable;

    .prologue
    .line 183
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->valueFilters:Ljava/util/List;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->valueFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_36

    :cond_c
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->contextValueFilters:Ljava/util/List;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->contextValueFilters:Ljava/util/List;

    .line 184
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_36

    :cond_18
    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->valueFilters:Ljava/util/List;

    if-eqz v0, :cond_24

    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->valueFilters:Ljava/util/List;

    .line 185
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_36

    :cond_24
    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->contextValueFilters:Ljava/util/List;

    if-eqz v0, :cond_30

    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->contextValueFilters:Ljava/util/List;

    .line 186
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_36

    :cond_30
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    iget-boolean v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNonStringValueAsString:Z

    if-eqz v0, :cond_38

    :cond_36
    const/4 v0, 0x1

    :goto_37
    return v0

    :cond_38
    const/4 v0, 0x0

    goto :goto_37
.end method

.method public close()V
    .registers 2

    .prologue
    .line 324
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    .line 325
    return-void
.end method

.method public config(Lcom/alibaba/fastjson/serializer/SerializerFeature;Z)V
    .registers 4
    .param p1, "feature"    # Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .param p2, "state"    # Z

    .prologue
    .line 223
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0, p1, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->config(Lcom/alibaba/fastjson/serializer/SerializerFeature;Z)V

    .line 224
    return-void
.end method

.method public containsReference(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->references:Ljava/util/IdentityHashMap;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->references:Ljava/util/IdentityHashMap;

    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public decrementIdent()V
    .registers 2

    .prologue
    .line 204
    iget v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->indentCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->indentCount:I

    .line 205
    return-void
.end method

.method public getContext()Lcom/alibaba/fastjson/serializer/SerialContext;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    return-object v0
.end method

.method public getDateFormat()Ljava/text/DateFormat;
    .registers 4

    .prologue
    .line 78
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormat:Ljava/text/DateFormat;

    if-nez v0, :cond_1a

    .line 79
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormatPattern:Ljava/lang/String;

    if-eqz v0, :cond_1a

    .line 80
    new-instance v0, Ljava/text/SimpleDateFormat;

    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormatPattern:Ljava/lang/String;

    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->locale:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormat:Ljava/text/DateFormat;

    .line 81
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormat:Ljava/text/DateFormat;

    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 85
    :cond_1a
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormat:Ljava/text/DateFormat;

    return-object v0
.end method

.method public getDateFormatPattern()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormat:Ljava/text/DateFormat;

    instance-of v0, v0, Ljava/text/SimpleDateFormat;

    if-eqz v0, :cond_f

    .line 72
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormat:Ljava/text/DateFormat;

    check-cast v0, Ljava/text/SimpleDateFormat;

    invoke-virtual {v0}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v0

    .line 74
    :goto_e
    return-object v0

    :cond_f
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormatPattern:Ljava/lang/String;

    goto :goto_e
.end method

.method public getFieldInfo()Lcom/alibaba/fastjson/util/FieldInfo;
    .registers 2

    .prologue
    .line 339
    const/4 v0, 0x0

    return-object v0
.end method

.method public getIndentCount()I
    .registers 2

    .prologue
    .line 196
    iget v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->indentCount:I

    return v0
.end method

.method public getMapping()Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .registers 2

    .prologue
    .line 235
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->config:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    return-object v0
.end method

.method public getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/alibaba/fastjson/serializer/ObjectSerializer;"
        }
    .end annotation

    .prologue
    .line 320
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->config:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v0

    return-object v0
.end method

.method public getWriter()Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .registers 2

    .prologue
    .line 215
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    return-object v0
.end method

.method public hasNameFilters(Lcom/alibaba/fastjson/serializer/SerializeFilterable;)Z
    .registers 3
    .param p1, "filterable"    # Lcom/alibaba/fastjson/serializer/SerializeFilterable;

    .prologue
    .line 191
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->nameFilters:Ljava/util/List;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->nameFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_18

    :cond_c
    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->nameFilters:Ljava/util/List;

    if-eqz v0, :cond_1a

    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->nameFilters:Ljava/util/List;

    .line 192
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public incrementIndent()V
    .registers 2

    .prologue
    .line 200
    iget v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->indentCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->indentCount:I

    .line 201
    return-void
.end method

.method public isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z
    .registers 3
    .param p1, "feature"    # Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 227
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0

    return v0
.end method

.method public final isWriteClassName(Ljava/lang/reflect/Type;Ljava/lang/Object;)Z
    .registers 5
    .param p1, "fieldType"    # Ljava/lang/reflect/Type;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0

    if-eqz v0, :cond_1e

    if-nez p1, :cond_1c

    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->NotWriteRootClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 139
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerialContext;->parent:Lcom/alibaba/fastjson/serializer/SerialContext;

    if-eqz v0, :cond_1e

    :cond_1c
    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method public popContext()V
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    if-eqz v0, :cond_a

    .line 132
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerialContext;->parent:Lcom/alibaba/fastjson/serializer/SerialContext;

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 134
    :cond_a
    return-void
.end method

.method public println()V
    .registers 4

    .prologue
    .line 208
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 209
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    iget v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->indentCount:I

    if-ge v0, v1, :cond_16

    .line 210
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->indent:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 209
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 212
    :cond_16
    return-void
.end method

.method public processKey(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .registers 8
    .param p1, "javaBeanDeser"    # Lcom/alibaba/fastjson/serializer/SerializeFilterable;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "propertyValue"    # Ljava/lang/Object;

    .prologue
    .line 388
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->nameFilters:Ljava/util/List;

    if-eqz v1, :cond_1b

    .line 389
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->nameFilters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/NameFilter;

    .line 390
    .local v0, "nameFilter":Lcom/alibaba/fastjson/serializer/NameFilter;
    invoke-interface {v0, p2, p3, p4}, Lcom/alibaba/fastjson/serializer/NameFilter;->process(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    .line 391
    goto :goto_a

    .line 394
    .end local v0    # "nameFilter":Lcom/alibaba/fastjson/serializer/NameFilter;
    :cond_1b
    iget-object v1, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->nameFilters:Ljava/util/List;

    if-eqz v1, :cond_36

    .line 395
    iget-object v1, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->nameFilters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_25
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/NameFilter;

    .line 396
    .restart local v0    # "nameFilter":Lcom/alibaba/fastjson/serializer/NameFilter;
    invoke-interface {v0, p2, p3, p4}, Lcom/alibaba/fastjson/serializer/NameFilter;->process(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    .line 397
    goto :goto_25

    .line 400
    .end local v0    # "nameFilter":Lcom/alibaba/fastjson/serializer/NameFilter;
    :cond_36
    return-object p3
.end method

.method public processValue(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Lcom/alibaba/fastjson/serializer/BeanContext;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "javaBeanDeser"    # Lcom/alibaba/fastjson/serializer/SerializeFilterable;
    .param p2, "beanContext"    # Lcom/alibaba/fastjson/serializer/BeanContext;
    .param p3, "object"    # Ljava/lang/Object;
    .param p4, "key"    # Ljava/lang/String;
    .param p5, "propertyValue"    # Ljava/lang/Object;

    .prologue
    .line 348
    if-eqz p5, :cond_14

    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    iget-boolean v2, v2, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNonStringValueAsString:Z

    if-eqz v2, :cond_14

    .line 350
    instance-of v2, p5, Ljava/lang/Number;

    if-nez v2, :cond_10

    instance-of v2, p5, Ljava/lang/Boolean;

    if-eqz v2, :cond_14

    .line 351
    :cond_10
    invoke-virtual {p5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p5

    .line 355
    .end local p5    # "propertyValue":Ljava/lang/Object;
    :cond_14
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->valueFilters:Ljava/util/List;

    .line 356
    .local v1, "valueFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/ValueFilter;>;"
    if-eqz v1, :cond_2d

    .line 357
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/ValueFilter;

    .line 358
    .local v0, "valueFilter":Lcom/alibaba/fastjson/serializer/ValueFilter;
    invoke-interface {v0, p3, p4, p5}, Lcom/alibaba/fastjson/serializer/ValueFilter;->process(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    .line 359
    .restart local p5    # "propertyValue":Ljava/lang/Object;
    goto :goto_1c

    .line 362
    .end local v0    # "valueFilter":Lcom/alibaba/fastjson/serializer/ValueFilter;
    .end local p5    # "propertyValue":Ljava/lang/Object;
    :cond_2d
    iget-object v2, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->valueFilters:Ljava/util/List;

    if-eqz v2, :cond_48

    .line 363
    iget-object v2, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->valueFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_37
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_48

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/ValueFilter;

    .line 364
    .restart local v0    # "valueFilter":Lcom/alibaba/fastjson/serializer/ValueFilter;
    invoke-interface {v0, p3, p4, p5}, Lcom/alibaba/fastjson/serializer/ValueFilter;->process(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    .line 365
    .restart local p5    # "propertyValue":Ljava/lang/Object;
    goto :goto_37

    .line 368
    .end local v0    # "valueFilter":Lcom/alibaba/fastjson/serializer/ValueFilter;
    .end local p5    # "propertyValue":Ljava/lang/Object;
    :cond_48
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->contextValueFilters:Ljava/util/List;

    if-eqz v2, :cond_63

    .line 369
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->contextValueFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_52
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_63

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/ContextValueFilter;

    .line 370
    .local v0, "valueFilter":Lcom/alibaba/fastjson/serializer/ContextValueFilter;
    invoke-interface {v0, p2, p3, p4, p5}, Lcom/alibaba/fastjson/serializer/ContextValueFilter;->process(Lcom/alibaba/fastjson/serializer/BeanContext;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    .line 371
    .restart local p5    # "propertyValue":Ljava/lang/Object;
    goto :goto_52

    .line 374
    .end local v0    # "valueFilter":Lcom/alibaba/fastjson/serializer/ContextValueFilter;
    .end local p5    # "propertyValue":Ljava/lang/Object;
    :cond_63
    iget-object v2, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->contextValueFilters:Ljava/util/List;

    if-eqz v2, :cond_7e

    .line 375
    iget-object v2, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->contextValueFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_6d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/ContextValueFilter;

    .line 376
    .restart local v0    # "valueFilter":Lcom/alibaba/fastjson/serializer/ContextValueFilter;
    invoke-interface {v0, p2, p3, p4, p5}, Lcom/alibaba/fastjson/serializer/ContextValueFilter;->process(Lcom/alibaba/fastjson/serializer/BeanContext;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    .line 377
    .restart local p5    # "propertyValue":Ljava/lang/Object;
    goto :goto_6d

    .line 380
    .end local v0    # "valueFilter":Lcom/alibaba/fastjson/serializer/ContextValueFilter;
    .end local p5    # "propertyValue":Ljava/lang/Object;
    :cond_7e
    return-object p5
.end method

.method public setContext(Lcom/alibaba/fastjson/serializer/SerialContext;)V
    .registers 2
    .param p1, "context"    # Lcom/alibaba/fastjson/serializer/SerialContext;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 108
    return-void
.end method

.method public setContext(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;I)V
    .registers 11
    .param p1, "parent"    # Lcom/alibaba/fastjson/serializer/SerialContext;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "features"    # I

    .prologue
    .line 111
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->setContext(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;II)V

    .line 112
    return-void
.end method

.method public setContext(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;II)V
    .registers 12
    .param p1, "parent"    # Lcom/alibaba/fastjson/serializer/SerialContext;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "features"    # I
    .param p5, "fieldFeatures"    # I

    .prologue
    .line 115
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    iget-boolean v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->disableCircularReferenceDetect:Z

    if-eqz v0, :cond_7

    .line 124
    :goto_6
    return-void

    .line 119
    :cond_7
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerialContext;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/alibaba/fastjson/serializer/SerialContext;-><init>(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 120
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->references:Ljava/util/IdentityHashMap;

    if-nez v0, :cond_1e

    .line 121
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->references:Ljava/util/IdentityHashMap;

    .line 123
    :cond_1e
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->references:Ljava/util/IdentityHashMap;

    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    invoke-virtual {v0, p2, v1}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6
.end method

.method public setContext(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "fieldName"    # Ljava/lang/Object;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, p2, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->setContext(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 128
    return-void
.end method

.method public setDateFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "dateFormat"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormatPattern:Ljava/lang/String;

    .line 97
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormat:Ljava/text/DateFormat;

    if-eqz v0, :cond_9

    .line 98
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormat:Ljava/text/DateFormat;

    .line 100
    :cond_9
    return-void
.end method

.method public setDateFormat(Ljava/text/DateFormat;)V
    .registers 3
    .param p1, "dateFormat"    # Ljava/text/DateFormat;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormat:Ljava/text/DateFormat;

    .line 90
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormatPattern:Ljava/lang/String;

    if-eqz v0, :cond_9

    .line 91
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->dateFormatPattern:Ljava/lang/String;

    .line 93
    :cond_9
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 219
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final write(Ljava/lang/Object;)V
    .registers 10
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 257
    if-nez p1, :cond_8

    .line 258
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 270
    :goto_7
    return-void

    .line 262
    :cond_8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    .line 263
    .local v6, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v0

    .line 266
    .local v0, "writer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    :try_start_15
    invoke-interface/range {v0 .. v5}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_18} :catch_19

    goto :goto_7

    .line 267
    :catch_19
    move-exception v7

    .line 268
    .local v7, "e":Ljava/io/IOException;
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v7}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public final write(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 316
    sget-object v0, Lcom/alibaba/fastjson/serializer/StringCodec;->instance:Lcom/alibaba/fastjson/serializer/StringCodec;

    invoke-virtual {v0, p0, p1}, Lcom/alibaba/fastjson/serializer/StringCodec;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/String;)V

    .line 317
    return-void
.end method

.method public writeAfter(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;C)C
    .registers 7
    .param p1, "javaBeanDeser"    # Lcom/alibaba/fastjson/serializer/SerializeFilterable;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "seperator"    # C

    .prologue
    .line 466
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->afterFilters:Ljava/util/List;

    if-eqz v1, :cond_1b

    .line 467
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->afterFilters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/AfterFilter;

    .line 468
    .local v0, "afterFilter":Lcom/alibaba/fastjson/serializer/AfterFilter;
    invoke-virtual {v0, p0, p2, p3}, Lcom/alibaba/fastjson/serializer/AfterFilter;->writeAfter(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;C)C

    move-result p3

    .line 469
    goto :goto_a

    .line 472
    .end local v0    # "afterFilter":Lcom/alibaba/fastjson/serializer/AfterFilter;
    :cond_1b
    iget-object v1, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->afterFilters:Ljava/util/List;

    if-eqz v1, :cond_36

    .line 473
    iget-object v1, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->afterFilters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_25
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/AfterFilter;

    .line 474
    .restart local v0    # "afterFilter":Lcom/alibaba/fastjson/serializer/AfterFilter;
    invoke-virtual {v0, p0, p2, p3}, Lcom/alibaba/fastjson/serializer/AfterFilter;->writeAfter(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;C)C

    move-result p3

    .line 475
    goto :goto_25

    .line 477
    .end local v0    # "afterFilter":Lcom/alibaba/fastjson/serializer/AfterFilter;
    :cond_36
    return p3
.end method

.method public writeBefore(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;C)C
    .registers 7
    .param p1, "javaBeanDeser"    # Lcom/alibaba/fastjson/serializer/SerializeFilterable;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "seperator"    # C

    .prologue
    .line 449
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->beforeFilters:Ljava/util/List;

    if-eqz v1, :cond_1b

    .line 450
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->beforeFilters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/BeforeFilter;

    .line 451
    .local v0, "beforeFilter":Lcom/alibaba/fastjson/serializer/BeforeFilter;
    invoke-virtual {v0, p0, p2, p3}, Lcom/alibaba/fastjson/serializer/BeforeFilter;->writeBefore(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;C)C

    move-result p3

    .line 452
    goto :goto_a

    .line 455
    .end local v0    # "beforeFilter":Lcom/alibaba/fastjson/serializer/BeforeFilter;
    :cond_1b
    iget-object v1, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->beforeFilters:Ljava/util/List;

    if-eqz v1, :cond_36

    .line 456
    iget-object v1, p1, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->beforeFilters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_25
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/BeforeFilter;

    .line 457
    .restart local v0    # "beforeFilter":Lcom/alibaba/fastjson/serializer/BeforeFilter;
    invoke-virtual {v0, p0, p2, p3}, Lcom/alibaba/fastjson/serializer/BeforeFilter;->writeBefore(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;C)C

    move-result p3

    .line 458
    goto :goto_25

    .line 461
    .end local v0    # "beforeFilter":Lcom/alibaba/fastjson/serializer/BeforeFilter;
    :cond_36
    return p3
.end method

.method public writeDirect(Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;)Z
    .registers 3
    .param p1, "javaBeanDeser"    # Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    .prologue
    .line 333
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    iget-boolean v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeDirect:Z

    if-eqz v0, :cond_10

    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeDirect:Z

    if-eqz v0, :cond_10

    iget-boolean v0, p1, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->writeDirect:Z

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method protected final writeKeyValue(CLjava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "seperator"    # C
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 277
    if-eqz p1, :cond_7

    .line 278
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 280
    :cond_7
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 281
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 282
    return-void
.end method

.method public writeNull()V
    .registers 2

    .prologue
    .line 231
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 232
    return-void
.end method

.method public writeReference(Ljava/lang/Object;)V
    .registers 8
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 148
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 149
    .local v0, "context":Lcom/alibaba/fastjson/serializer/SerialContext;
    iget-object v1, v0, Lcom/alibaba/fastjson/serializer/SerialContext;->object:Ljava/lang/Object;

    .line 151
    .local v1, "current":Ljava/lang/Object;
    if-ne p1, v1, :cond_e

    .line 152
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const-string v5, "{\"$ref\":\"@\"}"

    invoke-virtual {v4, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 180
    :goto_d
    return-void

    .line 156
    :cond_e
    iget-object v2, v0, Lcom/alibaba/fastjson/serializer/SerialContext;->parent:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 158
    .local v2, "parentContext":Lcom/alibaba/fastjson/serializer/SerialContext;
    if-eqz v2, :cond_1e

    .line 159
    iget-object v4, v2, Lcom/alibaba/fastjson/serializer/SerialContext;->object:Ljava/lang/Object;

    if-ne p1, v4, :cond_1e

    .line 160
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const-string v5, "{\"$ref\":\"..\"}"

    invoke-virtual {v4, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_d

    .line 165
    :cond_1e
    move-object v3, v0

    .line 167
    .local v3, "rootContext":Lcom/alibaba/fastjson/serializer/SerialContext;
    :goto_1f
    iget-object v4, v3, Lcom/alibaba/fastjson/serializer/SerialContext;->parent:Lcom/alibaba/fastjson/serializer/SerialContext;

    if-nez v4, :cond_2f

    .line 173
    iget-object v4, v3, Lcom/alibaba/fastjson/serializer/SerialContext;->object:Ljava/lang/Object;

    if-ne p1, v4, :cond_32

    .line 174
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const-string v5, "{\"$ref\":\"$\"}"

    invoke-virtual {v4, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_d

    .line 170
    :cond_2f
    iget-object v3, v3, Lcom/alibaba/fastjson/serializer/SerialContext;->parent:Lcom/alibaba/fastjson/serializer/SerialContext;

    goto :goto_1f

    .line 176
    :cond_32
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const-string v5, "{\"$ref\":\""

    invoke-virtual {v4, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 177
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->references:Ljava/util/IdentityHashMap;

    invoke-virtual {v4, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/alibaba/fastjson/serializer/SerialContext;

    invoke-virtual {v4}, Lcom/alibaba/fastjson/serializer/SerialContext;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 178
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const-string v5, "\"}"

    invoke-virtual {v4, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_d
.end method

.method public final writeWithFieldName(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "fieldName"    # Ljava/lang/Object;

    .prologue
    .line 273
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeWithFieldName(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V

    .line 274
    return-void
.end method

.method public final writeWithFieldName(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 13
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "fieldName"    # Ljava/lang/Object;
    .param p3, "fieldType"    # Ljava/lang/reflect/Type;
    .param p4, "fieldFeatures"    # I

    .prologue
    .line 286
    if-nez p1, :cond_8

    .line 287
    :try_start_2
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 299
    :goto_7
    return-void

    .line 291
    :cond_8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    .line 293
    .local v6, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v0

    .local v0, "writer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    .line 295
    invoke-interface/range {v0 .. v5}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_18} :catch_19

    goto :goto_7

    .line 296
    .end local v0    # "writer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .end local v6    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_19
    move-exception v7

    .line 297
    .local v7, "e":Ljava/io/IOException;
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v7}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public final writeWithFormat(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 6
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "format"    # Ljava/lang/String;

    .prologue
    .line 302
    instance-of v2, p1, Ljava/util/Date;

    if-eqz v2, :cond_22

    .line 303
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getDateFormat()Ljava/text/DateFormat;

    move-result-object v0

    .line 304
    .local v0, "dateFormat":Ljava/text/DateFormat;
    if-nez v0, :cond_16

    .line 305
    new-instance v0, Ljava/text/SimpleDateFormat;

    .end local v0    # "dateFormat":Ljava/text/DateFormat;
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->locale:Ljava/util/Locale;

    invoke-direct {v0, p2, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 306
    .restart local v0    # "dateFormat":Ljava/text/DateFormat;
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 308
    :cond_16
    check-cast p1, Ljava/util/Date;

    .end local p1    # "object":Ljava/lang/Object;
    invoke-virtual {v0, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 309
    .local v1, "text":Ljava/lang/String;
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v2, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 313
    .end local v0    # "dateFormat":Ljava/text/DateFormat;
    .end local v1    # "text":Ljava/lang/String;
    :goto_21
    return-void

    .line 312
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_22
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    goto :goto_21
.end method
