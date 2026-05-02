.class public Lcom/fasterxml/jackson/databind/ObjectWriter;
.super Ljava/lang/Object;
.source "ObjectWriter.java"

# interfaces
.implements Lcom/fasterxml/jackson/core/Versioned;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;,
        Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;
    }
.end annotation


# static fields
.field protected static final NULL_PRETTY_PRINTER:Lcom/fasterxml/jackson/core/PrettyPrinter;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected final _config:Lcom/fasterxml/jackson/databind/SerializationConfig;

.field protected final _generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

.field protected final _generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

.field protected final _prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

.field protected final _serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

.field protected final _serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    new-instance v0, Lcom/fasterxml/jackson/core/util/MinimalPrettyPrinter;

    invoke-direct {v0}, Lcom/fasterxml/jackson/core/util/MinimalPrettyPrinter;-><init>()V

    sput-object v0, Lcom/fasterxml/jackson/databind/ObjectWriter;->NULL_PRETTY_PRINTER:Lcom/fasterxml/jackson/core/PrettyPrinter;

    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/ObjectMapper;Lcom/fasterxml/jackson/databind/SerializationConfig;)V
    .registers 4
    .param p1, "mapper"    # Lcom/fasterxml/jackson/databind/ObjectMapper;
    .param p2, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;

    .prologue
    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 119
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectMapper;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    .line 120
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectMapper;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    .line 121
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectMapper;->_jsonFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 123
    sget-object v0, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->empty:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    .line 124
    sget-object v0, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->empty:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    .line 125
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/ObjectMapper;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/core/FormatSchema;)V
    .registers 6
    .param p1, "mapper"    # Lcom/fasterxml/jackson/databind/ObjectMapper;
    .param p2, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p3, "s"    # Lcom/fasterxml/jackson/core/FormatSchema;

    .prologue
    const/4 v1, 0x0

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 135
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectMapper;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    .line 136
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectMapper;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    .line 137
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectMapper;->_jsonFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 139
    sget-object v0, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->empty:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    .line 140
    if-nez p3, :cond_1d

    sget-object v0, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->empty:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    :goto_1a
    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    .line 142
    return-void

    .line 140
    :cond_1d
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    invoke-direct {v0, v1, p3, v1, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;-><init>(Lcom/fasterxml/jackson/core/PrettyPrinter;Lcom/fasterxml/jackson/core/FormatSchema;Lcom/fasterxml/jackson/core/io/CharacterEscapes;Lcom/fasterxml/jackson/core/SerializableString;)V

    goto :goto_1a
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/ObjectMapper;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/core/PrettyPrinter;)V
    .registers 7
    .param p1, "mapper"    # Lcom/fasterxml/jackson/databind/ObjectMapper;
    .param p2, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p3, "rootType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p4, "pp"    # Lcom/fasterxml/jackson/core/PrettyPrinter;

    .prologue
    const/4 v1, 0x0

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 98
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectMapper;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    .line 99
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectMapper;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    .line 100
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectMapper;->_jsonFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 101
    if-nez p4, :cond_27

    sget-object v0, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->empty:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    :goto_16
    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    .line 105
    if-eqz p3, :cond_22

    const-class v0, Ljava/lang/Object;

    invoke-virtual {p3, v0}, Lcom/fasterxml/jackson/databind/JavaType;->hasRawClass(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 106
    :cond_22
    sget-object v0, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->empty:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    .line 111
    :goto_26
    return-void

    .line 101
    :cond_27
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    invoke-direct {v0, p4, v1, v1, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;-><init>(Lcom/fasterxml/jackson/core/PrettyPrinter;Lcom/fasterxml/jackson/core/FormatSchema;Lcom/fasterxml/jackson/core/io/CharacterEscapes;Lcom/fasterxml/jackson/core/SerializableString;)V

    goto :goto_16

    .line 108
    :cond_2d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/databind/JavaType;->withStaticTyping()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object p3

    .line 109
    invoke-virtual {p0, p2, p3}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetchRootSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    goto :goto_26
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/core/JsonFactory;)V
    .registers 6
    .param p1, "base"    # Lcom/fasterxml/jackson/databind/ObjectWriter;
    .param p2, "f"    # Lcom/fasterxml/jackson/core/JsonFactory;

    .prologue
    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    sget-object v1, Lcom/fasterxml/jackson/databind/MapperFeature;->SORT_PROPERTIES_ALPHABETICALLY:Lcom/fasterxml/jackson/databind/MapperFeature;

    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonFactory;->requiresPropertyOrdering()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->with(Lcom/fasterxml/jackson/databind/MapperFeature;Z)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 183
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    .line 184
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    .line 185
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 186
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    .line 187
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    .line 188
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)V
    .registers 4
    .param p1, "base"    # Lcom/fasterxml/jackson/databind/ObjectWriter;
    .param p2, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;

    .prologue
    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 167
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    .line 168
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    .line 169
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 170
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    .line 171
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    .line 172
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;)V
    .registers 6
    .param p1, "base"    # Lcom/fasterxml/jackson/databind/ObjectWriter;
    .param p2, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p3, "genSettings"    # Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;
    .param p4, "prefetch"    # Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    .prologue
    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 152
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    .line 153
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    .line 154
    iget-object v0, p1, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 156
    iput-object p3, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    .line 157
    iput-object p4, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    .line 158
    return-void
.end method

.method private final _writeCloseable(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/SerializationConfig;)V
    .registers 10
    .param p1, "gen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cfg"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1079
    move-object v2, p2

    check-cast v2, Ljava/io/Closeable;

    .line 1081
    .local v2, "toClose":Ljava/io/Closeable;
    :try_start_3
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v3, v3, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    if-eqz v3, :cond_32

    .line 1082
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v3

    iget-object v4, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v4, v4, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->rootType:Lcom/fasterxml/jackson/databind/JavaType;

    iget-object v5, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v5, v5, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    invoke-virtual {v3, p1, p2, v4, v5}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializeValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    .line 1089
    :goto_18
    move-object v0, p1

    .line 1090
    .local v0, "tmpGen":Lcom/fasterxml/jackson/core/JsonGenerator;
    const/4 p1, 0x0

    .line 1091
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V

    .line 1092
    move-object v1, v2

    .line 1093
    .local v1, "tmpToClose":Ljava/io/Closeable;
    const/4 v2, 0x0

    .line 1094
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_44

    .line 1099
    if-eqz p1, :cond_2c

    .line 1103
    sget-object v3, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_JSON_CONTENT:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p1, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->disable(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 1105
    :try_start_29
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_2c} :catch_5d

    .line 1108
    :cond_2c
    :goto_2c
    if-eqz v2, :cond_31

    .line 1110
    :try_start_2e
    invoke-interface {v2}, Ljava/io/Closeable;->close()V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_31} :catch_5f

    .line 1114
    :cond_31
    :goto_31
    return-void

    .line 1084
    .end local v0    # "tmpGen":Lcom/fasterxml/jackson/core/JsonGenerator;
    .end local v1    # "tmpToClose":Ljava/io/Closeable;
    :cond_32
    :try_start_32
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v3, v3, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->typeSerializer:Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    if-eqz v3, :cond_55

    .line 1085
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v3

    iget-object v4, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v4, v4, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->typeSerializer:Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    invoke-virtual {v3, p1, p2, v4}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializePolymorphic(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)V
    :try_end_43
    .catchall {:try_start_32 .. :try_end_43} :catchall_44

    goto :goto_18

    .line 1099
    :catchall_44
    move-exception v3

    if-eqz p1, :cond_4f

    .line 1103
    sget-object v4, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_JSON_CONTENT:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->disable(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 1105
    :try_start_4c
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V
    :try_end_4f
    .catch Ljava/io/IOException; {:try_start_4c .. :try_end_4f} :catch_61

    .line 1108
    :cond_4f
    :goto_4f
    if-eqz v2, :cond_54

    .line 1110
    :try_start_51
    invoke-interface {v2}, Ljava/io/Closeable;->close()V
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_54} :catch_63

    .line 1111
    :cond_54
    :goto_54
    throw v3

    .line 1087
    :cond_55
    :try_start_55
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializeValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V
    :try_end_5c
    .catchall {:try_start_55 .. :try_end_5c} :catchall_44

    goto :goto_18

    .line 1106
    .restart local v0    # "tmpGen":Lcom/fasterxml/jackson/core/JsonGenerator;
    .restart local v1    # "tmpToClose":Ljava/io/Closeable;
    :catch_5d
    move-exception v3

    goto :goto_2c

    .line 1111
    :catch_5f
    move-exception v3

    goto :goto_31

    .line 1106
    .end local v0    # "tmpGen":Lcom/fasterxml/jackson/core/JsonGenerator;
    .end local v1    # "tmpToClose":Ljava/io/Closeable;
    :catch_61
    move-exception v4

    goto :goto_4f

    .line 1111
    :catch_63
    move-exception v4

    goto :goto_54
.end method

.method private final _writeCloseableValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/SerializationConfig;)V
    .registers 9
    .param p1, "gen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cfg"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1123
    move-object v1, p2

    check-cast v1, Ljava/io/Closeable;

    .line 1125
    .local v1, "toClose":Ljava/io/Closeable;
    :try_start_3
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v2, v2, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    if-eqz v2, :cond_30

    .line 1126
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v2

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v3, v3, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->rootType:Lcom/fasterxml/jackson/databind/JavaType;

    iget-object v4, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v4, v4, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    invoke-virtual {v2, p1, p2, v3, v4}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializeValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    .line 1133
    :goto_18
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    sget-object v3, Lcom/fasterxml/jackson/databind/SerializationFeature;->FLUSH_AFTER_WRITE_VALUE:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {v2, v3}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 1134
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->flush()V

    .line 1136
    :cond_25
    move-object v0, v1

    .line 1137
    .local v0, "tmpToClose":Ljava/io/Closeable;
    const/4 v1, 0x0

    .line 1138
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_2a
    .catchall {:try_start_3 .. :try_end_2a} :catchall_42

    .line 1140
    if-eqz v1, :cond_2f

    .line 1142
    :try_start_2c
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_2f} :catch_51

    .line 1146
    :cond_2f
    :goto_2f
    return-void

    .line 1128
    .end local v0    # "tmpToClose":Ljava/io/Closeable;
    :cond_30
    :try_start_30
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v2, v2, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->typeSerializer:Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    if-eqz v2, :cond_49

    .line 1129
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v2

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v3, v3, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->typeSerializer:Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    invoke-virtual {v2, p1, p2, v3}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializePolymorphic(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)V
    :try_end_41
    .catchall {:try_start_30 .. :try_end_41} :catchall_42

    goto :goto_18

    .line 1140
    :catchall_42
    move-exception v2

    if-eqz v1, :cond_48

    .line 1142
    :try_start_45
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_48} :catch_53

    .line 1143
    :cond_48
    :goto_48
    throw v2

    .line 1131
    :cond_49
    :try_start_49
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializeValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V
    :try_end_50
    .catchall {:try_start_49 .. :try_end_50} :catchall_42

    goto :goto_18

    .line 1143
    .restart local v0    # "tmpToClose":Ljava/io/Closeable;
    :catch_51
    move-exception v2

    goto :goto_2f

    .end local v0    # "tmpToClose":Ljava/io/Closeable;
    :catch_53
    move-exception v3

    goto :goto_48
.end method


# virtual methods
.method protected final _configAndWriteValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V
    .registers 7
    .param p1, "gen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1038
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_configureGenerator(Lcom/fasterxml/jackson/core/JsonGenerator;)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 1040
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    sget-object v2, Lcom/fasterxml/jackson/databind/SerializationFeature;->CLOSE_CLOSEABLE:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v1

    if-eqz v1, :cond_17

    instance-of v1, p2, Ljava/io/Closeable;

    if-eqz v1, :cond_17

    .line 1041
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-direct {p0, p1, p2, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_writeCloseable(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/SerializationConfig;)V

    .line 1070
    :cond_16
    :goto_16
    return-void

    .line 1044
    :cond_17
    const/4 v0, 0x0

    .line 1046
    .local v0, "closed":Z
    :try_start_18
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v1, v1, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    if-eqz v1, :cond_40

    .line 1047
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v1

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v2, v2, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->rootType:Lcom/fasterxml/jackson/databind/JavaType;

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v3, v3, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    invoke-virtual {v1, p1, p2, v2, v3}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializeValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    .line 1054
    :goto_2f
    const/4 v0, 0x1

    .line 1055
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V
    :try_end_33
    .catchall {:try_start_18 .. :try_end_33} :catchall_54

    .line 1060
    if-nez v0, :cond_16

    .line 1064
    sget-object v1, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_JSON_CONTENT:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->disable(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 1066
    :try_start_3a
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3d} :catch_3e

    goto :goto_16

    .line 1067
    :catch_3e
    move-exception v1

    goto :goto_16

    .line 1049
    :cond_40
    :try_start_40
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v1, v1, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->typeSerializer:Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    if-eqz v1, :cond_60

    .line 1050
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v1

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v2, v2, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->typeSerializer:Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    invoke-virtual {v1, p1, p2, v2}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializePolymorphic(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)V
    :try_end_53
    .catchall {:try_start_40 .. :try_end_53} :catchall_54

    goto :goto_2f

    .line 1060
    :catchall_54
    move-exception v1

    if-nez v0, :cond_5f

    .line 1064
    sget-object v2, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_JSON_CONTENT:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->disable(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 1066
    :try_start_5c
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_5f} :catch_6a

    .line 1067
    :cond_5f
    :goto_5f
    throw v1

    .line 1052
    :cond_60
    :try_start_60
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializeValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V
    :try_end_69
    .catchall {:try_start_60 .. :try_end_69} :catchall_54

    goto :goto_2f

    .line 1067
    :catch_6a
    move-exception v2

    goto :goto_5f
.end method

.method protected _configureGenerator(Lcom/fasterxml/jackson/core/JsonGenerator;)Lcom/fasterxml/jackson/core/JsonGenerator;
    .registers 9
    .param p1, "gen"    # Lcom/fasterxml/jackson/core/JsonGenerator;

    .prologue
    .line 1197
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    .line 1198
    .local v1, "genSet":Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;
    iget-object v2, v1, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->prettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    .line 1199
    .local v2, "pp":Lcom/fasterxml/jackson/core/PrettyPrinter;
    if-eqz v2, :cond_39

    .line 1200
    sget-object v5, Lcom/fasterxml/jackson/databind/ObjectWriter;->NULL_PRETTY_PRINTER:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-ne v2, v5, :cond_29

    .line 1201
    const/4 v5, 0x0

    invoke-virtual {p1, v5}, Lcom/fasterxml/jackson/core/JsonGenerator;->setPrettyPrinter(Lcom/fasterxml/jackson/core/PrettyPrinter;)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 1214
    :cond_e
    :goto_e
    iget-object v0, v1, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    .line 1215
    .local v0, "esc":Lcom/fasterxml/jackson/core/io/CharacterEscapes;
    if-eqz v0, :cond_15

    .line 1216
    invoke-virtual {p1, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->setCharacterEscapes(Lcom/fasterxml/jackson/core/io/CharacterEscapes;)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 1218
    :cond_15
    iget-object v3, v1, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->schema:Lcom/fasterxml/jackson/core/FormatSchema;

    .line 1219
    .local v3, "sch":Lcom/fasterxml/jackson/core/FormatSchema;
    if-eqz v3, :cond_1c

    .line 1220
    invoke-virtual {p1, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->setSchema(Lcom/fasterxml/jackson/core/FormatSchema;)V

    .line 1222
    :cond_1c
    iget-object v4, v1, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->rootValueSeparator:Lcom/fasterxml/jackson/core/SerializableString;

    .line 1223
    .local v4, "sep":Lcom/fasterxml/jackson/core/SerializableString;
    if-eqz v4, :cond_23

    .line 1224
    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->setRootValueSeparator(Lcom/fasterxml/jackson/core/SerializableString;)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 1226
    :cond_23
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v5, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->initialize(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 1227
    return-object p1

    .line 1206
    .end local v0    # "esc":Lcom/fasterxml/jackson/core/io/CharacterEscapes;
    .end local v3    # "sch":Lcom/fasterxml/jackson/core/FormatSchema;
    .end local v4    # "sep":Lcom/fasterxml/jackson/core/SerializableString;
    :cond_29
    instance-of v5, v2, Lcom/fasterxml/jackson/core/util/Instantiatable;

    if-eqz v5, :cond_35

    .line 1207
    check-cast v2, Lcom/fasterxml/jackson/core/util/Instantiatable;

    .end local v2    # "pp":Lcom/fasterxml/jackson/core/PrettyPrinter;
    invoke-interface {v2}, Lcom/fasterxml/jackson/core/util/Instantiatable;->createInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/fasterxml/jackson/core/PrettyPrinter;

    .line 1209
    .restart local v2    # "pp":Lcom/fasterxml/jackson/core/PrettyPrinter;
    :cond_35
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->setPrettyPrinter(Lcom/fasterxml/jackson/core/PrettyPrinter;)Lcom/fasterxml/jackson/core/JsonGenerator;

    goto :goto_e

    .line 1211
    :cond_39
    iget-object v5, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    sget-object v6, Lcom/fasterxml/jackson/databind/SerializationFeature;->INDENT_OUTPUT:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {v5, v6}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 1212
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->useDefaultPrettyPrinter()Lcom/fasterxml/jackson/core/JsonGenerator;

    goto :goto_e
.end method

.method protected _configureJsonGenerator(Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .registers 2
    .param p1, "gen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1186
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_configureGenerator(Lcom/fasterxml/jackson/core/JsonGenerator;)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 1187
    return-void
.end method

.method protected _new(Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 5
    .param p1, "genSettings"    # Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;
    .param p2, "prefetch"    # Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    .prologue
    .line 233
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectWriter;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/fasterxml/jackson/databind/ObjectWriter;-><init>(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;)V

    return-object v0
.end method

.method protected _new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/core/JsonFactory;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "base"    # Lcom/fasterxml/jackson/databind/ObjectWriter;
    .param p2, "f"    # Lcom/fasterxml/jackson/core/JsonFactory;

    .prologue
    .line 213
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectWriter;

    invoke-direct {v0, p1, p2}, Lcom/fasterxml/jackson/databind/ObjectWriter;-><init>(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/core/JsonFactory;)V

    return-object v0
.end method

.method protected _new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "base"    # Lcom/fasterxml/jackson/databind/ObjectWriter;
    .param p2, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;

    .prologue
    .line 222
    new-instance v0, Lcom/fasterxml/jackson/databind/ObjectWriter;

    invoke-direct {v0, p1, p2}, Lcom/fasterxml/jackson/databind/ObjectWriter;-><init>(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)V

    return-object v0
.end method

.method protected _newSequenceWriter(ZLcom/fasterxml/jackson/core/JsonGenerator;Z)Lcom/fasterxml/jackson/databind/SequenceWriter;
    .registers 8
    .param p1, "wrapInArray"    # Z
    .param p2, "gen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p3, "managedInput"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 247
    new-instance v0, Lcom/fasterxml/jackson/databind/SequenceWriter;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v1

    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_configureGenerator(Lcom/fasterxml/jackson/core/JsonGenerator;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v2

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    invoke-direct {v0, v1, v2, p3, v3}, Lcom/fasterxml/jackson/databind/SequenceWriter;-><init>(Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;Lcom/fasterxml/jackson/core/JsonGenerator;ZLcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;)V

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/SequenceWriter;->init(Z)Lcom/fasterxml/jackson/databind/SequenceWriter;

    move-result-object v0

    return-object v0
.end method

.method protected _prefetchRootSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;
    .registers 7
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;
    .param p2, "valueType"    # Lcom/fasterxml/jackson/databind/JavaType;

    .prologue
    .line 1155
    if-eqz p2, :cond_2b

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    sget-object v2, Lcom/fasterxml/jackson/databind/SerializationFeature;->EAGER_SERIALIZER_FETCH:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 1162
    :try_start_c
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, p2, v2, v3}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->findTypedValueSerializer(Lcom/fasterxml/jackson/databind/JavaType;ZLcom/fasterxml/jackson/databind/BeanProperty;)Lcom/fasterxml/jackson/databind/JsonSerializer;

    move-result-object v0

    .line 1164
    .local v0, "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    instance-of v1, v0, Lcom/fasterxml/jackson/databind/ser/impl/TypeWrappedSerializer;

    if-eqz v1, :cond_25

    .line 1165
    check-cast v0, Lcom/fasterxml/jackson/databind/ser/impl/TypeWrappedSerializer;

    .end local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/ser/impl/TypeWrappedSerializer;->typeSerializer()Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    move-result-object v1

    invoke-static {p2, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->construct(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    move-result-object v1

    .line 1173
    :goto_24
    return-object v1

    .line 1167
    .restart local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :cond_25
    invoke-static {p2, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->construct(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;)Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;
    :try_end_28
    .catch Lcom/fasterxml/jackson/core/JsonProcessingException; {:try_start_c .. :try_end_28} :catch_2a

    move-result-object v1

    goto :goto_24

    .line 1168
    .end local v0    # "ser":Lcom/fasterxml/jackson/databind/JsonSerializer;, "Lcom/fasterxml/jackson/databind/JsonSerializer<Ljava/lang/Object;>;"
    :catch_2a
    move-exception v1

    .line 1173
    :cond_2b
    sget-object v1, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->empty:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    goto :goto_24
.end method

.method protected _serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;
    .registers 4
    .param p1, "config"    # Lcom/fasterxml/jackson/databind/SerializationConfig;

    .prologue
    .line 1010
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider:Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerFactory:Lcom/fasterxml/jackson/databind/ser/SerializerFactory;

    invoke-virtual {v0, p1, v1}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->createInstance(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/ser/SerializerFactory;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v0

    return-object v0
.end method

.method protected _verifySchemaType(Lcom/fasterxml/jackson/core/FormatSchema;)V
    .registers 5
    .param p1, "schema"    # Lcom/fasterxml/jackson/core/FormatSchema;

    .prologue
    .line 1024
    if-eqz p1, :cond_3b

    .line 1025
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonFactory;->canUseSchema(Lcom/fasterxml/jackson/core/FormatSchema;)Z

    move-result v0

    if-nez v0, :cond_3b

    .line 1026
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can not use FormatSchema of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " for format "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonFactory;->getFormatName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1030
    :cond_3b
    return-void
.end method

.method public acceptJsonFormatVisitor(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitorWrapper;)V
    .registers 5
    .param p1, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "visitor"    # Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitorWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 979
    if-nez p1, :cond_a

    .line 980
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "type must be provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 982
    :cond_a
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->acceptJsonFormatVisitor(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitorWrapper;)V

    .line 983
    return-void
.end method

.method public canSerialize(Ljava/lang/Class;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 986
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->hasSerializerFor(Ljava/lang/Class;Ljava/util/concurrent/atomic/AtomicReference;)Z

    move-result v0

    return v0
.end method

.method public canSerialize(Ljava/lang/Class;Ljava/util/concurrent/atomic/AtomicReference;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/Throwable;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 996
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "cause":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/Throwable;>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->hasSerializerFor(Ljava/lang/Class;Ljava/util/concurrent/atomic/AtomicReference;)Z

    move-result v0

    return v0
.end method

.method public forType(Lcom/fasterxml/jackson/core/type/TypeReference;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/type/TypeReference",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/ObjectWriter;"
        }
    .end annotation

    .prologue
    .line 473
    .local p1, "rootType":Lcom/fasterxml/jackson/core/type/TypeReference;, "Lcom/fasterxml/jackson/core/type/TypeReference<*>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v0

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/type/TypeReference;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/type/TypeFactory;->constructType(Ljava/lang/reflect/Type;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->forType(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v0

    return-object v0
.end method

.method public forType(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "rootType"    # Lcom/fasterxml/jackson/databind/JavaType;

    .prologue
    .line 448
    if-eqz p1, :cond_a

    const-class v1, Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/databind/JavaType;->hasRawClass(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 449
    :cond_a
    sget-object v0, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->empty:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    .line 455
    .local v0, "pf":Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;
    :goto_c
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    if-ne v0, v1, :cond_1c

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_10
    return-object p0

    .line 452
    .end local v0    # "pf":Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;
    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_11
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JavaType;->withStaticTyping()Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object p1

    .line 453
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {p0, v1, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetchRootSerializer(Lcom/fasterxml/jackson/databind/SerializationConfig;Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    move-result-object v0

    .restart local v0    # "pf":Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;
    goto :goto_c

    .line 455
    :cond_1c
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    invoke-virtual {p0, v1, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_10
.end method

.method public forType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/ObjectWriter;"
        }
    .end annotation

    .prologue
    .line 466
    .local p1, "rootType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/lang/Object;

    if-ne p1, v0, :cond_c

    .line 467
    const/4 v0, 0x0

    check-cast v0, Lcom/fasterxml/jackson/databind/JavaType;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->forType(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v0

    .line 469
    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->constructType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JavaType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->forType(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v0

    goto :goto_b
.end method

.method public getAttributes()Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;
    .registers 2

    .prologue
    .line 824
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getAttributes()Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;

    move-result-object v0

    return-object v0
.end method

.method public getConfig()Lcom/fasterxml/jackson/databind/SerializationConfig;
    .registers 2

    .prologue
    .line 786
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    return-object v0
.end method

.method public getFactory()Lcom/fasterxml/jackson/core/JsonFactory;
    .registers 2

    .prologue
    .line 801
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    return-object v0
.end method

.method public getJsonFactory()Lcom/fasterxml/jackson/core/JsonFactory;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 794
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    return-object v0
.end method

.method public getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;
    .registers 2

    .prologue
    .line 805
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getTypeFactory()Lcom/fasterxml/jackson/databind/type/TypeFactory;

    move-result-object v0

    return-object v0
.end method

.method public hasPrefetchedSerializer()Z
    .registers 2

    .prologue
    .line 817
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->hasSerializer()Z

    move-result v0

    return v0
.end method

.method public isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z
    .registers 3
    .param p1, "f"    # Lcom/fasterxml/jackson/core/JsonParser$Feature;

    .prologue
    .line 779
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonFactory;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    return v0
.end method

.method public isEnabled(Lcom/fasterxml/jackson/databind/MapperFeature;)Z
    .registers 3
    .param p1, "f"    # Lcom/fasterxml/jackson/databind/MapperFeature;

    .prologue
    .line 775
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/MapperFeature;)Z

    move-result v0

    return v0
.end method

.method public isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z
    .registers 3
    .param p1, "f"    # Lcom/fasterxml/jackson/databind/SerializationFeature;

    .prologue
    .line 771
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v0

    return v0
.end method

.method public version()Lcom/fasterxml/jackson/core/Version;
    .registers 2

    .prologue
    .line 196
    sget-object v0, Lcom/fasterxml/jackson/databind/cfg/PackageVersion;->VERSION:Lcom/fasterxml/jackson/core/Version;

    return-object v0
.end method

.method public with(Lcom/fasterxml/jackson/core/Base64Variant;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;

    .prologue
    .line 530
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->with(Lcom/fasterxml/jackson/core/Base64Variant;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 531
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public with(Lcom/fasterxml/jackson/core/FormatSchema;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "schema"    # Lcom/fasterxml/jackson/core/FormatSchema;

    .prologue
    .line 419
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->with(Lcom/fasterxml/jackson/core/FormatSchema;)Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    move-result-object v0

    .line 420
    .local v0, "genSet":Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    if-ne v0, v1, :cond_b

    .line 424
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .line 423
    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_verifySchemaType(Lcom/fasterxml/jackson/core/FormatSchema;)V

    .line 424
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public with(Lcom/fasterxml/jackson/core/JsonFactory;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 3
    .param p1, "f"    # Lcom/fasterxml/jackson/core/JsonFactory;

    .prologue
    .line 549
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    if-ne p1, v0, :cond_5

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_4
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_5
    invoke-virtual {p0, p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/core/JsonFactory;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_4
.end method

.method public with(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "feature"    # Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    .prologue
    .line 322
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->with(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 323
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public with(Lcom/fasterxml/jackson/core/PrettyPrinter;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "pp"    # Lcom/fasterxml/jackson/core/PrettyPrinter;

    .prologue
    .line 391
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->with(Lcom/fasterxml/jackson/core/PrettyPrinter;)Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    move-result-object v0

    .line 392
    .local v0, "genSet":Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    if-ne v0, v1, :cond_b

    .line 395
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public with(Lcom/fasterxml/jackson/core/io/CharacterEscapes;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "escapes"    # Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    .prologue
    .line 538
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->with(Lcom/fasterxml/jackson/core/io/CharacterEscapes;)Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    move-result-object v0

    .line 539
    .local v0, "genSet":Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    if-ne v0, v1, :cond_b

    .line 542
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public with(Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "feature"    # Lcom/fasterxml/jackson/databind/SerializationFeature;

    .prologue
    .line 263
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->with(Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 264
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public varargs with(Lcom/fasterxml/jackson/databind/SerializationFeature;[Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 5
    .param p1, "first"    # Lcom/fasterxml/jackson/databind/SerializationFeature;
    .param p2, "other"    # [Lcom/fasterxml/jackson/databind/SerializationFeature;

    .prologue
    .line 272
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1, p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->with(Lcom/fasterxml/jackson/databind/SerializationFeature;[Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 273
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public with(Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "attrs"    # Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;

    .prologue
    .line 556
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->with(Lcom/fasterxml/jackson/databind/cfg/ContextAttributes;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 557
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public with(Lcom/fasterxml/jackson/databind/ser/FilterProvider;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 3
    .param p1, "filterProvider"    # Lcom/fasterxml/jackson/databind/ser/FilterProvider;

    .prologue
    .line 382
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/SerializationConfig;->getFilterProvider()Lcom/fasterxml/jackson/databind/ser/FilterProvider;

    move-result-object v0

    if-ne p1, v0, :cond_9

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_8
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_9
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->withFilters(Lcom/fasterxml/jackson/databind/ser/FilterProvider;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_8
.end method

.method public with(Ljava/text/DateFormat;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "df"    # Ljava/text/DateFormat;

    .prologue
    .line 365
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->with(Ljava/text/DateFormat;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 366
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public with(Ljava/util/Locale;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "l"    # Ljava/util/Locale;

    .prologue
    .line 514
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->with(Ljava/util/Locale;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 515
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public with(Ljava/util/TimeZone;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "tz"    # Ljava/util/TimeZone;

    .prologue
    .line 519
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->with(Ljava/util/TimeZone;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 520
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public withAttribute(Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 572
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1, p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->withAttribute(Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/cfg/MapperConfigBase;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 573
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_d

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_c
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_d
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_c
.end method

.method public withAttributes(Ljava/util/Map;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/fasterxml/jackson/databind/ObjectWriter;"
        }
    .end annotation

    .prologue
    .line 564
    .local p1, "attrs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->withAttributes(Ljava/util/Map;)Lcom/fasterxml/jackson/databind/cfg/MapperConfigBase;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 565
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_d

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_c
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_d
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_c
.end method

.method public withDefaultPrettyPrinter()Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 2

    .prologue
    .line 374
    new-instance v0, Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;

    invoke-direct {v0}, Lcom/fasterxml/jackson/core/util/DefaultPrettyPrinter;-><init>()V

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->with(Lcom/fasterxml/jackson/core/PrettyPrinter;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v0

    return-object v0
.end method

.method public varargs withFeatures([Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "features"    # [Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    .prologue
    .line 330
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->withFeatures([Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 331
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public varargs withFeatures([Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "features"    # [Lcom/fasterxml/jackson/databind/SerializationFeature;

    .prologue
    .line 281
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->withFeatures([Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 282
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public withRootName(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "rootName"    # Ljava/lang/String;

    .prologue
    .line 407
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->withRootName(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 408
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public withRootValueSeparator(Lcom/fasterxml/jackson/core/SerializableString;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "sep"    # Lcom/fasterxml/jackson/core/SerializableString;

    .prologue
    .line 599
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->withRootValueSeparator(Lcom/fasterxml/jackson/core/SerializableString;)Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    move-result-object v0

    .line 600
    .local v0, "genSet":Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    if-ne v0, v1, :cond_b

    .line 603
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public withRootValueSeparator(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "sep"    # Ljava/lang/String;

    .prologue
    .line 588
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;->withRootValueSeparator(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    move-result-object v0

    .line 589
    .local v0, "genSet":Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorSettings:Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;

    if-ne v0, v1, :cond_b

    .line 592
    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter$GeneratorSettings;Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public withSchema(Lcom/fasterxml/jackson/core/FormatSchema;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 3
    .param p1, "schema"    # Lcom/fasterxml/jackson/core/FormatSchema;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 432
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->with(Lcom/fasterxml/jackson/core/FormatSchema;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v0

    return-object v0
.end method

.method public withType(Lcom/fasterxml/jackson/core/type/TypeReference;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/type/TypeReference",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/ObjectWriter;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 497
    .local p1, "rootType":Lcom/fasterxml/jackson/core/type/TypeReference;, "Lcom/fasterxml/jackson/core/type/TypeReference<*>;"
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->forType(Lcom/fasterxml/jackson/core/type/TypeReference;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v0

    return-object v0
.end method

.method public withType(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 3
    .param p1, "rootType"    # Lcom/fasterxml/jackson/databind/JavaType;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 481
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->forType(Lcom/fasterxml/jackson/databind/JavaType;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v0

    return-object v0
.end method

.method public withType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/ObjectWriter;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 489
    .local p1, "rootType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->forType(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object v0

    return-object v0
.end method

.method public withView(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/databind/ObjectWriter;"
        }
    .end annotation

    .prologue
    .line 509
    .local p1, "view":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->withView(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 510
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public without(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "feature"    # Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    .prologue
    .line 338
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->without(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 339
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public without(Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "feature"    # Lcom/fasterxml/jackson/databind/SerializationFeature;

    .prologue
    .line 290
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->without(Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 291
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public varargs without(Lcom/fasterxml/jackson/databind/SerializationFeature;[Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 5
    .param p1, "first"    # Lcom/fasterxml/jackson/databind/SerializationFeature;
    .param p2, "other"    # [Lcom/fasterxml/jackson/databind/SerializationFeature;

    .prologue
    .line 299
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1, p2}, Lcom/fasterxml/jackson/databind/SerializationConfig;->without(Lcom/fasterxml/jackson/databind/SerializationFeature;[Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 300
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public withoutAttribute(Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 580
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->withoutAttribute(Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/cfg/MapperConfigBase;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/databind/SerializationConfig;

    .line 581
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_d

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_c
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_d
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_c
.end method

.method public varargs withoutFeatures([Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "features"    # [Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    .prologue
    .line 346
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->withoutFeatures([Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 347
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public varargs withoutFeatures([Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/ObjectWriter;
    .registers 4
    .param p1, "features"    # [Lcom/fasterxml/jackson/databind/SerializationFeature;

    .prologue
    .line 308
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->withoutFeatures([Lcom/fasterxml/jackson/databind/SerializationFeature;)Lcom/fasterxml/jackson/databind/SerializationConfig;

    move-result-object v0

    .line 309
    .local v0, "newConfig":Lcom/fasterxml/jackson/databind/SerializationConfig;
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    if-ne v0, v1, :cond_b

    .end local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :goto_a
    return-object p0

    .restart local p0    # "this":Lcom/fasterxml/jackson/databind/ObjectWriter;
    :cond_b
    invoke-virtual {p0, p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_new(Lcom/fasterxml/jackson/databind/ObjectWriter;Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ObjectWriter;

    move-result-object p0

    goto :goto_a
.end method

.method public writeValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V
    .registers 6
    .param p1, "gen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;,
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 840
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_configureGenerator(Lcom/fasterxml/jackson/core/JsonGenerator;)Lcom/fasterxml/jackson/core/JsonGenerator;

    .line 841
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    sget-object v1, Lcom/fasterxml/jackson/databind/SerializationFeature;->CLOSE_CLOSEABLE:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v0

    if-eqz v0, :cond_17

    instance-of v0, p2, Ljava/io/Closeable;

    if-eqz v0, :cond_17

    .line 843
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-direct {p0, p1, p2, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_writeCloseableValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/SerializationConfig;)V

    .line 857
    :cond_16
    :goto_16
    return-void

    .line 845
    :cond_17
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v0, v0, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    if-eqz v0, :cond_3c

    .line 846
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v1, v1, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->rootType:Lcom/fasterxml/jackson/databind/JavaType;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v2, v2, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->valueSerializer:Lcom/fasterxml/jackson/databind/JsonSerializer;

    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializeValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/databind/JsonSerializer;)V

    .line 853
    :goto_2e
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    sget-object v1, Lcom/fasterxml/jackson/databind/SerializationFeature;->FLUSH_AFTER_WRITE_VALUE:Lcom/fasterxml/jackson/databind/SerializationFeature;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/SerializationConfig;->isEnabled(Lcom/fasterxml/jackson/databind/SerializationFeature;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 854
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->flush()V

    goto :goto_16

    .line 848
    :cond_3c
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v0, v0, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->typeSerializer:Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    if-eqz v0, :cond_50

    .line 849
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_prefetch:Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;

    iget-object v1, v1, Lcom/fasterxml/jackson/databind/ObjectWriter$Prefetch;->typeSerializer:Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;

    invoke-virtual {v0, p1, p2, v1}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializePolymorphic(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;Lcom/fasterxml/jackson/databind/jsontype/TypeSerializer;)V

    goto :goto_2e

    .line 851
    :cond_50
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_config:Lcom/fasterxml/jackson/databind/SerializationConfig;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_serializerProvider(Lcom/fasterxml/jackson/databind/SerializationConfig;)Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/fasterxml/jackson/databind/ser/DefaultSerializerProvider;->serializeValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V

    goto :goto_2e
.end method

.method public writeValue(Ljava/io/File;Ljava/lang/Object;)V
    .registers 5
    .param p1, "resultFile"    # Ljava/io/File;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;,
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 872
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;

    invoke-virtual {v0, p1, v1}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/File;Lcom/fasterxml/jackson/core/JsonEncoding;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_configAndWriteValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V

    .line 873
    return-void
.end method

.method public writeValue(Ljava/io/OutputStream;Ljava/lang/Object;)V
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;,
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 889
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;

    invoke-virtual {v0, p1, v1}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/OutputStream;Lcom/fasterxml/jackson/core/JsonEncoding;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_configAndWriteValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V

    .line 890
    return-void
.end method

.method public writeValue(Ljava/io/Writer;Ljava/lang/Object;)V
    .registers 4
    .param p1, "w"    # Ljava/io/Writer;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;,
            Lcom/fasterxml/jackson/databind/JsonMappingException;
        }
    .end annotation

    .prologue
    .line 905
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/Writer;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_configAndWriteValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V

    .line 906
    return-void
.end method

.method public writeValueAsBytes(Ljava/lang/Object;)[B
    .registers 7
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 945
    new-instance v0, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonFactory;->_getBufferRecycler()Lcom/fasterxml/jackson/core/util/BufferRecycler;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;-><init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;)V

    .line 947
    .local v0, "bb":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    :try_start_b
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    sget-object v4, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;

    invoke-virtual {v3, v0, v4}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/OutputStream;Lcom/fasterxml/jackson/core/JsonEncoding;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v3

    invoke-virtual {p0, v3, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_configAndWriteValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V
    :try_end_16
    .catch Lcom/fasterxml/jackson/core/JsonProcessingException; {:try_start_b .. :try_end_16} :catch_1e
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_16} :catch_20

    .line 953
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v2

    .line 954
    .local v2, "result":[B
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->release()V

    .line 955
    return-object v2

    .line 948
    .end local v2    # "result":[B
    :catch_1e
    move-exception v1

    .line 949
    .local v1, "e":Lcom/fasterxml/jackson/core/JsonProcessingException;
    throw v1

    .line 950
    .end local v1    # "e":Lcom/fasterxml/jackson/core/JsonProcessingException;
    :catch_20
    move-exception v1

    .line 951
    .local v1, "e":Ljava/io/IOException;
    invoke-static {v1}, Lcom/fasterxml/jackson/databind/JsonMappingException;->fromUnexpectedIOE(Ljava/io/IOException;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v3

    throw v3
.end method

.method public writeValueAsString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonProcessingException;
        }
    .end annotation

    .prologue
    .line 921
    new-instance v1, Lcom/fasterxml/jackson/core/io/SegmentedStringWriter;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonFactory;->_getBufferRecycler()Lcom/fasterxml/jackson/core/util/BufferRecycler;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/fasterxml/jackson/core/io/SegmentedStringWriter;-><init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;)V

    .line 923
    .local v1, "sw":Lcom/fasterxml/jackson/core/io/SegmentedStringWriter;
    :try_start_b
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/Writer;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v2

    invoke-virtual {p0, v2, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_configAndWriteValue(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V
    :try_end_14
    .catch Lcom/fasterxml/jackson/core/JsonProcessingException; {:try_start_b .. :try_end_14} :catch_19
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_14} :catch_1b

    .line 929
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/io/SegmentedStringWriter;->getAndClear()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 924
    :catch_19
    move-exception v0

    .line 925
    .local v0, "e":Lcom/fasterxml/jackson/core/JsonProcessingException;
    throw v0

    .line 926
    .end local v0    # "e":Lcom/fasterxml/jackson/core/JsonProcessingException;
    :catch_1b
    move-exception v0

    .line 927
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v0}, Lcom/fasterxml/jackson/databind/JsonMappingException;->fromUnexpectedIOE(Ljava/io/IOException;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v2

    throw v2
.end method

.method public writeValues(Lcom/fasterxml/jackson/core/JsonGenerator;)Lcom/fasterxml/jackson/databind/SequenceWriter;
    .registers 4
    .param p1, "gen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 646
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_configureGenerator(Lcom/fasterxml/jackson/core/JsonGenerator;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v0

    invoke-virtual {p0, v1, v0, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_newSequenceWriter(ZLcom/fasterxml/jackson/core/JsonGenerator;Z)Lcom/fasterxml/jackson/databind/SequenceWriter;

    move-result-object v0

    return-object v0
.end method

.method public writeValues(Ljava/io/File;)Lcom/fasterxml/jackson/databind/SequenceWriter;
    .registers 5
    .param p1, "out"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 626
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    sget-object v2, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;

    invoke-virtual {v1, p1, v2}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/File;Lcom/fasterxml/jackson/core/JsonEncoding;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_newSequenceWriter(ZLcom/fasterxml/jackson/core/JsonGenerator;Z)Lcom/fasterxml/jackson/databind/SequenceWriter;

    move-result-object v0

    return-object v0
.end method

.method public writeValues(Ljava/io/OutputStream;)Lcom/fasterxml/jackson/databind/SequenceWriter;
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 681
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    sget-object v2, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;

    invoke-virtual {v1, p1, v2}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/OutputStream;Lcom/fasterxml/jackson/core/JsonEncoding;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_newSequenceWriter(ZLcom/fasterxml/jackson/core/JsonGenerator;Z)Lcom/fasterxml/jackson/databind/SequenceWriter;

    move-result-object v0

    return-object v0
.end method

.method public writeValues(Ljava/io/Writer;)Lcom/fasterxml/jackson/databind/SequenceWriter;
    .registers 5
    .param p1, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 663
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/Writer;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_newSequenceWriter(ZLcom/fasterxml/jackson/core/JsonGenerator;Z)Lcom/fasterxml/jackson/databind/SequenceWriter;

    move-result-object v0

    return-object v0
.end method

.method public writeValuesAsArray(Lcom/fasterxml/jackson/core/JsonGenerator;)Lcom/fasterxml/jackson/databind/SequenceWriter;
    .registers 4
    .param p1, "gen"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 722
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_newSequenceWriter(ZLcom/fasterxml/jackson/core/JsonGenerator;Z)Lcom/fasterxml/jackson/databind/SequenceWriter;

    move-result-object v0

    return-object v0
.end method

.method public writeValuesAsArray(Ljava/io/File;)Lcom/fasterxml/jackson/databind/SequenceWriter;
    .registers 5
    .param p1, "out"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 701
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;

    invoke-virtual {v0, p1, v1}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/File;Lcom/fasterxml/jackson/core/JsonEncoding;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v0

    invoke-virtual {p0, v2, v0, v2}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_newSequenceWriter(ZLcom/fasterxml/jackson/core/JsonGenerator;Z)Lcom/fasterxml/jackson/databind/SequenceWriter;

    move-result-object v0

    return-object v0
.end method

.method public writeValuesAsArray(Ljava/io/OutputStream;)Lcom/fasterxml/jackson/databind/SequenceWriter;
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 760
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;

    invoke-virtual {v0, p1, v1}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/OutputStream;Lcom/fasterxml/jackson/core/JsonEncoding;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v0

    invoke-virtual {p0, v2, v0, v2}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_newSequenceWriter(ZLcom/fasterxml/jackson/core/JsonGenerator;Z)Lcom/fasterxml/jackson/databind/SequenceWriter;

    move-result-object v0

    return-object v0
.end method

.method public writeValuesAsArray(Ljava/io/Writer;)Lcom/fasterxml/jackson/databind/SequenceWriter;
    .registers 4
    .param p1, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 741
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/ObjectWriter;->_generatorFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/Writer;)Lcom/fasterxml/jackson/core/JsonGenerator;

    move-result-object v0

    invoke-virtual {p0, v1, v0, v1}, Lcom/fasterxml/jackson/databind/ObjectWriter;->_newSequenceWriter(ZLcom/fasterxml/jackson/core/JsonGenerator;Z)Lcom/fasterxml/jackson/databind/SequenceWriter;

    move-result-object v0

    return-object v0
.end method
