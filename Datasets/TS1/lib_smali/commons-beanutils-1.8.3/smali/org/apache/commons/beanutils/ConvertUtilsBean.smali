.class public Lorg/apache/commons/beanutils/ConvertUtilsBean;
.super Ljava/lang/Object;
.source "ConvertUtilsBean.java"


# static fields
.field private static final SPACE:Ljava/lang/Character;

.field private static final ZERO:Ljava/lang/Integer;

.field static array$Ljava$lang$String:Ljava/lang/Class;

.field static class$java$io$File:Ljava/lang/Class;

.field static class$java$lang$Boolean:Ljava/lang/Class;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Character:Ljava/lang/Class;

.field static class$java$lang$Class:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;

.field static class$java$math$BigDecimal:Ljava/lang/Class;

.field static class$java$math$BigInteger:Ljava/lang/Class;

.field static class$java$net$URL:Ljava/lang/Class;

.field static class$java$sql$Date:Ljava/lang/Class;

.field static class$java$sql$Time:Ljava/lang/Class;

.field static class$java$sql$Timestamp:Ljava/lang/Class;

.field static class$java$util$Calendar:Ljava/lang/Class;

.field static class$java$util$Collection:Ljava/lang/Class;

.field static class$java$util$Date:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$ConvertUtils:Ljava/lang/Class;

.field private static defaultShort:Ljava/lang/Short;


# instance fields
.field private converters:Lorg/apache/commons/beanutils/WeakFastHashMap;

.field private defaultBoolean:Ljava/lang/Boolean;

.field private defaultByte:Ljava/lang/Byte;

.field private defaultCharacter:Ljava/lang/Character;

.field private defaultDouble:Ljava/lang/Double;

.field private defaultFloat:Ljava/lang/Float;

.field private defaultInteger:Ljava/lang/Integer;

.field private defaultLong:Ljava/lang/Long;

.field private log:Lorg/apache/commons/logging/Log;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 133
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v2}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->ZERO:Ljava/lang/Integer;

    .line 134
    new-instance v0, Ljava/lang/Character;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/Character;-><init>(C)V

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->SPACE:Ljava/lang/Character;

    .line 387
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, v2}, Ljava/lang/Short;-><init>(S)V

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultShort:Ljava/lang/Short;

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 152
    new-instance v0, Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->converters:Lorg/apache/commons/beanutils/WeakFastHashMap;

    .line 157
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$org$apache$commons$beanutils$ConvertUtils:Ljava/lang/Class;

    if-nez v0, :cond_61

    const-string v0, "org.apache.commons.beanutils.ConvertUtils"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$org$apache$commons$beanutils$ConvertUtils:Ljava/lang/Class;

    :goto_17
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    .line 175
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultBoolean:Ljava/lang/Boolean;

    .line 205
    new-instance v0, Ljava/lang/Byte;

    invoke-direct {v0, v3}, Ljava/lang/Byte;-><init>(B)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultByte:Ljava/lang/Byte;

    .line 235
    new-instance v0, Ljava/lang/Character;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/Character;-><init>(C)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultCharacter:Ljava/lang/Character;

    .line 267
    new-instance v0, Ljava/lang/Double;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultDouble:Ljava/lang/Double;

    .line 297
    new-instance v0, Ljava/lang/Float;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultFloat:Ljava/lang/Float;

    .line 327
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v3}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultInteger:Ljava/lang/Integer;

    .line 357
    new-instance v0, Ljava/lang/Long;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultLong:Ljava/lang/Long;

    .line 163
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->converters:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {v0, v3}, Lorg/apache/commons/beanutils/WeakFastHashMap;->setFast(Z)V

    .line 164
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->deregister()V

    .line 165
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->converters:Lorg/apache/commons/beanutils/WeakFastHashMap;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->setFast(Z)V

    .line 166
    return-void

    .line 157
    :cond_61
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$org$apache$commons$beanutils$ConvertUtils:Ljava/lang/Class;

    goto :goto_17
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 157
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected static getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;
    .registers 1

    .prologue
    .line 142
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    return-object v0
.end method

.method private register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "converter"    # Lorg/apache/commons/beanutils/Converter;

    .prologue
    .line 786
    new-instance v0, Lorg/apache/commons/beanutils/converters/ConverterFacade;

    invoke-direct {v0, p2}, Lorg/apache/commons/beanutils/converters/ConverterFacade;-><init>(Lorg/apache/commons/beanutils/Converter;)V

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 787
    return-void
.end method

.method private registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V
    .registers 8
    .param p1, "componentType"    # Ljava/lang/Class;
    .param p2, "componentConverter"    # Lorg/apache/commons/beanutils/Converter;
    .param p3, "throwException"    # Z
    .param p4, "defaultArraySize"    # I

    .prologue
    .line 774
    const/4 v2, 0x0

    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 775
    .local v1, "arrayType":Ljava/lang/Class;
    const/4 v0, 0x0

    .line 776
    .local v0, "arrayConverter":Lorg/apache/commons/beanutils/Converter;
    if-eqz p3, :cond_15

    .line 777
    new-instance v0, Lorg/apache/commons/beanutils/converters/ArrayConverter;

    .end local v0    # "arrayConverter":Lorg/apache/commons/beanutils/Converter;
    invoke-direct {v0, v1, p2}, Lorg/apache/commons/beanutils/converters/ArrayConverter;-><init>(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 781
    .restart local v0    # "arrayConverter":Lorg/apache/commons/beanutils/Converter;
    :goto_11
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 782
    return-void

    .line 779
    :cond_15
    new-instance v0, Lorg/apache/commons/beanutils/converters/ArrayConverter;

    .end local v0    # "arrayConverter":Lorg/apache/commons/beanutils/Converter;
    invoke-direct {v0, v1, p2, p4}, Lorg/apache/commons/beanutils/converters/ArrayConverter;-><init>(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;I)V

    .restart local v0    # "arrayConverter":Lorg/apache/commons/beanutils/Converter;
    goto :goto_11
.end method

.method private registerArrays(ZI)V
    .registers 5
    .param p1, "throwException"    # Z
    .param p2, "defaultArraySize"    # I

    .prologue
    .line 728
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    new-instance v1, Lorg/apache/commons/beanutils/converters/BooleanConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/BooleanConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 729
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    new-instance v1, Lorg/apache/commons/beanutils/converters/ByteConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/ByteConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 730
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    new-instance v1, Lorg/apache/commons/beanutils/converters/CharacterConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/CharacterConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 731
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    new-instance v1, Lorg/apache/commons/beanutils/converters/DoubleConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/DoubleConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 732
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    new-instance v1, Lorg/apache/commons/beanutils/converters/FloatConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/FloatConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 733
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    new-instance v1, Lorg/apache/commons/beanutils/converters/IntegerConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/IntegerConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 734
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    new-instance v1, Lorg/apache/commons/beanutils/converters/LongConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/LongConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 735
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    new-instance v1, Lorg/apache/commons/beanutils/converters/ShortConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/ShortConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 738
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    if-nez v0, :cond_1cd

    const-string v0, "java.math.BigDecimal"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    :goto_5c
    new-instance v1, Lorg/apache/commons/beanutils/converters/BigDecimalConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/BigDecimalConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 739
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    if-nez v0, :cond_1d1

    const-string v0, "java.math.BigInteger"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    :goto_70
    new-instance v1, Lorg/apache/commons/beanutils/converters/BigIntegerConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/BigIntegerConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 740
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v0, :cond_1d5

    const-string v0, "java.lang.Boolean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_84
    new-instance v1, Lorg/apache/commons/beanutils/converters/BooleanConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/BooleanConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 741
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v0, :cond_1d9

    const-string v0, "java.lang.Byte"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_98
    new-instance v1, Lorg/apache/commons/beanutils/converters/ByteConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/ByteConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 742
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v0, :cond_1dd

    const-string v0, "java.lang.Character"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Character:Ljava/lang/Class;

    :goto_ac
    new-instance v1, Lorg/apache/commons/beanutils/converters/CharacterConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/CharacterConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 743
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v0, :cond_1e1

    const-string v0, "java.lang.Double"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    :goto_c0
    new-instance v1, Lorg/apache/commons/beanutils/converters/DoubleConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/DoubleConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 744
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v0, :cond_1e5

    const-string v0, "java.lang.Float"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    :goto_d4
    new-instance v1, Lorg/apache/commons/beanutils/converters/FloatConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/FloatConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 745
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v0, :cond_1e9

    const-string v0, "java.lang.Integer"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_e8
    new-instance v1, Lorg/apache/commons/beanutils/converters/IntegerConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/IntegerConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 746
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v0, :cond_1ed

    const-string v0, "java.lang.Long"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    :goto_fc
    new-instance v1, Lorg/apache/commons/beanutils/converters/LongConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/LongConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 747
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v0, :cond_1f1

    const-string v0, "java.lang.Short"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    :goto_110
    new-instance v1, Lorg/apache/commons/beanutils/converters/ShortConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/ShortConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 748
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v0, :cond_1f5

    const-string v0, "java.lang.String"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_124
    new-instance v1, Lorg/apache/commons/beanutils/converters/StringConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/StringConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 751
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Class:Ljava/lang/Class;

    if-nez v0, :cond_1f9

    const-string v0, "java.lang.Class"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Class:Ljava/lang/Class;

    :goto_138
    new-instance v1, Lorg/apache/commons/beanutils/converters/ClassConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/ClassConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 752
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Date:Ljava/lang/Class;

    if-nez v0, :cond_1fd

    const-string v0, "java.util.Date"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Date:Ljava/lang/Class;

    :goto_14c
    new-instance v1, Lorg/apache/commons/beanutils/converters/DateConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/DateConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 753
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Calendar:Ljava/lang/Class;

    if-nez v0, :cond_201

    const-string v0, "java.util.Calendar"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Calendar:Ljava/lang/Class;

    :goto_160
    new-instance v1, Lorg/apache/commons/beanutils/converters/DateConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/DateConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 754
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$io$File:Ljava/lang/Class;

    if-nez v0, :cond_205

    const-string v0, "java.io.File"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$io$File:Ljava/lang/Class;

    :goto_174
    new-instance v1, Lorg/apache/commons/beanutils/converters/FileConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/FileConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 755
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Date:Ljava/lang/Class;

    if-nez v0, :cond_209

    const-string v0, "java.sql.Date"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Date:Ljava/lang/Class;

    :goto_188
    new-instance v1, Lorg/apache/commons/beanutils/converters/SqlDateConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/SqlDateConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 756
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Time:Ljava/lang/Class;

    if-nez v0, :cond_20d

    const-string v0, "java.sql.Time"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Time:Ljava/lang/Class;

    :goto_19c
    new-instance v1, Lorg/apache/commons/beanutils/converters/SqlTimeConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/SqlTimeConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 757
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Timestamp:Ljava/lang/Class;

    if-nez v0, :cond_210

    const-string v0, "java.sql.Timestamp"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Timestamp:Ljava/lang/Class;

    :goto_1b0
    new-instance v1, Lorg/apache/commons/beanutils/converters/SqlTimestampConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/SqlTimestampConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 758
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$net$URL:Ljava/lang/Class;

    if-nez v0, :cond_213

    const-string v0, "java.net.URL"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$net$URL:Ljava/lang/Class;

    :goto_1c4
    new-instance v1, Lorg/apache/commons/beanutils/converters/URLConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/URLConverter;-><init>()V

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrayConverter(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;ZI)V

    .line 760
    return-void

    .line 738
    :cond_1cd
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    goto/16 :goto_5c

    .line 739
    :cond_1d1
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    goto/16 :goto_70

    .line 740
    :cond_1d5
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Boolean:Ljava/lang/Class;

    goto/16 :goto_84

    .line 741
    :cond_1d9
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    goto/16 :goto_98

    .line 742
    :cond_1dd
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Character:Ljava/lang/Class;

    goto/16 :goto_ac

    .line 743
    :cond_1e1
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    goto/16 :goto_c0

    .line 744
    :cond_1e5
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    goto/16 :goto_d4

    .line 745
    :cond_1e9
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    goto/16 :goto_e8

    .line 746
    :cond_1ed
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    goto/16 :goto_fc

    .line 747
    :cond_1f1
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    goto/16 :goto_110

    .line 748
    :cond_1f5
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto/16 :goto_124

    .line 751
    :cond_1f9
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Class:Ljava/lang/Class;

    goto/16 :goto_138

    .line 752
    :cond_1fd
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Date:Ljava/lang/Class;

    goto/16 :goto_14c

    .line 753
    :cond_201
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Calendar:Ljava/lang/Class;

    goto/16 :goto_160

    .line 754
    :cond_205
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$io$File:Ljava/lang/Class;

    goto/16 :goto_174

    .line 755
    :cond_209
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Date:Ljava/lang/Class;

    goto/16 :goto_188

    .line 756
    :cond_20d
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Time:Ljava/lang/Class;

    goto :goto_19c

    .line 757
    :cond_210
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Timestamp:Ljava/lang/Class;

    goto :goto_1b0

    .line 758
    :cond_213
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$net$URL:Ljava/lang/Class;

    goto :goto_1c4
.end method

.method private registerOther(Z)V
    .registers 5
    .param p1, "throwException"    # Z

    .prologue
    const/4 v2, 0x0

    .line 704
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Class:Ljava/lang/Class;

    if-nez v0, :cond_ba

    const-string v0, "java.lang.Class"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Class:Ljava/lang/Class;

    move-object v1, v0

    :goto_e
    if-eqz p1, :cond_bf

    new-instance v0, Lorg/apache/commons/beanutils/converters/ClassConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/ClassConverter;-><init>()V

    :goto_15
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 705
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Date:Ljava/lang/Class;

    if-nez v0, :cond_c6

    const-string v0, "java.util.Date"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Date:Ljava/lang/Class;

    move-object v1, v0

    :goto_25
    if-eqz p1, :cond_cb

    new-instance v0, Lorg/apache/commons/beanutils/converters/DateConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/DateConverter;-><init>()V

    :goto_2c
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 706
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Calendar:Ljava/lang/Class;

    if-nez v0, :cond_d2

    const-string v0, "java.util.Calendar"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Calendar:Ljava/lang/Class;

    move-object v1, v0

    :goto_3c
    if-eqz p1, :cond_d7

    new-instance v0, Lorg/apache/commons/beanutils/converters/CalendarConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/CalendarConverter;-><init>()V

    :goto_43
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 707
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$io$File:Ljava/lang/Class;

    if-nez v0, :cond_de

    const-string v0, "java.io.File"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$io$File:Ljava/lang/Class;

    move-object v1, v0

    :goto_53
    if-eqz p1, :cond_e3

    new-instance v0, Lorg/apache/commons/beanutils/converters/FileConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/FileConverter;-><init>()V

    :goto_5a
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 708
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Date:Ljava/lang/Class;

    if-nez v0, :cond_ea

    const-string v0, "java.sql.Date"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Date:Ljava/lang/Class;

    move-object v1, v0

    :goto_6a
    if-eqz p1, :cond_ef

    new-instance v0, Lorg/apache/commons/beanutils/converters/SqlDateConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/SqlDateConverter;-><init>()V

    :goto_71
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 709
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Time:Ljava/lang/Class;

    if-nez v0, :cond_f6

    const-string v0, "java.sql.Time"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Time:Ljava/lang/Class;

    move-object v1, v0

    :goto_81
    if-eqz p1, :cond_fa

    new-instance v0, Lorg/apache/commons/beanutils/converters/SqlTimeConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/SqlTimeConverter;-><init>()V

    :goto_88
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 710
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Timestamp:Ljava/lang/Class;

    if-nez v0, :cond_100

    const-string v0, "java.sql.Timestamp"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Timestamp:Ljava/lang/Class;

    move-object v1, v0

    :goto_98
    if-eqz p1, :cond_104

    new-instance v0, Lorg/apache/commons/beanutils/converters/SqlTimestampConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/SqlTimestampConverter;-><init>()V

    :goto_9f
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 711
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$net$URL:Ljava/lang/Class;

    if-nez v0, :cond_10a

    const-string v0, "java.net.URL"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$net$URL:Ljava/lang/Class;

    move-object v1, v0

    :goto_af
    if-eqz p1, :cond_10e

    new-instance v0, Lorg/apache/commons/beanutils/converters/URLConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/URLConverter;-><init>()V

    :goto_b6
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 712
    return-void

    .line 704
    :cond_ba
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Class:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_e

    :cond_bf
    new-instance v0, Lorg/apache/commons/beanutils/converters/ClassConverter;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/ClassConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_15

    .line 705
    :cond_c6
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Date:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_25

    :cond_cb
    new-instance v0, Lorg/apache/commons/beanutils/converters/DateConverter;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/DateConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_2c

    .line 706
    :cond_d2
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Calendar:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_3c

    :cond_d7
    new-instance v0, Lorg/apache/commons/beanutils/converters/CalendarConverter;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/CalendarConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_43

    .line 707
    :cond_de
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$io$File:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_53

    :cond_e3
    new-instance v0, Lorg/apache/commons/beanutils/converters/FileConverter;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/FileConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_5a

    .line 708
    :cond_ea
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Date:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_6a

    :cond_ef
    new-instance v0, Lorg/apache/commons/beanutils/converters/SqlDateConverter;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/SqlDateConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_71

    .line 709
    :cond_f6
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Time:Ljava/lang/Class;

    move-object v1, v0

    goto :goto_81

    :cond_fa
    new-instance v0, Lorg/apache/commons/beanutils/converters/SqlTimeConverter;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/SqlTimeConverter;-><init>(Ljava/lang/Object;)V

    goto :goto_88

    .line 710
    :cond_100
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$sql$Timestamp:Ljava/lang/Class;

    move-object v1, v0

    goto :goto_98

    :cond_104
    new-instance v0, Lorg/apache/commons/beanutils/converters/SqlTimestampConverter;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/SqlTimestampConverter;-><init>(Ljava/lang/Object;)V

    goto :goto_9f

    .line 711
    :cond_10a
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$net$URL:Ljava/lang/Class;

    move-object v1, v0

    goto :goto_af

    :cond_10e
    new-instance v0, Lorg/apache/commons/beanutils/converters/URLConverter;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/URLConverter;-><init>(Ljava/lang/Object;)V

    goto :goto_b6
.end method

.method private registerPrimitives(Z)V
    .registers 5
    .param p1, "throwException"    # Z

    .prologue
    .line 627
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eqz p1, :cond_61

    new-instance v0, Lorg/apache/commons/beanutils/converters/BooleanConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/BooleanConverter;-><init>()V

    :goto_9
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 628
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eqz p1, :cond_69

    new-instance v0, Lorg/apache/commons/beanutils/converters/ByteConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/ByteConverter;-><init>()V

    :goto_15
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 629
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-eqz p1, :cond_71

    new-instance v0, Lorg/apache/commons/beanutils/converters/CharacterConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/CharacterConverter;-><init>()V

    :goto_21
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 630
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eqz p1, :cond_79

    new-instance v0, Lorg/apache/commons/beanutils/converters/DoubleConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/DoubleConverter;-><init>()V

    :goto_2d
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 631
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eqz p1, :cond_81

    new-instance v0, Lorg/apache/commons/beanutils/converters/FloatConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/FloatConverter;-><init>()V

    :goto_39
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 632
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eqz p1, :cond_89

    new-instance v0, Lorg/apache/commons/beanutils/converters/IntegerConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/IntegerConverter;-><init>()V

    :goto_45
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 633
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eqz p1, :cond_91

    new-instance v0, Lorg/apache/commons/beanutils/converters/LongConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/LongConverter;-><init>()V

    :goto_51
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 634
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eqz p1, :cond_99

    new-instance v0, Lorg/apache/commons/beanutils/converters/ShortConverter;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/converters/ShortConverter;-><init>()V

    :goto_5d
    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 635
    return-void

    .line 627
    :cond_61
    new-instance v0, Lorg/apache/commons/beanutils/converters/BooleanConverter;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/BooleanConverter;-><init>(Ljava/lang/Object;)V

    goto :goto_9

    .line 628
    :cond_69
    new-instance v0, Lorg/apache/commons/beanutils/converters/ByteConverter;

    sget-object v2, Lorg/apache/commons/beanutils/ConvertUtilsBean;->ZERO:Ljava/lang/Integer;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/ByteConverter;-><init>(Ljava/lang/Object;)V

    goto :goto_15

    .line 629
    :cond_71
    new-instance v0, Lorg/apache/commons/beanutils/converters/CharacterConverter;

    sget-object v2, Lorg/apache/commons/beanutils/ConvertUtilsBean;->SPACE:Ljava/lang/Character;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/CharacterConverter;-><init>(Ljava/lang/Object;)V

    goto :goto_21

    .line 630
    :cond_79
    new-instance v0, Lorg/apache/commons/beanutils/converters/DoubleConverter;

    sget-object v2, Lorg/apache/commons/beanutils/ConvertUtilsBean;->ZERO:Ljava/lang/Integer;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/DoubleConverter;-><init>(Ljava/lang/Object;)V

    goto :goto_2d

    .line 631
    :cond_81
    new-instance v0, Lorg/apache/commons/beanutils/converters/FloatConverter;

    sget-object v2, Lorg/apache/commons/beanutils/ConvertUtilsBean;->ZERO:Ljava/lang/Integer;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/FloatConverter;-><init>(Ljava/lang/Object;)V

    goto :goto_39

    .line 632
    :cond_89
    new-instance v0, Lorg/apache/commons/beanutils/converters/IntegerConverter;

    sget-object v2, Lorg/apache/commons/beanutils/ConvertUtilsBean;->ZERO:Ljava/lang/Integer;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/IntegerConverter;-><init>(Ljava/lang/Object;)V

    goto :goto_45

    .line 633
    :cond_91
    new-instance v0, Lorg/apache/commons/beanutils/converters/LongConverter;

    sget-object v2, Lorg/apache/commons/beanutils/ConvertUtilsBean;->ZERO:Ljava/lang/Integer;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/LongConverter;-><init>(Ljava/lang/Object;)V

    goto :goto_51

    .line 634
    :cond_99
    new-instance v0, Lorg/apache/commons/beanutils/converters/ShortConverter;

    sget-object v2, Lorg/apache/commons/beanutils/ConvertUtilsBean;->ZERO:Ljava/lang/Integer;

    invoke-direct {v0, v2}, Lorg/apache/commons/beanutils/converters/ShortConverter;-><init>(Ljava/lang/Object;)V

    goto :goto_5d
.end method

.method private registerStandard(ZZ)V
    .registers 11
    .param p1, "throwException"    # Z
    .param p2, "defaultNull"    # Z

    .prologue
    const/4 v5, 0x0

    .line 664
    if-eqz p2, :cond_110

    move-object v4, v5

    .line 665
    .local v4, "defaultNumber":Ljava/lang/Number;
    :goto_4
    if-eqz p2, :cond_114

    move-object v0, v5

    .line 666
    .local v0, "bigDecDeflt":Ljava/math/BigDecimal;
    :goto_7
    if-eqz p2, :cond_11d

    move-object v1, v5

    .line 667
    .local v1, "bigIntDeflt":Ljava/math/BigInteger;
    :goto_a
    if-eqz p2, :cond_126

    move-object v2, v5

    .line 668
    .local v2, "booleanDefault":Ljava/lang/Boolean;
    :goto_d
    if-eqz p2, :cond_12a

    move-object v3, v5

    .line 669
    .local v3, "charDefault":Ljava/lang/Character;
    :goto_10
    if-eqz p2, :cond_12e

    .line 671
    .local v5, "stringDefault":Ljava/lang/String;
    :goto_12
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    if-nez v6, :cond_132

    const-string v6, "java.math.BigDecimal"

    invoke-static {v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    move-object v7, v6

    :goto_1f
    if-eqz p1, :cond_137

    new-instance v6, Lorg/apache/commons/beanutils/converters/BigDecimalConverter;

    invoke-direct {v6}, Lorg/apache/commons/beanutils/converters/BigDecimalConverter;-><init>()V

    :goto_26
    invoke-direct {p0, v7, v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 672
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    if-nez v6, :cond_13e

    const-string v6, "java.math.BigInteger"

    invoke-static {v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    move-object v7, v6

    :goto_36
    if-eqz p1, :cond_143

    new-instance v6, Lorg/apache/commons/beanutils/converters/BigIntegerConverter;

    invoke-direct {v6}, Lorg/apache/commons/beanutils/converters/BigIntegerConverter;-><init>()V

    :goto_3d
    invoke-direct {p0, v7, v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 673
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v6, :cond_14a

    const-string v6, "java.lang.Boolean"

    invoke-static {v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Boolean:Ljava/lang/Class;

    move-object v7, v6

    :goto_4d
    if-eqz p1, :cond_14f

    new-instance v6, Lorg/apache/commons/beanutils/converters/BooleanConverter;

    invoke-direct {v6}, Lorg/apache/commons/beanutils/converters/BooleanConverter;-><init>()V

    :goto_54
    invoke-direct {p0, v7, v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 674
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v6, :cond_156

    const-string v6, "java.lang.Byte"

    invoke-static {v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    move-object v7, v6

    :goto_64
    if-eqz p1, :cond_15b

    new-instance v6, Lorg/apache/commons/beanutils/converters/ByteConverter;

    invoke-direct {v6}, Lorg/apache/commons/beanutils/converters/ByteConverter;-><init>()V

    :goto_6b
    invoke-direct {p0, v7, v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 675
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v6, :cond_162

    const-string v6, "java.lang.Character"

    invoke-static {v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Character:Ljava/lang/Class;

    move-object v7, v6

    :goto_7b
    if-eqz p1, :cond_167

    new-instance v6, Lorg/apache/commons/beanutils/converters/CharacterConverter;

    invoke-direct {v6}, Lorg/apache/commons/beanutils/converters/CharacterConverter;-><init>()V

    :goto_82
    invoke-direct {p0, v7, v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 676
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v6, :cond_16e

    const-string v6, "java.lang.Double"

    invoke-static {v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    move-object v7, v6

    :goto_92
    if-eqz p1, :cond_173

    new-instance v6, Lorg/apache/commons/beanutils/converters/DoubleConverter;

    invoke-direct {v6}, Lorg/apache/commons/beanutils/converters/DoubleConverter;-><init>()V

    :goto_99
    invoke-direct {p0, v7, v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 677
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v6, :cond_17a

    const-string v6, "java.lang.Float"

    invoke-static {v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    move-object v7, v6

    :goto_a9
    if-eqz p1, :cond_17f

    new-instance v6, Lorg/apache/commons/beanutils/converters/FloatConverter;

    invoke-direct {v6}, Lorg/apache/commons/beanutils/converters/FloatConverter;-><init>()V

    :goto_b0
    invoke-direct {p0, v7, v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 678
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v6, :cond_186

    const-string v6, "java.lang.Integer"

    invoke-static {v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    move-object v7, v6

    :goto_c0
    if-eqz p1, :cond_18b

    new-instance v6, Lorg/apache/commons/beanutils/converters/IntegerConverter;

    invoke-direct {v6}, Lorg/apache/commons/beanutils/converters/IntegerConverter;-><init>()V

    :goto_c7
    invoke-direct {p0, v7, v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 679
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v6, :cond_192

    const-string v6, "java.lang.Long"

    invoke-static {v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    move-object v7, v6

    :goto_d7
    if-eqz p1, :cond_197

    new-instance v6, Lorg/apache/commons/beanutils/converters/LongConverter;

    invoke-direct {v6}, Lorg/apache/commons/beanutils/converters/LongConverter;-><init>()V

    :goto_de
    invoke-direct {p0, v7, v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 680
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v6, :cond_19e

    const-string v6, "java.lang.Short"

    invoke-static {v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    move-object v7, v6

    :goto_ee
    if-eqz p1, :cond_1a3

    new-instance v6, Lorg/apache/commons/beanutils/converters/ShortConverter;

    invoke-direct {v6}, Lorg/apache/commons/beanutils/converters/ShortConverter;-><init>()V

    :goto_f5
    invoke-direct {p0, v7, v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 681
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v6, :cond_1aa

    const-string v6, "java.lang.String"

    invoke-static {v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    move-object v7, v6

    :goto_105
    if-eqz p1, :cond_1af

    new-instance v6, Lorg/apache/commons/beanutils/converters/StringConverter;

    invoke-direct {v6}, Lorg/apache/commons/beanutils/converters/StringConverter;-><init>()V

    :goto_10c
    invoke-direct {p0, v7, v6}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 683
    return-void

    .line 664
    .end local v0    # "bigDecDeflt":Ljava/math/BigDecimal;
    .end local v1    # "bigIntDeflt":Ljava/math/BigInteger;
    .end local v2    # "booleanDefault":Ljava/lang/Boolean;
    .end local v3    # "charDefault":Ljava/lang/Character;
    .end local v4    # "defaultNumber":Ljava/lang/Number;
    .end local v5    # "stringDefault":Ljava/lang/String;
    :cond_110
    sget-object v4, Lorg/apache/commons/beanutils/ConvertUtilsBean;->ZERO:Ljava/lang/Integer;

    goto/16 :goto_4

    .line 665
    .restart local v4    # "defaultNumber":Ljava/lang/Number;
    :cond_114
    new-instance v0, Ljava/math/BigDecimal;

    const-string v6, "0.0"

    invoke-direct {v0, v6}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 666
    .restart local v0    # "bigDecDeflt":Ljava/math/BigDecimal;
    :cond_11d
    new-instance v1, Ljava/math/BigInteger;

    const-string v6, "0"

    invoke-direct {v1, v6}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    goto/16 :goto_a

    .line 667
    .restart local v1    # "bigIntDeflt":Ljava/math/BigInteger;
    :cond_126
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_d

    .line 668
    .restart local v2    # "booleanDefault":Ljava/lang/Boolean;
    :cond_12a
    sget-object v3, Lorg/apache/commons/beanutils/ConvertUtilsBean;->SPACE:Ljava/lang/Character;

    goto/16 :goto_10

    .line 669
    .restart local v3    # "charDefault":Ljava/lang/Character;
    :cond_12e
    const-string v5, ""

    goto/16 :goto_12

    .line 671
    .restart local v5    # "stringDefault":Ljava/lang/String;
    :cond_132
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    move-object v7, v6

    goto/16 :goto_1f

    :cond_137
    new-instance v6, Lorg/apache/commons/beanutils/converters/BigDecimalConverter;

    invoke-direct {v6, v0}, Lorg/apache/commons/beanutils/converters/BigDecimalConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_26

    .line 672
    :cond_13e
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    move-object v7, v6

    goto/16 :goto_36

    :cond_143
    new-instance v6, Lorg/apache/commons/beanutils/converters/BigIntegerConverter;

    invoke-direct {v6, v1}, Lorg/apache/commons/beanutils/converters/BigIntegerConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_3d

    .line 673
    :cond_14a
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Boolean:Ljava/lang/Class;

    move-object v7, v6

    goto/16 :goto_4d

    :cond_14f
    new-instance v6, Lorg/apache/commons/beanutils/converters/BooleanConverter;

    invoke-direct {v6, v2}, Lorg/apache/commons/beanutils/converters/BooleanConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_54

    .line 674
    :cond_156
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    move-object v7, v6

    goto/16 :goto_64

    :cond_15b
    new-instance v6, Lorg/apache/commons/beanutils/converters/ByteConverter;

    invoke-direct {v6, v4}, Lorg/apache/commons/beanutils/converters/ByteConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_6b

    .line 675
    :cond_162
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Character:Ljava/lang/Class;

    move-object v7, v6

    goto/16 :goto_7b

    :cond_167
    new-instance v6, Lorg/apache/commons/beanutils/converters/CharacterConverter;

    invoke-direct {v6, v3}, Lorg/apache/commons/beanutils/converters/CharacterConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_82

    .line 676
    :cond_16e
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    move-object v7, v6

    goto/16 :goto_92

    :cond_173
    new-instance v6, Lorg/apache/commons/beanutils/converters/DoubleConverter;

    invoke-direct {v6, v4}, Lorg/apache/commons/beanutils/converters/DoubleConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_99

    .line 677
    :cond_17a
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    move-object v7, v6

    goto/16 :goto_a9

    :cond_17f
    new-instance v6, Lorg/apache/commons/beanutils/converters/FloatConverter;

    invoke-direct {v6, v4}, Lorg/apache/commons/beanutils/converters/FloatConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_b0

    .line 678
    :cond_186
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    move-object v7, v6

    goto/16 :goto_c0

    :cond_18b
    new-instance v6, Lorg/apache/commons/beanutils/converters/IntegerConverter;

    invoke-direct {v6, v4}, Lorg/apache/commons/beanutils/converters/IntegerConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_c7

    .line 679
    :cond_192
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    move-object v7, v6

    goto/16 :goto_d7

    :cond_197
    new-instance v6, Lorg/apache/commons/beanutils/converters/LongConverter;

    invoke-direct {v6, v4}, Lorg/apache/commons/beanutils/converters/LongConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_de

    .line 680
    :cond_19e
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    move-object v7, v6

    goto/16 :goto_ee

    :cond_1a3
    new-instance v6, Lorg/apache/commons/beanutils/converters/ShortConverter;

    invoke-direct {v6, v4}, Lorg/apache/commons/beanutils/converters/ShortConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_f5

    .line 681
    :cond_1aa
    sget-object v6, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    move-object v7, v6

    goto/16 :goto_105

    :cond_1af
    new-instance v6, Lorg/apache/commons/beanutils/converters/StringConverter;

    invoke-direct {v6, v5}, Lorg/apache/commons/beanutils/converters/StringConverter;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_10c
.end method


# virtual methods
.method public convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 9
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "targetType"    # Ljava/lang/Class;

    .prologue
    .line 526
    if-nez p1, :cond_bb

    const/4 v2, 0x0

    .line 528
    .local v2, "sourceType":Ljava/lang/Class;
    :goto_3
    iget-object v3, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_2f

    .line 529
    if-nez p1, :cond_c1

    .line 530
    iget-object v3, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Convert null value to type \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 538
    :cond_2f
    :goto_2f
    move-object v0, p1

    .line 539
    .local v0, "converted":Ljava/lang/Object;
    invoke-virtual {p0, v2, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v1

    .line 540
    .local v1, "converter":Lorg/apache/commons/beanutils/Converter;
    if-eqz v1, :cond_5a

    .line 541
    iget-object v3, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v3

    if-eqz v3, :cond_56

    .line 542
    iget-object v3, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "  Using converter "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 544
    :cond_56
    invoke-interface {v1, p2, p1}, Lorg/apache/commons/beanutils/Converter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 546
    :cond_5a
    sget-object v3, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v3, :cond_fd

    const-string v3, "java.lang.String"

    invoke-static {v3}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_66
    if-ne p2, v3, :cond_ba

    if-eqz v0, :cond_ba

    instance-of v3, v0, Ljava/lang/String;

    if-nez v3, :cond_ba

    .line 552
    sget-object v3, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v3, :cond_101

    const-string v3, "java.lang.String"

    invoke-static {v3}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_7a
    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v1

    .line 553
    if-eqz v1, :cond_b0

    .line 554
    iget-object v3, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v3

    if-eqz v3, :cond_a0

    .line 555
    iget-object v3, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "  Using converter "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 557
    :cond_a0
    sget-object v3, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v3, :cond_105

    const-string v3, "java.lang.String"

    invoke-static {v3}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_ac
    invoke-interface {v1, v3, v0}, Lorg/apache/commons/beanutils/Converter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 561
    :cond_b0
    if-eqz v0, :cond_ba

    instance-of v3, v0, Ljava/lang/String;

    if-nez v3, :cond_ba

    .line 562
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 566
    .end local v0    # "converted":Ljava/lang/Object;
    :cond_ba
    return-object v0

    .line 526
    .end local v1    # "converter":Lorg/apache/commons/beanutils/Converter;
    .end local v2    # "sourceType":Ljava/lang/Class;
    :cond_bb
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    goto/16 :goto_3

    .line 533
    .restart local v2    # "sourceType":Ljava/lang/Class;
    :cond_c1
    iget-object v3, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Convert type \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' value \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' to type \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_2f

    .line 546
    .restart local v0    # "converted":Ljava/lang/Object;
    .restart local v1    # "converter":Lorg/apache/commons/beanutils/Converter;
    :cond_fd
    sget-object v3, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto/16 :goto_66

    .line 552
    :cond_101
    sget-object v3, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto/16 :goto_7a

    .line 557
    :cond_105
    sget-object v3, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_ac
.end method

.method public convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 7
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 459
    iget-object v1, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_34

    .line 460
    iget-object v1, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Convert string \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' to class \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 463
    :cond_34
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    .line 464
    .local v0, "converter":Lorg/apache/commons/beanutils/Converter;
    if-nez v0, :cond_4a

    .line 465
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_6f

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_46
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    .line 467
    :cond_4a
    iget-object v1, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_6a

    .line 468
    iget-object v1, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "  Using converter "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 470
    :cond_6a
    invoke-interface {v0, p2, p1}, Lorg/apache/commons/beanutils/Converter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 465
    :cond_6f
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_46
.end method

.method public convert([Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 10
    .param p1, "values"    # [Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 490
    move-object v3, p2

    .line 491
    .local v3, "type":Ljava/lang/Class;
    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 492
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    .line 494
    :cond_b
    iget-object v4, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_40

    .line 495
    iget-object v4, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Convert String["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    array-length v6, p1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "] to class \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "[]\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 498
    :cond_40
    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v1

    .line 499
    .local v1, "converter":Lorg/apache/commons/beanutils/Converter;
    if-nez v1, :cond_56

    .line 500
    sget-object v4, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v4, :cond_8b

    const-string v4, "java.lang.String"

    invoke-static {v4}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_52
    invoke-virtual {p0, v4}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v1

    .line 502
    :cond_56
    iget-object v4, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v4

    if-eqz v4, :cond_76

    .line 503
    iget-object v4, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "  Using converter "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 505
    :cond_76
    array-length v4, p1

    invoke-static {v3, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 506
    .local v0, "array":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7c
    array-length v4, p1

    if-ge v2, v4, :cond_8e

    .line 507
    aget-object v4, p1, v2

    invoke-interface {v1, v3, v4}, Lorg/apache/commons/beanutils/Converter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v0, v2, v4}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 506
    add-int/lit8 v2, v2, 0x1

    goto :goto_7c

    .line 500
    .end local v0    # "array":Ljava/lang/Object;
    .end local v2    # "i":I
    :cond_8b
    sget-object v4, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_52

    .line 509
    .restart local v0    # "array":Ljava/lang/Object;
    .restart local v2    # "i":I
    :cond_8e
    return-object v0
.end method

.method public convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 426
    if-nez p1, :cond_4

    .line 441
    :cond_3
    :goto_3
    return-object v1

    .line 428
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_45

    .line 429
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, 0x1

    if-lt v2, v3, :cond_3

    .line 432
    const/4 v2, 0x0

    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p1

    .line 433
    if-eqz p1, :cond_3

    .line 436
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_3f

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_28
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    .line 437
    .local v0, "converter":Lorg/apache/commons/beanutils/Converter;
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_42

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_38
    invoke-interface {v0, v1, p1}, Lorg/apache/commons/beanutils/Converter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_3

    .line 436
    .end local v0    # "converter":Lorg/apache/commons/beanutils/Converter;
    :cond_3f
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_28

    .line 437
    .restart local v0    # "converter":Lorg/apache/commons/beanutils/Converter;
    :cond_42
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_38

    .line 440
    .end local v0    # "converter":Lorg/apache/commons/beanutils/Converter;
    :cond_45
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_68

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_51
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    .line 441
    .restart local v0    # "converter":Lorg/apache/commons/beanutils/Converter;
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_6b

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_61
    invoke-interface {v0, v1, p1}, Lorg/apache/commons/beanutils/Converter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_3

    .line 440
    .end local v0    # "converter":Lorg/apache/commons/beanutils/Converter;
    :cond_68
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_51

    .line 441
    .restart local v0    # "converter":Lorg/apache/commons/beanutils/Converter;
    :cond_6b
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_61
.end method

.method public deregister()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 576
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->converters:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->clear()V

    .line 578
    invoke-direct {p0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerPrimitives(Z)V

    .line 579
    invoke-direct {p0, v1, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerStandard(ZZ)V

    .line 580
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerOther(Z)V

    .line 581
    invoke-direct {p0, v1, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrays(ZI)V

    .line 582
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    if-nez v0, :cond_3c

    const-string v0, "java.math.BigDecimal"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    :goto_1f
    new-instance v1, Lorg/apache/commons/beanutils/converters/BigDecimalConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/BigDecimalConverter;-><init>()V

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 583
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    if-nez v0, :cond_3f

    const-string v0, "java.math.BigInteger"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    :goto_33
    new-instance v1, Lorg/apache/commons/beanutils/converters/BigIntegerConverter;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/converters/BigIntegerConverter;-><init>()V

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Ljava/lang/Class;Lorg/apache/commons/beanutils/Converter;)V

    .line 584
    return-void

    .line 582
    :cond_3c
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigDecimal:Ljava/lang/Class;

    goto :goto_1f

    .line 583
    :cond_3f
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$math$BigInteger:Ljava/lang/Class;

    goto :goto_33
.end method

.method public deregister(Ljava/lang/Class;)V
    .registers 3
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 797
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->converters:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {v0, p1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 799
    return-void
.end method

.method public getDefaultBoolean()Z
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultBoolean:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public getDefaultByte()B
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultByte:Ljava/lang/Byte;

    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v0

    return v0
.end method

.method public getDefaultCharacter()C
    .registers 2

    .prologue
    .line 244
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultCharacter:Ljava/lang/Character;

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    return v0
.end method

.method public getDefaultDouble()D
    .registers 3

    .prologue
    .line 276
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultDouble:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public getDefaultFloat()F
    .registers 2

    .prologue
    .line 306
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultFloat:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0
.end method

.method public getDefaultInteger()I
    .registers 2

    .prologue
    .line 336
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultInteger:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getDefaultLong()J
    .registers 3

    .prologue
    .line 366
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultLong:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDefaultShort()S
    .registers 2

    .prologue
    .line 396
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultShort:Ljava/lang/Short;

    invoke-virtual {v0}, Ljava/lang/Short;->shortValue()S

    move-result v0

    return v0
.end method

.method public lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;
    .registers 3
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 812
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->converters:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {v0, p1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/beanutils/Converter;

    return-object v0
.end method

.method public lookup(Ljava/lang/Class;Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;
    .registers 6
    .param p1, "sourceType"    # Ljava/lang/Class;
    .param p2, "targetType"    # Ljava/lang/Class;

    .prologue
    .line 827
    if-nez p2, :cond_a

    .line 828
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Target type is missing"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 830
    :cond_a
    if-nez p1, :cond_11

    .line 831
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    .line 859
    :cond_10
    :goto_10
    return-object v0

    .line 834
    :cond_11
    const/4 v0, 0x0

    .line 836
    .local v0, "converter":Lorg/apache/commons/beanutils/Converter;
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_61

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_1e
    if-ne p2, v1, :cond_6d

    .line 837
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    .line 838
    if-nez v0, :cond_4e

    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-nez v1, :cond_3e

    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Collection:Ljava/lang/Class;

    if-nez v1, :cond_64

    const-string v1, "java.util.Collection"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Collection:Ljava/lang/Class;

    :goto_38
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_4e

    .line 840
    :cond_3e
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->array$Ljava$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_67

    const-string v1, "[Ljava.lang.String;"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->array$Ljava$lang$String:Ljava/lang/Class;

    :goto_4a
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    .line 842
    :cond_4e
    if-nez v0, :cond_10

    .line 843
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_6a

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_5c
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    goto :goto_10

    .line 836
    :cond_61
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_1e

    .line 838
    :cond_64
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Collection:Ljava/lang/Class;

    goto :goto_38

    .line 840
    :cond_67
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->array$Ljava$lang$String:Ljava/lang/Class;

    goto :goto_4a

    .line 843
    :cond_6a
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_5c

    .line 849
    :cond_6d
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->array$Ljava$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_ab

    const-string v1, "[Ljava.lang.String;"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->array$Ljava$lang$String:Ljava/lang/Class;

    :goto_79
    if-ne p2, v1, :cond_b4

    .line 850
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-nez v1, :cond_93

    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Collection:Ljava/lang/Class;

    if-nez v1, :cond_ae

    const-string v1, "java.util.Collection"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Collection:Ljava/lang/Class;

    :goto_8d
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_97

    .line 851
    :cond_93
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    .line 853
    :cond_97
    if-nez v0, :cond_10

    .line 854
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->array$Ljava$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_b1

    const-string v1, "[Ljava.lang.String;"

    invoke-static {v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->array$Ljava$lang$String:Ljava/lang/Class;

    :goto_a5
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    goto/16 :goto_10

    .line 849
    :cond_ab
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->array$Ljava$lang$String:Ljava/lang/Class;

    goto :goto_79

    .line 850
    :cond_ae
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$util$Collection:Ljava/lang/Class;

    goto :goto_8d

    .line 854
    :cond_b1
    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->array$Ljava$lang$String:Ljava/lang/Class;

    goto :goto_a5

    .line 859
    :cond_b4
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    goto/16 :goto_10
.end method

.method public register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V
    .registers 4
    .param p1, "converter"    # Lorg/apache/commons/beanutils/Converter;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 873
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->converters:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {v0, p2, p1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 875
    return-void
.end method

.method public register(ZZI)V
    .registers 4
    .param p1, "throwException"    # Z
    .param p2, "defaultNull"    # Z
    .param p3, "defaultArraySize"    # I

    .prologue
    .line 602
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerPrimitives(Z)V

    .line 603
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerStandard(ZZ)V

    .line 604
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerOther(Z)V

    .line 605
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->registerArrays(ZI)V

    .line 606
    return-void
.end method

.method public setDefaultBoolean(Z)V
    .registers 4
    .param p1, "newDefaultBoolean"    # Z

    .prologue
    .line 194
    if-eqz p1, :cond_29

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_4
    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultBoolean:Ljava/lang/Boolean;

    .line 195
    new-instance v0, Lorg/apache/commons/beanutils/converters/BooleanConverter;

    iget-object v1, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultBoolean:Ljava/lang/Boolean;

    invoke-direct {v0, v1}, Lorg/apache/commons/beanutils/converters/BooleanConverter;-><init>(Ljava/lang/Object;)V

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 196
    new-instance v1, Lorg/apache/commons/beanutils/converters/BooleanConverter;

    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultBoolean:Ljava/lang/Boolean;

    invoke-direct {v1, v0}, Lorg/apache/commons/beanutils/converters/BooleanConverter;-><init>(Ljava/lang/Object;)V

    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v0, :cond_2c

    const-string v0, "java.lang.Boolean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_25
    invoke-virtual {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 197
    return-void

    .line 194
    :cond_29
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_4

    .line 196
    :cond_2c
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_25
.end method

.method public setDefaultByte(B)V
    .registers 4
    .param p1, "newDefaultByte"    # B

    .prologue
    .line 224
    new-instance v0, Ljava/lang/Byte;

    invoke-direct {v0, p1}, Ljava/lang/Byte;-><init>(B)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultByte:Ljava/lang/Byte;

    .line 225
    new-instance v0, Lorg/apache/commons/beanutils/converters/ByteConverter;

    iget-object v1, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultByte:Ljava/lang/Byte;

    invoke-direct {v0, v1}, Lorg/apache/commons/beanutils/converters/ByteConverter;-><init>(Ljava/lang/Object;)V

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 226
    new-instance v1, Lorg/apache/commons/beanutils/converters/ByteConverter;

    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultByte:Ljava/lang/Byte;

    invoke-direct {v1, v0}, Lorg/apache/commons/beanutils/converters/ByteConverter;-><init>(Ljava/lang/Object;)V

    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v0, :cond_2a

    const-string v0, "java.lang.Byte"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_26
    invoke-virtual {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 227
    return-void

    .line 226
    :cond_2a
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_26
.end method

.method public setDefaultCharacter(C)V
    .registers 4
    .param p1, "newDefaultCharacter"    # C

    .prologue
    .line 254
    new-instance v0, Ljava/lang/Character;

    invoke-direct {v0, p1}, Ljava/lang/Character;-><init>(C)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultCharacter:Ljava/lang/Character;

    .line 255
    new-instance v0, Lorg/apache/commons/beanutils/converters/CharacterConverter;

    iget-object v1, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultCharacter:Ljava/lang/Character;

    invoke-direct {v0, v1}, Lorg/apache/commons/beanutils/converters/CharacterConverter;-><init>(Ljava/lang/Object;)V

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 257
    new-instance v1, Lorg/apache/commons/beanutils/converters/CharacterConverter;

    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultCharacter:Ljava/lang/Character;

    invoke-direct {v1, v0}, Lorg/apache/commons/beanutils/converters/CharacterConverter;-><init>(Ljava/lang/Object;)V

    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v0, :cond_2a

    const-string v0, "java.lang.Character"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Character:Ljava/lang/Class;

    :goto_26
    invoke-virtual {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 259
    return-void

    .line 257
    :cond_2a
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Character:Ljava/lang/Class;

    goto :goto_26
.end method

.method public setDefaultDouble(D)V
    .registers 5
    .param p1, "newDefaultDouble"    # D

    .prologue
    .line 286
    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p1, p2}, Ljava/lang/Double;-><init>(D)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultDouble:Ljava/lang/Double;

    .line 287
    new-instance v0, Lorg/apache/commons/beanutils/converters/DoubleConverter;

    iget-object v1, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultDouble:Ljava/lang/Double;

    invoke-direct {v0, v1}, Lorg/apache/commons/beanutils/converters/DoubleConverter;-><init>(Ljava/lang/Object;)V

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 288
    new-instance v1, Lorg/apache/commons/beanutils/converters/DoubleConverter;

    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultDouble:Ljava/lang/Double;

    invoke-direct {v1, v0}, Lorg/apache/commons/beanutils/converters/DoubleConverter;-><init>(Ljava/lang/Object;)V

    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v0, :cond_2a

    const-string v0, "java.lang.Double"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    :goto_26
    invoke-virtual {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 289
    return-void

    .line 288
    :cond_2a
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_26
.end method

.method public setDefaultFloat(F)V
    .registers 4
    .param p1, "newDefaultFloat"    # F

    .prologue
    .line 316
    new-instance v0, Ljava/lang/Float;

    invoke-direct {v0, p1}, Ljava/lang/Float;-><init>(F)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultFloat:Ljava/lang/Float;

    .line 317
    new-instance v0, Lorg/apache/commons/beanutils/converters/FloatConverter;

    iget-object v1, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultFloat:Ljava/lang/Float;

    invoke-direct {v0, v1}, Lorg/apache/commons/beanutils/converters/FloatConverter;-><init>(Ljava/lang/Object;)V

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 318
    new-instance v1, Lorg/apache/commons/beanutils/converters/FloatConverter;

    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultFloat:Ljava/lang/Float;

    invoke-direct {v1, v0}, Lorg/apache/commons/beanutils/converters/FloatConverter;-><init>(Ljava/lang/Object;)V

    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v0, :cond_2a

    const-string v0, "java.lang.Float"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    :goto_26
    invoke-virtual {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 319
    return-void

    .line 318
    :cond_2a
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_26
.end method

.method public setDefaultInteger(I)V
    .registers 4
    .param p1, "newDefaultInteger"    # I

    .prologue
    .line 346
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultInteger:Ljava/lang/Integer;

    .line 347
    new-instance v0, Lorg/apache/commons/beanutils/converters/IntegerConverter;

    iget-object v1, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultInteger:Ljava/lang/Integer;

    invoke-direct {v0, v1}, Lorg/apache/commons/beanutils/converters/IntegerConverter;-><init>(Ljava/lang/Object;)V

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 348
    new-instance v1, Lorg/apache/commons/beanutils/converters/IntegerConverter;

    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultInteger:Ljava/lang/Integer;

    invoke-direct {v1, v0}, Lorg/apache/commons/beanutils/converters/IntegerConverter;-><init>(Ljava/lang/Object;)V

    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v0, :cond_2a

    const-string v0, "java.lang.Integer"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_26
    invoke-virtual {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 349
    return-void

    .line 348
    :cond_2a
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_26
.end method

.method public setDefaultLong(J)V
    .registers 5
    .param p1, "newDefaultLong"    # J

    .prologue
    .line 376
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p1, p2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultLong:Ljava/lang/Long;

    .line 377
    new-instance v0, Lorg/apache/commons/beanutils/converters/LongConverter;

    iget-object v1, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultLong:Ljava/lang/Long;

    invoke-direct {v0, v1}, Lorg/apache/commons/beanutils/converters/LongConverter;-><init>(Ljava/lang/Object;)V

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 378
    new-instance v1, Lorg/apache/commons/beanutils/converters/LongConverter;

    iget-object v0, p0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultLong:Ljava/lang/Long;

    invoke-direct {v1, v0}, Lorg/apache/commons/beanutils/converters/LongConverter;-><init>(Ljava/lang/Object;)V

    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v0, :cond_2a

    const-string v0, "java.lang.Long"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    :goto_26
    invoke-virtual {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 379
    return-void

    .line 378
    :cond_2a
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_26
.end method

.method public setDefaultShort(S)V
    .registers 4
    .param p1, "newDefaultShort"    # S

    .prologue
    .line 406
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, p1}, Ljava/lang/Short;-><init>(S)V

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultShort:Ljava/lang/Short;

    .line 407
    new-instance v0, Lorg/apache/commons/beanutils/converters/ShortConverter;

    sget-object v1, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultShort:Ljava/lang/Short;

    invoke-direct {v0, v1}, Lorg/apache/commons/beanutils/converters/ShortConverter;-><init>(Ljava/lang/Object;)V

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 408
    new-instance v1, Lorg/apache/commons/beanutils/converters/ShortConverter;

    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->defaultShort:Ljava/lang/Short;

    invoke-direct {v1, v0}, Lorg/apache/commons/beanutils/converters/ShortConverter;-><init>(Ljava/lang/Object;)V

    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v0, :cond_2a

    const-string v0, "java.lang.Short"

    invoke-static {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    :goto_26
    invoke-virtual {p0, v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 409
    return-void

    .line 408
    :cond_2a
    sget-object v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_26
.end method
