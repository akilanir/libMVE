.class public Lcom/alibaba/fastjson/util/FieldInfo;
.super Ljava/lang/Object;
.source "FieldInfo.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/alibaba/fastjson/util/FieldInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public final declaringClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public final field:Ljava/lang/reflect/Field;

.field public final fieldAccess:Z

.field private final fieldAnnotation:Lcom/alibaba/fastjson/annotation/JSONField;

.field public final fieldClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public final fieldTransient:Z

.field public final fieldType:Ljava/lang/reflect/Type;

.field public final getOnly:Z

.field public final isEnum:Z

.field public final label:Ljava/lang/String;

.field public final method:Ljava/lang/reflect/Method;

.field private final methodAnnotation:Lcom/alibaba/fastjson/annotation/JSONField;

.field public final name:Ljava/lang/String;

.field public final name_chars:[C

.field private ordinal:I

.field public final serialzeFeatures:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/reflect/Field;II)V
    .registers 12
    .param p1, "name"    # Ljava/lang/String;
    .param p4, "fieldType"    # Ljava/lang/reflect/Type;
    .param p5, "field"    # Ljava/lang/reflect/Field;
    .param p6, "ordinal"    # I
    .param p7, "serialzeFeatures"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/Field;",
            "II)V"
        }
    .end annotation

    .prologue
    .local p2, "declaringClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput v2, p0, Lcom/alibaba/fastjson/util/FieldInfo;->ordinal:I

    .line 49
    iput-object p1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 50
    iput-object p2, p0, Lcom/alibaba/fastjson/util/FieldInfo;->declaringClass:Ljava/lang/Class;

    .line 51
    iput-object p3, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 52
    iput-object p4, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    .line 53
    iput-object v3, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    .line 54
    iput-object p5, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    .line 55
    iput p6, p0, Lcom/alibaba/fastjson/util/FieldInfo;->ordinal:I

    .line 56
    iput p7, p0, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    .line 58
    invoke-virtual {p3}, Ljava/lang/Class;->isEnum()Z

    move-result v1

    iput-boolean v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->isEnum:Z

    .line 60
    if-eqz p5, :cond_4c

    .line 61
    invoke-virtual {p5}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    .line 62
    .local v0, "modifiers":I
    and-int/lit8 v1, v0, 0x1

    if-nez v1, :cond_2b

    iget-object v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    if-nez v1, :cond_4a

    :cond_2b
    const/4 v1, 0x1

    :goto_2c
    iput-boolean v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldAccess:Z

    .line 63
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldTransient:Z

    .line 69
    .end local v0    # "modifiers":I
    :goto_34
    invoke-virtual {p0}, Lcom/alibaba/fastjson/util/FieldInfo;->genFieldNameChars()[C

    move-result-object v1

    iput-object v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->name_chars:[C

    .line 71
    if-eqz p5, :cond_3f

    .line 72
    invoke-static {p5}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 75
    :cond_3f
    const-string v1, ""

    iput-object v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->label:Ljava/lang/String;

    .line 76
    iput-object v3, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldAnnotation:Lcom/alibaba/fastjson/annotation/JSONField;

    .line 77
    iput-object v3, p0, Lcom/alibaba/fastjson/util/FieldInfo;->methodAnnotation:Lcom/alibaba/fastjson/annotation/JSONField;

    .line 78
    iput-boolean v2, p0, Lcom/alibaba/fastjson/util/FieldInfo;->getOnly:Z

    .line 79
    return-void

    .restart local v0    # "modifiers":I
    :cond_4a
    move v1, v2

    .line 62
    goto :goto_2c

    .line 65
    .end local v0    # "modifiers":I
    :cond_4c
    iput-boolean v2, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldTransient:Z

    .line 66
    iput-boolean v2, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldAccess:Z

    goto :goto_34
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V
    .registers 22
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "field"    # Ljava/lang/reflect/Field;
    .param p5, "type"    # Ljava/lang/reflect/Type;
    .param p6, "ordinal"    # I
    .param p7, "serialzeFeatures"    # I
    .param p8, "fieldAnnotation"    # Lcom/alibaba/fastjson/annotation/JSONField;
    .param p9, "methodAnnotation"    # Lcom/alibaba/fastjson/annotation/JSONField;
    .param p10, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Field;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            "II",
            "Lcom/alibaba/fastjson/annotation/JSONField;",
            "Lcom/alibaba/fastjson/annotation/JSONField;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 90
    .local p4, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v9, 0x0

    iput v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->ordinal:I

    .line 91
    if-eqz p3, :cond_13

    .line 92
    invoke-virtual {p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    .line 93
    .local v2, "fieldName":Ljava/lang/String;
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_13

    .line 94
    move-object p1, v2

    .line 98
    .end local v2    # "fieldName":Ljava/lang/String;
    :cond_13
    iput-object p1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    .line 99
    iput-object p2, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    .line 100
    iput-object p3, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    .line 101
    move/from16 v0, p6

    iput v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->ordinal:I

    .line 102
    move/from16 v0, p7

    iput v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    .line 103
    move-object/from16 v0, p8

    iput-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldAnnotation:Lcom/alibaba/fastjson/annotation/JSONField;

    .line 104
    move-object/from16 v0, p9

    iput-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->methodAnnotation:Lcom/alibaba/fastjson/annotation/JSONField;

    .line 106
    if-eqz p3, :cond_9b

    .line 107
    invoke-virtual {p3}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    .line 108
    .local v6, "modifiers":I
    and-int/lit8 v9, v6, 0x1

    if-nez v9, :cond_35

    if-nez p2, :cond_99

    :cond_35
    const/4 v9, 0x1

    :goto_36
    iput-boolean v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldAccess:Z

    .line 109
    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v9

    iput-boolean v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldTransient:Z

    .line 115
    .end local v6    # "modifiers":I
    :goto_3e
    if-eqz p10, :cond_a2

    invoke-virtual/range {p10 .. p10}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_a2

    .line 116
    move-object/from16 v0, p10

    iput-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->label:Ljava/lang/String;

    .line 121
    :goto_4a
    invoke-virtual {p0}, Lcom/alibaba/fastjson/util/FieldInfo;->genFieldNameChars()[C

    move-result-object v9

    iput-object v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->name_chars:[C

    .line 123
    if-eqz p2, :cond_55

    .line 124
    invoke-static {p2}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 127
    :cond_55
    if-eqz p3, :cond_5a

    .line 128
    invoke-static {p3}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 131
    :cond_5a
    const/4 v5, 0x0

    .line 134
    .local v5, "getOnly":Z
    if-eqz p2, :cond_b1

    .line 136
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    .local v8, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v9, v8

    const/4 v10, 0x1

    if-ne v9, v10, :cond_a7

    .line 137
    const/4 v9, 0x0

    aget-object v1, v8, v9

    .line 138
    .local v1, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    move-result-object v9

    const/4 v10, 0x0

    aget-object v3, v9, v10

    .line 144
    .local v3, "fieldType":Ljava/lang/reflect/Type;
    :goto_6f
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v9

    iput-object v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->declaringClass:Ljava/lang/Class;

    .line 151
    .end local v8    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :goto_75
    iput-boolean v5, p0, Lcom/alibaba/fastjson/util/FieldInfo;->getOnly:Z

    .line 153
    if-eqz p4, :cond_c8

    const-class v9, Ljava/lang/Object;

    if-ne v1, v9, :cond_c8

    instance-of v9, v3, Ljava/lang/reflect/TypeVariable;

    if-eqz v9, :cond_c8

    move-object v7, v3

    .line 154
    check-cast v7, Ljava/lang/reflect/TypeVariable;

    .line 155
    .local v7, "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-static {p4, v7}, Lcom/alibaba/fastjson/util/FieldInfo;->getInheritGenericType(Ljava/lang/Class;Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;

    move-result-object v4

    .line 156
    .local v4, "genericFieldType":Ljava/lang/reflect/Type;
    if-eqz v4, :cond_c8

    .line 157
    invoke-static {v4}, Lcom/alibaba/fastjson/util/TypeUtils;->getClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v9

    iput-object v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 158
    iput-object v4, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    .line 160
    invoke-virtual {v1}, Ljava/lang/Class;->isEnum()Z

    move-result v9

    iput-boolean v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->isEnum:Z

    .line 183
    .end local v7    # "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :goto_98
    return-void

    .line 108
    .end local v1    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "fieldType":Ljava/lang/reflect/Type;
    .end local v4    # "genericFieldType":Ljava/lang/reflect/Type;
    .end local v5    # "getOnly":Z
    .restart local v6    # "modifiers":I
    :cond_99
    const/4 v9, 0x0

    goto :goto_36

    .line 111
    .end local v6    # "modifiers":I
    :cond_9b
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldAccess:Z

    .line 112
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldTransient:Z

    goto :goto_3e

    .line 118
    :cond_a2
    const-string v9, ""

    iput-object v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->label:Ljava/lang/String;

    goto :goto_4a

    .line 140
    .restart local v5    # "getOnly":Z
    .restart local v8    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_a7
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    .line 141
    .restart local v1    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getGenericReturnType()Ljava/lang/reflect/Type;

    move-result-object v3

    .line 142
    .restart local v3    # "fieldType":Ljava/lang/reflect/Type;
    const/4 v5, 0x1

    goto :goto_6f

    .line 146
    .end local v1    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "fieldType":Ljava/lang/reflect/Type;
    .end local v8    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_b1
    invoke-virtual {p3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    .line 147
    .restart local v1    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p3}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v3

    .line 148
    .restart local v3    # "fieldType":Ljava/lang/reflect/Type;
    invoke-virtual {p3}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v9

    iput-object v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->declaringClass:Ljava/lang/Class;

    .line 149
    invoke-virtual {p3}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v9

    invoke-static {v9}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v5

    goto :goto_75

    .line 165
    :cond_c8
    move-object v4, v3

    .line 167
    .restart local v4    # "genericFieldType":Ljava/lang/reflect/Type;
    instance-of v9, v3, Ljava/lang/Class;

    if-nez v9, :cond_dd

    .line 168
    move-object/from16 v0, p5

    invoke-static {p4, v0, v3}, Lcom/alibaba/fastjson/util/FieldInfo;->getFieldType(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v4

    .line 170
    if-eq v4, v3, :cond_dd

    .line 171
    instance-of v9, v4, Ljava/lang/reflect/ParameterizedType;

    if-eqz v9, :cond_e8

    .line 172
    invoke-static {v4}, Lcom/alibaba/fastjson/util/TypeUtils;->getClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v1

    .line 179
    :cond_dd
    :goto_dd
    iput-object v4, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    .line 180
    iput-object v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 182
    invoke-virtual {v1}, Ljava/lang/Class;->isEnum()Z

    move-result v9

    iput-boolean v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->isEnum:Z

    goto :goto_98

    .line 173
    :cond_e8
    instance-of v9, v4, Ljava/lang/Class;

    if-eqz v9, :cond_dd

    .line 174
    invoke-static {v4}, Lcom/alibaba/fastjson/util/TypeUtils;->getClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_dd
.end method

.method public static getFieldType(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .registers 23
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "fieldType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 214
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p0, :cond_4

    if-nez p1, :cond_7

    :cond_4
    move-object/from16 v9, p2

    .line 283
    :goto_6
    return-object v9

    .line 218
    :cond_7
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/reflect/GenericArrayType;

    move/from16 v18, v0

    if-eqz v18, :cond_33

    move-object/from16 v10, p2

    .line 219
    check-cast v10, Ljava/lang/reflect/GenericArrayType;

    .line 220
    .local v10, "genericArrayType":Ljava/lang/reflect/GenericArrayType;
    invoke-interface {v10}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v6

    .line 221
    .local v6, "componentType":Ljava/lang/reflect/Type;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v6}, Lcom/alibaba/fastjson/util/FieldInfo;->getFieldType(Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v7

    .line 222
    .local v7, "componentTypeX":Ljava/lang/reflect/Type;
    if-eq v6, v7, :cond_30

    .line 223
    invoke-static {v7}, Lcom/alibaba/fastjson/util/TypeUtils;->getClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v18

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    .line 224
    .local v9, "fieldTypeX":Ljava/lang/reflect/Type;
    goto :goto_6

    .end local v9    # "fieldTypeX":Ljava/lang/reflect/Type;
    :cond_30
    move-object/from16 v9, p2

    .line 227
    goto :goto_6

    .line 230
    .end local v6    # "componentType":Ljava/lang/reflect/Type;
    .end local v7    # "componentTypeX":Ljava/lang/reflect/Type;
    .end local v10    # "genericArrayType":Ljava/lang/reflect/GenericArrayType;
    :cond_33
    invoke-static/range {p1 .. p1}, Lcom/alibaba/fastjson/util/TypeUtils;->isGenericParamType(Ljava/lang/reflect/Type;)Z

    move-result v18

    if-nez v18, :cond_3c

    move-object/from16 v9, p2

    .line 231
    goto :goto_6

    .line 234
    :cond_3c
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/reflect/TypeVariable;

    move/from16 v18, v0

    if-eqz v18, :cond_7c

    .line 235
    invoke-static/range {p1 .. p1}, Lcom/alibaba/fastjson/util/TypeUtils;->getGenericParamType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v13

    check-cast v13, Ljava/lang/reflect/ParameterizedType;

    .line 236
    .local v13, "paramType":Ljava/lang/reflect/ParameterizedType;
    invoke-static {v13}, Lcom/alibaba/fastjson/util/TypeUtils;->getClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v14

    .local v14, "parameterizedClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v16, p2

    .line 237
    check-cast v16, Ljava/lang/reflect/TypeVariable;

    .line 239
    .local v16, "typeVar":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-virtual {v14}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v17

    .line 240
    .local v17, "typeVariables":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_57
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v11, v0, :cond_7c

    .line 241
    aget-object v18, v17, v11

    invoke-interface/range {v18 .. v18}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v16 .. v16}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_79

    .line 242
    invoke-interface {v13}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v18

    aget-object p2, v18, v11

    move-object/from16 v9, p2

    .line 243
    goto :goto_6

    .line 240
    :cond_79
    add-int/lit8 v11, v11, 0x1

    goto :goto_57

    .line 248
    .end local v11    # "i":I
    .end local v13    # "paramType":Ljava/lang/reflect/ParameterizedType;
    .end local v14    # "parameterizedClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v16    # "typeVar":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    .end local v17    # "typeVariables":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    :cond_7c
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/lang/reflect/ParameterizedType;

    move/from16 v18, v0

    if-eqz v18, :cond_fa

    move-object/from16 v15, p2

    .line 249
    check-cast v15, Ljava/lang/reflect/ParameterizedType;

    .line 251
    .local v15, "parameterizedFieldType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v15}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v4

    .line 252
    .local v4, "arguments":[Ljava/lang/reflect/Type;
    const/4 v5, 0x0

    .line 253
    .local v5, "changed":Z
    const/16 v17, 0x0

    .line 254
    .restart local v17    # "typeVariables":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    const/4 v3, 0x0

    .line 255
    .local v3, "actualTypes":[Ljava/lang/reflect/Type;
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_91
    array-length v0, v4

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v11, v0, :cond_e1

    .line 256
    aget-object v8, v4, v11

    .line 257
    .local v8, "feildTypeArguement":Ljava/lang/reflect/Type;
    instance-of v0, v8, Ljava/lang/reflect/TypeVariable;

    move/from16 v18, v0

    if-eqz v18, :cond_de

    move-object/from16 v16, v8

    .line 258
    check-cast v16, Ljava/lang/reflect/TypeVariable;

    .line 260
    .restart local v16    # "typeVar":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    move-object/from16 v0, p1

    instance-of v0, v0, Ljava/lang/reflect/ParameterizedType;

    move/from16 v18, v0

    if-eqz v18, :cond_de

    .line 261
    if-nez v17, :cond_b2

    .line 262
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v17

    .line 264
    :cond_b2
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_b3
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v12, v0, :cond_de

    .line 265
    aget-object v18, v17, v12

    invoke-interface/range {v18 .. v18}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v16 .. v16}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_db

    .line 266
    if-nez v3, :cond_d6

    move-object/from16 v18, p1

    .line 267
    check-cast v18, Ljava/lang/reflect/ParameterizedType;

    invoke-interface/range {v18 .. v18}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v3

    .line 269
    :cond_d6
    aget-object v18, v3, v12

    aput-object v18, v4, v11

    .line 270
    const/4 v5, 0x1

    .line 264
    :cond_db
    add-int/lit8 v12, v12, 0x1

    goto :goto_b3

    .line 255
    .end local v12    # "j":I
    .end local v16    # "typeVar":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :cond_de
    add-int/lit8 v11, v11, 0x1

    goto :goto_91

    .line 276
    .end local v8    # "feildTypeArguement":Ljava/lang/reflect/Type;
    :cond_e1
    if-eqz v5, :cond_fa

    .line 277
    new-instance p2, Lcom/alibaba/fastjson/util/ParameterizedTypeImpl;

    .end local p2    # "fieldType":Ljava/lang/reflect/Type;
    invoke-interface {v15}, Ljava/lang/reflect/ParameterizedType;->getOwnerType()Ljava/lang/reflect/Type;

    move-result-object v18

    .line 278
    invoke-interface {v15}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v19

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v4, v1, v2}, Lcom/alibaba/fastjson/util/ParameterizedTypeImpl;-><init>([Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)V

    .restart local p2    # "fieldType":Ljava/lang/reflect/Type;
    move-object/from16 v9, p2

    .line 279
    goto/16 :goto_6

    .end local v3    # "actualTypes":[Ljava/lang/reflect/Type;
    .end local v4    # "arguments":[Ljava/lang/reflect/Type;
    .end local v5    # "changed":Z
    .end local v11    # "i":I
    .end local v15    # "parameterizedFieldType":Ljava/lang/reflect/ParameterizedType;
    .end local v17    # "typeVariables":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    :cond_fa
    move-object/from16 v9, p2

    .line 283
    goto/16 :goto_6
.end method

.method public static getInheritGenericType(Ljava/lang/Class;Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "tv":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    const/4 v6, 0x0

    .line 287
    const/4 v4, 0x0

    .line 288
    .local v4, "type":Ljava/lang/reflect/Type;
    invoke-interface {p1}, Ljava/lang/reflect/TypeVariable;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object v0

    .line 290
    .local v0, "gd":Ljava/lang/reflect/GenericDeclaration;
    :cond_6
    invoke-virtual {p0}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v4

    .line 291
    if-nez v4, :cond_d

    .line 307
    :cond_c
    :goto_c
    return-object v6

    .line 294
    :cond_d
    instance-of v7, v4, Ljava/lang/reflect/ParameterizedType;

    if-eqz v7, :cond_30

    move-object v2, v4

    .line 295
    check-cast v2, Ljava/lang/reflect/ParameterizedType;

    .line 296
    .local v2, "ptype":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v2}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v7

    if-ne v7, v0, :cond_30

    .line 297
    invoke-interface {v0}, Ljava/lang/reflect/GenericDeclaration;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v3

    .line 298
    .local v3, "tvs":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {v2}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v5

    .line 299
    .local v5, "types":[Ljava/lang/reflect/Type;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_23
    array-length v7, v3

    if-ge v1, v7, :cond_c

    .line 300
    aget-object v7, v3, v1

    if-ne v7, p1, :cond_2d

    aget-object v6, v5, v1

    goto :goto_c

    .line 299
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    .line 305
    .end local v1    # "i":I
    .end local v2    # "ptype":Ljava/lang/reflect/ParameterizedType;
    .end local v3    # "tvs":[Ljava/lang/reflect/TypeVariable;, "[Ljava/lang/reflect/TypeVariable<*>;"
    .end local v5    # "types":[Ljava/lang/reflect/Type;
    :cond_30
    invoke-static {v4}, Lcom/alibaba/fastjson/util/TypeUtils;->getClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object p0

    .line 306
    if-nez v4, :cond_6

    goto :goto_c
.end method


# virtual methods
.method public compareTo(Lcom/alibaba/fastjson/util/FieldInfo;)I
    .registers 12
    .param p1, "o"    # Lcom/alibaba/fastjson/util/FieldInfo;

    .prologue
    const/4 v6, 0x0

    const/4 v7, -0x1

    const/4 v5, 0x1

    .line 335
    iget v8, p0, Lcom/alibaba/fastjson/util/FieldInfo;->ordinal:I

    iget v9, p1, Lcom/alibaba/fastjson/util/FieldInfo;->ordinal:I

    if-ge v8, v9, :cond_b

    move v5, v7

    .line 389
    :cond_a
    :goto_a
    return v5

    .line 339
    :cond_b
    iget v8, p0, Lcom/alibaba/fastjson/util/FieldInfo;->ordinal:I

    iget v9, p1, Lcom/alibaba/fastjson/util/FieldInfo;->ordinal:I

    if-gt v8, v9, :cond_a

    .line 343
    iget-object v8, p0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    iget-object v9, p1, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    .line 345
    .local v3, "result":I
    if-eqz v3, :cond_1d

    move v5, v3

    .line 346
    goto :goto_a

    .line 349
    :cond_1d
    invoke-virtual {p0}, Lcom/alibaba/fastjson/util/FieldInfo;->getDeclaredClass()Ljava/lang/Class;

    move-result-object v4

    .line 350
    .local v4, "thisDeclaringClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Lcom/alibaba/fastjson/util/FieldInfo;->getDeclaredClass()Ljava/lang/Class;

    move-result-object v2

    .line 352
    .local v2, "otherDeclaringClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v4, :cond_39

    if-eqz v2, :cond_39

    if-eq v4, v2, :cond_39

    .line 353
    invoke-virtual {v4, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_33

    move v5, v7

    .line 354
    goto :goto_a

    .line 357
    :cond_33
    invoke-virtual {v2, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_a

    .line 362
    :cond_39
    iget-object v8, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    if-eqz v8, :cond_61

    iget-object v8, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    iget-object v9, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    if-ne v8, v9, :cond_61

    move v0, v5

    .line 363
    .local v0, "isSampeType":Z
    :goto_48
    iget-object v8, p1, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    if-eqz v8, :cond_63

    iget-object v8, p1, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    iget-object v9, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    if-ne v8, v9, :cond_63

    move v1, v5

    .line 365
    .local v1, "oSameType":Z
    :goto_57
    if-eqz v0, :cond_5b

    if-eqz v1, :cond_a

    .line 369
    :cond_5b
    if-eqz v1, :cond_65

    if-nez v0, :cond_65

    move v5, v7

    .line 370
    goto :goto_a

    .end local v0    # "isSampeType":Z
    .end local v1    # "oSameType":Z
    :cond_61
    move v0, v6

    .line 362
    goto :goto_48

    .restart local v0    # "isSampeType":Z
    :cond_63
    move v1, v6

    .line 363
    goto :goto_57

    .line 373
    .restart local v1    # "oSameType":Z
    :cond_65
    iget-object v6, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-eqz v6, :cond_75

    iget-object v6, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 377
    :cond_75
    iget-object v6, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-eqz v6, :cond_87

    iget-object v6, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-nez v6, :cond_87

    move v5, v7

    .line 378
    goto :goto_a

    .line 381
    :cond_87
    iget-object v6, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v8, "java."

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a3

    iget-object v6, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v8, "java."

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 385
    :cond_a3
    iget-object v5, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "java."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_c2

    iget-object v5, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "java."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_c2

    move v5, v7

    .line 386
    goto/16 :goto_a

    .line 389
    :cond_c2
    iget-object v5, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    goto/16 :goto_a
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 18
    check-cast p1, Lcom/alibaba/fastjson/util/FieldInfo;

    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/util/FieldInfo;->compareTo(Lcom/alibaba/fastjson/util/FieldInfo;)I

    move-result v0

    return v0
.end method

.method protected genFieldNameChars()[C
    .registers 8

    .prologue
    const/16 v6, 0x22

    const/4 v5, 0x0

    .line 186
    iget-object v2, p0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    .line 187
    .local v0, "nameLen":I
    add-int/lit8 v2, v0, 0x3

    new-array v1, v2, [C

    .line 188
    .local v1, "name_chars":[C
    iget-object v2, p0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    invoke-virtual {v2, v5, v3, v1, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 189
    aput-char v6, v1, v5

    .line 190
    add-int/lit8 v2, v0, 0x1

    aput-char v6, v1, v2

    .line 191
    add-int/lit8 v2, v0, 0x2

    const/16 v3, 0x3a

    aput-char v3, v1, v2

    .line 192
    return-object v1
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "javaObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 415
    iget-object v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_e

    .line 416
    iget-object v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 420
    :goto_d
    return-object v0

    :cond_e
    iget-object v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_d
.end method

.method public getAnnation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 197
    .local p1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v1, Lcom/alibaba/fastjson/annotation/JSONField;

    if-ne p1, v1, :cond_9

    .line 198
    invoke-virtual {p0}, Lcom/alibaba/fastjson/util/FieldInfo;->getAnnotation()Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v0

    .line 210
    :cond_8
    :goto_8
    return-object v0

    .line 201
    :cond_9
    const/4 v0, 0x0

    .line 202
    .local v0, "annotatition":Ljava/lang/annotation/Annotation;, "TT;"
    iget-object v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_14

    .line 203
    iget-object v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    .line 206
    :cond_14
    if-nez v0, :cond_8

    iget-object v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_8

    .line 207
    iget-object v1, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    goto :goto_8
.end method

.method public getAnnotation()Lcom/alibaba/fastjson/annotation/JSONField;
    .registers 2

    .prologue
    .line 393
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldAnnotation:Lcom/alibaba/fastjson/annotation/JSONField;

    if-eqz v0, :cond_7

    .line 394
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldAnnotation:Lcom/alibaba/fastjson/annotation/JSONField;

    .line 397
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->methodAnnotation:Lcom/alibaba/fastjson/annotation/JSONField;

    goto :goto_6
.end method

.method protected getDeclaredClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 323
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_b

    .line 324
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    .line 331
    :goto_a
    return-object v0

    .line 327
    :cond_b
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_16

    .line 328
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_a

    .line 331
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getFormat()Ljava/lang/String;
    .registers 4

    .prologue
    .line 401
    const/4 v1, 0x0

    .line 402
    .local v1, "format":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/alibaba/fastjson/util/FieldInfo;->getAnnotation()Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v0

    .line 404
    .local v0, "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v0, :cond_16

    .line 405
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->format()Ljava/lang/String;

    move-result-object v1

    .line 407
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_16

    .line 408
    const/4 v1, 0x0

    .line 411
    :cond_16
    return-object v1
.end method

.method public getMember()Ljava/lang/reflect/Member;
    .registers 2

    .prologue
    .line 315
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_7

    .line 316
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    .line 318
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    goto :goto_6
.end method

.method public set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6
    .param p1, "javaObject"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 424
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_10

    .line 425
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    :goto_f
    return-void

    .line 429
    :cond_10
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_f
.end method

.method public setAccessible()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 433
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_a

    .line 434
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 439
    :goto_9
    return-void

    .line 438
    :cond_a
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    goto :goto_9
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 311
    iget-object v0, p0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    return-object v0
.end method
