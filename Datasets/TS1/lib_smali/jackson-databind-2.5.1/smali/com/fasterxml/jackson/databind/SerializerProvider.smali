.class public abstract Lcom/fasterxml/jackson/databind/SerializerProvider;
.super Lcom/fasterxml/jackson/databind/DatabindContext;
.source "SerializerProvider.java"


# static fields
.field protected static final CACHE_UNKNOWN_MAPPINGS:Z

.field public static final DEFAULT_NULL_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected static final DEFAULT_UNKNOWN_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected transient _attributes:Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;

.field protected final _config:Lcom/fasterxml/jackson/databind/SerializationConfig;

.field protected _dateFormat:Ljava/text/DateFormat;

.field protected _keySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected final _knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

.field protected _nullKeySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected _nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected final _rootNames:Lcom/fasterxml/jackson/databind/util/RootNameLookup;

.field protected final _serializationView:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected final _serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

.field protected final _serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

.field protected final _stdNullValueSerializer:Z

.field protected _unknownTypeSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;
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
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 47
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/impl/FailingSerializer;

    const-string v1, "Null key for a Map not allowed in JSON (use a converting NullKeySerializer?)"

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/databind/ser/impl/FailingSerializer;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/SerializerProvider;->DEFAULT_NULL_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 53
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/impl/UnknownSerializer;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ser/impl/UnknownSerializer;-><init>()V

    sput-object v0, Lcom/fasterxml/jackson/databind/SerializerProvider;->DEFAULT_UNKNOWN_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 182
    invoke-direct {p0}, Lcom/fasterxml/jackson/databind/DatabindContext;-><init>()V

    .line 120
    sget-object v0, Lcom/fasterxml/jackson/databind/SerializerProvider;->DEFAULT_UNKNOWN_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_unknownTypeSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 133
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/NullSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/NullSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 142
    sget-object v0, Lcom/fasterxml/jackson/databind/SerializerProvider;->DEFAULT_NULL_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullKeySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 183
    iput-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 184
    iput-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    .line 185
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    .line 187
    iput-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    .line 188
    new-instance v0, Lcom/fasterxml/jackson/databind/util/RootNameLookup;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/util/RootNameLookup;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_rootNames:Lcom/fasterxml/jackson/databind/util/RootNameLookup;

    .line 190
    iput-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializationView:Ljava/lang/Class;

    .line 191
    iput-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_attributes:Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;

    .line 194
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_stdNullValueSerializer:Z

    .line 195
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/SerializerProvider;)V
    .registers 4
    .param p1, "src"    # Lcom/fasterxml/jackson/databind/SerializerProvider;

    .prologue
    const/4 v1, 0x0

    .line 236
    invoke-direct {p0}, Lcom/fasterxml/jackson/databind/DatabindContext;-><init>()V

    .line 120
    sget-object v0, Lcom/fasterxml/jackson/databind/SerializerProvider;->DEFAULT_UNKNOWN_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_unknownTypeSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 133
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/NullSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/NullSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 142
    sget-object v0, Lcom/fasterxml/jackson/databind/SerializerProvider;->DEFAULT_NULL_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullKeySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 238
    iput-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 239
    iput-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializationView:Ljava/lang/Class;

    .line 240
    iput-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    .line 241
    iput-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    .line 244
    new-instance v0, Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    .line 245
    new-instance v0, Lcom/fasterxml/jackson/databind/util/RootNameLookup;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/util/RootNameLookup;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_rootNames:Lcom/fasterxml/jackson/databind/util/RootNameLookup;

    .line 247
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/SerializerProvider;->_unknownTypeSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_unknownTypeSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 248
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/SerializerProvider;->_keySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_keySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 249
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 250
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullKeySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullKeySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 252
    iget-boolean v0, p1, Lcom/fasterxml/jackson/databind/SerializerProvider;->_stdNullValueSerializer:Z

    iput-boolean v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_stdNullValueSerializer:Z

    .line 253
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/ser/SerializerFactory;)V
    .registers 6
    .param p1, "src"    # Lcom/fasterxml/jackson/databind/SerializerProvider;
    .param p2, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p3, "f"    # Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    .prologue
    .line 204
    invoke-direct {p0}, Lcom/fasterxml/jackson/databind/DatabindContext;-><init>()V

    .line 120
    sget-object v0, Lcom/fasterxml/jackson/databind/SerializerProvider;->DEFAULT_UNKNOWN_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_unknownTypeSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 133
    sget-object v0, Lcom/fasterxml/jackson/databind/ser/std/NullSerializer;->instance:Lcom/fasterxml/jackson/databind/ser/std/NullSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 142
    sget-object v0, Lcom/fasterxml/jackson/databind/SerializerProvider;->DEFAULT_NULL_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullKeySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 205
    if-nez p2, :cond_17

    .line 206
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 208
    :cond_17
    iput-object p3, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    .line 209
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 211
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    .line 212
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/SerializerProvider;->_unknownTypeSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_unknownTypeSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 213
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/SerializerProvider;->_keySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_keySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 214
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 215
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullKeySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullKeySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 217
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    sget-object v1, Lcom/fasterxml/jackson/databind/SerializerProvider;->DEFAULT_NULL_KEY_SERIALIZER:Lcom/fasterxml/jackson/databind/JsonSerializer;

    if-ne v0, v1, :cond_51

    const/4 v0, 0x1

    :goto_36
    iput-boolean v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_stdNullValueSerializer:Z

    .line 219
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/SerializerProvider;->_rootNames:Lcom/fasterxml/jackson/databind/util/RootNameLookup;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_rootNames:Lcom/fasterxml/jackson/databind/util/RootNameLookup;

    .line 224
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->getReadOnlyLookupMap()Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    .line 226
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getActiveView()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializationView:Ljava/lang/Class;

    .line 227
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAttributes()Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_attributes:Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;

    .line 228
    return-void

    .line 217
    :cond_51
    const/4 v0, 0x0

    goto :goto_36
.end method


# virtual methods
.method protected _createAndCacheUntypedSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 7
    .param p1, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 1131
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_createUntypedSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_3} :catch_c

    move-result-object v1

    .line 1139
    .local v1, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-eqz v1, :cond_b

    .line 1140
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v2, p1, v1, p0}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->addAndResolveNonTypedSerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    .line 1142
    :cond_b
    return-object v1

    .line 1132
    .end local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :catch_c
    move-exception v0

    .line 1136
    .local v0, "iae":Ljava/lang/IllegalArgumentException;
    new-instance v2, Lcom/fasterxml/jackson/databind/JsonMappingException;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v0}, Lcom/fasterxml/jackson/databind/JsonMappingException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected _createAndCacheUntypedSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
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
    .line 1112
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v2, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->constructType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_createUntypedSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    :try_end_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_9} :catch_12

    move-result-object v1

    .line 1120
    .local v1, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-eqz v1, :cond_11

    .line 1121
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v2, p1, v1, p0}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->addAndResolveNonTypedSerializer(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    .line 1123
    :cond_11
    return-object v1

    .line 1113
    .end local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :catch_12
    move-exception v0

    .line 1117
    .local v0, "iae":Ljava/lang/IllegalArgumentException;
    new-instance v2, Lcom/fasterxml/jackson/databind/JsonMappingException;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v0}, Lcom/fasterxml/jackson/databind/JsonMappingException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonLocation;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected _createUntypedSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 3
    .param p1, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 1152
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    invoke-virtual {v0, p0, p1}, Lcom/fasterxml/jackson/databind/ser/SerializerFactory;->createSerializer(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    return-object v0
.end method

.method protected final _dateFormat()Ljava/text/DateFormat;
    .registers 3

    .prologue
    .line 1188
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_dateFormat:Ljava/text/DateFormat;

    if-eqz v1, :cond_7

    .line 1189
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_dateFormat:Ljava/text/DateFormat;

    .line 1198
    :goto_6
    return-object v0

    .line 1196
    :cond_7
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getDateFormat()Ljava/text/DateFormat;

    move-result-object v0

    .line 1197
    .local v0, "df":Ljava/text/DateFormat;
    invoke-virtual {v0}, Ljava/text/DateFormat;->clone()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "df":Ljava/text/DateFormat;
    check-cast v0, Ljava/text/DateFormat;

    .restart local v0    # "df":Ljava/text/DateFormat;
    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_dateFormat:Ljava/text/DateFormat;

    goto :goto_6
.end method

.method protected _findExplicitUntypedSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
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
    .line 1077
    .local p1, "runtimeType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;->untypedValueSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 1078
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v0, :cond_1c

    .line 1080
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->untypedValueSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 1081
    if-nez v0, :cond_1c

    .line 1082
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_createAndCacheUntypedSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 1088
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->isUnknownTypeSerializer(Lcom/fasterxml/jackson/databind/JsonSerializer;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 1089
    const/4 v1, 0x0

    .line 1093
    :goto_1b
    return-object v1

    :cond_1c
    move-object v1, v0

    goto :goto_1b
.end method

.method protected _handleContextualResolvable(Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 4
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
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
    .line 1164
    .local p1, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    instance-of v0, p1, Lcom/fasterxml/jackson/databind/ser/ResolvableSerializer;

    if-eqz v0, :cond_a

    move-object v0, p1

    .line 1165
    check-cast v0, Lcom/fasterxml/jackson/databind/ser/ResolvableSerializer;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/databind/ser/ResolvableSerializer;->resolve(Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    .line 1167
    :cond_a
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->handleSecondaryContextualization(Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    return-object v0
.end method

.method protected _handleResolvable(Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;)",
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
    .line 1174
    .local p1, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    instance-of v0, p1, Lcom/fasterxml/jackson/databind/ser/ResolvableSerializer;

    if-eqz v0, :cond_a

    move-object v0, p1

    .line 1175
    check-cast v0, Lcom/fasterxml/jackson/databind/ser/ResolvableSerializer;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/databind/ser/ResolvableSerializer;->resolve(Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    .line 1177
    :cond_a
    return-object p1
.end method

.method protected _reportIncompatibleRootType(Ljava/lang/Object;Lcom/fasterxml/jackson/databind/JavaType;)V
    .registers 7
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "rootType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 1055
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 1056
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lcom/fasterxml/jackson/databind/util/ClassUtil;->wrapperType(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 1058
    .local v0, "wrapperType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 1059
    return-void

    .line 1062
    .end local v0    # "wrapperType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_19
    new-instance v1, Lcom/fasterxml/jackson/databind/JsonMappingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Incompatible types: declared root type ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") vs "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/fasterxml/jackson/databind/JsonMappingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public defaultSerializeDateKey(JLcom/fasterxml/jackson/core/JsonGenerator;)V
    .registers 6
    .param p1, "timestamp"    # J
    .param p3, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 1011
    sget-object v0, Lcom/fasterxml/jackson/databind/SerializationFeature;->WRITE_DATE_KEYS_AS_TIMESTAMPS:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 1012
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 1016
    :goto_f
    return-void

    .line 1014
    :cond_10
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_dateFormat()Ljava/text/DateFormat;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    goto :goto_f
.end method

.method public defaultSerializeDateKey(Ljava/util/Date;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .registers 5
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 1026
    sget-object v0, Lcom/fasterxml/jackson/databind/SerializationFeature;->WRITE_DATE_KEYS_AS_TIMESTAMPS:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 1027
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 1031
    :goto_13
    return-void

    .line 1029
    :cond_14
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_dateFormat()Ljava/text/DateFormat;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    goto :goto_13
.end method

.method public final defaultSerializeDateValue(JLcom/fasterxml/jackson/core/JsonGenerator;)V
    .registers 6
    .param p1, "timestamp"    # J
    .param p3, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 978
    sget-object v0, Lcom/fasterxml/jackson/databind/SerializationFeature;->WRITE_DATES_AS_TIMESTAMPS:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 979
    invoke-virtual {p3, p1, p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumber(J)V

    .line 983
    :goto_b
    return-void

    .line 981
    :cond_c
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_dateFormat()Ljava/text/DateFormat;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto :goto_b
.end method

.method public final defaultSerializeDateValue(Ljava/util/Date;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .registers 5
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 996
    sget-object v0, Lcom/fasterxml/jackson/databind/SerializationFeature;->WRITE_DATES_AS_TIMESTAMPS:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 997
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumber(J)V

    .line 1001
    :goto_f
    return-void

    .line 999
    :cond_10
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_dateFormat()Ljava/text/DateFormat;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto :goto_f
.end method

.method public final defaultSerializeField(Ljava/lang/String;Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .registers 7
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 945
    invoke-virtual {p3, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 946
    if-nez p2, :cond_14

    .line 950
    iget-boolean v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_stdNullValueSerializer:Z

    if-eqz v1, :cond_e

    .line 951
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNull()V

    .line 959
    :goto_d
    return-void

    .line 953
    :cond_e
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    invoke-virtual {v1, v2, p3, p0}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    goto :goto_d

    .line 956
    :cond_14
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 957
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->findTypedValueSerializer(Ljava/lang/Class;ZLcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v1

    invoke-virtual {v1, p2, p3, p0}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    goto :goto_d
.end method

.method public final defaultSerializeNull(Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .registers 4
    .param p1, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 1036
    iget-boolean v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_stdNullValueSerializer:Z

    if-eqz v0, :cond_8

    .line 1037
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNull()V

    .line 1041
    :goto_7
    return-void

    .line 1039
    :cond_8
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1, p0}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    goto :goto_7
.end method

.method public final defaultSerializeValue(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "jgen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 925
    if-nez p1, :cond_11

    .line 926
    iget-boolean v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_stdNullValueSerializer:Z

    if-eqz v1, :cond_b

    .line 927
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNull()V

    .line 935
    :goto_a
    return-void

    .line 929
    :cond_b
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    invoke-virtual {v1, v2, p2, p0}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    goto :goto_a

    .line 932
    :cond_11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 933
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->findTypedValueSerializer(Ljava/lang/Class;ZLcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p0}, Lcom/fasterxml/jackson/databind/JsonSerializer;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/fasterxml/jackson/databind/SerializerProvider;)V

    goto :goto_a
.end method

.method public findKeySerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 7
    .param p1, "keyType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
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
    .line 740
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_keySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    invoke-virtual {v1, v2, p1, v3}, Lcom/fasterxml/jackson/databind/ser/SerializerFactory;->createKeySerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 742
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    invoke-virtual {p0, v0, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_handleContextualResolvable(Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v1

    return-object v1
.end method

.method public findNullKeySerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 4
    .param p1, "serializationType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
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
    .line 786
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullKeySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    return-object v0
.end method

.method public findNullValueSerializer(Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 3
    .param p1, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
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
    .line 802
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    return-object v0
.end method

.method public abstract findObjectId(Ljava/lang/Object;Lcom/fasterxml/jackson/annotation/ObjectIdGenerator;)Lcom/fasterxml/jackson/databind/ser/impl/WritableObjectId;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/fasterxml/jackson/annotation/ObjectIdGenerator",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/ser/impl/WritableObjectId;"
        }
    .end annotation
.end method

.method public findPrimaryPropertySerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 5
    .param p1, "valueType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
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
    .line 592
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;->untypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 593
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v0, :cond_20

    .line 594
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->untypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 595
    if-nez v0, :cond_20

    .line 596
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_createAndCacheUntypedSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 597
    if-nez v0, :cond_20

    .line 598
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getUnknownTypeSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    move-object v1, v0

    .line 607
    :goto_1f
    return-object v1

    :cond_20
    invoke-virtual {p0, v0, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->handlePrimaryContextualization(Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v1

    goto :goto_1f
.end method

.method public findPrimaryPropertySerializer(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 6
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
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
    .line 618
    .local p1, "valueType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;->untypedValueSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 619
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v0, :cond_2a

    .line 620
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->untypedValueSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 621
    if-nez v0, :cond_2a

    .line 622
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v2, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->constructType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->untypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 623
    if-nez v0, :cond_2a

    .line 624
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_createAndCacheUntypedSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 625
    if-nez v0, :cond_2a

    .line 626
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getUnknownTypeSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    move-object v1, v0

    .line 635
    :goto_29
    return-object v1

    :cond_2a
    invoke-virtual {p0, v0, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->handlePrimaryContextualization(Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v1

    goto :goto_29
.end method

.method public findTypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 9
    .param p1, "valueType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "cache"    # Z
    .param p3, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Z",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
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
    .line 703
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    invoke-virtual {v3, p1}, Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;->typedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 704
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-eqz v0, :cond_a

    move-object v1, v0

    .line 723
    .end local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .local v1, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :goto_9
    return-object v1

    .line 708
    .end local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :cond_a
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v3, p1}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->typedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 709
    if-eqz v0, :cond_14

    move-object v1, v0

    .line 710
    .end local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    goto :goto_9

    .line 714
    .end local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :cond_14
    invoke-virtual {p0, p1, p3}, Lcom/fasterxml/jackson/databind/SerializerProvider;->findValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 715
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    iget-object v4, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v3, v4, p1}, Lcom/fasterxml/jackson/databind/ser/SerializerFactory;->createTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v2

    .line 716
    .local v2, "typeSer":Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    if-eqz v2, :cond_2c

    .line 717
    invoke-virtual {v2, p3}, Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;->forProperty(Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v2

    .line 718
    new-instance v1, Lcom/fasterxml/jackson/databind/ser/impl/TypeWrappedSerializer;

    invoke-direct {v1, v2, v0}, Lcom/fasterxml/jackson/databind/ser/impl/TypeWrappedSerializer;-><init>(Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    .end local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    move-object v0, v1

    .line 720
    .end local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :cond_2c
    if-eqz p2, :cond_33

    .line 721
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v3, p1, v0}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->addTypedSerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    :cond_33
    move-object v1, v0

    .line 723
    .end local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    goto :goto_9
.end method

.method public findTypedValueSerializer(Ljava/lang/Class;ZLcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 10
    .param p2, "cache"    # Z
    .param p3, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
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
    .line 658
    .local p1, "valueType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    invoke-virtual {v3, p1}, Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;->typedValueSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 659
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-eqz v0, :cond_a

    move-object v1, v0

    .line 679
    .end local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .local v1, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :goto_9
    return-object v1

    .line 663
    .end local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :cond_a
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v3, p1}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->typedValueSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 664
    if-eqz v0, :cond_14

    move-object v1, v0

    .line 665
    .end local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    goto :goto_9

    .line 669
    .end local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :cond_14
    invoke-virtual {p0, p1, p3}, Lcom/fasterxml/jackson/databind/SerializerProvider;->findValueSerializer(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 670
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    iget-object v4, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    iget-object v5, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v5, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->constructType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/fasterxml/jackson/databind/ser/SerializerFactory;->createTypeSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v2

    .line 672
    .local v2, "typeSer":Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;
    if-eqz v2, :cond_32

    .line 673
    invoke-virtual {v2, p3}, Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;->forProperty(Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v2

    .line 674
    new-instance v1, Lcom/fasterxml/jackson/databind/ser/impl/TypeWrappedSerializer;

    invoke-direct {v1, v2, v0}, Lcom/fasterxml/jackson/databind/ser/impl/TypeWrappedSerializer;-><init>(Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    .end local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    move-object v0, v1

    .line 676
    .end local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :cond_32
    if-eqz p2, :cond_39

    .line 677
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v3, p1, v0}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->addTypedSerializer(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    :cond_39
    move-object v1, v0

    .line 679
    .end local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    .restart local v1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    goto :goto_9
.end method

.method public findValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 4
    .param p1, "valueType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 560
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;->untypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 561
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v0, :cond_1e

    .line 562
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->untypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 563
    if-nez v0, :cond_1e

    .line 564
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_createAndCacheUntypedSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 565
    if-nez v0, :cond_1e

    .line 566
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getUnknownTypeSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 573
    :cond_1e
    return-object v0
.end method

.method public findValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 5
    .param p1, "valueType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
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
    .line 503
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;->untypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 504
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v0, :cond_20

    .line 505
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->untypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 506
    if-nez v0, :cond_20

    .line 507
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_createAndCacheUntypedSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 508
    if-nez v0, :cond_20

    .line 509
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->getRawClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getUnknownTypeSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    move-object v1, v0

    .line 517
    :goto_1f
    return-object v1

    :cond_20
    invoke-virtual {p0, v0, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->handleSecondaryContextualization(Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v1

    goto :goto_1f
.end method

.method public findValueSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
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
    .line 530
    .local p1, "valueType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;->untypedValueSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 531
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v0, :cond_28

    .line 532
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->untypedValueSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 533
    if-nez v0, :cond_28

    .line 534
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v2, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->constructType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->untypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 535
    if-nez v0, :cond_28

    .line 536
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_createAndCacheUntypedSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 537
    if-nez v0, :cond_28

    .line 538
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getUnknownTypeSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 546
    :cond_28
    return-object v0
.end method

.method public findValueSerializer(Ljava/lang/Class;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 6
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/fasterxml/jackson/databind/BeanProperty;",
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
    .line 462
    .local p1, "valueType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_knownSerializers:Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap;->untypedValueSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 463
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez v0, :cond_2a

    .line 465
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->untypedValueSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 466
    if-nez v0, :cond_2a

    .line 468
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializerCache:Lcom/fasterxml/jackson/databind/ser/SerializerCache;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v2, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->constructType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/databind/ser/SerializerCache;->untypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 469
    if-nez v0, :cond_2a

    .line 471
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->_createAndCacheUntypedSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 473
    if-nez v0, :cond_2a

    .line 474
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getUnknownTypeSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    move-object v1, v0

    .line 485
    :goto_29
    return-object v1

    :cond_2a
    invoke-virtual {p0, v0, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->handleSecondaryContextualization(Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v1

    goto :goto_29
.end method

.method public final getActiveView()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 332
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializationView:Ljava/lang/Class;

    return-object v0
.end method

.method public final getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;
    .registers 2

    .prologue
    .line 323
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAnnotationIntrospector()Lcom/fasterxml/jackson/databind/AnnotationIntrospector;

    move-result-object v0

    return-object v0
.end method

.method public getAttribute(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 348
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_attributes:Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;->getAttribute(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;
    .registers 2

    .prologue
    .line 319
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    return-object v0
.end method

.method public bridge synthetic getConfig()Lcom/fasterxml/jackson/databind/cfg/MapperConfig;
    .registers 2

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/SerializerProvider;->getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultNullKeySerializer()Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 755
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullKeySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    return-object v0
.end method

.method public getDefaultNullValueSerializer()Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 762
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    return-object v0
.end method

.method public final getFilterProvider()Lcom/fasterxml/jackson/databind/ser/FilterProvider;
    .registers 2

    .prologue
    .line 394
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getFilterProvider()Lcom/fasterxml/jackson/databind/ser/FilterProvider;

    move-result-object v0

    return-object v0
.end method

.method public getLocale()Ljava/util/Locale;
    .registers 2

    .prologue
    .line 404
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getLocale()Ljava/util/Locale;

    move-result-object v0

    return-object v0
.end method

.method public final getSerializationView()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 338
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_serializationView:Ljava/lang/Class;

    return-object v0
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .registers 2

    .prologue
    .line 414
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    return-object v0
.end method

.method public final getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;
    .registers 2

    .prologue
    .line 328
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v0

    return-object v0
.end method

.method public getUnknownTypeSerializer(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 818
    .local p1, "unknownType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_unknownTypeSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    return-object v0
.end method

.method public handlePrimaryContextualization(Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 4
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;",
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
    .line 873
    .local p1, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    if-eqz p1, :cond_c

    .line 874
    instance-of v0, p1, Lcom/fasterxml/jackson/databind/ser/ContextualSerializer;

    if-eqz v0, :cond_c

    .line 875
    check-cast p1, Lcom/fasterxml/jackson/databind/ser/ContextualSerializer;

    .end local p1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-interface {p1, p0, p2}, Lcom/fasterxml/jackson/databind/ser/ContextualSerializer;->createContextual(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object p1

    .line 878
    .restart local p1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_c
    return-object p1
.end method

.method public handleSecondaryContextualization(Lcom/fasterxml/jackson/databind/JsonSerializer;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .registers 4
    .param p2, "property"    # Lcom/fasterxml/jackson/databind/BeanProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;",
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
    .line 901
    .local p1, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    if-eqz p1, :cond_c

    .line 902
    instance-of v0, p1, Lcom/fasterxml/jackson/databind/ser/ContextualSerializer;

    if-eqz v0, :cond_c

    .line 903
    check-cast p1, Lcom/fasterxml/jackson/databind/ser/ContextualSerializer;

    .end local p1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    invoke-interface {p1, p0, p2}, Lcom/fasterxml/jackson/databind/ser/ContextualSerializer;->createContextual(Lcom/fasterxml/jackson/databind/SerializerProvider;Lcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object p1

    .line 906
    .restart local p1    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    :cond_c
    return-object p1
.end method

.method public final hasSerializationFeatures(I)Z
    .registers 3
    .param p1, "featureMask"    # I

    .prologue
    .line 383
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->hasSerializationFeatures(I)Z

    move-result v0

    return v0
.end method

.method public final isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z
    .registers 3
    .param p1, "feature"    # Lcom/fasterxml/jackson/databind/SerializationFeature;

    .prologue
    .line 373
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v0

    return v0
.end method

.method public isUnknownTypeSerializer(Lcom/fasterxml/jackson/databind/JsonSerializer;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 829
    .local p1, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<*>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_unknownTypeSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    if-eq p1, v0, :cond_6

    if-nez p1, :cond_8

    :cond_6
    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public abstract serializerInstance(Lcom/fasterxml/jackson/databind/introspect/Annotated;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/JsonSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/introspect/Annotated;",
            "Ljava/lang/Object;",
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

.method public bridge synthetic setAttribute(Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/DatabindContext;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 37
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/SerializerProvider;->setAttribute(Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/SerializerProvider;

    move-result-object v0

    return-object v0
.end method

.method public setAttribute(Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/SerializerProvider;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 354
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_attributes:Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;

    invoke-virtual {v0, p1, p2}, Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;->withPerCallAttribute(Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_attributes:Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;

    .line 355
    return-object p0
.end method

.method public setDefaultKeySerializer(Lcom/fasterxml/jackson/databind/JsonSerializer;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 269
    .local p1, "ks":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez p1, :cond_a

    .line 270
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can not pass null JsonSerializer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 272
    :cond_a
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_keySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 273
    return-void
.end method

.method public setNullKeySerializer(Lcom/fasterxml/jackson/databind/JsonSerializer;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 303
    .local p1, "nks":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez p1, :cond_a

    .line 304
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can not pass null JsonSerializer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 306
    :cond_a
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullKeySerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 307
    return-void
.end method

.method public setNullValueSerializer(Lcom/fasterxml/jackson/databind/JsonSerializer;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JsonSerializer",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 286
    .local p1, "nvs":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    if-nez p1, :cond_a

    .line 287
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can not pass null JsonSerializer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 289
    :cond_a
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/SerializerProvider;->_nullValueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    .line 290
    return-void
.end method
