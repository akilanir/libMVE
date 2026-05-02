.class public Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;
.super Lcom/fasterxml/jackson/databind/deser/std/ContainerDeserializerBase;
.source "CollectionDeserializer.java"

# interfaces
.implements Lcom/fasterxml/jackson/databind/deser/ContextualDeserializer;


# annotations
.annotation runtime Lcom/fasterxml/jackson/databind/annotation/JacksonStdImpl;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer$CollectionReferring;,
        Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer$CollectionReferringAccumulator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/fasterxml/jackson/databind/deser/std/ContainerDeserializerBase",
        "<",
        "Ljava/util/Collection",
        "<",
        "Ljava/lang/Object;",
        ">;>;",
        "Lcom/fasterxml/jackson/databind/deser/ContextualDeserializer;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x1L


# instance fields
.field protected final _collectionType:Lcom/fasterxml/jackson/databind/JavaType;

.field protected final _delegateDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected final _valueDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected final _valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

.field protected final _valueTypeDeserializer:Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;


# direct methods
.method public constructor <init>(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonDeserializer;Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;)V
    .registers 11
    .param p1, "collectionType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "valueTypeDeser"    # Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;
    .param p4, "valueInstantiator"    # Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;",
            "Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;",
            ")V"
        }
    .end annotation

    .prologue
    .line 73
    .local p2, "valueDeser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;-><init>(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonDeserializer;Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;Lcom/fasterxml/jackson/databind/JsonDeserializer;)V

    .line 74
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonDeserializer;Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;Lcom/fasterxml/jackson/databind/JsonDeserializer;)V
    .registers 6
    .param p1, "collectionType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "valueTypeDeser"    # Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;
    .param p4, "valueInstantiator"    # Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;",
            "Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p2, "valueDeser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    .local p5, "delegateDeser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/deser/std/ContainerDeserializerBase;-><init>(Lcom/fasterxml/jackson/databind/JavaType;)V

    .line 85
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_collectionType:Lcom/fasterxml/jackson/databind/JavaType;

    .line 86
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    .line 87
    iput-object p3, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueTypeDeserializer:Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;

    .line 88
    iput-object p4, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    .line 89
    iput-object p5, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_delegateDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    .line 90
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;)V
    .registers 3
    .param p1, "src"    # Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;

    .prologue
    .line 98
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_collectionType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/databind/deser/std/ContainerDeserializerBase;-><init>(Lcom/fasterxml/jackson/databind/JavaType;)V

    .line 99
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_collectionType:Lcom/fasterxml/jackson/databind/JavaType;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_collectionType:Lcom/fasterxml/jackson/databind/JavaType;

    .line 100
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    .line 101
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueTypeDeserializer:Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueTypeDeserializer:Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;

    .line 102
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    .line 103
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_delegateDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_delegateDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    .line 104
    return-void
.end method


# virtual methods
.method public bridge synthetic createContextual(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 4
    .param p1, "x0"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "x1"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->createContextual(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;

    move-result-object v0

    return-object v0
.end method

.method public createContextual(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;
    .registers 11
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 143
    const/4 v0, 0x0

    .line 144
    .local v0, "delegateDeser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    if-eqz v5, :cond_52

    iget-object v5, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;->canCreateUsingDelegate()Z

    move-result v5

    if-eqz v5, :cond_52

    .line 145
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->getConfig()Lcom/fasterxml/jackson/databind/DeserializationConfig;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;->getDelegateType(Lcom/fasterxml/jackson/databind/DeserializationConfig;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    .line 146
    .local v1, "delegateType":Lcom/fasterxml/jackson/databind/JavaType;
    if-nez v1, :cond_4e

    .line 147
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid delegate-creator definition for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_collectionType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ": value instantiator ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") returned true for \'canCreateUsingDelegate()\', but null for \'getDelegateType()\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 151
    :cond_4e
    invoke-virtual {p0, p1, v1, p2}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->findDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v0

    .line 154
    .end local v1    # "delegateType":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_52
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    .line 156
    .local v2, "valueDeser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;"
    invoke-virtual {p0, p1, p2, v2}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->findConvertingContentDeserializer(Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JsonDeserializer;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v2

    .line 157
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_collectionType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/JavaType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    .line 158
    .local v4, "vt":Lcom/fasterxml/jackson/databind/JavaType;
    if-nez v2, :cond_71

    .line 159
    invoke-virtual {p1, v4, p2}, Lcom/fasterxml/jackson/databind/DeserializationContext;->findContextualValueDeserializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v2

    .line 164
    :goto_64
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueTypeDeserializer:Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;

    .line 165
    .local v3, "valueTypeDeser":Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;
    if-eqz v3, :cond_6c

    .line 166
    invoke-virtual {v3, p2}, Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;->forProperty(Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;

    move-result-object v3

    .line 168
    :cond_6c
    invoke-virtual {p0, v0, v2, v3}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->withResolved(Lcom/fasterxml/jackson/databind/JsonDeserializer;Lcom/fasterxml/jackson/databind/JsonDeserializer;Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;)Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;

    move-result-object v5

    return-object v5

    .line 161
    .end local v3    # "valueTypeDeser":Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;
    :cond_71
    invoke-virtual {p1, v2, p2, v4}, Lcom/fasterxml/jackson/databind/DeserializationContext;->handleSecondaryContextualization(Lcom/fasterxml/jackson/databind/JsonDeserializer;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonDeserializer;

    move-result-object v2

    goto :goto_64
.end method

.method public bridge synthetic deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "x1"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "x0"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "x1"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p3, "x2"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 25
    check-cast p3, Ljava/util/Collection;

    .end local p3    # "x2":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/util/Collection;
    .registers 6
    .param p1, "p"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_delegateDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    if-eqz v1, :cond_13

    .line 199
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_delegateDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    invoke-virtual {v2, p1, p2}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;->createUsingDelegate(Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    .line 212
    :goto_12
    return-object v1

    .line 206
    :cond_13
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_2e

    .line 207
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v0

    .line 208
    .local v0, "str":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2e

    .line 209
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    invoke-virtual {v1, p2, v0}, Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;->createFromString(Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    goto :goto_12

    .line 212
    .end local v0    # "str":Ljava/lang/String;
    :cond_2e
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    invoke-virtual {v1, p2}, Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;->createUsingDefault(Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-virtual {p0, p1, p2, v1}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v1

    goto :goto_12
.end method

.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/util/Collection;)Ljava/util/Collection;
    .registers 13
    .param p1, "p"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 221
    .local p3, "result":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->isExpectedStartArrayToken()Z

    move-result v8

    if-nez v8, :cond_b

    .line 222
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->handleNonArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object p3

    .line 260
    .end local p3    # "result":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    :cond_a
    return-object p3

    .line 225
    .restart local p3    # "result":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    :cond_b
    invoke-virtual {p1, p3}, Lcom/fasterxml/jackson/core/JsonParser;->setCurrentValue(Ljava/lang/Object;)V

    .line 227
    iget-object v7, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    .line 228
    .local v7, "valueDes":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueTypeDeserializer:Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;

    .line 229
    .local v5, "typeDeser":Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;
    invoke-virtual {v7}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->getObjectIdReader()Lcom/fasterxml/jackson/databind/deser/impl/ObjectIdReader;

    move-result-object v8

    if-nez v8, :cond_39

    const/4 v3, 0x0

    .line 234
    .local v3, "referringAccumulator":Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer$CollectionReferringAccumulator;
    :goto_19
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    .local v4, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v8, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v4, v8, :cond_a

    .line 237
    :try_start_21
    sget-object v8, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v8, :cond_49

    .line 238
    invoke-virtual {v7}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->getNullValue()Ljava/lang/Object;

    move-result-object v6

    .line 244
    .local v6, "value":Ljava/lang/Object;
    :goto_29
    if-eqz v3, :cond_55

    .line 245
    invoke-virtual {v3, v6}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer$CollectionReferringAccumulator;->add(Ljava/lang/Object;)V
    :try_end_2e
    .catch Lcom/fasterxml/jackson/databind/deser/UnresolvedForwardReference; {:try_start_21 .. :try_end_2e} :catch_2f
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_2e} :catch_59

    goto :goto_19

    .line 249
    .end local v6    # "value":Ljava/lang/Object;
    :catch_2f
    move-exception v2

    .line 250
    .local v2, "reference":Lcom/fasterxml/jackson/databind/deser/UnresolvedForwardReference;
    if-nez v3, :cond_63

    .line 251
    const-string v8, "Unresolved forward reference but no identity info"

    invoke-static {p1, v8, v2}, Lcom/fasterxml/jackson/databind/JsonMappingException;->from(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/lang/Throwable;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v8

    throw v8

    .line 229
    .end local v2    # "reference":Lcom/fasterxml/jackson/databind/deser/UnresolvedForwardReference;
    .end local v3    # "referringAccumulator":Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer$CollectionReferringAccumulator;
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_39
    new-instance v3, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer$CollectionReferringAccumulator;

    iget-object v8, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_collectionType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/databind/JavaType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v8

    invoke-virtual {v8}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v8

    invoke-direct {v3, v8, p3}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer$CollectionReferringAccumulator;-><init>(Ljava/lang/Class;Ljava/util/Collection;)V

    goto :goto_19

    .line 239
    .restart local v3    # "referringAccumulator":Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer$CollectionReferringAccumulator;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_49
    if-nez v5, :cond_50

    .line 240
    :try_start_4b
    invoke-virtual {v7, p1, p2}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "value":Ljava/lang/Object;
    goto :goto_29

    .line 242
    .end local v6    # "value":Ljava/lang/Object;
    :cond_50
    invoke-virtual {v7, p1, p2, v5}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->deserializeWithType(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;)Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "value":Ljava/lang/Object;
    goto :goto_29

    .line 247
    :cond_55
    invoke-interface {p3, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_58
    .catch Lcom/fasterxml/jackson/databind/deser/UnresolvedForwardReference; {:try_start_4b .. :try_end_58} :catch_2f
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_58} :catch_59

    goto :goto_19

    .line 256
    .end local v6    # "value":Ljava/lang/Object;
    :catch_59
    move-exception v0

    .line 257
    .local v0, "e":Ljava/lang/Exception;
    invoke-interface {p3}, Ljava/util/Collection;->size()I

    move-result v8

    invoke-static {v0, p3, v8}, Lcom/fasterxml/jackson/databind/JsonMappingException;->wrapWithPath(Ljava/lang/Throwable;Ljava/lang/Object;I)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v8

    throw v8

    .line 254
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "reference":Lcom/fasterxml/jackson/databind/deser/UnresolvedForwardReference;
    :cond_63
    invoke-virtual {v3, v2}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer$CollectionReferringAccumulator;->handleUnresolvedReference(Lcom/fasterxml/jackson/databind/deser/UnresolvedForwardReference;)Lcom/fasterxml/jackson/databind/deser/impl/ReadableObjectId$Referring;

    move-result-object v1

    .line 255
    .local v1, "ref":Lcom/fasterxml/jackson/databind/deser/impl/ReadableObjectId$Referring;
    invoke-virtual {v2}, Lcom/fasterxml/jackson/databind/deser/UnresolvedForwardReference;->getRoid()Lcom/fasterxml/jackson/databind/deser/impl/ReadableObjectId;

    move-result-object v8

    invoke-virtual {v8, v1}, Lcom/fasterxml/jackson/databind/deser/impl/ReadableObjectId;->appendReferring(Lcom/fasterxml/jackson/databind/deser/impl/ReadableObjectId$Referring;)V

    goto :goto_19
.end method

.method public deserializeWithType(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;)Ljava/lang/Object;
    .registers 5
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p3, "typeDeserializer"    # Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 269
    invoke-virtual {p3, p1, p2}, Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;->deserializeTypedFromArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getContentDeserializer()Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 184
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    return-object v0
.end method

.method public getContentType()Lcom/fasterxml/jackson/databind/JavaType;
    .registers 2

    .prologue
    .line 179
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_collectionType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/JavaType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    return-object v0
.end method

.method protected final handleNonArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/util/Collection;)Ljava/util/Collection;
    .registers 11
    .param p1, "p"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 282
    .local p3, "result":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    sget-object v5, Lcom/fasterxml/jackson/databind/DeserializationFeature;->ACCEPT_SINGLE_VALUE_AS_ARRAY:Lcom/fasterxml/jackson/databind/DeserializationFeature;

    invoke-virtual {p2, v5}, Lcom/fasterxml/jackson/databind/DeserializationContext;->isEnabled(Lcom/fasterxml/jackson/databind/DeserializationFeature;)Z

    move-result v5

    if-nez v5, :cond_13

    .line 283
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_collectionType:Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p2, v5}, Lcom/fasterxml/jackson/databind/DeserializationContext;->mappingException(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v5

    throw v5

    .line 285
    :cond_13
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    .line 286
    .local v4, "valueDes":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueTypeDeserializer:Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;

    .line 287
    .local v2, "typeDeser":Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 292
    .local v1, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :try_start_1b
    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v5, :cond_27

    .line 293
    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->getNullValue()Ljava/lang/Object;
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_22} :catch_33

    move-result-object v3

    .line 303
    .local v3, "value":Ljava/lang/Object;
    :goto_23
    invoke-interface {p3, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 304
    return-object p3

    .line 294
    .end local v3    # "value":Ljava/lang/Object;
    :cond_27
    if-nez v2, :cond_2e

    .line 295
    :try_start_29
    invoke-virtual {v4, p1, p2}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "value":Ljava/lang/Object;
    goto :goto_23

    .line 297
    .end local v3    # "value":Ljava/lang/Object;
    :cond_2e
    invoke-virtual {v4, p1, p2, v2}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->deserializeWithType(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;)Ljava/lang/Object;
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_31} :catch_33

    move-result-object v3

    .restart local v3    # "value":Ljava/lang/Object;
    goto :goto_23

    .line 299
    .end local v3    # "value":Ljava/lang/Object;
    :catch_33
    move-exception v0

    .line 301
    .local v0, "e":Ljava/lang/Exception;
    const-class v5, Ljava/lang/Object;

    invoke-interface {p3}, Ljava/util/Collection;->size()I

    move-result v6

    invoke-static {v0, v5, v6}, Lcom/fasterxml/jackson/databind/JsonMappingException;->wrapWithPath(Ljava/lang/Throwable;Ljava/lang/Object;I)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v5

    throw v5
.end method

.method public isCachable()Z
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueTypeDeserializer:Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected withResolved(Lcom/fasterxml/jackson/databind/JsonDeserializer;Lcom/fasterxml/jackson/databind/JsonDeserializer;Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;)Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;
    .registers 10
    .param p3, "vtd"    # Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;",
            ")",
            "Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;"
        }
    .end annotation

    .prologue
    .line 113
    .local p1, "dd":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;"
    .local p2, "vd":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_delegateDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    if-ne p1, v0, :cond_d

    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueDeserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    if-ne p2, v0, :cond_d

    iget-object v0, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueTypeDeserializer:Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;

    if-ne p3, v0, :cond_d

    .line 116
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;
    :goto_c
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;
    :cond_d
    new-instance v0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_collectionType:Lcom/fasterxml/jackson/databind/JavaType;

    iget-object v4, p0, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;->_valueInstantiator:Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;

    move-object v2, p2

    move-object v3, p3

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/deser/std/CollectionDeserializer;-><init>(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonDeserializer;Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;Lcom/fasterxml/jackson/databind/deser/ValueInstantiator;Lcom/fasterxml/jackson/databind/JsonDeserializer;)V

    move-object p0, v0

    goto :goto_c
.end method
