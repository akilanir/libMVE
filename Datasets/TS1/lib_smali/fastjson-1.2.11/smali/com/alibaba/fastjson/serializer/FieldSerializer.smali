.class public Lcom/alibaba/fastjson/serializer/FieldSerializer;
.super Ljava/lang/Object;
.source "FieldSerializer.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/alibaba/fastjson/serializer/FieldSerializer;",
        ">;"
    }
.end annotation


# instance fields
.field private final double_quoted_fieldPrefix:Ljava/lang/String;

.field protected features:I

.field protected fieldContext:Lcom/alibaba/fastjson/serializer/BeanContext;

.field public final fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

.field private format:Ljava/lang/String;

.field private runtimeInfo:Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;

.field private single_quoted_fieldPrefix:Ljava/lang/String;

.field private un_quoted_fieldPrefix:Ljava/lang/String;

.field protected writeEnumUsingName:Z

.field protected writeEnumUsingToString:Z

.field protected final writeNull:Z


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V
    .registers 12
    .param p2, "fieldInfo"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "beanType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v8, 0x1

    const/4 v3, 0x0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-boolean v3, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writeEnumUsingToString:Z

    .line 42
    iput-boolean v3, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writeEnumUsingName:Z

    .line 47
    iput-object p2, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 48
    new-instance v4, Lcom/alibaba/fastjson/serializer/BeanContext;

    invoke-direct {v4, p1, p2}, Lcom/alibaba/fastjson/serializer/BeanContext;-><init>(Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V

    iput-object v4, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldContext:Lcom/alibaba/fastjson/serializer/BeanContext;

    .line 50
    invoke-virtual {p2}, Lcom/alibaba/fastjson/util/FieldInfo;->setAccessible()V

    .line 52
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v5, 0x22

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p2, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->double_quoted_fieldPrefix:Ljava/lang/String;

    .line 54
    const/4 v2, 0x0

    .line 55
    .local v2, "writeNull":Z
    invoke-virtual {p2}, Lcom/alibaba/fastjson/util/FieldInfo;->getAnnotation()Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v0

    .line 56
    .local v0, "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v0, :cond_83

    .line 57
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v5

    array-length v6, v5

    move v4, v3

    :goto_3f
    if-ge v4, v6, :cond_48

    aget-object v1, v5, v4

    .line 58
    .local v1, "feature":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    sget-object v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteMapNullValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    if-ne v1, v7, :cond_6f

    .line 59
    const/4 v2, 0x1

    .line 64
    .end local v1    # "feature":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    :cond_48
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->format()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->format:Ljava/lang/String;

    .line 66
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->format:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_5d

    .line 67
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->format:Ljava/lang/String;

    .line 70
    :cond_5d
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v4

    array-length v5, v4

    :goto_62
    if-ge v3, v5, :cond_79

    aget-object v1, v4, v3

    .line 71
    .restart local v1    # "feature":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    sget-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingToString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    if-ne v1, v6, :cond_72

    .line 72
    iput-boolean v8, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writeEnumUsingToString:Z

    .line 70
    :cond_6c
    :goto_6c
    add-int/lit8 v3, v3, 0x1

    goto :goto_62

    .line 57
    :cond_6f
    add-int/lit8 v4, v4, 0x1

    goto :goto_3f

    .line 73
    :cond_72
    sget-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    if-ne v1, v6, :cond_6c

    .line 74
    iput-boolean v8, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writeEnumUsingName:Z

    goto :goto_6c

    .line 78
    .end local v1    # "feature":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    :cond_79
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v3

    invoke-static {v3}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v3

    iput v3, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->features:I

    .line 81
    :cond_83
    iput-boolean v2, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writeNull:Z

    .line 82
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/alibaba/fastjson/serializer/FieldSerializer;)I
    .registers 4
    .param p1, "o"    # Lcom/alibaba/fastjson/serializer/FieldSerializer;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v1, p1, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/util/FieldInfo;->compareTo(Lcom/alibaba/fastjson/util/FieldInfo;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 28
    check-cast p1, Lcom/alibaba/fastjson/serializer/FieldSerializer;

    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/FieldSerializer;->compareTo(Lcom/alibaba/fastjson/serializer/FieldSerializer;)I

    move-result v0

    return v0
.end method

.method public getPropertyValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/util/FieldInfo;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public writePrefix(Lcom/alibaba/fastjson/serializer/JSONSerializer;)V
    .registers 5
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 87
    .local v0, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    iget-boolean v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    if-eqz v1, :cond_39

    .line 88
    iget-boolean v1, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-eqz v1, :cond_33

    .line 89
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->single_quoted_fieldPrefix:Ljava/lang/String;

    if-nez v1, :cond_2d

    .line 90
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x27

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v2, v2, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\':"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->single_quoted_fieldPrefix:Ljava/lang/String;

    .line 92
    :cond_2d
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->single_quoted_fieldPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 102
    :goto_32
    return-void

    .line 94
    :cond_33
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->double_quoted_fieldPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_32

    .line 97
    :cond_39
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->un_quoted_fieldPrefix:Ljava/lang/String;

    if-nez v1, :cond_56

    .line 98
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v2, v2, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->un_quoted_fieldPrefix:Ljava/lang/String;

    .line 100
    :cond_56
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->un_quoted_fieldPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_32
.end method

.method public writeValue(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;)V
    .registers 21
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "propertyValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 114
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->format:Ljava/lang/String;

    if-eqz v3, :cond_12

    .line 115
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->format:Ljava/lang/String;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v3}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->writeWithFormat(Ljava/lang/Object;Ljava/lang/String;)V

    .line 185
    .end local p2    # "propertyValue":Ljava/lang/Object;
    :goto_11
    return-void

    .line 119
    .restart local p2    # "propertyValue":Ljava/lang/Object;
    :cond_12
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->runtimeInfo:Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;

    if-nez v3, :cond_2f

    .line 122
    if-nez p2, :cond_59

    .line 123
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v15, v3, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 128
    .local v15, "runtimeFieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_20
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v2

    .line 129
    .local v2, "fieldSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    new-instance v3, Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;

    invoke-direct {v3, v2, v15}, Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;-><init>(Lcom/alibaba/fastjson/serializer/ObjectSerializer;Ljava/lang/Class;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->runtimeInfo:Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;

    .line 132
    .end local v2    # "fieldSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .end local v15    # "runtimeFieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->runtimeInfo:Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;

    move-object/from16 v16, v0

    .line 134
    .local v16, "runtimeInfo":Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget v7, v3, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    .line 136
    .local v7, "fieldFeatures":I
    if-nez p2, :cond_bb

    .line 137
    move-object/from16 v0, v16

    iget-object v15, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;->runtimeFieldClass:Ljava/lang/Class;

    .line 138
    .restart local v15    # "runtimeFieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 139
    .local v14, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    const-class v3, Ljava/lang/Number;

    invoke-virtual {v3, v15}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_5e

    .line 140
    move-object/from16 v0, p0

    iget v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->features:I

    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullNumberAsZero:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v4, v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-virtual {v14, v3, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(II)V

    goto :goto_11

    .line 125
    .end local v7    # "fieldFeatures":I
    .end local v14    # "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .end local v15    # "runtimeFieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v16    # "runtimeInfo":Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;
    :cond_59
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    .restart local v15    # "runtimeFieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_20

    .line 142
    .restart local v7    # "fieldFeatures":I
    .restart local v14    # "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .restart local v16    # "runtimeInfo":Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;
    :cond_5e
    const-class v3, Ljava/lang/String;

    if-ne v3, v15, :cond_6e

    .line 143
    move-object/from16 v0, p0

    iget v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->features:I

    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullStringAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v4, v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-virtual {v14, v3, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(II)V

    goto :goto_11

    .line 145
    :cond_6e
    const-class v3, Ljava/lang/Boolean;

    if-ne v3, v15, :cond_7e

    .line 146
    move-object/from16 v0, p0

    iget v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->features:I

    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullBooleanAsFalse:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v4, v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-virtual {v14, v3, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(II)V

    goto :goto_11

    .line 148
    :cond_7e
    const-class v3, Ljava/util/Collection;

    invoke-virtual {v3, v15}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_92

    .line 149
    move-object/from16 v0, p0

    iget v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->features:I

    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullListAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v4, v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-virtual {v14, v3, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(II)V

    goto :goto_11

    .line 153
    :cond_92
    move-object/from16 v0, v16

    iget-object v2, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;->fieldSerializer:Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    .line 155
    .restart local v2    # "fieldSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteMapNullValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v14, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v3

    if-eqz v3, :cond_a7

    instance-of v3, v2, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    if-eqz v3, :cond_a7

    .line 157
    invoke-virtual {v14}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    goto/16 :goto_11

    .line 161
    :cond_a7
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v5, v3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v6, v3, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    move-object/from16 v3, p1

    invoke-interface/range {v2 .. v7}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V

    goto/16 :goto_11

    .line 165
    .end local v2    # "fieldSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .end local v14    # "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .end local v15    # "runtimeFieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_bb
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-boolean v3, v3, Lcom/alibaba/fastjson/util/FieldInfo;->isEnum:Z

    if-eqz v3, :cond_ed

    .line 166
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writeEnumUsingName:Z

    if-eqz v3, :cond_d8

    .line 167
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    check-cast p2, Ljava/lang/Enum;

    .end local p2    # "propertyValue":Ljava/lang/Object;
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 171
    .restart local p2    # "propertyValue":Ljava/lang/Object;
    :cond_d8
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->writeEnumUsingToString:Z

    if-eqz v3, :cond_ed

    .line 172
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    check-cast p2, Ljava/lang/Enum;

    .end local p2    # "propertyValue":Ljava/lang/Object;
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    goto/16 :goto_11

    .line 177
    .restart local p2    # "propertyValue":Ljava/lang/Object;
    :cond_ed
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v17

    .line 178
    .local v17, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, v16

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;->runtimeFieldClass:Ljava/lang/Class;

    move-object/from16 v0, v17

    if-ne v0, v3, :cond_113

    .line 179
    move-object/from16 v0, v16

    iget-object v8, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer$RuntimeSerializerInfo;->fieldSerializer:Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v11, v3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v12, v3, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    move-object/from16 v9, p1

    move-object/from16 v10, p2

    move v13, v7

    invoke-interface/range {v8 .. v13}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V

    goto/16 :goto_11

    .line 183
    :cond_113
    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v8

    .line 184
    .local v8, "valueSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v11, v3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/alibaba/fastjson/serializer/FieldSerializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v12, v3, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    move-object/from16 v9, p1

    move-object/from16 v10, p2

    move v13, v7

    invoke-interface/range {v8 .. v13}, Lcom/alibaba/fastjson/serializer/ObjectSerializer;->write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V

    goto/16 :goto_11
.end method
