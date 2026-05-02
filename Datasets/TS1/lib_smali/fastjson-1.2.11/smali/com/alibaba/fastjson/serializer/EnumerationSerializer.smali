.class public Lcom/alibaba/fastjson/serializer/EnumerationSerializer;
.super Ljava/lang/Object;
.source "EnumerationSerializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;


# static fields
.field public static instance:Lcom/alibaba/fastjson/serializer/EnumerationSerializer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 10
    new-instance v0, Lcom/alibaba/fastjson/serializer/EnumerationSerializer;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/EnumerationSerializer;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/EnumerationSerializer;->instance:Lcom/alibaba/fastjson/serializer/EnumerationSerializer;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 19
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
    .line 13
    iget-object v11, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 15
    .local v11, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    if-nez p2, :cond_a

    .line 16
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullListAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v11, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 54
    :goto_9
    return-void

    .line 20
    :cond_a
    const/4 v5, 0x0

    .line 21
    .local v5, "elementType":Ljava/lang/reflect/Type;
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v11, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 22
    move-object/from16 v0, p4

    instance-of v2, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v2, :cond_24

    move-object/from16 v12, p4

    .line 23
    check-cast v12, Ljava/lang/reflect/ParameterizedType;

    .line 24
    .local v12, "param":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v12}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v2

    const/4 v4, 0x0

    aget-object v5, v2, v4

    .end local v12    # "param":Ljava/lang/reflect/ParameterizedType;
    :cond_24
    move-object v8, p2

    .line 28
    check-cast v8, Ljava/util/Enumeration;

    .line 30
    .local v8, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    iget-object v7, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    .line 31
    .local v7, "context":Lcom/alibaba/fastjson/serializer/SerialContext;
    const/4 v2, 0x0

    move-object/from16 v0, p3

    invoke-virtual {p1, v7, p2, v0, v2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->setContext(Lcom/alibaba/fastjson/serializer/SerialContext;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 34
    const/4 v9, 0x0

    .line 35
    .local v9, "i":I
    const/16 v2, 0x5b

    :try_start_32
    invoke-virtual {v11, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_end_35
    .catchall {:try_start_32 .. :try_end_35} :catchall_6d

    move v10, v9

    .line 36
    .end local v9    # "i":I
    .local v10, "i":I
    :goto_36
    :try_start_36
    invoke-interface {v8}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_65

    .line 37
    invoke-interface {v8}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;
    :try_end_3f
    .catchall {:try_start_36 .. :try_end_3f} :catchall_71

    move-result-object v3

    .line 38
    .local v3, "item":Ljava/lang/Object;
    add-int/lit8 v9, v10, 0x1

    .end local v10    # "i":I
    .restart local v9    # "i":I
    if-eqz v10, :cond_49

    .line 39
    const/16 v2, 0x2c

    :try_start_46
    invoke-virtual {v11, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 42
    :cond_49
    if-nez v3, :cond_50

    .line 43
    invoke-virtual {v11}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    move v10, v9

    .line 44
    .end local v9    # "i":I
    .restart local v10    # "i":I
    goto :goto_36

    .line 47
    .end local v10    # "i":I
    .restart local v9    # "i":I
    :cond_50
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v1

    .line 48
    .local v1, "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    add-int/lit8 v2, v9, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v6, 0x0

    move-object v2, p1

    invoke-interface/range {v1 .. v6}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    :try_end_63
    .catchall {:try_start_46 .. :try_end_63} :catchall_6d

    move v10, v9

    .line 49
    .end local v9    # "i":I
    .restart local v10    # "i":I
    goto :goto_36

    .line 50
    .end local v1    # "itemSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .end local v3    # "item":Ljava/lang/Object;
    :cond_65
    const/16 v2, 0x5d

    :try_start_67
    invoke-virtual {v11, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    :try_end_6a
    .catchall {:try_start_67 .. :try_end_6a} :catchall_71

    .line 52
    iput-object v7, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    goto :goto_9

    .end local v10    # "i":I
    .restart local v9    # "i":I
    :catchall_6d
    move-exception v2

    :goto_6e
    iput-object v7, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->context:Lcom/alibaba/fastjson/serializer/SerialContext;

    throw v2

    .end local v9    # "i":I
    .restart local v10    # "i":I
    :catchall_71
    move-exception v2

    move v9, v10

    .end local v10    # "i":I
    .restart local v9    # "i":I
    goto :goto_6e
.end method
