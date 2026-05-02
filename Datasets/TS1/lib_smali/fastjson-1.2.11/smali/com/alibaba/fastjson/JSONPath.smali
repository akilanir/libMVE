.class public Lcom/alibaba/fastjson/JSONPath;
.super Ljava/lang/Object;
.source "JSONPath.java"

# interfaces
.implements Lcom/alibaba/fastjson/JSONAware;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alibaba/fastjson/JSONPath$Filter;,
        Lcom/alibaba/fastjson/JSONPath$FilterSegement;,
        Lcom/alibaba/fastjson/JSONPath$Operator;,
        Lcom/alibaba/fastjson/JSONPath$StringOpSegement;,
        Lcom/alibaba/fastjson/JSONPath$RlikeSegement;,
        Lcom/alibaba/fastjson/JSONPath$MatchSegement;,
        Lcom/alibaba/fastjson/JSONPath$IntOpSegement;,
        Lcom/alibaba/fastjson/JSONPath$StringInSegement;,
        Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;,
        Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;,
        Lcom/alibaba/fastjson/JSONPath$IntInSegement;,
        Lcom/alibaba/fastjson/JSONPath$NullSegement;,
        Lcom/alibaba/fastjson/JSONPath$NotNullSegement;,
        Lcom/alibaba/fastjson/JSONPath$RangeSegement;,
        Lcom/alibaba/fastjson/JSONPath$MultiIndexSegement;,
        Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegement;,
        Lcom/alibaba/fastjson/JSONPath$WildCardSegement;,
        Lcom/alibaba/fastjson/JSONPath$MultiPropertySegement;,
        Lcom/alibaba/fastjson/JSONPath$PropertySegement;,
        Lcom/alibaba/fastjson/JSONPath$SizeSegement;,
        Lcom/alibaba/fastjson/JSONPath$Segement;,
        Lcom/alibaba/fastjson/JSONPath$JSONPathParser;
    }
.end annotation


# static fields
.field private static CACHE_SIZE:I

.field private static pathCache:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/alibaba/fastjson/JSONPath;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private parserConfig:Lcom/alibaba/fastjson/parser/ParserConfig;

.field private final path:Ljava/lang/String;

.field private segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

.field private serializeConfig:Lcom/alibaba/fastjson/serializer/SerializeConfig;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 32
    const/16 v0, 0x400

    sput v0, Lcom/alibaba/fastjson/JSONPath;->CACHE_SIZE:I

    .line 33
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v1, 0x80

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    sput-object v0, Lcom/alibaba/fastjson/JSONPath;->pathCache:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-static {}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->getGlobalInstance()Lcom/alibaba/fastjson/serializer/SerializeConfig;

    move-result-object v0

    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/alibaba/fastjson/JSONPath;-><init>(Ljava/lang/String;Lcom/alibaba/fastjson/serializer/SerializeConfig;Lcom/alibaba/fastjson/parser/ParserConfig;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/alibaba/fastjson/serializer/SerializeConfig;Lcom/alibaba/fastjson/parser/ParserConfig;)V
    .registers 6
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "serializeConfig"    # Lcom/alibaba/fastjson/serializer/SerializeConfig;
    .param p3, "parserConfig"    # Lcom/alibaba/fastjson/parser/ParserConfig;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 47
    :cond_b
    new-instance v0, Lcom/alibaba/fastjson/JSONPathException;

    const-string v1, "json-path can not be null or empty"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_13
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath;->path:Ljava/lang/String;

    .line 51
    iput-object p2, p0, Lcom/alibaba/fastjson/JSONPath;->serializeConfig:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    .line 52
    iput-object p3, p0, Lcom/alibaba/fastjson/JSONPath;->parserConfig:Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 53
    return-void
.end method

.method public static varargs arrayAdd(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "rootObject"    # Ljava/lang/Object;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "values"    # [Ljava/lang/Object;

    .prologue
    .line 273
    invoke-static {p1}, Lcom/alibaba/fastjson/JSONPath;->compile(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath;

    move-result-object v0

    .line 274
    .local v0, "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    invoke-virtual {v0, p0, p2}, Lcom/alibaba/fastjson/JSONPath;->arrayAdd(Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 275
    return-void
.end method

.method public static compile(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath;
    .registers 4
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 283
    if-nez p0, :cond_a

    .line 284
    new-instance v1, Lcom/alibaba/fastjson/JSONPathException;

    const-string v2, "jsonpath can not be null"

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 287
    :cond_a
    sget-object v1, Lcom/alibaba/fastjson/JSONPath;->pathCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/JSONPath;

    .line 288
    .local v0, "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    if-nez v0, :cond_30

    .line 289
    new-instance v0, Lcom/alibaba/fastjson/JSONPath;

    .end local v0    # "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONPath;-><init>(Ljava/lang/String;)V

    .line 290
    .restart local v0    # "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    sget-object v1, Lcom/alibaba/fastjson/JSONPath;->pathCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v1

    sget v2, Lcom/alibaba/fastjson/JSONPath;->CACHE_SIZE:I

    if-ge v1, v2, :cond_30

    .line 291
    sget-object v1, Lcom/alibaba/fastjson/JSONPath;->pathCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p0, v0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    sget-object v1, Lcom/alibaba/fastjson/JSONPath;->pathCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    check-cast v0, Lcom/alibaba/fastjson/JSONPath;

    .line 295
    .restart local v0    # "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    :cond_30
    return-object v0
.end method

.method public static contains(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 4
    .param p0, "rootObject"    # Ljava/lang/Object;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 259
    if-nez p0, :cond_4

    .line 260
    const/4 v1, 0x0

    .line 264
    :goto_3
    return v1

    .line 263
    :cond_4
    invoke-static {p1}, Lcom/alibaba/fastjson/JSONPath;->compile(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath;

    move-result-object v0

    .line 264
    .local v0, "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    invoke-virtual {v0, p0}, Lcom/alibaba/fastjson/JSONPath;->contains(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3
.end method

.method public static containsValue(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z
    .registers 5
    .param p0, "rootObject"    # Ljava/lang/Object;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 268
    invoke-static {p1}, Lcom/alibaba/fastjson/JSONPath;->compile(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath;

    move-result-object v0

    .line 269
    .local v0, "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    invoke-virtual {v0, p0, p2}, Lcom/alibaba/fastjson/JSONPath;->containsValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method static eq(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 5
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 1621
    if-ne p0, p1, :cond_5

    .line 1622
    const/4 v0, 0x1

    .line 1641
    :cond_4
    :goto_4
    return v0

    .line 1625
    :cond_5
    if-eqz p0, :cond_4

    if-eqz p1, :cond_4

    .line 1629
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_18

    .line 1630
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_4

    .line 1633
    :cond_18
    instance-of v1, p0, Ljava/lang/Number;

    if-eqz v1, :cond_29

    .line 1634
    instance-of v1, p1, Ljava/lang/Number;

    if-eqz v1, :cond_4

    .line 1635
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "a":Ljava/lang/Object;
    check-cast p1, Ljava/lang/Number;

    .end local p1    # "b":Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/alibaba/fastjson/JSONPath;->eqNotNull(Ljava/lang/Number;Ljava/lang/Number;)Z

    move-result v0

    goto :goto_4

    .line 1641
    .restart local p0    # "a":Ljava/lang/Object;
    .restart local p1    # "b":Ljava/lang/Object;
    :cond_29
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_4
.end method

.method static eqNotNull(Ljava/lang/Number;Ljava/lang/Number;)Z
    .registers 15
    .param p0, "a"    # Ljava/lang/Number;
    .param p1, "b"    # Ljava/lang/Number;

    .prologue
    .line 1646
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 1647
    .local v2, "clazzA":Ljava/lang/Class;
    invoke-static {v2}, Lcom/alibaba/fastjson/JSONPath;->isInt(Ljava/lang/Class;)Z

    move-result v7

    .line 1649
    .local v7, "isIntA":Z
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 1650
    .local v3, "clazzB":Ljava/lang/Class;
    invoke-static {v3}, Lcom/alibaba/fastjson/JSONPath;->isInt(Ljava/lang/Class;)Z

    move-result v8

    .line 1652
    .local v8, "isIntB":Z
    instance-of v9, p0, Ljava/math/BigDecimal;

    if-eqz v9, :cond_26

    move-object v4, p0

    .line 1653
    check-cast v4, Ljava/math/BigDecimal;

    .line 1655
    .local v4, "decimalA":Ljava/math/BigDecimal;
    if-eqz v8, :cond_26

    .line 1656
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/math/BigDecimal;->equals(Ljava/lang/Object;)Z

    move-result v9

    .line 1691
    .end local v4    # "decimalA":Ljava/math/BigDecimal;
    :goto_25
    return v9

    .line 1660
    :cond_26
    if-eqz v7, :cond_4e

    .line 1661
    if-eqz v8, :cond_3a

    .line 1662
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v9

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v11

    cmp-long v9, v9, v11

    if-nez v9, :cond_38

    const/4 v9, 0x1

    goto :goto_25

    :cond_38
    const/4 v9, 0x0

    goto :goto_25

    .line 1665
    :cond_3a
    instance-of v9, p1, Ljava/math/BigInteger;

    if-eqz v9, :cond_4e

    move-object v1, p0

    .line 1666
    check-cast v1, Ljava/math/BigInteger;

    .line 1667
    .local v1, "bigIntB":Ljava/math/BigInteger;
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    .line 1669
    .local v0, "bigIntA":Ljava/math/BigInteger;
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v9

    goto :goto_25

    .line 1673
    .end local v0    # "bigIntA":Ljava/math/BigInteger;
    .end local v1    # "bigIntB":Ljava/math/BigInteger;
    :cond_4e
    if-eqz v8, :cond_64

    .line 1674
    instance-of v9, p0, Ljava/math/BigInteger;

    if-eqz v9, :cond_64

    move-object v0, p0

    .line 1675
    check-cast v0, Ljava/math/BigInteger;

    .line 1676
    .restart local v0    # "bigIntA":Ljava/math/BigInteger;
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    .line 1678
    .restart local v1    # "bigIntB":Ljava/math/BigInteger;
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v9

    goto :goto_25

    .line 1683
    .end local v0    # "bigIntA":Ljava/math/BigInteger;
    .end local v1    # "bigIntB":Ljava/math/BigInteger;
    :cond_64
    invoke-static {v2}, Lcom/alibaba/fastjson/JSONPath;->isDouble(Ljava/lang/Class;)Z

    move-result v5

    .line 1684
    .local v5, "isDoubleA":Z
    invoke-static {v3}, Lcom/alibaba/fastjson/JSONPath;->isDouble(Ljava/lang/Class;)Z

    move-result v6

    .line 1686
    .local v6, "isDoubleB":Z
    if-eqz v5, :cond_70

    if-nez v6, :cond_78

    :cond_70
    if-eqz v5, :cond_74

    if-nez v8, :cond_78

    :cond_74
    if-eqz v6, :cond_88

    if-eqz v7, :cond_88

    .line 1687
    :cond_78
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v9

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v11

    cmpl-double v9, v9, v11

    if-nez v9, :cond_86

    const/4 v9, 0x1

    goto :goto_25

    :cond_86
    const/4 v9, 0x0

    goto :goto_25

    .line 1691
    :cond_88
    const/4 v9, 0x0

    goto :goto_25
.end method

.method public static eval(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p0, "rootObject"    # Ljava/lang/Object;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 248
    invoke-static {p1}, Lcom/alibaba/fastjson/JSONPath;->compile(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath;

    move-result-object v0

    .line 249
    .local v0, "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    invoke-virtual {v0, p0}, Lcom/alibaba/fastjson/JSONPath;->eval(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method protected static isDouble(Ljava/lang/Class;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 1695
    .local p0, "clazzA":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/lang/Float;

    if-eq p0, v0, :cond_8

    const-class v0, Ljava/lang/Double;

    if-ne p0, v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected static isInt(Ljava/lang/Class;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 1699
    .local p0, "clazzA":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/lang/Byte;

    if-eq p0, v0, :cond_10

    const-class v0, Ljava/lang/Short;

    if-eq p0, v0, :cond_10

    const-class v0, Ljava/lang/Integer;

    if-eq p0, v0, :cond_10

    const-class v0, Ljava/lang/Long;

    if-ne p0, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 305
    invoke-static {p0}, Lcom/alibaba/fastjson/JSON;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 306
    .local v1, "object":Ljava/lang/Object;
    invoke-static {p1}, Lcom/alibaba/fastjson/JSONPath;->compile(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath;

    move-result-object v0

    .line 307
    .local v0, "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath;->eval(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z
    .registers 5
    .param p0, "rootObject"    # Ljava/lang/Object;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 278
    invoke-static {p1}, Lcom/alibaba/fastjson/JSONPath;->compile(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath;

    move-result-object v0

    .line 279
    .local v0, "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    invoke-virtual {v0, p0, p2}, Lcom/alibaba/fastjson/JSONPath;->set(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public static size(Ljava/lang/Object;Ljava/lang/String;)I
    .registers 5
    .param p0, "rootObject"    # Ljava/lang/Object;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 253
    invoke-static {p1}, Lcom/alibaba/fastjson/JSONPath;->compile(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath;

    move-result-object v0

    .line 254
    .local v0, "jsonpath":Lcom/alibaba/fastjson/JSONPath;
    invoke-virtual {v0, p0}, Lcom/alibaba/fastjson/JSONPath;->eval(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 255
    .local v1, "result":Ljava/lang/Object;
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath;->evalSize(Ljava/lang/Object;)I

    move-result v2

    return v2
.end method


# virtual methods
.method public varargs arrayAdd(Ljava/lang/Object;[Ljava/lang/Object;)V
    .registers 20
    .param p1, "rootObject"    # Ljava/lang/Object;
    .param p2, "values"    # [Ljava/lang/Object;

    .prologue
    .line 144
    if-eqz p2, :cond_7

    move-object/from16 v0, p2

    array-length v14, v0

    if-nez v14, :cond_8

    .line 203
    :cond_7
    :goto_7
    return-void

    .line 148
    :cond_8
    if-eqz p1, :cond_7

    .line 152
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath;->init()V

    .line 154
    move-object/from16 v3, p1

    .line 155
    .local v3, "currentObject":Ljava/lang/Object;
    const/4 v9, 0x0

    .line 156
    .local v9, "parentObject":Ljava/lang/Object;
    const/4 v5, 0x0

    .end local v9    # "parentObject":Ljava/lang/Object;
    .local v5, "i":I
    :goto_11
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    array-length v14, v14

    if-ge v5, v14, :cond_33

    .line 157
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    array-length v14, v14

    add-int/lit8 v14, v14, -0x1

    if-ne v5, v14, :cond_22

    .line 158
    move-object v9, v3

    .line 160
    :cond_22
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    aget-object v14, v14, v5

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-interface {v14, v0, v1, v3}, Lcom/alibaba/fastjson/JSONPath$Segement;->eval(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 156
    add-int/lit8 v5, v5, 0x1

    goto :goto_11

    .line 163
    :cond_33
    move-object v11, v3

    .line 165
    .local v11, "result":Ljava/lang/Object;
    if-nez v11, :cond_55

    .line 166
    new-instance v14, Lcom/alibaba/fastjson/JSONPathException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "value not found in path "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/JSONPath;->path:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 169
    :cond_55
    instance-of v14, v11, Ljava/util/Collection;

    if-eqz v14, :cond_6a

    move-object v2, v11

    .line 170
    check-cast v2, Ljava/util/Collection;

    .line 171
    .local v2, "collection":Ljava/util/Collection;
    move-object/from16 v0, p2

    array-length v15, v0

    const/4 v14, 0x0

    :goto_60
    if-ge v14, v15, :cond_7

    aget-object v13, p2, v14

    .line 172
    .local v13, "value":Ljava/lang/Object;
    invoke-interface {v2, v13}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 171
    add-int/lit8 v14, v14, 0x1

    goto :goto_60

    .line 177
    .end local v2    # "collection":Ljava/util/Collection;
    .end local v13    # "value":Ljava/lang/Object;
    :cond_6a
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    .line 180
    .local v12, "resultClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v12}, Ljava/lang/Class;->isArray()Z

    move-result v14

    if-eqz v14, :cond_b5

    .line 181
    invoke-static {v11}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v7

    .line 182
    .local v7, "length":I
    invoke-virtual {v12}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v14

    move-object/from16 v0, p2

    array-length v15, v0

    add-int/2addr v15, v7

    invoke-static {v14, v15}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v4

    .line 184
    .local v4, "descArray":Ljava/lang/Object;
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static {v11, v14, v4, v15, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 185
    const/4 v5, 0x0

    :goto_8a
    move-object/from16 v0, p2

    array-length v14, v0

    if-ge v5, v14, :cond_99

    .line 186
    add-int v14, v7, v5

    aget-object v15, p2, v5

    invoke-static {v4, v14, v15}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 185
    add-int/lit8 v5, v5, 0x1

    goto :goto_8a

    .line 189
    :cond_99
    move-object v8, v4

    .line 194
    .local v8, "newResult":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    array-length v15, v15

    add-int/lit8 v15, v15, -0x1

    aget-object v6, v14, v15

    .line 195
    .local v6, "lastSegement":Lcom/alibaba/fastjson/JSONPath$Segement;
    instance-of v14, v6, Lcom/alibaba/fastjson/JSONPath$PropertySegement;

    if-eqz v14, :cond_ce

    move-object v10, v6

    .line 196
    check-cast v10, Lcom/alibaba/fastjson/JSONPath$PropertySegement;

    .line 197
    .local v10, "propertySegement":Lcom/alibaba/fastjson/JSONPath$PropertySegement;
    move-object/from16 v0, p0

    invoke-virtual {v10, v0, v9, v8}, Lcom/alibaba/fastjson/JSONPath$PropertySegement;->setValue(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_7

    .line 191
    .end local v4    # "descArray":Ljava/lang/Object;
    .end local v6    # "lastSegement":Lcom/alibaba/fastjson/JSONPath$Segement;
    .end local v7    # "length":I
    .end local v8    # "newResult":Ljava/lang/Object;
    .end local v10    # "propertySegement":Lcom/alibaba/fastjson/JSONPath$PropertySegement;
    :cond_b5
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "unsupported array put operation. "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 201
    .restart local v4    # "descArray":Ljava/lang/Object;
    .restart local v6    # "lastSegement":Lcom/alibaba/fastjson/JSONPath$Segement;
    .restart local v7    # "length":I
    .restart local v8    # "newResult":Ljava/lang/Object;
    :cond_ce
    instance-of v14, v6, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegement;

    if-eqz v14, :cond_db

    .line 202
    check-cast v6, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegement;

    .end local v6    # "lastSegement":Lcom/alibaba/fastjson/JSONPath$Segement;
    move-object/from16 v0, p0

    invoke-virtual {v6, v0, v9, v8}, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegement;->setValue(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)Z

    goto/16 :goto_7

    .line 206
    .restart local v6    # "lastSegement":Lcom/alibaba/fastjson/JSONPath$Segement;
    :cond_db
    new-instance v14, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v14}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v14
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "rootObject"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 83
    if-nez p1, :cond_4

    .line 97
    :cond_3
    :goto_3
    return v2

    .line 87
    :cond_4
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath;->init()V

    .line 89
    move-object v0, p1

    .line 90
    .local v0, "currentObject":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    iget-object v3, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    array-length v3, v3

    if-ge v1, v3, :cond_1b

    .line 91
    iget-object v3, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    aget-object v3, v3, v1

    invoke-interface {v3, p0, p1, v0}, Lcom/alibaba/fastjson/JSONPath$Segement;->eval(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 92
    if-eqz v0, :cond_3

    .line 90
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 97
    :cond_1b
    const/4 v2, 0x1

    goto :goto_3
.end method

.method public containsValue(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 9
    .param p1, "rootObject"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 102
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONPath;->eval(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 104
    .local v0, "currentObject":Ljava/lang/Object;
    if-ne v0, p2, :cond_9

    .line 124
    .end local v0    # "currentObject":Ljava/lang/Object;
    :goto_8
    return v3

    .line 108
    .restart local v0    # "currentObject":Ljava/lang/Object;
    :cond_9
    if-nez v0, :cond_d

    move v3, v4

    .line 109
    goto :goto_8

    .line 112
    :cond_d
    instance-of v5, v0, Ljava/lang/Iterable;

    if-eqz v5, :cond_2a

    .line 113
    check-cast v0, Ljava/lang/Iterable;

    .end local v0    # "currentObject":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 114
    .local v1, "it":Ljava/util/Iterator;
    :cond_17
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_28

    .line 115
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 116
    .local v2, "item":Ljava/lang/Object;
    invoke-static {v2, p2}, Lcom/alibaba/fastjson/JSONPath;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    goto :goto_8

    .end local v2    # "item":Ljava/lang/Object;
    :cond_28
    move v3, v4

    .line 121
    goto :goto_8

    .line 124
    .end local v1    # "it":Ljava/util/Iterator;
    .restart local v0    # "currentObject":Ljava/lang/Object;
    :cond_2a
    invoke-static {v0, p2}, Lcom/alibaba/fastjson/JSONPath;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    goto :goto_8
.end method

.method public eval(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "rootObject"    # Ljava/lang/Object;

    .prologue
    .line 69
    if-nez p1, :cond_4

    .line 70
    const/4 v0, 0x0

    .line 79
    :cond_3
    return-object v0

    .line 73
    :cond_4
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath;->init()V

    .line 75
    move-object v0, p1

    .line 76
    .local v0, "currentObject":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    array-length v2, v2

    if-ge v1, v2, :cond_3

    .line 77
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    aget-object v2, v2, v1

    invoke-interface {v2, p0, p1, v0}, Lcom/alibaba/fastjson/JSONPath$Segement;->eval(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 76
    add-int/lit8 v1, v1, 0x1

    goto :goto_9
.end method

.method evalSize(Ljava/lang/Object;)I
    .registers 9
    .param p1, "currentObject"    # Ljava/lang/Object;

    .prologue
    const/4 v1, -0x1

    .line 1794
    if-nez p1, :cond_4

    .line 1828
    .end local p1    # "currentObject":Ljava/lang/Object;
    :cond_3
    :goto_3
    return v1

    .line 1798
    .restart local p1    # "currentObject":Ljava/lang/Object;
    :cond_4
    instance-of v4, p1, Ljava/util/Collection;

    if-eqz v4, :cond_f

    .line 1799
    check-cast p1, Ljava/util/Collection;

    .end local p1    # "currentObject":Ljava/lang/Object;
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    goto :goto_3

    .line 1802
    .restart local p1    # "currentObject":Ljava/lang/Object;
    :cond_f
    instance-of v4, p1, [Ljava/lang/Object;

    if-eqz v4, :cond_19

    .line 1803
    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "currentObject":Ljava/lang/Object;
    check-cast p1, [Ljava/lang/Object;

    array-length v1, p1

    goto :goto_3

    .line 1806
    .restart local p1    # "currentObject":Ljava/lang/Object;
    :cond_19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_28

    .line 1807
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    goto :goto_3

    .line 1810
    :cond_28
    instance-of v4, p1, Ljava/util/Map;

    if-eqz v4, :cond_46

    .line 1811
    const/4 v1, 0x0

    .line 1813
    .local v1, "count":I
    check-cast p1, Ljava/util/Map;

    .end local p1    # "currentObject":Ljava/lang/Object;
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_37
    :goto_37
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 1814
    .local v3, "value":Ljava/lang/Object;
    if-eqz v3, :cond_37

    .line 1815
    add-int/lit8 v1, v1, 0x1

    goto :goto_37

    .line 1821
    .end local v1    # "count":I
    .end local v3    # "value":Ljava/lang/Object;
    .restart local p1    # "currentObject":Ljava/lang/Object;
    :cond_46
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/JSONPath;->getJavaBeanSerializer(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    move-result-object v0

    .line 1823
    .local v0, "beanSerializer":Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;
    if-eqz v0, :cond_3

    .line 1828
    :try_start_50
    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->getSize(Ljava/lang/Object;)I
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_53} :catch_55

    move-result v1

    goto :goto_3

    .line 1829
    :catch_55
    move-exception v2

    .line 1830
    .local v2, "e":Ljava/lang/Exception;
    new-instance v4, Lcom/alibaba/fastjson/JSONPathException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "evalSize error : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath;->path:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method protected getArrayItem(Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 8
    .param p1, "currentObject"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 1527
    if-nez p1, :cond_4

    .line 1559
    :cond_3
    :goto_3
    return-object v2

    .line 1531
    :cond_4
    instance-of v3, p1, Ljava/util/List;

    if-eqz v3, :cond_2c

    move-object v1, p1

    .line 1532
    check-cast v1, Ljava/util/List;

    .line 1534
    .local v1, "list":Ljava/util/List;
    if-ltz p2, :cond_18

    .line 1535
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge p2, v3, :cond_3

    .line 1536
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    goto :goto_3

    .line 1540
    :cond_18
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-gt v3, v4, :cond_3

    .line 1541
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v2, p2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    goto :goto_3

    .line 1547
    .end local v1    # "list":Ljava/util/List;
    :cond_2c
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-eqz v3, :cond_50

    .line 1548
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 1550
    .local v0, "arrayLenth":I
    if-ltz p2, :cond_43

    .line 1551
    if-ge p2, v0, :cond_3

    .line 1552
    invoke-static {p1, p2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    goto :goto_3

    .line 1556
    :cond_43
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-gt v3, v0, :cond_3

    .line 1557
    add-int v2, v0, p2

    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    goto :goto_3

    .line 1563
    .end local v0    # "arrayLenth":I
    :cond_50
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v2}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v2
.end method

.method protected getJavaBeanSerializer(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;"
        }
    .end annotation

    .prologue
    .line 1782
    .local p1, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 1784
    .local v0, "beanSerializer":Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONPath;->serializeConfig:Lcom/alibaba/fastjson/serializer/SerializeConfig;

    invoke-virtual {v2, p1}, Lcom/alibaba/fastjson/serializer/SerializeConfig;->getObjectWriter(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    move-result-object v1

    .line 1785
    .local v1, "serializer":Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    instance-of v2, v1, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    if-eqz v2, :cond_e

    move-object v0, v1

    .line 1786
    check-cast v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    .line 1789
    :cond_e
    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 311
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath;->path:Ljava/lang/String;

    return-object v0
.end method

.method protected getPropertyValue(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;
    .registers 19
    .param p1, "currentObject"    # Ljava/lang/Object;
    .param p2, "propertyName"    # Ljava/lang/String;
    .param p3, "strictMode"    # Z

    .prologue
    .line 1704
    if-nez p1, :cond_4

    .line 1705
    const/4 v5, 0x0

    .line 1739
    :cond_3
    :goto_3
    return-object v5

    .line 1708
    :cond_4
    move-object/from16 v0, p1

    instance-of v12, v0, Ljava/util/Map;

    if-eqz v12, :cond_15

    move-object/from16 v10, p1

    .line 1709
    check-cast v10, Ljava/util/Map;

    .line 1710
    .local v10, "map":Ljava/util/Map;
    move-object/from16 v0, p2

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    goto :goto_3

    .line 1713
    .end local v10    # "map":Ljava/util/Map;
    :cond_15
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 1715
    .local v3, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/JSONPath;->getJavaBeanSerializer(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    move-result-object v2

    .line 1716
    .local v2, "beanSerializer":Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;
    if-eqz v2, :cond_58

    .line 1718
    :try_start_1f
    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->getFieldSerializer(Ljava/lang/String;)Lcom/alibaba/fastjson/serializer/FieldSerializer;

    move-result-object v6

    .line 1719
    .local v6, "getter":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    if-nez v6, :cond_29

    .line 1720
    const/4 v5, 0x0

    goto :goto_3

    .line 1722
    :cond_29
    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Lcom/alibaba/fastjson/serializer/FieldSerializer;->getPropertyValue(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_2e} :catch_30

    move-result-object v5

    goto :goto_3

    .line 1723
    .end local v6    # "getter":Lcom/alibaba/fastjson/serializer/FieldSerializer;
    :catch_30
    move-exception v4

    .line 1724
    .local v4, "e":Ljava/lang/Exception;
    new-instance v12, Lcom/alibaba/fastjson/JSONPathException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "jsonpath error, path "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/alibaba/fastjson/JSONPath;->path:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", segement "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13, v4}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 1728
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_58
    move-object/from16 v0, p1

    instance-of v12, v0, Ljava/util/List;

    if-eqz v12, :cond_84

    move-object/from16 v9, p1

    .line 1729
    check-cast v9, Ljava/util/List;

    .line 1731
    .local v9, "list":Ljava/util/List;
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v12

    invoke-direct {v5, v12}, Ljava/util/ArrayList;-><init>(I)V

    .line 1733
    .local v5, "fieldValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_6c
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v12

    if-ge v7, v12, :cond_3

    .line 1734
    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .line 1735
    .local v11, "obj":Ljava/lang/Object;
    move-object/from16 v0, p2

    move/from16 v1, p3

    invoke-virtual {p0, v11, v0, v1}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v8

    .line 1736
    .local v8, "itemValue":Ljava/lang/Object;
    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1733
    add-int/lit8 v7, v7, 0x1

    goto :goto_6c

    .line 1741
    .end local v5    # "fieldValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v7    # "i":I
    .end local v8    # "itemValue":Ljava/lang/Object;
    .end local v9    # "list":Ljava/util/List;
    .end local v11    # "obj":Ljava/lang/Object;
    :cond_84
    new-instance v12, Lcom/alibaba/fastjson/JSONPathException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "jsonpath error, path "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/alibaba/fastjson/JSONPath;->path:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", segement "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    throw v12
.end method

.method protected getPropertyValues(Ljava/lang/Object;)Ljava/util/Collection;
    .registers 9
    .param p1, "currentObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1600
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 1602
    .local v1, "currentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/JSONPath;->getJavaBeanSerializer(Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    move-result-object v0

    .line 1604
    .local v0, "beanSerializer":Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;
    if-eqz v0, :cond_2b

    .line 1606
    :try_start_a
    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;->getFieldValues(Ljava/lang/Object;)Ljava/util/List;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_d} :catch_f

    move-result-object v4

    .line 1614
    :goto_e
    return-object v4

    .line 1607
    :catch_f
    move-exception v2

    .line 1608
    .local v2, "e":Ljava/lang/Exception;
    new-instance v4, Lcom/alibaba/fastjson/JSONPathException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "jsonpath error, path "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath;->path:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 1612
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_2b
    instance-of v4, p1, Ljava/util/Map;

    if-eqz v4, :cond_37

    move-object v3, p1

    .line 1613
    check-cast v3, Ljava/util/Map;

    .line 1614
    .local v3, "map":Ljava/util/Map;
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    goto :goto_e

    .line 1617
    .end local v3    # "map":Ljava/util/Map;
    :cond_37
    new-instance v4, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v4}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v4
.end method

.method protected init()V
    .registers 5

    .prologue
    .line 56
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    if-eqz v1, :cond_5

    .line 66
    :goto_4
    return-void

    .line 60
    :cond_5
    const-string v1, "*"

    iget-object v2, p0, Lcom/alibaba/fastjson/JSONPath;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 61
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/alibaba/fastjson/JSONPath$Segement;

    const/4 v2, 0x0

    sget-object v3, Lcom/alibaba/fastjson/JSONPath$WildCardSegement;->instance:Lcom/alibaba/fastjson/JSONPath$WildCardSegement;

    aput-object v3, v1, v2

    iput-object v1, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    goto :goto_4

    .line 63
    :cond_1a
    new-instance v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;

    iget-object v1, p0, Lcom/alibaba/fastjson/JSONPath;->path:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;-><init>(Ljava/lang/String;)V

    .line 64
    .local v0, "parser":Lcom/alibaba/fastjson/JSONPath$JSONPathParser;
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->explain()[Lcom/alibaba/fastjson/JSONPath$Segement;

    move-result-object v1

    iput-object v1, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    goto :goto_4
.end method

.method public set(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 10
    .param p1, "rootObject"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 210
    if-nez p1, :cond_4

    .line 241
    :cond_3
    :goto_3
    return v5

    .line 214
    :cond_4
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath;->init()V

    .line 216
    move-object v0, p1

    .line 217
    .local v0, "currentObject":Ljava/lang/Object;
    const/4 v3, 0x0

    .line 218
    .local v3, "parentObject":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    array-length v6, v6

    if-ge v1, v6, :cond_17

    .line 219
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    array-length v6, v6

    add-int/lit8 v6, v6, -0x1

    if-ne v1, v6, :cond_2e

    .line 220
    move-object v3, v0

    .line 229
    .end local v3    # "parentObject":Ljava/lang/Object;
    :cond_17
    if-eqz v3, :cond_3

    .line 233
    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    array-length v6, v6

    add-int/lit8 v6, v6, -0x1

    aget-object v2, v5, v6

    .line 234
    .local v2, "lastSegement":Lcom/alibaba/fastjson/JSONPath$Segement;
    instance-of v5, v2, Lcom/alibaba/fastjson/JSONPath$PropertySegement;

    if-eqz v5, :cond_3b

    move-object v4, v2

    .line 235
    check-cast v4, Lcom/alibaba/fastjson/JSONPath$PropertySegement;

    .line 236
    .local v4, "propertySegement":Lcom/alibaba/fastjson/JSONPath$PropertySegement;
    invoke-virtual {v4, p0, v3, p2}, Lcom/alibaba/fastjson/JSONPath$PropertySegement;->setValue(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 237
    const/4 v5, 0x1

    goto :goto_3

    .line 223
    .end local v2    # "lastSegement":Lcom/alibaba/fastjson/JSONPath$Segement;
    .end local v4    # "propertySegement":Lcom/alibaba/fastjson/JSONPath$PropertySegement;
    .restart local v3    # "parentObject":Ljava/lang/Object;
    :cond_2e
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    aget-object v6, v6, v1

    invoke-interface {v6, p0, p1, v0}, Lcom/alibaba/fastjson/JSONPath$Segement;->eval(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 224
    if-eqz v0, :cond_17

    .line 218
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 240
    .end local v3    # "parentObject":Ljava/lang/Object;
    .restart local v2    # "lastSegement":Lcom/alibaba/fastjson/JSONPath$Segement;
    :cond_3b
    instance-of v5, v2, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegement;

    if-eqz v5, :cond_46

    .line 241
    check-cast v2, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegement;

    .end local v2    # "lastSegement":Lcom/alibaba/fastjson/JSONPath$Segement;
    invoke-virtual {v2, p0, v3, p2}, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegement;->setValue(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    goto :goto_3

    .line 244
    .restart local v2    # "lastSegement":Lcom/alibaba/fastjson/JSONPath$Segement;
    :cond_46
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v5}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v5
.end method

.method public setArrayItem(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;ILjava/lang/Object;)Z
    .registers 11
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "currentObject"    # Ljava/lang/Object;
    .param p3, "index"    # I
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    .line 1568
    instance-of v3, p2, Ljava/util/List;

    if-eqz v3, :cond_17

    move-object v2, p2

    .line 1569
    check-cast v2, Ljava/util/List;

    .line 1570
    .local v2, "list":Ljava/util/List;
    if-ltz p3, :cond_e

    .line 1571
    invoke-interface {v2, p3, p4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1592
    .end local v2    # "list":Ljava/util/List;
    :cond_d
    :goto_d
    return v4

    .line 1573
    .restart local v2    # "list":Ljava/util/List;
    :cond_e
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    add-int/2addr v3, p3

    invoke-interface {v2, v3, p4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 1578
    .end local v2    # "list":Ljava/util/List;
    :cond_17
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 1579
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-eqz v3, :cond_39

    .line 1580
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 1582
    .local v0, "arrayLenth":I
    if-ltz p3, :cond_2d

    .line 1583
    if-ge p3, v0, :cond_d

    .line 1584
    invoke-static {p2, p3, p4}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    goto :goto_d

    .line 1587
    :cond_2d
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-gt v3, v0, :cond_d

    .line 1588
    add-int v3, v0, p3

    invoke-static {p2, v3, p4}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    goto :goto_d

    .line 1595
    .end local v0    # "arrayLenth":I
    :cond_39
    new-instance v3, Lcom/alibaba/fastjson/JSONPathException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unsupported set operation."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method protected setPropertyValue(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z
    .registers 11
    .param p1, "parent"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    .line 1746
    instance-of v5, p1, Ljava/util/Map;

    if-eqz v5, :cond_b

    .line 1747
    check-cast p1, Ljava/util/Map;

    .end local p1    # "parent":Ljava/lang/Object;
    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1775
    :cond_a
    :goto_a
    return v4

    .line 1751
    .restart local p1    # "parent":Ljava/lang/Object;
    :cond_b
    instance-of v5, p1, Ljava/util/List;

    if-eqz v5, :cond_25

    .line 1752
    check-cast p1, Ljava/util/List;

    .end local p1    # "parent":Ljava/lang/Object;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_15
    :goto_15
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1753
    .local v2, "element":Ljava/lang/Object;
    if-eqz v2, :cond_15

    .line 1756
    invoke-virtual {p0, v2, p2, p3}, Lcom/alibaba/fastjson/JSONPath;->setPropertyValue(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z

    goto :goto_15

    .line 1761
    .end local v2    # "element":Ljava/lang/Object;
    .restart local p1    # "parent":Ljava/lang/Object;
    :cond_25
    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath;->parserConfig:Lcom/alibaba/fastjson/parser/ParserConfig;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v1

    .line 1763
    .local v1, "derializer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    const/4 v0, 0x0

    .line 1764
    .local v0, "beanDerializer":Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
    instance-of v5, v1, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    if-eqz v5, :cond_37

    move-object v0, v1

    .line 1765
    check-cast v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    .line 1768
    :cond_37
    if-eqz v0, :cond_45

    .line 1769
    invoke-virtual {v0, p2}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->getFieldDeserializer(Ljava/lang/String;)Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;

    move-result-object v3

    .line 1770
    .local v3, "fieldDeserializer":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    if-nez v3, :cond_41

    .line 1771
    const/4 v4, 0x0

    goto :goto_a

    .line 1774
    :cond_41
    invoke-virtual {v3, p1, p3}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_a

    .line 1778
    .end local v3    # "fieldDeserializer":Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
    :cond_45
    new-instance v4, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v4}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v4
.end method

.method public size(Ljava/lang/Object;)I
    .registers 5
    .param p1, "rootObject"    # Ljava/lang/Object;

    .prologue
    .line 128
    if-nez p1, :cond_4

    .line 129
    const/4 v2, -0x1

    .line 139
    :goto_3
    return v2

    .line 132
    :cond_4
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath;->init()V

    .line 134
    move-object v0, p1

    .line 135
    .local v0, "currentObject":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    array-length v2, v2

    if-ge v1, v2, :cond_19

    .line 136
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONPath;->segments:[Lcom/alibaba/fastjson/JSONPath$Segement;

    aget-object v2, v2, v1

    invoke-interface {v2, p0, p1, v0}, Lcom/alibaba/fastjson/JSONPath$Segement;->eval(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 135
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 139
    :cond_19
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/JSONPath;->evalSize(Ljava/lang/Object;)I

    move-result v2

    goto :goto_3
.end method

.method public toJSONString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1836
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath;->path:Ljava/lang/String;

    invoke-static {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
