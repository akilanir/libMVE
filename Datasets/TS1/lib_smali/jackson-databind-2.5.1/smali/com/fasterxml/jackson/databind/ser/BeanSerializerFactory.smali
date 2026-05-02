.class public Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;
.super Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;
.source "BeanSerializerFactory.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final instance:Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;

.field private static final serialVersionUID:J = 0x1L


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 62
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;-><init>(Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->instance:Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;

    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;)V
    .registers 2
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;-><init>(Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;)V

    .line 76
    return-void
.end method


# virtual methods
.method protected _constructWriter(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;Lcom/fasterxml/jackson/databind/type/TypeBindings;Lcom/fasterxml/jackson/databind/ser/PropertyBuilder;ZLcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    .registers 22
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "propDef"    # Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;
    .param p3, "typeContext"    # Lcom/fasterxml/jackson/databind/type/TypeBindings;
    .param p4, "pb"    # Lcom/fasterxml/jackson/databind/ser/PropertyBuilder;
    .param p5, "staticTyping"    # Z
    .param p6, "accessor"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 704
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;->getFullName()Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v3

    .line 705
    .local v3, "name":Lcom/fasterxml/jackson/databind/PropertyName;
    invoke-virtual/range {p1 .. p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->canOverrideAccessModifiers()Z

    move-result v5

    if-eqz v5, :cond_d

    .line 706
    invoke-virtual/range {p6 .. p6}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;->fixAccess()V

    .line 708
    :cond_d
    move-object/from16 v0, p6

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;->getType(Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    .line 709
    .local v4, "type":Lcom/fasterxml/jackson/databind/JavaType;
    new-instance v2, Lcom/fasterxml/jackson/databind/BeanProperty$Std;

    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;->getWrapperName()Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v5

    invoke-virtual/range {p4 .. p4}, Lcom/fasterxml/jackson/databind/ser/PropertyBuilder;->getClassAnnotations()Lcom/fasterxml/jackson/databind/util/Annotations;

    move-result-object v6

    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;->getMetadata()Lcom/fasterxml/jackson/databind/PropertyMetadata;

    move-result-object v8

    move-object/from16 v7, p6

    invoke-direct/range {v2 .. v8}, Lcom/fasterxml/jackson/databind/BeanProperty$Std;-><init>(Lcom/fasterxml/jackson/databind/PropertyName;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/PropertyName;Lcom/fasterxml/jackson/databind/util/Annotations;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/PropertyMetadata;)V

    .line 713
    .local v2, "property":Lcom/fasterxml/jackson/databind/BeanProperty$Std;
    move-object/from16 v0, p1

    move-object/from16 v1, p6

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findSerializerFromAnnotation(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v9

    .line 718
    .local v9, "annotatedSerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    instance-of v5, v9, Lcom/fasterxml/jackson/databind/ser/ResolvableSerializer;

    if-eqz v5, :cond_3c

    move-object v5, v9

    .line 719
    check-cast v5, Lcom/fasterxml/jackson/databind/ser/ResolvableSerializer;

    move-object/from16 v0, p1

    invoke-interface {v5, v0}, Lcom/fasterxml/jackson/databind/ser/ResolvableSerializer;->resolve(Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    .line 722
    :cond_3c
    move-object/from16 v0, p1

    invoke-virtual {v0, v9, v2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->handlePrimaryContextualization(Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v9

    .line 724
    const/4 v11, 0x0

    .line 726
    .local v11, "contentTypeSer":Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->isCollectionMapOrArray(Ljava/lang/Class;)Z

    move-result v5

    if-nez v5, :cond_59

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/JavaType;->isCollectionLikeType()Z

    move-result v5

    if-nez v5, :cond_59

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/JavaType;->isMapLikeType()Z

    move-result v5

    if-eqz v5, :cond_63

    .line 727
    :cond_59
    invoke-virtual/range {p1 .. p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v5

    move-object/from16 v0, p6

    invoke-virtual {p0, v4, v5, v0}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findPropertyContentTypeSerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v11

    .line 730
    :cond_63
    invoke-virtual/range {p1 .. p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v5

    move-object/from16 v0, p6

    invoke-virtual {p0, v4, v5, v0}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findPropertyTypeSerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v10

    .local v10, "typeSer":Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    move-object/from16 v5, p4

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object v8, v4

    move-object/from16 v12, p6

    move/from16 v13, p5

    .line 731
    invoke-virtual/range {v5 .. v13}, Lcom/fasterxml/jackson/databind/ser/PropertyBuilder;->buildWriter(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Z)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    move-result-object v14

    .line 733
    .local v14, "pbw":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    return-object v14
.end method

.method protected _createSerializer2(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 12
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p4, "staticTyping"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Z)",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 173
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findSerializerByAnnotations(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v3

    .line 174
    .local v3, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    if-eqz v3, :cond_8

    move-object v4, v3

    .line 244
    .end local v3    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    .local v4, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :goto_7
    return-object v4

    .line 177
    .end local v4    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    .restart local v3    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_8
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 181
    .local v0, "config":Lcom/fasterxml/jackson/databind/SerializationConfig;
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->isContainerType()Z

    move-result v6

    if-eqz v6, :cond_21

    .line 182
    if-nez p4, :cond_19

    .line 183
    const/4 v6, 0x0

    invoke-virtual {p0, v0, p3, v6}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->usesStaticTyping(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)Z

    move-result p4

    .line 196
    :cond_19
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->buildContainerSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v3

    .line 198
    if-eqz v3, :cond_3b

    move-object v4, v3

    .line 199
    .end local v3    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    .restart local v4    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    goto :goto_7

    .line 203
    .end local v4    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    .restart local v3    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_21
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->customSerializers()Ljava/lang/Iterable;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_29
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/fasterxml/jackson/databind/ser/Serializers;

    .line 204
    .local v5, "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    invoke-interface {v5, v0, p2, p3}, Lcom/fasterxml/jackson/databind/ser/Serializers;->findSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v3

    .line 205
    if-eqz v3, :cond_29

    .line 214
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v5    # "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    :cond_3b
    if-nez v3, :cond_5d

    .line 215
    invoke-virtual {p0, p2, v0, p3, p4}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findSerializerByLookup(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v3

    .line 216
    if-nez v3, :cond_5d

    .line 217
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findSerializerByPrimaryType(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v3

    .line 218
    if-nez v3, :cond_5d

    .line 222
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findBeanSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v3

    .line 224
    if-nez v3, :cond_5d

    .line 225
    invoke-virtual {p0, v0, p2, p3, p4}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findSerializerByAddonType(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v3

    .line 229
    if-nez v3, :cond_5d

    .line 230
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/BeanDescription;->getBeanClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p1, v6}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getUnknownTypeSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v3

    .line 236
    :cond_5d
    if-eqz v3, :cond_82

    .line 238
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasSerializerModifiers()Z

    move-result v6

    if-eqz v6, :cond_82

    .line 239
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializerModifiers()Ljava/lang/Iterable;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1    # "i$":Ljava/util/Iterator;
    :goto_71
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_82

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .line 240
    .local v2, "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    invoke-virtual {v2, v0, p3, v3}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;->modifySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v3

    .line 241
    goto :goto_71

    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    :cond_82
    move-object v4, v3

    .line 244
    .end local v3    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    .restart local v4    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    goto :goto_7
.end method

.method protected constructBeanSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 26
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 341
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->getBeanClass()Ljava/lang/Class;

    move-result-object v4

    const-class v10, Ljava/lang/Object;

    if-ne v4, v10, :cond_11

    .line 342
    const-class v4, Ljava/lang/Object;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getUnknownTypeSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v21

    .line 423
    :cond_10
    :goto_10
    return-object v21

    .line 345
    :cond_11
    invoke-virtual/range {p1 .. p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v16

    .line 346
    .local v16, "config":Lcom/fasterxml/jackson/databind/SerializationConfig;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->constructBeanSerializerBuilder(Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;

    move-result-object v15

    .line 347
    .local v15, "builder":Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;
    invoke-virtual/range {v15 .. v16}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;->setConfig(Lcom/fasterxml/jackson/databind/SerializationConfig;)V

    .line 350
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v15}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findBeanProperties(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;)Ljava/util/List;

    move-result-object v20

    .line 351
    .local v20, "props":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;>;"
    if-nez v20, :cond_31

    .line 352
    new-instance v20, Ljava/util/ArrayList;

    .end local v20    # "props":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;>;"
    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 355
    .restart local v20    # "props":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;>;"
    :cond_31
    invoke-virtual/range {p1 .. p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v10

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-virtual {v4, v0, v10, v1}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findAndAddVirtualProperties(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Ljava/util/List;)V

    .line 358
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasSerializerModifiers()Z

    move-result v4

    if-eqz v4, :cond_6f

    .line 359
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializerModifiers()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, "i$":Ljava/util/Iterator;
    :goto_56
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6f

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .line 360
    .local v19, "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    move-object/from16 v0, v19

    move-object/from16 v1, v16

    move-object/from16 v2, p2

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;->changeProperties(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Ljava/util/List;)Ljava/util/List;

    move-result-object v20

    .line 361
    goto :goto_56

    .line 365
    .end local v17    # "i$":Ljava/util/Iterator;
    .end local v19    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    :cond_6f
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p2

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->filterBeanProperties(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Ljava/util/List;)Ljava/util/List;

    move-result-object v20

    .line 368
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasSerializerModifiers()Z

    move-result v4

    if-eqz v4, :cond_aa

    .line 369
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializerModifiers()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .restart local v17    # "i$":Ljava/util/Iterator;
    :goto_91
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_aa

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .line 370
    .restart local v19    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    move-object/from16 v0, v19

    move-object/from16 v1, v16

    move-object/from16 v2, p2

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;->orderProperties(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Ljava/util/List;)Ljava/util/List;

    move-result-object v20

    .line 371
    goto :goto_91

    .line 378
    .end local v17    # "i$":Ljava/util/Iterator;
    .end local v19    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    :cond_aa
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->constructObjectIdHandler(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/BeanDescription;Ljava/util/List;)Lcom/fasterxml/jackson/databind/ser/impl/ObjectIdWriter;

    move-result-object v4

    invoke-virtual {v15, v4}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;->setObjectIdWriter(Lcom/fasterxml/jackson/databind/ser/impl/ObjectIdWriter;)V

    .line 380
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;->setProperties(Ljava/util/List;)V

    .line 381
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findFilterId(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v15, v4}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;->setFilterId(Ljava/lang/Object;)V

    .line 383
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->findAnyGetter()Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    move-result-object v13

    .line 384
    .local v13, "anyGetter":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    if-eqz v13, :cond_121

    .line 385
    invoke-virtual/range {v16 .. v16}, Lcom/fasterxml/jackson/databind/SerializationConfig;->canOverrideAccessModifiers()Z

    move-result v4

    if-eqz v4, :cond_da

    .line 386
    invoke-virtual {v13}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;->fixAccess()V

    .line 388
    :cond_da
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->bindingsForBeanType()Lcom/fasterxml/jackson/databind/type/TypeBindings;

    move-result-object v4

    invoke-virtual {v13, v4}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;->getType(Lcom/fasterxml/jackson/databind/type/TypeBindings;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    .line 390
    .local v5, "type":Lcom/fasterxml/jackson/databind/JavaType;
    sget-object v4, Lcom/fasterxml/jackson/databind/MapperFeature;->USE_STATIC_TYPING:Lcom/fasterxml/jackson/databind/MapperFeature;

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/MapperFeature;)Z

    move-result v6

    .line 391
    .local v6, "staticTyping":Z
    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/JavaType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v22

    .line 392
    .local v22, "valueType":Lcom/fasterxml/jackson/databind/JavaType;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->createTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v7

    .line 395
    .local v7, "typeSer":Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    const/4 v4, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v4 .. v10}, Lcom/fasterxml/jackson/databind/ser/std/MapSerializer;->construct([Ljava/lang/String;Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/ser/std/MapSerializer;

    move-result-object v18

    .line 398
    .local v18, "mapSer":Lcom/fasterxml/jackson/databind/ser/std/MapSerializer;
    new-instance v9, Lcom/fasterxml/jackson/databind/PropertyName;

    invoke-virtual {v13}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v9, v4}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;)V

    .line 399
    .local v9, "name":Lcom/fasterxml/jackson/databind/PropertyName;
    new-instance v8, Lcom/fasterxml/jackson/databind/BeanProperty$Std;

    const/4 v11, 0x0

    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassAnnotations()Lcom/fasterxml/jackson/databind/util/Annotations;

    move-result-object v12

    sget-object v14, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_OPTIONAL:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    move-object/from16 v10, v22

    invoke-direct/range {v8 .. v14}, Lcom/fasterxml/jackson/databind/BeanProperty$Std;-><init>(Lcom/fasterxml/jackson/databind/PropertyName;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/PropertyName;Lcom/fasterxml/jackson/databind/util/Annotations;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/PropertyMetadata;)V

    .line 401
    .local v8, "anyProp":Lcom/fasterxml/jackson/databind/BeanProperty$Std;
    new-instance v4, Lcom/fasterxml/jackson/databind/ser/AnyGetterWriter;

    move-object/from16 v0, v18

    invoke-direct {v4, v8, v13, v0}, Lcom/fasterxml/jackson/databind/ser/AnyGetterWriter;-><init>(Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/ser/std/MapSerializer;)V

    invoke-virtual {v15, v4}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;->setAnyGetter(Lcom/fasterxml/jackson/databind/ser/AnyGetterWriter;)V

    .line 404
    .end local v5    # "type":Lcom/fasterxml/jackson/databind/JavaType;
    .end local v6    # "staticTyping":Z
    .end local v7    # "typeSer":Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .end local v8    # "anyProp":Lcom/fasterxml/jackson/databind/BeanProperty$Std;
    .end local v9    # "name":Lcom/fasterxml/jackson/databind/PropertyName;
    .end local v18    # "mapSer":Lcom/fasterxml/jackson/databind/ser/std/MapSerializer;
    .end local v22    # "valueType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_121
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v15}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->processViews(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;)V

    .line 407
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasSerializerModifiers()Z

    move-result v4

    if-eqz v4, :cond_155

    .line 408
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializerModifiers()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .restart local v17    # "i$":Ljava/util/Iterator;
    :goto_13e
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_155

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .line 409
    .restart local v19    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    move-object/from16 v0, v19

    move-object/from16 v1, v16

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2, v15}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;->updateBuilder(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;)Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;

    move-result-object v15

    .line 410
    goto :goto_13e

    .line 413
    .end local v17    # "i$":Ljava/util/Iterator;
    .end local v19    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    :cond_155
    invoke-virtual {v15}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;->build()Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v21

    .line 415
    .local v21, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v21, :cond_10

    .line 419
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->hasKnownClassAnnotations()Z

    move-result v4

    if-eqz v4, :cond_10

    .line 420
    invoke-virtual {v15}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;->createDummy()Lcom/fasterxml/jackson/databind/ser/BeanSerializer;

    move-result-object v21

    goto/16 :goto_10
.end method

.method protected constructBeanSerializerBuilder(Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;
    .registers 3
    .param p1, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;

    .prologue
    .line 493
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;

    invoke-direct {v0, p1}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;-><init>(Lcom/fasterxml/jackson/databind/BeanDescription;)V

    return-object v0
.end method

.method protected constructFilteredBeanWriter(Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;[Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    .registers 4
    .param p1, "writer"    # Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;"
        }
    .end annotation

    .prologue
    .line 483
    .local p2, "inViews":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {p1, p2}, Lcom/fasterxml/jackson/databind/ser/impl/FilteredBeanPropertyWriter;->constructViewBased(Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;[Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    move-result-object v0

    return-object v0
.end method

.method protected constructObjectIdHandler(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/BeanDescription;Ljava/util/List;)Lcom/fasterxml/jackson/databind/ser/impl/ObjectIdWriter;
    .registers 18
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Ljava/util/List",
            "<",
            "Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;",
            ">;)",
            "Lcom/fasterxml/jackson/databind/ser/impl/ObjectIdWriter;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 430
    .local p3, "props":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;>;"
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->getObjectIdInfo()Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;

    move-result-object v7

    .line 431
    .local v7, "objectIdInfo":Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;
    if-nez v7, :cond_8

    .line 432
    const/4 v11, 0x0

    .line 471
    :goto_7
    return-object v11

    .line 435
    :cond_8
    invoke-virtual {v7}, Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;->getGeneratorType()Ljava/lang/Class;

    move-result-object v5

    .line 438
    .local v5, "implClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v11, Lcom/fasterxml/jackson/annotation/ObjectIdGenerators$PropertyGenerator;

    if-ne v5, v11, :cond_89

    .line 439
    invoke-virtual {v7}, Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;->getPropertyName()Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v11

    invoke-virtual {v11}, Lcom/fasterxml/jackson/databind/PropertyName;->getSimpleName()Ljava/lang/String;

    move-result-object v9

    .line 440
    .local v9, "propName":Ljava/lang/String;
    const/4 v3, 0x0

    .line 442
    .local v3, "idProp":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v6

    .line 443
    .local v6, "len":I
    :goto_1e
    if-ne v2, v6, :cond_51

    .line 444
    new-instance v11, Ljava/lang/IllegalArgumentException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Invalid Object Id definition for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->getBeanClass()Ljava/lang/Class;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ": can not find property with name \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 447
    :cond_51
    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    .line 448
    .local v8, "prop":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    invoke-virtual {v8}, Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_86

    .line 449
    move-object v3, v8

    .line 453
    if-lez v2, :cond_71

    .line 454
    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 455
    const/4 v11, 0x0

    move-object/from16 v0, p3

    invoke-interface {v0, v11, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 460
    :cond_71
    invoke-virtual {v3}, Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;->getType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    .line 461
    .local v4, "idType":Lcom/fasterxml/jackson/databind/JavaType;
    new-instance v1, Lcom/fasterxml/jackson/databind/ser/impl/PropertyBasedObjectIdGenerator;

    invoke-direct {v1, v7, v3}, Lcom/fasterxml/jackson/databind/ser/impl/PropertyBasedObjectIdGenerator;-><init>(Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;)V

    .line 463
    .local v1, "gen":Lcom/fasterxml/jackson/annotation/ObjectIdGenerator;, "Lcom/fasterxml/jackson/annotation/ObjectIdGenerator<*>;"
    const/4 v11, 0x0

    check-cast v11, Lcom/fasterxml/jackson/databind/PropertyName;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;->getAlwaysAsId()Z

    move-result v12

    invoke-static {v4, v11, v1, v12}, Lcom/fasterxml/jackson/databind/ser/impl/ObjectIdWriter;->construct(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/PropertyName;Lcom/fasterxml/jackson/annotation/ObjectIdGenerator;Z)Lcom/fasterxml/jackson/databind/ser/impl/ObjectIdWriter;

    move-result-object v11

    goto :goto_7

    .line 442
    .end local v1    # "gen":Lcom/fasterxml/jackson/annotation/ObjectIdGenerator;, "Lcom/fasterxml/jackson/annotation/ObjectIdGenerator<*>;"
    .end local v4    # "idType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_86
    add-int/lit8 v2, v2, 0x1

    goto :goto_1e

    .line 467
    .end local v2    # "i":I
    .end local v3    # "idProp":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    .end local v6    # "len":I
    .end local v8    # "prop":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    .end local v9    # "propName":Ljava/lang/String;
    :cond_89
    invoke-virtual {p1, v5}, Lcom/fasterxml/jackson/databind/SerializerProvider;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v10

    .line 469
    .local v10, "type":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v11

    const-class v12, Lcom/fasterxml/jackson/annotation/ObjectIdGenerator;

    invoke-virtual {v11, v10, v12}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v11

    const/4 v12, 0x0

    aget-object v4, v11, v12

    .line 470
    .restart local v4    # "idType":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v11

    invoke-virtual {p1, v11, v7}, Lcom/fasterxml/jackson/databind/SerializerProvider;->objectIdGeneratorInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;)Lcom/fasterxml/jackson/annotation/ObjectIdGenerator;

    move-result-object v1

    .line 471
    .restart local v1    # "gen":Lcom/fasterxml/jackson/annotation/ObjectIdGenerator;, "Lcom/fasterxml/jackson/annotation/ObjectIdGenerator<*>;"
    invoke-virtual {v7}, Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;->getPropertyName()Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v11

    invoke-virtual {v7}, Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;->getAlwaysAsId()Z

    move-result v12

    invoke-static {v4, v11, v1, v12}, Lcom/fasterxml/jackson/databind/ser/impl/ObjectIdWriter;->construct(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/PropertyName;Lcom/fasterxml/jackson/annotation/ObjectIdGenerator;Z)Lcom/fasterxml/jackson/databind/ser/impl/ObjectIdWriter;

    move-result-object v11

    goto/16 :goto_7
.end method

.method protected constructPropertyBuilder(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/ser/PropertyBuilder;
    .registers 4
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;

    .prologue
    .line 489
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/PropertyBuilder;

    invoke-direct {v0, p1, p2}, Lcom/fasterxml/jackson/databind/ser/PropertyBuilder;-><init>(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;)V

    return-object v0
.end method

.method public createSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 11
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "origType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v1

    .line 133
    .local v1, "config":Lcom/fasterxml/jackson/databind/SerializationConfig;
    invoke-virtual {v1, p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->introspect(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/BeanDescription;

    move-result-object v0

    .line 134
    .local v0, "beanDesc":Lcom/fasterxml/jackson/databind/BeanDescription;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v7

    invoke-virtual {p0, p1, v7}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findSerializerFromAnnotation(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v4

    .line 135
    .local v4, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    if-eqz v4, :cond_14

    move-object v7, v4

    .line 165
    :goto_13
    return-object v7

    .line 140
    :cond_14
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v7

    invoke-virtual {p0, v1, v7, p2}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->modifyTypeByAnnotation(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v6

    .line 141
    .local v6, "type":Lcom/fasterxml/jackson/databind/JavaType;
    if-ne v6, p2, :cond_2a

    .line 142
    const/4 v5, 0x0

    .line 150
    .local v5, "staticTyping":Z
    :cond_1f
    :goto_1f
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/BeanDescription;->findSerializationConverter()Lcom/fasterxml/jackson/databind/util/Converter;

    move-result-object v2

    .line 151
    .local v2, "conv":Lcom/fasterxml/jackson/databind/util/Converter;, "Lcom/fasterxml/jackson/databind/util/Converter<Ljava/lang/Object;Ljava/lang/Object;>;"
    if-nez v2, :cond_3a

    .line 152
    invoke-virtual {p0, p1, v6, v0, v5}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_createSerializer2(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v7

    goto :goto_13

    .line 144
    .end local v2    # "conv":Lcom/fasterxml/jackson/databind/util/Converter;, "Lcom/fasterxml/jackson/databind/util/Converter<Ljava/lang/Object;Ljava/lang/Object;>;"
    .end local v5    # "staticTyping":Z
    :cond_2a
    const/4 v5, 0x1

    .line 145
    .restart local v5    # "staticTyping":Z
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/fasterxml/jackson/databind/JavaType;->hasRawClass(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_1f

    .line 146
    invoke-virtual {v1, v6}, Lcom/fasterxml/jackson/databind/SerializationConfig;->introspect(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/BeanDescription;

    move-result-object v0

    goto :goto_1f

    .line 154
    .restart local v2    # "conv":Lcom/fasterxml/jackson/databind/util/Converter;, "Lcom/fasterxml/jackson/databind/util/Converter<Ljava/lang/Object;Ljava/lang/Object;>;"
    :cond_3a
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v7

    invoke-interface {v2, v7}, Lcom/fasterxml/jackson/databind/util/Converter;->getOutputType(Lcom/fasterxml/jackson/databind/type/TypeFactory;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v3

    .line 157
    .local v3, "delegateType":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual {v6}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/fasterxml/jackson/databind/JavaType;->hasRawClass(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_58

    .line 158
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/databind/SerializationConfig;->introspect(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/BeanDescription;

    move-result-object v0

    .line 160
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v7

    invoke-virtual {p0, p1, v7}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->findSerializerFromAnnotation(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v4

    .line 162
    :cond_58
    if-nez v4, :cond_5f

    .line 163
    const/4 v7, 0x1

    invoke-virtual {p0, p1, v3, v0, v7}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_createSerializer2(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v4

    .line 165
    :cond_5f
    new-instance v7, Lcom/fasterxml/jackson/databind/ser/std/StdDelegatingSerializer;

    invoke-direct {v7, v2, v3, v4}, Lcom/fasterxml/jackson/databind/ser/std/StdDelegatingSerializer;-><init>(Lcom/fasterxml/jackson/databind/util/Converter;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    goto :goto_13
.end method

.method protected customSerializers()Ljava/lang/Iterable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/fasterxml/jackson/databind/ser/Serializers;",
            ">;"
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializers()Ljava/lang/Iterable;

    move-result-object v0

    return-object v0
.end method

.method protected filterBeanProperties(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Ljava/util/List;)Ljava/util/List;
    .registers 10
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Ljava/util/List",
            "<",
            "Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 583
    .local p3, "props":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;>;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v3

    .line 584
    .local v3, "intr":Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v0

    .line 585
    .local v0, "ac":Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    invoke-virtual {v3, v0}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findPropertiesToIgnore(Lcom/fasterxml/jackson/databind/introspect/Annotated;)[Ljava/lang/String;

    move-result-object v1

    .line 586
    .local v1, "ignored":[Ljava/lang/String;
    if-eqz v1, :cond_33

    array-length v5, v1

    if-lez v5, :cond_33

    .line 587
    invoke-static {v1}, Lcom/fasterxml/jackson/databind/util/ArrayBuilders;->arrayToSet([Ljava/lang/Object;)Ljava/util/HashSet;

    move-result-object v2

    .line 588
    .local v2, "ignoredSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 589
    .local v4, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;>;"
    :cond_19
    :goto_19
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_33

    .line 590
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    .line 591
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_19

    .line 595
    .end local v2    # "ignoredSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v4    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;>;"
    :cond_33
    return-object p3
.end method

.method protected findBeanProperties(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;)Ljava/util/List;
    .registers 18
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p3, "builder"    # Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 523
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->findProperties()Ljava/util/List;

    move-result-object v11

    .line 524
    .local v11, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;>;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v9

    .line 527
    .local v9, "config":Lcom/fasterxml/jackson/databind/SerializationConfig;
    move-object/from16 v0, p2

    invoke-virtual {p0, v9, v0, v11}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->removeIgnorableTypes(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Ljava/util/List;)V

    .line 530
    sget-object v1, Lcom/fasterxml/jackson/databind/MapperFeature;->REQUIRE_SETTERS_FOR_GETTERS:Lcom/fasterxml/jackson/databind/MapperFeature;

    invoke-virtual {v9, v1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/MapperFeature;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 531
    move-object/from16 v0, p2

    invoke-virtual {p0, v9, v0, v11}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->removeSetterlessGetters(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Ljava/util/List;)V

    .line 535
    :cond_1a
    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 536
    const/4 v13, 0x0

    .line 567
    :cond_21
    return-object v13

    .line 539
    :cond_22
    const/4 v1, 0x0

    move-object/from16 v0, p2

    invoke-virtual {p0, v9, v0, v1}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->usesStaticTyping(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)Z

    move-result v6

    .line 540
    .local v6, "staticTyping":Z
    move-object/from16 v0, p2

    invoke-virtual {p0, v9, v0}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->constructPropertyBuilder(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/ser/PropertyBuilder;

    move-result-object v5

    .line 542
    .local v5, "pb":Lcom/fasterxml/jackson/databind/ser/PropertyBuilder;
    new-instance v13, Ljava/util/ArrayList;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v13, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 543
    .local v13, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;>;"
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->bindingsForBeanType()Lcom/fasterxml/jackson/databind/type/TypeBindings;

    move-result-object v4

    .line 544
    .local v4, "typeBind":Lcom/fasterxml/jackson/databind/type/TypeBindings;
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_40
    :goto_40
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;

    .line 545
    .local v3, "property":Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;
    invoke-virtual {v3}, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;->getAccessor()Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    move-result-object v8

    .line 547
    .local v8, "accessor":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    invoke-virtual {v3}, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;->isTypeId()Z

    move-result v1

    if-eqz v1, :cond_67

    .line 548
    if-eqz v8, :cond_40

    .line 549
    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/SerializationConfig;->canOverrideAccessModifiers()Z

    move-result v1

    if-eqz v1, :cond_61

    .line 550
    invoke-virtual {v8}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;->fixAccess()V

    .line 552
    :cond_61
    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;->setTypeId(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)V

    goto :goto_40

    .line 557
    :cond_67
    invoke-virtual {v3}, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;->findReferenceType()Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;

    move-result-object v12

    .line 558
    .local v12, "refType":Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;
    if-eqz v12, :cond_73

    invoke-virtual {v12}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;->isBackReference()Z

    move-result v1

    if-nez v1, :cond_40

    .line 561
    :cond_73
    instance-of v1, v8, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    if-eqz v1, :cond_84

    move-object v7, v8

    .line 562
    check-cast v7, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    move-object v1, p0

    move-object v2, p1

    invoke-virtual/range {v1 .. v7}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_constructWriter(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;Lcom/fasterxml/jackson/databind/type/TypeBindings;Lcom/fasterxml/jackson/databind/ser/PropertyBuilder;ZLcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    move-result-object v1

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_40

    :cond_84
    move-object v7, v8

    .line 564
    check-cast v7, Lcom/fasterxml/jackson/databind/introspect/AnnotatedField;

    move-object v1, p0

    move-object v2, p1

    invoke-virtual/range {v1 .. v7}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_constructWriter(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;Lcom/fasterxml/jackson/databind/type/TypeBindings;Lcom/fasterxml/jackson/databind/ser/PropertyBuilder;ZLcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    move-result-object v1

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_40
.end method

.method public findBeanSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 5
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 262
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->isPotentialBeanType(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_12

    .line 265
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->isEnumType()Z

    move-result v0

    if-nez v0, :cond_12

    .line 266
    const/4 v0, 0x0

    .line 269
    :goto_11
    return-object v0

    :cond_12
    invoke-virtual {p0, p1, p3}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->constructBeanSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    goto :goto_11
.end method

.method public findPropertyContentTypeSerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .registers 9
    .param p1, "containerType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p3, "accessor"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 311
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v2

    .line 312
    .local v2, "contentType":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v0

    .line 313
    .local v0, "ai":Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
    invoke-virtual {v0, p2, p3, p1}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findPropertyContentTypeResolver(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v1

    .line 315
    .local v1, "b":Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;, "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder<*>;"
    if-nez v1, :cond_13

    .line 316
    invoke-virtual {p0, p2, v2}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->createTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v4

    .line 320
    :goto_12
    return-object v4

    .line 318
    :cond_13
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getSubtypeResolver()Lcom/fasterxml/jackson/databind/jsontype/SubtypeResolver;

    move-result-object v4

    invoke-virtual {v4, p3, p2, v0, v2}, Lcom/fasterxml/jackson/databind/jsontype/SubtypeResolver;->collectAndResolveSubtypes(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/AnnotationIntrospector;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/util/Collection;

    move-result-object v3

    .line 320
    .local v3, "subtypes":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/fasterxml/jackson/databind/jsontype/NamedType;>;"
    invoke-interface {v1, p2, v2, v3}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->buildTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Ljava/util/Collection;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v4

    goto :goto_12
.end method

.method public findPropertyTypeSerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .registers 8
    .param p1, "baseType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p3, "accessor"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 286
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v0

    .line 287
    .local v0, "ai":Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
    invoke-virtual {v0, p2, p3, p1}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findPropertyTypeResolver(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v1

    .line 289
    .local v1, "b":Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;, "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder<*>;"
    if-nez v1, :cond_f

    .line 290
    invoke-virtual {p0, p2, p1}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->createTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v3

    .line 294
    :goto_e
    return-object v3

    .line 292
    :cond_f
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getSubtypeResolver()Lcom/fasterxml/jackson/databind/jsontype/SubtypeResolver;

    move-result-object v3

    invoke-virtual {v3, p3, p2, v0, p1}, Lcom/fasterxml/jackson/databind/jsontype/SubtypeResolver;->collectAndResolveSubtypes(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/AnnotationIntrospector;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/util/Collection;

    move-result-object v2

    .line 294
    .local v2, "subtypes":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/fasterxml/jackson/databind/jsontype/NamedType;>;"
    invoke-interface {v1, p2, p1, v2}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->buildTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Ljava/util/Collection;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v3

    goto :goto_e
.end method

.method protected isPotentialBeanType(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 512
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->canBeABeanType(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e

    invoke-static {p1}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->isProxyType(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected processViews(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;)V
    .registers 12
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "builder"    # Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;

    .prologue
    .line 610
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;->getProperties()Ljava/util/List;

    move-result-object v5

    .line 611
    .local v5, "props":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;>;"
    sget-object v8, Lcom/fasterxml/jackson/databind/MapperFeature;->DEFAULT_VIEW_INCLUSION:Lcom/fasterxml/jackson/databind/MapperFeature;

    invoke-virtual {p1, v8}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/MapperFeature;)Z

    move-result v3

    .line 612
    .local v3, "includeByDefault":Z
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v4

    .line 613
    .local v4, "propCount":I
    const/4 v7, 0x0

    .line 614
    .local v7, "viewsFound":I
    new-array v1, v4, [Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    .line 616
    .local v1, "filtered":[Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_12
    if-ge v2, v4, :cond_30

    .line 617
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    .line 618
    .local v0, "bpw":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;->getViews()[Ljava/lang/Class;

    move-result-object v6

    .line 619
    .local v6, "views":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    if-nez v6, :cond_27

    .line 620
    if-eqz v3, :cond_24

    .line 621
    aput-object v0, v1, v2

    .line 616
    :cond_24
    :goto_24
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 624
    :cond_27
    add-int/lit8 v7, v7, 0x1

    .line 625
    invoke-virtual {p0, v0, v6}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->constructFilteredBeanWriter(Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;[Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    move-result-object v8

    aput-object v8, v1, v2

    goto :goto_24

    .line 629
    .end local v0    # "bpw":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    .end local v6    # "views":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_30
    if-eqz v3, :cond_35

    if-nez v7, :cond_35

    .line 633
    :goto_34
    return-void

    .line 632
    :cond_35
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerBuilder;->setFilteredProperties([Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;)V

    goto :goto_34
.end method

.method protected removeIgnorableTypes(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Ljava/util/List;)V
    .registers 14
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Ljava/util/List",
            "<",
            "Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 643
    .local p3, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;>;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v4

    .line 644
    .local v4, "intr":Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 645
    .local v3, "ignores":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Class<*>;Ljava/lang/Boolean;>;"
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 646
    .local v5, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;>;"
    :cond_d
    :goto_d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4c

    .line 647
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;

    .line 648
    .local v6, "property":Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;
    invoke-virtual {v6}, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;->getAccessor()Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    move-result-object v1

    .line 649
    .local v1, "accessor":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    if-nez v1, :cond_23

    .line 650
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    goto :goto_d

    .line 653
    :cond_23
    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;->getRawType()Ljava/lang/Class;

    move-result-object v8

    .line 654
    .local v8, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v3, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    .line 655
    .local v7, "result":Ljava/lang/Boolean;
    if-nez v7, :cond_42

    .line 656
    invoke-virtual {p1, v8}, Lcom/fasterxml/jackson/databind/SerializationConfig;->introspectClassAnnotations(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/BeanDescription;

    move-result-object v2

    .line 657
    .local v2, "desc":Lcom/fasterxml/jackson/databind/BeanDescription;
    invoke-virtual {v2}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v0

    .line 658
    .local v0, "ac":Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    invoke-virtual {v4, v0}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->isIgnorableType(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/Boolean;

    move-result-object v7

    .line 660
    if-nez v7, :cond_3f

    .line 661
    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 663
    :cond_3f
    invoke-virtual {v3, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 666
    .end local v0    # "ac":Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    .end local v2    # "desc":Lcom/fasterxml/jackson/databind/BeanDescription;
    :cond_42
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-eqz v9, :cond_d

    .line 667
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    goto :goto_d

    .line 670
    .end local v1    # "accessor":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    .end local v6    # "property":Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;
    .end local v7    # "result":Ljava/lang/Boolean;
    .end local v8    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4c
    return-void
.end method

.method protected removeSetterlessGetters(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Ljava/util/List;)V
    .registers 7
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Ljava/util/List",
            "<",
            "Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 678
    .local p3, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;>;"
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 679
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;>;"
    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 680
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;

    .line 683
    .local v1, "property":Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;
    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;->couldDeserialize()Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;->isExplicitlyIncluded()Z

    move-result v2

    if-nez v2, :cond_4

    .line 684
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_4

    .line 687
    .end local v1    # "property":Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;
    :cond_20
    return-void
.end method

.method public withConfig(Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;)Lcom/fasterxml/jackson/databind/ser/SerializerFactory;
    .registers 5
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    if-ne v0, p1, :cond_5

    .line 101
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;
    :goto_4
    return-object p0

    .line 96
    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;

    if-eq v0, v1, :cond_3a

    .line 97
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Subtype of BeanSerializerFactory ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") has not properly overridden method \'withAdditionalSerializers\': can not instantiate subtype with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "additional serializer definitions"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_3a
    new-instance p0, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerFactory;-><init>(Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;)V

    goto :goto_4
.end method
