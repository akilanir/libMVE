.class public Lcom/alibaba/fastjson/parser/ParserConfig;
.super Ljava/lang/Object;
.source "ParserConfig.java"


# static fields
.field public static final DENY_PROPERTY:Ljava/lang/String; = "fastjson.parser.deny"

.field private static awtError:Z

.field public static global:Lcom/alibaba/fastjson/parser/ParserConfig;

.field private static jdk8Error:Z


# instance fields
.field private asmEnable:Z

.field protected asmFactory:Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

.field protected defaultClassLoader:Ljava/lang/ClassLoader;

.field private denyList:[Ljava/lang/String;

.field private final derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/alibaba/fastjson/util/IdentityHashMap",
            "<",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;",
            ">;"
        }
    .end annotation
.end field

.field public final symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 124
    new-instance v0, Lcom/alibaba/fastjson/parser/ParserConfig;

    invoke-direct {v0}, Lcom/alibaba/fastjson/parser/ParserConfig;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/parser/ParserConfig;->global:Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 136
    sput-boolean v1, Lcom/alibaba/fastjson/parser/ParserConfig;->awtError:Z

    .line 137
    sput-boolean v1, Lcom/alibaba/fastjson/parser/ParserConfig;->jdk8Error:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 142
    invoke-direct {p0, v0, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;-><init>(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;Ljava/lang/ClassLoader;)V

    .line 143
    return-void
.end method

.method public constructor <init>(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;)V
    .registers 3
    .param p1, "asmFactory"    # Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    .prologue
    .line 150
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/parser/ParserConfig;-><init>(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;Ljava/lang/ClassLoader;)V

    .line 151
    return-void
.end method

.method private constructor <init>(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;Ljava/lang/ClassLoader;)V
    .registers 8
    .param p1, "asmFactory"    # Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;
    .param p2, "parentClassLoader"    # Ljava/lang/ClassLoader;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    new-instance v1, Lcom/alibaba/fastjson/util/IdentityHashMap;

    invoke-direct {v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;-><init>()V

    iput-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 128
    sget-boolean v1, Lcom/alibaba/fastjson/util/ASMUtils;->IS_ANDROID:Z

    if-nez v1, :cond_2ba

    move v1, v2

    :goto_11
    iput-boolean v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmEnable:Z

    .line 130
    new-instance v1, Lcom/alibaba/fastjson/parser/SymbolTable;

    const/16 v4, 0x1000

    invoke-direct {v1, v4}, Lcom/alibaba/fastjson/parser/SymbolTable;-><init>(I)V

    iput-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->symbolTable:Lcom/alibaba/fastjson/parser/SymbolTable;

    .line 139
    new-array v1, v2, [Ljava/lang/String;

    const-string v2, "java.lang.Thread"

    aput-object v2, v1, v3

    iput-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyList:[Ljava/lang/String;

    .line 154
    if-nez p1, :cond_37

    sget-boolean v1, Lcom/alibaba/fastjson/util/ASMUtils;->IS_ANDROID:Z

    if-nez v1, :cond_37

    .line 156
    if-nez p2, :cond_2bd

    .line 157
    :try_start_2c
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    new-instance v1, Lcom/alibaba/fastjson/util/ASMClassLoader;

    invoke-direct {v1}, Lcom/alibaba/fastjson/util/ASMClassLoader;-><init>()V

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;-><init>(Ljava/lang/ClassLoader;)V
    :try_end_36
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_2c .. :try_end_36} :catch_2cb
    .catch Ljava/security/AccessControlException; {:try_start_2c .. :try_end_36} :catch_2c8
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_2c .. :try_end_36} :catch_2c5

    .end local p1    # "asmFactory":Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;
    .local v0, "asmFactory":Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;
    move-object p1, v0

    .line 170
    .end local v0    # "asmFactory":Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;
    .restart local p1    # "asmFactory":Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;
    :cond_37
    :goto_37
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmFactory:Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    .line 172
    if-nez p1, :cond_3d

    .line 173
    iput-boolean v3, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmEnable:Z

    .line 176
    :cond_3d
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/text/SimpleDateFormat;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 177
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/sql/Timestamp;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;->instance_timestamp:Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/sql/Date;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 179
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/sql/Time;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/TimeDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 180
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/Date;

    sget-object v3, Lcom/alibaba/fastjson/serializer/DateCodec;->instance:Lcom/alibaba/fastjson/serializer/DateCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 181
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/Calendar;

    sget-object v3, Lcom/alibaba/fastjson/serializer/CalendarCodec;->instance:Lcom/alibaba/fastjson/serializer/CalendarCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 183
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Lcom/alibaba/fastjson/JSONObject;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 184
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Lcom/alibaba/fastjson/JSONArray;

    sget-object v3, Lcom/alibaba/fastjson/serializer/CollectionCodec;->instance:Lcom/alibaba/fastjson/serializer/CollectionCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 186
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/Map;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 187
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/HashMap;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 188
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/LinkedHashMap;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 189
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/TreeMap;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 190
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/concurrent/ConcurrentMap;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 191
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/concurrent/ConcurrentHashMap;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 193
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/Collection;

    sget-object v3, Lcom/alibaba/fastjson/serializer/CollectionCodec;->instance:Lcom/alibaba/fastjson/serializer/CollectionCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 194
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/List;

    sget-object v3, Lcom/alibaba/fastjson/serializer/CollectionCodec;->instance:Lcom/alibaba/fastjson/serializer/CollectionCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 195
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/ArrayList;

    sget-object v3, Lcom/alibaba/fastjson/serializer/CollectionCodec;->instance:Lcom/alibaba/fastjson/serializer/CollectionCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 197
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Object;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 198
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/String;

    sget-object v3, Lcom/alibaba/fastjson/serializer/StringCodec;->instance:Lcom/alibaba/fastjson/serializer/StringCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 199
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/StringBuffer;

    sget-object v3, Lcom/alibaba/fastjson/serializer/StringCodec;->instance:Lcom/alibaba/fastjson/serializer/StringCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 200
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/StringBuilder;

    sget-object v3, Lcom/alibaba/fastjson/serializer/StringCodec;->instance:Lcom/alibaba/fastjson/serializer/StringCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 201
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    sget-object v3, Lcom/alibaba/fastjson/serializer/CharacterCodec;->instance:Lcom/alibaba/fastjson/serializer/CharacterCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 202
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Character;

    sget-object v3, Lcom/alibaba/fastjson/serializer/CharacterCodec;->instance:Lcom/alibaba/fastjson/serializer/CharacterCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 203
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 204
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Byte;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 205
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 206
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Short;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 207
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v3, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 208
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Integer;

    sget-object v3, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 209
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    sget-object v3, Lcom/alibaba/fastjson/serializer/LongCodec;->instance:Lcom/alibaba/fastjson/serializer/LongCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 210
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Long;

    sget-object v3, Lcom/alibaba/fastjson/serializer/LongCodec;->instance:Lcom/alibaba/fastjson/serializer/LongCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 211
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/math/BigInteger;

    sget-object v3, Lcom/alibaba/fastjson/serializer/BigIntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/BigIntegerCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 212
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/math/BigDecimal;

    sget-object v3, Lcom/alibaba/fastjson/serializer/BigDecimalCodec;->instance:Lcom/alibaba/fastjson/serializer/BigDecimalCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 213
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v3, Lcom/alibaba/fastjson/serializer/FloatCodec;->instance:Lcom/alibaba/fastjson/serializer/FloatCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 214
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Float;

    sget-object v3, Lcom/alibaba/fastjson/serializer/FloatCodec;->instance:Lcom/alibaba/fastjson/serializer/FloatCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 215
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 216
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Double;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 217
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v3, Lcom/alibaba/fastjson/serializer/BooleanCodec;->instance:Lcom/alibaba/fastjson/serializer/BooleanCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 218
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Boolean;

    sget-object v3, Lcom/alibaba/fastjson/serializer/BooleanCodec;->instance:Lcom/alibaba/fastjson/serializer/BooleanCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 219
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Class;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 220
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, [C

    new-instance v3, Lcom/alibaba/fastjson/serializer/CharArrayCodec;

    invoke-direct {v3}, Lcom/alibaba/fastjson/serializer/CharArrayCodec;-><init>()V

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 222
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    sget-object v3, Lcom/alibaba/fastjson/serializer/BooleanCodec;->instance:Lcom/alibaba/fastjson/serializer/BooleanCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 223
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/concurrent/atomic/AtomicInteger;

    sget-object v3, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 224
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/concurrent/atomic/AtomicLong;

    sget-object v3, Lcom/alibaba/fastjson/serializer/LongCodec;->instance:Lcom/alibaba/fastjson/serializer/LongCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 225
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ReferenceCodec;->instance:Lcom/alibaba/fastjson/serializer/ReferenceCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 227
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/ref/WeakReference;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ReferenceCodec;->instance:Lcom/alibaba/fastjson/serializer/ReferenceCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 228
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/ref/SoftReference;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ReferenceCodec;->instance:Lcom/alibaba/fastjson/serializer/ReferenceCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 230
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/UUID;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 231
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/TimeZone;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 232
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/Locale;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 233
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/Currency;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 234
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/net/InetAddress;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 235
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/net/Inet4Address;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 236
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/net/Inet6Address;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 237
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/net/InetSocketAddress;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 238
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/io/File;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 239
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/net/URI;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 240
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/net/URL;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 241
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/regex/Pattern;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 242
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/nio/charset/Charset;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 243
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Lcom/alibaba/fastjson/JSONPath;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 244
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Number;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 245
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/concurrent/atomic/AtomicIntegerArray;

    sget-object v3, Lcom/alibaba/fastjson/serializer/AtomicCodec;->instance:Lcom/alibaba/fastjson/serializer/AtomicCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 246
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/util/concurrent/atomic/AtomicLongArray;

    sget-object v3, Lcom/alibaba/fastjson/serializer/AtomicCodec;->instance:Lcom/alibaba/fastjson/serializer/AtomicCodec;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 247
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/StackTraceElement;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/StackTraceElementDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/StackTraceElementDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 249
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/io/Serializable;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 250
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Cloneable;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 251
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/lang/Comparable;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 252
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-class v2, Ljava/io/Closeable;

    sget-object v3, Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;

    invoke-virtual {v1, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 254
    const-string v1, "java.lang.Thread"

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->addDeny(Ljava/lang/String;)V

    .line 255
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->configFromPropety(Ljava/util/Properties;)V

    .line 256
    return-void

    :cond_2ba
    move v1, v3

    .line 128
    goto/16 :goto_11

    .line 159
    :cond_2bd
    :try_start_2bd
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    invoke-direct {v0, p2}, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;-><init>(Ljava/lang/ClassLoader;)V
    :try_end_2c2
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_2bd .. :try_end_2c2} :catch_2cb
    .catch Ljava/security/AccessControlException; {:try_start_2bd .. :try_end_2c2} :catch_2c8
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_2bd .. :try_end_2c2} :catch_2c5

    .end local p1    # "asmFactory":Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;
    .restart local v0    # "asmFactory":Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;
    move-object p1, v0

    .end local v0    # "asmFactory":Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;
    .restart local p1    # "asmFactory":Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;
    goto/16 :goto_37

    .line 165
    :catch_2c5
    move-exception v1

    goto/16 :goto_37

    .line 163
    :catch_2c8
    move-exception v1

    goto/16 :goto_37

    .line 161
    :catch_2cb
    move-exception v1

    goto/16 :goto_37
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;)V
    .registers 3
    .param p1, "parentClassLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 146
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;-><init>(Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;Ljava/lang/ClassLoader;)V

    .line 147
    return-void
.end method

.method public static getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 5
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 601
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getField0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 603
    .local v0, "field":Ljava/lang/reflect/Field;
    if-nez v0, :cond_1d

    .line 604
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getField0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 607
    :cond_1d
    if-nez v0, :cond_36

    .line 608
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "m_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getField0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 611
    :cond_36
    return-object v0
.end method

.method private static getField0(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .registers 7
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 615
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_6
    if-ge v1, v3, :cond_18

    aget-object v0, v2, v1

    .line 616
    .local v0, "item":Ljava/lang/reflect/Field;
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 624
    .end local v0    # "item":Ljava/lang/reflect/Field;
    :goto_14
    return-object v0

    .line 615
    .restart local v0    # "item":Ljava/lang/reflect/Field;
    :cond_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 620
    .end local v0    # "item":Ljava/lang/reflect/Field;
    :cond_18
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    if-eqz v1, :cond_2f

    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Ljava/lang/Object;

    if-eq v1, v2, :cond_2f

    .line 621
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    goto :goto_14

    .line 624
    :cond_2f
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public static getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;
    .registers 1

    .prologue
    .line 121
    sget-object v0, Lcom/alibaba/fastjson/parser/ParserConfig;->global:Lcom/alibaba/fastjson/parser/ParserConfig;

    return-object v0
.end method

.method public static isPrimitive(Ljava/lang/Class;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 580
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_48

    const-class v0, Ljava/lang/Boolean;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/lang/Character;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/lang/Byte;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/lang/Short;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/lang/Integer;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/lang/Long;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/lang/Float;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/lang/Double;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/math/BigInteger;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/math/BigDecimal;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/lang/String;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/util/Date;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/sql/Date;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/sql/Time;

    if-eq p0, v0, :cond_48

    const-class v0, Ljava/sql/Timestamp;

    if-eq p0, v0, :cond_48

    .line 596
    invoke-virtual {p0}, Ljava/lang/Class;->isEnum()Z

    move-result v0

    if-eqz v0, :cond_4a

    :cond_48
    const/4 v0, 0x1

    :goto_49
    return v0

    :cond_4a
    const/4 v0, 0x0

    goto :goto_49
.end method


# virtual methods
.method public addDeny(Ljava/lang/String;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 636
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_a

    .line 644
    :cond_9
    :goto_9
    return-void

    .line 640
    :cond_a
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyList:[Ljava/lang/String;

    array-length v1, v1

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    .line 641
    .local v0, "denyList":[Ljava/lang/String;
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyList:[Ljava/lang/String;

    iget-object v2, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyList:[Ljava/lang/String;

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 642
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-object p1, v0, v1

    .line 643
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyList:[Ljava/lang/String;

    goto :goto_9
.end method

.method public configFromPropety(Ljava/util/Properties;)V
    .registers 7
    .param p1, "properties"    # Ljava/util/Properties;

    .prologue
    .line 259
    const-string v4, "fastjson.parser.deny"

    invoke-virtual {p1, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 260
    .local v3, "property":Ljava/lang/String;
    if-eqz v3, :cond_20

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_20

    .line 261
    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 262
    .local v2, "items":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    array-length v4, v2

    if-ge v0, v4, :cond_20

    .line 263
    aget-object v1, v2, v0

    .line 264
    .local v1, "item":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->addDeny(Ljava/lang/String;)V

    .line 262
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 267
    .end local v0    # "i":I
    .end local v1    # "item":Ljava/lang/String;
    .end local v2    # "items":[Ljava/lang/String;
    :cond_20
    return-void
.end method

.method public createFieldDeserializer(Lcom/alibaba/fastjson/parser/ParserConfig;Lcom/alibaba/fastjson/util/JavaBeanInfo;Lcom/alibaba/fastjson/util/FieldInfo;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    .registers 7
    .param p1, "mapping"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .param p2, "beanInfo"    # Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .param p3, "fieldInfo"    # Lcom/alibaba/fastjson/util/FieldInfo;

    .prologue
    .line 561
    iget-object v0, p2, Lcom/alibaba/fastjson/util/JavaBeanInfo;->clazz:Ljava/lang/Class;

    .line 562
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p3, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 564
    .local v1, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Ljava/util/List;

    if-eq v1, v2, :cond_c

    const-class v2, Ljava/util/ArrayList;

    if-ne v1, v2, :cond_12

    .line 565
    :cond_c
    new-instance v2, Lcom/alibaba/fastjson/parser/deserializer/ArrayListTypeFieldDeserializer;

    invoke-direct {v2, p1, v0, p3}, Lcom/alibaba/fastjson/parser/deserializer/ArrayListTypeFieldDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 568
    :goto_11
    return-object v2

    :cond_12
    new-instance v2, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;

    invoke-direct {v2, p1, v0, p3}, Lcom/alibaba/fastjson/parser/deserializer/DefaultFieldDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V

    goto :goto_11
.end method

.method public createJavaBeanDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .registers 22
    .param p2, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;"
        }
    .end annotation

    .prologue
    .line 442
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmEnable:Z

    .line 443
    .local v4, "asmEnable":Z
    if-eqz v4, :cond_2e

    .line 444
    const-class v15, Lcom/alibaba/fastjson/annotation/JSONType;

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v13

    check-cast v13, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 446
    .local v13, "jsonType":Lcom/alibaba/fastjson/annotation/JSONType;
    if-eqz v13, :cond_19

    invoke-interface {v13}, Lcom/alibaba/fastjson/annotation/JSONType;->asm()Z

    move-result v15

    if-nez v15, :cond_19

    .line 447
    const/4 v4, 0x0

    .line 450
    :cond_19
    if-eqz v4, :cond_2e

    .line 451
    invoke-static {v13}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->getBuilderClass(Lcom/alibaba/fastjson/annotation/JSONType;)Ljava/lang/Class;

    move-result-object v14

    .line 452
    .local v14, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v14, :cond_23

    .line 453
    move-object/from16 v14, p1

    .line 457
    :cond_23
    invoke-virtual {v14}, Ljava/lang/Class;->getModifiers()I

    move-result v15

    invoke-static {v15}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v15

    if-nez v15, :cond_b5

    .line 458
    const/4 v4, 0x0

    .line 470
    .end local v13    # "jsonType":Lcom/alibaba/fastjson/annotation/JSONType;
    .end local v14    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2e
    :goto_2e
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v15

    array-length v15, v15

    if-eqz v15, :cond_36

    .line 471
    const/4 v4, 0x0

    .line 474
    :cond_36
    if-eqz v4, :cond_4d

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmFactory:Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    if-eqz v15, :cond_4d

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmFactory:Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    iget-object v15, v15, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;->classLoader:Lcom/alibaba/fastjson/util/ASMClassLoader;

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Lcom/alibaba/fastjson/util/ASMClassLoader;->isExternalClass(Ljava/lang/Class;)Z

    move-result v15

    if-eqz v15, :cond_4d

    .line 475
    const/4 v4, 0x0

    .line 478
    :cond_4d
    if-eqz v4, :cond_57

    .line 479
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/alibaba/fastjson/util/ASMUtils;->checkName(Ljava/lang/String;)Z

    move-result v4

    .line 482
    :cond_57
    if-eqz v4, :cond_94

    .line 483
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->isInterface()Z

    move-result v15

    if-eqz v15, :cond_60

    .line 484
    const/4 v4, 0x0

    .line 486
    :cond_60
    invoke-static/range {p1 .. p2}, Lcom/alibaba/fastjson/util/JavaBeanInfo;->build(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/util/JavaBeanInfo;

    move-result-object v6

    .line 488
    .local v6, "beanInfo":Lcom/alibaba/fastjson/util/JavaBeanInfo;
    if-eqz v4, :cond_70

    iget-object v15, v6, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    array-length v15, v15

    const/16 v16, 0xc8

    move/from16 v0, v16

    if-le v15, v0, :cond_70

    .line 489
    const/4 v4, 0x0

    .line 492
    :cond_70
    iget-object v7, v6, Lcom/alibaba/fastjson/util/JavaBeanInfo;->defaultConstructor:Ljava/lang/reflect/Constructor;

    .line 493
    .local v7, "defaultConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    if-eqz v4, :cond_7d

    if-nez v7, :cond_7d

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->isInterface()Z

    move-result v15

    if-nez v15, :cond_7d

    .line 494
    const/4 v4, 0x0

    .line 497
    :cond_7d
    iget-object v0, v6, Lcom/alibaba/fastjson/util/JavaBeanInfo;->fields:[Lcom/alibaba/fastjson/util/FieldInfo;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v17, v0

    const/4 v15, 0x0

    :goto_87
    move/from16 v0, v17

    if-ge v15, v0, :cond_94

    aget-object v12, v16, v15

    .line 498
    .local v12, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    iget-boolean v0, v12, Lcom/alibaba/fastjson/util/FieldInfo;->getOnly:Z

    move/from16 v18, v0

    if-eqz v18, :cond_c1

    .line 499
    const/4 v4, 0x0

    .line 536
    .end local v6    # "beanInfo":Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .end local v7    # "defaultConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v12    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_94
    :goto_94
    if-eqz v4, :cond_a7

    .line 537
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->isMemberClass()Z

    move-result v15

    if-eqz v15, :cond_a7

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getModifiers()I

    move-result v15

    invoke-static {v15}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v15

    if-nez v15, :cond_a7

    .line 538
    const/4 v4, 0x0

    .line 542
    :cond_a7
    if-nez v4, :cond_122

    .line 543
    new-instance v15, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v15, v0, v1, v2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Ljava/lang/reflect/Type;)V

    .line 554
    :goto_b4
    return-object v15

    .line 462
    .restart local v13    # "jsonType":Lcom/alibaba/fastjson/annotation/JSONType;
    .restart local v14    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_b5
    invoke-virtual {v14}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v14

    .line 463
    const-class v15, Ljava/lang/Object;

    if-eq v14, v15, :cond_2e

    if-nez v14, :cond_23

    goto/16 :goto_2e

    .line 503
    .end local v13    # "jsonType":Lcom/alibaba/fastjson/annotation/JSONType;
    .end local v14    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v6    # "beanInfo":Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .restart local v7    # "defaultConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .restart local v12    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_c1
    iget-object v10, v12, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 504
    .local v10, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v10}, Ljava/lang/Class;->getModifiers()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v18

    if-nez v18, :cond_cf

    .line 505
    const/4 v4, 0x0

    .line 506
    goto :goto_94

    .line 509
    :cond_cf
    invoke-virtual {v10}, Ljava/lang/Class;->isMemberClass()Z

    move-result v18

    if-eqz v18, :cond_e1

    invoke-virtual {v10}, Ljava/lang/Class;->getModifiers()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v18

    if-nez v18, :cond_e1

    .line 510
    const/4 v4, 0x0

    .line 511
    goto :goto_94

    .line 514
    :cond_e1
    invoke-virtual {v12}, Lcom/alibaba/fastjson/util/FieldInfo;->getMember()Ljava/lang/reflect/Member;

    move-result-object v18

    if-eqz v18, :cond_f7

    .line 515
    invoke-virtual {v12}, Lcom/alibaba/fastjson/util/FieldInfo;->getMember()Ljava/lang/reflect/Member;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/alibaba/fastjson/util/ASMUtils;->checkName(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_f7

    .line 516
    const/4 v4, 0x0

    .line 517
    goto :goto_94

    .line 520
    :cond_f7
    invoke-virtual {v12}, Lcom/alibaba/fastjson/util/FieldInfo;->getAnnotation()Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v3

    .line 521
    .local v3, "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v3, :cond_109

    invoke-interface {v3}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/alibaba/fastjson/util/ASMUtils;->checkName(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_109

    .line 522
    const/4 v4, 0x0

    .line 523
    goto :goto_94

    .line 526
    :cond_109
    invoke-virtual {v10}, Ljava/lang/Class;->isEnum()Z

    move-result v18

    if-eqz v18, :cond_11e

    .line 527
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v11

    .line 528
    .local v11, "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    instance-of v0, v11, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;

    move/from16 v18, v0

    if-nez v18, :cond_11e

    .line 529
    const/4 v4, 0x0

    .line 530
    goto/16 :goto_94

    .line 497
    .end local v11    # "fieldDeser":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    :cond_11e
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_87

    .line 547
    .end local v3    # "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v6    # "beanInfo":Lcom/alibaba/fastjson/util/JavaBeanInfo;
    .end local v7    # "defaultConstructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v10    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v12    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_122
    :try_start_122
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmFactory:Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual {v15, v0, v1, v2}, Lcom/alibaba/fastjson/parser/deserializer/ASMDeserializerFactory;->createJavaBeanDeserializer(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    :try_end_12f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_122 .. :try_end_12f} :catch_131
    .catch Lcom/alibaba/fastjson/JSONException; {:try_start_122 .. :try_end_12f} :catch_13f
    .catch Ljava/lang/Exception; {:try_start_122 .. :try_end_12f} :catch_14d

    move-result-object v15

    goto :goto_b4

    .line 551
    :catch_131
    move-exception v9

    .line 552
    .local v9, "ex":Ljava/lang/NoSuchMethodException;
    new-instance v15, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v15, v0, v1, v2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Ljava/lang/reflect/Type;)V

    goto/16 :goto_b4

    .line 553
    .end local v9    # "ex":Ljava/lang/NoSuchMethodException;
    :catch_13f
    move-exception v5

    .line 554
    .local v5, "asmError":Lcom/alibaba/fastjson/JSONException;
    new-instance v15, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v15, v0, v1, v2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;Ljava/lang/reflect/Type;)V

    goto/16 :goto_b4

    .line 555
    .end local v5    # "asmError":Lcom/alibaba/fastjson/JSONException;
    :catch_14d
    move-exception v8

    .line 556
    .local v8, "e":Ljava/lang/Exception;
    new-instance v15, Lcom/alibaba/fastjson/JSONException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "create asm deserializer error, "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v8}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15
.end method

.method public getDefaultClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 628
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->defaultClassLoader:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method public getDerializers()Lcom/alibaba/fastjson/util/IdentityHashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/alibaba/fastjson/util/IdentityHashMap",
            "<",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 278
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    return-object v0
.end method

.method public getDeserializer(Lcom/alibaba/fastjson/util/FieldInfo;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .registers 4
    .param p1, "fieldInfo"    # Lcom/alibaba/fastjson/util/FieldInfo;

    .prologue
    .line 576
    iget-object v0, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    iget-object v1, p1, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    invoke-virtual {p0, v0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v0

    return-object v0
.end method

.method public getDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .registers 17
    .param p2, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;"
        }
    .end annotation

    .prologue
    .line 304
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 305
    .local v6, "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    if-eqz v6, :cond_e

    move-object v11, v6

    .line 438
    :goto_d
    return-object v11

    .line 309
    :cond_e
    if-nez p2, :cond_12

    .line 310
    move-object/from16 p2, p1

    .line 313
    :cond_12
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    check-cast v6, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 314
    .restart local v6    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    if-eqz v6, :cond_20

    move-object v11, v6

    .line 315
    goto :goto_d

    .line 319
    :cond_20
    const-class v11, Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-virtual {p1, v11}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 320
    .local v1, "annotation":Lcom/alibaba/fastjson/annotation/JSONType;
    if-eqz v1, :cond_37

    .line 321
    invoke-interface {v1}, Lcom/alibaba/fastjson/annotation/JSONType;->mappingTo()Ljava/lang/Class;

    move-result-object v10

    .line 322
    .local v10, "mappingTo":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v11, Ljava/lang/Void;

    if-eq v10, v11, :cond_37

    .line 323
    invoke-virtual {p0, v10, v10}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v11

    goto :goto_d

    .line 328
    .end local v10    # "mappingTo":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_37
    move-object/from16 v0, p2

    instance-of v11, v0, Ljava/lang/reflect/WildcardType;

    if-nez v11, :cond_49

    move-object/from16 v0, p2

    instance-of v11, v0, Ljava/lang/reflect/TypeVariable;

    if-nez v11, :cond_49

    move-object/from16 v0, p2

    instance-of v11, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v11, :cond_51

    .line 329
    :cond_49
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    invoke-virtual {v11, p1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    check-cast v6, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 332
    .restart local v6    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    :cond_51
    if-eqz v6, :cond_55

    move-object v11, v6

    .line 333
    goto :goto_d

    .line 336
    :cond_55
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 337
    .local v4, "className":Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_5a
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyList:[Ljava/lang/String;

    array-length v11, v11

    if-ge v9, v11, :cond_8d

    .line 338
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->denyList:[Ljava/lang/String;

    aget-object v5, v11, v9

    .line 339
    .local v5, "deny":Ljava/lang/String;
    const/16 v11, 0x24

    const/16 v12, 0x2e

    invoke-virtual {v4, v11, v12}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    .line 340
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_8a

    .line 341
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "parser deny : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 337
    :cond_8a
    add-int/lit8 v9, v9, 0x1

    goto :goto_5a

    .line 345
    .end local v5    # "deny":Ljava/lang/String;
    :cond_8d
    const-string v11, "java.awt."

    invoke-virtual {v4, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_d5

    .line 346
    invoke-static {p1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->support(Ljava/lang/Class;)Z

    move-result v11

    if-eqz v11, :cond_d5

    .line 347
    sget-boolean v11, Lcom/alibaba/fastjson/parser/ParserConfig;->awtError:Z

    if-nez v11, :cond_d5

    .line 349
    :try_start_9f
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.awt.Point"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 350
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.awt.Font"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 351
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.awt.Rectangle"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 352
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.awt.Color"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_d3
    .catch Ljava/lang/Throwable; {:try_start_9f .. :try_end_d3} :catch_1e0

    .line 358
    :goto_d3
    sget-object v6, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    .line 362
    :cond_d5
    sget-boolean v11, Lcom/alibaba/fastjson/parser/ParserConfig;->jdk8Error:Z

    if-nez v11, :cond_187

    .line 364
    :try_start_d9
    const-string v11, "java.time."

    invoke-virtual {v4, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1e6

    .line 366
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.LocalDateTime"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 367
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.LocalDate"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 368
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.LocalTime"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 369
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.ZonedDateTime"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 370
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.OffsetDateTime"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 371
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.OffsetTime"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 372
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.ZoneOffset"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 373
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.ZoneRegion"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 374
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.ZoneId"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 375
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.Period"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 376
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.Duration"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 377
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.time.Instant"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 379
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    invoke-virtual {v11, p1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    move-object v0, v11

    check-cast v0, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-object v6, v0
    :try_end_187
    .catch Ljava/lang/Throwable; {:try_start_d9 .. :try_end_187} :catch_22e

    .line 395
    :cond_187
    :goto_187
    const-string v11, "java.nio.file.Path"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_196

    .line 396
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    sget-object v12, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {v11, p1, v12}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 399
    :cond_196
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    .line 401
    .local v3, "classLoader":Ljava/lang/ClassLoader;
    :try_start_19e
    const-class v11, Lcom/alibaba/fastjson/parser/deserializer/AutowiredObjectDeserializer;

    invoke-static {v11, v3}, Lcom/alibaba/fastjson/util/ServiceLoader;->load(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_1a8
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1cf

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/alibaba/fastjson/parser/deserializer/AutowiredObjectDeserializer;

    .line 403
    .local v2, "autowired":Lcom/alibaba/fastjson/parser/deserializer/AutowiredObjectDeserializer;
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/deserializer/AutowiredObjectDeserializer;->getAutowiredFor()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1bc
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1a8

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/reflect/Type;

    .line 404
    .local v8, "forType":Ljava/lang/reflect/Type;
    iget-object v13, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    invoke-virtual {v13, v8, v2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_1cd
    .catch Ljava/lang/Exception; {:try_start_19e .. :try_end_1cd} :catch_1ce

    goto :goto_1bc

    .line 407
    .end local v2    # "autowired":Lcom/alibaba/fastjson/parser/deserializer/AutowiredObjectDeserializer;
    .end local v8    # "forType":Ljava/lang/reflect/Type;
    :catch_1ce
    move-exception v11

    .line 411
    :cond_1cf
    if-nez v6, :cond_1db

    .line 412
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    check-cast v6, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 415
    .restart local v6    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    :cond_1db
    if-eqz v6, :cond_234

    move-object v11, v6

    .line 416
    goto/16 :goto_d

    .line 353
    .end local v3    # "classLoader":Ljava/lang/ClassLoader;
    :catch_1e0
    move-exception v7

    .line 355
    .local v7, "e":Ljava/lang/Throwable;
    const/4 v11, 0x1

    sput-boolean v11, Lcom/alibaba/fastjson/parser/ParserConfig;->awtError:Z

    goto/16 :goto_d3

    .line 380
    .end local v7    # "e":Ljava/lang/Throwable;
    :cond_1e6
    :try_start_1e6
    const-string v11, "java.util.Optional"

    invoke-virtual {v4, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_187

    .line 382
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.util.Optional"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 383
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.util.OptionalDouble"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 384
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.util.OptionalInt"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 385
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    const-string v12, "java.util.OptionalLong"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sget-object v13, Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;

    invoke-virtual {v11, v12, v13}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 387
    iget-object v11, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    invoke-virtual {v11, p1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    move-object v0, v11

    check-cast v0, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-object v6, v0
    :try_end_22c
    .catch Ljava/lang/Throwable; {:try_start_1e6 .. :try_end_22c} :catch_22e

    goto/16 :goto_187

    .line 389
    :catch_22e
    move-exception v7

    .line 391
    .restart local v7    # "e":Ljava/lang/Throwable;
    const/4 v11, 0x1

    sput-boolean v11, Lcom/alibaba/fastjson/parser/ParserConfig;->jdk8Error:Z

    goto/16 :goto_187

    .line 419
    .end local v7    # "e":Ljava/lang/Throwable;
    .restart local v3    # "classLoader":Ljava/lang/ClassLoader;
    :cond_234
    invoke-virtual {p1}, Ljava/lang/Class;->isEnum()Z

    move-result v11

    if-eqz v11, :cond_247

    .line 420
    new-instance v6, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;

    .end local v6    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    invoke-direct {v6, p1}, Lcom/alibaba/fastjson/parser/deserializer/EnumDeserializer;-><init>(Ljava/lang/Class;)V

    .line 436
    .restart local v6    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    :goto_23f
    move-object/from16 v0, p2

    invoke-virtual {p0, v0, v6}, Lcom/alibaba/fastjson/parser/ParserConfig;->putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V

    move-object v11, v6

    .line 438
    goto/16 :goto_d

    .line 421
    :cond_247
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v11

    if-eqz v11, :cond_250

    .line 422
    sget-object v6, Lcom/alibaba/fastjson/serializer/ObjectArrayCodec;->instance:Lcom/alibaba/fastjson/serializer/ObjectArrayCodec;

    goto :goto_23f

    .line 423
    :cond_250
    const-class v11, Ljava/util/Set;

    if-eq p1, v11, :cond_264

    const-class v11, Ljava/util/HashSet;

    if-eq p1, v11, :cond_264

    const-class v11, Ljava/util/Collection;

    if-eq p1, v11, :cond_264

    const-class v11, Ljava/util/List;

    if-eq p1, v11, :cond_264

    const-class v11, Ljava/util/ArrayList;

    if-ne p1, v11, :cond_267

    .line 425
    :cond_264
    sget-object v6, Lcom/alibaba/fastjson/serializer/CollectionCodec;->instance:Lcom/alibaba/fastjson/serializer/CollectionCodec;

    goto :goto_23f

    .line 426
    :cond_267
    const-class v11, Ljava/util/Collection;

    invoke-virtual {v11, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v11

    if-eqz v11, :cond_272

    .line 427
    sget-object v6, Lcom/alibaba/fastjson/serializer/CollectionCodec;->instance:Lcom/alibaba/fastjson/serializer/CollectionCodec;

    goto :goto_23f

    .line 428
    :cond_272
    const-class v11, Ljava/util/Map;

    invoke-virtual {v11, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v11

    if-eqz v11, :cond_27d

    .line 429
    sget-object v6, Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/MapDeserializer;

    goto :goto_23f

    .line 430
    :cond_27d
    const-class v11, Ljava/lang/Throwable;

    invoke-virtual {v11, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v11

    if-eqz v11, :cond_28b

    .line 431
    new-instance v6, Lcom/alibaba/fastjson/parser/deserializer/ThrowableDeserializer;

    .end local v6    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    invoke-direct {v6, p0, p1}, Lcom/alibaba/fastjson/parser/deserializer/ThrowableDeserializer;-><init>(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;)V

    .restart local v6    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    goto :goto_23f

    .line 433
    :cond_28b
    invoke-virtual/range {p0 .. p2}, Lcom/alibaba/fastjson/parser/ParserConfig;->createJavaBeanDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v6

    goto :goto_23f
.end method

.method public getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    .registers 5
    .param p1, "type"    # Ljava/lang/reflect/Type;

    .prologue
    .line 282
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    invoke-virtual {v2, p1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .line 283
    .local v0, "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    if-eqz v0, :cond_b

    .line 300
    .end local v0    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    :goto_a
    return-object v0

    .line 287
    .restart local v0    # "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    :cond_b
    instance-of v2, p1, Ljava/lang/Class;

    if-eqz v2, :cond_17

    move-object v2, p1

    .line 288
    check-cast v2, Ljava/lang/Class;

    invoke-virtual {p0, v2, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v0

    goto :goto_a

    .line 291
    :cond_17
    instance-of v2, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v2, :cond_32

    move-object v2, p1

    .line 292
    check-cast v2, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v2}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 293
    .local v1, "rawType":Ljava/lang/reflect/Type;
    instance-of v2, v1, Ljava/lang/Class;

    if-eqz v2, :cond_2d

    .line 294
    check-cast v1, Ljava/lang/Class;

    .end local v1    # "rawType":Ljava/lang/reflect/Type;
    invoke-virtual {p0, v1, p1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/Class;Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v0

    goto :goto_a

    .line 296
    .restart local v1    # "rawType":Ljava/lang/reflect/Type;
    :cond_2d
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v0

    goto :goto_a

    .line 300
    .end local v1    # "rawType":Ljava/lang/reflect/Type;
    :cond_32
    sget-object v0, Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/JavaObjectDeserializer;

    goto :goto_a
.end method

.method public isAsmEnable()Z
    .registers 2

    .prologue
    .line 270
    iget-boolean v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmEnable:Z

    return v0
.end method

.method public putDeserializer(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;)V
    .registers 4
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "deserializer"    # Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    .prologue
    .line 572
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->derializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    invoke-virtual {v0, p1, p2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 573
    return-void
.end method

.method public setAsmEnable(Z)V
    .registers 2
    .param p1, "asmEnable"    # Z

    .prologue
    .line 274
    iput-boolean p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->asmEnable:Z

    .line 275
    return-void
.end method

.method public setDefaultClassLoader(Ljava/lang/ClassLoader;)V
    .registers 2
    .param p1, "defaultClassLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 632
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/ParserConfig;->defaultClassLoader:Ljava/lang/ClassLoader;

    .line 633
    return-void
.end method
