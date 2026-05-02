.class public Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;
.super Lcom/fasterxml/jackson/databind/ser/std/StdSerializer;
.source "JsonValueSerializer.java"

# interfaces
.implements Lcom/fasterxml/jackson/databind/ser/ContextualSerializer;
.implements Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitable;
.implements Lcom/fasterxml/jackson/databind/jsonschema/SchemaAware;


# annotations
.annotation runtime Lcom/fasterxml/jackson/databind/annotation/JacksonStdImpl;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/fasterxml/jackson/databind/ser/std/StdSerializer",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lcom/fasterxml/jackson/databind/ser/ContextualSerializer;",
        "Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitable;",
        "Lcom/fasterxml/jackson/databind/jsonschema/SchemaAware;"
    }
.end annotation


# instance fields
.field protected final _accessorMethod:Ljava/lang/reflect/Method;

.field protected final _forceTypeInformation:Z

.field protected final _property:Lcom/fasterxml/jackson/databind/BeanProperty;

.field protected final _valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JsonSerializer;Z)V
    .registers 6
    .param p1, "src"    # Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .param p4, "forceTypeInfo"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 77
    .local p3, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->handledType()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_notNullClass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/databind/ser/std/StdSerializer;-><init>(Ljava/lang/Class;)V

    .line 78
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    .line 79
    iput-object p3, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 80
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_property:Lcom/fasterxml/jackson/databind/BeanProperty;

    .line 81
    iput-boolean p4, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_forceTypeInformation:Z

    .line 82
    return-void
.end method

.method public constructor <init>(Ljava/lang/reflect/Method;Lcom/fasterxml/jackson/databind/JsonSerializer;)V
    .registers 5
    .param p1, "valueMethod"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p2, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/fasterxml/jackson/databind/ser/std/StdSerializer;-><init>(Ljava/lang/Class;Z)V

    .line 67
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    .line 68
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 69
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_property:Lcom/fasterxml/jackson/databind/BeanProperty;

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_forceTypeInformation:Z

    .line 71
    return-void
.end method

.method private static final _notNullClass(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p0, :cond_4

    const-class p0, Ljava/lang/Object;

    .end local p0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4
    return-object p0
.end method


# virtual methods
.method public acceptJsonFormatVisitor(Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitorWrapper;Lcom/fasterxml/jackson/databind/JavaType;)V
    .registers 7
    .param p1, "visitor"    # Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitorWrapper;
    .param p2, "typeHint"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 254
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 255
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v0, :cond_31

    .line 256
    if-nez p2, :cond_20

    .line 257
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_property:Lcom/fasterxml/jackson/databind/BeanProperty;

    if-eqz v1, :cond_10

    .line 258
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_property:Lcom/fasterxml/jackson/databind/BeanProperty;

    invoke-interface {v1}, Lcom/fasterxml/jackson/databind/BeanProperty;->getType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object p2

    .line 260
    :cond_10
    if-nez p2, :cond_20

    .line 261
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitorWrapper;->getProvider()Lcom/fasterxml/jackson/databind/SerializerProvider;

    move-result-object v1

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object p2

    .line 264
    :cond_20
    invoke-interface {p1}, Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitorWrapper;->getProvider()Lcom/fasterxml/jackson/databind/SerializerProvider;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_property:Lcom/fasterxml/jackson/databind/BeanProperty;

    invoke-virtual {v1, p2, v2, v3}, Lcom/fasterxml/jackson/databind/SerializerProvider;->findTypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 265
    if-nez v0, :cond_31

    .line 266
    invoke-interface {p1, p2}, Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitorWrapper;->expectAnyFormat(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonAnyFormatVisitor;

    .line 271
    :goto_30
    return-void

    .line 270
    :cond_31
    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/fasterxml/jackson/databind/JsonSerializer;->acceptJsonFormatVisitor(Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitorWrapper;Lcom/fasterxml/jackson/databind/JavaType;)V

    goto :goto_30
.end method

.method public createContextual(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 7
    .param p1, "provider"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
            ")",
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
    .line 114
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 115
    .local v1, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    if-nez v1, :cond_37

    .line 120
    sget-object v3, Lcom/fasterxml/jackson/databind/MapperFeature;->USE_STATIC_TYPING:Lcom/fasterxml/jackson/databind/MapperFeature;

    invoke-virtual {p1, v3}, Lcom/fasterxml/jackson/databind/SerializerProvider;->isEnabled(Lcom/fasterxml/jackson/databind/MapperFeature;)Z

    move-result v3

    if-nez v3, :cond_1c

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v3

    if-eqz v3, :cond_36

    .line 122
    :cond_1c
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getGenericReturnType()Ljava/lang/reflect/Type;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/fasterxml/jackson/databind/SerializerProvider;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v2

    .line 129
    .local v2, "t":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual {p1, v2, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->findPrimaryPropertySerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v1

    .line 134
    invoke-virtual {v2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3, v1}, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->isNaturalTypeWithStdHandling(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JsonSerializer;)Z

    move-result v0

    .line 135
    .local v0, "forceTypeInformation":Z
    invoke-virtual {p0, p2, v1, v0}, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->withResolved(Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JsonSerializer;Z)Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;

    move-result-object p0

    .line 142
    .end local v0    # "forceTypeInformation":Z
    .end local v2    # "t":Lcom/fasterxml/jackson/databind/JavaType;
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;
    :cond_36
    :goto_36
    return-object p0

    .line 139
    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;
    :cond_37
    invoke-virtual {p1, v1, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->handlePrimaryContextualization(Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v1

    .line 140
    iget-boolean v3, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_forceTypeInformation:Z

    invoke-virtual {p0, p2, v1, v3}, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->withResolved(Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JsonSerializer;Z)Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;

    move-result-object p0

    goto :goto_36
.end method

.method public getSchema(Lcom/fasterxml/jackson/databind/SerializerProvider;Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JsonNode;
    .registers 5
    .param p1, "provider"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "typeHint"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 244
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    instance-of v0, v0, Lcom/fasterxml/jackson/databind/jsonschema/SchemaAware;

    if-eqz v0, :cond_10

    .line 245
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    check-cast v0, Lcom/fasterxml/jackson/databind/jsonschema/SchemaAware;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/fasterxml/jackson/databind/jsonschema/SchemaAware;->getSchema(Lcom/fasterxml/jackson/databind/SerializerProvider;Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v0

    .line 247
    :goto_f
    return-object v0

    :cond_10
    invoke-static {}, Lcom/fasterxml/jackson/databind/jsonschema/JsonSchema;->getDefaultSchemaNode()Lcom/fasterxml/jackson/databind/JsonNode;

    move-result-object v0

    goto :goto_f
.end method

.method protected isNaturalTypeWithStdHandling(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JsonSerializer;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    const/4 v0, 0x0

    .line 276
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 277
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq p1, v1, :cond_24

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p1, v1, :cond_24

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq p1, v1, :cond_24

    .line 286
    :cond_13
    :goto_13
    return v0

    .line 281
    :cond_14
    const-class v1, Ljava/lang/String;

    if-eq p1, v1, :cond_24

    const-class v1, Ljava/lang/Integer;

    if-eq p1, v1, :cond_24

    const-class v1, Ljava/lang/Boolean;

    if-eq p1, v1, :cond_24

    const-class v1, Ljava/lang/Double;

    if-ne p1, v1, :cond_13

    .line 286
    :cond_24
    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->isDefaultSerializer(Lcom/fasterxml/jackson/databind/JsonSerializer;)Z

    move-result v0

    goto :goto_13
.end method

.method public serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    .registers 12
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p3, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    :try_start_0
    iget-object v6, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v6, p1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 156
    .local v5, "value":Ljava/lang/Object;
    if-nez v5, :cond_f

    .line 157
    invoke-virtual {p3, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->defaultSerializeNull(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 186
    :goto_e
    return-void

    .line 160
    :cond_f
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 161
    .local v3, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v3, :cond_1e

    .line 162
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 168
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v6, 0x1

    iget-object v7, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_property:Lcom/fasterxml/jackson/databind/BeanProperty;

    invoke-virtual {p3, v0, v6, v7}, Lcom/fasterxml/jackson/databind/SerializerProvider;->findTypedValueSerializer(Ljava/lang/Class;ZLcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v3

    .line 170
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1e
    invoke-virtual {v3, v5, p2, p3}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_21} :catch_22
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_21} :catch_24

    goto :goto_e

    .line 171
    .end local v3    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .end local v5    # "value":Ljava/lang/Object;
    :catch_22
    move-exception v2

    .line 172
    .local v2, "ioe":Ljava/io/IOException;
    throw v2

    .line 173
    .end local v2    # "ioe":Ljava/io/IOException;
    :catch_24
    move-exception v1

    .line 174
    .local v1, "e":Ljava/lang/Exception;
    move-object v4, v1

    .line 176
    .local v4, "t":Ljava/lang/Throwable;
    :goto_26
    instance-of v6, v4, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v6, :cond_35

    invoke-virtual {v4}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v6

    if-eqz v6, :cond_35

    .line 177
    invoke-virtual {v4}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    goto :goto_26

    .line 180
    :cond_35
    instance-of v6, v4, Ljava/lang/Error;

    if-eqz v6, :cond_3c

    .line 181
    check-cast v4, Ljava/lang/Error;

    .end local v4    # "t":Ljava/lang/Throwable;
    throw v4

    .line 184
    .restart local v4    # "t":Ljava/lang/Throwable;
    :cond_3c
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "()"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, p1, v6}, Lcom/fasterxml/jackson/databind/JsonMappingException;->wrapWithPath(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v6

    throw v6
.end method

.method public serializeWithType(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)V
    .registers 12
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p3, "provider"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p4, "typeSer0"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    const/4 v4, 0x0

    .line 195
    .local v4, "value":Ljava/lang/Object;
    :try_start_1
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v5, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 197
    if-nez v4, :cond_10

    .line 198
    invoke-virtual {p3, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->defaultSerializeNull(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 237
    :goto_f
    return-void

    .line 201
    :cond_10
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 202
    .local v2, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v2, :cond_24

    .line 204
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    iget-object v6, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_property:Lcom/fasterxml/jackson/databind/BeanProperty;

    invoke-virtual {p3, v5, v6}, Lcom/fasterxml/jackson/databind/SerializerProvider;->findValueSerializer(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v2

    .line 221
    :cond_1e
    invoke-virtual {v2, v4, p2, p3, p4}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serializeWithType(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_21} :catch_22
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_21} :catch_32

    goto :goto_f

    .line 222
    .end local v2    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .end local v4    # "value":Ljava/lang/Object;
    :catch_22
    move-exception v1

    .line 223
    .local v1, "ioe":Ljava/io/IOException;
    throw v1

    .line 209
    .end local v1    # "ioe":Ljava/io/IOException;
    .restart local v2    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_24
    :try_start_24
    iget-boolean v5, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_forceTypeInformation:Z

    if-eqz v5, :cond_1e

    .line 210
    invoke-virtual {p4, p1, p2}, Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;->writeTypePrefixForScalar(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 211
    invoke-virtual {v2, v4, p2, p3}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    .line 212
    invoke-virtual {p4, p1, p2}, Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;->writeTypeSuffixForScalar(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_31} :catch_22
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_31} :catch_32

    goto :goto_f

    .line 224
    .end local v2    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .end local v4    # "value":Ljava/lang/Object;
    :catch_32
    move-exception v0

    .line 225
    .local v0, "e":Ljava/lang/Exception;
    move-object v3, v0

    .line 227
    .local v3, "t":Ljava/lang/Throwable;
    :goto_34
    instance-of v5, v3, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v5, :cond_43

    invoke-virtual {v3}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_43

    .line 228
    invoke-virtual {v3}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    goto :goto_34

    .line 231
    :cond_43
    instance-of v5, v3, Ljava/lang/Error;

    if-eqz v5, :cond_4a

    .line 232
    check-cast v3, Ljava/lang/Error;

    .end local v3    # "t":Ljava/lang/Throwable;
    throw v3

    .line 235
    .restart local v3    # "t":Ljava/lang/Throwable;
    :cond_4a
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "()"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, p1, v5}, Lcom/fasterxml/jackson/databind/JsonMappingException;->wrapWithPath(Ljava/lang/Throwable;Ljava/lang/Object;Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v5

    throw v5
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 297
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(@JsonValue serializer for method "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_accessorMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withResolved(Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JsonSerializer;Z)Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;
    .registers 5
    .param p1, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .param p3, "forceTypeInfo"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;Z)",
            "Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;"
        }
    .end annotation

    .prologue
    .line 92
    .local p2, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_property:Lcom/fasterxml/jackson/databind/BeanProperty;

    if-ne v0, p1, :cond_d

    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    if-ne v0, p2, :cond_d

    iget-boolean v0, p0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;->_forceTypeInformation:Z

    if-ne p3, v0, :cond_d

    .line 96
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;
    :goto_c
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;
    :cond_d
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;-><init>(Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JsonSerializer;Z)V

    move-object p0, v0

    goto :goto_c
.end method
