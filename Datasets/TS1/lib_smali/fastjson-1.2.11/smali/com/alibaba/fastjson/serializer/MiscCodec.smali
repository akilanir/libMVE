.class public Lcom/alibaba/fastjson/serializer/MiscCodec;
.super Ljava/lang/Object;
.source "MiscCodec.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

.field private static method_paths_get:Ljava/lang/reflect/Method;

.field private static method_paths_get_error:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 56
    new-instance v0, Lcom/alibaba/fastjson/serializer/MiscCodec;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/MiscCodec;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    .line 58
    const/4 v0, 0x0

    sput-boolean v0, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get_error:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 23
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "clazz"    # Ljava/lang/reflect/Type;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 151
    move-object/from16 v0, p1

    iget-object v8, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 153
    .local v8, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    const-class v14, Ljava/net/InetSocketAddress;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_8c

    .line 154
    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v14

    const/16 v15, 0x8

    if-ne v14, v15, :cond_17

    .line 155
    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 156
    const/4 v3, 0x0

    .line 319
    :goto_16
    return-object v3

    .line 159
    :cond_17
    const/16 v14, 0xc

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 161
    const/4 v1, 0x0

    .line 162
    .local v1, "address":Ljava/net/InetAddress;
    const/4 v12, 0x0

    .line 164
    .local v12, "port":I
    :goto_20
    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v7

    .line 165
    .local v7, "key":Ljava/lang/String;
    const/16 v14, 0x11

    invoke-interface {v8, v14}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 167
    const-string v14, "address"

    invoke-virtual {v7, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4e

    .line 168
    const/16 v14, 0x11

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 169
    const-class v14, Ljava/net/InetAddress;

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "address":Ljava/net/InetAddress;
    check-cast v1, Ljava/net/InetAddress;

    .line 182
    .restart local v1    # "address":Ljava/net/InetAddress;
    :goto_42
    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v14

    const/16 v15, 0x10

    if-ne v14, v15, :cond_7f

    .line 183
    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    goto :goto_20

    .line 170
    :cond_4e
    const-string v14, "port"

    invoke-virtual {v7, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_74

    .line 171
    const/16 v14, 0x11

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 172
    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v14

    const/4 v15, 0x2

    if-eq v14, v15, :cond_6c

    .line 173
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "port is not int"

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 175
    :cond_6c
    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    move-result v12

    .line 176
    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    goto :goto_42

    .line 178
    :cond_74
    const/16 v14, 0x11

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 179
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    goto :goto_42

    .line 190
    :cond_7f
    const/16 v14, 0xd

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 192
    new-instance v3, Ljava/net/InetSocketAddress;

    invoke-direct {v3, v1, v12}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    goto :goto_16

    .line 197
    .end local v1    # "address":Ljava/net/InetAddress;
    .end local v7    # "key":Ljava/lang/String;
    .end local v12    # "port":I
    :cond_8c
    move-object/from16 v0, p1

    iget v14, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    const/4 v15, 0x2

    if-ne v14, v15, :cond_e5

    .line 198
    const/4 v14, 0x0

    move-object/from16 v0, p1

    iput v14, v0, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    .line 199
    const/16 v14, 0x10

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 201
    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v14

    const/4 v15, 0x4

    if-ne v14, v15, :cond_dd

    .line 202
    const-string v14, "val"

    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_ba

    .line 203
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "syntax error"

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 205
    :cond_ba
    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 210
    const/16 v14, 0x11

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 212
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v9

    .line 214
    .local v9, "objVal":Ljava/lang/Object;
    const/16 v14, 0xd

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 221
    :goto_cf
    if-nez v9, :cond_ea

    .line 222
    const/4 v13, 0x0

    .line 229
    .local v13, "strVal":Ljava/lang/String;
    :goto_d2
    if-eqz v13, :cond_da

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v14

    if-nez v14, :cond_fa

    .line 230
    :cond_da
    const/4 v3, 0x0

    goto/16 :goto_16

    .line 207
    .end local v9    # "objVal":Ljava/lang/Object;
    .end local v13    # "strVal":Ljava/lang/String;
    :cond_dd
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "syntax error"

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 216
    :cond_e5
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v9

    .restart local v9    # "objVal":Ljava/lang/Object;
    goto :goto_cf

    .line 223
    :cond_ea
    instance-of v14, v9, Ljava/lang/String;

    if-eqz v14, :cond_f2

    move-object v13, v9

    .line 224
    check-cast v13, Ljava/lang/String;

    .restart local v13    # "strVal":Ljava/lang/String;
    goto :goto_d2

    .line 226
    .end local v13    # "strVal":Ljava/lang/String;
    :cond_f2
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "expect string"

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 233
    .restart local v13    # "strVal":Ljava/lang/String;
    :cond_fa
    const-class v14, Ljava/util/UUID;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_106

    .line 234
    invoke-static {v13}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v3

    goto/16 :goto_16

    .line 237
    :cond_106
    const-class v14, Ljava/net/URI;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_112

    .line 238
    invoke-static {v13}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v3

    goto/16 :goto_16

    .line 241
    :cond_112
    const-class v14, Ljava/net/URL;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_128

    .line 243
    :try_start_118
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, v13}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_11d
    .catch Ljava/net/MalformedURLException; {:try_start_118 .. :try_end_11d} :catch_11f

    goto/16 :goto_16

    .line 244
    :catch_11f
    move-exception v4

    .line 245
    .local v4, "e":Ljava/net/MalformedURLException;
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "create url error"

    invoke-direct {v14, v15, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 249
    .end local v4    # "e":Ljava/net/MalformedURLException;
    :cond_128
    const-class v14, Ljava/util/regex/Pattern;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_134

    .line 250
    invoke-static {v13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    goto/16 :goto_16

    .line 253
    :cond_134
    const-class v14, Ljava/util/Locale;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_172

    .line 254
    const-string v14, "_"

    invoke-virtual {v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 256
    .local v6, "items":[Ljava/lang/String;
    array-length v14, v6

    const/4 v15, 0x1

    if-ne v14, v15, :cond_14e

    .line 257
    new-instance v3, Ljava/util/Locale;

    const/4 v14, 0x0

    aget-object v14, v6, v14

    invoke-direct {v3, v14}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    goto/16 :goto_16

    .line 260
    :cond_14e
    array-length v14, v6

    const/4 v15, 0x2

    if-ne v14, v15, :cond_15f

    .line 261
    new-instance v3, Ljava/util/Locale;

    const/4 v14, 0x0

    aget-object v14, v6, v14

    const/4 v15, 0x1

    aget-object v15, v6, v15

    invoke-direct {v3, v14, v15}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_16

    .line 264
    :cond_15f
    new-instance v3, Ljava/util/Locale;

    const/4 v14, 0x0

    aget-object v14, v6, v14

    const/4 v15, 0x1

    aget-object v15, v6, v15

    const/16 v16, 0x2

    aget-object v16, v6, v16

    move-object/from16 v0, v16

    invoke-direct {v3, v14, v15, v0}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_16

    .line 267
    .end local v6    # "items":[Ljava/lang/String;
    :cond_172
    const-class v14, Ljava/text/SimpleDateFormat;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_18a

    .line 268
    new-instance v3, Ljava/text/SimpleDateFormat;

    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->getLocale()Ljava/util/Locale;

    move-result-object v14

    invoke-direct {v3, v13, v14}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 269
    .local v3, "dateFormat":Ljava/text/SimpleDateFormat;
    invoke-interface {v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    goto/16 :goto_16

    .line 273
    .end local v3    # "dateFormat":Ljava/text/SimpleDateFormat;
    :cond_18a
    const-class v14, Ljava/net/InetAddress;

    move-object/from16 v0, p2

    if-eq v0, v14, :cond_19c

    const-class v14, Ljava/net/Inet4Address;

    move-object/from16 v0, p2

    if-eq v0, v14, :cond_19c

    const-class v14, Ljava/net/Inet6Address;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_1ab

    .line 275
    :cond_19c
    :try_start_19c
    invoke-static {v13}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_19f
    .catch Ljava/net/UnknownHostException; {:try_start_19c .. :try_end_19f} :catch_1a2

    move-result-object v3

    goto/16 :goto_16

    .line 276
    :catch_1a2
    move-exception v4

    .line 277
    .local v4, "e":Ljava/net/UnknownHostException;
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "deserialize inet adress error"

    invoke-direct {v14, v15, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 281
    .end local v4    # "e":Ljava/net/UnknownHostException;
    :cond_1ab
    const-class v14, Ljava/io/File;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_1b8

    .line 282
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto/16 :goto_16

    .line 285
    :cond_1b8
    const-class v14, Ljava/util/TimeZone;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_1c4

    .line 286
    invoke-static {v13}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v3

    goto/16 :goto_16

    .line 289
    :cond_1c4
    move-object/from16 v0, p2

    instance-of v14, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v14, :cond_1d2

    move-object/from16 v10, p2

    .line 290
    check-cast v10, Ljava/lang/reflect/ParameterizedType;

    .line 291
    .local v10, "parmeterizedType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v10}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object p2

    .line 294
    .end local v10    # "parmeterizedType":Ljava/lang/reflect/ParameterizedType;
    :cond_1d2
    const-class v14, Ljava/lang/Class;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_1e6

    .line 295
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v14

    invoke-virtual {v14}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDefaultClassLoader()Ljava/lang/ClassLoader;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    goto/16 :goto_16

    .line 298
    :cond_1e6
    const-class v14, Ljava/nio/charset/Charset;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_1f2

    .line 299
    invoke-static {v13}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    goto/16 :goto_16

    .line 302
    :cond_1f2
    const-class v14, Ljava/util/Currency;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_1fe

    .line 303
    invoke-static {v13}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;

    move-result-object v3

    goto/16 :goto_16

    .line 306
    :cond_1fe
    const-class v14, Lcom/alibaba/fastjson/JSONPath;

    move-object/from16 v0, p2

    if-ne v0, v14, :cond_20b

    .line 307
    new-instance v3, Lcom/alibaba/fastjson/JSONPath;

    invoke-direct {v3, v13}, Lcom/alibaba/fastjson/JSONPath;-><init>(Ljava/lang/String;)V

    goto/16 :goto_16

    .line 310
    :cond_20b
    invoke-interface/range {p2 .. p2}, Ljava/lang/reflect/Type;->getTypeName()Ljava/lang/String;

    move-result-object v2

    .line 312
    .local v2, "className":Ljava/lang/String;
    const-string v14, "java.nio.file.Path"

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_26d

    .line 314
    :try_start_217
    sget-object v14, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get:Ljava/lang/reflect/Method;

    if-nez v14, :cond_23c

    sget-boolean v14, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get_error:Z

    if-nez v14, :cond_23c

    .line 315
    const-string v14, "java.nio.file.Paths"

    invoke-static {v14}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    .line 316
    .local v11, "paths":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v14, "get"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Class;

    const/16 v16, 0x0

    const-class v17, Ljava/lang/String;

    aput-object v17, v15, v16

    const/16 v16, 0x1

    const-class v17, [Ljava/lang/String;

    aput-object v17, v15, v16

    invoke-virtual {v11, v14, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v14

    sput-object v14, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get:Ljava/lang/reflect/Method;

    .line 318
    .end local v11    # "paths":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_23c
    sget-object v14, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get:Ljava/lang/reflect/Method;

    if-eqz v14, :cond_261

    .line 319
    sget-object v14, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get:Ljava/lang/reflect/Method;

    const/4 v15, 0x0

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v13, v16, v17

    const/16 v17, 0x1

    const/16 v18, 0x0

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    aput-object v18, v16, v17

    invoke-virtual/range {v14 .. v16}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto/16 :goto_16

    .line 322
    :cond_261
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "Path deserialize erorr"

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14
    :try_end_269
    .catch Ljava/lang/NoSuchMethodException; {:try_start_217 .. :try_end_269} :catch_269
    .catch Ljava/lang/IllegalAccessException; {:try_start_217 .. :try_end_269} :catch_286
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_217 .. :try_end_269} :catch_28f

    .line 323
    :catch_269
    move-exception v5

    .line 324
    .local v5, "ex":Ljava/lang/NoSuchMethodException;
    const/4 v14, 0x1

    sput-boolean v14, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get_error:Z

    .line 332
    .end local v5    # "ex":Ljava/lang/NoSuchMethodException;
    :cond_26d
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "MiscCodec not support "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 325
    :catch_286
    move-exception v5

    .line 326
    .local v5, "ex":Ljava/lang/IllegalAccessException;
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "Path deserialize erorr"

    invoke-direct {v14, v15, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 327
    .end local v5    # "ex":Ljava/lang/IllegalAccessException;
    :catch_28f
    move-exception v5

    .line 328
    .local v5, "ex":Ljava/lang/reflect/InvocationTargetException;
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "Path deserialize erorr"

    invoke-direct {v14, v15, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 336
    const/4 v0, 0x4

    return v0
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 21
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "fieldType"    # Ljava/lang/reflect/Type;
    .param p5, "features"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    move-object/from16 v0, p1

    iget-object v8, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 64
    .local v8, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    if-nez p2, :cond_a

    .line 65
    invoke-virtual {v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 132
    .end local p2    # "object":Ljava/lang/Object;
    :goto_9
    return-void

    .line 69
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_a
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    .line 72
    .local v7, "objClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v12, Ljava/text/SimpleDateFormat;

    if-ne v7, v12, :cond_53

    move-object/from16 v12, p2

    .line 73
    check-cast v12, Ljava/text/SimpleDateFormat;

    invoke-virtual {v12}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v9

    .line 75
    .local v9, "pattern":Ljava/lang/String;
    sget-object v12, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v12

    if-eqz v12, :cond_4e

    .line 76
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    move-object/from16 v0, p4

    if-eq v12, v0, :cond_4e

    .line 77
    const/16 v12, 0x7b

    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 78
    sget-object v12, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 79
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/String;)V

    .line 80
    const/16 v12, 0x2c

    const-string v13, "val"

    invoke-virtual {v8, v12, v13, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;Ljava/lang/String;)V

    .line 81
    const/16 v12, 0x7d

    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_9

    .line 86
    :cond_4e
    move-object v10, v9

    .line 131
    .end local v9    # "pattern":Ljava/lang/String;
    .end local p2    # "object":Ljava/lang/Object;
    .local v10, "strVal":Ljava/lang/String;
    :goto_4f
    invoke-virtual {v8, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    goto :goto_9

    .line 87
    .end local v10    # "strVal":Ljava/lang/String;
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_53
    const-class v12, Ljava/lang/Class;

    if-ne v7, v12, :cond_60

    move-object/from16 v3, p2

    .line 88
    check-cast v3, Ljava/lang/Class;

    .line 89
    .local v3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    .line 90
    .restart local v10    # "strVal":Ljava/lang/String;
    goto :goto_4f

    .end local v3    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v10    # "strVal":Ljava/lang/String;
    :cond_60
    const-class v12, Ljava/net/InetSocketAddress;

    if-ne v7, v12, :cond_95

    move-object/from16 v1, p2

    .line 91
    check-cast v1, Ljava/net/InetSocketAddress;

    .line 93
    .local v1, "address":Ljava/net/InetSocketAddress;
    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v5

    .line 95
    .local v5, "inetAddress":Ljava/net/InetAddress;
    const/16 v12, 0x7b

    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 96
    if-eqz v5, :cond_82

    .line 97
    const-string v12, "address"

    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 98
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 99
    const/16 v12, 0x2c

    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 101
    :cond_82
    const-string v12, "port"

    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 102
    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v12

    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 103
    const/16 v12, 0x7d

    invoke-virtual {v8, v12}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_9

    .line 105
    .end local v1    # "address":Ljava/net/InetSocketAddress;
    .end local v5    # "inetAddress":Ljava/net/InetAddress;
    :cond_95
    move-object/from16 v0, p2

    instance-of v12, v0, Ljava/io/File;

    if-eqz v12, :cond_a2

    .line 106
    check-cast p2, Ljava/io/File;

    .end local p2    # "object":Ljava/lang/Object;
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    .restart local v10    # "strVal":Ljava/lang/String;
    goto :goto_4f

    .line 107
    .end local v10    # "strVal":Ljava/lang/String;
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_a2
    move-object/from16 v0, p2

    instance-of v12, v0, Ljava/net/InetAddress;

    if-eqz v12, :cond_af

    .line 108
    check-cast p2, Ljava/net/InetAddress;

    .end local p2    # "object":Ljava/lang/Object;
    invoke-virtual/range {p2 .. p2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v10

    .restart local v10    # "strVal":Ljava/lang/String;
    goto :goto_4f

    .line 109
    .end local v10    # "strVal":Ljava/lang/String;
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_af
    move-object/from16 v0, p2

    instance-of v12, v0, Ljava/util/TimeZone;

    if-eqz v12, :cond_be

    move-object/from16 v11, p2

    .line 110
    check-cast v11, Ljava/util/TimeZone;

    .line 111
    .local v11, "timeZone":Ljava/util/TimeZone;
    invoke-virtual {v11}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v10

    .line 112
    .restart local v10    # "strVal":Ljava/lang/String;
    goto :goto_4f

    .end local v10    # "strVal":Ljava/lang/String;
    .end local v11    # "timeZone":Ljava/util/TimeZone;
    :cond_be
    move-object/from16 v0, p2

    instance-of v12, v0, Ljava/util/Currency;

    if-eqz v12, :cond_cd

    move-object/from16 v4, p2

    .line 113
    check-cast v4, Ljava/util/Currency;

    .line 114
    .local v4, "currency":Ljava/util/Currency;
    invoke-virtual {v4}, Ljava/util/Currency;->getCurrencyCode()Ljava/lang/String;

    move-result-object v10

    .line 115
    .restart local v10    # "strVal":Ljava/lang/String;
    goto :goto_4f

    .end local v4    # "currency":Ljava/util/Currency;
    .end local v10    # "strVal":Ljava/lang/String;
    :cond_cd
    move-object/from16 v0, p2

    instance-of v12, v0, Lcom/alibaba/fastjson/JSONStreamAware;

    if-eqz v12, :cond_dc

    move-object/from16 v2, p2

    .line 116
    check-cast v2, Lcom/alibaba/fastjson/JSONStreamAware;

    .line 117
    .local v2, "aware":Lcom/alibaba/fastjson/JSONStreamAware;
    invoke-interface {v2, v8}, Lcom/alibaba/fastjson/JSONStreamAware;->writeJSONString(Ljava/lang/Appendable;)V

    goto/16 :goto_9

    .line 119
    .end local v2    # "aware":Lcom/alibaba/fastjson/JSONStreamAware;
    :cond_dc
    move-object/from16 v0, p2

    instance-of v12, v0, Ljava/util/Iterator;

    if-eqz v12, :cond_ed

    move-object/from16 v6, p2

    .line 120
    check-cast v6, Ljava/util/Iterator;

    .line 121
    .local v6, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    move-object/from16 v0, p1

    invoke-virtual {p0, v0, v8, v6}, Lcom/alibaba/fastjson/serializer/MiscCodec;->writeIterator(Lcom/alibaba/fastjson/serializer/JSONSerializer;Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/util/Iterator;)V

    goto/16 :goto_9

    .line 123
    .end local v6    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_ed
    move-object/from16 v0, p2

    instance-of v12, v0, Ljava/lang/Iterable;

    if-eqz v12, :cond_100

    .line 124
    check-cast p2, Ljava/lang/Iterable;

    .end local p2    # "object":Ljava/lang/Object;
    invoke-interface/range {p2 .. p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 125
    .restart local v6    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    move-object/from16 v0, p1

    invoke-virtual {p0, v0, v8, v6}, Lcom/alibaba/fastjson/serializer/MiscCodec;->writeIterator(Lcom/alibaba/fastjson/serializer/JSONSerializer;Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/util/Iterator;)V

    goto/16 :goto_9

    .line 128
    .end local v6    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_100
    new-instance v12, Lcom/alibaba/fastjson/JSONException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "not support class : "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v12
.end method

.method protected writeIterator(Lcom/alibaba/fastjson/serializer/JSONSerializer;Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/util/Iterator;)V
    .registers 7
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "out"    # Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/serializer/JSONSerializer;",
            "Lcom/alibaba/fastjson/serializer/SerializeWriter;",
            "Ljava/util/Iterator",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    const/4 v0, 0x0

    .line 136
    .local v0, "i":I
    const/16 v2, 0x5b

    invoke-virtual {p2, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 137
    :goto_6
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 138
    if-eqz v0, :cond_13

    .line 139
    const/16 v2, 0x2c

    invoke-virtual {p2, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 141
    :cond_13
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 142
    .local v1, "item":Ljava/lang/Object;
    invoke-virtual {p1, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 143
    add-int/lit8 v0, v0, 0x1

    .line 144
    goto :goto_6

    .line 145
    .end local v1    # "item":Ljava/lang/Object;
    :cond_1d
    const/16 v2, 0x5d

    invoke-virtual {p2, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 146
    return-void
.end method
