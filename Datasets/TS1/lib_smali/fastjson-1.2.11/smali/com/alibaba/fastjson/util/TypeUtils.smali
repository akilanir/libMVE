.class public Lcom/alibaba/fastjson/util/TypeUtils;
.super Ljava/lang/Object;
.source "TypeUtils.java"


# static fields
.field public static compatibleWithJavaBean:Z

.field private static mappings:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field private static optionalClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static optionalClassInited:Z

.field private static oracleDateMethod:Ljava/lang/reflect/Method;

.field private static oracleDateMethodInited:Z

.field private static oracleTimestampMethod:Ljava/lang/reflect/Method;

.field private static oracleTimestampMethodInited:Z

.field private static pathClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static pathClass_error:Z

.field private static setAccessibleEnable:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 69
    sput-boolean v2, Lcom/alibaba/fastjson/util/TypeUtils;->compatibleWithJavaBean:Z

    .line 70
    sput-boolean v1, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessibleEnable:Z

    .line 72
    sput-boolean v2, Lcom/alibaba/fastjson/util/TypeUtils;->oracleTimestampMethodInited:Z

    .line 75
    sput-boolean v2, Lcom/alibaba/fastjson/util/TypeUtils;->oracleDateMethodInited:Z

    .line 78
    sput-boolean v2, Lcom/alibaba/fastjson/util/TypeUtils;->optionalClassInited:Z

    .line 83
    :try_start_c
    const-string v1, "fastjson.compatibleWithJavaBean"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 84
    .local v0, "prop":Ljava/lang/String;
    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 85
    const/4 v1, 0x1

    sput-boolean v1, Lcom/alibaba/fastjson/util/TypeUtils;->compatibleWithJavaBean:Z
    :try_end_1d
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_1d} :catch_36

    .line 932
    :cond_1d
    :goto_1d
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v1, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    .line 935
    invoke-static {}, Lcom/alibaba/fastjson/util/TypeUtils;->addBaseClassMappings()V

    .line 970
    sput-boolean v2, Lcom/alibaba/fastjson/util/TypeUtils;->pathClass_error:Z

    return-void

    .line 86
    :cond_2a
    :try_start_2a
    const-string v1, "false"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 87
    const/4 v1, 0x0

    sput-boolean v1, Lcom/alibaba/fastjson/util/TypeUtils;->compatibleWithJavaBean:Z
    :try_end_35
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_35} :catch_36

    goto :goto_1d

    .line 89
    :catch_36
    move-exception v1

    goto :goto_1d
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addBaseClassMappings()V
    .registers 3

    .prologue
    .line 939
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "byte"

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 940
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "short"

    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 941
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "int"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 942
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "long"

    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 943
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "float"

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 944
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "double"

    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 945
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "boolean"

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 946
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "char"

    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 948
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "[byte"

    const-class v2, [B

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 949
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "[short"

    const-class v2, [S

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 950
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "[int"

    const-class v2, [I

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 951
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "[long"

    const-class v2, [J

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 952
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "[float"

    const-class v2, [F

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 953
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "[double"

    const-class v2, [D

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 954
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "[boolean"

    const-class v2, [Z

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 955
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-string v1, "[char"

    const-class v2, [C

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 957
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    const-class v1, Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Ljava/util/HashMap;

    invoke-interface {v0, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 958
    return-void
.end method

.method public static cast(Ljava/lang/Object;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;
    .registers 16
    .param p0, "obj"    # Ljava/lang/Object;
    .param p2, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            ")TT;"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    .line 600
    if-nez p0, :cond_5

    move-object p0, v0

    .line 735
    .end local p0    # "obj":Ljava/lang/Object;
    :cond_4
    :goto_4
    return-object p0

    .line 604
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_5
    if-nez p1, :cond_f

    .line 605
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string v11, "clazz is null"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 608
    :cond_f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    if-eq p1, v10, :cond_4

    .line 612
    instance-of v10, p0, Ljava/util/Map;

    if-eqz v10, :cond_33

    .line 613
    const-class v10, Ljava/util/Map;

    if-eq p1, v10, :cond_4

    move-object v7, p0

    .line 617
    check-cast v7, Ljava/util/Map;

    .line 618
    .local v7, "map":Ljava/util/Map;
    const-class v10, Ljava/lang/Object;

    if-ne p1, v10, :cond_2c

    sget-object v10, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    invoke-interface {v7, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 622
    :cond_2c
    check-cast p0, Ljava/util/Map;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-static {p0, p1, p2}, Lcom/alibaba/fastjson/util/TypeUtils;->castToJavaBean(Ljava/util/Map;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_4

    .line 625
    .end local v7    # "map":Ljava/util/Map;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_33
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v10

    if-eqz v10, :cond_74

    .line 626
    instance-of v10, p0, Ljava/util/Collection;

    if-eqz v10, :cond_6b

    move-object v2, p0

    .line 628
    check-cast v2, Ljava/util/Collection;

    .line 629
    .local v2, "collection":Ljava/util/Collection;
    const/4 v5, 0x0

    .line 630
    .local v5, "index":I
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v10

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 631
    .local v0, "array":Ljava/lang/Object;
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_51
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_69

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 632
    .local v6, "item":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v11

    invoke-static {v6, v11, p2}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v9

    .line 633
    .local v9, "value":Ljava/lang/Object;
    invoke-static {v0, v5, v9}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 634
    add-int/lit8 v5, v5, 0x1

    .line 635
    goto :goto_51

    .end local v6    # "item":Ljava/lang/Object;
    .end local v9    # "value":Ljava/lang/Object;
    :cond_69
    move-object p0, v0

    .line 637
    goto :goto_4

    .line 640
    .end local v0    # "array":Ljava/lang/Object;
    .end local v2    # "collection":Ljava/util/Collection;
    .end local v5    # "index":I
    :cond_6b
    const-class v10, [B

    if-ne p1, v10, :cond_74

    .line 641
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToBytes(Ljava/lang/Object;)[B

    move-result-object p0

    goto :goto_4

    .line 645
    :cond_74
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {p1, v10}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 649
    sget-object v10, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p1, v10, :cond_86

    const-class v10, Ljava/lang/Boolean;

    if-ne p1, v10, :cond_8c

    .line 650
    :cond_86
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToBoolean(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object p0

    goto/16 :goto_4

    .line 653
    :cond_8c
    sget-object v10, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p1, v10, :cond_94

    const-class v10, Ljava/lang/Byte;

    if-ne p1, v10, :cond_9a

    .line 654
    :cond_94
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToByte(Ljava/lang/Object;)Ljava/lang/Byte;

    move-result-object p0

    goto/16 :goto_4

    .line 661
    :cond_9a
    sget-object v10, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq p1, v10, :cond_a2

    const-class v10, Ljava/lang/Short;

    if-ne p1, v10, :cond_a8

    .line 662
    :cond_a2
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToShort(Ljava/lang/Object;)Ljava/lang/Short;

    move-result-object p0

    goto/16 :goto_4

    .line 665
    :cond_a8
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq p1, v10, :cond_b0

    const-class v10, Ljava/lang/Integer;

    if-ne p1, v10, :cond_b6

    .line 666
    :cond_b0
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToInt(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object p0

    goto/16 :goto_4

    .line 669
    :cond_b6
    sget-object v10, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq p1, v10, :cond_be

    const-class v10, Ljava/lang/Long;

    if-ne p1, v10, :cond_c4

    .line 670
    :cond_be
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p0

    goto/16 :goto_4

    .line 673
    :cond_c4
    sget-object v10, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq p1, v10, :cond_cc

    const-class v10, Ljava/lang/Float;

    if-ne p1, v10, :cond_d2

    .line 674
    :cond_cc
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToFloat(Ljava/lang/Object;)Ljava/lang/Float;

    move-result-object p0

    goto/16 :goto_4

    .line 677
    :cond_d2
    sget-object v10, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq p1, v10, :cond_da

    const-class v10, Ljava/lang/Double;

    if-ne p1, v10, :cond_e0

    .line 678
    :cond_da
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToDouble(Ljava/lang/Object;)Ljava/lang/Double;

    move-result-object p0

    goto/16 :goto_4

    .line 681
    :cond_e0
    const-class v10, Ljava/lang/String;

    if-ne p1, v10, :cond_ea

    .line 682
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_4

    .line 685
    :cond_ea
    const-class v10, Ljava/math/BigDecimal;

    if-ne p1, v10, :cond_f4

    .line 686
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToBigDecimal(Ljava/lang/Object;)Ljava/math/BigDecimal;

    move-result-object p0

    goto/16 :goto_4

    .line 689
    :cond_f4
    const-class v10, Ljava/math/BigInteger;

    if-ne p1, v10, :cond_fe

    .line 690
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToBigInteger(Ljava/lang/Object;)Ljava/math/BigInteger;

    move-result-object p0

    goto/16 :goto_4

    .line 693
    :cond_fe
    const-class v10, Ljava/util/Date;

    if-ne p1, v10, :cond_108

    .line 694
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToDate(Ljava/lang/Object;)Ljava/util/Date;

    move-result-object p0

    goto/16 :goto_4

    .line 697
    :cond_108
    const-class v10, Ljava/sql/Date;

    if-ne p1, v10, :cond_112

    .line 698
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToSqlDate(Ljava/lang/Object;)Ljava/sql/Date;

    move-result-object p0

    goto/16 :goto_4

    .line 701
    :cond_112
    const-class v10, Ljava/sql/Timestamp;

    if-ne p1, v10, :cond_11c

    .line 702
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToTimestamp(Ljava/lang/Object;)Ljava/sql/Timestamp;

    move-result-object p0

    goto/16 :goto_4

    .line 705
    :cond_11c
    invoke-virtual {p1}, Ljava/lang/Class;->isEnum()Z

    move-result v10

    if-eqz v10, :cond_128

    .line 706
    invoke-static {p0, p1, p2}, Lcom/alibaba/fastjson/util/TypeUtils;->castToEnum(Ljava/lang/Object;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object p0

    goto/16 :goto_4

    .line 709
    :cond_128
    const-class v10, Ljava/util/Calendar;

    invoke-virtual {v10, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_16b

    .line 710
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToDate(Ljava/lang/Object;)Ljava/util/Date;

    move-result-object v3

    .line 712
    .local v3, "date":Ljava/util/Date;
    const-class v10, Ljava/util/Calendar;

    if-ne p1, v10, :cond_146

    .line 713
    sget-object v10, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    sget-object v11, Lcom/alibaba/fastjson/JSON;->defaultLocale:Ljava/util/Locale;

    invoke-static {v10, v11}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v1

    .line 721
    .local v1, "calendar":Ljava/util/Calendar;
    :goto_140
    invoke-virtual {v1, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    move-object p0, v1

    .line 722
    goto/16 :goto_4

    .line 716
    .end local v1    # "calendar":Ljava/util/Calendar;
    :cond_146
    :try_start_146
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Calendar;
    :try_end_14c
    .catch Ljava/lang/Exception; {:try_start_146 .. :try_end_14c} :catch_14d

    .restart local v1    # "calendar":Ljava/util/Calendar;
    goto :goto_140

    .line 717
    .end local v1    # "calendar":Ljava/util/Calendar;
    :catch_14d
    move-exception v4

    .line 718
    .local v4, "e":Ljava/lang/Exception;
    new-instance v10, Lcom/alibaba/fastjson/JSONException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "can not cast to : "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 725
    .end local v3    # "date":Ljava/util/Date;
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_16b
    instance-of v10, p0, Ljava/lang/String;

    if-eqz v10, :cond_195

    move-object v8, p0

    .line 726
    check-cast v8, Ljava/lang/String;

    .line 728
    .local v8, "strVal":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    if-eqz v10, :cond_188

    const-string v10, "null"

    .line 729
    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_188

    const-string v10, "NULL"

    .line 730
    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_18b

    :cond_188
    move-object p0, v0

    .line 731
    goto/16 :goto_4

    .line 734
    :cond_18b
    const-class v10, Ljava/util/Currency;

    if-ne p1, v10, :cond_195

    .line 735
    invoke-static {v8}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;

    move-result-object p0

    goto/16 :goto_4

    .line 739
    .end local v8    # "strVal":Ljava/lang/String;
    :cond_195
    new-instance v10, Lcom/alibaba/fastjson/JSONException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "can not cast to : "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v10
.end method

.method public static cast(Ljava/lang/Object;Ljava/lang/reflect/ParameterizedType;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;
    .registers 21
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "type"    # Ljava/lang/reflect/ParameterizedType;
    .param p2, "mapping"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/reflect/ParameterizedType;",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 800
    invoke-interface/range {p1 .. p1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v11

    .line 802
    .local v11, "rawTye":Ljava/lang/reflect/Type;
    const-class v15, Ljava/util/Set;

    if-eq v11, v15, :cond_18

    const-class v15, Ljava/util/HashSet;

    if-eq v11, v15, :cond_18

    const-class v15, Ljava/util/TreeSet;

    if-eq v11, v15, :cond_18

    const-class v15, Ljava/util/List;

    if-eq v11, v15, :cond_18

    const-class v15, Ljava/util/ArrayList;

    if-ne v11, v15, :cond_5d

    .line 806
    :cond_18
    invoke-interface/range {p1 .. p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v15

    const/16 v16, 0x0

    aget-object v7, v15, v16

    .line 808
    .local v7, "itemType":Ljava/lang/reflect/Type;
    move-object/from16 v0, p0

    instance-of v15, v0, Ljava/lang/Iterable;

    if-eqz v15, :cond_5d

    .line 810
    const-class v15, Ljava/util/Set;

    if-eq v11, v15, :cond_2e

    const-class v15, Ljava/util/HashSet;

    if-ne v11, v15, :cond_4d

    .line 811
    :cond_2e
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 818
    .local v3, "collection":Ljava/util/Collection;
    :goto_33
    check-cast p0, Ljava/lang/Iterable;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-interface/range {p0 .. p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "it":Ljava/util/Iterator;
    :goto_39
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_b3

    .line 819
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 820
    .local v6, "item":Ljava/lang/Object;
    move-object/from16 v0, p2

    invoke-static {v6, v7, v0}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v15

    invoke-interface {v3, v15}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_39

    .line 812
    .end local v3    # "collection":Ljava/util/Collection;
    .end local v5    # "it":Ljava/util/Iterator;
    .end local v6    # "item":Ljava/lang/Object;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_4d
    const-class v15, Ljava/util/TreeSet;

    if-ne v11, v15, :cond_57

    .line 813
    new-instance v3, Ljava/util/TreeSet;

    invoke-direct {v3}, Ljava/util/TreeSet;-><init>()V

    .restart local v3    # "collection":Ljava/util/Collection;
    goto :goto_33

    .line 815
    .end local v3    # "collection":Ljava/util/Collection;
    :cond_57
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .restart local v3    # "collection":Ljava/util/Collection;
    goto :goto_33

    .line 827
    .end local v3    # "collection":Ljava/util/Collection;
    .end local v7    # "itemType":Ljava/lang/reflect/Type;
    :cond_5d
    const-class v15, Ljava/util/Map;

    if-eq v11, v15, :cond_65

    const-class v15, Ljava/util/HashMap;

    if-ne v11, v15, :cond_b4

    .line 828
    :cond_65
    invoke-interface/range {p1 .. p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v15

    const/16 v16, 0x0

    aget-object v9, v15, v16

    .line 829
    .local v9, "keyType":Ljava/lang/reflect/Type;
    invoke-interface/range {p1 .. p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v15

    const/16 v16, 0x1

    aget-object v14, v15, v16

    .line 831
    .local v14, "valueType":Ljava/lang/reflect/Type;
    move-object/from16 v0, p0

    instance-of v15, v0, Ljava/util/Map;

    if-eqz v15, :cond_b4

    .line 832
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 834
    .local v10, "map":Ljava/util/Map;
    check-cast p0, Ljava/util/Map;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-interface/range {p0 .. p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_8a
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_b2

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 835
    .local v4, "entry":Ljava/util/Map$Entry;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-static {v0, v9, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v8

    .line 836
    .local v8, "key":Ljava/lang/Object;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-static {v0, v14, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v13

    .line 838
    .local v13, "value":Ljava/lang/Object;
    invoke-interface {v10, v8, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8a

    .end local v4    # "entry":Ljava/util/Map$Entry;
    .end local v8    # "key":Ljava/lang/Object;
    .end local v13    # "value":Ljava/lang/Object;
    :cond_b2
    move-object v3, v10

    .line 855
    .end local v9    # "keyType":Ljava/lang/reflect/Type;
    .end local v10    # "map":Ljava/util/Map;
    .end local v14    # "valueType":Ljava/lang/reflect/Type;
    :cond_b3
    :goto_b3
    return-object v3

    .line 845
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_b4
    move-object/from16 v0, p0

    instance-of v15, v0, Ljava/lang/String;

    if-eqz v15, :cond_c6

    move-object/from16 v12, p0

    .line 846
    check-cast v12, Ljava/lang/String;

    .line 847
    .local v12, "strVal":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v15

    if-nez v15, :cond_c6

    .line 848
    const/4 v3, 0x0

    goto :goto_b3

    .line 852
    .end local v12    # "strVal":Ljava/lang/String;
    :cond_c6
    invoke-interface/range {p1 .. p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v15

    array-length v15, v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_e6

    .line 853
    invoke-interface/range {p1 .. p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v15

    const/16 v16, 0x0

    aget-object v2, v15, v16

    .line 854
    .local v2, "argType":Ljava/lang/reflect/Type;
    instance-of v15, v2, Ljava/lang/reflect/WildcardType;

    if-eqz v15, :cond_e6

    .line 855
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v11, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_b3

    .line 859
    .end local v2    # "argType":Ljava/lang/reflect/Type;
    :cond_e6
    new-instance v15, Lcom/alibaba/fastjson/JSONException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "can not cast to : "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v15
.end method

.method public static cast(Ljava/lang/Object;Ljava/lang/reflect/Type;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;
    .registers 7
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .param p2, "mapping"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/reflect/Type;",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            ")TT;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 770
    if-nez p0, :cond_5

    move-object p0, v1

    .line 792
    .end local p0    # "obj":Ljava/lang/Object;
    .end local p1    # "type":Ljava/lang/reflect/Type;
    :cond_4
    :goto_4
    return-object p0

    .line 774
    .restart local p0    # "obj":Ljava/lang/Object;
    .restart local p1    # "type":Ljava/lang/reflect/Type;
    :cond_5
    instance-of v2, p1, Ljava/lang/Class;

    if-eqz v2, :cond_10

    .line 775
    check-cast p1, Ljava/lang/Class;

    .end local p1    # "type":Ljava/lang/reflect/Type;
    invoke-static {p0, p1, p2}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_4

    .line 778
    .restart local p1    # "type":Ljava/lang/reflect/Type;
    :cond_10
    instance-of v2, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v2, :cond_1b

    .line 779
    check-cast p1, Ljava/lang/reflect/ParameterizedType;

    .end local p1    # "type":Ljava/lang/reflect/Type;
    invoke-static {p0, p1, p2}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/reflect/ParameterizedType;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_4

    .line 782
    .restart local p1    # "type":Ljava/lang/reflect/Type;
    :cond_1b
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_3a

    move-object v0, p0

    .line 783
    check-cast v0, Ljava/lang/String;

    .line 784
    .local v0, "strVal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_38

    const-string v2, "null"

    .line 785
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_38

    const-string v2, "NULL"

    .line 786
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3a

    :cond_38
    move-object p0, v1

    .line 787
    goto :goto_4

    .line 791
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_3a
    instance-of v1, p1, Ljava/lang/reflect/TypeVariable;

    if-nez v1, :cond_4

    .line 795
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not cast to : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static castToBigDecimal(Ljava/lang/Object;)Ljava/math/BigDecimal;
    .registers 4
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 176
    if-nez p0, :cond_5

    move-object p0, v1

    .line 193
    .end local p0    # "value":Ljava/lang/Object;
    .local v0, "strVal":Ljava/lang/String;
    :goto_4
    return-object p0

    .line 180
    .end local v0    # "strVal":Ljava/lang/String;
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_5
    instance-of v2, p0, Ljava/math/BigDecimal;

    if-eqz v2, :cond_c

    .line 181
    check-cast p0, Ljava/math/BigDecimal;

    goto :goto_4

    .line 184
    :cond_c
    instance-of v2, p0, Ljava/math/BigInteger;

    if-eqz v2, :cond_19

    .line 185
    new-instance v1, Ljava/math/BigDecimal;

    check-cast p0, Ljava/math/BigInteger;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-direct {v1, p0}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    move-object p0, v1

    goto :goto_4

    .line 188
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_19
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 189
    .restart local v0    # "strVal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_25

    move-object p0, v1

    .line 190
    goto :goto_4

    .line 193
    :cond_25
    new-instance p0, Ljava/math/BigDecimal;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-direct {p0, v0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    goto :goto_4
.end method

.method public static castToBigInteger(Ljava/lang/Object;)Ljava/math/BigInteger;
    .registers 4
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 197
    if-nez p0, :cond_5

    move-object p0, v1

    .line 216
    .end local p0    # "value":Ljava/lang/Object;
    .local v0, "strVal":Ljava/lang/String;
    :goto_4
    return-object p0

    .line 201
    .end local v0    # "strVal":Ljava/lang/String;
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_5
    instance-of v2, p0, Ljava/math/BigInteger;

    if-eqz v2, :cond_c

    .line 202
    check-cast p0, Ljava/math/BigInteger;

    goto :goto_4

    .line 205
    :cond_c
    instance-of v2, p0, Ljava/lang/Float;

    if-nez v2, :cond_14

    instance-of v2, p0, Ljava/lang/Double;

    if-eqz v2, :cond_1f

    .line 206
    :cond_14
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object p0

    goto :goto_4

    .line 209
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_1f
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 210
    .restart local v0    # "strVal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_39

    const-string v2, "null"

    .line 211
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_39

    const-string v2, "NULL"

    .line 212
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3b

    :cond_39
    move-object p0, v1

    .line 213
    goto :goto_4

    .line 216
    :cond_3b
    new-instance p0, Ljava/math/BigInteger;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-direct {p0, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    goto :goto_4
.end method

.method public static castToBoolean(Ljava/lang/Object;)Ljava/lang/Boolean;
    .registers 5
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 559
    if-nez p0, :cond_6

    move-object p0, v2

    .line 587
    .end local p0    # "value":Ljava/lang/Object;
    .local v0, "strVal":Ljava/lang/String;
    :goto_5
    return-object p0

    .line 563
    .end local v0    # "strVal":Ljava/lang/String;
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_6
    instance-of v3, p0, Ljava/lang/Boolean;

    if-eqz v3, :cond_d

    .line 564
    check-cast p0, Ljava/lang/Boolean;

    goto :goto_5

    .line 567
    :cond_d
    instance-of v3, p0, Ljava/lang/Number;

    if-eqz v3, :cond_20

    .line 568
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result v2

    if-ne v2, v1, :cond_1e

    :goto_19
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_5

    :cond_1e
    const/4 v1, 0x0

    goto :goto_19

    .line 571
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_20
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_65

    move-object v0, p0

    .line 572
    check-cast v0, Ljava/lang/String;

    .line 574
    .restart local v0    # "strVal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_3d

    const-string v1, "null"

    .line 575
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3d

    const-string v1, "NULL"

    .line 576
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    :cond_3d
    move-object p0, v2

    .line 577
    goto :goto_5

    .line 580
    :cond_3f
    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4f

    const-string v1, "1"

    .line 581
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_52

    .line 582
    :cond_4f
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_5

    .line 585
    :cond_52
    const-string v1, "false"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_62

    const-string v1, "0"

    .line 586
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_65

    .line 587
    :cond_62
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_5

    .line 591
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_65
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not cast to boolean, value : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static castToByte(Ljava/lang/Object;)Ljava/lang/Byte;
    .registers 5
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 103
    if-nez p0, :cond_4

    .line 119
    .local v0, "strVal":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object v1

    .line 107
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_4
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_13

    .line 108
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->byteValue()B

    move-result v1

    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    goto :goto_3

    .line 111
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_13
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_39

    move-object v0, p0

    .line 112
    check-cast v0, Ljava/lang/String;

    .line 113
    .restart local v0    # "strVal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "null"

    .line 114
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "NULL"

    .line 115
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 119
    invoke-static {v0}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v1

    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    goto :goto_3

    .line 122
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_39
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not cast to byte, value : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static castToBytes(Ljava/lang/Object;)[B
    .registers 4
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 548
    instance-of v0, p0, [B

    if-eqz v0, :cond_9

    .line 549
    check-cast p0, [B

    .end local p0    # "value":Ljava/lang/Object;
    check-cast p0, [B

    .line 553
    :goto_8
    return-object p0

    .line 552
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_14

    .line 553
    check-cast p0, Ljava/lang/String;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static {p0}, Lcom/alibaba/fastjson/util/IOUtils;->decodeBase64(Ljava/lang/String;)[B

    move-result-object p0

    goto :goto_8

    .line 555
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_14
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "can not cast to int, value : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static castToChar(Ljava/lang/Object;)Ljava/lang/Character;
    .registers 5
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 126
    if-nez p0, :cond_5

    move-object p0, v1

    .line 145
    .end local p0    # "value":Ljava/lang/Object;
    .local v0, "strVal":Ljava/lang/String;
    :goto_4
    return-object p0

    .line 130
    .end local v0    # "strVal":Ljava/lang/String;
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_5
    instance-of v2, p0, Ljava/lang/Character;

    if-eqz v2, :cond_c

    .line 131
    check-cast p0, Ljava/lang/Character;

    goto :goto_4

    .line 134
    :cond_c
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_45

    move-object v0, p0

    .line 135
    check-cast v0, Ljava/lang/String;

    .line 137
    .restart local v0    # "strVal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1b

    move-object p0, v1

    .line 138
    goto :goto_4

    .line 141
    :cond_1b
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_3b

    .line 142
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not cast to char, value : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 145
    :cond_3b
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p0

    goto :goto_4

    .line 148
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_45
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not cast to char, value : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static castToDate(Ljava/lang/Object;)Ljava/util/Date;
    .registers 15
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v9, 0x0

    const/4 v13, 0x1

    .line 274
    if-nez p0, :cond_5

    .line 384
    .end local p0    # "value":Ljava/lang/Object;
    .local v7, "longValue":J
    :cond_4
    :goto_4
    return-object v9

    .line 278
    .end local v7    # "longValue":J
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_5
    instance-of v11, p0, Ljava/util/Date;

    if-eqz v11, :cond_d

    .line 279
    check-cast p0, Ljava/util/Date;

    .end local p0    # "value":Ljava/lang/Object;
    move-object v9, p0

    goto :goto_4

    .line 282
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_d
    instance-of v11, p0, Ljava/util/Calendar;

    if-eqz v11, :cond_18

    .line 283
    check-cast p0, Ljava/util/Calendar;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v9

    goto :goto_4

    .line 286
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_18
    const-wide/16 v7, -0x1

    .line 288
    .restart local v7    # "longValue":J
    instance-of v11, p0, Ljava/lang/Number;

    if-eqz v11, :cond_2a

    .line 289
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    .line 290
    new-instance v9, Ljava/util/Date;

    invoke-direct {v9, v7, v8}, Ljava/util/Date;-><init>(J)V

    goto :goto_4

    .line 293
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_2a
    instance-of v11, p0, Ljava/lang/String;

    if-eqz v11, :cond_d7

    move-object v10, p0

    .line 294
    check-cast v10, Ljava/lang/String;

    .line 296
    .local v10, "strVal":Ljava/lang/String;
    new-instance v3, Lcom/alibaba/fastjson/parser/JSONScanner;

    invoke-direct {v3, v10}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 298
    .local v3, "dateLexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    const/4 v11, 0x0

    :try_start_37
    invoke-virtual {v3, v11}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(Z)Z

    move-result v11

    if-eqz v11, :cond_49

    .line 299
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 300
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    :try_end_44
    .catchall {:try_start_37 .. :try_end_44} :catchall_91

    move-result-object v9

    .line 303
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    goto :goto_4

    .end local v0    # "calendar":Ljava/util/Calendar;
    :cond_49
    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    .line 306
    const-string v11, "/Date("

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_68

    const-string v11, ")/"

    invoke-virtual {v10, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_68

    .line 307
    const/4 v11, 0x6

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x2

    invoke-virtual {v10, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 308
    .local v4, "dotnetDateStr":Ljava/lang/String;
    move-object v10, v4

    .line 311
    .end local v4    # "dotnetDateStr":Ljava/lang/String;
    :cond_68
    const/16 v11, 0x2d

    invoke-virtual {v10, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    const/4 v12, -0x1

    if-eq v11, v12, :cond_cd

    .line 313
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    sget-object v12, Lcom/alibaba/fastjson/JSON;->DEFFAULT_DATE_FORMAT:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-ne v11, v12, :cond_96

    .line 314
    sget-object v6, Lcom/alibaba/fastjson/JSON;->DEFFAULT_DATE_FORMAT:Ljava/lang/String;

    .line 323
    .local v6, "format":Ljava/lang/String;
    :goto_7f
    new-instance v2, Ljava/text/SimpleDateFormat;

    sget-object v11, Lcom/alibaba/fastjson/JSON;->defaultLocale:Ljava/util/Locale;

    invoke-direct {v2, v6, v11}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 324
    .local v2, "dateFormat":Ljava/text/SimpleDateFormat;
    sget-object v11, Lcom/alibaba/fastjson/JSON;->defaultTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v2, v11}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 326
    :try_start_8b
    invoke-virtual {v2, v10}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_8e
    .catch Ljava/text/ParseException; {:try_start_8b .. :try_end_8e} :catch_b3

    move-result-object v9

    goto/16 :goto_4

    .line 303
    .end local v2    # "dateFormat":Ljava/text/SimpleDateFormat;
    .end local v6    # "format":Ljava/lang/String;
    :catchall_91
    move-exception v11

    invoke-virtual {v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    throw v11

    .line 315
    :cond_96
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    const/16 v12, 0xa

    if-ne v11, v12, :cond_a1

    .line 316
    const-string v6, "yyyy-MM-dd"

    .restart local v6    # "format":Ljava/lang/String;
    goto :goto_7f

    .line 317
    .end local v6    # "format":Ljava/lang/String;
    :cond_a1
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    const-string v12, "yyyy-MM-dd HH:mm:ss"

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-ne v11, v12, :cond_b0

    .line 318
    const-string v6, "yyyy-MM-dd HH:mm:ss"

    .restart local v6    # "format":Ljava/lang/String;
    goto :goto_7f

    .line 320
    .end local v6    # "format":Ljava/lang/String;
    :cond_b0
    const-string v6, "yyyy-MM-dd HH:mm:ss.SSS"

    .restart local v6    # "format":Ljava/lang/String;
    goto :goto_7f

    .line 327
    .restart local v2    # "dateFormat":Ljava/text/SimpleDateFormat;
    :catch_b3
    move-exception v5

    .line 328
    .local v5, "e":Ljava/text/ParseException;
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "can not cast to Date, value : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 332
    .end local v2    # "dateFormat":Ljava/text/SimpleDateFormat;
    .end local v5    # "e":Ljava/text/ParseException;
    .end local v6    # "format":Ljava/lang/String;
    :cond_cd
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_4

    .line 336
    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    .line 339
    .end local v3    # "dateLexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    .end local v10    # "strVal":Ljava/lang/String;
    :cond_d7
    const-wide/16 v11, 0x0

    cmp-long v11, v7, v11

    if-gez v11, :cond_178

    .line 340
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 341
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v11, "oracle.sql.TIMESTAMP"

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_120

    .line 342
    sget-object v11, Lcom/alibaba/fastjson/util/TypeUtils;->oracleTimestampMethod:Ljava/lang/reflect/Method;

    if-nez v11, :cond_102

    sget-boolean v11, Lcom/alibaba/fastjson/util/TypeUtils;->oracleTimestampMethodInited:Z

    if-nez v11, :cond_102

    .line 344
    :try_start_f5
    const-string v11, "toJdbc"

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Class;

    invoke-virtual {v1, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    sput-object v11, Lcom/alibaba/fastjson/util/TypeUtils;->oracleTimestampMethod:Ljava/lang/reflect/Method;
    :try_end_100
    .catch Ljava/lang/NoSuchMethodException; {:try_start_f5 .. :try_end_100} :catch_10f
    .catchall {:try_start_f5 .. :try_end_100} :catchall_113

    .line 348
    sput-boolean v13, Lcom/alibaba/fastjson/util/TypeUtils;->oracleTimestampMethodInited:Z

    .line 354
    :cond_102
    :goto_102
    :try_start_102
    sget-object v11, Lcom/alibaba/fastjson/util/TypeUtils;->oracleTimestampMethod:Ljava/lang/reflect/Method;

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-virtual {v11, p0, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10a
    .catch Ljava/lang/Exception; {:try_start_102 .. :try_end_10a} :catch_117

    move-result-object v9

    .line 358
    .local v9, "result":Ljava/lang/Object;
    check-cast v9, Ljava/util/Date;

    goto/16 :goto_4

    .line 345
    .end local v9    # "result":Ljava/lang/Object;
    :catch_10f
    move-exception v11

    .line 348
    sput-boolean v13, Lcom/alibaba/fastjson/util/TypeUtils;->oracleTimestampMethodInited:Z

    goto :goto_102

    :catchall_113
    move-exception v11

    sput-boolean v13, Lcom/alibaba/fastjson/util/TypeUtils;->oracleTimestampMethodInited:Z

    throw v11

    .line 355
    :catch_117
    move-exception v5

    .line 356
    .local v5, "e":Ljava/lang/Exception;
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "can not cast oracle.sql.TIMESTAMP to Date"

    invoke-direct {v11, v12, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 361
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_120
    const-string v11, "oracle.sql.DATE"

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_15f

    .line 362
    sget-object v11, Lcom/alibaba/fastjson/util/TypeUtils;->oracleDateMethod:Ljava/lang/reflect/Method;

    if-nez v11, :cond_141

    sget-boolean v11, Lcom/alibaba/fastjson/util/TypeUtils;->oracleDateMethodInited:Z

    if-nez v11, :cond_141

    .line 364
    :try_start_134
    const-string v11, "toJdbc"

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Class;

    invoke-virtual {v1, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    sput-object v11, Lcom/alibaba/fastjson/util/TypeUtils;->oracleDateMethod:Ljava/lang/reflect/Method;
    :try_end_13f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_134 .. :try_end_13f} :catch_14e
    .catchall {:try_start_134 .. :try_end_13f} :catchall_152

    .line 368
    sput-boolean v13, Lcom/alibaba/fastjson/util/TypeUtils;->oracleDateMethodInited:Z

    .line 374
    :cond_141
    :goto_141
    :try_start_141
    sget-object v11, Lcom/alibaba/fastjson/util/TypeUtils;->oracleDateMethod:Ljava/lang/reflect/Method;

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-virtual {v11, p0, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_149
    .catch Ljava/lang/Exception; {:try_start_141 .. :try_end_149} :catch_156

    move-result-object v9

    .line 378
    .restart local v9    # "result":Ljava/lang/Object;
    check-cast v9, Ljava/util/Date;

    goto/16 :goto_4

    .line 365
    .end local v9    # "result":Ljava/lang/Object;
    :catch_14e
    move-exception v11

    .line 368
    sput-boolean v13, Lcom/alibaba/fastjson/util/TypeUtils;->oracleDateMethodInited:Z

    goto :goto_141

    :catchall_152
    move-exception v11

    sput-boolean v13, Lcom/alibaba/fastjson/util/TypeUtils;->oracleDateMethodInited:Z

    throw v11

    .line 375
    :catch_156
    move-exception v5

    .line 376
    .restart local v5    # "e":Ljava/lang/Exception;
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    const-string v12, "can not cast oracle.sql.DATE to Date"

    invoke-direct {v11, v12, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 381
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_15f
    new-instance v11, Lcom/alibaba/fastjson/JSONException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "can not cast to Date, value : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 384
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_178
    new-instance v9, Ljava/util/Date;

    invoke-direct {v9, v7, v8}, Ljava/util/Date;-><init>(J)V

    goto/16 :goto_4
.end method

.method public static castToDouble(Ljava/lang/Object;)Ljava/lang/Double;
    .registers 5
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 247
    if-nez p0, :cond_4

    .line 267
    .local v0, "strVal":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object v1

    .line 251
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_4
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_13

    .line 252
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    goto :goto_3

    .line 255
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_13
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_4a

    .line 256
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 257
    .restart local v0    # "strVal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "null"

    .line 258
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "NULL"

    .line 259
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 263
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eqz v1, :cond_41

    .line 264
    const-string v1, ","

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 267
    :cond_41
    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    goto :goto_3

    .line 270
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_4a
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not cast to double, value : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static castToEnum(Ljava/lang/Object;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;
    .registers 11
    .param p0, "obj"    # Ljava/lang/Object;
    .param p2, "mapping"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 745
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    instance-of v5, p0, Ljava/lang/String;

    if-eqz v5, :cond_15

    .line 746
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    move-object v2, v0

    .line 747
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_10

    .line 748
    const/4 v5, 0x0

    .line 758
    .end local v2    # "name":Ljava/lang/String;
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_f
    return-object v5

    .line 751
    .restart local v2    # "name":Ljava/lang/String;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_10
    invoke-static {p1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v5

    goto :goto_f

    .line 754
    .end local v2    # "name":Ljava/lang/String;
    :cond_15
    instance-of v5, p0, Ljava/lang/Number;

    if-eqz v5, :cond_47

    .line 755
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result v3

    .line 756
    .local v3, "ordinal":I
    invoke-virtual {p1}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v4

    .line 757
    .local v4, "values":[Ljava/lang/Object;
    array-length v5, v4

    if-ge v3, v5, :cond_47

    .line 758
    aget-object v5, v4, v3
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_28} :catch_29

    goto :goto_f

    .line 761
    .end local v3    # "ordinal":I
    .end local v4    # "values":[Ljava/lang/Object;
    :catch_29
    move-exception v1

    .line 762
    .local v1, "ex":Ljava/lang/Exception;
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "can not cast to : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 765
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_47
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "can not cast to : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public static castToFloat(Ljava/lang/Object;)Ljava/lang/Float;
    .registers 5
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 220
    if-nez p0, :cond_4

    .line 240
    .local v0, "strVal":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object v1

    .line 224
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_4
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_13

    .line 225
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    goto :goto_3

    .line 228
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_13
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_4a

    .line 229
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 230
    .restart local v0    # "strVal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "null"

    .line 231
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "NULL"

    .line 232
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 236
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eqz v1, :cond_41

    .line 237
    const-string v1, ","

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 240
    :cond_41
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    goto :goto_3

    .line 243
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_4a
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not cast to float, value : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static castToInt(Ljava/lang/Object;)Ljava/lang/Integer;
    .registers 5
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 512
    if-nez p0, :cond_5

    move-object p0, v1

    .line 541
    .end local p0    # "value":Ljava/lang/Object;
    :goto_4
    return-object p0

    .line 516
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_5
    instance-of v2, p0, Ljava/lang/Integer;

    if-eqz v2, :cond_c

    .line 517
    check-cast p0, Ljava/lang/Integer;

    goto :goto_4

    .line 520
    :cond_c
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_1b

    .line 521
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_4

    .line 524
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_1b
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_53

    move-object v0, p0

    .line 525
    check-cast v0, Ljava/lang/String;

    .line 527
    .local v0, "strVal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_38

    const-string v2, "null"

    .line 528
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_38

    const-string v2, "NULL"

    .line 529
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3a

    :cond_38
    move-object p0, v1

    .line 530
    goto :goto_4

    .line 533
    :cond_3a
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eqz v1, :cond_4a

    .line 534
    const-string v1, ","

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 537
    :cond_4a
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_4

    .line 540
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_53
    instance-of v1, p0, Ljava/lang/Boolean;

    if-eqz v1, :cond_67

    .line 541
    check-cast p0, Ljava/lang/Boolean;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_65

    const/4 v1, 0x1

    :goto_60
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_4

    :cond_65
    const/4 v1, 0x0

    goto :goto_60

    .line 544
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_67
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not cast to int, value : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static castToJavaBean(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 595
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/alibaba/fastjson/util/TypeUtils;->cast(Ljava/lang/Object;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static castToJavaBean(Ljava/util/Map;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;
    .registers 20
    .param p2, "config"    # Lcom/alibaba/fastjson/parser/ParserConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/alibaba/fastjson/parser/ParserConfig;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 865
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    const-class v14, Ljava/lang/StackTraceElement;

    move-object/from16 v0, p1

    if-ne v0, v14, :cond_3c

    .line 866
    const-string v14, "className"

    move-object/from16 v0, p0

    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 867
    .local v3, "declaringClass":Ljava/lang/String;
    const-string v14, "methodName"

    move-object/from16 v0, p0

    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 868
    .local v11, "methodName":Ljava/lang/String;
    const-string v14, "fileName"

    move-object/from16 v0, p0

    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 871
    .local v6, "fileName":Ljava/lang/String;
    const-string v14, "lineNumber"

    move-object/from16 v0, p0

    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Number;

    .line 872
    .local v13, "value":Ljava/lang/Number;
    if-nez v13, :cond_37

    .line 873
    const/4 v9, 0x0

    .line 879
    .local v9, "lineNumber":I
    :goto_31
    new-instance v14, Ljava/lang/StackTraceElement;

    invoke-direct {v14, v3, v11, v6, v9}, Ljava/lang/StackTraceElement;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 926
    .end local v3    # "declaringClass":Ljava/lang/String;
    .end local v6    # "fileName":Ljava/lang/String;
    .end local v9    # "lineNumber":I
    .end local v11    # "methodName":Ljava/lang/String;
    .end local v13    # "value":Ljava/lang/Number;
    :goto_36
    return-object v14

    .line 875
    .restart local v3    # "declaringClass":Ljava/lang/String;
    .restart local v6    # "fileName":Ljava/lang/String;
    .restart local v11    # "methodName":Ljava/lang/String;
    .restart local v13    # "value":Ljava/lang/Number;
    :cond_37
    invoke-virtual {v13}, Ljava/lang/Number;->intValue()I

    move-result v9

    .restart local v9    # "lineNumber":I
    goto :goto_31

    .line 883
    .end local v3    # "declaringClass":Ljava/lang/String;
    .end local v6    # "fileName":Ljava/lang/String;
    .end local v9    # "lineNumber":I
    .end local v11    # "methodName":Ljava/lang/String;
    .end local v13    # "value":Ljava/lang/Number;
    :cond_3c
    sget-object v14, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 884
    .local v7, "iClassObject":Ljava/lang/Object;
    instance-of v14, v7, Ljava/lang/String;

    if-eqz v14, :cond_87

    .line 885
    move-object v0, v7

    check-cast v0, Ljava/lang/String;

    move-object v2, v0

    .line 887
    .local v2, "className":Ljava/lang/String;
    invoke-static {v2}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    .line 889
    .local v10, "loadClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v10, :cond_76

    .line 890
    new-instance v14, Ljava/lang/ClassNotFoundException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " not found"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v14
    :try_end_6b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6b} :catch_6b

    .line 927
    .end local v2    # "className":Ljava/lang/String;
    .end local v7    # "iClassObject":Ljava/lang/Object;
    .end local v10    # "loadClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_6b
    move-exception v5

    .line 928
    .local v5, "e":Ljava/lang/Exception;
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 893
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v2    # "className":Ljava/lang/String;
    .restart local v7    # "iClassObject":Ljava/lang/Object;
    .restart local v10    # "loadClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_76
    :try_start_76
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_87

    .line 894
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v10, v1}, Lcom/alibaba/fastjson/util/TypeUtils;->castToJavaBean(Ljava/util/Map;Ljava/lang/Class;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;

    move-result-object v14

    goto :goto_36

    .line 899
    .end local v2    # "className":Ljava/lang/String;
    .end local v10    # "loadClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_87
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->isInterface()Z

    move-result v14

    if-eqz v14, :cond_b4

    .line 902
    move-object/from16 v0, p0

    instance-of v14, v0, Lcom/alibaba/fastjson/JSONObject;

    if-eqz v14, :cond_ac

    .line 903
    move-object/from16 v0, p0

    check-cast v0, Lcom/alibaba/fastjson/JSONObject;

    move-object v12, v0

    .line 908
    .local v12, "object":Lcom/alibaba/fastjson/JSONObject;
    :goto_98
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v14

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Class;

    const/16 v16, 0x0

    aput-object p1, v15, v16

    invoke-static {v14, v15, v12}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v14

    goto :goto_36

    .line 905
    .end local v12    # "object":Lcom/alibaba/fastjson/JSONObject;
    :cond_ac
    new-instance v12, Lcom/alibaba/fastjson/JSONObject;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Lcom/alibaba/fastjson/JSONObject;-><init>(Ljava/util/Map;)V

    .restart local v12    # "object":Lcom/alibaba/fastjson/JSONObject;
    goto :goto_98

    .line 912
    .end local v12    # "object":Lcom/alibaba/fastjson/JSONObject;
    :cond_b4
    if-nez p2, :cond_ba

    .line 913
    invoke-static {}, Lcom/alibaba/fastjson/parser/ParserConfig;->getGlobalInstance()Lcom/alibaba/fastjson/parser/ParserConfig;

    move-result-object p2

    .line 916
    :cond_ba
    const/4 v8, 0x0

    .line 917
    .local v8, "javaBeanDeser":Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDeserializer(Ljava/lang/reflect/Type;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;

    move-result-object v4

    .line 918
    .local v4, "deserizer":Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
    instance-of v14, v4, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    if-eqz v14, :cond_cb

    .line 919
    move-object v0, v4

    check-cast v0, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;

    move-object v8, v0

    .line 922
    :cond_cb
    if-nez v8, :cond_d5

    .line 923
    new-instance v14, Lcom/alibaba/fastjson/JSONException;

    const-string v15, "can not get javaBeanDeserializer"

    invoke-direct {v14, v15}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 926
    :cond_d5
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v8, v0, v1}, Lcom/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer;->createInstance(Ljava/util/Map;Lcom/alibaba/fastjson/parser/ParserConfig;)Ljava/lang/Object;
    :try_end_dc
    .catch Ljava/lang/Exception; {:try_start_76 .. :try_end_dc} :catch_6b

    move-result-object v14

    goto/16 :goto_36
.end method

.method public static castToLong(Ljava/lang/Object;)Ljava/lang/Long;
    .registers 7
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 470
    if-nez p0, :cond_4

    .line 504
    .local v2, "strVal":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object v3

    .line 474
    .end local v2    # "strVal":Ljava/lang/String;
    :cond_4
    instance-of v4, p0, Ljava/lang/Number;

    if-eqz v4, :cond_13

    .line 475
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    goto :goto_3

    .line 478
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_13
    instance-of v4, p0, Ljava/lang/String;

    if-eqz v4, :cond_69

    move-object v2, p0

    .line 479
    check-cast v2, Ljava/lang/String;

    .line 480
    .restart local v2    # "strVal":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_3

    const-string v4, "null"

    .line 481
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "NULL"

    .line 482
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 486
    const/16 v3, 0x2c

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-eqz v3, :cond_40

    .line 487
    const-string v3, ","

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 491
    :cond_40
    :try_start_40
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_47
    .catch Ljava/lang/NumberFormatException; {:try_start_40 .. :try_end_47} :catch_49

    move-result-object v3

    goto :goto_3

    .line 492
    :catch_49
    move-exception v3

    .line 496
    new-instance v1, Lcom/alibaba/fastjson/parser/JSONScanner;

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 497
    .local v1, "dateParser":Lcom/alibaba/fastjson/parser/JSONScanner;
    const/4 v0, 0x0

    .line 498
    .local v0, "calendar":Ljava/util/Calendar;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(Z)Z

    move-result v3

    if-eqz v3, :cond_5b

    .line 499
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 501
    :cond_5b
    invoke-virtual {v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    .line 503
    if-eqz v0, :cond_69

    .line 504
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    goto :goto_3

    .line 508
    .end local v0    # "calendar":Ljava/util/Calendar;
    .end local v1    # "dateParser":Lcom/alibaba/fastjson/parser/JSONScanner;
    .end local v2    # "strVal":Ljava/lang/String;
    :cond_69
    new-instance v3, Lcom/alibaba/fastjson/JSONException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "can not cast to long, value : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static castToShort(Ljava/lang/Object;)Ljava/lang/Short;
    .registers 5
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 152
    if-nez p0, :cond_4

    .line 169
    .local v0, "strVal":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object v1

    .line 156
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_4
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_13

    .line 157
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->shortValue()S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    goto :goto_3

    .line 160
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_13
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_39

    move-object v0, p0

    .line 161
    check-cast v0, Ljava/lang/String;

    .line 163
    .restart local v0    # "strVal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "null"

    .line 164
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "NULL"

    .line 165
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 169
    invoke-static {v0}, Ljava/lang/Short;->parseShort(Ljava/lang/String;)S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    goto :goto_3

    .line 172
    .end local v0    # "strVal":Ljava/lang/String;
    :cond_39
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not cast to short, value : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static castToSqlDate(Ljava/lang/Object;)Ljava/sql/Date;
    .registers 7
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 388
    if-nez p0, :cond_5

    move-object p0, v4

    .line 425
    .end local p0    # "value":Ljava/lang/Object;
    .local v0, "longValue":J
    :goto_4
    return-object p0

    .line 392
    .end local v0    # "longValue":J
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_5
    instance-of v3, p0, Ljava/sql/Date;

    if-eqz v3, :cond_c

    .line 393
    check-cast p0, Ljava/sql/Date;

    goto :goto_4

    .line 396
    :cond_c
    instance-of v3, p0, Ljava/util/Date;

    if-eqz v3, :cond_1d

    .line 397
    new-instance v3, Ljava/sql/Date;

    check-cast p0, Ljava/util/Date;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/sql/Date;-><init>(J)V

    move-object p0, v3

    goto :goto_4

    .line 400
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_1d
    instance-of v3, p0, Ljava/util/Calendar;

    if-eqz v3, :cond_2e

    .line 401
    new-instance v3, Ljava/sql/Date;

    check-cast p0, Ljava/util/Calendar;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/sql/Date;-><init>(J)V

    move-object p0, v3

    goto :goto_4

    .line 404
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_2e
    const-wide/16 v0, 0x0

    .line 406
    .restart local v0    # "longValue":J
    instance-of v3, p0, Ljava/lang/Number;

    if-eqz v3, :cond_3b

    move-object v3, p0

    .line 407
    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 410
    :cond_3b
    instance-of v3, p0, Ljava/lang/String;

    if-eqz v3, :cond_5e

    move-object v2, p0

    .line 411
    check-cast v2, Ljava/lang/String;

    .line 412
    .local v2, "strVal":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_58

    const-string v3, "null"

    .line 413
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_58

    const-string v3, "NULL"

    .line 414
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5a

    :cond_58
    move-object p0, v4

    .line 415
    goto :goto_4

    .line 418
    :cond_5a
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 421
    .end local v2    # "strVal":Ljava/lang/String;
    :cond_5e
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-gtz v3, :cond_7d

    .line 422
    new-instance v3, Lcom/alibaba/fastjson/JSONException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "can not cast to Date, value : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 425
    :cond_7d
    new-instance p0, Ljava/sql/Date;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-direct {p0, v0, v1}, Ljava/sql/Date;-><init>(J)V

    goto :goto_4
.end method

.method public static castToString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 95
    if-nez p0, :cond_4

    .line 96
    const/4 v0, 0x0

    .line 99
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public static castToTimestamp(Ljava/lang/Object;)Ljava/sql/Timestamp;
    .registers 7
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 429
    if-nez p0, :cond_5

    move-object p0, v4

    .line 466
    .end local p0    # "value":Ljava/lang/Object;
    .local v0, "longValue":J
    :goto_4
    return-object p0

    .line 433
    .end local v0    # "longValue":J
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_5
    instance-of v3, p0, Ljava/util/Calendar;

    if-eqz v3, :cond_16

    .line 434
    new-instance v3, Ljava/sql/Timestamp;

    check-cast p0, Ljava/util/Calendar;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/sql/Timestamp;-><init>(J)V

    move-object p0, v3

    goto :goto_4

    .line 437
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_16
    instance-of v3, p0, Ljava/sql/Timestamp;

    if-eqz v3, :cond_1d

    .line 438
    check-cast p0, Ljava/sql/Timestamp;

    goto :goto_4

    .line 441
    :cond_1d
    instance-of v3, p0, Ljava/util/Date;

    if-eqz v3, :cond_2e

    .line 442
    new-instance v3, Ljava/sql/Timestamp;

    check-cast p0, Ljava/util/Date;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/sql/Timestamp;-><init>(J)V

    move-object p0, v3

    goto :goto_4

    .line 445
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_2e
    const-wide/16 v0, 0x0

    .line 447
    .restart local v0    # "longValue":J
    instance-of v3, p0, Ljava/lang/Number;

    if-eqz v3, :cond_3b

    move-object v3, p0

    .line 448
    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 451
    :cond_3b
    instance-of v3, p0, Ljava/lang/String;

    if-eqz v3, :cond_5e

    move-object v2, p0

    .line 452
    check-cast v2, Ljava/lang/String;

    .line 453
    .local v2, "strVal":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_58

    const-string v3, "null"

    .line 454
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_58

    const-string v3, "NULL"

    .line 455
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5a

    :cond_58
    move-object p0, v4

    .line 456
    goto :goto_4

    .line 459
    :cond_5a
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 462
    .end local v2    # "strVal":Ljava/lang/String;
    :cond_5e
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-gtz v3, :cond_7d

    .line 463
    new-instance v3, Lcom/alibaba/fastjson/JSONException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "can not cast to Date, value : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 466
    :cond_7d
    new-instance p0, Ljava/sql/Timestamp;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-direct {p0, v0, v1}, Ljava/sql/Timestamp;-><init>(J)V

    goto :goto_4
.end method

.method public static clearClassMapping()V
    .registers 1

    .prologue
    .line 961
    sget-object v0, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    .line 962
    invoke-static {}, Lcom/alibaba/fastjson/util/TypeUtils;->addBaseClassMappings()V

    .line 963
    return-void
.end method

.method public static computeGetters(Ljava/lang/Class;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/Map;Z)Ljava/util/List;
    .registers 40
    .param p1, "jsonType"    # Lcom/alibaba/fastjson/annotation/JSONType;
    .param p3, "sorted"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/annotation/JSONType;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1047
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "aliasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v28, Ljava/util/LinkedHashMap;

    invoke-direct/range {v28 .. v28}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1049
    .local v28, "fieldInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/alibaba/fastjson/util/FieldInfo;>;"
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v34

    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v35, v0

    const/4 v5, 0x0

    move/from16 v33, v5

    :goto_11
    move/from16 v0, v33

    move/from16 v1, v35

    if-ge v0, v1, :cond_2d4

    aget-object v4, v34, v33

    .line 1050
    .local v4, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v31

    .line 1051
    .local v31, "methodName":Ljava/lang/String;
    const/4 v8, 0x0

    .local v8, "ordinal":I
    const/4 v9, 0x0

    .line 1052
    .local v9, "serialzeFeatures":I
    const/4 v12, 0x0

    .line 1054
    .local v12, "label":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 1049
    :cond_2a
    :goto_2a
    add-int/lit8 v5, v33, 0x1

    move/from16 v33, v5

    goto :goto_11

    .line 1058
    :cond_2f
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    sget-object v6, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2a

    .line 1062
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    array-length v5, v5

    if-nez v5, :cond_2a

    .line 1066
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Ljava/lang/ClassLoader;

    if-eq v5, v6, :cond_2a

    .line 1070
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "getMetaClass"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_66

    .line 1071
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "groovy.lang.MetaClass"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2a

    .line 1075
    :cond_66
    const-class v5, Lcom/alibaba/fastjson/annotation/JSONField;

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v10

    check-cast v10, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 1077
    .local v10, "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-nez v10, :cond_76

    .line 1078
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/alibaba/fastjson/util/TypeUtils;->getSupperMethodAnnotation(Ljava/lang/Class;Ljava/lang/reflect/Method;)Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v10

    .line 1081
    :cond_76
    if-eqz v10, :cond_c3

    .line 1082
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->serialize()Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 1086
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v8

    .line 1087
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v5

    invoke-static {v5}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v9

    .line 1089
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_b5

    .line 1090
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v3

    .line 1092
    .local v3, "propertyName":Ljava/lang/String;
    if-eqz p2, :cond_a4

    .line 1093
    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "propertyName":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 1094
    .restart local v3    # "propertyName":Ljava/lang/String;
    if-eqz v3, :cond_2a

    .line 1099
    :cond_a4
    new-instance v2, Lcom/alibaba/fastjson/util/FieldInfo;

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v11, 0x0

    move-object/from16 v6, p0

    invoke-direct/range {v2 .. v12}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V

    .line 1101
    .local v2, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v28

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2a

    .line 1105
    .end local v2    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_b5
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->label()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_c3

    .line 1106
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONField;->label()Ljava/lang/String;

    move-result-object v12

    .line 1110
    :cond_c3
    const-string v5, "get"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_17e

    .line 1111
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x4

    if-lt v5, v6, :cond_2a

    .line 1115
    const-string v5, "getClass"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2a

    .line 1119
    const/4 v5, 0x3

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v25

    .line 1122
    .local v25, "c3":C
    invoke-static/range {v25 .. v25}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v5

    if-nez v5, :cond_f1

    const/16 v5, 0x200

    move/from16 v0, v25

    if-le v0, v5, :cond_252

    .line 1125
    :cond_f1
    sget-boolean v5, Lcom/alibaba/fastjson/util/TypeUtils;->compatibleWithJavaBean:Z

    if-eqz v5, :cond_22d

    .line 1126
    const/4 v5, 0x3

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/alibaba/fastjson/util/TypeUtils;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1140
    :goto_100
    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/alibaba/fastjson/util/TypeUtils;->isJSONTypeIgnore(Ljava/lang/Class;Ljava/lang/String;)Z

    move-result v29

    .line 1142
    .local v29, "ignore":Z
    if-nez v29, :cond_2a

    .line 1146
    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/alibaba/fastjson/parser/ParserConfig;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v16

    .line 1147
    .local v16, "field":Ljava/lang/reflect/Field;
    const/16 v22, 0x0

    .line 1148
    .local v22, "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v16, :cond_3d9

    .line 1149
    const-class v5, Lcom/alibaba/fastjson/annotation/JSONField;

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v22

    .end local v22    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    check-cast v22, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 1151
    .restart local v22    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v22, :cond_3d9

    .line 1152
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->serialize()Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 1156
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v8

    .line 1157
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v5

    invoke-static {v5}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v9

    .line 1159
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_14a

    .line 1160
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v3

    .line 1162
    .restart local v3    # "propertyName":Ljava/lang/String;
    if-eqz p2, :cond_14a

    .line 1163
    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "propertyName":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 1164
    .restart local v3    # "propertyName":Ljava/lang/String;
    if-eqz v3, :cond_2a

    .line 1170
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_14a
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->label()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_3d9

    .line 1171
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->label()Ljava/lang/String;

    move-result-object v12

    move-object v14, v3

    .line 1176
    :goto_159
    if-eqz p2, :cond_166

    .line 1177
    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1178
    .restart local v3    # "propertyName":Ljava/lang/String;
    if-eqz v3, :cond_2a

    move-object v14, v3

    .line 1183
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_166
    new-instance v2, Lcom/alibaba/fastjson/util/FieldInfo;

    const/16 v18, 0x0

    move-object v13, v2

    move-object v15, v4

    move-object/from16 v17, p0

    move/from16 v19, v8

    move/from16 v20, v9

    move-object/from16 v21, v10

    move-object/from16 v23, v12

    invoke-direct/range {v13 .. v23}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V

    .line 1185
    .restart local v2    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v28

    invoke-interface {v0, v14, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1188
    .end local v2    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v16    # "field":Ljava/lang/reflect/Field;
    .end local v22    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v25    # "c3":C
    .end local v29    # "ignore":Z
    :cond_17e
    const-string v5, "is"

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 1189
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x3

    if-lt v5, v6, :cond_2a

    .line 1193
    const/4 v5, 0x2

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v24

    .line 1196
    .local v24, "c2":C
    invoke-static/range {v24 .. v24}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v5

    if-eqz v5, :cond_2b6

    .line 1197
    sget-boolean v5, Lcom/alibaba/fastjson/util/TypeUtils;->compatibleWithJavaBean:Z

    if-eqz v5, :cond_291

    .line 1198
    const/4 v5, 0x2

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/alibaba/fastjson/util/TypeUtils;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1210
    :goto_1ab
    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lcom/alibaba/fastjson/parser/ParserConfig;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v16

    .line 1212
    .restart local v16    # "field":Ljava/lang/reflect/Field;
    if-nez v16, :cond_1bb

    .line 1213
    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-static {v0, v1}, Lcom/alibaba/fastjson/parser/ParserConfig;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v16

    .line 1216
    :cond_1bb
    const/16 v22, 0x0

    .line 1217
    .restart local v22    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v16, :cond_3d6

    .line 1218
    const-class v5, Lcom/alibaba/fastjson/annotation/JSONField;

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v22

    .end local v22    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    check-cast v22, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 1220
    .restart local v22    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v22, :cond_3d6

    .line 1221
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->serialize()Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 1225
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v8

    .line 1226
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v5

    invoke-static {v5}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v9

    .line 1228
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_1f7

    .line 1229
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v3

    .line 1231
    .restart local v3    # "propertyName":Ljava/lang/String;
    if-eqz p2, :cond_1f7

    .line 1232
    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "propertyName":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 1233
    .restart local v3    # "propertyName":Ljava/lang/String;
    if-eqz v3, :cond_2a

    .line 1239
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_1f7
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->label()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_3d6

    .line 1240
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->label()Ljava/lang/String;

    move-result-object v12

    move-object v14, v3

    .line 1245
    :goto_206
    if-eqz p2, :cond_213

    .line 1246
    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1247
    .restart local v3    # "propertyName":Ljava/lang/String;
    if-eqz v3, :cond_2a

    move-object v14, v3

    .line 1252
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_213
    new-instance v2, Lcom/alibaba/fastjson/util/FieldInfo;

    const/16 v18, 0x0

    move-object v13, v2

    move-object v15, v4

    move-object/from16 v17, p0

    move/from16 v19, v8

    move/from16 v20, v9

    move-object/from16 v21, v10

    move-object/from16 v23, v12

    invoke-direct/range {v13 .. v23}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V

    .line 1254
    .restart local v2    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v28

    invoke-interface {v0, v14, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2a

    .line 1128
    .end local v2    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v16    # "field":Ljava/lang/reflect/Field;
    .end local v22    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v24    # "c2":C
    .restart local v25    # "c3":C
    :cond_22d
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x3

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x4

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "propertyName":Ljava/lang/String;
    goto/16 :goto_100

    .line 1130
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_252
    const/16 v5, 0x5f

    move/from16 v0, v25

    if-ne v0, v5, :cond_261

    .line 1131
    const/4 v5, 0x4

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "propertyName":Ljava/lang/String;
    goto/16 :goto_100

    .line 1132
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_261
    const/16 v5, 0x66

    move/from16 v0, v25

    if-ne v0, v5, :cond_270

    .line 1133
    const/4 v5, 0x3

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "propertyName":Ljava/lang/String;
    goto/16 :goto_100

    .line 1134
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_270
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x5

    if-lt v5, v6, :cond_2a

    const/4 v5, 0x4

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 1135
    const/4 v5, 0x3

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/alibaba/fastjson/util/TypeUtils;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_100

    .line 1200
    .end local v25    # "c3":C
    .restart local v24    # "c2":C
    :cond_291
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x2

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x3

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "propertyName":Ljava/lang/String;
    goto/16 :goto_1ab

    .line 1202
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_2b6
    const/16 v5, 0x5f

    move/from16 v0, v24

    if-ne v0, v5, :cond_2c5

    .line 1203
    const/4 v5, 0x3

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "propertyName":Ljava/lang/String;
    goto/16 :goto_1ab

    .line 1204
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_2c5
    const/16 v5, 0x66

    move/from16 v0, v24

    if-ne v0, v5, :cond_2a

    .line 1205
    const/4 v5, 0x2

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_1ab

    .line 1258
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v8    # "ordinal":I
    .end local v9    # "serialzeFeatures":I
    .end local v10    # "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v12    # "label":Ljava/lang/String;
    .end local v24    # "c2":C
    .end local v31    # "methodName":Ljava/lang/String;
    :cond_2d4
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v6

    array-length v7, v6

    const/4 v5, 0x0

    :goto_2da
    if-ge v5, v7, :cond_35a

    aget-object v16, v6, v5

    .line 1259
    .restart local v16    # "field":Ljava/lang/reflect/Field;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v11

    invoke-static {v11}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v11

    if-eqz v11, :cond_2eb

    .line 1258
    :cond_2e8
    :goto_2e8
    add-int/lit8 v5, v5, 0x1

    goto :goto_2da

    .line 1263
    :cond_2eb
    const-class v11, Lcom/alibaba/fastjson/annotation/JSONField;

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v22

    check-cast v22, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 1265
    .restart local v22    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    const/4 v8, 0x0

    .restart local v8    # "ordinal":I
    const/4 v9, 0x0

    .line 1266
    .restart local v9    # "serialzeFeatures":I
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    .line 1267
    .restart local v3    # "propertyName":Ljava/lang/String;
    const/4 v12, 0x0

    .line 1268
    .restart local v12    # "label":Ljava/lang/String;
    if-eqz v22, :cond_32c

    .line 1269
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->serialize()Z

    move-result v11

    if-eqz v11, :cond_2e8

    .line 1273
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->ordinal()I

    move-result v8

    .line 1274
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v11

    invoke-static {v11}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v9

    .line 1276
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_31e

    .line 1277
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->name()Ljava/lang/String;

    move-result-object v3

    .line 1280
    :cond_31e
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->label()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_32c

    .line 1281
    invoke-interface/range {v22 .. v22}, Lcom/alibaba/fastjson/annotation/JSONField;->label()Ljava/lang/String;

    move-result-object v12

    .line 1285
    :cond_32c
    if-eqz p2, :cond_338

    .line 1286
    move-object/from16 v0, p2

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "propertyName":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 1287
    .restart local v3    # "propertyName":Ljava/lang/String;
    if-eqz v3, :cond_2e8

    .line 1292
    :cond_338
    move-object/from16 v0, v28

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_2e8

    .line 1293
    new-instance v2, Lcom/alibaba/fastjson/util/FieldInfo;

    const/4 v15, 0x0

    const/16 v18, 0x0

    const/16 v21, 0x0

    move-object v13, v2

    move-object v14, v3

    move-object/from16 v17, p0

    move/from16 v19, v8

    move/from16 v20, v9

    move-object/from16 v23, v12

    invoke-direct/range {v13 .. v23}, Lcom/alibaba/fastjson/util/FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Field;Ljava/lang/Class;Ljava/lang/reflect/Type;IILcom/alibaba/fastjson/annotation/JSONField;Lcom/alibaba/fastjson/annotation/JSONField;Ljava/lang/String;)V

    .line 1295
    .restart local v2    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v28

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2e8

    .line 1299
    .end local v2    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v3    # "propertyName":Ljava/lang/String;
    .end local v8    # "ordinal":I
    .end local v9    # "serialzeFeatures":I
    .end local v12    # "label":Ljava/lang/String;
    .end local v16    # "field":Ljava/lang/reflect/Field;
    .end local v22    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    :cond_35a
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    .line 1301
    .local v27, "fieldInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    const/16 v26, 0x0

    .line 1302
    .local v26, "containsAll":Z
    const/16 v32, 0x0

    .line 1304
    .local v32, "orders":[Ljava/lang/String;
    const-class v5, Lcom/alibaba/fastjson/annotation/JSONType;

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v10

    check-cast v10, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 1305
    .local v10, "annotation":Lcom/alibaba/fastjson/annotation/JSONType;
    if-eqz v10, :cond_394

    .line 1306
    invoke-interface {v10}, Lcom/alibaba/fastjson/annotation/JSONType;->orders()[Ljava/lang/String;

    move-result-object v32

    .line 1308
    if-eqz v32, :cond_3b3

    move-object/from16 v0, v32

    array-length v5, v0

    invoke-interface/range {v28 .. v28}, Ljava/util/Map;->size()I

    move-result v6

    if-ne v5, v6, :cond_3b3

    .line 1309
    const/16 v26, 0x1

    .line 1310
    move-object/from16 v0, v32

    array-length v6, v0

    const/4 v5, 0x0

    :goto_384
    if-ge v5, v6, :cond_394

    aget-object v30, v32, v5

    .line 1311
    .local v30, "item":Ljava/lang/String;
    move-object/from16 v0, v28

    move-object/from16 v1, v30

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3b0

    .line 1312
    const/16 v26, 0x0

    .line 1321
    .end local v30    # "item":Ljava/lang/String;
    :cond_394
    :goto_394
    if-eqz v26, :cond_3b6

    .line 1322
    move-object/from16 v0, v32

    array-length v6, v0

    const/4 v5, 0x0

    :goto_39a
    if-ge v5, v6, :cond_3d5

    aget-object v30, v32, v5

    .line 1323
    .restart local v30    # "item":Ljava/lang/String;
    move-object/from16 v0, v28

    move-object/from16 v1, v30

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 1324
    .restart local v2    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1322
    add-int/lit8 v5, v5, 0x1

    goto :goto_39a

    .line 1310
    .end local v2    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_3b0
    add-int/lit8 v5, v5, 0x1

    goto :goto_384

    .line 1317
    .end local v30    # "item":Ljava/lang/String;
    :cond_3b3
    const/16 v26, 0x0

    goto :goto_394

    .line 1327
    :cond_3b6
    invoke-interface/range {v28 .. v28}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3be
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3d0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 1328
    .restart local v2    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v27

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3be

    .line 1331
    .end local v2    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_3d0
    if-eqz p3, :cond_3d5

    .line 1332
    invoke-static/range {v27 .. v27}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1336
    :cond_3d5
    return-object v27

    .end local v26    # "containsAll":Z
    .end local v27    # "fieldInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    .end local v32    # "orders":[Ljava/lang/String;
    .restart local v4    # "method":Ljava/lang/reflect/Method;
    .restart local v8    # "ordinal":I
    .restart local v9    # "serialzeFeatures":I
    .local v10, "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .restart local v12    # "label":Ljava/lang/String;
    .restart local v16    # "field":Ljava/lang/reflect/Field;
    .restart local v22    # "fieldAnnotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .restart local v24    # "c2":C
    .restart local v31    # "methodName":Ljava/lang/String;
    :cond_3d6
    move-object v14, v3

    goto/16 :goto_206

    .end local v24    # "c2":C
    .restart local v25    # "c3":C
    .restart local v29    # "ignore":Z
    :cond_3d9
    move-object v14, v3

    goto/16 :goto_159
.end method

.method public static createCollection(Ljava/lang/reflect/Type;)Ljava/util/Collection;
    .registers 8
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .prologue
    .line 1557
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->getRawClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v3

    .line 1560
    .local v3, "rawClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v4, Ljava/util/AbstractCollection;

    if-eq v3, v4, :cond_c

    const-class v4, Ljava/util/Collection;

    if-ne v3, v4, :cond_12

    .line 1562
    :cond_c
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1586
    .end local p0    # "type":Ljava/lang/reflect/Type;
    .local v2, "list":Ljava/util/Collection;
    :goto_11
    return-object v2

    .line 1563
    .end local v2    # "list":Ljava/util/Collection;
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_12
    const-class v4, Ljava/util/HashSet;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_20

    .line 1564
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .restart local v2    # "list":Ljava/util/Collection;
    goto :goto_11

    .line 1565
    .end local v2    # "list":Ljava/util/Collection;
    :cond_20
    const-class v4, Ljava/util/LinkedHashSet;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 1566
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    .restart local v2    # "list":Ljava/util/Collection;
    goto :goto_11

    .line 1567
    .end local v2    # "list":Ljava/util/Collection;
    :cond_2e
    const-class v4, Ljava/util/TreeSet;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_3c

    .line 1568
    new-instance v2, Ljava/util/TreeSet;

    invoke-direct {v2}, Ljava/util/TreeSet;-><init>()V

    .restart local v2    # "list":Ljava/util/Collection;
    goto :goto_11

    .line 1569
    .end local v2    # "list":Ljava/util/Collection;
    :cond_3c
    const-class v4, Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 1570
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .restart local v2    # "list":Ljava/util/Collection;
    goto :goto_11

    .line 1571
    .end local v2    # "list":Ljava/util/Collection;
    :cond_4a
    const-class v4, Ljava/util/EnumSet;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_69

    .line 1573
    instance-of v4, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v4, :cond_66

    .line 1574
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .end local p0    # "type":Ljava/lang/reflect/Type;
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v1, v4, v5

    .line 1578
    .local v1, "itemType":Ljava/lang/reflect/Type;
    :goto_5f
    check-cast v1, Ljava/lang/Class;

    .end local v1    # "itemType":Ljava/lang/reflect/Type;
    invoke-static {v1}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v2

    .line 1579
    .restart local v2    # "list":Ljava/util/Collection;
    goto :goto_11

    .line 1576
    .end local v2    # "list":Ljava/util/Collection;
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_66
    const-class v1, Ljava/lang/Object;

    .restart local v1    # "itemType":Ljava/lang/reflect/Type;
    goto :goto_5f

    .line 1581
    .end local v1    # "itemType":Ljava/lang/reflect/Type;
    :cond_69
    :try_start_69
    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_6f} :catch_70

    .restart local v2    # "list":Ljava/util/Collection;
    goto :goto_11

    .line 1582
    .end local v2    # "list":Ljava/util/Collection;
    :catch_70
    move-exception v0

    .line 1583
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "create instane error, class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static decapitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1509
    if-eqz p0, :cond_a

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_b

    .line 1517
    .end local p0    # "name":Ljava/lang/String;
    :cond_a
    :goto_a
    return-object p0

    .line 1512
    .restart local p0    # "name":Ljava/lang/String;
    :cond_b
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v3, :cond_25

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v1

    if-nez v1, :cond_a

    .line 1515
    :cond_25
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 1516
    .local v0, "chars":[C
    aget-char v1, v0, v2

    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    aput-char v1, v0, v2

    .line 1517
    new-instance p0, Ljava/lang/String;

    .end local p0    # "name":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_a
.end method

.method public static getClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;
    .registers 4
    .param p0, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 1457
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Ljava/lang/Class;

    if-ne v1, v2, :cond_b

    .line 1458
    check-cast p0, Ljava/lang/Class;

    .line 1470
    .end local p0    # "type":Ljava/lang/reflect/Type;
    :goto_a
    return-object p0

    .line 1461
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_b
    instance-of v1, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v1, :cond_1a

    .line 1462
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .end local p0    # "type":Ljava/lang/reflect/Type;
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-static {v1}, Lcom/alibaba/fastjson/util/TypeUtils;->getClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object p0

    goto :goto_a

    .line 1465
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_1a
    instance-of v1, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v1, :cond_2b

    .line 1466
    check-cast p0, Ljava/lang/reflect/TypeVariable;

    .end local p0    # "type":Ljava/lang/reflect/Type;
    invoke-interface {p0}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v0, v1, v2

    .line 1467
    .local v0, "boundType":Ljava/lang/reflect/Type;
    check-cast v0, Ljava/lang/Class;

    .end local v0    # "boundType":Ljava/lang/reflect/Type;
    move-object p0, v0

    goto :goto_a

    .line 1470
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_2b
    const-class p0, Ljava/lang/Object;

    goto :goto_a
.end method

.method public static getCollectionItemClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;
    .registers 5
    .param p0, "fieldType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 1537
    instance-of v2, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v2, :cond_2e

    .line 1539
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .end local p0    # "fieldType":Ljava/lang/reflect/Type;
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v0, v2, v3

    .line 1541
    .local v0, "actualTypeArgument":Ljava/lang/reflect/Type;
    instance-of v2, v0, Ljava/lang/Class;

    if-eqz v2, :cond_26

    move-object v1, v0

    .line 1542
    check-cast v1, Ljava/lang/Class;

    .line 1543
    .local v1, "itemClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v2

    if-nez v2, :cond_30

    .line 1544
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    const-string v3, "can not create ASMParser"

    invoke-direct {v2, v3}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1547
    .end local v1    # "itemClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_26
    new-instance v2, Lcom/alibaba/fastjson/JSONException;

    const-string v3, "can not create ASMParser"

    invoke-direct {v2, v3}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1552
    .end local v0    # "actualTypeArgument":Ljava/lang/reflect/Type;
    .restart local p0    # "fieldType":Ljava/lang/reflect/Type;
    :cond_2e
    const-class v1, Ljava/lang/Object;

    .end local p0    # "fieldType":Ljava/lang/reflect/Type;
    :cond_30
    return-object v1
.end method

.method public static getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;
    .registers 8
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "declaredFields"    # [Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/reflect/Field;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 1474
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    array-length v3, p2

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v3, :cond_14

    aget-object v0, p2, v2

    .line 1475
    .local v0, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 1485
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :goto_10
    return-object v0

    .line 1474
    .restart local v0    # "field":Ljava/lang/reflect/Field;
    :cond_11
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1480
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :cond_14
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    .line 1481
    .local v1, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_27

    const-class v2, Ljava/lang/Object;

    if-eq v1, v2, :cond_27

    .line 1482
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-static {v1, p1, v2}, Lcom/alibaba/fastjson/util/TypeUtils;->getField(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/reflect/Field;)Ljava/lang/reflect/Field;

    move-result-object v0

    goto :goto_10

    .line 1485
    :cond_27
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public static getGenericParamType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .registers 2
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .prologue
    .line 1425
    instance-of v0, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_5

    .line 1433
    .end local p0    # "type":Ljava/lang/reflect/Type;
    :cond_4
    :goto_4
    return-object p0

    .line 1429
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_5
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_4

    .line 1430
    check-cast p0, Ljava/lang/Class;

    .end local p0    # "type":Ljava/lang/reflect/Type;
    invoke-virtual {p0}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->getGenericParamType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object p0

    goto :goto_4
.end method

.method public static getParserFeatures(Ljava/lang/Class;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 1499
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 1501
    .local v0, "annotation":Lcom/alibaba/fastjson/annotation/JSONType;
    if-nez v0, :cond_c

    .line 1502
    const/4 v1, 0x0

    .line 1505
    :goto_b
    return v1

    :cond_c
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONType;->parseFeatures()[Lcom/alibaba/fastjson/parser/Feature;

    move-result-object v1

    invoke-static {v1}, Lcom/alibaba/fastjson/parser/Feature;->of([Lcom/alibaba/fastjson/parser/Feature;)I

    move-result v1

    goto :goto_b
.end method

.method public static getRawClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;
    .registers 3
    .param p0, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 1590
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_7

    .line 1591
    check-cast p0, Ljava/lang/Class;

    .line 1593
    .end local p0    # "type":Ljava/lang/reflect/Type;
    :goto_6
    return-object p0

    .line 1592
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_7
    instance-of v0, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_16

    .line 1593
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .end local p0    # "type":Ljava/lang/reflect/Type;
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->getRawClass(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object p0

    goto :goto_6

    .line 1595
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_16
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    const-string v1, "TODO"

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getSerializeFeatures(Ljava/lang/Class;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 1489
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 1491
    .local v0, "annotation":Lcom/alibaba/fastjson/annotation/JSONType;
    if-nez v0, :cond_c

    .line 1492
    const/4 v1, 0x0

    .line 1495
    :goto_b
    return v1

    :cond_c
    invoke-interface {v0}, Lcom/alibaba/fastjson/annotation/JSONType;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v1

    invoke-static {v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v1

    goto :goto_b
.end method

.method public static getSupperMethodAnnotation(Ljava/lang/Class;Ljava/lang/reflect/Method;)Lcom/alibaba/fastjson/annotation/JSONField;
    .registers 17
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Method;",
            ")",
            "Lcom/alibaba/fastjson/annotation/JSONField;"
        }
    .end annotation

    .prologue
    .line 1340
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v5

    .line 1341
    .local v5, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v8, v5

    if-lez v8, :cond_59

    .line 1342
    invoke-virtual/range {p1 .. p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v7

    .line 1343
    .local v7, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v10, v5

    const/4 v8, 0x0

    move v9, v8

    :goto_e
    if-ge v9, v10, :cond_59

    aget-object v2, v5, v9

    .line 1344
    .local v2, "interfaceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v2}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v11

    array-length v12, v11

    const/4 v8, 0x0

    :goto_18
    if-ge v8, v12, :cond_55

    aget-object v3, v11, v8

    .line 1345
    .local v3, "interfaceMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    .line 1346
    .local v4, "interfaceTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v13, v4

    array-length v14, v7

    if-eq v13, v14, :cond_27

    .line 1344
    :cond_24
    add-int/lit8 v8, v8, 0x1

    goto :goto_18

    .line 1349
    :cond_27
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_24

    .line 1352
    const/4 v6, 0x1

    .line 1353
    .local v6, "match":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_37
    array-length v13, v7

    if-ge v1, v13, :cond_45

    .line 1354
    aget-object v13, v4, v1

    aget-object v14, v7, v1

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_52

    .line 1355
    const/4 v6, 0x0

    .line 1360
    :cond_45
    if-eqz v6, :cond_24

    .line 1364
    const-class v13, Lcom/alibaba/fastjson/annotation/JSONField;

    invoke-virtual {v3, v13}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/alibaba/fastjson/annotation/JSONField;

    .line 1365
    .local v0, "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v0, :cond_24

    .line 1371
    .end local v0    # "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    .end local v1    # "i":I
    .end local v2    # "interfaceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "interfaceMethod":Ljava/lang/reflect/Method;
    .end local v4    # "interfaceTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v6    # "match":Z
    .end local v7    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :goto_51
    return-object v0

    .line 1353
    .restart local v1    # "i":I
    .restart local v2    # "interfaceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "interfaceMethod":Ljava/lang/reflect/Method;
    .restart local v4    # "interfaceTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .restart local v6    # "match":Z
    .restart local v7    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_52
    add-int/lit8 v1, v1, 0x1

    goto :goto_37

    .line 1343
    .end local v1    # "i":I
    .end local v3    # "interfaceMethod":Ljava/lang/reflect/Method;
    .end local v4    # "interfaceTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v6    # "match":Z
    :cond_55
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    goto :goto_e

    .line 1371
    .end local v2    # "interfaceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_59
    const/4 v0, 0x0

    goto :goto_51
.end method

.method public static isGenericParamType(Ljava/lang/reflect/Type;)Z
    .registers 4
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .prologue
    const/4 v1, 0x0

    .line 1409
    instance-of v2, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v2, :cond_7

    .line 1410
    const/4 v1, 0x1

    .line 1421
    .end local p0    # "type":Ljava/lang/reflect/Type;
    .local v0, "superType":Ljava/lang/reflect/Type;
    :cond_6
    :goto_6
    return v1

    .line 1413
    .end local v0    # "superType":Ljava/lang/reflect/Type;
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_7
    instance-of v2, p0, Ljava/lang/Class;

    if-eqz v2, :cond_6

    .line 1414
    check-cast p0, Ljava/lang/Class;

    .end local p0    # "type":Ljava/lang/reflect/Type;
    invoke-virtual {p0}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 1415
    .restart local v0    # "superType":Ljava/lang/reflect/Type;
    const-class v2, Ljava/lang/Object;

    if-eq v0, v2, :cond_6

    .line 1418
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->isGenericParamType(Ljava/lang/reflect/Type;)Z

    move-result v1

    goto :goto_6
.end method

.method private static isJSONTypeIgnore(Ljava/lang/Class;Ljava/lang/String;)Z
    .registers 9
    .param p1, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 1375
    const-class v5, Lcom/alibaba/fastjson/annotation/JSONType;

    invoke-virtual {p0, v5}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 1377
    .local v2, "jsonType":Lcom/alibaba/fastjson/annotation/JSONType;
    if-eqz v2, :cond_3a

    .line 1381
    invoke-interface {v2}, Lcom/alibaba/fastjson/annotation/JSONType;->includes()[Ljava/lang/String;

    move-result-object v0

    .line 1382
    .local v0, "fields":[Ljava/lang/String;
    array-length v5, v0

    if-lez v5, :cond_25

    .line 1383
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    array-length v5, v0

    if-ge v1, v5, :cond_23

    .line 1384
    aget-object v5, v0, v1

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_20

    .line 1405
    .end local v0    # "fields":[Ljava/lang/String;
    .end local v1    # "i":I
    :cond_1f
    :goto_1f
    return v3

    .line 1383
    .restart local v0    # "fields":[Ljava/lang/String;
    .restart local v1    # "i":I
    :cond_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    :cond_23
    move v3, v4

    .line 1388
    goto :goto_1f

    .line 1390
    .end local v1    # "i":I
    :cond_25
    invoke-interface {v2}, Lcom/alibaba/fastjson/annotation/JSONType;->ignores()[Ljava/lang/String;

    move-result-object v0

    .line 1391
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2a
    array-length v5, v0

    if-ge v1, v5, :cond_3a

    .line 1392
    aget-object v5, v0, v1

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_37

    move v3, v4

    .line 1393
    goto :goto_1f

    .line 1391
    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_2a

    .line 1399
    .end local v0    # "fields":[Ljava/lang/String;
    .end local v1    # "i":I
    :cond_3a
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Ljava/lang/Object;

    if-eq v5, v6, :cond_1f

    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    if-eqz v5, :cond_1f

    .line 1400
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5, p1}, Lcom/alibaba/fastjson/util/TypeUtils;->isJSONTypeIgnore(Ljava/lang/Class;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1f

    move v3, v4

    .line 1401
    goto :goto_1f
.end method

.method public static isPath(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 972
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v1, Lcom/alibaba/fastjson/util/TypeUtils;->pathClass:Ljava/lang/Class;

    if-nez v1, :cond_10

    sget-boolean v1, Lcom/alibaba/fastjson/util/TypeUtils;->pathClass_error:Z

    if-nez v1, :cond_10

    .line 974
    :try_start_8
    const-string v1, "java.nio.file.Path"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lcom/alibaba/fastjson/util/TypeUtils;->pathClass:Ljava/lang/Class;
    :try_end_10
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_10} :catch_1b

    .line 980
    :cond_10
    :goto_10
    sget-object v1, Lcom/alibaba/fastjson/util/TypeUtils;->pathClass:Ljava/lang/Class;

    if-eqz v1, :cond_20

    .line 981
    sget-object v1, Lcom/alibaba/fastjson/util/TypeUtils;->pathClass:Ljava/lang/Class;

    invoke-virtual {v1, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    .line 984
    :goto_1a
    return v1

    .line 975
    :catch_1b
    move-exception v0

    .line 976
    .local v0, "ex":Ljava/lang/Throwable;
    const/4 v1, 0x1

    sput-boolean v1, Lcom/alibaba/fastjson/util/TypeUtils;->pathClass_error:Z

    goto :goto_10

    .line 984
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_20
    const/4 v1, 0x0

    goto :goto_1a
.end method

.method public static loadClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 2
    .param p0, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 966
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 11
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 988
    if-eqz p0, :cond_a

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_c

    .line 989
    :cond_a
    const/4 v0, 0x0

    .line 1042
    :cond_b
    :goto_b
    return-object v0

    .line 992
    :cond_c
    sget-object v5, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5, p0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 994
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v0, :cond_b

    .line 998
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x5b

    if-ne v5, v6, :cond_2f

    .line 999
    invoke-virtual {p0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 1000
    .local v1, "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v1, v7}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_b

    .line 1003
    .end local v1    # "componentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2f
    const-string v5, "L"

    invoke-virtual {p0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4e

    const-string v5, ";"

    invoke-virtual {p0, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4e

    .line 1004
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {p0, v8, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 1005
    .local v4, "newClassName":Ljava/lang/String;
    invoke-static {v4, p1}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_b

    .line 1009
    .end local v4    # "newClassName":Ljava/lang/String;
    :cond_4e
    if-eqz p1, :cond_5e

    .line 1010
    :try_start_50
    invoke-virtual {p1, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1011
    sget-object v5, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5, p0, v0}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_59
    .catch Ljava/lang/Throwable; {:try_start_50 .. :try_end_59} :catch_5a

    goto :goto_b

    .line 1015
    :catch_5a
    move-exception v3

    .line 1016
    .local v3, "e":Ljava/lang/Throwable;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 1021
    .end local v3    # "e":Ljava/lang/Throwable;
    :cond_5e
    :try_start_5e
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 1023
    .local v2, "contextClassLoader":Ljava/lang/ClassLoader;
    if-eqz v2, :cond_73

    .line 1024
    invoke-virtual {v2, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1025
    sget-object v5, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5, p0, v0}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_71
    .catch Ljava/lang/Throwable; {:try_start_5e .. :try_end_71} :catch_72

    goto :goto_b

    .line 1029
    .end local v2    # "contextClassLoader":Ljava/lang/ClassLoader;
    :catch_72
    move-exception v5

    .line 1034
    :cond_73
    :try_start_73
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1035
    sget-object v5, Lcom/alibaba/fastjson/util/TypeUtils;->mappings:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v5, p0, v0}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7c
    .catch Ljava/lang/Throwable; {:try_start_73 .. :try_end_7c} :catch_7d

    goto :goto_b

    .line 1038
    :catch_7d
    move-exception v5

    goto :goto_b
.end method

.method static setAccessible(Ljava/lang/reflect/AccessibleObject;)V
    .registers 3
    .param p0, "obj"    # Ljava/lang/reflect/AccessibleObject;

    .prologue
    .line 1521
    sget-boolean v1, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessibleEnable:Z

    if-nez v1, :cond_5

    .line 1534
    :cond_4
    :goto_4
    return-void

    .line 1525
    :cond_5
    invoke-virtual {p0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    move-result v1

    if-nez v1, :cond_4

    .line 1530
    const/4 v1, 0x1

    :try_start_c
    invoke-virtual {p0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_f
    .catch Ljava/security/AccessControlException; {:try_start_c .. :try_end_f} :catch_10

    goto :goto_4

    .line 1531
    :catch_10
    move-exception v0

    .line 1532
    .local v0, "error":Ljava/security/AccessControlException;
    const/4 v1, 0x0

    sput-boolean v1, Lcom/alibaba/fastjson/util/TypeUtils;->setAccessibleEnable:Z

    goto :goto_4
.end method

.method public static unwrapOptional(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .registers 4
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .prologue
    const/4 v2, 0x1

    .line 1437
    sget-boolean v1, Lcom/alibaba/fastjson/util/TypeUtils;->optionalClassInited:Z

    if-nez v1, :cond_f

    .line 1439
    :try_start_5
    const-string v1, "java.util.Optional"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lcom/alibaba/fastjson/util/TypeUtils;->optionalClass:Ljava/lang/Class;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_d} :catch_26
    .catchall {:try_start_5 .. :try_end_d} :catchall_2a

    .line 1443
    sput-boolean v2, Lcom/alibaba/fastjson/util/TypeUtils;->optionalClassInited:Z

    .line 1447
    :cond_f
    :goto_f
    instance-of v1, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v1, :cond_25

    move-object v0, p0

    .line 1448
    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    .line 1449
    .local v0, "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v1

    sget-object v2, Lcom/alibaba/fastjson/util/TypeUtils;->optionalClass:Ljava/lang/Class;

    if-ne v1, v2, :cond_25

    .line 1450
    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v1

    const/4 v2, 0x0

    aget-object p0, v1, v2

    .line 1453
    .end local v0    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    .end local p0    # "type":Ljava/lang/reflect/Type;
    :cond_25
    return-object p0

    .line 1440
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :catch_26
    move-exception v1

    .line 1443
    sput-boolean v2, Lcom/alibaba/fastjson/util/TypeUtils;->optionalClassInited:Z

    goto :goto_f

    :catchall_2a
    move-exception v1

    sput-boolean v2, Lcom/alibaba/fastjson/util/TypeUtils;->optionalClassInited:Z

    throw v1
.end method
