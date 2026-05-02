.class public Lcom/alibaba/fastjson/util/JavaBeanInfo;
.super Ljava/lang/Object;
.source "JavaBeanInfo.java"


# instance fields
.field public final buildMethod:Ljava/lang/reflect/Method;

.field public final builderClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public final clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public final creatorConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation
.end field

.field public final defaultConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation
.end field

.field public final defaultConstructorParameterSize:I

.field public final factoryMethod:Ljava/lang/reflect/Method;

.field public final fields:[Lcom/alibaba/fastjson/util/FieldInfo;

.field public final jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

.field public final parserFeatures:I

.field public final sortedFields:[Lcom/alibaba/fastjson/util/FieldInfo;

.field public final typeName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/List;)V
    .registers 14
    .param p5, "factoryMethod"    # Ljava/lang/reflect/Method;
    .param p6, "buildMethod"    # Ljava/lang/reflect/Method;
    .param p7, "jsonType"    # Lcom/alibaba/fastjson/annotation/JSONType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Constructor",
            "<*>;",
            "Ljava/lang/reflect/Constructor",
            "<*>;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Lcom/alibaba/fastjson/annotation/JSONType;",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "builderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "defaultConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .local p4, "creatorConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .local p8, "fieldList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    const/4 v2, 0x0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->clazz:Ljava/lang/Class;

    .line 54
    iput-object p2, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->builderClass:Ljava/lang/Class;

    .line 55
    iput-object p3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructor:Ljava/lang/reflect/Constructor;

    .line 56
    iput-object p4, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->creatorConstructor:Ljava/lang/reflect/Constructor;

    .line 57
    iput-object p5, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->factoryMethod:Ljava/lang/reflect/Method;

    .line 58
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->getParserFeatures(Ljava/lang/Class;)I

    move-result v3

    iput v3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->parserFeatures:I

    .line 59
    iput-object p6, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->buildMethod:Ljava/lang/reflect/Method;

    .line 61
    iput-object p7, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;

    .line 62
    if-eqz p7, :cond_60

    .line 63
    invoke-interface {p7}, Lcom/alibaba/fastjson/annotation/JSONType;->typeName()Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "typeName":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_59

    .line 65
    iput-object v1, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeName:Ljava/lang/String;

    .line 73
    .end local v1    # "typeName":Ljava/lang/String;
    :goto_26
    invoke-interface {p8}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lcom/alibaba/fastjson/util/FieldInfo;

    iput-object v3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 74
    iget-object v3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    invoke-interface {p8, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 76
    iget-object v3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    array-length v3, v3

    new-array v0, v3, [Lcom/alibaba/fastjson/util/FieldInfo;

    .line 77
    .local v0, "sortedFields":[Lcom/alibaba/fastjson/util/FieldInfo;
    iget-object v3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v4, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    array-length v4, v4

    invoke-static {v3, v2, v0, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 80
    iget-object v3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    invoke-static {v3, v0}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4d

    .line 81
    iget-object v0, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 83
    :cond_4d
    iput-object v0, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->sortedFields:[Lcom/alibaba/fastjson/util/FieldInfo;

    .line 85
    if-eqz p3, :cond_56

    invoke-virtual {p3}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    array-length v2, v2

    :cond_56
    iput v2, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructorParameterSize:I

    .line 86
    return-void

    .line 67
    .end local v0    # "sortedFields":[Lcom/alibaba/fastjson/util/FieldInfo;
    .restart local v1    # "typeName":Ljava/lang/String;
    :cond_59
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeName:Ljava/lang/String;

    goto :goto_26

    .line 70
    .end local v1    # "typeName":Ljava/lang/String;
    :cond_60
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/alibaba/fastjson/util/JavaBeanInfo;->typeName:Ljava/lang/String;

    goto :goto_26
.end method

.method static add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z
    .registers 7
    .param p1, "field"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, "fieldList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_6
    if-ltz v0, :cond_30

    .line 100
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 102
    .local v1, "item":Lcom/alibaba/fastjson/util/FieldInfo;
    iget-object v3, v1, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    iget-object v4, p1, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_20

    .line 103
    iget-boolean v3, v1, Lcom/alibaba/fastjson/util/FieldInfo;->getOnly:Z

    if-eqz v3, :cond_23

    iget-boolean v3, p1, Lcom/alibaba/fastjson/util/FieldInfo;->getOnly:Z

    if-nez v3, :cond_23

    .line 99
    :cond_20
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 107
    :cond_23
    iget-object v3, v1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    iget-object v4, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_35

    .line 108
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 122
    .end local v1    # "item":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_30
    :goto_30
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    const/4 v3, 0x1

    :goto_34
    return v3

    .line 112
    .restart local v1    # "item":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_35
    invoke-virtual {v1, p1}, Lcom/alibaba/fastjson/util/FieldInfo;->compareTo(Lcom/alibaba/fastjson/util/FieldInfo;)I

    move-result v2

    .line 114
    .local v2, "result":I
    if-gez v2, :cond_3f

    .line 115
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_30

    .line 118
    :cond_3f
    const/4 v3, 0x0

    goto :goto_34
.end method

.method public static build(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .registers 69
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/alibaba/fastjson/util/JavaBeanInfo;"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v4, Lcom/alibaba/fastjson/annotation/JSONType;

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v18

    check-cast v18, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 130
    .local v18, "jsonType":Lcom/alibaba/fastjson/annotation/JSONType;
    invoke-static/range {v18 .. v18}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getBuilderClass(Lcom/alibaba/fastjson/annotation/JSONType;)Ljava/lang/Class;

    move-result-object v13

    .line 132
    .local v13, "builderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v54

    .line 133
    .local v54, "declaredFields":[Ljava/lang/reflect/Field;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v60

    .line 135
    .local v60, "methods":[Ljava/lang/reflect/Method;
    if-nez v13, :cond_77

    move-object/from16 v4, p0

    :goto_1a
    invoke-static {v4}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getDefaultConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v55

    .line 136
    .local v55, "defaultConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v15, 0x0

    .line 137
    .local v15, "creatorConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/16 v47, 0x0

    .line 139
    .local v47, "buildMethod":Ljava/lang/reflect/Method;
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 141
    .local v19, "fieldList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    if-nez v55, :cond_167

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->isInterface()Z

    move-result v4

    if-nez v4, :cond_167

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v4

    if-nez v4, :cond_167

    .line 142
    invoke-static/range {p0 .. p0}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getCreatorConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v15

    .line 143
    if-eqz v15, :cond_bc

    .line 144
    invoke-static {v15}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 146
    invoke-virtual {v15}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v65

    .line 147
    .local v65, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v0, v65

    array-length v4, v0

    if-lez v4, :cond_af

    .line 148
    invoke-virtual {v15}, Ljava/lang/reflect/Constructor;->getParameterAnnotations()[[Ljava/lang/annotation/Annotation;

    move-result-object v62

    .line 149
    .local v62, "paramAnnotationArrays":[[Ljava/lang/annotation/Annotation;
    const/16 v56, 0x0

    .local v56, "i":I
    :goto_50
    move-object/from16 v0, v65

    array-length v4, v0

    move/from16 v0, v56

    if-ge v0, v4, :cond_af

    .line 150
    aget-object v63, v62, v56

    .line 151
    .local v63, "paramAnnotations":[Ljava/lang/annotation/Annotation;
    const/16 v35, 0x0

    .line 152
    .local v35, "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    move-object/from16 v0, v63

    array-length v5, v0

    const/4 v4, 0x0

    :goto_5f
    if-ge v4, v5, :cond_6d

    aget-object v61, v63, v4

    .line 153
    .local v61, "paramAnnotation":Ljava/lang/annotation/Annotation;
    move-object/from16 v0, v61

    instance-of v11, v0, Lcom/alibaba/fastjson/annotation/JSONField;

    if-eqz v11, :cond_79

    move-object/from16 v35, v61

    .line 154
    check-cast v35, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 158
    .end local v61    # "paramAnnotation":Ljava/lang/annotation/Annotation;
    :cond_6d
    if-nez v35, :cond_7c

    .line 159
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    const-string v5, "illegal json creator"

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v15    # "creatorConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v19    # "fieldList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    .end local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v47    # "buildMethod":Ljava/lang/reflect/Method;
    .end local v55    # "defaultConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v56    # "i":I
    .end local v62    # "paramAnnotationArrays":[[Ljava/lang/annotation/Annotation;
    .end local v63    # "paramAnnotations":[Ljava/lang/annotation/Annotation;
    .end local v65    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_77
    move-object v4, v13

    .line 135
    goto :goto_1a

    .line 152
    .restart local v15    # "creatorConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .restart local v19    # "fieldList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    .restart local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .restart local v47    # "buildMethod":Ljava/lang/reflect/Method;
    .restart local v55    # "defaultConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .restart local v56    # "i":I
    .restart local v61    # "paramAnnotation":Ljava/lang/annotation/Annotation;
    .restart local v62    # "paramAnnotationArrays":[[Ljava/lang/annotation/Annotation;
    .restart local v63    # "paramAnnotations":[Ljava/lang/annotation/Annotation;
    .restart local v65    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_79
    add-int/lit8 v4, v4, 0x1

    goto :goto_5f

    .line 161
    .end local v61    # "paramAnnotation":Ljava/lang/annotation/Annotation;
    :cond_7c
    aget-object v6, v65, v56

    .line 162
    .local v6, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v15}, Ljava/lang/reflect/Constructor;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    move-result-object v4

    aget-object v7, v4, v56

    .line 163
    .local v7, "fieldType":Ljava/lang/reflect/Type;
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v54

    invoke-static {v0, v4, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 164
    .local v8, "field":Ljava/lang/reflect/Field;
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v9

    .line 165
    .local v9, "ordinal":I
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v4

    invoke-static {v4}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v10

    .line 166
    .local v10, "serialzeFeatures":I
    new-instance v3, Lcom/alibaba/fastjson/util/FieldInfo;

    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v5, p0

    invoke-direct/range {v3 .. v10}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/reflect/Field;II)V

    .line 168
    .local v3, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v19

    invoke-static {v0, v3}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    .line 149
    add-int/lit8 v56, v56, 0x1

    goto :goto_50

    .line 172
    .end local v3    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v6    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "fieldType":Ljava/lang/reflect/Type;
    .end local v8    # "field":Ljava/lang/reflect/Field;
    .end local v9    # "ordinal":I
    .end local v10    # "serialzeFeatures":I
    .end local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v56    # "i":I
    .end local v62    # "paramAnnotationArrays":[[Ljava/lang/annotation/Annotation;
    .end local v63    # "paramAnnotations":[Ljava/lang/annotation/Annotation;
    :cond_af
    new-instance v11, Lcom/alibaba/fastjson/util/JavaBeanInfo;

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v12, p0

    invoke-direct/range {v11 .. v19}, Lcom/alibaba/fastjson/util/JavaBeanInfo;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/List;)V

    .line 492
    .end local v65    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :goto_bb
    return-object v11

    .line 175
    :cond_bc
    move-object/from16 v0, p0

    move-object/from16 v1, v60

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getFactoryMethod(Ljava/lang/Class;[Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v25

    .line 176
    .local v25, "factoryMethod":Ljava/lang/reflect/Method;
    if-eqz v25, :cond_14c

    .line 177
    invoke-static/range {v25 .. v25}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 179
    invoke-virtual/range {v25 .. v25}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v65

    .line 180
    .restart local v65    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v0, v65

    array-length v4, v0

    if-lez v4, :cond_135

    .line 181
    invoke-virtual/range {v25 .. v25}, Ljava/lang/reflect/Method;->getParameterAnnotations()[[Ljava/lang/annotation/Annotation;

    move-result-object v62

    .line 182
    .restart local v62    # "paramAnnotationArrays":[[Ljava/lang/annotation/Annotation;
    const/16 v56, 0x0

    .restart local v56    # "i":I
    :goto_d8
    move-object/from16 v0, v65

    array-length v4, v0

    move/from16 v0, v56

    if-ge v0, v4, :cond_135

    .line 183
    aget-object v63, v62, v56

    .line 184
    .restart local v63    # "paramAnnotations":[Ljava/lang/annotation/Annotation;
    const/16 v35, 0x0

    .line 185
    .restart local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    move-object/from16 v0, v63

    array-length v5, v0

    const/4 v4, 0x0

    :goto_e7
    if-ge v4, v5, :cond_f5

    aget-object v61, v63, v4

    .line 186
    .restart local v61    # "paramAnnotation":Ljava/lang/annotation/Annotation;
    move-object/from16 v0, v61

    instance-of v11, v0, Lcom/alibaba/fastjson/annotation/JSONField;

    if-eqz v11, :cond_ff

    move-object/from16 v35, v61

    .line 187
    check-cast v35, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 191
    .end local v61    # "paramAnnotation":Ljava/lang/annotation/Annotation;
    :cond_f5
    if-nez v35, :cond_102

    .line 192
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    const-string v5, "illegal json creator"

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 185
    .restart local v61    # "paramAnnotation":Ljava/lang/annotation/Annotation;
    :cond_ff
    add-int/lit8 v4, v4, 0x1

    goto :goto_e7

    .line 195
    .end local v61    # "paramAnnotation":Ljava/lang/annotation/Annotation;
    :cond_102
    aget-object v6, v65, v56

    .line 196
    .restart local v6    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {v25 .. v25}, Ljava/lang/reflect/Method;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    move-result-object v4

    aget-object v7, v4, v56

    .line 197
    .restart local v7    # "fieldType":Ljava/lang/reflect/Type;
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v54

    invoke-static {v0, v4, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 198
    .restart local v8    # "field":Ljava/lang/reflect/Field;
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v9

    .line 199
    .restart local v9    # "ordinal":I
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v4

    invoke-static {v4}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v10

    .line 200
    .restart local v10    # "serialzeFeatures":I
    new-instance v3, Lcom/alibaba/fastjson/util/FieldInfo;

    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v5, p0

    invoke-direct/range {v3 .. v10}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/lang/reflect/Field;II)V

    .line 202
    .restart local v3    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v19

    invoke-static {v0, v3}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    .line 182
    add-int/lit8 v56, v56, 0x1

    goto :goto_d8

    .line 206
    .end local v3    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v6    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "fieldType":Ljava/lang/reflect/Type;
    .end local v8    # "field":Ljava/lang/reflect/Field;
    .end local v9    # "ordinal":I
    .end local v10    # "serialzeFeatures":I
    .end local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v56    # "i":I
    .end local v62    # "paramAnnotationArrays":[[Ljava/lang/annotation/Annotation;
    .end local v63    # "paramAnnotations":[Ljava/lang/annotation/Annotation;
    :cond_135
    new-instance v20, Lcom/alibaba/fastjson/util/JavaBeanInfo;

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v26, 0x0

    move-object/from16 v21, p0

    move-object/from16 v22, v13

    move-object/from16 v27, v18

    move-object/from16 v28, v19

    invoke-direct/range {v20 .. v28}, Lcom/alibaba/fastjson/util/JavaBeanInfo;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/List;)V

    move-object/from16 v11, v20

    goto/16 :goto_bb

    .line 209
    .end local v65    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_14c
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "default constructor not found. "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 212
    .end local v25    # "factoryMethod":Ljava/lang/reflect/Method;
    :cond_167
    if-eqz v55, :cond_16c

    .line 213
    invoke-static/range {v55 .. v55}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 216
    :cond_16c
    if-eqz v13, :cond_29c

    .line 217
    const/16 v66, 0x0

    .line 219
    .local v66, "withPrefix":Ljava/lang/String;
    const-class v4, Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;

    invoke-virtual {v13, v4}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v49

    check-cast v49, Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;

    .line 220
    .local v49, "builderAnno":Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;
    if-eqz v49, :cond_17e

    .line 221
    invoke-interface/range {v49 .. v49}, Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;->withPrefix()Ljava/lang/String;

    move-result-object v66

    .line 224
    :cond_17e
    if-eqz v66, :cond_186

    invoke-virtual/range {v66 .. v66}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_188

    .line 225
    :cond_186
    const-string v66, "with"

    .line 228
    :cond_188
    invoke-virtual {v13}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v5

    array-length v11, v5

    const/4 v4, 0x0

    :goto_18e
    if-ge v4, v11, :cond_25f

    aget-object v28, v5, v4

    .line 229
    .local v28, "method":Ljava/lang/reflect/Method;
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v12

    invoke-static {v12}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v12

    if-eqz v12, :cond_19f

    .line 228
    :cond_19c
    :goto_19c
    add-int/lit8 v4, v4, 0x1

    goto :goto_18e

    .line 233
    :cond_19f
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12, v13}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_19c

    .line 237
    const/4 v9, 0x0

    .restart local v9    # "ordinal":I
    const/4 v10, 0x0

    .line 239
    .restart local v10    # "serialzeFeatures":I
    const-class v12, Lcom/alibaba/fastjson/annotation/JSONField;

    move-object/from16 v0, v28

    invoke-virtual {v0, v12}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v34

    check-cast v34, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 241
    .local v34, "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-nez v34, :cond_1bf

    .line 242
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->getSupperMethodAnnotation(Ljava/lang/Class;Ljava/lang/reflect/Method;)Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v34

    .line 245
    :cond_1bf
    if-eqz v34, :cond_1fc

    .line 246
    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->deserialize()Z

    move-result v12

    if-eqz v12, :cond_19c

    .line 250
    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v9

    .line 251
    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v12

    invoke-static {v12}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v10

    .line 253
    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-eqz v12, :cond_1fc

    .line 254
    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v27

    .line 255
    .local v27, "propertyName":Ljava/lang/String;
    new-instance v26, Lcom/alibaba/fastjson/util/FieldInfo;

    const/16 v29, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    move-object/from16 v30, p0

    move-object/from16 v31, p1

    move/from16 v32, v9

    move/from16 v33, v10

    invoke-direct/range {v26 .. v36}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    goto :goto_19c

    .line 261
    .end local v27    # "propertyName":Ljava/lang/String;
    :cond_1fc
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v59

    .line 262
    .local v59, "methodName":Ljava/lang/String;
    move-object/from16 v0, v59

    move-object/from16 v1, v66

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_19c

    .line 266
    invoke-virtual/range {v59 .. v59}, Ljava/lang/String;->length()I

    move-result v12

    invoke-virtual/range {v66 .. v66}, Ljava/lang/String;->length()I

    move-result v14

    if-le v12, v14, :cond_19c

    .line 270
    invoke-virtual/range {v66 .. v66}, Ljava/lang/String;->length()I

    move-result v12

    move-object/from16 v0, v59

    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v51

    .line 272
    .local v51, "c0":C
    invoke-static/range {v51 .. v51}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v12

    if-eqz v12, :cond_19c

    .line 276
    new-instance v64, Ljava/lang/StringBuilder;

    invoke-virtual/range {v66 .. v66}, Ljava/lang/String;->length()I

    move-result v12

    move-object/from16 v0, v59

    invoke-virtual {v0, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, v64

    invoke-direct {v0, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 277
    .local v64, "properNameBuilder":Ljava/lang/StringBuilder;
    const/4 v12, 0x0

    invoke-static/range {v51 .. v51}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v14

    move-object/from16 v0, v64

    invoke-virtual {v0, v12, v14}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 279
    invoke-virtual/range {v64 .. v64}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 281
    .restart local v27    # "propertyName":Ljava/lang/String;
    new-instance v26, Lcom/alibaba/fastjson/util/FieldInfo;

    const/16 v29, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    move-object/from16 v30, p0

    move-object/from16 v31, p1

    move/from16 v32, v9

    move/from16 v33, v10

    invoke-direct/range {v26 .. v36}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    goto/16 :goto_19c

    .line 285
    .end local v9    # "ordinal":I
    .end local v10    # "serialzeFeatures":I
    .end local v27    # "propertyName":Ljava/lang/String;
    .end local v28    # "method":Ljava/lang/reflect/Method;
    .end local v34    # "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v51    # "c0":C
    .end local v59    # "methodName":Ljava/lang/String;
    .end local v64    # "properNameBuilder":Ljava/lang/StringBuilder;
    :cond_25f
    if-eqz v13, :cond_29c

    .line 286
    const-class v4, Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;

    invoke-virtual {v13, v4}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v50

    check-cast v50, Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;

    .line 288
    .local v50, "builderAnnotation":Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;
    const/16 v48, 0x0

    .line 289
    .local v48, "buildMethodName":Ljava/lang/String;
    if-eqz v50, :cond_271

    .line 290
    invoke-interface/range {v50 .. v50}, Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;->buildMethod()Ljava/lang/String;

    move-result-object v48

    .line 293
    :cond_271
    if-eqz v48, :cond_279

    invoke-virtual/range {v48 .. v48}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_27b

    .line 294
    :cond_279
    const-string v48, "build"

    .line 298
    :cond_27b
    const/4 v4, 0x0

    :try_start_27c
    new-array v4, v4, [Ljava/lang/Class;

    move-object/from16 v0, v48

    invoke-virtual {v13, v0, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_283
    .catch Ljava/lang/NoSuchMethodException; {:try_start_27c .. :try_end_283} :catch_5f7
    .catch Ljava/lang/SecurityException; {:try_start_27c .. :try_end_283} :catch_5f4

    move-result-object v47

    .line 305
    :goto_284
    if-nez v47, :cond_28f

    .line 307
    :try_start_286
    const-string v4, "create"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v13, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_28e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_286 .. :try_end_28e} :catch_5f1
    .catch Ljava/lang/SecurityException; {:try_start_286 .. :try_end_28e} :catch_5ee

    move-result-object v47

    .line 315
    :cond_28f
    :goto_28f
    if-nez v47, :cond_299

    .line 316
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    const-string v5, "buildMethod not found."

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 319
    :cond_299
    invoke-static/range {v47 .. v47}, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessible(Ljava/lang/reflect/AccessibleObject;)V

    .line 323
    .end local v48    # "buildMethodName":Ljava/lang/String;
    .end local v49    # "builderAnno":Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;
    .end local v50    # "builderAnnotation":Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;
    .end local v66    # "withPrefix":Ljava/lang/String;
    :cond_29c
    move-object/from16 v0, v60

    array-length v5, v0

    const/4 v4, 0x0

    :goto_2a0
    if-ge v4, v5, :cond_473

    aget-object v28, v60, v4

    .line 324
    .restart local v28    # "method":Ljava/lang/reflect/Method;
    const/4 v9, 0x0

    .restart local v9    # "ordinal":I
    const/4 v10, 0x0

    .line 325
    .restart local v10    # "serialzeFeatures":I
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v59

    .line 326
    .restart local v59    # "methodName":Ljava/lang/String;
    invoke-virtual/range {v59 .. v59}, Ljava/lang/String;->length()I

    move-result v11

    const/4 v12, 0x4

    if-ge v11, v12, :cond_2b4

    .line 323
    :cond_2b1
    :goto_2b1
    add-int/lit8 v4, v4, 0x1

    goto :goto_2a0

    .line 330
    :cond_2b4
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v11

    invoke-static {v11}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v11

    if-nez v11, :cond_2b1

    .line 335
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v11

    sget-object v12, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v11, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_2d6

    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v11

    move-object/from16 v0, p0

    invoke-virtual {v11, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2b1

    .line 338
    :cond_2d6
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v65

    .line 339
    .restart local v65    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object/from16 v0, v65

    array-length v11, v0

    const/4 v12, 0x1

    if-ne v11, v12, :cond_2b1

    .line 343
    const-class v11, Lcom/alibaba/fastjson/annotation/JSONField;

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v34

    check-cast v34, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 345
    .restart local v34    # "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-nez v34, :cond_2f4

    .line 346
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->getSupperMethodAnnotation(Ljava/lang/Class;Ljava/lang/reflect/Method;)Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v34

    .line 349
    :cond_2f4
    if-eqz v34, :cond_331

    .line 350
    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->deserialize()Z

    move-result v11

    if-eqz v11, :cond_2b1

    .line 354
    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v9

    .line 355
    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v11

    invoke-static {v11}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v10

    .line 357
    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_331

    .line 358
    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v27

    .line 359
    .restart local v27    # "propertyName":Ljava/lang/String;
    new-instance v26, Lcom/alibaba/fastjson/util/FieldInfo;

    const/16 v29, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    move-object/from16 v30, p0

    move-object/from16 v31, p1

    move/from16 v32, v9

    move/from16 v33, v10

    invoke-direct/range {v26 .. v36}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    goto :goto_2b1

    .line 365
    .end local v27    # "propertyName":Ljava/lang/String;
    :cond_331
    const-string v11, "set"

    move-object/from16 v0, v59

    invoke-virtual {v0, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2b1

    .line 369
    const/4 v11, 0x3

    move-object/from16 v0, v59

    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v52

    .line 372
    .local v52, "c3":C
    invoke-static/range {v52 .. v52}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v11

    if-nez v11, :cond_34e

    const/16 v11, 0x200

    move/from16 v0, v52

    if-le v0, v11, :cond_40e

    .line 375
    :cond_34e
    sget-boolean v11, Lcom/alibaba/fastjson/util/TypeUtils;->compatibleWithJavaBean:Z

    if-eqz v11, :cond_3e7

    .line 376
    const/4 v11, 0x3

    move-object/from16 v0, v59

    invoke-virtual {v0, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/alibaba/fastjson/util/TypeUtils;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .restart local v27    # "propertyName":Ljava/lang/String;
    move-object/from16 v37, v27

    .line 390
    .end local v27    # "propertyName":Ljava/lang/String;
    :goto_35f
    move-object/from16 v0, p0

    move-object/from16 v1, v37

    move-object/from16 v2, v54

    invoke-static {v0, v1, v2}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 391
    .restart local v8    # "field":Ljava/lang/reflect/Field;
    if-nez v8, :cond_3a5

    const/4 v11, 0x0

    aget-object v11, v65, v11

    sget-object v12, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v11, v12, :cond_3a5

    .line 392
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "is"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/4 v12, 0x0

    move-object/from16 v0, v37

    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-static {v12}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    const/4 v12, 0x1

    move-object/from16 v0, v37

    invoke-virtual {v0, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v57

    .line 393
    .local v57, "isFieldName":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move-object/from16 v2, v54

    invoke-static {v0, v1, v2}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 396
    .end local v57    # "isFieldName":Ljava/lang/String;
    :cond_3a5
    const/16 v35, 0x0

    .line 397
    .restart local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v8, :cond_453

    .line 398
    const-class v11, Lcom/alibaba/fastjson/annotation/JSONField;

    invoke-virtual {v8, v11}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v35

    .end local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    check-cast v35, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 400
    .restart local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v35, :cond_453

    .line 401
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v9

    .line 402
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v11

    invoke-static {v11}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v10

    .line 404
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_453

    .line 405
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v27

    .line 406
    .restart local v27    # "propertyName":Ljava/lang/String;
    new-instance v26, Lcom/alibaba/fastjson/util/FieldInfo;

    const/16 v36, 0x0

    move-object/from16 v29, v8

    move-object/from16 v30, p0

    move-object/from16 v31, p1

    move/from16 v32, v9

    move/from16 v33, v10

    invoke-direct/range {v26 .. v36}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    goto/16 :goto_2b1

    .line 378
    .end local v8    # "field":Ljava/lang/reflect/Field;
    .end local v27    # "propertyName":Ljava/lang/String;
    .end local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    :cond_3e7
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v12, 0x3

    move-object/from16 v0, v59

    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-static {v12}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    const/4 v12, 0x4

    move-object/from16 v0, v59

    invoke-virtual {v0, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .restart local v27    # "propertyName":Ljava/lang/String;
    move-object/from16 v37, v27

    goto/16 :goto_35f

    .line 380
    .end local v27    # "propertyName":Ljava/lang/String;
    :cond_40e
    const/16 v11, 0x5f

    move/from16 v0, v52

    if-ne v0, v11, :cond_41f

    .line 381
    const/4 v11, 0x4

    move-object/from16 v0, v59

    invoke-virtual {v0, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v27

    .restart local v27    # "propertyName":Ljava/lang/String;
    move-object/from16 v37, v27

    goto/16 :goto_35f

    .line 382
    .end local v27    # "propertyName":Ljava/lang/String;
    :cond_41f
    const/16 v11, 0x66

    move/from16 v0, v52

    if-ne v0, v11, :cond_430

    .line 383
    const/4 v11, 0x3

    move-object/from16 v0, v59

    invoke-virtual {v0, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v27

    .restart local v27    # "propertyName":Ljava/lang/String;
    move-object/from16 v37, v27

    goto/16 :goto_35f

    .line 384
    .end local v27    # "propertyName":Ljava/lang/String;
    :cond_430
    invoke-virtual/range {v59 .. v59}, Ljava/lang/String;->length()I

    move-result v11

    const/4 v12, 0x5

    if-lt v11, v12, :cond_2b1

    const/4 v11, 0x4

    move-object/from16 v0, v59

    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-static {v11}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v11

    if-eqz v11, :cond_2b1

    .line 385
    const/4 v11, 0x3

    move-object/from16 v0, v59

    invoke-virtual {v0, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/alibaba/fastjson/util/TypeUtils;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    move-object/from16 v37, v27

    goto/16 :goto_35f

    .line 414
    .restart local v8    # "field":Ljava/lang/reflect/Field;
    .restart local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    :cond_453
    new-instance v36, Lcom/alibaba/fastjson/util/FieldInfo;

    const/16 v46, 0x0

    move-object/from16 v38, v28

    move-object/from16 v39, v8

    move-object/from16 v40, p0

    move-object/from16 v41, p1

    move/from16 v42, v9

    move/from16 v43, v10

    move-object/from16 v44, v34

    move-object/from16 v45, v35

    invoke-direct/range {v36 .. v46}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    goto/16 :goto_2b1

    .line 418
    .end local v8    # "field":Ljava/lang/reflect/Field;
    .end local v9    # "ordinal":I
    .end local v10    # "serialzeFeatures":I
    .end local v28    # "method":Ljava/lang/reflect/Method;
    .end local v34    # "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v52    # "c3":C
    .end local v59    # "methodName":Ljava/lang/String;
    .end local v65    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_473
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v5

    array-length v11, v5

    const/4 v4, 0x0

    :goto_479
    if-ge v4, v11, :cond_4fb

    aget-object v8, v5, v4

    .line 419
    .restart local v8    # "field":Ljava/lang/reflect/Field;
    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v12

    invoke-static {v12}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v12

    if-eqz v12, :cond_48a

    .line 418
    :cond_487
    :goto_487
    add-int/lit8 v4, v4, 0x1

    goto :goto_479

    .line 423
    :cond_48a
    const/16 v53, 0x0

    .line 424
    .local v53, "contains":Z
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_490
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_4ae

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v58

    check-cast v58, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 425
    .local v58, "item":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v58

    iget-object v14, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_490

    .line 426
    const/16 v53, 0x1

    .line 431
    .end local v58    # "item":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_4ae
    if-nez v53, :cond_487

    .line 435
    const/4 v9, 0x0

    .restart local v9    # "ordinal":I
    const/4 v10, 0x0

    .line 436
    .restart local v10    # "serialzeFeatures":I
    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v27

    .line 438
    .restart local v27    # "propertyName":Ljava/lang/String;
    const-class v12, Lcom/alibaba/fastjson/annotation/JSONField;

    invoke-virtual {v8, v12}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v35

    check-cast v35, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 440
    .restart local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v35, :cond_4da

    .line 441
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v9

    .line 442
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v12

    invoke-static {v12}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v10

    .line 444
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-eqz v12, :cond_4da

    .line 445
    invoke-interface/range {v35 .. v35}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v27

    .line 448
    :cond_4da
    new-instance v36, Lcom/alibaba/fastjson/util/FieldInfo;

    const/16 v38, 0x0

    const/16 v44, 0x0

    const/16 v46, 0x0

    move-object/from16 v37, v27

    move-object/from16 v39, v8

    move-object/from16 v40, p0

    move-object/from16 v41, p1

    move/from16 v42, v9

    move/from16 v43, v10

    move-object/from16 v45, v35

    invoke-direct/range {v36 .. v46}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    goto :goto_487

    .line 452
    .end local v8    # "field":Ljava/lang/reflect/Field;
    .end local v9    # "ordinal":I
    .end local v10    # "serialzeFeatures":I
    .end local v27    # "propertyName":Ljava/lang/String;
    .end local v35    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v53    # "contains":Z
    :cond_4fb
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v5

    array-length v11, v5

    const/4 v4, 0x0

    :goto_501
    if-ge v4, v11, :cond_5d5

    aget-object v28, v5, v4

    .line 453
    .restart local v28    # "method":Ljava/lang/reflect/Method;
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v59

    .line 454
    .restart local v59    # "methodName":Ljava/lang/String;
    invoke-virtual/range {v59 .. v59}, Ljava/lang/String;->length()I

    move-result v12

    const/4 v14, 0x4

    if-ge v12, v14, :cond_513

    .line 452
    :cond_510
    :goto_510
    add-int/lit8 v4, v4, 0x1

    goto :goto_501

    .line 458
    :cond_513
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v12

    invoke-static {v12}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v12

    if-nez v12, :cond_510

    .line 462
    const-string v12, "get"

    move-object/from16 v0, v59

    invoke-virtual {v0, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_510

    const/4 v12, 0x3

    move-object/from16 v0, v59

    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-static {v12}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v12

    if-eqz v12, :cond_510

    .line 463
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v12

    array-length v12, v12

    if-nez v12, :cond_510

    .line 467
    const-class v12, Ljava/util/Collection;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v12

    if-nez v12, :cond_56b

    const-class v12, Ljava/util/Map;

    .line 468
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v12

    if-nez v12, :cond_56b

    const-class v12, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 469
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v14

    if-eq v12, v14, :cond_56b

    const-class v12, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 470
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v14

    if-eq v12, v14, :cond_56b

    const-class v12, Ljava/util/concurrent/atomic/AtomicLong;

    .line 471
    invoke-virtual/range {v28 .. v28}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v14

    if-ne v12, v14, :cond_510

    .line 475
    :cond_56b
    const-class v12, Lcom/alibaba/fastjson/annotation/JSONField;

    move-object/from16 v0, v28

    invoke-virtual {v0, v12}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v34

    check-cast v34, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 476
    .restart local v34    # "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v34, :cond_5b1

    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_5b1

    .line 477
    invoke-interface/range {v34 .. v34}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v27

    .line 482
    .restart local v27    # "propertyName":Ljava/lang/String;
    :goto_585
    move-object/from16 v0, v19

    move-object/from16 v1, v27

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getField(Ljava/util/List;Ljava/lang/String;)Lcom/alibaba/fastjson/util/FieldInfo;

    move-result-object v3

    .line 483
    .restart local v3    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    if-nez v3, :cond_510

    .line 487
    new-instance v36, Lcom/alibaba/fastjson/util/FieldInfo;

    const/16 v39, 0x0

    const/16 v42, 0x0

    const/16 v43, 0x0

    const/16 v45, 0x0

    const/16 v46, 0x0

    move-object/from16 v37, v27

    move-object/from16 v38, v28

    move-object/from16 v40, p0

    move-object/from16 v41, p1

    move-object/from16 v44, v34

    invoke-direct/range {v36 .. v46}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v36

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->add(Ljava/util/List;Lcom/alibaba/fastjson/util/FieldInfo;)Z

    goto/16 :goto_510

    .line 479
    .end local v3    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v27    # "propertyName":Ljava/lang/String;
    :cond_5b1
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v14, 0x3

    move-object/from16 v0, v59

    invoke-virtual {v0, v14}, Ljava/lang/String;->charAt(I)C

    move-result v14

    invoke-static {v14}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    const/4 v14, 0x4

    move-object/from16 v0, v59

    invoke-virtual {v0, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .restart local v27    # "propertyName":Ljava/lang/String;
    goto :goto_585

    .line 492
    .end local v27    # "propertyName":Ljava/lang/String;
    .end local v28    # "method":Ljava/lang/reflect/Method;
    .end local v34    # "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v59    # "methodName":Ljava/lang/String;
    :cond_5d5
    new-instance v36, Lcom/alibaba/fastjson/util/JavaBeanInfo;

    const/16 v40, 0x0

    const/16 v41, 0x0

    move-object/from16 v37, p0

    move-object/from16 v38, v13

    move-object/from16 v39, v55

    move-object/from16 v42, v47

    move-object/from16 v43, v18

    move-object/from16 v44, v19

    invoke-direct/range {v36 .. v44}, Lcom/alibaba/fastjson/util/JavaBeanInfo;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Constructor;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/List;)V

    move-object/from16 v11, v36

    goto/16 :goto_bb

    .line 310
    .restart local v48    # "buildMethodName":Ljava/lang/String;
    .restart local v49    # "builderAnno":Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;
    .restart local v50    # "builderAnnotation":Lcom/alibaba/fastjson/annotation/JSONPOJOBuilder;
    .restart local v66    # "withPrefix":Ljava/lang/String;
    :catch_5ee
    move-exception v4

    goto/16 :goto_28f

    .line 308
    :catch_5f1
    move-exception v4

    goto/16 :goto_28f

    .line 301
    :catch_5f4
    move-exception v4

    goto/16 :goto_284

    .line 299
    :catch_5f7
    move-exception v4

    goto/16 :goto_284
.end method

.method public static getBuilderClass(Lcom/alibaba/fastjson/annotation/JSONType;)Ljava/lang/Class;
    .registers 4
    .param p0, "type"    # Lcom/alibaba/fastjson/annotation/JSONType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/annotation/JSONType;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 569
    if-nez p0, :cond_5

    move-object v0, v1

    .line 579
    :cond_4
    :goto_4
    return-object v0

    .line 573
    :cond_5
    invoke-interface {p0}, Lcom/alibaba/fastjson/annotation/JSONType;->builder()Ljava/lang/Class;

    move-result-object v0

    .line 575
    .local v0, "builderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Ljava/lang/Void;

    if-ne v0, v2, :cond_4

    move-object v0, v1

    .line 576
    goto :goto_4
.end method

.method public static getCreatorConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 527
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    .line 529
    .local v2, "creatorConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v4

    array-length v5, v4

    const/4 v3, 0x0

    :goto_7
    if-ge v3, v5, :cond_23

    aget-object v1, v4, v3

    .line 530
    .local v1, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const-class v6, Lcom/alibaba/fastjson/annotation/JSONCreator;

    invoke-virtual {v1, v6}, Ljava/lang/reflect/Constructor;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/annotation/JSONCreator;

    .line 531
    .local v0, "annotation":Lcom/alibaba/fastjson/annotation/JSONCreator;
    if-eqz v0, :cond_20

    .line 532
    if-eqz v2, :cond_1f

    .line 533
    new-instance v3, Lcom/alibaba/fastjson/JSONException;

    const-string v4, "multi-JSONCreator"

    invoke-direct {v3, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 536
    :cond_1f
    move-object v2, v1

    .line 529
    :cond_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 540
    .end local v0    # "annotation":Lcom/alibaba/fastjson/annotation/JSONCreator;
    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_23
    return-object v2
.end method

.method static getDefaultConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .prologue
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v5, 0x0

    .line 496
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 497
    const/4 v2, 0x0

    .line 523
    :cond_c
    :goto_c
    return-object v2

    .line 500
    :cond_d
    const/4 v2, 0x0

    .line 501
    .local v2, "defaultConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 503
    .local v1, "constructors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    array-length v6, v1

    move v4, v5

    :goto_14
    if-ge v4, v6, :cond_20

    aget-object v0, v1, v4

    .line 504
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v7

    array-length v7, v7

    if-nez v7, :cond_4e

    .line 505
    move-object v2, v0

    .line 510
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :cond_20
    if-nez v2, :cond_c

    .line 511
    invoke-virtual {p0}, Ljava/lang/Class;->isMemberClass()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-nez v4, :cond_c

    .line 513
    array-length v6, v1

    move v4, v5

    :goto_34
    if-ge v4, v6, :cond_c

    aget-object v0, v1, v4

    .line 514
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    .local v3, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v7, v3

    const/4 v8, 0x1

    if-ne v7, v8, :cond_51

    aget-object v7, v3, v5

    .line 515
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_51

    .line 516
    move-object v2, v0

    .line 517
    goto :goto_c

    .line 503
    .end local v3    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_4e
    add-int/lit8 v4, v4, 0x1

    goto :goto_14

    .line 513
    .restart local v3    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_51
    add-int/lit8 v4, v4, 0x1

    goto :goto_34
.end method

.method private static getFactoryMethod(Ljava/lang/Class;[Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;
    .registers 8
    .param p1, "methods"    # [Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/reflect/Method;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 544
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 546
    .local v1, "factoryMethod":Ljava/lang/reflect/Method;
    array-length v4, p1

    const/4 v3, 0x0

    :goto_3
    if-ge v3, v4, :cond_34

    aget-object v2, p1, v3

    .line 547
    .local v2, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v5

    if-nez v5, :cond_14

    .line 546
    :cond_11
    :goto_11
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 551
    :cond_14
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 555
    const-class v5, Lcom/alibaba/fastjson/annotation/JSONCreator;

    invoke-virtual {v2, v5}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/annotation/JSONCreator;

    .line 556
    .local v0, "annotation":Lcom/alibaba/fastjson/annotation/JSONCreator;
    if-eqz v0, :cond_11

    .line 557
    if-eqz v1, :cond_32

    .line 558
    new-instance v3, Lcom/alibaba/fastjson/JSONException;

    const-string v4, "multi-JSONCreator"

    invoke-direct {v3, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 561
    :cond_32
    move-object v1, v2

    goto :goto_11

    .line 565
    .end local v0    # "annotation":Lcom/alibaba/fastjson/annotation/JSONCreator;
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :cond_34
    return-object v1
.end method

.method private static getField(Ljava/util/List;Ljava/lang/String;)Lcom/alibaba/fastjson/util/FieldInfo;
    .registers 5
    .param p1, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/alibaba/fastjson/util/FieldInfo;"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "fieldList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 90
    .local v0, "item":Lcom/alibaba/fastjson/util/FieldInfo;
    iget-object v2, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 95
    .end local v0    # "item":Lcom/alibaba/fastjson/util/FieldInfo;
    :goto_18
    return-object v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method
