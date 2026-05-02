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
    .line 33
    invoke-direct {p0}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;-><init>()V

    return-void
.end method

.method private final _findSortAlpha(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Boolean;
    .registers 4
    .param p1, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 620
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;

    .line 624
    .local v0, "order":Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;
    if-eqz v0, :cond_13

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;->alphabetic()Z

    move-result v1

    if-eqz v1, :cond_13

    .line 625
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 627
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
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
    .line 950
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_8

    invoke-static {p1}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->isBogusClass(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 951
    :cond_8
    const/4 p1, 0x0

    .line 953
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
    .line 957
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "implicit":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_classIfExplicit(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p1

    .line 958
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
    .line 1047
    invoke-static {}, Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;->noTypeInfoBuilder()Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected _constructStdTypeResolverBuilder()Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;
    .registers 2

    .prologue
    .line 1039
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
    .line 671
    .local p2, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;->required()Z

    move-result v5

    if-eqz v5, :cond_40

    sget-object v2, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_REQUIRED:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    .line 674
    .local v2, "metadata":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    :goto_8
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;->value()Ljava/lang/String;

    move-result-object v0

    .line 677
    .local v0, "attrName":Ljava/lang/String;
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;->propName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;->propNamespace()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_propertyName(Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v4

    .line 678
    .local v4, "propName":Lcom/fasterxml/jackson/databind/PropertyName;
    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/PropertyName;->hasSimpleName()Z

    move-result v5

    if-nez v5, :cond_22

    .line 679
    invoke-static {v0}, Lcom/fasterxml/jackson/databind/PropertyName;->construct(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v4

    .line 682
    :cond_22
    new-instance v1, Lcom/fasterxml/jackson/databind/introspect/VirtualAnnotatedMember;

    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;->getRawType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p4}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v6

    invoke-direct {v1, p3, v5, v0, v6}, Lcom/fasterxml/jackson/databind/introspect/VirtualAnnotatedMember;-><init>(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    .line 685
    .local v1, "member":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;->include()Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    move-result-object v5

    invoke-static {p2, v1, v4, v2, v5}, Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;->construct(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/PropertyName;Lcom/fasterxml/jackson/databind/PropertyMetadata;Lcom/fasterxml/jackson/annotation/JsonInclude$Include;)Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;

    move-result-object v3

    .line 688
    .local v3, "propDef":Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;->getAnnotations()Lcom/fasterxml/jackson/databind/util/Annotations;

    move-result-object v5

    invoke-static {v0, v3, v5, p4}, Lcom/fasterxml/jackson/databind/ser/impl/AttributePropertyWriter;->construct(Ljava/lang/String;Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;Lcom/fasterxml/jackson/databind/util/Annotations;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ser/impl/AttributePropertyWriter;

    move-result-object v5

    return-object v5

    .line 671
    .end local v0    # "attrName":Ljava/lang/String;
    .end local v1    # "member":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    .end local v2    # "metadata":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    .end local v3    # "propDef":Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;
    .end local v4    # "propName":Lcom/fasterxml/jackson/databind/PropertyName;
    :cond_40
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
    .line 695
    .local p2, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->required()Z

    move-result v8

    if-eqz v8, :cond_51

    sget-object v4, Lcom/fasterxml/jackson/databind/PropertyMetadata;->STD_REQUIRED:Lcom/fasterxml/jackson/databind/PropertyMetadata;

    .line 697
    .local v4, "metadata":Lcom/fasterxml/jackson/databind/PropertyMetadata;
    :goto_8
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->name()Ljava/lang/String;

    move-result-object v8

    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->namespace()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v8, v9}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_propertyName(Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v6

    .line 698
    .local v6, "propName":Lcom/fasterxml/jackson/databind/PropertyName;
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->type()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {p2, v8}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->constructType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v7

    .line 700
    .local v7, "type":Lcom/fasterxml/jackson/databind/JavaType;
    new-instance v3, Lcom/fasterxml/jackson/databind/introspect/VirtualAnnotatedMember;

    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;->getRawType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v6}, Lcom/fasterxml/jackson/databind/PropertyName;->getSimpleName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v10

    invoke-direct {v3, p3, v8, v9, v10}, Lcom/fasterxml/jackson/databind/introspect/VirtualAnnotatedMember;-><init>(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    .line 703
    .local v3, "member":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->include()Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    move-result-object v8

    invoke-static {p2, v3, v6, v4, v8}, Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;->construct(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;Lcom/fasterxml/jackson/databind/PropertyName;Lcom/fasterxml/jackson/databind/PropertyMetadata;Lcom/fasterxml/jackson/annotation/JsonInclude$Include;)Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;

    move-result-object v5

    .line 706
    .local v5, "propDef":Lcom/fasterxml/jackson/databind/util/SimpleBeanPropertyDefinition;
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;->value()Ljava/lang/Class;

    move-result-object v2

    .line 708
    .local v2, "implClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->getHandlerInstantiator()Lcom/fasterxml/jackson/databind/cfg/HandlerInstantiator;

    move-result-object v1

    .line 709
    .local v1, "hi":Lcom/fasterxml/jackson/databind/cfg/HandlerInstantiator;
    if-nez v1, :cond_54

    const/4 v0, 0x0

    .line 711
    .local v0, "bpw":Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;
    :goto_40
    if-nez v0, :cond_4c

    .line 712
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->canOverrideAccessModifiers()Z

    move-result v8

    invoke-static {v2, v8}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->createInstance(Ljava/lang/Class;Z)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "bpw":Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;
    check-cast v0, Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;

    .line 717
    .restart local v0    # "bpw":Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;
    :cond_4c
    invoke-virtual {v0, p2, p3, v5, v7}, Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;->withConfig(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Lcom/fasterxml/jackson/databind/introspect/BeanPropertyDefinition;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ser/VirtualBeanPropertyWriter;

    move-result-object v8

    return-object v8

    .line 695
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

    .line 709
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
    .line 161
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonFilter;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonFilter;

    .line 162
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonFilter;
    if-eqz v0, :cond_15

    .line 163
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonFilter;->value()Ljava/lang/String;

    move-result-object v1

    .line 165
    .local v1, "id":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_15

    .line 169
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

    .line 981
    const-class v8, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;

    invoke-virtual {p0, p2, v8}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;

    .line 982
    .local v5, "info":Lcom/fasterxml/jackson/annotation/JsonTypeInfo;
    const-class v8, Lcom/fasterxml/jackson/databind/annotation/JsonTypeResolver;

    invoke-virtual {p0, p2, v8}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lcom/fasterxml/jackson/databind/annotation/JsonTypeResolver;

    .line 984
    .local v6, "resAnn":Lcom/fasterxml/jackson/databind/annotation/JsonTypeResolver;
    if-eqz v6, :cond_6c

    .line 985
    if-nez v5, :cond_17

    move-object v0, v7

    .line 1031
    :goto_16
    return-object v0

    .line 992
    :cond_17
    invoke-interface {v6}, Lcom/fasterxml/jackson/databind/annotation/JsonTypeResolver;->value()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {p1, p2, v8}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->typeResolverBuilderInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 1004
    .local v0, "b":Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;, "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder<*>;"
    :goto_1f
    const-class v8, Lcom/fasterxml/jackson/databind/annotation/JsonTypeIdResolver;

    invoke-virtual {p0, p2, v8}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/databind/annotation/JsonTypeIdResolver;

    .line 1005
    .local v3, "idResInfo":Lcom/fasterxml/jackson/databind/annotation/JsonTypeIdResolver;
    if-nez v3, :cond_82

    move-object v2, v7

    .line 1007
    .local v2, "idRes":Lcom/fasterxml/jackson/databind/jsontype/TypeIdResolver;
    :goto_2a
    if-eqz v2, :cond_2f

    .line 1008
    invoke-interface {v2, p3}, Lcom/fasterxml/jackson/databind/jsontype/TypeIdResolver;->init(Lcom/fasterxml/jackson/databind/JavaType;)V

    .line 1010
    :cond_2f
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->use()Lcom/fasterxml/jackson/annotation/JsonTypeInfo$Id;

    move-result-object v7

    invoke-interface {v0, v7, v2}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->init(Lcom/fasterxml/jackson/annotation/JsonTypeInfo$Id;Lcom/fasterxml/jackson/databind/jsontype/TypeIdResolver;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 1015
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->include()Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;

    move-result-object v4

    .line 1016
    .local v4, "inclusion":Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;
    sget-object v7, Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;->EXTERNAL_PROPERTY:Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;

    if-ne v4, v7, :cond_45

    instance-of v7, p2, Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    if-eqz v7, :cond_45

    .line 1017
    sget-object v4, Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;->PROPERTY:Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;

    .line 1019
    :cond_45
    invoke-interface {v0, v4}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->inclusion(Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 1020
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->property()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->typeProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 1021
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->defaultImpl()Ljava/lang/Class;

    move-result-object v1

    .line 1027
    .local v1, "defaultImpl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v7, Lcom/fasterxml/jackson/annotation/JsonTypeInfo$None;

    if-eq v1, v7, :cond_63

    invoke-virtual {v1}, Ljava/lang/Class;->isAnnotation()Z

    move-result v7

    if-nez v7, :cond_63

    .line 1028
    invoke-interface {v0, v1}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->defaultImpl(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 1030
    :cond_63
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->visible()Z

    move-result v7

    invoke-interface {v0, v7}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->typeIdVisibility(Z)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    .line 1031
    goto :goto_16

    .line 994
    .end local v0    # "b":Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;, "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder<*>;"
    .end local v1    # "defaultImpl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "idRes":Lcom/fasterxml/jackson/databind/jsontype/TypeIdResolver;
    .end local v3    # "idResInfo":Lcom/fasterxml/jackson/databind/annotation/JsonTypeIdResolver;
    .end local v4    # "inclusion":Lcom/fasterxml/jackson/annotation/JsonTypeInfo$As;
    :cond_6c
    if-nez v5, :cond_70

    move-object v0, v7

    .line 995
    goto :goto_16

    .line 998
    :cond_70
    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonTypeInfo;->use()Lcom/fasterxml/jackson/annotation/JsonTypeInfo$Id;

    move-result-object v8

    sget-object v9, Lcom/fasterxml/jackson/annotation/JsonTypeInfo$Id;->NONE:Lcom/fasterxml/jackson/annotation/JsonTypeInfo$Id;

    if-ne v8, v9, :cond_7d

    .line 999
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_constructNoTypeResolverBuilder()Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;

    move-result-object v0

    goto :goto_16

    .line 1001
    :cond_7d
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_constructStdTypeResolverBuilder()Lcom/fasterxml/jackson/databind/jsontype/impl/StdTypeResolverBuilder;

    move-result-object v0

    .restart local v0    # "b":Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;, "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder<*>;"
    goto :goto_1f

    .line 1005
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
    .line 945
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonIgnore;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIgnore;

    .line 946
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
    .line 962
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 963
    sget-object v0, Lcom/fasterxml/jackson/databind/PropertyName;->USE_DEFAULT:Lcom/fasterxml/jackson/databind/PropertyName;

    .line 968
    :goto_8
    return-object v0

    .line 965
    :cond_9
    if-eqz p2, :cond_11

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 966
    :cond_11
    invoke-static {p1}, Lcom/fasterxml/jackson/databind/PropertyName;->construct(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v0

    goto :goto_8

    .line 968
    :cond_16
    invoke-static {p1, p2}, Lcom/fasterxml/jackson/databind/PropertyName;->construct(Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v0

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
    .line 633
    .local p1, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    .local p3, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;>;"
    const-class v8, Lcom/fasterxml/jackson/databind/annotation/JsonAppend;

    invoke-virtual {p0, p2, v8}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonAppend;

    .line 634
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonAppend;
    if-nez v0, :cond_b

    .line 666
    :cond_a
    return-void

    .line 637
    :cond_b
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend;->prepend()Z

    move-result v5

    .line 638
    .local v5, "prepend":Z
    const/4 v6, 0x0

    .line 641
    .local v6, "propType":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend;->attrs()[Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;

    move-result-object v1

    .line 642
    .local v1, "attrs":[Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;
    const/4 v3, 0x0

    .local v3, "i":I
    array-length v4, v1

    .local v4, "len":I
    :goto_16
    if-ge v3, v4, :cond_32

    .line 643
    if-nez v6, :cond_20

    .line 644
    const-class v8, Ljava/lang/Object;

    invoke-virtual {p1, v8}, Lcom/fasterxml/jackson/databind/cfg/MapperConfig;->constructType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v6

    .line 646
    :cond_20
    aget-object v8, v1, v3

    invoke-virtual {p0, v8, p1, p2, v6}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_constructVirtualProperty(Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Attr;Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    move-result-object v2

    .line 648
    .local v2, "bpw":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    if-eqz v5, :cond_2e

    .line 649
    invoke-interface {p3, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 642
    :goto_2b
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 651
    :cond_2e
    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2b

    .line 656
    .end local v2    # "bpw":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    :cond_32
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonAppend;->props()[Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;

    move-result-object v7

    .line 657
    .local v7, "props":[Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;
    const/4 v3, 0x0

    array-length v4, v7

    :goto_38
    if-ge v3, v4, :cond_a

    .line 658
    aget-object v8, v7, v3

    invoke-virtual {p0, v8, p1, p2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_constructVirtualProperty(Lcom/fasterxml/jackson/databind/annotation/JsonAppend$Prop;Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;

    move-result-object v2

    .line 660
    .restart local v2    # "bpw":Lcom/fasterxml/jackson/databind/ser/BeanPropertyWriter;
    if-eqz v5, :cond_48

    .line 661
    invoke-interface {p3, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 657
    :goto_45
    add-int/lit8 v3, v3, 0x1

    goto :goto_38

    .line 663
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
    .line 189
    .local p2, "checker":Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker;, "Lcom/fasterxml/jackson/databind/introspect/VisibilityChecker<*>;"
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonAutoDetect;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonAutoDetect;

    .line 190
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

.method public findContentDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 792
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 793
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-eqz v0, :cond_13

    .line 795
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->contentUsing()Ljava/lang/Class;

    move-result-object v1

    .line 796
    .local v1, "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonDeserializer;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/JsonDeserializer$None;

    if-eq v1, v2, :cond_13

    .line 800
    .end local v1    # "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonDeserializer;>;"
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public findContentSerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 462
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 463
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-eqz v0, :cond_13

    .line 465
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->contentUsing()Ljava/lang/Class;

    move-result-object v1

    .line 466
    .local v1, "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/JsonSerializer$None;

    if-eq v1, v2, :cond_13

    .line 470
    .end local v1    # "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer;>;"
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public findCreatorBinding(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/annotation/JsonCreator$Mode;
    .registers 4
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 933
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonCreator;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonCreator;

    .line 934
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
    .line 832
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 833
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
    .line 818
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 819
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
    .line 825
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 826
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
    .line 811
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 812
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
    .line 805
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 806
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

.method public findDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 765
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 766
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-eqz v0, :cond_13

    .line 768
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->using()Ljava/lang/Class;

    move-result-object v1

    .line 769
    .local v1, "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonDeserializer;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/JsonDeserializer$None;

    if-eq v1, v2, :cond_13

    .line 773
    .end local v1    # "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonDeserializer;>;"
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public findEnumValue(Ljava/lang/Enum;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "value":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 74
    .local v0, "f":Ljava/lang/reflect/Field;
    if-eqz v0, :cond_24

    .line 75
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 76
    .local v2, "prop":Lcom/fasterxml/jackson/annotation/JsonProperty;
    invoke-interface {v2}, Lcom/fasterxml/jackson/annotation/JsonProperty;->value()Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "n":Ljava/lang/String;
    if-eqz v1, :cond_24

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1f} :catch_23

    move-result v3

    if-nez v3, :cond_24

    .line 84
    .end local v0    # "f":Ljava/lang/reflect/Field;
    .end local v1    # "n":Ljava/lang/String;
    .end local v2    # "prop":Lcom/fasterxml/jackson/annotation/JsonProperty;
    :goto_22
    return-object v1

    .line 81
    :catch_23
    move-exception v3

    .line 84
    :cond_24
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    goto :goto_22
.end method

.method public findFilterId(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 3
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 156
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
    .line 151
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findFilterId(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public findFormat(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    .registers 4
    .param p1, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 261
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonFormat;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonFormat;

    .line 262
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
    .line 135
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;

    .line 136
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
    .line 203
    const/4 v0, 0x0

    return-object v0
.end method

.method public findInjectableValueId(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Ljava/lang/Object;
    .registers 6
    .param p1, "m"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 296
    const-class v3, Lcom/fasterxml/jackson/annotation/JacksonInject;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/annotation/JacksonInject;

    .line 297
    .local v1, "ann":Lcom/fasterxml/jackson/annotation/JacksonInject;
    if-nez v1, :cond_c

    .line 298
    const/4 v2, 0x0

    .line 315
    :cond_b
    :goto_b
    return-object v2

    .line 303
    :cond_c
    invoke-interface {v1}, Lcom/fasterxml/jackson/annotation/JacksonInject;->value()Ljava/lang/String;

    move-result-object v2

    .line 304
    .local v2, "id":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_b

    .line 306
    instance-of v3, p1, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    if-nez v3, :cond_23

    .line 307
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;->getRawType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_b

    :cond_23
    move-object v0, p1

    .line 309
    check-cast v0, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    .line 310
    .local v0, "am":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;->getParameterCount()I

    move-result v3

    if-nez v3, :cond_35

    .line 311
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;->getRawType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_b

    .line 313
    :cond_35
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;->getRawParameterType(I)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_b
.end method

.method public findKeyDeserializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 779
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 780
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;
    if-eqz v0, :cond_13

    .line 781
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;->keyUsing()Ljava/lang/Class;

    move-result-object v1

    .line 782
    .local v1, "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/KeyDeserializer;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/KeyDeserializer$None;

    if-eq v1, v2, :cond_13

    .line 786
    .end local v1    # "deserClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/KeyDeserializer;>;"
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public findKeySerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;
    .registers 5
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 448
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 449
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-eqz v0, :cond_13

    .line 451
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->keyUsing()Ljava/lang/Class;

    move-result-object v1

    .line 452
    .local v1, "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/JsonSerializer$None;

    if-eq v1, v2, :cond_13

    .line 456
    .end local v1    # "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer;>;"
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public findNameForDeserialization(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/PropertyName;
    .registers 6
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 877
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonSetter;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonSetter;

    .line 878
    .local v0, "js":Lcom/fasterxml/jackson/annotation/JsonSetter;
    if-eqz v0, :cond_13

    .line 879
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonSetter;->value()Ljava/lang/String;

    move-result-object v1

    .line 898
    .local v1, "name":Ljava/lang/String;
    :goto_e
    invoke-static {v1}, Lcom/fasterxml/jackson/databind/PropertyName;->construct(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v3

    .end local v1    # "name":Ljava/lang/String;
    :goto_12
    return-object v3

    .line 881
    :cond_13
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 882
    .local v2, "pann":Lcom/fasterxml/jackson/annotation/JsonProperty;
    if-eqz v2, :cond_22

    .line 883
    invoke-interface {v2}, Lcom/fasterxml/jackson/annotation/JsonProperty;->value()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_e

    .line 888
    .end local v1    # "name":Ljava/lang/String;
    :cond_22
    const-class v3, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_4a

    const-class v3, Lcom/fasterxml/jackson/annotation/JsonView;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_4a

    const-class v3, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_4a

    const-class v3, Lcom/fasterxml/jackson/annotation/JsonBackReference;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_4a

    const-class v3, Lcom/fasterxml/jackson/annotation/JsonManagedReference;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_4d

    .line 893
    :cond_4a
    const-string v1, ""

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_e

    .line 895
    .end local v1    # "name":Ljava/lang/String;
    :cond_4d
    const/4 v3, 0x0

    goto :goto_12
.end method

.method public findNameForSerialization(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/PropertyName;
    .registers 6
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 729
    const/4 v1, 0x0

    .line 731
    .local v1, "name":Ljava/lang/String;
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonGetter;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonGetter;

    .line 732
    .local v0, "jg":Lcom/fasterxml/jackson/annotation/JsonGetter;
    if-eqz v0, :cond_14

    .line 733
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonGetter;->value()Ljava/lang/String;

    move-result-object v1

    .line 746
    :goto_f
    invoke-static {v1}, Lcom/fasterxml/jackson/databind/PropertyName;->construct(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v3

    :goto_13
    return-object v3

    .line 735
    :cond_14
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 736
    .local v2, "pann":Lcom/fasterxml/jackson/annotation/JsonProperty;
    if-eqz v2, :cond_23

    .line 737
    invoke-interface {v2}, Lcom/fasterxml/jackson/annotation/JsonProperty;->value()Ljava/lang/String;

    move-result-object v1

    goto :goto_f

    .line 738
    :cond_23
    const-class v3, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_3b

    const-class v3, Lcom/fasterxml/jackson/annotation/JsonView;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_3b

    const-class v3, Lcom/fasterxml/jackson/annotation/JsonRawValue;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 741
    :cond_3b
    const-string v1, ""

    goto :goto_f

    .line 743
    :cond_3e
    const/4 v3, 0x0

    goto :goto_13
.end method

.method public findNamingStrategy(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/Object;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 175
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonNaming;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonNaming;

    .line 176
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
    .line 476
    const-class v2, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 477
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-eqz v0, :cond_13

    .line 479
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->nullsUsing()Ljava/lang/Class;

    move-result-object v1

    .line 480
    .local v1, "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer;>;"
    const-class v2, Lcom/fasterxml/jackson/databind/JsonSerializer$None;

    if-eq v1, v2, :cond_13

    .line 484
    .end local v1    # "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer;>;"
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
    .line 396
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;

    .line 397
    .local v0, "info":Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;
    if-eqz v0, :cond_12

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;->generator()Ljava/lang/Class;

    move-result-object v2

    const-class v3, Lcom/fasterxml/jackson/annotation/ObjectIdGenerators$None;

    if-ne v2, v3, :cond_14

    .line 398
    :cond_12
    const/4 v2, 0x0

    .line 402
    :goto_13
    return-object v2

    .line 401
    :cond_14
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIdentityInfo;->property()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/fasterxml/jackson/databind/PropertyName;->construct(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/PropertyName;

    move-result-object v1

    .line 402
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
    .line 407
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonIdentityReference;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIdentityReference;

    .line 408
    .local v0, "ref":Lcom/fasterxml/jackson/annotation/JsonIdentityReference;
    if-eqz v0, :cond_12

    .line 409
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIdentityReference;->alwaysAsId()Z

    move-result v1

    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;->withAlwaysAsId(Z)Lcom/fasterxml/jackson/databind/introspect/ObjectIdInfo;

    move-result-object p2

    .line 411
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
    .line 853
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonDeserialize;

    .line 854
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
    .line 860
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonPOJOBuilder;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonPOJOBuilder;

    .line 861
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
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 110
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;

    .line 111
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

.method public findPropertiesToIgnore(Lcom/fasterxml/jackson/databind/introspect/Annotated;Z)[Ljava/lang/String;
    .registers 6
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p2, "forSerialization"    # Z

    .prologue
    const/4 v1, 0x0

    .line 116
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;

    .line 117
    .local v0, "ignore":Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;
    if-nez v0, :cond_c

    .line 130
    :cond_b
    :goto_b
    return-object v1

    .line 121
    :cond_c
    if-eqz p2, :cond_19

    .line 122
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;->allowGetters()Z

    move-result v2

    if-nez v2, :cond_b

    .line 130
    :cond_14
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;->value()[Ljava/lang/String;

    move-result-object v1

    goto :goto_b

    .line 126
    :cond_19
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonIgnoreProperties;->allowSetters()Z

    move-result v2

    if-eqz v2, :cond_14

    goto :goto_b
.end method

.method public findPropertyAccess(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/annotation/JsonProperty$Access;
    .registers 4
    .param p1, "m"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 223
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 224
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonProperty;
    if-eqz v0, :cond_f

    .line 225
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonProperty;->access()Lcom/fasterxml/jackson/annotation/JsonProperty$Access;

    move-result-object v1

    .line 227
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
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
    .line 357
    .local p1, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isContainerType()Z

    move-result v0

    if-nez v0, :cond_25

    .line 358
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

    .line 360
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

    .line 250
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 251
    .local v0, "prop":Lcom/fasterxml/jackson/annotation/JsonProperty;
    if-nez v0, :cond_c

    .line 256
    :goto_b
    return-object v2

    .line 254
    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonProperty;->defaultValue()Ljava/lang/String;

    move-result-object v1

    .line 256
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
    .line 232
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonPropertyDescription;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonPropertyDescription;

    .line 233
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

.method public findPropertyInclusion(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/annotation/JsonInclude$Value;
    .registers 9
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 534
    const-class v5, Lcom/fasterxml/jackson/annotation/JsonInclude;

    invoke-virtual {p0, p1, v5}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/annotation/JsonInclude;

    .line 535
    .local v3, "inc":Lcom/fasterxml/jackson/annotation/JsonInclude;
    if-nez v3, :cond_32

    sget-object v4, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->USE_DEFAULTS:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    .line 536
    .local v4, "valueIncl":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    :goto_c
    sget-object v5, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->USE_DEFAULTS:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    if-ne v4, v5, :cond_29

    .line 537
    const-class v5, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v5}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 538
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-eqz v0, :cond_29

    .line 539
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->include()Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;

    move-result-object v2

    .line 540
    .local v2, "i2":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;
    sget-object v5, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector$1;->$SwitchMap$com$fasterxml$jackson$databind$annotation$JsonSerialize$Inclusion:[I

    invoke-virtual {v2}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_48

    .line 558
    .end local v0    # "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    .end local v2    # "i2":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;
    :cond_29
    :goto_29
    if-nez v3, :cond_43

    sget-object v1, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->USE_DEFAULTS:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    .line 559
    .local v1, "contentIncl":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    :goto_2d
    invoke-static {v4, v1}, Lcom/fasterxml/jackson/annotation/JsonInclude$Value;->construct(Lcom/fasterxml/jackson/annotation/JsonInclude$Include;Lcom/fasterxml/jackson/annotation/JsonInclude$Include;)Lcom/fasterxml/jackson/annotation/JsonInclude$Value;

    move-result-object v5

    return-object v5

    .line 535
    .end local v1    # "contentIncl":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    .end local v4    # "valueIncl":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    :cond_32
    invoke-interface {v3}, Lcom/fasterxml/jackson/annotation/JsonInclude;->value()Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    move-result-object v4

    goto :goto_c

    .line 542
    .restart local v0    # "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    .restart local v2    # "i2":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;
    .restart local v4    # "valueIncl":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    :pswitch_37
    sget-object v4, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->ALWAYS:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    .line 543
    goto :goto_29

    .line 545
    :pswitch_3a
    sget-object v4, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_NULL:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    .line 546
    goto :goto_29

    .line 548
    :pswitch_3d
    sget-object v4, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_DEFAULT:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    .line 549
    goto :goto_29

    .line 551
    :pswitch_40
    sget-object v4, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_EMPTY:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    .line 552
    goto :goto_29

    .line 558
    .end local v0    # "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    .end local v2    # "i2":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;
    :cond_43
    invoke-interface {v3}, Lcom/fasterxml/jackson/annotation/JsonInclude;->content()Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    move-result-object v1

    goto :goto_2d

    .line 540
    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_37
        :pswitch_3a
        :pswitch_3d
        :pswitch_40
    .end packed-switch
.end method

.method public findPropertyIndex(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Integer;
    .registers 5
    .param p1, "ann"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;

    .prologue
    .line 238
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 239
    .local v1, "prop":Lcom/fasterxml/jackson/annotation/JsonProperty;
    if-eqz v1, :cond_16

    .line 240
    invoke-interface {v1}, Lcom/fasterxml/jackson/annotation/JsonProperty;->index()I

    move-result v0

    .line 241
    .local v0, "ix":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_16

    .line 242
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 245
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
    .line 345
    .local p1, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->isContainerType()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    .line 347
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
    .line 268
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonManagedReference;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonManagedReference;

    .line 269
    .local v0, "ref1":Lcom/fasterxml/jackson/annotation/JsonManagedReference;
    if-eqz v0, :cond_13

    .line 270
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonManagedReference;->value()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;->managed(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;

    move-result-object v2

    .line 276
    :goto_12
    return-object v2

    .line 272
    :cond_13
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonBackReference;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/annotation/JsonBackReference;

    .line 273
    .local v1, "ref2":Lcom/fasterxml/jackson/annotation/JsonBackReference;
    if-eqz v1, :cond_26

    .line 274
    invoke-interface {v1}, Lcom/fasterxml/jackson/annotation/JsonBackReference;->value()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;->back(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/AnnotationIntrospector$ReferenceProperty;

    move-result-object v2

    goto :goto_12

    .line 276
    :cond_26
    const/4 v2, 0x0

    goto :goto_12
.end method

.method public findRootName(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Lcom/fasterxml/jackson/databind/PropertyName;
    .registers 5
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 96
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonRootName;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonRootName;

    .line 97
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonRootName;
    if-nez v0, :cond_c

    .line 98
    const/4 v2, 0x0

    .line 104
    :goto_b
    return-object v2

    .line 100
    :cond_c
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonRootName;->namespace()Ljava/lang/String;

    move-result-object v1

    .line 101
    .local v1, "ns":Ljava/lang/String;
    if-eqz v1, :cond_19

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_19

    .line 102
    const/4 v1, 0x0

    .line 104
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
    .line 598
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 599
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
    .line 579
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 580
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
    .line 592
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 593
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
    .registers 9
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p2, "defValue"    # Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    .prologue
    .line 491
    const-class v4, Lcom/fasterxml/jackson/annotation/JsonInclude;

    invoke-virtual {p0, p1, v4}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/fasterxml/jackson/annotation/JsonInclude;

    .line 492
    .local v2, "inc":Lcom/fasterxml/jackson/annotation/JsonInclude;
    if-eqz v2, :cond_13

    .line 493
    invoke-interface {v2}, Lcom/fasterxml/jackson/annotation/JsonInclude;->value()Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    move-result-object v3

    .line 494
    .local v3, "v":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    sget-object v4, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->USE_DEFAULTS:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    if-eq v3, v4, :cond_13

    .line 514
    .end local v3    # "v":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    :goto_12
    return-object v3

    .line 498
    :cond_13
    const-class v4, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v4}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 499
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-eqz v0, :cond_2c

    .line 500
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->include()Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;

    move-result-object v1

    .line 501
    .local v1, "i2":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;
    sget-object v4, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector$1;->$SwitchMap$com$fasterxml$jackson$databind$annotation$JsonSerialize$Inclusion:[I

    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_3a

    .end local v1    # "i2":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;
    :cond_2c
    move-object v3, p2

    .line 514
    goto :goto_12

    .line 503
    .restart local v1    # "i2":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Inclusion;
    :pswitch_2e
    sget-object v3, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->ALWAYS:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    goto :goto_12

    .line 505
    :pswitch_31
    sget-object v3, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_NULL:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    goto :goto_12

    .line 507
    :pswitch_34
    sget-object v3, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_DEFAULT:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    goto :goto_12

    .line 509
    :pswitch_37
    sget-object v3, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_EMPTY:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    goto :goto_12

    .line 501
    :pswitch_data_3a
    .packed-switch 0x1
        :pswitch_2e
        :pswitch_31
        :pswitch_34
        :pswitch_37
    .end packed-switch
.end method

.method public findSerializationInclusionForContent(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/annotation/JsonInclude$Include;)Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    .registers 6
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .param p2, "defValue"    # Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    .prologue
    .line 520
    const-class v2, Lcom/fasterxml/jackson/annotation/JsonInclude;

    invoke-virtual {p0, p1, v2}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonInclude;

    .line 521
    .local v0, "inc":Lcom/fasterxml/jackson/annotation/JsonInclude;
    if-eqz v0, :cond_13

    .line 522
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonInclude;->content()Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    move-result-object v1

    .line 523
    .local v1, "incl":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    sget-object v2, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->USE_DEFAULTS:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    if-eq v1, v2, :cond_13

    .line 527
    .end local v1    # "incl":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    :goto_12
    return-object v1

    :cond_13
    move-object v1, p2

    goto :goto_12
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
    .line 572
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 573
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
    .line 610
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonPropertyOrder;

    .line 611
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
    .line 616
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
    .line 565
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 566
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
    .line 586
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 587
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
    .line 423
    const-class v4, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    invoke-virtual {p0, p1, v4}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;

    .line 424
    .local v0, "ann":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;
    if-eqz v0, :cond_13

    .line 426
    invoke-interface {v0}, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize;->using()Ljava/lang/Class;

    move-result-object v3

    .line 427
    .local v3, "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer;>;"
    const-class v4, Lcom/fasterxml/jackson/databind/JsonSerializer$None;

    if-eq v3, v4, :cond_13

    .line 442
    .end local v3    # "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer;>;"
    :goto_12
    return-object v3

    .line 436
    :cond_13
    const-class v4, Lcom/fasterxml/jackson/annotation/JsonRawValue;

    invoke-virtual {p0, p1, v4}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/annotation/JsonRawValue;

    .line 437
    .local v1, "annRaw":Lcom/fasterxml/jackson/annotation/JsonRawValue;
    if-eqz v1, :cond_2d

    invoke-interface {v1}, Lcom/fasterxml/jackson/annotation/JsonRawValue;->value()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 439
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/introspect/Annotated;->getRawType()Ljava/lang/Class;

    move-result-object v2

    .line 440
    .local v2, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v3, Lcom/fasterxml/jackson/databind/ser/std/RawSerializer;

    invoke-direct {v3, v2}, Lcom/fasterxml/jackson/databind/ser/std/RawSerializer;-><init>(Ljava/lang/Class;)V

    goto :goto_12

    .line 442
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
    .line 366
    const-class v7, Lcom/fasterxml/jackson/annotation/JsonSubTypes;

    invoke-virtual {p0, p1, v7}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    check-cast v4, Lcom/fasterxml/jackson/annotation/JsonSubTypes;

    .line 367
    .local v4, "t":Lcom/fasterxml/jackson/annotation/JsonSubTypes;
    if-nez v4, :cond_c

    const/4 v3, 0x0

    .line 373
    :cond_b
    return-object v3

    .line 368
    :cond_c
    invoke-interface {v4}, Lcom/fasterxml/jackson/annotation/JsonSubTypes;->value()[Lcom/fasterxml/jackson/annotation/JsonSubTypes$Type;

    move-result-object v6

    .line 369
    .local v6, "types":[Lcom/fasterxml/jackson/annotation/JsonSubTypes$Type;
    new-instance v3, Ljava/util/ArrayList;

    array-length v7, v6

    invoke-direct {v3, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 370
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

    .line 371
    .local v5, "type":Lcom/fasterxml/jackson/annotation/JsonSubTypes$Type;
    new-instance v7, Lcom/fasterxml/jackson/databind/jsontype/NamedType;

    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonSubTypes$Type;->value()Ljava/lang/Class;

    move-result-object v8

    invoke-interface {v5}, Lcom/fasterxml/jackson/annotation/JsonSubTypes$Type;->name()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lcom/fasterxml/jackson/databind/jsontype/NamedType;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 370
    add-int/lit8 v1, v1, 0x1

    goto :goto_19
.end method

.method public findTypeName(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/String;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 379
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonTypeName;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonTypeName;

    .line 380
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
    .line 335
    .local p1, "config":Lcom/fasterxml/jackson/databind/cfg/MapperConfig;, "Lcom/fasterxml/jackson/databind/cfg/MapperConfig<*>;"
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findTypeResolver(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v0

    return-object v0
.end method

.method public findUnwrappingNameTransformer(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Lcom/fasterxml/jackson/databind/util/NameTransformer;
    .registers 6
    .param p1, "member"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 282
    const-class v3, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;

    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;

    .line 285
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonUnwrapped;
    if-eqz v0, :cond_10

    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;->enabled()Z

    move-result v3

    if-nez v3, :cond_12

    .line 286
    :cond_10
    const/4 v3, 0x0

    .line 290
    :goto_11
    return-object v3

    .line 288
    :cond_12
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;->prefix()Ljava/lang/String;

    move-result-object v1

    .line 289
    .local v1, "prefix":Ljava/lang/String;
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonUnwrapped;->suffix()Ljava/lang/String;

    move-result-object v2

    .line 290
    .local v2, "suffix":Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/fasterxml/jackson/databind/util/NameTransformer;->simpleTransformer(Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/util/NameTransformer;

    move-result-object v3

    goto :goto_11
.end method

.method public findValueInstantiator(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;)Ljava/lang/Object;
    .registers 4
    .param p1, "ac"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    .prologue
    .line 845
    const-class v1, Lcom/fasterxml/jackson/databind/annotation/JsonValueInstantiator;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/annotation/JsonValueInstantiator;

    .line 847
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
    .line 321
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonView;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonView;

    .line 322
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
    .line 917
    const-class v0, Lcom/fasterxml/jackson/annotation/JsonAnyGetter;

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public hasAnySetterAnnotation(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;)Z
    .registers 3
    .param p1, "am"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    .prologue
    .line 908
    const-class v0, Lcom/fasterxml/jackson/annotation/JsonAnySetter;

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_hasAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public hasAsValueAnnotation(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;)Z
    .registers 4
    .param p1, "am"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    .prologue
    .line 751
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonValue;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonValue;

    .line 753
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
    .line 927
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonCreator;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonCreator;

    .line 928
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
    .line 208
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_isIgnorable(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Z

    move-result v0

    return v0
.end method

.method public hasRequiredMarker(Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;)Ljava/lang/Boolean;
    .registers 4
    .param p1, "m"    # Lcom/fasterxml/jackson/databind/introspect/AnnotatedMember;

    .prologue
    .line 214
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonProperty;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonProperty;

    .line 215
    .local v0, "ann":Lcom/fasterxml/jackson/annotation/JsonProperty;
    if-eqz v0, :cond_13

    .line 216
    invoke-interface {v0}, Lcom/fasterxml/jackson/annotation/JsonProperty;->required()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 218
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
    .line 52
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
    .line 141
    const-class v1, Lcom/fasterxml/jackson/annotation/JsonIgnoreType;

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/databind/introspect/JacksonAnnotationIntrospector;->_findAnnotation(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/annotation/JsonIgnoreType;

    .line 142
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
    .line 385
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
    .line 37
    sget-object v0, Lcom/fasterxml/jackson/databind/cfg/PackageVersion;->VERSION:Lcom/fasterxml/jackson/core/Version;

    return-object v0
.end method
