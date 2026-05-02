.class public Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;
.super Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;
.source "BeanDeserializer.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/databind/deser/BeanDeserializer$1;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method protected constructor <init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;)V
    .registers 3
    .param p1, "src"    # Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;

    .prologue
    .line 47
    iget-boolean v0, p1, Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;->_ignoreAllUnknown:Z

    invoke-direct {p0, p1, v0}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;-><init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Z)V

    .line 48
    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;)V
    .registers 3
    .param p1, "src"    # Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;
    .param p2, "oir"    # Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;

    .prologue
    .line 59
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;-><init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;)V

    .line 60
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Lcom/fasterxml/jackson/databind/util/NameTransformer;)V
    .registers 3
    .param p1, "src"    # Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;
    .param p2, "unwrapper"    # Lcom/fasterxml/jackson/databind/util/NameTransformer;

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;-><init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Lcom/fasterxml/jackson/databind/util/NameTransformer;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Ljava/util/HashSet;)V
    .registers 3
    .param p1, "src"    # Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p2, "ignorableProps":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;-><init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Ljava/util/HashSet;)V

    .line 64
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Z)V
    .registers 3
    .param p1, "src"    # Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;
    .param p2, "ignoreAllUnknown"    # Z

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;-><init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Z)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBuilder;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;Ljava/util/Map;Ljava/util/HashSet;ZZ)V
    .registers 8
    .param p1, "builder"    # Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBuilder;
    .param p2, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p3, "properties"    # Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;
    .param p6, "ignoreAllUnknown"    # Z
    .param p7, "hasViews"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBuilder;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;",
            ">;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;ZZ)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p4, "backRefs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;>;"
    .local p5, "ignorableProps":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-direct/range {p0 .. p7}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;-><init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBuilder;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;Ljava/util/Map;Ljava/util/HashSet;ZZ)V

    .line 40
    return-void
.end method

.method private final vanillaDeserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/Object;
    .registers 9
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p3, "t"    # Lcom/fasterxml/jackson/core/JsonToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 230
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    invoke-virtual {v4, p2}, Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;->createUsingDefault(Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    .line 231
    .local v0, "bean":Ljava/lang/Object;
    :goto_6
    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne p3, v4, :cond_2a

    .line 232
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v3

    .line 234
    .local v3, "propName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 235
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanProperties:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    invoke-virtual {v4, v3}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v2

    .line 236
    .local v2, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v2, :cond_26

    .line 238
    :try_start_19
    invoke-virtual {v2, p1, p2, v0}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_1c} :catch_21

    .line 231
    :goto_1c
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object p3

    goto :goto_6

    .line 239
    :catch_21
    move-exception v1

    .line 240
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v1, v0, v3, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_1c

    .line 243
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_26
    invoke-virtual {p0, p1, p2, v0, v3}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleUnknownVanilla(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1c

    .line 246
    .end local v2    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v3    # "propName":Ljava/lang/String;
    :cond_2a
    return-object v0
.end method


# virtual methods
.method protected final _deserializeOther(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/Object;
    .registers 6
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p3, "t"    # Lcom/fasterxml/jackson/core/JsonToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    sget-object v0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer$1;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_4a

    .line 158
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handledType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/databind/DeserializationContext;->mappingException(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v0

    throw v0

    .line 135
    :pswitch_14
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeFromString(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    .line 156
    :goto_18
    return-object v0

    .line 137
    :pswitch_19
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeFromNumber(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_18

    .line 139
    :pswitch_1e
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeFromDouble(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_18

    .line 141
    :pswitch_23
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeFromEmbedded(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_18

    .line 144
    :pswitch_28
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeFromBoolean(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_18

    .line 147
    :pswitch_2d
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeFromArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_18

    .line 150
    :pswitch_32
    iget-boolean v0, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_vanillaProcessing:Z

    if-eqz v0, :cond_3b

    .line 151
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->vanillaDeserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_18

    .line 153
    :cond_3b
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_objectIdReader:Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;

    if-eqz v0, :cond_44

    .line 154
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeWithObjectId(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_18

    .line 156
    :cond_44
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeFromObject(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_18

    .line 133
    nop

    :pswitch_data_4a
    .packed-switch 0x1
        :pswitch_14
        :pswitch_19
        :pswitch_1e
        :pswitch_23
        :pswitch_28
        :pswitch_28
        :pswitch_2d
        :pswitch_32
        :pswitch_32
    .end packed-switch
.end method

.method protected _deserializeUsingPropertyBased(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 15
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 330
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_propertyBasedCreator:Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;

    .line 331
    .local v2, "creator":Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_objectIdReader:Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;

    invoke-virtual {v2, p1, p2, v10}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;->startBuilding(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;)Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;

    move-result-object v1

    .line 334
    .local v1, "buffer":Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;
    const/4 v8, 0x0

    .line 336
    .local v8, "unknown":Lcom/fasterxml/jackson/databind/util/TokenBuffer;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v7

    .line 337
    .local v7, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_d
    sget-object v10, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v7, v10, :cond_a8

    .line 338
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v6

    .line 339
    .local v6, "propName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 341
    invoke-virtual {v2, v6}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;->findCreatorProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v3

    .line 342
    .local v3, "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v3, :cond_5b

    .line 344
    invoke-virtual {v3, p1, p2}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v9

    .line 345
    .local v9, "value":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->getCreatorIndex()I

    move-result v10

    invoke-virtual {v1, v10, v9}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->assignParameter(ILjava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_61

    .line 346
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 349
    :try_start_2f
    invoke-virtual {v2, p2, v1}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;->build(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;)Ljava/lang/Object;
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_32} :catch_44

    move-result-object v0

    .line 355
    :goto_33
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v11}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v11

    if-eq v10, v11, :cond_50

    .line 356
    invoke-virtual {p0, p1, p2, v0, v8}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handlePolymorphic(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/util/TokenBuffer;)Ljava/lang/Object;

    move-result-object v0

    .line 411
    .end local v3    # "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v6    # "propName":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/Object;
    :cond_43
    :goto_43
    return-object v0

    .line 350
    .restart local v3    # "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .restart local v6    # "propName":Ljava/lang/String;
    .restart local v9    # "value":Ljava/lang/Object;
    :catch_44
    move-exception v4

    .line 351
    .local v4, "e":Ljava/lang/Exception;
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v10}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {p0, v4, v10, v6, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    .line 352
    const/4 v0, 0x0

    .local v0, "bean":Ljava/lang/Object;
    goto :goto_33

    .line 358
    .end local v0    # "bean":Ljava/lang/Object;
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_50
    if-eqz v8, :cond_56

    .line 359
    invoke-virtual {p0, p2, v0, v8}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleUnknownProperties(Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/util/TokenBuffer;)Ljava/lang/Object;

    move-result-object v0

    .line 362
    :cond_56
    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_43

    .line 367
    .end local v9    # "value":Ljava/lang/Object;
    :cond_5b
    invoke-virtual {v1, v6}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->readIdProperty(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_66

    .line 337
    :cond_61
    :goto_61
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v7

    goto :goto_d

    .line 371
    :cond_66
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanProperties:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    invoke-virtual {v10, v6}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v5

    .line 372
    .local v5, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v5, :cond_76

    .line 373
    invoke-virtual {v5, p1, p2}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v1, v5, v10}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->bufferProperty(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;Ljava/lang/Object;)V

    goto :goto_61

    .line 378
    :cond_76
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    if-eqz v10, :cond_8a

    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    invoke-virtual {v10, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8a

    .line 379
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handledType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {p0, p1, p2, v10, v6}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleIgnoredProperty(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_61

    .line 383
    :cond_8a
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    if-eqz v10, :cond_9a

    .line 384
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    invoke-virtual {v11, p1, p2}, Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v1, v10, v6, v11}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->bufferAnyProperty(Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_61

    .line 388
    :cond_9a
    if-nez v8, :cond_a1

    .line 389
    new-instance v8, Lcom/fasterxml/jackson/databind/util/TokenBuffer;

    .end local v8    # "unknown":Lcom/fasterxml/jackson/databind/util/TokenBuffer;
    invoke-direct {v8, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;-><init>(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 391
    .restart local v8    # "unknown":Lcom/fasterxml/jackson/databind/util/TokenBuffer;
    :cond_a1
    invoke-virtual {v8, v6}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->writeFieldName(Ljava/lang/String;)V

    .line 392
    invoke-virtual {v8, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->copyCurrentStructure(Lcom/fasterxml/jackson/core/JsonParser;)V

    goto :goto_61

    .line 398
    .end local v3    # "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v5    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v6    # "propName":Ljava/lang/String;
    :cond_a8
    :try_start_a8
    invoke-virtual {v2, p2, v1}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;->build(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;)Ljava/lang/Object;
    :try_end_ab
    .catch Ljava/lang/Exception; {:try_start_a8 .. :try_end_ab} :catch_c0

    move-result-object v0

    .line 403
    :goto_ac
    if-eqz v8, :cond_43

    .line 405
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v11}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v11

    if-eq v10, v11, :cond_c6

    .line 406
    const/4 v10, 0x0

    invoke-virtual {p0, v10, p2, v0, v8}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handlePolymorphic(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/util/TokenBuffer;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_43

    .line 399
    :catch_c0
    move-exception v4

    .line 400
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {p0, v4, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapInstantiationProblem(Ljava/lang/Throwable;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    .line 401
    const/4 v0, 0x0

    .restart local v0    # "bean":Ljava/lang/Object;
    goto :goto_ac

    .line 409
    .end local v0    # "bean":Ljava/lang/Object;
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_c6
    invoke-virtual {p0, p2, v0, v8}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleUnknownProperties(Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/util/TokenBuffer;)Ljava/lang/Object;

    move-result-object v0

    goto/16 :goto_43
.end method

.method protected _missingToken(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 4
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handledType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/databind/DeserializationContext;->endOfInputException(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v0

    throw v0
.end method

.method protected asArrayDeserializer()Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;
    .registers 3

    .prologue
    .line 94
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanProperties:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->getPropertiesInInsertionOrder()[Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v0

    .line 95
    .local v0, "props":[Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    new-instance v1, Lcom/fasterxml/jackson/databind/deser/impl/BeanAsArrayDeserializer;

    invoke-direct {v1, p0, v0}, Lcom/fasterxml/jackson/databind/deser/impl/BeanAsArrayDeserializer;-><init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;[Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;)V

    return-object v1
.end method

.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 5
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 116
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_26

    .line 117
    iget-boolean v1, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_vanillaProcessing:Z

    if-eqz v1, :cond_15

    .line 118
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    invoke-direct {p0, p1, p2, v1}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->vanillaDeserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/Object;

    move-result-object v1

    .line 126
    :goto_14
    return-object v1

    .line 120
    :cond_15
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 121
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_objectIdReader:Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;

    if-eqz v1, :cond_21

    .line 122
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeWithObjectId(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_14

    .line 124
    :cond_21
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeFromObject(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_14

    .line 126
    :cond_26
    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_deserializeOther(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_14
.end method

.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p3, "bean"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 177
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_injectables:[Lcom/fasterxml/jackson/databind/deser/impl/ValueInjector;

    if-eqz v5, :cond_7

    .line 178
    invoke-virtual {p0, p2, p3}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->injectValues(Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V

    .line 180
    :cond_7
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_unwrappedPropertyHandler:Lcom/fasterxml/jackson/databind/deser/impl/UnwrappedPropertyHandler;

    if-eqz v5, :cond_10

    .line 181
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeWithUnwrapped(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    .line 213
    .end local p3    # "bean":Ljava/lang/Object;
    :cond_f
    :goto_f
    return-object p3

    .line 183
    .restart local p3    # "bean":Ljava/lang/Object;
    :cond_10
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_externalTypeIdHandler:Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;

    if-eqz v5, :cond_19

    .line 184
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeWithExternalTypeId(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    goto :goto_f

    .line 186
    :cond_19
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 188
    .local v3, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v3, v5, :cond_25

    .line 189
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 191
    :cond_25
    iget-boolean v5, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_needViewProcesing:Z

    if-eqz v5, :cond_34

    .line 192
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getActiveView()Ljava/lang/Class;

    move-result-object v4

    .line 193
    .local v4, "view":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v4, :cond_34

    .line 194
    invoke-virtual {p0, p1, p2, p3, v4}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeWithView(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    goto :goto_f

    .line 197
    .end local v4    # "view":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_34
    :goto_34
    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v3, v5, :cond_f

    .line 198
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    .line 200
    .local v2, "propName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 201
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanProperties:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    invoke-virtual {v5, v2}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v1

    .line 203
    .local v1, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v1, :cond_54

    .line 205
    :try_start_47
    invoke-virtual {v1, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_4a} :catch_4f

    .line 197
    :goto_4a
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    goto :goto_34

    .line 206
    :catch_4f
    move-exception v0

    .line 207
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v0, p3, v2, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_4a

    .line 211
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_54
    invoke-virtual {p0, p1, p2, p3, v2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleUnknownVanilla(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_4a
.end method

.method public deserializeFromObject(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 11
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 257
    iget-boolean v7, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_nonStandardCreation:Z

    if-eqz v7, :cond_22

    .line 258
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_unwrappedPropertyHandler:Lcom/fasterxml/jackson/databind/deser/impl/UnwrappedPropertyHandler;

    if-eqz v7, :cond_d

    .line 259
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeWithUnwrapped(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    .line 314
    :cond_c
    :goto_c
    return-object v0

    .line 261
    :cond_d
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_externalTypeIdHandler:Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;

    if-eqz v7, :cond_16

    .line 262
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeWithExternalTypeId(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_c

    .line 264
    :cond_16
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeFromObjectUsingNonDefault(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    .line 265
    .local v0, "bean":Ljava/lang/Object;
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_injectables:[Lcom/fasterxml/jackson/databind/deser/impl/ValueInjector;

    if-eqz v7, :cond_c

    .line 266
    invoke-virtual {p0, p2, v0}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->injectValues(Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V

    goto :goto_c

    .line 282
    .end local v0    # "bean":Ljava/lang/Object;
    :cond_22
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    invoke-virtual {v7, p2}, Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;->createUsingDefault(Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    .line 283
    .restart local v0    # "bean":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->canReadObjectId()Z

    move-result v7

    if-eqz v7, :cond_37

    .line 284
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getObjectId()Ljava/lang/Object;

    move-result-object v2

    .line 285
    .local v2, "id":Ljava/lang/Object;
    if-eqz v2, :cond_37

    .line 286
    invoke-virtual {p0, p1, p2, v0, v2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_handleTypedObjectId(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    .end local v2    # "id":Ljava/lang/Object;
    :cond_37
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_injectables:[Lcom/fasterxml/jackson/databind/deser/impl/ValueInjector;

    if-eqz v7, :cond_3e

    .line 290
    invoke-virtual {p0, p2, v0}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->injectValues(Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V

    .line 292
    :cond_3e
    iget-boolean v7, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_needViewProcesing:Z

    if-eqz v7, :cond_4d

    .line 293
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getActiveView()Ljava/lang/Class;

    move-result-object v6

    .line 294
    .local v6, "view":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v6, :cond_4d

    .line 295
    invoke-virtual {p0, p1, p2, v0, v6}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeWithView(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_c

    .line 298
    .end local v6    # "view":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4d
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    .line 299
    .local v5, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_51
    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v5, v7, :cond_c

    .line 300
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    .line 302
    .local v4, "propName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 303
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanProperties:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    invoke-virtual {v7, v4}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v3

    .line 304
    .local v3, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v3, :cond_71

    .line 306
    :try_start_64
    invoke-virtual {v3, p1, p2, v0}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_67} :catch_6c

    .line 299
    :goto_67
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    goto :goto_51

    .line 307
    :catch_6c
    move-exception v1

    .line 308
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v1, v0, v4, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_67

    .line 312
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_71
    invoke-virtual {p0, p1, p2, v0, v4}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleUnknownVanilla(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_67
.end method

.method protected deserializeUsingPropertyBasedWithExternalTypeId(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 16
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 711
    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_externalTypeIdHandler:Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;

    invoke-virtual {v11}, Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;->start()Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;

    move-result-object v5

    .line 712
    .local v5, "ext":Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_propertyBasedCreator:Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;

    .line 713
    .local v2, "creator":Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;
    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_objectIdReader:Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;

    invoke-virtual {v2, p1, p2, v11}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;->startBuilding(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;)Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;

    move-result-object v1

    .line 715
    .local v1, "buffer":Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;
    new-instance v9, Lcom/fasterxml/jackson/databind/util/TokenBuffer;

    invoke-direct {v9, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;-><init>(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 716
    .local v9, "tokens":Lcom/fasterxml/jackson/databind/util/TokenBuffer;
    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->writeStartObject()V

    .line 718
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v8

    .line 719
    .local v8, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_1a
    sget-object v11, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v8, v11, :cond_c0

    .line 720
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v7

    .line 721
    .local v7, "propName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 723
    invoke-virtual {v2, v7}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;->findCreatorProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v3

    .line 724
    .local v3, "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v3, :cond_7e

    .line 726
    invoke-virtual {v5, p1, p2, v7, v1}, Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;->handlePropertyValue(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_36

    .line 719
    :cond_31
    :goto_31
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v8

    goto :goto_1a

    .line 730
    :cond_36
    invoke-virtual {v3, p1, p2}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v10

    .line 731
    .local v10, "value":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->getCreatorIndex()I

    move-result v11

    invoke-virtual {v1, v11, v10}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->assignParameter(ILjava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_31

    .line 732
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v8

    .line 735
    :try_start_48
    invoke-virtual {v2, p2, v1}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;->build(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;)Ljava/lang/Object;
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_4b} :catch_5b

    move-result-object v0

    .line 741
    .local v0, "bean":Ljava/lang/Object;
    :goto_4c
    sget-object v11, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v8, v11, :cond_66

    .line 742
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 743
    invoke-virtual {v9, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->copyCurrentStructure(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 744
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v8

    goto :goto_4c

    .line 736
    .end local v0    # "bean":Ljava/lang/Object;
    :catch_5b
    move-exception v4

    .line 737
    .local v4, "e":Ljava/lang/Exception;
    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v11}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {p0, v4, v11, v7, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_31

    .line 746
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v0    # "bean":Ljava/lang/Object;
    :cond_66
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    iget-object v12, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v12}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v12

    if-eq v11, v12, :cond_79

    .line 749
    const-string v11, "Can not create polymorphic instances with unwrapped values"

    invoke-virtual {p2, v11}, Lcom/fasterxml/jackson/databind/DeserializationContext;->mappingException(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v11

    throw v11

    .line 751
    :cond_79
    invoke-virtual {v5, p1, p2, v0}, Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;->complete(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 788
    .end local v0    # "bean":Ljava/lang/Object;
    .end local v3    # "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v7    # "propName":Ljava/lang/String;
    .end local v10    # "value":Ljava/lang/Object;
    :goto_7d
    return-object v11

    .line 757
    .restart local v3    # "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .restart local v7    # "propName":Ljava/lang/String;
    :cond_7e
    invoke-virtual {v1, v7}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->readIdProperty(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_31

    .line 761
    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanProperties:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    invoke-virtual {v11, v7}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v6

    .line 762
    .local v6, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v6, :cond_94

    .line 763
    invoke-virtual {v6, p1, p2}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v1, v6, v11}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->bufferProperty(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;Ljava/lang/Object;)V

    goto :goto_31

    .line 767
    :cond_94
    const/4 v11, 0x0

    invoke-virtual {v5, p1, p2, v7, v11}, Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;->handlePropertyValue(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_31

    .line 773
    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    if-eqz v11, :cond_af

    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    invoke-virtual {v11, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_af

    .line 774
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handledType()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {p0, p1, p2, v11, v7}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleIgnoredProperty(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_31

    .line 778
    :cond_af
    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    if-eqz v11, :cond_31

    .line 779
    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    iget-object v12, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    invoke-virtual {v12, p1, p2}, Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v1, v11, v7, v12}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->bufferAnyProperty(Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_31

    .line 785
    .end local v3    # "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v6    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v7    # "propName":Ljava/lang/String;
    :cond_c0
    :try_start_c0
    invoke-virtual {v5, p1, p2, v1, v2}, Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;->complete(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;)Ljava/lang/Object;
    :try_end_c3
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_c3} :catch_c5

    move-result-object v11

    goto :goto_7d

    .line 786
    :catch_c5
    move-exception v4

    .line 787
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {p0, v4, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapInstantiationProblem(Ljava/lang/Throwable;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    .line 788
    const/4 v11, 0x0

    goto :goto_7d
.end method

.method protected deserializeUsingPropertyBasedWithUnwrapped(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 15
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 562
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_propertyBasedCreator:Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;

    .line 563
    .local v2, "creator":Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_objectIdReader:Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;

    invoke-virtual {v2, p1, p2, v10}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;->startBuilding(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;)Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;

    move-result-object v1

    .line 565
    .local v1, "buffer":Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;
    new-instance v8, Lcom/fasterxml/jackson/databind/util/TokenBuffer;

    invoke-direct {v8, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;-><init>(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 566
    .local v8, "tokens":Lcom/fasterxml/jackson/databind/util/TokenBuffer;
    invoke-virtual {v8}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->writeStartObject()V

    .line 568
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v7

    .line 569
    .local v7, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_14
    sget-object v10, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v7, v10, :cond_b9

    .line 570
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v6

    .line 571
    .local v6, "propName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 573
    invoke-virtual {v2, v6}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;->findCreatorProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v3

    .line 574
    .local v3, "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v3, :cond_79

    .line 576
    invoke-virtual {v3, p1, p2}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v9

    .line 577
    .local v9, "value":Ljava/lang/Object;
    invoke-virtual {v3}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->getCreatorIndex()I

    move-result v10

    invoke-virtual {v1, v10, v9}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->assignParameter(ILjava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_54

    .line 578
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v7

    .line 581
    :try_start_37
    invoke-virtual {v2, p2, v1}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;->build(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;)Ljava/lang/Object;
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_3a} :catch_4a

    move-result-object v0

    .line 587
    .local v0, "bean":Ljava/lang/Object;
    :goto_3b
    sget-object v10, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v7, v10, :cond_59

    .line 588
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 589
    invoke-virtual {v8, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->copyCurrentStructure(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 590
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v7

    goto :goto_3b

    .line 582
    .end local v0    # "bean":Ljava/lang/Object;
    :catch_4a
    move-exception v4

    .line 583
    .local v4, "e":Ljava/lang/Exception;
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v10}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {p0, v4, v10, v6, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    .line 569
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v9    # "value":Ljava/lang/Object;
    :cond_54
    :goto_54
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v7

    goto :goto_14

    .line 592
    .restart local v0    # "bean":Ljava/lang/Object;
    .restart local v9    # "value":Ljava/lang/Object;
    :cond_59
    invoke-virtual {v8}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->writeEndObject()V

    .line 593
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v11}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v11

    if-eq v10, v11, :cond_72

    .line 596
    invoke-virtual {v8}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->close()V

    .line 597
    const-string v10, "Can not create polymorphic instances with unwrapped values"

    invoke-virtual {p2, v10}, Lcom/fasterxml/jackson/databind/DeserializationContext;->mappingException(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v10

    throw v10

    .line 599
    :cond_72
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_unwrappedPropertyHandler:Lcom/fasterxml/jackson/databind/deser/impl/UnwrappedPropertyHandler;

    invoke-virtual {v10, p1, p2, v0, v8}, Lcom/fasterxml/jackson/databind/deser/impl/UnwrappedPropertyHandler;->processUnwrapped(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/util/TokenBuffer;)Ljava/lang/Object;

    move-result-object v10

    .line 636
    .end local v0    # "bean":Ljava/lang/Object;
    .end local v3    # "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v6    # "propName":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/Object;
    :goto_78
    return-object v10

    .line 604
    .restart local v3    # "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .restart local v6    # "propName":Ljava/lang/String;
    :cond_79
    invoke-virtual {v1, v6}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->readIdProperty(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_54

    .line 608
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanProperties:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    invoke-virtual {v10, v6}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v5

    .line 609
    .local v5, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v5, :cond_8f

    .line 610
    invoke-virtual {v5, p1, p2}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v1, v5, v10}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->bufferProperty(Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;Ljava/lang/Object;)V

    goto :goto_54

    .line 616
    :cond_8f
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    if-eqz v10, :cond_a3

    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    invoke-virtual {v10, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_a3

    .line 617
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handledType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {p0, p1, p2, v10, v6}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleIgnoredProperty(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_54

    .line 620
    :cond_a3
    invoke-virtual {v8, v6}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->writeFieldName(Ljava/lang/String;)V

    .line 621
    invoke-virtual {v8, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->copyCurrentStructure(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 623
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    if-eqz v10, :cond_54

    .line 624
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    iget-object v11, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    invoke-virtual {v11, p1, p2}, Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v1, v10, v6, v11}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;->bufferAnyProperty(Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_54

    .line 631
    .end local v3    # "creatorProp":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v5    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v6    # "propName":Ljava/lang/String;
    :cond_b9
    :try_start_b9
    invoke-virtual {v2, p2, v1}, Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;->build(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/deser/impl/PropertyValueBuffer;)Ljava/lang/Object;
    :try_end_bc
    .catch Ljava/lang/Exception; {:try_start_b9 .. :try_end_bc} :catch_c4

    move-result-object v0

    .line 636
    .restart local v0    # "bean":Ljava/lang/Object;
    iget-object v10, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_unwrappedPropertyHandler:Lcom/fasterxml/jackson/databind/deser/impl/UnwrappedPropertyHandler;

    invoke-virtual {v10, p1, p2, v0, v8}, Lcom/fasterxml/jackson/databind/deser/impl/UnwrappedPropertyHandler;->processUnwrapped(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/util/TokenBuffer;)Ljava/lang/Object;

    move-result-object v10

    goto :goto_78

    .line 632
    .end local v0    # "bean":Ljava/lang/Object;
    :catch_c4
    move-exception v4

    .line 633
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {p0, v4, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapInstantiationProblem(Ljava/lang/Throwable;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    .line 634
    const/4 v10, 0x0

    goto :goto_78
.end method

.method protected deserializeWithExternalTypeId(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 4
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 649
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_propertyBasedCreator:Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;

    if-eqz v0, :cond_9

    .line 650
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeUsingPropertyBasedWithExternalTypeId(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    .line 652
    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    invoke-virtual {v0, p2}, Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;->createUsingDefault(Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeWithExternalTypeId(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_8
.end method

.method protected deserializeWithExternalTypeId(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p3, "bean"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 659
    iget-boolean v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_needViewProcesing:Z

    if-eqz v6, :cond_42

    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getActiveView()Ljava/lang/Class;

    move-result-object v0

    .line 660
    .local v0, "activeView":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_8
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_externalTypeIdHandler:Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;->start()Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;

    move-result-object v2

    .line 661
    .local v2, "ext":Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    .line 662
    .local v5, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_12
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v5, v6, :cond_76

    .line 663
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    .line 664
    .local v4, "propName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 665
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanProperties:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    invoke-virtual {v6, v4}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v3

    .line 666
    .local v3, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v3, :cond_4d

    .line 668
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v6

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonToken;->isScalarValue()Z

    move-result v6

    if-eqz v6, :cond_32

    .line 669
    invoke-virtual {v2, p1, p2, v4, p3}, Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;->handleTypePropertyValue(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/String;Ljava/lang/Object;)Z

    .line 671
    :cond_32
    if-eqz v0, :cond_44

    invoke-virtual {v3, v0}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->visibleInView(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_44

    .line 672
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    .line 662
    :cond_3d
    :goto_3d
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    goto :goto_12

    .line 659
    .end local v0    # "activeView":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "ext":Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;
    .end local v3    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v4    # "propName":Ljava/lang/String;
    .end local v5    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_42
    const/4 v0, 0x0

    goto :goto_8

    .line 676
    .restart local v0    # "activeView":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "ext":Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;
    .restart local v3    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .restart local v4    # "propName":Ljava/lang/String;
    .restart local v5    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_44
    :try_start_44
    invoke-virtual {v3, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_47} :catch_48

    goto :goto_3d

    .line 677
    :catch_48
    move-exception v1

    .line 678
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v1, p3, v4, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_3d

    .line 683
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4d
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    if-eqz v6, :cond_5d

    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    invoke-virtual {v6, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5d

    .line 684
    invoke-virtual {p0, p1, p2, p3, v4}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleIgnoredProperty(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_3d

    .line 688
    :cond_5d
    invoke-virtual {v2, p1, p2, v4, p3}, Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;->handlePropertyValue(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3d

    .line 692
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    if-eqz v6, :cond_72

    .line 694
    :try_start_67
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    invoke-virtual {v6, p1, p2, p3, v4}, Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_6c} :catch_6d

    goto :goto_3d

    .line 695
    :catch_6d
    move-exception v1

    .line 696
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {p0, v1, p3, v4, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_3d

    .line 701
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_72
    invoke-virtual {p0, p1, p2, p3, v4}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleUnknownProperty(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_3d

    .line 704
    .end local v3    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v4    # "propName":Ljava/lang/String;
    :cond_76
    invoke-virtual {v2, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/impl/ExternalTypeHandler;->complete(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    return-object v6
.end method

.method protected deserializeWithUnwrapped(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 11
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 461
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_delegateDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    if-eqz v6, :cond_11

    .line 462
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_delegateDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    invoke-virtual {v7, p1, p2}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, p2, v7}, Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;->createUsingDelegate(Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 511
    :goto_10
    return-object v1

    .line 464
    :cond_11
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_propertyBasedCreator:Lcom/fasterxml/jackson/databind/deser/impl/PropertyBasedCreator;

    if-eqz v6, :cond_1a

    .line 465
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->deserializeUsingPropertyBasedWithUnwrapped(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_10

    .line 467
    :cond_1a
    new-instance v5, Lcom/fasterxml/jackson/databind/util/TokenBuffer;

    invoke-direct {v5, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;-><init>(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 468
    .local v5, "tokens":Lcom/fasterxml/jackson/databind/util/TokenBuffer;
    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->writeStartObject()V

    .line 469
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    invoke-virtual {v6, p2}, Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;->createUsingDefault(Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v1

    .line 471
    .local v1, "bean":Ljava/lang/Object;
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_injectables:[Lcom/fasterxml/jackson/databind/deser/impl/ValueInjector;

    if-eqz v6, :cond_2f

    .line 472
    invoke-virtual {p0, p2, v1}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->injectValues(Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V

    .line 474
    :cond_2f
    iget-boolean v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_needViewProcesing:Z

    if-eqz v6, :cond_5d

    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getActiveView()Ljava/lang/Class;

    move-result-object v0

    .line 475
    .local v0, "activeView":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_37
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v6

    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v6, v7, :cond_8d

    .line 476
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    .line 477
    .local v4, "propName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 478
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanProperties:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    invoke-virtual {v6, v4}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v3

    .line 479
    .local v3, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v3, :cond_68

    .line 480
    if-eqz v0, :cond_5f

    invoke-virtual {v3, v0}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->visibleInView(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_5f

    .line 481
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    .line 475
    :cond_59
    :goto_59
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_37

    .line 474
    .end local v0    # "activeView":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v4    # "propName":Ljava/lang/String;
    :cond_5d
    const/4 v0, 0x0

    goto :goto_37

    .line 485
    .restart local v0    # "activeView":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .restart local v4    # "propName":Ljava/lang/String;
    :cond_5f
    :try_start_5f
    invoke-virtual {v3, p1, p2, v1}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_62} :catch_63

    goto :goto_59

    .line 486
    :catch_63
    move-exception v2

    .line 487
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v2, v1, v4, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_59

    .line 492
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_68
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    if-eqz v6, :cond_78

    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    invoke-virtual {v6, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_78

    .line 493
    invoke-virtual {p0, p1, p2, v1, v4}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleIgnoredProperty(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_59

    .line 497
    :cond_78
    invoke-virtual {v5, v4}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->writeFieldName(Ljava/lang/String;)V

    .line 498
    invoke-virtual {v5, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->copyCurrentStructure(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 500
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    if-eqz v6, :cond_59

    .line 502
    :try_start_82
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    invoke-virtual {v6, p1, p2, v1, v4}, Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_87
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_87} :catch_88

    goto :goto_59

    .line 503
    :catch_88
    move-exception v2

    .line 504
    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-virtual {p0, v2, v1, v4, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_59

    .line 509
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v4    # "propName":Ljava/lang/String;
    :cond_8d
    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->writeEndObject()V

    .line 510
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_unwrappedPropertyHandler:Lcom/fasterxml/jackson/databind/deser/impl/UnwrappedPropertyHandler;

    invoke-virtual {v6, p1, p2, v1, v5}, Lcom/fasterxml/jackson/databind/deser/impl/UnwrappedPropertyHandler;->processUnwrapped(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/util/TokenBuffer;)Ljava/lang/Object;

    goto/16 :goto_10
.end method

.method protected deserializeWithUnwrapped(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p3, "bean"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 518
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    .line 519
    .local v4, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v6, :cond_c

    .line 520
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    .line 522
    :cond_c
    new-instance v5, Lcom/fasterxml/jackson/databind/util/TokenBuffer;

    invoke-direct {v5, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;-><init>(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 523
    .local v5, "tokens":Lcom/fasterxml/jackson/databind/util/TokenBuffer;
    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->writeStartObject()V

    .line 524
    iget-boolean v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_needViewProcesing:Z

    if-eqz v6, :cond_3f

    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getActiveView()Ljava/lang/Class;

    move-result-object v0

    .line 525
    .local v0, "activeView":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1c
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v6, :cond_6a

    .line 526
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v3

    .line 527
    .local v3, "propName":Ljava/lang/String;
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanProperties:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    invoke-virtual {v6, v3}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v2

    .line 528
    .local v2, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 529
    if-eqz v2, :cond_4a

    .line 530
    if-eqz v0, :cond_41

    invoke-virtual {v2, v0}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->visibleInView(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_41

    .line 531
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    .line 525
    :cond_3a
    :goto_3a
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    goto :goto_1c

    .line 524
    .end local v0    # "activeView":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v3    # "propName":Ljava/lang/String;
    :cond_3f
    const/4 v0, 0x0

    goto :goto_1c

    .line 535
    .restart local v0    # "activeView":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .restart local v3    # "propName":Ljava/lang/String;
    :cond_41
    :try_start_41
    invoke-virtual {v2, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_44} :catch_45

    goto :goto_3a

    .line 536
    :catch_45
    move-exception v1

    .line 537
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v1, p3, v3, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_3a

    .line 541
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4a
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    if-eqz v6, :cond_5a

    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_ignorableProps:Ljava/util/HashSet;

    invoke-virtual {v6, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5a

    .line 542
    invoke-virtual {p0, p1, p2, p3, v3}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleIgnoredProperty(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_3a

    .line 546
    :cond_5a
    invoke-virtual {v5, v3}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->writeFieldName(Ljava/lang/String;)V

    .line 547
    invoke-virtual {v5, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->copyCurrentStructure(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 549
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    if-eqz v6, :cond_3a

    .line 550
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_anySetter:Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;

    invoke-virtual {v6, p1, p2, p3, v3}, Lcom/fasterxml/jackson/databind/deser/SettableAnyProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_3a

    .line 553
    .end local v2    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v3    # "propName":Ljava/lang/String;
    :cond_6a
    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/util/TokenBuffer;->writeEndObject()V

    .line 554
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_unwrappedPropertyHandler:Lcom/fasterxml/jackson/databind/deser/impl/UnwrappedPropertyHandler;

    invoke-virtual {v6, p1, p2, p3, v5}, Lcom/fasterxml/jackson/databind/deser/impl/UnwrappedPropertyHandler;->processUnwrapped(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/util/TokenBuffer;)Ljava/lang/Object;

    .line 555
    return-object p3
.end method

.method protected final deserializeWithView(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 10
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p3, "bean"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 424
    .local p4, "activeView":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 425
    .local v3, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_4
    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v3, v4, :cond_32

    .line 426
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    .line 428
    .local v2, "propName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 429
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->_beanProperties:Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;

    invoke-virtual {v4, v2}, Lcom/fasterxml/jackson/databind/deser/impl/BeanPropertyMap;->find(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;

    move-result-object v1

    .line 430
    .local v1, "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    if-eqz v1, :cond_2e

    .line 431
    invoke-virtual {v1, p4}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->visibleInView(Ljava/lang/Class;)Z

    move-result v4

    if-nez v4, :cond_25

    .line 432
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    .line 425
    :goto_20
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    goto :goto_4

    .line 436
    :cond_25
    :try_start_25
    invoke-virtual {v1, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;->deserializeAndSet(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_28} :catch_29

    goto :goto_20

    .line 437
    :catch_29
    move-exception v0

    .line 438
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v0, p3, v2, p2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->wrapAndThrow(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;Lcom/fasterxml/jackson/databind/DeserializationContext;)V

    goto :goto_20

    .line 442
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2e
    invoke-virtual {p0, p1, p2, p3, v2}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->handleUnknownVanilla(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_20

    .line 444
    .end local v1    # "prop":Lcom/fasterxml/jackson/databind/deser/SettableBeanProperty;
    .end local v2    # "propName":Ljava/lang/String;
    :cond_32
    return-object p3
.end method

.method public unwrappingDeserializer(Lcom/fasterxml/jackson/databind/util/NameTransformer;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 4
    .param p1, "unwrapper"    # Lcom/fasterxml/jackson/databind/util/NameTransformer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/util/NameTransformer;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;

    if-eq v0, v1, :cond_9

    .line 79
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;
    :goto_8
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;
    :cond_9
    new-instance v0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;

    invoke-direct {v0, p0, p1}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;-><init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Lcom/fasterxml/jackson/databind/util/NameTransformer;)V

    move-object p0, v0

    goto :goto_8
.end method

.method public withIgnorableProperties(Ljava/util/HashSet;)Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;"
        }
    .end annotation

    .prologue
    .line 89
    .local p1, "ignorableProps":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;

    invoke-direct {v0, p0, p1}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;-><init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Ljava/util/HashSet;)V

    return-object v0
.end method

.method public bridge synthetic withIgnorableProperties(Ljava/util/HashSet;)Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;
    .registers 3
    .param p1, "x0"    # Ljava/util/HashSet;

    .prologue
    .line 17
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->withIgnorableProperties(Ljava/util/HashSet;)Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;

    move-result-object v0

    return-object v0
.end method

.method public withObjectIdReader(Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;)Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;
    .registers 3
    .param p1, "oir"    # Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;

    .prologue
    .line 84
    new-instance v0, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;

    invoke-direct {v0, p0, p1}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;-><init>(Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;)V

    return-object v0
.end method

.method public bridge synthetic withObjectIdReader(Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;)Lcom/fasterxml/jackson/databind/deser/BeanDeserializerBase;
    .registers 3
    .param p1, "x0"    # Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;

    .prologue
    .line 17
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;->withObjectIdReader(Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;)Lcom/fasterxml/jackson/databind/deser/BeanDeserializer;

    move-result-object v0

    return-object v0
.end method
