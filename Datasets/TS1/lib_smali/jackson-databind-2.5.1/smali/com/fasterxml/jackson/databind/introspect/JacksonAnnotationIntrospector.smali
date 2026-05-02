.class public Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;
.super Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
.source "JacksonAnnotationIntrospector.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector$1;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;-><init>()V

    return-void
.end method

.method private final _findSortAlpha(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Boolean;
    .registers 4
    .param p1, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 522
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;

    .line 523
    .local v0, "order":Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;->alphabetic()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_b
.end method


# virtual methods
.method protected _classIfExplicit(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 848
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_8

    invoke-static {p1}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->isBogusClass(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 849
    :cond_8
    const/4 p1, 0x0

    .line 851
    .end local p1    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_9
    return-object p1
.end method

.method protected _classIfExplicit(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Class;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 855
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "implicit":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p1

    .line 856
    if-eqz p1, :cond_8

    if-ne p1, p2, :cond_9

    :cond_8
    const/4 p1, 0x0

    .end local p1    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_9
    return-object p1
.end method

.method protected _constructNoTypeResolverBuilder()Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;
    .registers 2

    .prologue
    .line 945
    invoke-static {}, Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;->noTypeInfoBuilder()Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected _constructStdTypeResolverBuilder()Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;
    .registers 2

    .prologue
    .line 937
    new-instance v0, Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;-><init>()V

    return-object v0
.end method

.method protected _constructVirtualProperty(Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    .registers 12
    .param p1, "attr"    # Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;
    .param p3, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    .param p4, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;",
            "Lcom/fasterxml/jackson/databind/cfg/MapperConfig",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;"
        }
    .end annotation

    .prologue
    .line 567
    .local p2, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;->required()Z

    move-result v5

    if-eqz v5, :cond_41

    sget-object v2, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_REQUIRED:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    .line 570
    .local v2, "metadata":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    :goto_8
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;->value()Ljava/lang/String;

    move-result-object v0

    .line 573
    .local v0, "attrName":Ljava/lang/String;
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;->propName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;->propNamespace()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_propertyName(Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v4

    .line 574
    .local v4, "propName":Lcom/fasterxml/jackson/databind/PropertyName;
    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/PropertyName;->hasSimpleName()Z

    move-result v5

    if-nez v5, :cond_23

    .line 575
    new-instance v4, Lcom/fasterxml/jackson/databind/PropertyName;

    .end local v4    # "propName":Lcom/fasterxml/jackson/databind/PropertyName;
    invoke-direct {v4, v0}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;)V

    .line 578
    .restart local v4    # "propName":Lcom/fasterxml/jackson/databind/PropertyName;
    :cond_23
    new-instance v1, Lcom/fasterxml/jackson/databind/introspect/VirtualAnnotatedMember;

    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;->getRawType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p4}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v6

    invoke-direct {v1, p3, v5, v0, v6}, Lcom/fasterxml/jackson/databind/introspect/VirtualAnnotatedMember;-><init>(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    .line 581
    .local v1, "member":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;->include()Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    move-result-object v5

    invoke-static {p2, v1, v4, v2, v5}, Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;->construct(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/PropertyName;Lcom/fasterxml/jackson/databind/PropertyMetadata;Lcom/fasterxml/jackson/annotation/JsonInclude$Include;)Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;

    move-result-object v3

    .line 584
    .local v3, "propDef":Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;->getAnnotations()Lcom/fasterxml/jackson/databind/util/Annotations;

    move-result-object v5

    invoke-static {v0, v3, v5, p4}, Lcom/fasterxml/jackson/databind/ser/impl/AttributePropertyWriter;->construct(Ljava/lang/String;Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;Lcom/fasterxml/jackson/databind/util/Annotations;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ser/impl/AttributePropertyWriter;

    move-result-object v5

    return-object v5

    .line 567
    .end local v0    # "attrName":Ljava/lang/String;
    .end local v1    # "member":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    .end local v2    # "metadata":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    .end local v3    # "propDef":Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;
    .end local v4    # "propName":Lcom/fasterxml/jackson/databind/PropertyName;
    :cond_41
    sget-object v2, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_OPTIONAL:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    goto :goto_8
.end method

.method protected _constructVirtualProperty(Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    .registers 15
    .param p1, "prop"    # Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;
    .param p3, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;",
            "Lcom/fasterxml/jackson/databind/cfg/MapperConfig",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;",
            ")",
            "Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;"
        }
    .end annotation

    .prologue
    .line 591
    .local p2, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->required()Z

    move-result v8

    if-eqz v8, :cond_51

    sget-object v4, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_REQUIRED:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    .line 593
    .local v4, "metadata":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    :goto_8
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->name()Ljava/lang/String;

    move-result-object v8

    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->namespace()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v8, v9}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_propertyName(Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v6

    .line 594
    .local v6, "propName":Lcom/fasterxml/jackson/databind/PropertyName;
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->type()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {p2, v8}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->constructType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v7

    .line 596
    .local v7, "type":Lcom/fasterxml/jackson/databind/JavaType;
    new-instance v3, Lcom/fasterxml/jackson/databind/introspect/VirtualAnnotatedMember;

    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;->getRawType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v6}, Lcom/fasterxml/jackson/databind/PropertyName;->getSimpleName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v10

    invoke-direct {v3, p3, v8, v9, v10}, Lcom/fasterxml/jackson/databind/introspect/VirtualAnnotatedMember;-><init>(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    .line 599
    .local v3, "member":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->include()Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    move-result-object v8

    invoke-static {p2, v3, v6, v4, v8}, Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;->construct(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/PropertyName;Lcom/fasterxml/jackson/databind/PropertyMetadata;Lcom/fasterxml/jackson/annotation/JsonInclude$Include;)Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;

    move-result-object v5

    .line 602
    .local v5, "propDef":Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->value()Ljava/lang/Class;

    move-result-object v2

    .line 604
    .local v2, "implClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->getHandlerInstantiator()Lcom/fasterxml/jackson/databind/cfg/HandlerInstantiator;

    move-result-object v1

    .line 605
    .local v1, "hi":Lcom/fasterxml/jackson/databind/cfg/HandlerInstantiator;
    if-nez v1, :cond_54

    const/4 v0, 0x0

    .line 607
    .local v0, "bpw":Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;
    :goto_40
    if-nez v0, :cond_4c

    .line 608
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->canOverrideAccessModifiers()Z

    move-result v8

    invoke-static {v2, v8}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->createInstance(Ljava/lang/Class;Z)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "bpw":Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;
    check-cast v0, Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;

    .line 613
    .restart local v0    # "bpw":Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;
    :cond_4c
    invoke-virtual {v0, p2, p3, v5, v7}, Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;->withConfig(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;

    move-result-object v8

    return-object v8

    .line 591
    .end local v0    # "bpw":Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;
    .end local v1    # "hi":Lcom/fasterxml/jackson/databind/cfg/HandlerInstantiator;
    .end local v2    # "implClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "member":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    .end local v4    # "metadata":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    .end local v5    # "propDef":Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;
    .end local v6    # "propName":Lcom/fasterxml/jackson/databind/PropertyName;
    .end local v7    # "type":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_51
    sget-object v4, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_OPTIONAL:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    goto :goto_8

    .line 605
    .restart local v1    # "hi":Lcom/fasterxml/jackson/databind/cfg/HandlerInstantiator;
    .restart local v2    # "implClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "member":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    .restart local v4    # "metadata":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    .restart local v5    # "propDef":Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;
    .restart local v6    # "propName":Lcom/fasterxml/jackson/databind/PropertyName;
    .restart local v7    # "type":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_54
    invoke-virtual {v1, p2, v2}, Lcom/fasterxml/jackson/databind/cfg/HandlerInstantiator;->virtualPropertyWriterInstance(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;

    move-result-object v0

    goto :goto_40
.end method

.method protected final _findFilterId(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 117
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonFilter;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonFilter;

    .line 118
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonFilter;
    if-eqz v0, :cond_15

    .line 119
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonFilter;->value()Ljava/lang/String;

    move-result-object v1

    .line 121
    .local v1, "id":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_15

    .line 125
    .end local v1    # "id":Ljava/lang/String;
    :goto_14
    return-object v1

    :cond_15
    const/4 v1, 0x0

    goto :goto_14
.end method

.method protected _findTypeResolver(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;
    .registers 14
    .param p2, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p3, "baseType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/cfg/MapperConfig",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder",
            "<*>;"
        }
    .end annotation

    .prologue
    .local p1, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    const/4 v7, 0x0

    .line 879
    const-class v8, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;

    invoke-virtual {p0, p2, v8}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;

    .line 880
    .local v5, "info":Lcom/fasterxml/jackson/annotation/JsonTypeInfo;
    const-class v8, Lcom/fasterxml/jackson/databind/annotation/JsonTypeResolver;

    invoke-virtual {p0, p2, v8}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lcom/fasterxml/jackson/databind/annotation/JsonTypeResolver;

    .line 882
    .local v6, "resAnn":Lcom/fasterxml/jackson/databind/annotation/JsonTypeResolver;
    if-eqz v6, :cond_6c

    .line 883
    if-nez v5, :cond_17

    move-object v0, v7

    .line 929
    :goto_16
    return-object v0

    .line 890
    :cond_17
    invoke-interface {v6}, Lcom/fasterxml/jackson/databind/annotation/JsonTypeResolver;->value()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {p1, p2, v8}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->typeResolverBuilderInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 902
    .local v0, "b":Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;, "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder<*>;"
    :goto_1f
    const-class v8, Lcom/fasterxml/jackson/databind/annotation/JsonTypeIdResolver;

    invoke-virtual {p0, p2, v8}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/databind/annotation/JsonTypeIdResolver;

    .line 903
    .local v3, "idResInfo":Lcom/fasterxml/jackson/databind/annotation/JsonTypeIdResolver;
    if-nez v3, :cond_82

    move-object v2, v7

    .line 905
    .local v2, "idRes":Lcom/fasterxml/jackson/databind/jsontype/TypeIdResolver;
    :goto_2a
    if-eqz v2, :cond_2f

    .line 906
    invoke-interface {v2, p3}, Lcom/fasterxml/jackson/databind/jsontype/TypeIdResolver;->init(Lcom/fasterxml/jackson/databind/JavaType;)V

    .line 908
    :cond_2f
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->use()Lcom/fasterxml/jackson/annotation/JsonTypeInfo$Id;

    move-result-object v7

    invoke-interface {v0, v7, v2}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->init(Lcom/fasterxml/jackson/annotation/JsonTypeInfo$Id;Lcom/fasterxml/jackson/databind/jsontype/TypeIdResolver;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 913
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->include()Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;

    move-result-object v4

    .line 914
    .local v4, "inclusion":Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;
    sget-object v7, Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;->EXTERNAL_PROPERTY:Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;

    if-ne v4, v7, :cond_45

    instance-of v7, p2, Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    if-eqz v7, :cond_45

    .line 915
    sget-object v4, Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;->PROPERTY:Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;

    .line 917
    :cond_45
    invoke-interface {v0, v4}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->inclusion(Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 918
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->property()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->typeProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 919
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->defaultImpl()Ljava/lang/Class;

    move-result-object v1

    .line 925
    .local v1, "defaultImpl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v7, Lcom/fasterxml/jackson/annotation/JsonTypeInfo$None;

    if-eq v1, v7, :cond_63

    invoke-virtual {v1}, Ljava/lang/Class;->isAnnotation()Z

    move-result v7

    if-nez v7, :cond_63

    .line 926
    invoke-interface {v0, v1}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->defaultImpl(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 928
    :cond_63
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->visible()Z

    move-result v7

    invoke-interface {v0, v7}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->typeIdVisibility(Z)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 929
    goto :goto_16

    .line 892
    .end local v0    # "b":Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;, "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder<*>;"
    .end local v1    # "defaultImpl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "idRes":Lcom/fasterxml/jackson/databind/jsontype/TypeIdResolver;
    .end local v3    # "idResInfo":Lcom/fasterxml/jackson/databind/annotation/JsonTypeIdResolver;
    .end local v4    # "inclusion":Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;
    :cond_6c
    if-nez v5, :cond_70

    move-object v0, v7

    .line 893
    goto :goto_16

    .line 896
    :cond_70
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->use()Lcom/fasterxml/jackson/annotation/JsonTypeInfo$Id;

    move-result-object v8

    sget-object v9, Lcom/fasterxml/jackson/annotation/JsonTypeInfo$Id;->NONE:Lcom/fasterxml/jackson/annotation/JsonTypeInfo$Id;

    if-ne v8, v9, :cond_7d

    .line 897
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_constructNoTypeResolverBuilder()Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;

    move-result-object v0

    goto :goto_16

    .line 899
    :cond_7d
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_constructStdTypeResolverBuilder()Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;

    move-result-object v0

    .restart local v0    # "b":Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;, "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder<*>;"
    goto :goto_1f

    .line 903
    .restart local v3    # "idResInfo":Lcom/fasterxml/jackson/databind/annotation/JsonTypeIdResolver;
    :cond_82
    invoke-interface {v3}, Lcom/fasterxml/jackson/databind/annotation/JsonTypeIdResolver;->value()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {p1, p2, v7}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->typeIdResolverInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/jsontype/TypeIdResolver;

    move-result-object v2

    goto :goto_2a
.end method

.method protected _isIgnorable(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Z
    .registers 4
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 843
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonIgnore;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIgnore;

    .line 844
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonIgnore;
    if-eqz v0, :cond_12

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIgnore;->value()Z

    move-result v1

    if-eqz v1, :cond_12

    const/4 v1, 0x1

    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method protected _propertyName(Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;
    .registers 4
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    .line 860
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 861
    sget-object v0, Lcom/fasterxml/jackson/databind/PropertyName;->USE_DEFAULT:Lcom/fasterxml/jackson/databind/PropertyName;

    .line 866
    :goto_8
    return-object v0

    .line 863
    :cond_9
    if-eqz p2, :cond_11

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 864
    :cond_11
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyName;

    invoke-direct {v0, p1}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;)V

    goto :goto_8

    .line 866
    :cond_17
    new-instance v0, Lcom/fasterxml/jackson/databind/PropertyName;

    invoke-direct {v0, p1, p2}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8
.end method

.method public findAndAddVirtualProperties(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Ljava/util/List;)V
    .registers 13
    .param p2, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/cfg/MapperConfig",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;",
            "Ljava/util/List",
            "<",
            "Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 529
    .local p1, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    .local p3, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;>;"
    const-class v8, Lcom/fasterxml/jackson/databind/annotation/JsonAppend;

    invoke-virtual {p0, p2, v8}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonAppend;

    .line 530
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonAppend;
    if-nez v0, :cond_b

    .line 562
    :cond_a
    return-void

    .line 533
    :cond_b
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend;->prepend()Z

    move-result v5

    .line 534
    .local v5, "prepend":Z
    const/4 v6, 0x0

    .line 537
    .local v6, "propType":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend;->attrs()[Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;

    move-result-object v1

    .line 538
    .local v1, "attrs":[Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;
    const/4 v3, 0x0

    .local v3, "i":I
    array-length v4, v1

    .local v4, "len":I
    :goto_16
    if-ge v3, v4, :cond_32

    .line 539
    if-nez v6, :cond_20

    .line 540
    const-class v8, Ljava/lang/Object;

    invoke-virtual {p1, v8}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->constructType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v6

    .line 542
    :cond_20
    aget-object v8, v1, v3

    invoke-virtual {p0, v8, p1, p2, v6}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_constructVirtualProperty(Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    move-result-object v2

    .line 544
    .local v2, "bpw":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    if-eqz v5, :cond_2e

    .line 545
    invoke-interface {p3, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 538
    :goto_2b
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 547
    :cond_2e
    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2b

    .line 552
    .end local v2    # "bpw":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    :cond_32
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend;->props()[Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;

    move-result-object v7

    .line 553
    .local v7, "props":[Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;
    const/4 v3, 0x0

    array-length v4, v7

    :goto_38
    if-ge v3, v4, :cond_a

    .line 554
    aget-object v8, v7, v3

    invoke-virtual {p0, v8, p1, p2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_constructVirtualProperty(Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    move-result-object v2

    .line 556
    .restart local v2    # "bpw":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    if-eqz v5, :cond_48

    .line 557
    invoke-interface {p3, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 553
    :goto_45
    add-int/lit8 v3, v3, 0x1

    goto :goto_38

    .line 559
    :cond_48
    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_45
.end method

.method public findAutoDetectVisibility(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker;)Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker;
    .registers 5
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;",
            "Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 145
    .local p2, "checker":Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker;, "Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker<*>;"
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonAutoDetect;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonAutoDetect;

    .line 146
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonAutoDetect;
    if-nez v0, :cond_b

    .end local p2    # "checker":Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker;, "Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker<*>;"
    :goto_a
    return-object p2

    .restart local p2    # "checker":Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker;, "Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker<*>;"
    :cond_b
    invoke-interface {p2, v0}, Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker;->with(Lcom/fasterxml/jackson/annotation/JsonAutoDetect;)Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker;

    move-result-object p2

    goto :goto_a
.end method

.method public findContentDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 688
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 689
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-eqz v0, :cond_13

    .line 690
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->contentUsing()Ljava/lang/Class;

    move-result-object v1

    .line 691
    .local v1, "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/JsonDeserializer$None;

    if-eq v1, v2, :cond_13

    .line 695
    .end local v1    # "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;>;"
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public bridge synthetic findContentDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->findContentDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public findContentSerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 327
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 328
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-eqz v0, :cond_13

    .line 329
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->contentUsing()Ljava/lang/Class;

    move-result-object v1

    .line 330
    .local v1, "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/JsonSerializer$None;

    if-eq v1, v2, :cond_13

    .line 334
    .end local v1    # "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public bridge synthetic findContentSerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->findContentSerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public findCreatorBinding(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/annotation/JsonCreator$Mode;
    .registers 4
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 831
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonCreator;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonCreator;

    .line 832
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonCreator;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonCreator;->mode()Lcom/fasterxml/jackson/annotation/JsonCreator$Mode;

    move-result-object v1

    goto :goto_b
.end method

.method public findDeserializationContentConverter(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 727
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 728
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->contentConverter()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/fasterxml/jackson/databind/util/Converter$None;

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findDeserializationContentType(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Class;
    .registers 5
    .param p1, "am"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p2, "baseContentType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 713
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 714
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->contentAs()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findDeserializationConverter(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 720
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 721
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->converter()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/fasterxml/jackson/databind/util/Converter$None;

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findDeserializationKeyType(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Class;
    .registers 5
    .param p1, "am"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p2, "baseKeyType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 706
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 707
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->keyAs()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findDeserializationType(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Class;
    .registers 5
    .param p1, "am"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p2, "baseType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 700
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 701
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->as()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 662
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 663
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-eqz v0, :cond_13

    .line 664
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->using()Ljava/lang/Class;

    move-result-object v1

    .line 665
    .local v1, "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/JsonDeserializer$None;

    if-eq v1, v2, :cond_13

    .line 669
    .end local v1    # "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;>;"
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public bridge synthetic findDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->findDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public findFilterId(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 3
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 112
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findFilterId(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public findFilterId(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/Object;
    .registers 3
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findFilterId(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public findFormat(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    .registers 4
    .param p1, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 458
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonFormat;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonFormat;

    .line 459
    .local v0, "f":Lcom/fasterxml/jackson/annotation/JsonFormat;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Lcom/fasterxml/jackson/annotation/JsonFormat$Value;

    invoke-direct {v1, v0}, Lcom/fasterxml/jackson/annotation/JsonFormat$Value;-><init>(Lcom/fasterxml/jackson/annotation/JsonFormat;)V

    goto :goto_b
.end method

.method public findIgnoreUnknownProperties(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/Boolean;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 91
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;

    .line 92
    .local v0, "ignore":Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;->ignoreUnknown()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_b
.end method

.method public findImplicitPropertyName(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Ljava/lang/String;
    .registers 3
    .param p1, "param"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 495
    const/4 v0, 0x0

    return-object v0
.end method

.method public findInjectableValueId(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Ljava/lang/Object;
    .registers 6
    .param p1, "m"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 201
    const-class v3, Lcom/fasterxml/jackson/annotation/JacksonInject;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/annotation/JacksonInject;

    .line 202
    .local v1, "ann":Lcom/fasterxml/jackson/annotation/JacksonInject;
    if-nez v1, :cond_c

    .line 203
    const/4 v2, 0x0

    .line 220
    :cond_b
    :goto_b
    return-object v2

    .line 208
    :cond_c
    invoke-interface {v1}, Lcom/fasterxml/jackson/annotation/JacksonInject;->value()Ljava/lang/String;

    move-result-object v2

    .line 209
    .local v2, "id":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_b

    .line 211
    instance-of v3, p1, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    if-nez v3, :cond_23

    .line 212
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;->getRawType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_b

    :cond_23
    move-object v0, p1

    .line 214
    check-cast v0, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    .line 215
    .local v0, "am":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;->getParameterCount()I

    move-result v3

    if-nez v3, :cond_35

    .line 216
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;->getRawType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_b

    .line 218
    :cond_35
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;->getRawParameterType(I)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_b
.end method

.method public findKeyDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Lcom/fasterxml/jackson/databind/KeyDeserializer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 675
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 676
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-eqz v0, :cond_13

    .line 677
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->keyUsing()Ljava/lang/Class;

    move-result-object v1

    .line 678
    .local v1, "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/KeyDeserializer;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/KeyDeserializer$None;

    if-eq v1, v2, :cond_13

    .line 682
    .end local v1    # "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/KeyDeserializer;>;"
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public bridge synthetic findKeyDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->findKeyDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public findKeySerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 314
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 315
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-eqz v0, :cond_13

    .line 316
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->keyUsing()Ljava/lang/Class;

    move-result-object v1

    .line 317
    .local v1, "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/JsonSerializer$None;

    if-eq v1, v2, :cond_13

    .line 321
    .end local v1    # "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public bridge synthetic findKeySerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->findKeySerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public findNameForDeserialization(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/PropertyName;
    .registers 6
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 772
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonSetter;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonSetter;

    .line 773
    .local v0, "js":Lcom/fasterxml/jackson/annotation/JsonSetter;
    if-eqz v0, :cond_17

    .line 774
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonSetter;->value()Ljava/lang/String;

    move-result-object v1

    .line 793
    .local v1, "name":Ljava/lang/String;
    :goto_e
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_53

    .line 794
    sget-object v3, Lcom/fasterxml/jackson/databind/PropertyName;->USE_DEFAULT:Lcom/fasterxml/jackson/databind/PropertyName;

    .line 796
    .end local v1    # "name":Ljava/lang/String;
    :goto_16
    return-object v3

    .line 776
    :cond_17
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 777
    .local v2, "pann":Lcom/fasterxml/jackson/annotation/JsonProperty;
    if-eqz v2, :cond_26

    .line 778
    invoke-interface {v2}, Lcom/fasterxml/jackson/annotation/JsonProperty;->value()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_e

    .line 783
    .end local v1    # "name":Ljava/lang/String;
    :cond_26
    const-class v3, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_4e

    const-class v3, Lcom/fasterxml/jackson/annotation/JsonView;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_4e

    const-class v3, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_4e

    const-class v3, Lcom/fasterxml/jackson/annotation/JsonBackReference;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_4e

    const-class v3, Lcom/fasterxml/jackson/annotation/JsonManagedReference;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_51

    .line 788
    :cond_4e
    const-string v1, ""

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_e

    .line 790
    .end local v1    # "name":Ljava/lang/String;
    :cond_51
    const/4 v3, 0x0

    goto :goto_16

    .line 796
    .end local v2    # "pann":Lcom/fasterxml/jackson/annotation/JsonProperty;
    .restart local v1    # "name":Ljava/lang/String;
    :cond_53
    new-instance v3, Lcom/fasterxml/jackson/databind/PropertyName;

    invoke-direct {v3, v1}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;)V

    goto :goto_16
.end method

.method public findNameForSerialization(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/PropertyName;
    .registers 6
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 625
    const/4 v1, 0x0

    .line 627
    .local v1, "name":Ljava/lang/String;
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonGetter;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonGetter;

    .line 628
    .local v0, "jg":Lcom/fasterxml/jackson/annotation/JsonGetter;
    if-eqz v0, :cond_18

    .line 629
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonGetter;->value()Ljava/lang/String;

    move-result-object v1

    .line 640
    :goto_f
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_3c

    .line 641
    sget-object v3, Lcom/fasterxml/jackson/databind/PropertyName;->USE_DEFAULT:Lcom/fasterxml/jackson/databind/PropertyName;

    .line 643
    :goto_17
    return-object v3

    .line 631
    :cond_18
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 632
    .local v2, "pann":Lcom/fasterxml/jackson/annotation/JsonProperty;
    if-eqz v2, :cond_27

    .line 633
    invoke-interface {v2}, Lcom/fasterxml/jackson/annotation/JsonProperty;->value()Ljava/lang/String;

    move-result-object v1

    goto :goto_f

    .line 634
    :cond_27
    const-class v3, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_37

    const-class v3, Lcom/fasterxml/jackson/annotation/JsonView;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 635
    :cond_37
    const-string v1, ""

    goto :goto_f

    .line 637
    :cond_3a
    const/4 v3, 0x0

    goto :goto_17

    .line 643
    .end local v2    # "pann":Lcom/fasterxml/jackson/annotation/JsonProperty;
    :cond_3c
    new-instance v3, Lcom/fasterxml/jackson/databind/PropertyName;

    invoke-direct {v3, v1}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;)V

    goto :goto_17
.end method

.method public findNamingStrategy(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/Object;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 131
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonNaming;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonNaming;

    .line 132
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonNaming;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonNaming;->value()Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findNullSerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 340
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 341
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-eqz v0, :cond_13

    .line 342
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->nullsUsing()Ljava/lang/Class;

    move-result-object v1

    .line 343
    .local v1, "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/JsonSerializer$None;

    if-eq v1, v2, :cond_13

    .line 347
    .end local v1    # "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public findObjectIdInfo(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;
    .registers 8
    .param p1, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 438
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;

    .line 439
    .local v0, "info":Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;
    if-eqz v0, :cond_12

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;->generator()Ljava/lang/Class;

    move-result-object v2

    const-class v3, Lcom/fasterxml/jackson/annotation/ObjectIdGenerators$None;

    if-ne v2, v3, :cond_14

    .line 440
    :cond_12
    const/4 v2, 0x0

    .line 444
    :goto_13
    return-object v2

    .line 443
    :cond_14
    new-instance v1, Lcom/fasterxml/jackson/databind/PropertyName;

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;->property()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/fasterxml/jackson/databind/PropertyName;-><init>(Ljava/lang/String;)V

    .line 444
    .local v1, "name":Lcom/fasterxml/jackson/databind/PropertyName;
    new-instance v2, Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;->scope()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;->generator()Ljava/lang/Class;

    move-result-object v4

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;->resolver()Ljava/lang/Class;

    move-result-object v5

    invoke-direct {v2, v1, v3, v4, v5}, Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;-><init>(Lcom/fasterxml/jackson/databind/PropertyName;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)V

    goto :goto_13
.end method

.method public findObjectReferenceInfo(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;)Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;
    .registers 5
    .param p1, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p2, "objectIdInfo"    # Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;

    .prologue
    .line 449
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonIdentityReference;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIdentityReference;

    .line 450
    .local v0, "ref":Lcom/fasterxml/jackson/annotation/JsonIdentityReference;
    if-eqz v0, :cond_12

    .line 451
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIdentityReference;->alwaysAsId()Z

    move-result v1

    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;->withAlwaysAsId(Z)Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;

    move-result-object p2

    .line 453
    :cond_12
    return-object p2
.end method

.method public findPOJOBuilder(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/Class;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 748
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 749
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->builder()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findPOJOBuilderConfig(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Lcom/fasterxml/jackson/databind/annotation/JsonPOJOBuilder$Value;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 755
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonPOJOBuilder;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonPOJOBuilder;

    .line 756
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonPOJOBuilder;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Lcom/fasterxml/jackson/databind/annotation/JsonPOJOBuilder$Value;

    invoke-direct {v1, v0}, Lcom/fasterxml/jackson/databind/annotation/JsonPOJOBuilder$Value;-><init>(Lcom/fasterxml/jackson/databind/annotation/JsonPOJOBuilder;)V

    goto :goto_b
.end method

.method public findPropertiesToIgnore(Lcom/fasterxml/jackson/databind/introspect/Annotated;)[Ljava/lang/String;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 85
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;

    .line 86
    .local v0, "ignore":Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;->value()[Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public findPropertyContentTypeResolver(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;
    .registers 7
    .param p2, "am"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    .param p3, "containerType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/cfg/MapperConfig",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 255
    .local p1, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isContainerType()Z

    move-result v0

    if-nez v0, :cond_25

    .line 256
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Must call method with a container type (got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 258
    :cond_25
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findTypeResolver(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    return-object v0
.end method

.method public findPropertyDefaultValue(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/String;
    .registers 6
    .param p1, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    const/4 v2, 0x0

    .line 464
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 465
    .local v0, "prop":Lcom/fasterxml/jackson/annotation/JsonProperty;
    if-nez v0, :cond_c

    .line 470
    :goto_b
    return-object v2

    .line 468
    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonProperty;->defaultValue()Ljava/lang/String;

    move-result-object v1

    .line 470
    .local v1, "str":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_17

    move-object v1, v2

    .end local v1    # "str":Ljava/lang/String;
    :cond_17
    move-object v2, v1

    goto :goto_b
.end method

.method public findPropertyDescription(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/String;
    .registers 4
    .param p1, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 475
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonPropertyDescription;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonPropertyDescription;

    .line 476
    .local v0, "desc":Lcom/fasterxml/jackson/annotation/JsonPropertyDescription;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonPropertyDescription;->value()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public findPropertyIndex(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Integer;
    .registers 5
    .param p1, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 481
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 482
    .local v1, "prop":Lcom/fasterxml/jackson/annotation/JsonProperty;
    if-eqz v1, :cond_16

    .line 483
    invoke-interface {v1}, Lcom/fasterxml/jackson/annotation/JsonProperty;->index()I

    move-result v0

    .line 484
    .local v0, "ix":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_16

    .line 485
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 488
    .end local v0    # "ix":I
    :goto_15
    return-object v2

    :cond_16
    const/4 v2, 0x0

    goto :goto_15
.end method

.method public findPropertyTypeResolver(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;
    .registers 5
    .param p2, "am"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    .param p3, "baseType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/cfg/MapperConfig",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 243
    .local p1, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isContainerType()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    .line 245
    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findTypeResolver(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    goto :goto_7
.end method

.method public findReferenceType(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;
    .registers 5
    .param p1, "member"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 158
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonManagedReference;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonManagedReference;

    .line 159
    .local v0, "ref1":Lcom/fasterxml/jackson/annotation/JsonManagedReference;
    if-eqz v0, :cond_13

    .line 160
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonManagedReference;->value()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;->managed(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;

    move-result-object v2

    .line 166
    :goto_12
    return-object v2

    .line 162
    :cond_13
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonBackReference;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/annotation/JsonBackReference;

    .line 163
    .local v1, "ref2":Lcom/fasterxml/jackson/annotation/JsonBackReference;
    if-eqz v1, :cond_26

    .line 164
    invoke-interface {v1}, Lcom/fasterxml/jackson/annotation/JsonBackReference;->value()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;->back(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;

    move-result-object v2

    goto :goto_12

    .line 166
    :cond_26
    const/4 v2, 0x0

    goto :goto_12
.end method

.method public findRootName(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Lcom/fasterxml/jackson/databind/PropertyName;
    .registers 5
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 72
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonRootName;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonRootName;

    .line 73
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonRootName;
    if-nez v0, :cond_c

    .line 74
    const/4 v2, 0x0

    .line 80
    :goto_b
    return-object v2

    .line 76
    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonRootName;->namespace()Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "ns":Ljava/lang/String;
    if-eqz v1, :cond_19

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_19

    .line 78
    const/4 v1, 0x0

    .line 80
    :cond_19
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonRootName;->value()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/fasterxml/jackson/databind/PropertyName;->construct(Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v2

    goto :goto_b
.end method

.method public findSerializationContentConverter(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 420
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 421
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->contentConverter()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/fasterxml/jackson/databind/util/Converter$None;

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findSerializationContentType(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Class;
    .registers 5
    .param p1, "am"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p2, "baseType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 401
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 402
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->contentAs()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findSerializationConverter(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 414
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 415
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->converter()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/fasterxml/jackson/databind/util/Converter$None;

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findSerializationInclusion(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/annotation/JsonInclude$Include;)Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    .registers 8
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p2, "defValue"    # Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    .prologue
    .line 353
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonInclude;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/fasterxml/jackson/annotation/JsonInclude;

    .line 354
    .local v2, "inc":Lcom/fasterxml/jackson/annotation/JsonInclude;
    if-eqz v2, :cond_f

    .line 355
    invoke-interface {v2}, Lcom/fasterxml/jackson/annotation/JsonInclude;->value()Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    move-result-object p2

    .line 374
    .end local p2    # "defValue":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    :cond_e
    :goto_e
    return-object p2

    .line 357
    .restart local p2    # "defValue":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    :cond_f
    const-class v3, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 358
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-eqz v0, :cond_e

    .line 360
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->include()Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;

    move-result-object v1

    .line 361
    .local v1, "i2":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;
    sget-object v3, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector$1;->$SwitchMap$com$fasterxml$jackson$databind$annotation$JsonSerialize$Inclusion:[I

    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_36

    goto :goto_e

    .line 363
    :pswitch_29
    sget-object p2, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->ALWAYS:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    goto :goto_e

    .line 365
    :pswitch_2c
    sget-object p2, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_NULL:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    goto :goto_e

    .line 367
    :pswitch_2f
    sget-object p2, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_DEFAULT:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    goto :goto_e

    .line 369
    :pswitch_32
    sget-object p2, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_EMPTY:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    goto :goto_e

    .line 361
    nop

    :pswitch_data_36
    .packed-switch 0x1
        :pswitch_29
        :pswitch_2c
        :pswitch_2f
        :pswitch_32
    .end packed-switch
.end method

.method public findSerializationInclusionForContent(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/annotation/JsonInclude$Include;)Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p2, "defValue"    # Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    .prologue
    .line 380
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonInclude;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonInclude;

    .line 381
    .local v0, "inc":Lcom/fasterxml/jackson/annotation/JsonInclude;
    if-nez v0, :cond_b

    .end local p2    # "defValue":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    :goto_a
    return-object p2

    .restart local p2    # "defValue":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    :cond_b
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonInclude;->content()Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    move-result-object p2

    goto :goto_a
.end method

.method public findSerializationKeyType(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Class;
    .registers 5
    .param p1, "am"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p2, "baseType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 394
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 395
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->keyAs()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findSerializationPropertyOrder(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)[Ljava/lang/String;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 506
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;

    .line 507
    .local v0, "order":Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;->value()[Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public findSerializationSortAlphabetically(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Boolean;
    .registers 3
    .param p1, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 512
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findSortAlpha(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public findSerializationSortAlphabetically(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/Boolean;
    .registers 3
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 518
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findSortAlpha(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public findSerializationType(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;
    .registers 4
    .param p1, "am"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 387
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 388
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->as()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findSerializationTyping(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Typing;
    .registers 4
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 408
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 409
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->typing()Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Typing;

    move-result-object v1

    goto :goto_b
.end method

.method public findSerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 7
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 290
    const-class v4, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v4}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 291
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-eqz v0, :cond_13

    .line 292
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->using()Ljava/lang/Class;

    move-result-object v3

    .line 293
    .local v3, "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    const-class v4, Lcom/fasterxml/jackson/databind/JsonSerializer$None;

    if-eq v3, v4, :cond_13

    .line 308
    .end local v3    # "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    :goto_12
    return-object v3

    .line 302
    :cond_13
    const-class v4, Lcom/fasterxml/jackson/annotation/JsonRawValue;

    invoke-virtual {p0, p1, v4}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/annotation/JsonRawValue;

    .line 303
    .local v1, "annRaw":Lcom/fasterxml/jackson/annotation/JsonRawValue;
    if-eqz v1, :cond_2d

    invoke-interface {v1}, Lcom/fasterxml/jackson/annotation/JsonRawValue;->value()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 305
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/introspect/Annotated;->getRawType()Ljava/lang/Class;

    move-result-object v2

    .line 306
    .local v2, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v3, Lcom/fasterxml/jackson/databind/ser/std/RawSerializer;

    invoke-direct {v3, v2}, Lcom/fasterxml/jackson/databind/ser/std/RawSerializer;-><init>(Ljava/lang/Class;)V

    goto :goto_12

    .line 308
    .end local v2    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2d
    const/4 v3, 0x0

    goto :goto_12
.end method

.method public findSubtypes(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/util/List;
    .registers 12
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/fasterxml/jackson/databind/jsontype/NamedType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 264
    const-class v7, Lcom/fasterxml/jackson/annotation/JsonSubTypes;

    invoke-virtual {p0, p1, v7}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    check-cast v4, Lcom/fasterxml/jackson/annotation/JsonSubTypes;

    .line 265
    .local v4, "t":Lcom/fasterxml/jackson/annotation/JsonSubTypes;
    if-nez v4, :cond_c

    const/4 v3, 0x0

    .line 271
    :cond_b
    return-object v3

    .line 266
    :cond_c
    invoke-interface {v4}, Lcom/fasterxml/jackson/annotation/JsonSubTypes;->value()[Lcom/fasterxml/jackson/annotation/JsonSubTypes$Type;

    move-result-object v6

    .line 267
    .local v6, "types":[Lcom/fasterxml/jackson/annotation/JsonSubTypes$Type;
    new-instance v3, Ljava/util/ArrayList;

    array-length v7, v6

    invoke-direct {v3, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 268
    .local v3, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/fasterxml/jackson/databind/jsontype/NamedType;>;"
    move-object v0, v6

    .local v0, "arr$":[Lcom/fasterxml/jackson/annotation/JsonSubTypes$Type;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_19
    if-ge v1, v2, :cond_b

    aget-object v5, v0, v1

    .line 269
    .local v5, "type":Lcom/fasterxml/jackson/annotation/JsonSubTypes$Type;
    new-instance v7, Lcom/fasterxml/jackson/databind/jsontype/NamedType;

    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonSubTypes$Type;->value()Ljava/lang/Class;

    move-result-object v8

    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonSubTypes$Type;->name()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lcom/fasterxml/jackson/databind/jsontype/NamedType;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 268
    add-int/lit8 v1, v1, 0x1

    goto :goto_19
.end method

.method public findTypeName(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/String;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 277
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonTypeName;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonTypeName;

    .line 278
    .local v0, "tn":Lcom/fasterxml/jackson/annotation/JsonTypeName;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonTypeName;->value()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public findTypeResolver(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;
    .registers 5
    .param p2, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    .param p3, "baseType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/cfg/MapperConfig",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 233
    .local p1, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findTypeResolver(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    return-object v0
.end method

.method public findUnwrappingNameTransformer(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Lcom/fasterxml/jackson/databind/util/NameTransformer;
    .registers 6
    .param p1, "member"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 172
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;

    .line 175
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonUnwrapped;
    if-eqz v0, :cond_10

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;->enabled()Z

    move-result v3

    if-nez v3, :cond_12

    .line 176
    :cond_10
    const/4 v3, 0x0

    .line 180
    :goto_11
    return-object v3

    .line 178
    :cond_12
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;->prefix()Ljava/lang/String;

    move-result-object v1

    .line 179
    .local v1, "prefix":Ljava/lang/String;
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;->suffix()Ljava/lang/String;

    move-result-object v2

    .line 180
    .local v2, "suffix":Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/fasterxml/jackson/databind/util/NameTransformer;->simpleTransformer(Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/util/NameTransformer;

    move-result-object v3

    goto :goto_11
.end method

.method public findValueInstantiator(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/Object;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 740
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonValueInstantiator;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonValueInstantiator;

    .line 742
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonValueInstantiator;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonValueInstantiator;->value()Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public findViews(Lcom/fasterxml/jackson/databind/introspect/Annotated;)[Ljava/lang/Class;
    .registers 4
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            ")[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 427
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonView;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonView;

    .line 428
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonView;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonView;->value()[Ljava/lang/Class;

    move-result-object v1

    goto :goto_b
.end method

.method public hasAnyGetterAnnotation(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;)Z
    .registers 3
    .param p1, "am"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    .prologue
    .line 815
    const-class v0, Lcom/fasterxml/jackson/annotation/JsonAnyGetter;

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public hasAnySetterAnnotation(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;)Z
    .registers 3
    .param p1, "am"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    .prologue
    .line 806
    const-class v0, Lcom/fasterxml/jackson/annotation/JsonAnySetter;

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public hasAsValueAnnotation(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;)Z
    .registers 4
    .param p1, "am"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    .prologue
    .line 648
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonValue;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonValue;

    .line 650
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonValue;
    if-eqz v0, :cond_12

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonValue;->value()Z

    move-result v1

    if-eqz v1, :cond_12

    const/4 v1, 0x1

    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public hasCreatorAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Z
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 825
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonCreator;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonCreator;

    .line 826
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonCreator;
    if-eqz v0, :cond_14

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonCreator;->mode()Lcom/fasterxml/jackson/annotation/JsonCreator$Mode;

    move-result-object v1

    sget-object v2, Lcom/fasterxml/jackson/annotation/JsonCreator$Mode;->DISABLED:Lcom/fasterxml/jackson/annotation/JsonCreator$Mode;

    if-eq v1, v2, :cond_14

    const/4 v1, 0x1

    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public hasIgnoreMarker(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Z
    .registers 3
    .param p1, "m"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 185
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_isIgnorable(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Z

    move-result v0

    return v0
.end method

.method public hasRequiredMarker(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Ljava/lang/Boolean;
    .registers 4
    .param p1, "m"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 191
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 192
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonProperty;
    if-eqz v0, :cond_13

    .line 193
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonProperty;->required()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 195
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public isAnnotationBundle(Ljava/lang/annotation/Annotation;)Z
    .registers 4
    .param p1, "ann"    # Ljava/lang/annotation/Annotation;

    .prologue
    .line 51
    invoke-interface {p1}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/fasterxml/jackson/annotation/JacksonAnnotationsInside;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isIgnorableType(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/Boolean;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 97
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonIgnoreType;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIgnoreType;

    .line 98
    .local v0, "ignore":Lcom/fasterxml/jackson/annotation/JsonIgnoreType;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIgnoreType;->value()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_b
.end method

.method public isTypeId(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Ljava/lang/Boolean;
    .registers 3
    .param p1, "member"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 433
    const-class v0, Lcom/fasterxml/jackson/annotation/JsonTypeId;

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public version()Lcom/fasterxml/jackson/core/Version;
    .registers 2

    .prologue
    .line 36
    sget-object v0, Lcom/fasterxml/jackson/databind/cfg/PackageVersion;->VERSION:Lcom/fasterxml/jackson/core/Version;

    return-object v0
.end method
