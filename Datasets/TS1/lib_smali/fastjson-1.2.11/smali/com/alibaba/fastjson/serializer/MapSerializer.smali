.class public Lcom/alibaba/fastjson/serializer/MapSerializer;
.super Lcom/alibaba/fastjson/serializer/SerializeFilterable;
.source "MapSerializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;


# static fields
.field public static instance:Lcom/alibaba/fastjson/serializer/MapSerializer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    new-instance v0, Lcom/alibaba/fastjson/serializer/MapSerializer;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/MapSerializer;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/MapSerializer;->instance:Lcom/alibaba/fastjson/serializer/MapSerializer;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;-><init>()V

    return-void
.end method


# virtual methods
.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 39
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "fieldType"    # Ljava/lang/reflect/Type;
    .param p5, "features"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-object/from16 v25, v0

    .line 39
    .local v25, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    if-nez p2, :cond_c

    .line 40
    invoke-virtual/range {v25 .. v25}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 208
    :goto_b
    return-void

    :cond_c
    move-object/from16 v22, p2

    .line 44
    check-cast v22, Ljava/util/Map;

    .line 56
    .local v22, "map":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-virtual/range {p1 .. p2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->containsReference(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 57
    invoke-virtual/range {p1 .. p2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeReference(Ljava/lang/Object;)V

    goto :goto_b

    .line 61
    :cond_1a
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    move-object/from16 v26, v0

    .line 62
    .local v26, "parent":Lcom/alibaba/fastjson/serializer/SerialContext;
    const/4 v4, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->setContext(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 64
    const/16 v4, 0x7b

    :try_start_2e
    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 66
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->incrementIndent()V

    .line 68
    const/16 v27, 0x0

    .line 69
    .local v27, "preClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v10, 0x0

    .line 71
    .local v10, "preWriter":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    const/16 v20, 0x1

    .line 73
    .local v20, "first":Z
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-eqz v4, :cond_7f

    .line 74
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v23

    .line 75
    .local v23, "mapClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v4, Lcom/alibaba/fastjson/JSONObject;

    move-object/from16 v0, v23

    if-eq v0, v4, :cond_5b

    const-class v4, Ljava/util/HashMap;

    move-object/from16 v0, v23

    if-eq v0, v4, :cond_5b

    const-class v4, Ljava/util/LinkedHashMap;

    move-object/from16 v0, v23

    if-ne v0, v4, :cond_178

    :cond_5b
    sget-object v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    .line 76
    move-object/from16 v0, v22

    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_178

    const/16 v17, 0x1

    .line 77
    .local v17, "containsKey":Z
    :goto_67
    if-nez v17, :cond_7f

    .line 78
    sget-object v4, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 79
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 80
    const/16 v20, 0x0

    .line 84
    .end local v17    # "containsKey":Z
    .end local v23    # "mapClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_7f
    invoke-interface/range {v22 .. v22}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v32

    :cond_87
    :goto_87
    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_262

    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/util/Map$Entry;

    .line 85
    .local v19, "entry":Ljava/util/Map$Entry;
    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    .line 87
    .local v9, "value":Ljava/lang/Object;
    invoke-interface/range {v19 .. v19}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    .line 90
    .local v13, "entryKey":Ljava/lang/Object;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->propertyPreFilters:Ljava/util/List;

    move-object/from16 v28, v0

    .line 91
    .local v28, "preFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/PropertyPreFilter;>;"
    if-eqz v28, :cond_bf

    invoke-interface/range {v28 .. v28}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_bf

    .line 92
    if-eqz v13, :cond_af

    instance-of v4, v13, Ljava/lang/String;

    if-eqz v4, :cond_17c

    .line 93
    :cond_af
    move-object v0, v13

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v4}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->applyName(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_87

    .line 106
    :cond_bf
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->propertyFilters:Ljava/util/List;

    move-object/from16 v29, v0

    .line 107
    .local v29, "propertyFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/PropertyFilter;>;"
    if-eqz v29, :cond_e3

    invoke-interface/range {v29 .. v29}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_e3

    .line 108
    if-eqz v13, :cond_d3

    instance-of v4, v13, Ljava/lang/String;

    if-eqz v4, :cond_19c

    .line 109
    :cond_d3
    move-object v0, v13

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v4, v9}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->apply(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_87

    .line 122
    :cond_e3
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->nameFilters:Ljava/util/List;

    move-object/from16 v24, v0

    .line 123
    .local v24, "nameFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/NameFilter;>;"
    if-eqz v24, :cond_103

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_103

    .line 124
    if-eqz v13, :cond_f7

    instance-of v4, v13, Ljava/lang/String;

    if-eqz v4, :cond_1bc

    .line 125
    :cond_f7
    check-cast v13, Ljava/lang/String;

    .end local v13    # "entryKey":Ljava/lang/Object;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v13, v9}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->processKey(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 134
    :cond_103
    :goto_103
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->valueFilters:Ljava/util/List;

    move-object/from16 v31, v0

    .line 135
    .local v31, "valueFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/ValueFilter;>;"
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->contextValueFilters:Ljava/util/List;

    move-object/from16 v18, v0

    .line 136
    .local v18, "contextValueFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/ContextValueFilter;>;"
    if-eqz v31, :cond_117

    invoke-interface/range {v31 .. v31}, Ljava/util/List;->size()I

    move-result v4

    if-gtz v4, :cond_11f

    :cond_117
    if-eqz v18, :cond_134

    .line 137
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_134

    .line 138
    :cond_11f
    if-eqz v13, :cond_125

    instance-of v4, v13, Ljava/lang/String;

    if-eqz v4, :cond_1da

    .line 139
    :cond_125
    const/4 v6, 0x0

    move-object v0, v13

    check-cast v0, Ljava/lang/String;

    move-object v8, v0

    move-object/from16 v4, p1

    move-object/from16 v5, p0

    move-object/from16 v7, p2

    invoke-virtual/range {v4 .. v9}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->processValue(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Lcom/alibaba/fastjson/serializer/BeanContext;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 147
    :cond_134
    :goto_134
    if-nez v9, :cond_140

    .line 148
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteMapNullValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-eqz v4, :cond_87

    .line 153
    :cond_140
    instance-of v4, v13, Ljava/lang/String;

    if-eqz v4, :cond_1f9

    .line 154
    move-object v0, v13

    check-cast v0, Ljava/lang/String;

    move-object/from16 v21, v0

    .line 156
    .local v21, "key":Ljava/lang/String;
    if-nez v20, :cond_152

    .line 157
    const/16 v4, 0x2c

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 160
    :cond_152
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-eqz v4, :cond_15f

    .line 161
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->println()V

    .line 163
    :cond_15f
    const/4 v4, 0x1

    move-object/from16 v0, v25

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;Z)V

    .line 181
    .end local v21    # "key":Ljava/lang/String;
    :goto_167
    const/16 v20, 0x0

    .line 183
    if-nez v9, :cond_23a

    .line 184
    invoke-virtual/range {v25 .. v25}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V
    :try_end_16e
    .catchall {:try_start_2e .. :try_end_16e} :catchall_170

    goto/16 :goto_87

    .line 200
    .end local v9    # "value":Ljava/lang/Object;
    .end local v10    # "preWriter":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .end local v18    # "contextValueFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/ContextValueFilter;>;"
    .end local v19    # "entry":Ljava/util/Map$Entry;
    .end local v20    # "first":Z
    .end local v24    # "nameFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/NameFilter;>;"
    .end local v27    # "preClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v28    # "preFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/PropertyPreFilter;>;"
    .end local v29    # "propertyFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/PropertyFilter;>;"
    .end local v31    # "valueFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/ValueFilter;>;"
    :catchall_170
    move-exception v4

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    iput-object v0, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    throw v4

    .line 76
    .restart local v10    # "preWriter":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v20    # "first":Z
    .restart local v23    # "mapClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v27    # "preClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_178
    const/16 v17, 0x0

    goto/16 :goto_67

    .line 96
    .end local v23    # "mapClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v9    # "value":Ljava/lang/Object;
    .restart local v13    # "entryKey":Ljava/lang/Object;
    .restart local v19    # "entry":Ljava/util/Map$Entry;
    .restart local v28    # "preFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/PropertyPreFilter;>;"
    :cond_17c
    :try_start_17c
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-nez v4, :cond_18a

    instance-of v4, v13, Ljava/lang/Number;

    if-eqz v4, :cond_bf

    .line 97
    :cond_18a
    invoke-static {v13}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 98
    .local v8, "strKey":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v8}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->applyName(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_bf

    goto/16 :goto_87

    .line 112
    .end local v8    # "strKey":Ljava/lang/String;
    .restart local v29    # "propertyFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/PropertyFilter;>;"
    :cond_19c
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-nez v4, :cond_1aa

    instance-of v4, v13, Ljava/lang/Number;

    if-eqz v4, :cond_e3

    .line 113
    :cond_1aa
    invoke-static {v13}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 114
    .restart local v8    # "strKey":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v8, v9}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->apply(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_e3

    goto/16 :goto_87

    .line 126
    .end local v8    # "strKey":Ljava/lang/String;
    .restart local v24    # "nameFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/NameFilter;>;"
    :cond_1bc
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-nez v4, :cond_1ca

    instance-of v4, v13, Ljava/lang/Number;

    if-eqz v4, :cond_103

    .line 127
    :cond_1ca
    invoke-static {v13}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 128
    .restart local v8    # "strKey":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v8, v9}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->processKey(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .local v13, "entryKey":Ljava/lang/String;
    goto/16 :goto_103

    .line 140
    .end local v8    # "strKey":Ljava/lang/String;
    .end local v13    # "entryKey":Ljava/lang/String;
    .restart local v18    # "contextValueFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/ContextValueFilter;>;"
    .restart local v31    # "valueFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/ValueFilter;>;"
    :cond_1da
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-nez v4, :cond_1e8

    instance-of v4, v13, Ljava/lang/Number;

    if-eqz v4, :cond_134

    .line 141
    :cond_1e8
    invoke-static {v13}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 142
    .restart local v8    # "strKey":Ljava/lang/String;
    const/4 v6, 0x0

    move-object/from16 v4, p1

    move-object/from16 v5, p0

    move-object/from16 v7, p2

    invoke-virtual/range {v4 .. v9}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->processValue(Lcom/alibaba/fastjson/serializer/SerializeFilterable;Lcom/alibaba/fastjson/serializer/BeanContext;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    goto/16 :goto_134

    .line 165
    .end local v8    # "strKey":Ljava/lang/String;
    :cond_1f9
    if-nez v20, :cond_202

    .line 166
    const/16 v4, 0x2c

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 169
    :cond_202
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-nez v4, :cond_220

    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNonStringKeyAsString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 170
    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-nez v4, :cond_220

    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserSecure:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 171
    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-eqz v4, :cond_234

    .line 172
    :cond_220
    invoke-static {v13}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v30

    .line 173
    .local v30, "strEntryKey":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/String;)V

    .line 178
    .end local v30    # "strEntryKey":Ljava/lang/String;
    :goto_22b
    const/16 v4, 0x3a

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_167

    .line 175
    :cond_234
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    goto :goto_22b

    .line 188
    :cond_23a
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    .line 190
    .local v16, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, v16

    move-object/from16 v1, v27

    if-ne v0, v1, :cond_24e

    .line 191
    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v11, p1

    move-object v12, v9

    invoke-interface/range {v10 .. v15}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V

    goto/16 :goto_87

    .line 193
    :cond_24e
    move-object/from16 v27, v16

    .line 194
    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v10

    .line 196
    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v11, p1

    move-object v12, v9

    invoke-interface/range {v10 .. v15}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    :try_end_260
    .catchall {:try_start_17c .. :try_end_260} :catchall_170

    goto/16 :goto_87

    .line 200
    .end local v9    # "value":Ljava/lang/Object;
    .end local v16    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v18    # "contextValueFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/ContextValueFilter;>;"
    .end local v19    # "entry":Ljava/util/Map$Entry;
    .end local v24    # "nameFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/NameFilter;>;"
    .end local v28    # "preFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/PropertyPreFilter;>;"
    .end local v29    # "propertyFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/PropertyFilter;>;"
    .end local v31    # "valueFilters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/serializer/ValueFilter;>;"
    :cond_262
    move-object/from16 v0, v26

    move-object/from16 v1, p1

    iput-object v0, v1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 203
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->decrementIdent()V

    .line 204
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v4

    if-eqz v4, :cond_27e

    invoke-interface/range {v22 .. v22}, Ljava/util/Map;->size()I

    move-result v4

    if-lez v4, :cond_27e

    .line 205
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->println()V

    .line 207
    :cond_27e
    const/16 v4, 0x7d

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_b
.end method
