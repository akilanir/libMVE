.class public Lcom/alibaba/fastjson/serializer/SerializeConfig;
.super Ljava/lang/Object;
.source "SerializeConfig.java"


# static fields
.field private static awtError:Z

.field public static final globalInstance:Lcom/alibaba/fastjson/serializer/SerializeConfig;

.field private static jdk8Error:Z

.field private static oracleJdbcError:Z


# instance fields
.field private asm:Z

.field private asmFactory:Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;

.field private final serializers:Lcom/alibaba/fastjson/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/alibaba/fastjson/util/IdentityHashMap",
            "<",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/serializer/ObjectSerializer;",
            ">;"
        }
    .end annotation
.end field

.field private typeKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 74
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/SerializeConfig;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->globalInstance:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    .line 76
    sput-boolean v1, Lcom/alibaba/fastjson/serializer/SerializeConfig;->awtError:Z

    .line 77
    sput-boolean v1, Lcom/alibaba/fastjson/serializer/SerializeConfig;->jdk8Error:Z

    .line 78
    sput-boolean v1, Lcom/alibaba/fastjson/serializer/SerializeConfig;->oracleJdbcError:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 168
    const/16 v0, 0x400

    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeConfig;-><init>(I)V

    .line 169
    return-void
.end method

.method public constructor <init>(I)V
    .registers 7
    .param p1, "tableSize"    # I

    .prologue
    const/4 v3, 0x0

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    sget-boolean v2, Lcom/alibaba/fastjson/util/ASMUtils;->IS_ANDROID:Z

    if-nez v2, :cond_169

    const/4 v2, 0x1

    :goto_9
    iput-boolean v2, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->asm:Z

    .line 85
    sget-object v2, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    iput-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->typeKey:Ljava/lang/String;

    .line 172
    new-instance v2, Lcom/alibaba/fastjson/util/IdentityHashMap;

    const/16 v4, 0x400

    invoke-direct {v2, v4}, Lcom/alibaba/fastjson/util/IdentityHashMap;-><init>(I)V

    iput-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->serializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    .line 175
    :try_start_18
    iget-boolean v2, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->asm:Z

    if-eqz v2, :cond_23

    .line 176
    new-instance v2, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;

    invoke-direct {v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;-><init>()V

    iput-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->asmFactory:Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;
    :try_end_23
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_18 .. :try_end_23} :catch_16c
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_18 .. :try_end_23} :catch_171

    .line 184
    :cond_23
    :goto_23
    const-class v2, Ljava/lang/Boolean;

    sget-object v3, Lcom/alibaba/fastjson/serializer/BooleanCodec;->instance:Lcom/alibaba/fastjson/serializer/BooleanCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 185
    const-class v2, Ljava/lang/Character;

    sget-object v3, Lcom/alibaba/fastjson/serializer/CharacterCodec;->instance:Lcom/alibaba/fastjson/serializer/CharacterCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 186
    const-class v2, Ljava/lang/Byte;

    sget-object v3, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 187
    const-class v2, Ljava/lang/Short;

    sget-object v3, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 188
    const-class v2, Ljava/lang/Integer;

    sget-object v3, Lcom/alibaba/fastjson/serializer/IntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/IntegerCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 189
    const-class v2, Ljava/lang/Long;

    sget-object v3, Lcom/alibaba/fastjson/serializer/LongCodec;->instance:Lcom/alibaba/fastjson/serializer/LongCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 190
    const-class v2, Ljava/lang/Float;

    sget-object v3, Lcom/alibaba/fastjson/serializer/FloatCodec;->instance:Lcom/alibaba/fastjson/serializer/FloatCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 191
    const-class v2, Ljava/lang/Double;

    sget-object v3, Lcom/alibaba/fastjson/serializer/DoubleSerializer;->instance:Lcom/alibaba/fastjson/serializer/DoubleSerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 192
    const-class v2, Ljava/math/BigDecimal;

    sget-object v3, Lcom/alibaba/fastjson/serializer/BigDecimalCodec;->instance:Lcom/alibaba/fastjson/serializer/BigDecimalCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 193
    const-class v2, Ljava/math/BigInteger;

    sget-object v3, Lcom/alibaba/fastjson/serializer/BigIntegerCodec;->instance:Lcom/alibaba/fastjson/serializer/BigIntegerCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 194
    const-class v2, Ljava/lang/String;

    sget-object v3, Lcom/alibaba/fastjson/serializer/StringCodec;->instance:Lcom/alibaba/fastjson/serializer/StringCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 195
    const-class v2, [B

    sget-object v3, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;->instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 196
    const-class v2, [S

    sget-object v3, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;->instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 197
    const-class v2, [I

    sget-object v3, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;->instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 198
    const-class v2, [J

    sget-object v3, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;->instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 199
    const-class v2, [F

    sget-object v3, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;->instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 200
    const-class v2, [D

    sget-object v3, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;->instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 201
    const-class v2, [Z

    sget-object v3, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;->instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 202
    const-class v2, [C

    sget-object v3, Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;->instance:Lcom/alibaba/fastjson/serializer/PrimitiveArraySerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 203
    const-class v2, [Ljava/lang/Object;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ObjectArrayCodec;->instance:Lcom/alibaba/fastjson/serializer/ObjectArrayCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 204
    const-class v2, Ljava/lang/Class;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 206
    const-class v2, Ljava/text/SimpleDateFormat;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 207
    const-class v2, Ljava/util/Currency;

    new-instance v3, Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-direct {v3}, Lcom/alibaba/fastjson/serializer/MiscCodec;-><init>()V

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 208
    const-class v2, Ljava/util/TimeZone;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 209
    const-class v2, Ljava/net/InetAddress;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 210
    const-class v2, Ljava/net/Inet4Address;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 211
    const-class v2, Ljava/net/Inet6Address;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 212
    const-class v2, Ljava/net/InetSocketAddress;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 213
    const-class v2, Ljava/io/File;

    sget-object v3, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 214
    const-class v2, Ljava/lang/Appendable;

    sget-object v3, Lcom/alibaba/fastjson/serializer/AppendableSerializer;->instance:Lcom/alibaba/fastjson/serializer/AppendableSerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 215
    const-class v2, Ljava/lang/StringBuffer;

    sget-object v3, Lcom/alibaba/fastjson/serializer/AppendableSerializer;->instance:Lcom/alibaba/fastjson/serializer/AppendableSerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 216
    const-class v2, Ljava/lang/StringBuilder;

    sget-object v3, Lcom/alibaba/fastjson/serializer/AppendableSerializer;->instance:Lcom/alibaba/fastjson/serializer/AppendableSerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 217
    const-class v2, Ljava/nio/charset/Charset;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ToStringSerializer;->instance:Lcom/alibaba/fastjson/serializer/ToStringSerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 218
    const-class v2, Ljava/util/regex/Pattern;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ToStringSerializer;->instance:Lcom/alibaba/fastjson/serializer/ToStringSerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 219
    const-class v2, Ljava/util/Locale;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ToStringSerializer;->instance:Lcom/alibaba/fastjson/serializer/ToStringSerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 220
    const-class v2, Ljava/net/URI;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ToStringSerializer;->instance:Lcom/alibaba/fastjson/serializer/ToStringSerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 221
    const-class v2, Ljava/net/URL;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ToStringSerializer;->instance:Lcom/alibaba/fastjson/serializer/ToStringSerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 222
    const-class v2, Ljava/util/UUID;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ToStringSerializer;->instance:Lcom/alibaba/fastjson/serializer/ToStringSerializer;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 225
    const-class v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    sget-object v3, Lcom/alibaba/fastjson/serializer/AtomicCodec;->instance:Lcom/alibaba/fastjson/serializer/AtomicCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 226
    const-class v2, Ljava/util/concurrent/atomic/AtomicInteger;

    sget-object v3, Lcom/alibaba/fastjson/serializer/AtomicCodec;->instance:Lcom/alibaba/fastjson/serializer/AtomicCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 227
    const-class v2, Ljava/util/concurrent/atomic/AtomicLong;

    sget-object v3, Lcom/alibaba/fastjson/serializer/AtomicCodec;->instance:Lcom/alibaba/fastjson/serializer/AtomicCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 228
    const-class v2, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ReferenceCodec;->instance:Lcom/alibaba/fastjson/serializer/ReferenceCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 229
    const-class v2, Ljava/util/concurrent/atomic/AtomicIntegerArray;

    sget-object v3, Lcom/alibaba/fastjson/serializer/AtomicCodec;->instance:Lcom/alibaba/fastjson/serializer/AtomicCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 230
    const-class v2, Ljava/util/concurrent/atomic/AtomicLongArray;

    sget-object v3, Lcom/alibaba/fastjson/serializer/AtomicCodec;->instance:Lcom/alibaba/fastjson/serializer/AtomicCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 232
    const-class v2, Ljava/lang/ref/WeakReference;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ReferenceCodec;->instance:Lcom/alibaba/fastjson/serializer/ReferenceCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 233
    const-class v2, Ljava/lang/ref/SoftReference;

    sget-object v3, Lcom/alibaba/fastjson/serializer/ReferenceCodec;->instance:Lcom/alibaba/fastjson/serializer/ReferenceCodec;

    invoke-virtual {p0, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 234
    return-void

    :cond_169
    move v2, v3

    .line 80
    goto/16 :goto_9

    .line 178
    :catch_16c
    move-exception v0

    .line 179
    .local v0, "eror":Ljava/lang/NoClassDefFoundError;
    iput-boolean v3, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->asm:Z

    goto/16 :goto_23

    .line 180
    .end local v0    # "eror":Ljava/lang/NoClassDefFoundError;
    :catch_171
    move-exception v1

    .line 181
    .local v1, "error":Ljava/lang/ExceptionInInitializerError;
    iput-boolean v3, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->asm:Z

    goto/16 :goto_23
.end method

.method public static getGlobalInstance()Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .registers 1

    .prologue
    .line 164
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->globalInstance:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    return-object v0
.end method


# virtual methods
.method public addFilter(Ljava/lang/Class;Lcom/alibaba/fastjson/serializer/SerializeFilter;)V
    .registers 5
    .param p2, "filter"    # Lcom/alibaba/fastjson/serializer/SerializeFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/serializer/SerializeFilter;",
            ")V"
        }
    .end annotation

    .prologue
    .line 237
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v0

    .line 239
    .local v0, "serializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    instance-of v1, v0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;

    if-eqz v1, :cond_d

    .line 240
    check-cast v0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;

    .end local v0    # "serializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    invoke-virtual {v0, p2}, Lcom/alibaba/fastjson/serializer/SerializeFilterable;->addFilter(Lcom/alibaba/fastjson/serializer/SerializeFilter;)V

    .line 242
    :cond_d
    return-void
.end method

.method public final createASMSerializer(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/alibaba/fastjson/serializer/ObjectSerializer;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->asmFactory:Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->createJavaBeanSerializer(Ljava/lang/Class;Ljava/util/Map;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v0

    return-object v0
.end method

.method public createJavaBeanSerializer(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/alibaba/fastjson/serializer/ObjectSerializer;"
        }
    .end annotation

    .prologue
    .line 103
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v5

    if-nez v5, :cond_10

    .line 104
    new-instance v2, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    invoke-direct {v2, p1}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;-><init>(Ljava/lang/Class;)V

    .line 149
    :cond_f
    :goto_f
    return-object v2

    .line 107
    :cond_10
    iget-boolean v1, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->asm:Z

    .line 109
    .local v1, "asm":Z
    if-eqz v1, :cond_1e

    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->asmFactory:Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;

    iget-object v5, v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->classLoader:Lcom/alibaba/fastjson/util/ASMClassLoader;

    invoke-virtual {v5, p1}, Lcom/alibaba/fastjson/util/ASMClassLoader;->isExternalClass(Ljava/lang/Class;)Z

    move-result v5

    if-nez v5, :cond_26

    :cond_1e
    const-class v5, Ljava/io/Serializable;

    if-eq p1, v5, :cond_26

    const-class v5, Ljava/lang/Object;

    if-ne p1, v5, :cond_27

    .line 111
    :cond_26
    const/4 v1, 0x0

    .line 115
    :cond_27
    const-class v5, Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-virtual {p1, v5}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 116
    .local v0, "annotation":Lcom/alibaba/fastjson/annotation/JSONType;
    if-eqz v0, :cond_38

    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONType;->asm()Z

    move-result v5

    if-nez v5, :cond_38

    .line 117
    const/4 v1, 0x0

    .line 121
    :cond_38
    if-eqz v1, :cond_45

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/alibaba/fastjson/util/ASMUtils;->checkName(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_45

    .line 122
    const/4 v1, 0x0

    .line 125
    :cond_45
    if-eqz v1, :cond_66

    .line 126
    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v6

    array-length v7, v6

    const/4 v5, 0x0

    .end local v0    # "annotation":Lcom/alibaba/fastjson/annotation/JSONType;
    :goto_4d
    if-ge v5, v7, :cond_66

    aget-object v4, v6, v5

    .line 127
    .local v4, "field":Ljava/lang/reflect/Field;
    const-class v8, Lcom/alibaba/fastjson/annotation/JSONField;

    invoke-virtual {v4, v8}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 128
    .local v0, "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v0, :cond_74

    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/alibaba/fastjson/util/ASMUtils;->checkName(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_74

    .line 129
    const/4 v1, 0x0

    .line 135
    .end local v0    # "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v4    # "field":Ljava/lang/reflect/Field;
    :cond_66
    if-eqz v1, :cond_6e

    .line 137
    :try_start_68
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->createASMSerializer(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :try_end_6b
    .catch Ljava/lang/ClassCastException; {:try_start_68 .. :try_end_6b} :catch_91
    .catch Ljava/lang/Throwable; {:try_start_68 .. :try_end_6b} :catch_77

    move-result-object v2

    .line 138
    .local v2, "asmSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    if-nez v2, :cond_f

    .line 149
    .end local v2    # "asmSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :cond_6e
    :goto_6e
    new-instance v2, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    invoke-direct {v2, p1}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;-><init>(Ljava/lang/Class;)V

    goto :goto_f

    .line 126
    .restart local v0    # "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .restart local v4    # "field":Ljava/lang/reflect/Field;
    :cond_74
    add-int/lit8 v5, v5, 0x1

    goto :goto_4d

    .line 143
    .end local v0    # "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v4    # "field":Ljava/lang/reflect/Field;
    :catch_77
    move-exception v3

    .line 144
    .local v3, "e":Ljava/lang/Throwable;
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "create asm serializer error, class "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 141
    .end local v3    # "e":Ljava/lang/Throwable;
    :catch_91
    move-exception v5

    goto :goto_6e
.end method

.method public final get(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .registers 3
    .param p1, "key"    # Ljava/lang/reflect/Type;

    .prologue
    .line 434
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->serializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    return-object v0
.end method

.method public getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .registers 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/alibaba/fastjson/serializer/ObjectSerializer;"
        }
    .end annotation

    .prologue
    .line 245
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->serializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    .line 247
    .local v18, "writer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    if-nez v18, :cond_65

    .line 249
    :try_start_12
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    .line 250
    .local v4, "classLoader":Ljava/lang/ClassLoader;
    const-class v19, Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;

    move-object/from16 v0, v19

    invoke-static {v0, v4}, Lcom/alibaba/fastjson/util/ServiceLoader;->load(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_26
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_55

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .line 251
    .local v15, "o":Ljava/lang/Object;
    instance-of v0, v15, Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;

    move/from16 v20, v0

    if-eqz v20, :cond_26

    .line 255
    move-object v0, v15

    check-cast v0, Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;

    move-object v3, v0

    .line 256
    .local v3, "autowired":Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;
    invoke-interface {v3}, Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;->getAutowiredFor()Ljava/util/Set;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_42
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_26

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/reflect/Type;

    .line 257
    .local v10, "forType":Ljava/lang/reflect/Type;
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z
    :try_end_53
    .catch Ljava/lang/ClassCastException; {:try_start_12 .. :try_end_53} :catch_54

    goto :goto_42

    .line 260
    .end local v3    # "autowired":Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;
    .end local v4    # "classLoader":Ljava/lang/ClassLoader;
    .end local v10    # "forType":Ljava/lang/reflect/Type;
    .end local v15    # "o":Ljava/lang/Object;
    :catch_54
    move-exception v19

    .line 264
    :cond_55
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->serializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    .end local v18    # "writer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    check-cast v18, Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    .line 267
    .restart local v18    # "writer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :cond_65
    if-nez v18, :cond_c4

    .line 268
    const-class v19, Lcom/alibaba/fastjson/JSON;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    .line 269
    .restart local v4    # "classLoader":Ljava/lang/ClassLoader;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v19

    move-object/from16 v0, v19

    if-eq v4, v0, :cond_c4

    .line 271
    :try_start_79
    const-class v19, Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;

    move-object/from16 v0, v19

    invoke-static {v0, v4}, Lcom/alibaba/fastjson/util/ServiceLoader;->load(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_85
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_b4

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .line 273
    .restart local v15    # "o":Ljava/lang/Object;
    instance-of v0, v15, Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;

    move/from16 v20, v0

    if-eqz v20, :cond_85

    .line 277
    move-object v0, v15

    check-cast v0, Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;

    move-object v3, v0

    .line 278
    .restart local v3    # "autowired":Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;
    invoke-interface {v3}, Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;->getAutowiredFor()Ljava/util/Set;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_a1
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_85

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/reflect/Type;

    .line 279
    .restart local v10    # "forType":Ljava/lang/reflect/Type;
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v3}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z
    :try_end_b2
    .catch Ljava/lang/ClassCastException; {:try_start_79 .. :try_end_b2} :catch_b3

    goto :goto_a1

    .line 282
    .end local v3    # "autowired":Lcom/alibaba/fastjson/serializer/AutowiredObjectSerializer;
    .end local v10    # "forType":Ljava/lang/reflect/Type;
    .end local v15    # "o":Ljava/lang/Object;
    :catch_b3
    move-exception v19

    .line 286
    :cond_b4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->serializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    .end local v18    # "writer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    check-cast v18, Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    .line 290
    .end local v4    # "classLoader":Ljava/lang/ClassLoader;
    .restart local v18    # "writer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :cond_c4
    if-nez v18, :cond_ed

    .line 291
    const-class v19, Ljava/util/Map;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_f0

    .line 292
    sget-object v19, Lcom/alibaba/fastjson/serializer/MapSerializer;->instance:Lcom/alibaba/fastjson/serializer/MapSerializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 428
    :goto_dd
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->serializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    .end local v18    # "writer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    check-cast v18, Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    .restart local v18    # "writer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    :cond_ed
    move-object/from16 v17, v18

    .line 430
    :goto_ef
    return-object v17

    .line 293
    :cond_f0
    const-class v19, Ljava/util/List;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_108

    .line 294
    sget-object v19, Lcom/alibaba/fastjson/serializer/ListSerializer;->instance:Lcom/alibaba/fastjson/serializer/ListSerializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto :goto_dd

    .line 295
    :cond_108
    const-class v19, Ljava/util/Collection;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_120

    .line 296
    sget-object v19, Lcom/alibaba/fastjson/serializer/CollectionCodec;->instance:Lcom/alibaba/fastjson/serializer/CollectionCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto :goto_dd

    .line 297
    :cond_120
    const-class v19, Ljava/util/Date;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_138

    .line 298
    sget-object v19, Lcom/alibaba/fastjson/serializer/DateCodec;->instance:Lcom/alibaba/fastjson/serializer/DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto :goto_dd

    .line 299
    :cond_138
    const-class v19, Lcom/alibaba/fastjson/JSONAware;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_150

    .line 300
    sget-object v19, Lcom/alibaba/fastjson/serializer/JSONAwareSerializer;->instance:Lcom/alibaba/fastjson/serializer/JSONAwareSerializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto :goto_dd

    .line 301
    :cond_150
    const-class v19, Lcom/alibaba/fastjson/serializer/JSONSerializable;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_169

    .line 302
    sget-object v19, Lcom/alibaba/fastjson/serializer/JSONSerializableSerializer;->instance:Lcom/alibaba/fastjson/serializer/JSONSerializableSerializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 303
    :cond_169
    const-class v19, Lcom/alibaba/fastjson/JSONStreamAware;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_182

    .line 304
    sget-object v19, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 305
    :cond_182
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->isEnum()Z

    move-result v19

    if-nez v19, :cond_198

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v19

    if-eqz v19, :cond_1a5

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->isEnum()Z

    move-result v19

    if-eqz v19, :cond_1a5

    .line 306
    :cond_198
    sget-object v19, Lcom/alibaba/fastjson/serializer/EnumSerializer;->instance:Lcom/alibaba/fastjson/serializer/EnumSerializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 307
    :cond_1a5
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->isArray()Z

    move-result v19

    if-eqz v19, :cond_1c7

    .line 308
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v7

    .line 309
    .local v7, "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v6

    .line 310
    .local v6, "compObjectSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    new-instance v19, Lcom/alibaba/fastjson/serializer/ArraySerializer;

    move-object/from16 v0, v19

    invoke-direct {v0, v7, v6}, Lcom/alibaba/fastjson/serializer/ArraySerializer;-><init>(Ljava/lang/Class;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)V

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 311
    .end local v6    # "compObjectSerializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .end local v7    # "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1c7
    const-class v19, Ljava/lang/Throwable;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_1f9

    .line 312
    invoke-static/range {p1 .. p1}, Lcom/alibaba/fastjson/util/TypeUtils;->getSerializeFeatures(Ljava/lang/Class;)I

    move-result v9

    .line 313
    .local v9, "features":I
    sget-object v19, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v19

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    move/from16 v19, v0

    or-int v9, v9, v19

    .line 314
    new-instance v19, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2, v9}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;-><init>(Ljava/lang/Class;Ljava/util/Map;I)V

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 315
    .end local v9    # "features":I
    :cond_1f9
    const-class v19, Ljava/util/TimeZone;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_212

    .line 316
    sget-object v19, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 317
    :cond_212
    const-class v19, Ljava/lang/Appendable;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_22b

    .line 318
    sget-object v19, Lcom/alibaba/fastjson/serializer/AppendableSerializer;->instance:Lcom/alibaba/fastjson/serializer/AppendableSerializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 319
    :cond_22b
    const-class v19, Ljava/nio/charset/Charset;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_244

    .line 320
    sget-object v19, Lcom/alibaba/fastjson/serializer/ToStringSerializer;->instance:Lcom/alibaba/fastjson/serializer/ToStringSerializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 321
    :cond_244
    const-class v19, Ljava/util/Enumeration;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_25d

    .line 322
    sget-object v19, Lcom/alibaba/fastjson/serializer/EnumerationSerializer;->instance:Lcom/alibaba/fastjson/serializer/EnumerationSerializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 323
    :cond_25d
    const-class v19, Ljava/util/Calendar;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_276

    .line 324
    sget-object v19, Lcom/alibaba/fastjson/serializer/CalendarCodec;->instance:Lcom/alibaba/fastjson/serializer/CalendarCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 325
    :cond_276
    const-class v19, Ljava/sql/Clob;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_28f

    .line 326
    sget-object v19, Lcom/alibaba/fastjson/serializer/ClobSeriliazer;->instance:Lcom/alibaba/fastjson/serializer/ClobSeriliazer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 327
    :cond_28f
    invoke-static/range {p1 .. p1}, Lcom/alibaba/fastjson/util/TypeUtils;->isPath(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_2a2

    .line 328
    sget-object v19, Lcom/alibaba/fastjson/serializer/ToStringSerializer;->instance:Lcom/alibaba/fastjson/serializer/ToStringSerializer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 329
    :cond_2a2
    const-class v19, Ljava/lang/Iterable;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-nez v19, :cond_2ba

    const-class v19, Ljava/util/Iterator;

    .line 330
    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_2c7

    .line 331
    :cond_2ba
    sget-object v19, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd

    .line 333
    :cond_2c7
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    .line 334
    .local v5, "className":Ljava/lang/String;
    const-string v19, "java.awt."

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_32d

    .line 335
    invoke-static/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->support(Ljava/lang/Class;)Z

    move-result v19

    if-eqz v19, :cond_32d

    .line 338
    sget-boolean v19, Lcom/alibaba/fastjson/serializer/SerializeConfig;->awtError:Z

    if-nez v19, :cond_323

    .line 340
    :try_start_2df
    const-string v19, "java.awt.Color"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 341
    const-string v19, "java.awt.Font"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 342
    const-string v19, "java.awt.Point"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 343
    const-string v19, "java.awt.Rectangle"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z
    :try_end_323
    .catch Ljava/lang/Throwable; {:try_start_2df .. :try_end_323} :catch_327

    .line 349
    :cond_323
    :goto_323
    sget-object v17, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    goto/16 :goto_ef

    .line 344
    :catch_327
    move-exception v8

    .line 345
    .local v8, "e":Ljava/lang/Throwable;
    const/16 v19, 0x1

    sput-boolean v19, Lcom/alibaba/fastjson/serializer/SerializeConfig;->awtError:Z

    goto :goto_323

    .line 353
    .end local v8    # "e":Ljava/lang/Throwable;
    :cond_32d
    sget-boolean v19, Lcom/alibaba/fastjson/serializer/SerializeConfig;->jdk8Error:Z

    if-nez v19, :cond_463

    const-string v19, "java.time."

    .line 354
    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_345

    const-string v19, "java.util.Optional"

    .line 355
    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_463

    .line 358
    :cond_345
    :try_start_345
    const-string v19, "java.time.LocalDateTime"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 359
    const-string v19, "java.time.LocalDate"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 360
    const-string v19, "java.time.LocalTime"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 361
    const-string v19, "java.time.ZonedDateTime"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 362
    const-string v19, "java.time.OffsetDateTime"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 363
    const-string v19, "java.time.OffsetTime"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 364
    const-string v19, "java.time.ZoneOffset"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 365
    const-string v19, "java.time.ZoneRegion"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 366
    const-string v19, "java.time.Period"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 367
    const-string v19, "java.time.Duration"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 368
    const-string v19, "java.time.Instant"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/Jdk8DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 370
    const-string v19, "java.util.Optional"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 371
    const-string v19, "java.util.OptionalDouble"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 372
    const-string v19, "java.util.OptionalInt"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 373
    const-string v19, "java.util.OptionalLong"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;->instance:Lcom/alibaba/fastjson/parser/deserializer/OptionalCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 375
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->serializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    check-cast v0, Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-object/from16 v18, v0
    :try_end_458
    .catch Ljava/lang/Throwable; {:try_start_345 .. :try_end_458} :catch_45e

    .line 376
    if-eqz v18, :cond_463

    move-object/from16 v17, v18

    .line 377
    goto/16 :goto_ef

    .line 379
    :catch_45e
    move-exception v8

    .line 381
    .restart local v8    # "e":Ljava/lang/Throwable;
    const/16 v19, 0x1

    sput-boolean v19, Lcom/alibaba/fastjson/serializer/SerializeConfig;->jdk8Error:Z

    .line 385
    .end local v8    # "e":Ljava/lang/Throwable;
    :cond_463
    sget-boolean v19, Lcom/alibaba/fastjson/serializer/SerializeConfig;->oracleJdbcError:Z

    if-nez v19, :cond_4b2

    const-string v19, "oracle.sql."

    .line 386
    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_4b2

    .line 388
    :try_start_471
    const-string v19, "oracle.sql.DATE"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/serializer/DateCodec;->instance:Lcom/alibaba/fastjson/serializer/DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 389
    const-string v19, "oracle.sql.TIMESTAMP"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    sget-object v20, Lcom/alibaba/fastjson/serializer/DateCodec;->instance:Lcom/alibaba/fastjson/serializer/DateCodec;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    .line 391
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->serializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    check-cast v0, Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-object/from16 v18, v0
    :try_end_4a7
    .catch Ljava/lang/Throwable; {:try_start_471 .. :try_end_4a7} :catch_4ad

    .line 392
    if-eqz v18, :cond_4b2

    move-object/from16 v17, v18

    .line 393
    goto/16 :goto_ef

    .line 395
    :catch_4ad
    move-exception v8

    .line 397
    .restart local v8    # "e":Ljava/lang/Throwable;
    const/16 v19, 0x1

    sput-boolean v19, Lcom/alibaba/fastjson/serializer/SerializeConfig;->oracleJdbcError:Z

    .line 401
    .end local v8    # "e":Ljava/lang/Throwable;
    :cond_4b2
    const/4 v12, 0x0

    .line 402
    .local v12, "isCglibProxy":Z
    const/4 v13, 0x0

    .line 403
    .local v13, "isJavassistProxy":Z
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v20

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v21, v0

    const/16 v19, 0x0

    :goto_4bf
    move/from16 v0, v19

    move/from16 v1, v21

    if-ge v0, v1, :cond_4e0

    aget-object v14, v20, v19

    .line 404
    .local v14, "item":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v14}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    .line 405
    .local v11, "interfaceName":Ljava/lang/String;
    const-string v22, "net.sf.cglib.proxy.Factory"

    move-object/from16 v0, v22

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_4df

    const-string v22, "org.springframework.cglib.proxy.Factory"

    .line 406
    move-object/from16 v0, v22

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_4fb

    .line 407
    :cond_4df
    const/4 v12, 0x1

    .line 417
    .end local v11    # "interfaceName":Ljava/lang/String;
    .end local v14    # "item":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4e0
    :goto_4e0
    if-nez v12, :cond_4e4

    if-eqz v13, :cond_514

    .line 418
    :cond_4e4
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v16

    .line 420
    .local v16, "superClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v17

    .line 421
    .local v17, "superWriter":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_ef

    .line 409
    .end local v16    # "superClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v17    # "superWriter":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .restart local v11    # "interfaceName":Ljava/lang/String;
    .restart local v14    # "item":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4fb
    const-string v22, "javassist.util.proxy.ProxyObject"

    move-object/from16 v0, v22

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_50f

    const-string v22, "org.apache.ibatis.javassist.util.proxy.ProxyObject"

    .line 410
    move-object/from16 v0, v22

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_511

    .line 412
    :cond_50f
    const/4 v13, 0x1

    .line 413
    goto :goto_4e0

    .line 403
    :cond_511
    add-int/lit8 v19, v19, 0x1

    goto :goto_4bf

    .line 425
    .end local v11    # "interfaceName":Ljava/lang/String;
    .end local v14    # "item":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_514
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->createJavaBeanSerializer(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z

    goto/16 :goto_dd
.end method

.method public getTypeKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->typeKey:Ljava/lang/String;

    return-object v0
.end method

.method public isAsmEnable()Z
    .registers 2

    .prologue
    .line 153
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->asm:Z

    return v0
.end method

.method public put(Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/serializer/ObjectSerializer;)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/reflect/Type;
    .param p2, "value"    # Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    .prologue
    .line 438
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->serializers:Lcom/alibaba/fastjson/util/IdentityHashMap;

    invoke-virtual {v0, p1, p2}, Lcom/alibaba/fastjson/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setAsmEnable(Z)V
    .registers 3
    .param p1, "asmEnable"    # Z

    .prologue
    .line 157
    sget-boolean v0, Lcom/alibaba/fastjson/util/ASMUtils;->IS_ANDROID:Z

    if-eqz v0, :cond_5

    .line 161
    :goto_4
    return-void

    .line 160
    :cond_5
    iput-boolean p1, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->asm:Z

    goto :goto_4
.end method

.method public setTypeKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "typeKey"    # Ljava/lang/String;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeConfig;->typeKey:Ljava/lang/String;

    .line 95
    return-void
.end method
