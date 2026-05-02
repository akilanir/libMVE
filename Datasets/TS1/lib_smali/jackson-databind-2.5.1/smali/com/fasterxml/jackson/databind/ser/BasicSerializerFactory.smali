.class public abstract Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;
.super Lcom/fasterxml/jackson/databind/ser/SerializerFactory;
.source "BasicSerializerFactory.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory$1;
    }
.end annotation


# static fields
.field protected static final _concrete:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;>;"
        }
    .end annotation
.end field

.field protected static final _concreteLazy:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;>;>;"
        }
    .end annotation
.end field


# instance fields
.field protected final _factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .prologue
    .line 51
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    sput-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    .line 59
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    sput-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concreteLazy:Ljava/util/HashMap;

    .line 66
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    const-class v7, Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lcom/fasterxml/jackson/databind/ser/std/StringSerializer;

    invoke-direct {v8}, Lcom/fasterxml/jackson/databind/ser/std/StringSerializer;-><init>()V

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v4, Lcom/fasterxml/jackson/databind/ser/std/ToStringSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/ToStringSerializer;

    .line 68
    .local v4, "sls":Lcom/fasterxml/jackson/databind/ser/std/ToStringSerializer;
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    const-class v7, Ljava/lang/StringBuffer;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    const-class v7, Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    const-class v7, Ljava/lang/Character;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    sget-object v7, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    invoke-static {v6}, Lcom/fasterxml/jackson/databind/ser/std/NumberSerializers;->addAll(Ljava/util/Map;)V

    .line 75
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lcom/fasterxml/jackson/databind/ser/std/BooleanSerializer;

    const/4 v9, 0x1

    invoke-direct {v8, v9}, Lcom/fasterxml/jackson/databind/ser/std/BooleanSerializer;-><init>(Z)V

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    const-class v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lcom/fasterxml/jackson/databind/ser/std/BooleanSerializer;

    const/4 v9, 0x0

    invoke-direct {v8, v9}, Lcom/fasterxml/jackson/databind/ser/std/BooleanSerializer;-><init>(Z)V

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    const-class v7, Ljava/math/BigInteger;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lcom/fasterxml/jackson/databind/ser/std/NumberSerializer;

    const-class v9, Ljava/math/BigInteger;

    invoke-direct {v8, v9}, Lcom/fasterxml/jackson/databind/ser/std/NumberSerializer;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    const-class v7, Ljava/math/BigDecimal;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lcom/fasterxml/jackson/databind/ser/std/NumberSerializer;

    const-class v9, Ljava/math/BigDecimal;

    invoke-direct {v8, v9}, Lcom/fasterxml/jackson/databind/ser/std/NumberSerializer;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    const-class v7, Ljava/util/Calendar;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lcom/fasterxml/jackson/databind/ser/std/CalendarSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/CalendarSerializer;

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v1, Lcom/fasterxml/jackson/databind/ser/std/DateSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/DateSerializer;

    .line 86
    .local v1, "dateSer":Lcom/fasterxml/jackson/databind/ser/std/DateSerializer;
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    const-class v7, Ljava/util/Date;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    const-class v7, Ljava/sql/Timestamp;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concreteLazy:Ljava/util/HashMap;

    const-class v7, Ljava/sql/Date;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-class v8, Lcom/fasterxml/jackson/databind/ser/std/SqlDateSerializer;

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concreteLazy:Ljava/util/HashMap;

    const-class v7, Ljava/sql/Time;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-class v8, Lcom/fasterxml/jackson/databind/ser/std/SqlTimeSerializer;

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    invoke-static {}, Lcom/fasterxml/jackson/databind/ser/std/StdJdkSerializers;->all()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_de
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_13c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 96
    .local v2, "en":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/lang/Object;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 97
    .local v5, "value":Ljava/lang/Object;
    instance-of v6, v5, Lcom/fasterxml/jackson/databind/JsonSerializer;

    if-eqz v6, :cond_104

    .line 98
    sget-object v7, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    check-cast v5, Lcom/fasterxml/jackson/databind/JsonSerializer;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v7, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_de

    .line 99
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_104
    instance-of v6, v5, Ljava/lang/Class;

    if-eqz v6, :cond_11b

    move-object v0, v5

    .line 101
    check-cast v0, Ljava/lang/Class;

    .line 102
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    sget-object v7, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concreteLazy:Ljava/util/HashMap;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_de

    .line 104
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    :cond_11b
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Internal error: unrecognized value of type "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 110
    .end local v2    # "en":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/lang/Object;>;"
    .end local v5    # "value":Ljava/lang/Object;
    :cond_13c
    sget-object v6, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concreteLazy:Ljava/util/HashMap;

    const-class v7, Lcom/fasterxml/jackson/databind/util/TokenBuffer;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-class v8, Lcom/fasterxml/jackson/databind/ser/std/TokenBufferSerializer;

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;)V
    .registers 2
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    .prologue
    .line 136
    invoke-direct {p0}, Lcom/fasterxml/jackson/databind/ser/SerializerFactory;-><init>()V

    .line 137
    if-nez p1, :cond_a

    new-instance p1, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    .end local p1    # "config":Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;
    invoke-direct {p1}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;-><init>()V

    :cond_a
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    .line 138
    return-void
.end method

.method protected static modifySecondaryTypesByAnnotation(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 11
    .param p0, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p1, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ">(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 969
    .local p2, "type":Lcom/fasterxml/jackson/databind/JavaType;, "TT;"
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v3

    .line 971
    .local v3, "intr":Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->isContainerType()Z

    move-result v5

    if-eqz v5, :cond_4d

    .line 972
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getKeyType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    invoke-virtual {v3, p1, v5}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findSerializationKeyType(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Class;

    move-result-object v4

    .line 973
    .local v4, "keyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v4, :cond_3f

    .line 975
    instance-of v5, p2, Lcom/fasterxml/jackson/databind/type/MapType;

    if-nez v5, :cond_37

    .line 976
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Illegal key-type annotation: type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " is not a Map type"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 979
    :cond_37
    :try_start_37
    move-object v0, p2

    check-cast v0, Lcom/fasterxml/jackson/databind/type/MapType;

    move-object v5, v0

    invoke-virtual {v5, v4}, Lcom/fasterxml/jackson/databind/type/MapType;->widenKey(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    :try_end_3e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_37 .. :try_end_3e} :catch_4e

    move-result-object p2

    .line 986
    :cond_3f
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    invoke-virtual {v3, p1, v5}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findSerializationContentType(Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Ljava/lang/Class;

    move-result-object v1

    .line 987
    .local v1, "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_4d

    .line 989
    :try_start_49
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/databind/JavaType;->widenContentsBy(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    :try_end_4c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_49 .. :try_end_4c} :catch_84

    move-result-object p2

    .line 995
    .end local v1    # "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "keyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4d
    return-object p2

    .line 980
    .restart local v4    # "keyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_4e
    move-exception v2

    .line 981
    .local v2, "iae":Ljava/lang/IllegalArgumentException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to narrow key type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " with key-type annotation ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "): "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 990
    .end local v2    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v1    # "cc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_84
    move-exception v2

    .line 991
    .restart local v2    # "iae":Ljava/lang/IllegalArgumentException;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to narrow content type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " with content-type annotation ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "): "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
.end method


# virtual methods
.method protected _findContentSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 6
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
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
    .line 1024
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v0

    .line 1025
    .local v0, "intr":Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
    invoke-virtual {v0, p2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findContentSerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v1

    .line 1026
    .local v1, "serDef":Ljava/lang/Object;
    if-eqz v1, :cond_f

    .line 1027
    invoke-virtual {p1, p2, v1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->serializerInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v2

    .line 1029
    :goto_e
    return-object v2

    :cond_f
    const/4 v2, 0x0

    goto :goto_e
.end method

.method protected _findKeySerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 6
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
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
    .line 1007
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v0

    .line 1008
    .local v0, "intr":Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
    invoke-virtual {v0, p2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findKeySerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v1

    .line 1009
    .local v1, "serDef":Ljava/lang/Object;
    if-eqz v1, :cond_f

    .line 1010
    invoke-virtual {p1, p2, v1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->serializerInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v2

    .line 1012
    :goto_e
    return-object v2

    :cond_f
    const/4 v2, 0x0

    goto :goto_e
.end method

.method protected _verifyAsClass(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Class;
    .registers 8
    .param p1, "src"    # Ljava/lang/Object;
    .param p2, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .local p3, "noneClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 1067
    if-nez p1, :cond_5

    move-object v0, v1

    .line 1077
    :cond_4
    :goto_4
    return-object v0

    .line 1070
    :cond_5
    instance-of v2, p1, Ljava/lang/Class;

    if-nez v2, :cond_3a

    .line 1071
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AnnotationIntrospector."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "() returned value of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": expected type JsonSerializer or Class<JsonSerializer> instead"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_3a
    move-object v0, p1

    .line 1073
    check-cast v0, Ljava/lang/Class;

    .line 1074
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eq v0, p3, :cond_45

    invoke-static {v0}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->isBogusClass(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_45
    move-object v0, v1

    .line 1075
    goto :goto_4
.end method

.method protected buildArraySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/ArrayType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 20
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "type"    # Lcom/fasterxml/jackson/databind/type/ArrayType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p4, "staticTyping"    # Z
    .param p5, "elementTypeSerializer"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/type/ArrayType;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Z",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;)",
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
    .line 816
    .local p6, "elementValueSerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    const/4 v12, 0x0

    .line 818
    .local v12, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->customSerializers()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_23

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/databind/ser/Serializers;

    .local v3, "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    move-object v4, p1

    move-object v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    .line 819
    invoke-interface/range {v3 .. v8}, Lcom/fasterxml/jackson/databind/ser/Serializers;->findArraySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/ArrayType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v12

    .line 821
    if-eqz v12, :cond_9

    .line 825
    .end local v3    # "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    :cond_23
    if-nez v12, :cond_48

    .line 826
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/type/ArrayType;->getRawClass()Ljava/lang/Class;

    move-result-object v11

    .line 828
    .local v11, "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p6, :cond_31

    invoke-static/range {p6 .. p6}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->isJacksonStdImpl(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_37

    .line 829
    :cond_31
    const-class v4, [Ljava/lang/String;

    if-ne v4, v11, :cond_6d

    .line 830
    sget-object v12, Lcom/fasterxml/jackson/databind/ser/impl/StringArraySerializer;->instance:Lcom/fasterxml/jackson/databind/ser/impl/StringArraySerializer;

    .line 836
    :cond_37
    :goto_37
    if-nez v12, :cond_48

    .line 837
    new-instance v12, Lcom/fasterxml/jackson/databind/ser/std/ObjectArraySerializer;

    .end local v12    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/type/ArrayType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    move/from16 v0, p4

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    invoke-direct {v12, v4, v0, v1, v2}, Lcom/fasterxml/jackson/databind/ser/std/ObjectArraySerializer;-><init>(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    .line 842
    .end local v11    # "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v12    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_48
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasSerializerModifiers()Z

    move-result v4

    if-eqz v4, :cond_72

    .line 843
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializerModifiers()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_5a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_72

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .line 844
    .local v10, "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    move-object/from16 v0, p3

    invoke-virtual {v10, p1, p2, v0, v12}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;->modifyArraySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/ArrayType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v12

    .line 845
    goto :goto_5a

    .line 833
    .end local v10    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    .restart local v11    # "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_6d
    invoke-static {v11}, Lcom/fasterxml/jackson/databind/ser/std/StdArraySerializers;->findStandardImpl(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v12

    goto :goto_37

    .line 847
    .end local v11    # "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_72
    return-object v12
.end method

.method protected buildCollectionSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/CollectionType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 24
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "type"    # Lcom/fasterxml/jackson/databind/type/CollectionType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p4, "staticTyping"    # Z
    .param p5, "elementTypeSerializer"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/type/CollectionType;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Z",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;)",
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
    .line 634
    .local p6, "elementValueSerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    const/16 v16, 0x0

    .line 636
    .local v16, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->customSerializers()Ljava/lang/Iterable;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_26

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/fasterxml/jackson/databind/ser/Serializers;

    .local v4, "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    .line 637
    invoke-interface/range {v4 .. v9}, Lcom/fasterxml/jackson/databind/ser/Serializers;->findCollectionSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/CollectionType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v16

    .line 639
    if-eqz v16, :cond_a

    .line 644
    .end local v4    # "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    :cond_26
    if-nez v16, :cond_58

    .line 647
    const/4 v5, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Lcom/fasterxml/jackson/databind/BeanDescription;->findExpectedFormat(Lcom/fasterxml/jackson/annotation/JsonFormat$Value;)Lcom/fasterxml/jackson/annotation/JsonFormat$Value;

    move-result-object v12

    .line 648
    .local v12, "format":Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    if-eqz v12, :cond_3b

    invoke-virtual {v12}, Lcom/fasterxml/jackson/annotation/JsonFormat$Value;->getShape()Lcom/fasterxml/jackson/annotation/JsonFormat$Shape;

    move-result-object v5

    sget-object v6, Lcom/fasterxml/jackson/annotation/JsonFormat$Shape;->OBJECT:Lcom/fasterxml/jackson/annotation/JsonFormat$Shape;

    if-ne v5, v6, :cond_3b

    .line 649
    const/4 v5, 0x0

    .line 690
    .end local v12    # "format":Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    :goto_3a
    return-object v5

    .line 651
    .restart local v12    # "format":Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    :cond_3b
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/type/CollectionType;->getRawClass()Ljava/lang/Class;

    move-result-object v15

    .line 652
    .local v15, "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v5, Ljava/util/EnumSet;

    invoke-virtual {v5, v15}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_87

    .line 654
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/type/CollectionType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v11

    .line 656
    .local v11, "enumType":Lcom/fasterxml/jackson/databind/JavaType;
    invoke-virtual {v11}, Lcom/fasterxml/jackson/databind/JavaType;->isEnumType()Z

    move-result v5

    if-nez v5, :cond_52

    .line 657
    const/4 v11, 0x0

    .line 659
    :cond_52
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildEnumSetSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v16

    .line 685
    .end local v11    # "enumType":Lcom/fasterxml/jackson/databind/JavaType;
    .end local v12    # "format":Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    .end local v15    # "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_58
    :goto_58
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasSerializerModifiers()Z

    move-result v5

    if-eqz v5, :cond_d8

    .line 686
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializerModifiers()Ljava/lang/Iterable;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_6e
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_d8

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .line 687
    .local v14, "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, v16

    invoke-virtual {v14, v0, v1, v2, v3}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;->modifyCollectionSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/CollectionType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v16

    .line 688
    goto :goto_6e

    .line 661
    .end local v14    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    .restart local v12    # "format":Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    .restart local v15    # "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_87
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/type/CollectionType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v10

    .line 662
    .local v10, "elementRaw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->isIndexedList(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_c9

    .line 663
    const-class v5, Ljava/lang/String;

    if-ne v10, v5, :cond_b8

    .line 665
    if-eqz p6, :cond_a3

    invoke-static/range {p6 .. p6}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->isJacksonStdImpl(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a5

    .line 666
    :cond_a3
    sget-object v16, Lcom/fasterxml/jackson/databind/ser/impl/IndexedStringListSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/impl/IndexedStringListSerializer;

    .line 678
    :cond_a5
    :goto_a5
    if-nez v16, :cond_58

    .line 679
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/type/CollectionType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    move-object/from16 v0, p0

    move/from16 v1, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    invoke-virtual {v0, v5, v1, v2, v3}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildCollectionSerializer(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/ser/ContainerSerializer;

    move-result-object v16

    goto :goto_58

    .line 669
    :cond_b8
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/type/CollectionType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    move-object/from16 v0, p0

    move/from16 v1, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    invoke-virtual {v0, v5, v1, v2, v3}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildIndexedListSerializer(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/ser/ContainerSerializer;

    move-result-object v16

    goto :goto_a5

    .line 672
    :cond_c9
    const-class v5, Ljava/lang/String;

    if-ne v10, v5, :cond_a5

    .line 674
    if-eqz p6, :cond_d5

    invoke-static/range {p6 .. p6}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->isJacksonStdImpl(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a5

    .line 675
    :cond_d5
    sget-object v16, Lcom/fasterxml/jackson/databind/ser/impl/StringCollectionSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/impl/StringCollectionSerializer;

    goto :goto_a5

    .end local v10    # "elementRaw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v12    # "format":Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    .end local v15    # "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_d8
    move-object/from16 v5, v16

    .line 690
    goto/16 :goto_3a
.end method

.method public buildCollectionSerializer(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/ser/ContainerSerializer;
    .registers 11
    .param p1, "elemType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "staticTyping"    # Z
    .param p3, "vts"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Z",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/fasterxml/jackson/databind/ser/ContainerSerializer",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 710
    .local p4, "valueSerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/std/CollectionSerializer;

    const/4 v4, 0x0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/ser/std/CollectionSerializer;-><init>(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    return-object v0
.end method

.method protected buildContainerSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 36
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
    .line 539
    invoke-virtual/range {p1 .. p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v5

    .line 545
    .local v5, "config":Lcom/fasterxml/jackson/databind/SerializationConfig;
    if-nez p4, :cond_20

    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/JavaType;->useStaticType()Z

    move-result v4

    if-eqz v4, :cond_20

    .line 546
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/JavaType;->isContainerType()Z

    move-result v4

    if-eqz v4, :cond_1e

    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/JavaType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v4

    const-class v6, Ljava/lang/Object;

    if-eq v4, v6, :cond_20

    .line 547
    :cond_1e
    const/16 p4, 0x1

    .line 552
    :cond_20
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/JavaType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v26

    .line 553
    .local v26, "elementType":Lcom/fasterxml/jackson/databind/JavaType;
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v5, v1}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->createTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v10

    .line 557
    .local v10, "elementTypeSerializer":Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    if-eqz v10, :cond_30

    .line 558
    const/16 p4, 0x0

    .line 560
    :cond_30
    invoke-virtual/range {p3 .. p3}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_findContentSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v11

    .line 563
    .local v11, "elementValueSerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/JavaType;->isMapLikeType()Z

    move-result v4

    if-eqz v4, :cond_be

    move-object/from16 v28, p2

    .line 564
    check-cast v28, Lcom/fasterxml/jackson/databind/type/MapLikeType;

    .line 570
    .local v28, "mlt":Lcom/fasterxml/jackson/databind/type/MapLikeType;
    invoke-virtual/range {p3 .. p3}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_findKeySerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v9

    .line 571
    .local v9, "keySerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    invoke-virtual/range {v28 .. v28}, Lcom/fasterxml/jackson/databind/type/MapLikeType;->isTrueMapType()Z

    move-result v4

    if-eqz v4, :cond_67

    move-object/from16 v6, v28

    .line 572
    check-cast v6, Lcom/fasterxml/jackson/databind/type/MapType;

    move-object/from16 v4, p0

    move-object/from16 v7, p3

    move/from16 v8, p4

    invoke-virtual/range {v4 .. v11}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildMapSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/MapType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v30

    .line 620
    .end local v9    # "keySerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .end local v28    # "mlt":Lcom/fasterxml/jackson/databind/type/MapLikeType;
    :cond_66
    :goto_66
    return-object v30

    .line 576
    .restart local v9    # "keySerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v28    # "mlt":Lcom/fasterxml/jackson/databind/type/MapLikeType;
    :cond_67
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->customSerializers()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v27

    .local v27, "i$":Ljava/util/Iterator;
    :cond_6f
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_bb

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/fasterxml/jackson/databind/ser/Serializers;

    .local v12, "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    move-object/from16 v14, p2

    .line 577
    check-cast v14, Lcom/fasterxml/jackson/databind/type/MapLikeType;

    .local v14, "mlType":Lcom/fasterxml/jackson/databind/type/MapLikeType;
    move-object v13, v5

    move-object/from16 v15, p3

    move-object/from16 v16, v9

    move-object/from16 v17, v10

    move-object/from16 v18, v11

    .line 578
    invoke-interface/range {v12 .. v18}, Lcom/fasterxml/jackson/databind/ser/Serializers;->findMapLikeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/MapLikeType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v30

    .line 580
    .local v30, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    if-eqz v30, :cond_6f

    .line 582
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasSerializerModifiers()Z

    move-result v4

    if-eqz v4, :cond_66

    .line 583
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializerModifiers()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v27

    :goto_a4
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_66

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .line 584
    .local v29, "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    move-object/from16 v0, v29

    move-object/from16 v1, p3

    move-object/from16 v2, v30

    invoke-virtual {v0, v5, v14, v1, v2}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;->modifyMapLikeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/MapLikeType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v30

    .line 585
    goto :goto_a4

    .line 590
    .end local v12    # "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    .end local v14    # "mlType":Lcom/fasterxml/jackson/databind/type/MapLikeType;
    .end local v29    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    .end local v30    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_bb
    const/16 v30, 0x0

    goto :goto_66

    .line 592
    .end local v9    # "keySerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .end local v27    # "i$":Ljava/util/Iterator;
    .end local v28    # "mlt":Lcom/fasterxml/jackson/databind/type/MapLikeType;
    :cond_be
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/JavaType;->isCollectionLikeType()Z

    move-result v4

    if-eqz v4, :cond_13d

    move-object/from16 v25, p2

    .line 593
    check-cast v25, Lcom/fasterxml/jackson/databind/type/CollectionLikeType;

    .line 594
    .local v25, "clt":Lcom/fasterxml/jackson/databind/type/CollectionLikeType;
    invoke-virtual/range {v25 .. v25}, Lcom/fasterxml/jackson/databind/type/CollectionLikeType;->isTrueCollectionType()Z

    move-result v4

    if-eqz v4, :cond_e3

    move-object/from16 v17, v25

    .line 595
    check-cast v17, Lcom/fasterxml/jackson/databind/type/CollectionType;

    move-object/from16 v15, p0

    move-object/from16 v16, v5

    move-object/from16 v18, p3

    move/from16 v19, p4

    move-object/from16 v20, v10

    move-object/from16 v21, v11

    invoke-virtual/range {v15 .. v21}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildCollectionSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/CollectionType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v30

    goto :goto_66

    :cond_e3
    move-object/from16 v17, p2

    .line 598
    check-cast v17, Lcom/fasterxml/jackson/databind/type/CollectionLikeType;

    .line 600
    .local v17, "clType":Lcom/fasterxml/jackson/databind/type/CollectionLikeType;
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->customSerializers()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v27

    .restart local v27    # "i$":Ljava/util/Iterator;
    :cond_ef
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_139

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/fasterxml/jackson/databind/ser/Serializers;

    .restart local v12    # "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    move-object v15, v12

    move-object/from16 v16, v5

    move-object/from16 v18, p3

    move-object/from16 v19, v10

    move-object/from16 v20, v11

    .line 601
    invoke-interface/range {v15 .. v20}, Lcom/fasterxml/jackson/databind/ser/Serializers;->findCollectionLikeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/CollectionLikeType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v30

    .line 603
    .restart local v30    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    if-eqz v30, :cond_ef

    .line 605
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasSerializerModifiers()Z

    move-result v4

    if-eqz v4, :cond_66

    .line 606
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializerModifiers()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v27

    :goto_120
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_66

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .line 607
    .restart local v29    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    move-object/from16 v0, v29

    move-object/from16 v1, v17

    move-object/from16 v2, p3

    move-object/from16 v3, v30

    invoke-virtual {v0, v5, v1, v2, v3}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;->modifyCollectionLikeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/CollectionLikeType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v30

    .line 608
    goto :goto_120

    .line 614
    .end local v12    # "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    .end local v29    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    .end local v30    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_139
    const/16 v30, 0x0

    goto/16 :goto_66

    .line 616
    .end local v17    # "clType":Lcom/fasterxml/jackson/databind/type/CollectionLikeType;
    .end local v25    # "clt":Lcom/fasterxml/jackson/databind/type/CollectionLikeType;
    .end local v27    # "i$":Ljava/util/Iterator;
    :cond_13d
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/JavaType;->isArrayType()Z

    move-result v4

    if-eqz v4, :cond_159

    move-object/from16 v20, p2

    .line 617
    check-cast v20, Lcom/fasterxml/jackson/databind/type/ArrayType;

    move-object/from16 v18, p0

    move-object/from16 v19, v5

    move-object/from16 v21, p3

    move/from16 v22, p4

    move-object/from16 v23, v10

    move-object/from16 v24, v11

    invoke-virtual/range {v18 .. v24}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildArraySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/ArrayType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v30

    goto/16 :goto_66

    .line 620
    :cond_159
    const/16 v30, 0x0

    goto/16 :goto_66
.end method

.method protected buildEnumSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 11
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
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
    const/4 v4, 0x0

    .line 921
    invoke-virtual {p3, v4}, Lcom/fasterxml/jackson/databind/BeanDescription;->findExpectedFormat(Lcom/fasterxml/jackson/annotation/JsonFormat$Value;)Lcom/fasterxml/jackson/annotation/JsonFormat$Value;

    move-result-object v1

    .line 922
    .local v1, "format":Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    if-eqz v1, :cond_17

    invoke-virtual {v1}, Lcom/fasterxml/jackson/annotation/JsonFormat$Value;->getShape()Lcom/fasterxml/jackson/annotation/JsonFormat$Shape;

    move-result-object v5

    sget-object v6, Lcom/fasterxml/jackson/annotation/JsonFormat$Shape;->OBJECT:Lcom/fasterxml/jackson/annotation/JsonFormat$Shape;

    if-ne v5, v6, :cond_17

    .line 924
    check-cast p3, Lcom/fasterxml/jackson/databind/introspect/BasicBeanDescription;

    .end local p3    # "beanDesc":Lcom/fasterxml/jackson/databind/BeanDescription;
    const-string v5, "declaringClass"

    invoke-virtual {p3, v5}, Lcom/fasterxml/jackson/databind/introspect/BasicBeanDescription;->removeProperty(Ljava/lang/String;)Z

    .line 937
    :cond_16
    return-object v4

    .line 929
    .restart local p3    # "beanDesc":Lcom/fasterxml/jackson/databind/BeanDescription;
    :cond_17
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v0

    .line 930
    .local v0, "enumClass":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Enum<*>;>;"
    invoke-static {v0, p1, p3, v1}, Lcom/fasterxml/jackson/databind/ser/std/EnumSerializer;->construct(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/annotation/JsonFormat$Value;)Lcom/fasterxml/jackson/databind/ser/std/EnumSerializer;

    move-result-object v4

    .line 932
    .local v4, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasSerializerModifiers()Z

    move-result v5

    if-eqz v5, :cond_16

    .line 933
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializerModifiers()Ljava/lang/Iterable;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_31
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_16

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .line 934
    .local v3, "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    invoke-virtual {v3, p1, p2, p3, v4}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;->modifyEnumSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v4

    .line 935
    goto :goto_31
.end method

.method public buildEnumSetSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 4
    .param p1, "enumType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ")",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 714
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/std/EnumSetSerializer;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/fasterxml/jackson/databind/ser/std/EnumSetSerializer;-><init>(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanProperty;)V

    return-object v0
.end method

.method public buildIndexedListSerializer(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/ser/ContainerSerializer;
    .registers 11
    .param p1, "elemType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "staticTyping"    # Z
    .param p3, "vts"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Z",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/fasterxml/jackson/databind/ser/ContainerSerializer",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 706
    .local p4, "valueSerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;

    const/4 v4, 0x0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/ser/impl/IndexedListSerializer;-><init>(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    return-object v0
.end method

.method protected buildIterableSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 12
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p4, "staticTyping"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 894
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v0

    const-class v1, Ljava/lang/Iterable;

    invoke-virtual {v0, p2, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v6

    .line 895
    .local v6, "params":[Lcom/fasterxml/jackson/databind/JavaType;
    if-eqz v6, :cond_10

    array-length v0, v6

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1e

    :cond_10
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    .local v5, "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_14
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 897
    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildIterableSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    return-object v0

    .line 895
    .end local v5    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_1e
    const/4 v0, 0x0

    aget-object v5, v6, v0

    goto :goto_14
.end method

.method protected buildIterableSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 9
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p4, "staticTyping"    # Z
    .param p5, "valueType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Z",
            "Lcom/fasterxml/jackson/databind/JavaType;",
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
    .line 885
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/std/IterableSerializer;

    invoke-virtual {p0, p1, p5}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->createTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p5, p4, v1, v2}, Lcom/fasterxml/jackson/databind/ser/std/IterableSerializer;-><init>(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)V

    return-object v0
.end method

.method protected buildIteratorSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 12
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p4, "staticTyping"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 871
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v0

    const-class v1, Ljava/util/Iterator;

    invoke-virtual {v0, p2, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v6

    .line 872
    .local v6, "params":[Lcom/fasterxml/jackson/databind/JavaType;
    if-eqz v6, :cond_10

    array-length v0, v6

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1e

    :cond_10
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    .local v5, "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_14
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 874
    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildIteratorSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    return-object v0

    .line 872
    .end local v5    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_1e
    const/4 v0, 0x0

    aget-object v5, v6, v0

    goto :goto_14
.end method

.method protected buildIteratorSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 9
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p4, "staticTyping"    # Z
    .param p5, "valueType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Z",
            "Lcom/fasterxml/jackson/databind/JavaType;",
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
    .line 864
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/impl/IteratorSerializer;

    invoke-virtual {p0, p1, p5}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->createTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p5, p4, v1, v2}, Lcom/fasterxml/jackson/databind/ser/impl/IteratorSerializer;-><init>(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)V

    return-object v0
.end method

.method protected buildMapEntrySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 14
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p4, "staticTyping"    # Z
    .param p5, "keyType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p6, "valueType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Z",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
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
    .line 908
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/impl/MapEntrySerializer;

    invoke-virtual {p0, p1, p6}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->createTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v5

    const/4 v6, 0x0

    move-object v1, p6

    move-object v2, p5

    move-object v3, p6

    move v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/fasterxml/jackson/databind/ser/impl/MapEntrySerializer;-><init>(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)V

    return-object v0
.end method

.method protected buildMapSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/MapType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 24
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "type"    # Lcom/fasterxml/jackson/databind/type/MapType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p4, "staticTyping"    # Z
    .param p6, "elementTypeSerializer"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/type/MapType;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Z",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;)",
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
    .line 733
    .local p5, "keySerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .local p7, "elementValueSerializer":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    const/4 v14, 0x0

    .line 734
    .local v14, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->customSerializers()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/databind/ser/Serializers;

    .local v3, "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    .line 735
    invoke-interface/range {v3 .. v9}, Lcom/fasterxml/jackson/databind/ser/Serializers;->findMapSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/MapType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v14

    .line 737
    if-eqz v14, :cond_9

    .line 739
    .end local v3    # "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    :cond_27
    if-nez v14, :cond_62

    .line 756
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->findFilterId(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;)Ljava/lang/Object;

    move-result-object v10

    .line 757
    .local v10, "filterId":Ljava/lang/Object;
    invoke-virtual/range {p1 .. p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v4

    invoke-virtual/range {p3 .. p3}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findPropertiesToIgnore(Lcom/fasterxml/jackson/databind/introspect/Annotated;)[Ljava/lang/String;

    move-result-object v4

    move-object/from16 v5, p2

    move/from16 v6, p4

    move-object/from16 v7, p6

    move-object/from16 v8, p5

    move-object/from16 v9, p7

    invoke-static/range {v4 .. v10}, Lcom/fasterxml/jackson/databind/ser/std/MapSerializer;->construct([Ljava/lang/String;Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/ser/std/MapSerializer;

    move-result-object v12

    .line 760
    .local v12, "mapSer":Lcom/fasterxml/jackson/databind/ser/std/MapSerializer;
    invoke-virtual/range {p2 .. p2}, Lcom/fasterxml/jackson/databind/type/MapType;->getContentType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v4, v2}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->findSuppressableContentValue(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Ljava/lang/Object;

    move-result-object v15

    .line 762
    .local v15, "suppressableValue":Ljava/lang/Object;
    if-eqz v15, :cond_61

    .line 763
    invoke-virtual {v12, v15}, Lcom/fasterxml/jackson/databind/ser/std/MapSerializer;->withContentInclusion(Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/ser/std/MapSerializer;

    move-result-object v12

    .line 765
    :cond_61
    move-object v14, v12

    .line 768
    .end local v10    # "filterId":Ljava/lang/Object;
    .end local v12    # "mapSer":Lcom/fasterxml/jackson/databind/ser/std/MapSerializer;
    .end local v15    # "suppressableValue":Ljava/lang/Object;
    :cond_62
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasSerializerModifiers()Z

    move-result v4

    if-eqz v4, :cond_8f

    .line 769
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializerModifiers()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_78
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8f

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .line 770
    .local v13, "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v13, v0, v1, v2, v14}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;->modifyMapSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/type/MapType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v14

    .line 771
    goto :goto_78

    .line 773
    .end local v13    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    :cond_8f
    return-object v14
.end method

.method public createKeySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 15
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "keyType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 209
    .local p3, "defaultImpl":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {p1, v9}, Lcom/fasterxml/jackson/databind/SerializationConfig;->introspectClassAnnotations(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/BeanDescription;

    move-result-object v1

    .line 210
    .local v1, "beanDesc":Lcom/fasterxml/jackson/databind/BeanDescription;
    const/4 v7, 0x0

    .line 212
    .local v7, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    iget-object v9, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasKeySerializers()Z

    move-result v9

    if-eqz v9, :cond_2d

    .line 214
    iget-object v9, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->keySerializers()Ljava/lang/Iterable;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_1b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/fasterxml/jackson/databind/ser/Serializers;

    .line 215
    .local v8, "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    invoke-interface {v8, p1, p2, v1}, Lcom/fasterxml/jackson/databind/ser/Serializers;->findSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v7

    .line 216
    if-eqz v7, :cond_1b

    .line 221
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v8    # "serializers":Lcom/fasterxml/jackson/databind/ser/Serializers;
    :cond_2d
    if-nez v7, :cond_62

    .line 222
    move-object v7, p3

    .line 223
    if-nez v7, :cond_62

    .line 224
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v9

    const/4 v10, 0x0

    invoke-static {p1, v9, v10}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->getStdKeySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Ljava/lang/Class;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v7

    .line 226
    if-nez v7, :cond_62

    .line 227
    invoke-virtual {p1, p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->introspect(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/BeanDescription;

    move-result-object v1

    .line 228
    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/BeanDescription;->findJsonValueMethod()Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    move-result-object v0

    .line 229
    .local v0, "am":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;
    if-eqz v0, :cond_85

    .line 230
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;->getRawReturnType()Ljava/lang/Class;

    move-result-object v6

    .line 231
    .local v6, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v9, 0x1

    invoke-static {p1, v6, v9}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->getStdKeySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Ljava/lang/Class;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v2

    .line 233
    .local v2, "delegate":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;->getAnnotated()Ljava/lang/reflect/Method;

    move-result-object v4

    .line 234
    .local v4, "m":Ljava/lang/reflect/Method;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->canOverrideAccessModifiers()Z

    move-result v9

    if-eqz v9, :cond_5d

    .line 235
    invoke-static {v4}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->checkAndFixAccess(Ljava/lang/reflect/Member;)V

    .line 237
    :cond_5d
    new-instance v7, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;

    .end local v7    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-direct {v7, v4, v2}, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;-><init>(Ljava/lang/reflect/Method;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    .line 246
    .end local v0    # "am":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;
    .end local v2    # "delegate":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    .end local v4    # "m":Ljava/lang/reflect/Method;
    .end local v6    # "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v7    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_62
    :goto_62
    iget-object v9, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->hasSerializerModifiers()Z

    move-result v9

    if-eqz v9, :cond_8a

    .line 247
    iget-object v9, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v9}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->serializerModifiers()Ljava/lang/Iterable;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_74
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_8a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .line 248
    .local v5, "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    invoke-virtual {v5, p1, p2, v1, v7}, Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;->modifyKeySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v7

    .line 249
    goto :goto_74

    .line 239
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "mod":Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;
    .restart local v0    # "am":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;
    :cond_85
    invoke-static {}, Lcom/fasterxml/jackson/databind/ser/std/StdKeySerializers;->getDefault()Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v7

    goto :goto_62

    .line 251
    .end local v0    # "am":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;
    :cond_8a
    return-object v7
.end method

.method public abstract createSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
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
.end method

.method public createTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    .registers 9
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "baseType"    # Lcom/fasterxml/jackson/databind/JavaType;

    .prologue
    .line 263
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/fasterxml/jackson/databind/SerializationConfig;->introspectClassAnnotations(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/BeanDescription;

    move-result-object v3

    .line 264
    .local v3, "bean":Lcom/fasterxml/jackson/databind/BeanDescription;
    invoke-virtual {v3}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v0

    .line 265
    .local v0, "ac":Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v1

    .line 266
    .local v1, "ai":Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
    invoke-virtual {v1, p1, v0, p2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findTypeResolver(Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v2

    .line 270
    .local v2, "b":Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;, "Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder<*>;"
    const/4 v4, 0x0

    .line 271
    .local v4, "subtypes":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/fasterxml/jackson/databind/jsontype/NamedType;>;"
    if-nez v2, :cond_1f

    .line 272
    invoke-virtual {p1, p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getDefaultTyper(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;

    move-result-object v2

    .line 276
    :goto_1b
    if-nez v2, :cond_28

    .line 277
    const/4 v5, 0x0

    .line 279
    :goto_1e
    return-object v5

    .line 274
    :cond_1f
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getSubtypeResolver()Lcom/fasterxml/jackson/databind/jsontype/SubtypeResolver;

    move-result-object v5

    invoke-virtual {v5, v0, p1, v1}, Lcom/fasterxml/jackson/databind/jsontype/SubtypeResolver;->collectAndResolveSubtypes(Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;Lcom/fasterxml/jackson/databind/cfg/MapperConfig;Lcom/fasterxml/jackson/databind/AnnotationIntrospector;)Ljava/util/Collection;

    move-result-object v4

    goto :goto_1b

    .line 279
    :cond_28
    invoke-interface {v2, p1, p2, v4}, Lcom/fasterxml/jackson/databind/jsontype/TypeResolverBuilder;->buildTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Ljava/util/Collection;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v5

    goto :goto_1e
.end method

.method protected abstract customSerializers()Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/fasterxml/jackson/databind/ser/Serializers;",
            ">;"
        }
    .end annotation
.end method

.method protected findConverter(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/util/Converter;
    .registers 5
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            ")",
            "Lcom/fasterxml/jackson/databind/util/Converter",
            "<",
            "Ljava/lang/Object;",
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
    .line 519
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findSerializationConverter(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v0

    .line 520
    .local v0, "convDef":Ljava/lang/Object;
    if-nez v0, :cond_c

    .line 521
    const/4 v1, 0x0

    .line 523
    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {p1, p2, v0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->converterInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/util/Converter;

    move-result-object v1

    goto :goto_b
.end method

.method protected findConvertingSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 7
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;)",
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
    .line 507
    .local p3, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->findConverter(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/util/Converter;

    move-result-object v0

    .line 508
    .local v0, "conv":Lcom/fasterxml/jackson/databind/util/Converter;, "Lcom/fasterxml/jackson/databind/util/Converter<Ljava/lang/Object;Ljava/lang/Object;>;"
    if-nez v0, :cond_7

    .line 512
    .end local p3    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :goto_6
    return-object p3

    .line 511
    .restart local p3    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_7
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/fasterxml/jackson/databind/util/Converter;->getOutputType(Lcom/fasterxml/jackson/databind/type/TypeFactory;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v1

    .line 512
    .local v1, "delegateType":Lcom/fasterxml/jackson/databind/JavaType;
    new-instance v2, Lcom/fasterxml/jackson/databind/ser/std/StdDelegatingSerializer;

    invoke-direct {v2, v0, v1, p3}, Lcom/fasterxml/jackson/databind/ser/std/StdDelegatingSerializer;-><init>(Lcom/fasterxml/jackson/databind/util/Converter;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    move-object p3, v2

    goto :goto_6
.end method

.method protected findFilterId(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;)Ljava/lang/Object;
    .registers 5
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;

    .prologue
    .line 1037
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v0

    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findFilterId(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected findOptionalStdSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 7
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
    .line 442
    sget-object v0, Lcom/fasterxml/jackson/databind/ext/OptionalHandlerFactory;->instance:Lcom/fasterxml/jackson/databind/ext/OptionalHandlerFactory;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v1

    invoke-virtual {v0, v1, p2, p3}, Lcom/fasterxml/jackson/databind/ext/OptionalHandlerFactory;->findSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    return-object v0
.end method

.method protected final findSerializerByAddonType(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 13
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "javaType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p4, "staticTyping"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
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
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 456
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v7

    .line 458
    .local v7, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/util/Iterator;

    invoke-virtual {v0, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 459
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v0

    const-class v1, Ljava/util/Iterator;

    invoke-virtual {v0, p2, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v6

    .line 460
    .local v6, "params":[Lcom/fasterxml/jackson/databind/JavaType;
    if-eqz v6, :cond_1d

    array-length v0, v6

    if-eq v0, v3, :cond_2b

    :cond_1d
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    .local v5, "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_21
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 462
    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildIteratorSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 473
    .end local v5    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    .end local v6    # "params":[Lcom/fasterxml/jackson/databind/JavaType;
    :goto_2a
    return-object v0

    .line 460
    .restart local v6    # "params":[Lcom/fasterxml/jackson/databind/JavaType;
    :cond_2b
    aget-object v5, v6, v2

    goto :goto_21

    .line 464
    .end local v6    # "params":[Lcom/fasterxml/jackson/databind/JavaType;
    :cond_2e
    const-class v0, Ljava/lang/Iterable;

    invoke-virtual {v0, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_56

    .line 465
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v0

    const-class v1, Ljava/lang/Iterable;

    invoke-virtual {v0, p2, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v6

    .line 466
    .restart local v6    # "params":[Lcom/fasterxml/jackson/databind/JavaType;
    if-eqz v6, :cond_45

    array-length v0, v6

    if-eq v0, v3, :cond_53

    :cond_45
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    .restart local v5    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_49
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 468
    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildIterableSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    goto :goto_2a

    .line 466
    .end local v5    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_53
    aget-object v5, v6, v2

    goto :goto_49

    .line 470
    .end local v6    # "params":[Lcom/fasterxml/jackson/databind/JavaType;
    :cond_56
    const-class v0, Ljava/lang/CharSequence;

    invoke-virtual {v0, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_61

    .line 471
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/ToStringSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/ToStringSerializer;

    goto :goto_2a

    .line 473
    :cond_61
    const/4 v0, 0x0

    goto :goto_2a
.end method

.method protected final findSerializerByAnnotations(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 9
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
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 341
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v1

    .line 343
    .local v1, "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v4, Lcom/fasterxml/jackson/databind/JsonSerializable;

    invoke-virtual {v4, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 344
    sget-object v4, Lcom/fasterxml/jackson/databind/ser/std/SerializableSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/SerializableSerializer;

    .line 357
    :goto_e
    return-object v4

    .line 347
    :cond_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/BeanDescription;->findJsonValueMethod()Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;

    move-result-object v3

    .line 348
    .local v3, "valueMethod":Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;
    if-eqz v3, :cond_2c

    .line 349
    invoke-virtual {v3}, Lcom/fasterxml/jackson/databind/introspect/AnnotatedMethod;->getAnnotated()Ljava/lang/reflect/Method;

    move-result-object v0

    .line 350
    .local v0, "m":Ljava/lang/reflect/Method;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->canOverrideAccessModifiers()Z

    move-result v4

    if-eqz v4, :cond_22

    .line 351
    invoke-static {v0}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->checkAndFixAccess(Ljava/lang/reflect/Member;)V

    .line 353
    :cond_22
    invoke-virtual {p0, p1, v3}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->findSerializerFromAnnotation(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v2

    .line 354
    .local v2, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    new-instance v4, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;

    invoke-direct {v4, v0, v2}, Lcom/fasterxml/jackson/databind/ser/std/JsonValueSerializer;-><init>(Ljava/lang/reflect/Method;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    goto :goto_e

    .line 357
    .end local v0    # "m":Ljava/lang/reflect/Method;
    .end local v2    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :cond_2c
    const/4 v4, 0x0

    goto :goto_e
.end method

.method protected final findSerializerByLookup(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 13
    .param p1, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p4, "staticTyping"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/BeanDescription;",
            "Z)",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 304
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v2

    .line 305
    .local v2, "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 306
    .local v0, "clsName":Ljava/lang/String;
    sget-object v5, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concrete:Ljava/util/HashMap;

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 307
    .local v3, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    if-nez v3, :cond_4f

    .line 308
    sget-object v5, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_concreteLazy:Ljava/util/HashMap;

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 309
    .local v4, "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    if-eqz v4, :cond_4f

    .line 311
    :try_start_1c
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/fasterxml/jackson/databind/JsonSerializer;
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_22} :catch_23

    .line 318
    .end local v4    # "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    :goto_22
    return-object v5

    .line 312
    .restart local v4    # "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    :catch_23
    move-exception v1

    .line 313
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to instantiate standard serializer (of type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "): "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "serClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/fasterxml/jackson/databind/JsonSerializer<*>;>;"
    :cond_4f
    move-object v5, v3

    .line 318
    goto :goto_22
.end method

.method protected final findSerializerByPrimaryType(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 16
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
    const/4 v0, 0x0

    .line 372
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v9

    .line 375
    .local v9, "raw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->findOptionalStdSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;Z)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v10

    .line 376
    .local v10, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    if-eqz v10, :cond_c

    .line 430
    .end local v10    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :goto_b
    return-object v10

    .line 380
    .restart local v10    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_c
    const-class v1, Ljava/util/Calendar;

    invoke-virtual {v1, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 381
    sget-object v10, Lcom/fasterxml/jackson/databind/ser/std/CalendarSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/CalendarSerializer;

    goto :goto_b

    .line 383
    :cond_17
    const-class v1, Ljava/util/Date;

    invoke-virtual {v1, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 384
    sget-object v10, Lcom/fasterxml/jackson/databind/ser/std/DateSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/DateSerializer;

    goto :goto_b

    .line 386
    :cond_22
    const-class v1, Ljava/util/Map$Entry;

    invoke-virtual {v1, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_53

    .line 388
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v0

    const-class v1, Ljava/util/Map$Entry;

    invoke-virtual {v0, p2, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->findTypeParameters(Lcom/fasterxml/jackson/databind/JavaType;Ljava/lang/Class;)[Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v8

    .line 389
    .local v8, "params":[Lcom/fasterxml/jackson/databind/JavaType;
    if-eqz v8, :cond_3a

    array-length v0, v8

    const/4 v1, 0x2

    if-eq v0, v1, :cond_4c

    .line 390
    :cond_3a
    invoke-static {}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->unknownType()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v6

    .local v6, "vt":Lcom/fasterxml/jackson/databind/JavaType;
    move-object v5, v6

    .line 395
    .local v5, "kt":Lcom/fasterxml/jackson/databind/JavaType;
    :goto_3f
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v1

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildMapEntrySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;ZLcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v10

    goto :goto_b

    .line 392
    .end local v5    # "kt":Lcom/fasterxml/jackson/databind/JavaType;
    .end local v6    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    :cond_4c
    const/4 v0, 0x0

    aget-object v5, v8, v0

    .line 393
    .restart local v5    # "kt":Lcom/fasterxml/jackson/databind/JavaType;
    const/4 v0, 0x1

    aget-object v6, v8, v0

    .restart local v6    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    goto :goto_3f

    .line 397
    .end local v5    # "kt":Lcom/fasterxml/jackson/databind/JavaType;
    .end local v6    # "vt":Lcom/fasterxml/jackson/databind/JavaType;
    .end local v8    # "params":[Lcom/fasterxml/jackson/databind/JavaType;
    :cond_53
    const-class v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_61

    .line 398
    new-instance v10, Lcom/fasterxml/jackson/databind/ser/std/ByteBufferSerializer;

    .end local v10    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-direct {v10}, Lcom/fasterxml/jackson/databind/ser/std/ByteBufferSerializer;-><init>()V

    goto :goto_b

    .line 400
    .restart local v10    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_61
    const-class v1, Ljava/net/InetAddress;

    invoke-virtual {v1, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_6f

    .line 401
    new-instance v10, Lcom/fasterxml/jackson/databind/ser/std/InetAddressSerializer;

    .end local v10    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-direct {v10}, Lcom/fasterxml/jackson/databind/ser/std/InetAddressSerializer;-><init>()V

    goto :goto_b

    .line 403
    .restart local v10    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_6f
    const-class v1, Ljava/net/InetSocketAddress;

    invoke-virtual {v1, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_7d

    .line 404
    new-instance v10, Lcom/fasterxml/jackson/databind/ser/std/InetSocketAddressSerializer;

    .end local v10    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-direct {v10}, Lcom/fasterxml/jackson/databind/ser/std/InetSocketAddressSerializer;-><init>()V

    goto :goto_b

    .line 406
    .restart local v10    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_7d
    const-class v1, Ljava/util/TimeZone;

    invoke-virtual {v1, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_8b

    .line 407
    new-instance v10, Lcom/fasterxml/jackson/databind/ser/std/TimeZoneSerializer;

    .end local v10    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-direct {v10}, Lcom/fasterxml/jackson/databind/ser/std/TimeZoneSerializer;-><init>()V

    goto :goto_b

    .line 409
    .restart local v10    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_8b
    const-class v1, Ljava/nio/charset/Charset;

    invoke-virtual {v1, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_97

    .line 410
    sget-object v10, Lcom/fasterxml/jackson/databind/ser/std/ToStringSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/ToStringSerializer;

    goto/16 :goto_b

    .line 412
    :cond_97
    const-class v1, Ljava/lang/Number;

    invoke-virtual {v1, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_bf

    .line 414
    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/databind/BeanDescription;->findExpectedFormat(Lcom/fasterxml/jackson/annotation/JsonFormat$Value;)Lcom/fasterxml/jackson/annotation/JsonFormat$Value;

    move-result-object v7

    .line 415
    .local v7, "format":Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    if-eqz v7, :cond_b4

    .line 416
    sget-object v1, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory$1;->$SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape:[I

    invoke-virtual {v7}, Lcom/fasterxml/jackson/annotation/JsonFormat$Value;->getShape()Lcom/fasterxml/jackson/annotation/JsonFormat$Shape;

    move-result-object v2

    invoke-virtual {v2}, Lcom/fasterxml/jackson/annotation/JsonFormat$Shape;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_d4

    .line 425
    :cond_b4
    sget-object v10, Lcom/fasterxml/jackson/databind/ser/std/NumberSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/NumberSerializer;

    goto/16 :goto_b

    .line 418
    :pswitch_b8
    sget-object v10, Lcom/fasterxml/jackson/databind/ser/std/ToStringSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/ToStringSerializer;

    goto/16 :goto_b

    :pswitch_bc
    move-object v10, v0

    .line 421
    goto/16 :goto_b

    .line 427
    .end local v7    # "format":Lcom/fasterxml/jackson/annotation/JsonFormat$Value;
    :cond_bf
    const-class v1, Ljava/lang/Enum;

    invoke-virtual {v1, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_d1

    .line 428
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->buildEnumSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v10

    goto/16 :goto_b

    :cond_d1
    move-object v10, v0

    .line 430
    goto/16 :goto_b

    .line 416
    :pswitch_data_d4
    .packed-switch 0x1
        :pswitch_b8
        :pswitch_bc
        :pswitch_bc
    .end packed-switch
.end method

.method protected findSerializerFromAnnotation(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 6
    .param p1, "prov"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/SerializerProvider;",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
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
    .line 488
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findSerializer(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Object;

    move-result-object v1

    .line 489
    .local v1, "serDef":Ljava/lang/Object;
    if-nez v1, :cond_c

    .line 490
    const/4 v2, 0x0

    .line 494
    :goto_b
    return-object v2

    .line 492
    :cond_c
    invoke-virtual {p1, p2, v1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->serializerInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 494
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    invoke-virtual {p0, p1, p2, v0}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->findConvertingSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v2

    goto :goto_b
.end method

.method protected findSuppressableContentValue(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanDescription;)Ljava/lang/Object;
    .registers 7
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "contentType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p3, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 783
    invoke-virtual {p3, v1}, Lcom/fasterxml/jackson/databind/BeanDescription;->findSerializationInclusionForContent(Lcom/fasterxml/jackson/annotation/JsonInclude$Include;)Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    move-result-object v0

    .line 785
    .local v0, "incl":Lcom/fasterxml/jackson/annotation/JsonInclude$Include;
    if-eqz v0, :cond_13

    .line 786
    sget-object v1, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory$1;->$SwitchMap$com$fasterxml$jackson$annotation$JsonInclude$Include:[I

    invoke-virtual {v0}, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_18

    :goto_12
    move-object v1, v0

    .line 797
    :cond_13
    return-object v1

    .line 789
    :pswitch_14
    sget-object v0, Lcom/fasterxml/jackson/annotation/JsonInclude$Include;->NON_EMPTY:Lcom/fasterxml/jackson/annotation/JsonInclude$Include;

    .line 790
    goto :goto_12

    .line 786
    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_14
    .end packed-switch
.end method

.method public getFactoryConfig()Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    return-object v0
.end method

.method protected isIndexedList(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 701
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/util/RandomAccess;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method protected modifyTypeByAnnotation(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;
    .registers 9
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "a"    # Lcom/fasterxml/jackson/databind/introspect/Annotated;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            ">(",
            "Lcom/fasterxml/jackson/databind/SerializationConfig;",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 954
    .local p3, "type":Lcom/fasterxml/jackson/databind/JavaType;, "TT;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findSerializationType(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Ljava/lang/Class;

    move-result-object v1

    .line 955
    .local v1, "superclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_e

    .line 957
    :try_start_a
    invoke-virtual {p3, v1}, Lcom/fasterxml/jackson/databind/JavaType;->widenBy(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;
    :try_end_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a .. :try_end_d} :catch_13

    move-result-object p3

    .line 962
    :cond_e
    invoke-static {p1, p2, p3}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->modifySecondaryTypesByAnnotation(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/introspect/Annotated;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v2

    return-object v2

    .line 958
    :catch_13
    move-exception v0

    .line 959
    .local v0, "iae":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to widen type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " with concrete-type annotation (value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "), method \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/introspect/Annotated;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\': "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected usesStaticTyping(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/BeanDescription;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)Z
    .registers 8
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "beanDesc"    # Lcom/fasterxml/jackson/databind/BeanDescription;
    .param p3, "typeSer"    # Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    .prologue
    const/4 v2, 0x0

    .line 1054
    if-eqz p3, :cond_4

    .line 1062
    :cond_3
    :goto_3
    return v2

    .line 1057
    :cond_4
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v0

    .line 1058
    .local v0, "intr":Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/BeanDescription;->getClassInfo()Lcom/fasterxml/jackson/databind/introspect/AnnotatedClass;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/fasterxml/jackson/databind/AnnotationIntrospector;->findSerializationTyping(Lcom/fasterxml/jackson/databind/introspect/Annotated;)Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Typing;

    move-result-object v1

    .line 1059
    .local v1, "t":Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Typing;
    if-eqz v1, :cond_1c

    sget-object v3, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Typing;->DEFAULT_TYPING:Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Typing;

    if-eq v1, v3, :cond_1c

    .line 1060
    sget-object v3, Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Typing;->STATIC:Lcom/fasterxml/jackson/databind/annotation/JsonSerialize$Typing;

    if-ne v1, v3, :cond_3

    const/4 v2, 0x1

    goto :goto_3

    .line 1062
    :cond_1c
    sget-object v2, Lcom/fasterxml/jackson/databind/MapperFeature;->USE_STATIC_TYPING:Lcom/fasterxml/jackson/databind/MapperFeature;

    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/MapperFeature;)Z

    move-result v2

    goto :goto_3
.end method

.method public final withAdditionalKeySerializers(Lcom/fasterxml/jackson/databind/ser/Serializers;)Lcom/fasterxml/jackson/databind/ser/SerializerFactory;
    .registers 3
    .param p1, "additional"    # Lcom/fasterxml/jackson/databind/ser/Serializers;

    .prologue
    .line 178
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->withAdditionalKeySerializers(Lcom/fasterxml/jackson/databind/ser/Serializers;)Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->withConfig(Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;)Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    move-result-object v0

    return-object v0
.end method

.method public final withAdditionalSerializers(Lcom/fasterxml/jackson/databind/ser/Serializers;)Lcom/fasterxml/jackson/databind/ser/SerializerFactory;
    .registers 3
    .param p1, "additional"    # Lcom/fasterxml/jackson/databind/ser/Serializers;

    .prologue
    .line 169
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->withAdditionalSerializers(Lcom/fasterxml/jackson/databind/ser/Serializers;)Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->withConfig(Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;)Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    move-result-object v0

    return-object v0
.end method

.method public abstract withConfig(Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;)Lcom/fasterxml/jackson/databind/ser/SerializerFactory;
.end method

.method public final withSerializerModifier(Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;)Lcom/fasterxml/jackson/databind/ser/SerializerFactory;
    .registers 3
    .param p1, "modifier"    # Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;

    .prologue
    .line 187
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->_factoryConfig:Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;->withSerializerModifier(Lcom/fasterxml/jackson/databind/ser/BeanSerializerModifier;)Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ser/BasicSerializerFactory;->withConfig(Lcom/fasterxml/jackson/databind/cfg/SerializerFactoryConfig;)Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    move-result-object v0

    return-object v0
.end method
