.class public final Lcom/alibaba/fastjson/serializer/ListSerializer;
.super Ljava/lang/Object;
.source "ListSerializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/serializer/ListSerializer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    new-instance v0, Lcom/alibaba/fastjson/serializer/ListSerializer;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/ListSerializer;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/ListSerializer;->instance:Lcom/alibaba/fastjson/serializer/ListSerializer;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 29
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
    .line 33
    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    sget-object v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v6, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v21

    .line 35
    .local v21, "writeClassName":Z
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-object/from16 v16, v0

    .line 37
    .local v16, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    const/4 v9, 0x0

    .line 38
    .local v9, "elementType":Ljava/lang/reflect/Type;
    if-eqz v21, :cond_24

    .line 39
    move-object/from16 v0, p4

    instance-of v6, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v6, :cond_24

    move-object/from16 v17, p4

    .line 40
    check-cast v17, Ljava/lang/reflect/ParameterizedType;

    .line 41
    .local v17, "param":Ljava/lang/reflect/ParameterizedType;
    invoke-interface/range {v17 .. v17}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v9, v6, v7

    .line 45
    .end local v17    # "param":Ljava/lang/reflect/ParameterizedType;
    :cond_24
    if-nez p2, :cond_2e

    .line 46
    sget-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullListAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 135
    :goto_2d
    return-void

    :cond_2e
    move-object/from16 v15, p2

    .line 50
    check-cast v15, Ljava/util/List;

    .line 52
    .local v15, "list":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v6

    if-nez v6, :cond_40

    .line 53
    const-string v6, "[]"

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    goto :goto_2d

    .line 57
    :cond_40
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 58
    .local v4, "context":Lcom/alibaba/fastjson/serializer/SerialContext;
    const/4 v6, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v0, v4, v1, v2, v6}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->setContext(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 60
    const/4 v5, 0x0

    .line 62
    .local v5, "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :try_start_4f
    sget-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v6

    if-eqz v6, :cond_d8

    .line 63
    const/16 v6, 0x5b

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 64
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->incrementIndent()V

    .line 66
    const/4 v12, 0x0

    .line 67
    .local v12, "i":I
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v22

    :goto_68
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_c5

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .line 68
    .local v13, "item":Ljava/lang/Object;
    if-eqz v12, :cond_7b

    .line 69
    const/16 v6, 0x2c

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 72
    :cond_7b
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->println()V

    .line 73
    if-eqz v13, :cond_b7

    .line 74
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->containsReference(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_90

    .line 75
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeReference(Ljava/lang/Object;)V

    .line 85
    :goto_8d
    add-int/lit8 v12, v12, 0x1

    .line 86
    goto :goto_68

    .line 77
    :cond_90
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :try_end_99
    .catchall {:try_start_4f .. :try_end_99} :catchall_bf

    move-result-object v14

    .line 78
    .end local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .local v14, "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :try_start_9a
    new-instance v3, Lcom/alibaba/fastjson/serializer/SerialContext;

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-direct/range {v3 .. v8}, Lcom/alibaba/fastjson/serializer/SerialContext;-><init>(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;II)V

    .line 79
    .local v3, "itemContext":Lcom/alibaba/fastjson/serializer/SerialContext;
    move-object/from16 v0, p1

    iput-object v3, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 80
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v10, 0x0

    move-object v5, v14

    move-object/from16 v6, p1

    move-object v7, v13

    invoke-interface/range {v5 .. v10}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    :try_end_b5
    .catchall {:try_start_9a .. :try_end_b5} :catchall_13d

    move-object v5, v14

    .line 81
    .end local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    goto :goto_8d

    .line 83
    .end local v3    # "itemContext":Lcom/alibaba/fastjson/serializer/SerialContext;
    :cond_b7
    :try_start_b7
    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V
    :try_end_be
    .catchall {:try_start_b7 .. :try_end_be} :catchall_bf

    goto :goto_8d

    .line 133
    .end local v12    # "i":I
    .end local v13    # "item":Ljava/lang/Object;
    :catchall_bf
    move-exception v6

    :goto_c0
    move-object/from16 v0, p1

    iput-object v4, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    throw v6

    .line 88
    .restart local v12    # "i":I
    :cond_c5
    :try_start_c5
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->decrementIdent()V

    .line 89
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->println()V

    .line 90
    const/16 v6, 0x5d

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_end_d2
    .catchall {:try_start_c5 .. :try_end_d2} :catchall_bf

    .line 133
    move-object/from16 v0, p1

    iput-object v4, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    goto/16 :goto_2d

    .line 94
    .end local v12    # "i":I
    :cond_d8
    const/16 v6, 0x5b

    :try_start_da
    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 95
    const/4 v12, 0x0

    .restart local v12    # "i":I
    invoke-interface {v15}, Ljava/util/List;->size()I
    :try_end_e3
    .catchall {:try_start_da .. :try_end_e3} :catchall_bf

    move-result v18

    .local v18, "size":I
    move-object v14, v5

    .end local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :goto_e5
    move/from16 v0, v18

    if-ge v12, v0, :cond_17a

    .line 96
    :try_start_e9
    invoke-interface {v15, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    .line 97
    .restart local v13    # "item":Ljava/lang/Object;
    if-eqz v12, :cond_f6

    .line 98
    const/16 v6, 0x2c

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 101
    :cond_f6
    if-nez v13, :cond_104

    .line 102
    const-string v6, "null"

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-object v5, v14

    .line 95
    .end local v13    # "item":Ljava/lang/Object;
    .end local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :goto_100
    add-int/lit8 v12, v12, 0x1

    move-object v14, v5

    .end local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    goto :goto_e5

    .line 104
    .restart local v13    # "item":Ljava/lang/Object;
    :cond_104
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    .line 106
    .local v11, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v6, Ljava/lang/Integer;

    if-ne v11, v6, :cond_119

    .line 107
    check-cast v13, Ljava/lang/Integer;

    .end local v13    # "item":Ljava/lang/Object;
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v6

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    move-object v5, v14

    .end local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    goto :goto_100

    .line 108
    .end local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v13    # "item":Ljava/lang/Object;
    .restart local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :cond_119
    const-class v6, Ljava/lang/Long;

    if-ne v11, v6, :cond_140

    .line 109
    check-cast v13, Ljava/lang/Long;

    .end local v13    # "item":Ljava/lang/Object;
    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    move-result-wide v19

    .line 110
    .local v19, "val":J
    if-eqz v21, :cond_135

    .line 111
    move-object/from16 v0, v16

    move-wide/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 112
    const/16 v6, 0x4c

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    :goto_133
    move-object v5, v14

    .line 116
    .end local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    goto :goto_100

    .line 114
    .end local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :cond_135
    move-object/from16 v0, v16

    move-wide/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    goto :goto_133

    .line 133
    .end local v11    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v18    # "size":I
    .end local v19    # "val":J
    :catchall_13d
    move-exception v6

    move-object v5, v14

    .end local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    goto :goto_c0

    .line 117
    .end local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v11    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v13    # "item":Ljava/lang/Object;
    .restart local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v18    # "size":I
    :cond_140
    move-object/from16 v0, v16

    iget-boolean v6, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->disableCircularReferenceDetect:Z

    if-nez v6, :cond_155

    .line 118
    new-instance v3, Lcom/alibaba/fastjson/serializer/SerialContext;

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-direct/range {v3 .. v8}, Lcom/alibaba/fastjson/serializer/SerialContext;-><init>(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;II)V

    .line 119
    .restart local v3    # "itemContext":Lcom/alibaba/fastjson/serializer/SerialContext;
    move-object/from16 v0, p1

    iput-object v3, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 122
    .end local v3    # "itemContext":Lcom/alibaba/fastjson/serializer/SerialContext;
    :cond_155
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->containsReference(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_164

    .line 123
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeReference(Ljava/lang/Object;)V

    move-object v5, v14

    .end local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    goto :goto_100

    .line 125
    .end local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :cond_164
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :try_end_16d
    .catchall {:try_start_e9 .. :try_end_16d} :catchall_13d

    move-result-object v5

    .line 126
    .end local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :try_start_16e
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v10, 0x0

    move-object/from16 v6, p1

    move-object v7, v13

    invoke-interface/range {v5 .. v10}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    :try_end_179
    .catchall {:try_start_16e .. :try_end_179} :catchall_bf

    goto :goto_100

    .line 131
    .end local v5    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .end local v11    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v13    # "item":Ljava/lang/Object;
    .restart local v14    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :cond_17a
    const/16 v6, 0x5d

    :try_start_17c
    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_end_181
    .catchall {:try_start_17c .. :try_end_181} :catchall_13d

    .line 133
    move-object/from16 v0, p1

    iput-object v4, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    goto/16 :goto_2d
.end method
