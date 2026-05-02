.class public abstract Lorg/apache/commons/beanutils/converters/NumberConverter;
.super Lorg/apache/commons/beanutils/converters/AbstractConverter;
.source "NumberConverter.java"


# static fields
.field private static final ONE:Ljava/lang/Integer;

.field private static final ZERO:Ljava/lang/Integer;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$java$math$BigDecimal:Ljava/lang/Class;

.field static class$java$math$BigInteger:Ljava/lang/Class;


# instance fields
.field private allowDecimals:Z

.field private locale:Ljava/util/Locale;

.field private pattern:Ljava/lang/String;

.field private useLocaleFormat:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 87
    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/beanutils/converters/NumberConverter;->ZERO:Ljava/lang/Integer;

    .line 88
    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/beanutils/converters/NumberConverter;->ONE:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>(Z)V
    .registers 2
    .param p1, "allowDecimals"    # Z

    .prologue
    .line 104
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>()V

    .line 105
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->allowDecimals:Z

    .line 106
    return-void
.end method

.method public constructor <init>(ZLjava/lang/Object;)V
    .registers 3
    .param p1, "allowDecimals"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 116
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>()V

    .line 117
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->allowDecimals:Z

    .line 118
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->setDefaultValue(Ljava/lang/Object;)V

    .line 119
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 244
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

.method private getFormat()Ljava/text/NumberFormat;
    .registers 6

    .prologue
    .line 494
    const/4 v0, 0x0

    .line 495
    .local v0, "format":Ljava/text/NumberFormat;
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->pattern:Ljava/lang/String;

    if-eqz v2, :cond_92

    .line 496
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    if-nez v2, :cond_45

    .line 497
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_35

    .line 498
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "    Using pattern \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->pattern:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 500
    :cond_35
    new-instance v0, Ljava/text/DecimalFormat;

    .end local v0    # "format":Ljava/text/NumberFormat;
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->pattern:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 522
    .restart local v0    # "format":Ljava/text/NumberFormat;
    :goto_3c
    iget-boolean v2, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->allowDecimals:Z

    if-nez v2, :cond_44

    .line 523
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/text/NumberFormat;->setParseIntegerOnly(Z)V

    .line 525
    :cond_44
    return-object v0

    .line 502
    :cond_45
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_83

    .line 503
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "    Using pattern \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->pattern:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " with Locale["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 506
    :cond_83
    new-instance v1, Ljava/text/DecimalFormatSymbols;

    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    invoke-direct {v1, v2}, Ljava/text/DecimalFormatSymbols;-><init>(Ljava/util/Locale;)V

    .line 507
    .local v1, "symbols":Ljava/text/DecimalFormatSymbols;
    new-instance v0, Ljava/text/DecimalFormat;

    .end local v0    # "format":Ljava/text/NumberFormat;
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->pattern:Ljava/lang/String;

    invoke-direct {v0, v2, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;Ljava/text/DecimalFormatSymbols;)V

    .line 508
    .restart local v0    # "format":Ljava/text/NumberFormat;
    goto :goto_3c

    .line 510
    .end local v1    # "symbols":Ljava/text/DecimalFormatSymbols;
    :cond_92
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    if-nez v2, :cond_ae

    .line 511
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_a9

    .line 512
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    const-string v3, "    Using default Locale format"

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 514
    :cond_a9
    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v0

    goto :goto_3c

    .line 516
    :cond_ae
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_da

    .line 517
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "    Using Locale["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "] format"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 519
    :cond_da
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    invoke-static {v2}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    goto/16 :goto_3c
.end method

.method private parse(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;Ljava/text/NumberFormat;)Ljava/lang/Number;
    .registers 11
    .param p1, "sourceType"    # Ljava/lang/Class;
    .param p2, "targetType"    # Ljava/lang/Class;
    .param p3, "value"    # Ljava/lang/String;
    .param p4, "format"    # Ljava/text/NumberFormat;

    .prologue
    .line 539
    new-instance v2, Ljava/text/ParsePosition;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/text/ParsePosition;-><init>(I)V

    .line 540
    .local v2, "pos":Ljava/text/ParsePosition;
    invoke-virtual {p4, p3, v2}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Number;

    move-result-object v1

    .line 541
    .local v1, "parsedNumber":Ljava/lang/Number;
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getErrorIndex()I

    move-result v3

    if-gez v3, :cond_1c

    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v3, v4, :cond_1c

    if-nez v1, :cond_bb

    .line 542
    :cond_1c
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Error converting from \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' to \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 543
    .local v0, "msg":Ljava/lang/String;
    instance-of v3, p4, Ljava/text/DecimalFormat;

    if-eqz v3, :cond_6e

    .line 544
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " using pattern \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    check-cast p4, Ljava/text/DecimalFormat;

    .end local p4    # "format":Ljava/text/NumberFormat;
    invoke-virtual {p4}, Ljava/text/DecimalFormat;->toPattern()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 546
    :cond_6e
    iget-object v3, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    if-eqz v3, :cond_91

    .line 547
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " for locale=["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 549
    :cond_91
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_b5

    .line 550
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "    "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 552
    :cond_b5
    new-instance v3, Lorg/apache/commons/beanutils/ConversionException;

    invoke-direct {v3, v0}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 554
    .end local v0    # "msg":Ljava/lang/String;
    .restart local p4    # "format":Ljava/text/NumberFormat;
    :cond_bb
    return-object v1
.end method

.method private toNumber(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 11
    .param p1, "sourceType"    # Ljava/lang/Class;
    .param p2, "targetType"    # Ljava/lang/Class;
    .param p3, "value"    # Ljava/lang/Number;

    .prologue
    .line 300
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 381
    .end local p3    # "value":Ljava/lang/Number;
    :goto_a
    return-object p3

    .line 305
    .restart local p3    # "value":Ljava/lang/Number;
    :cond_b
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v3, :cond_56

    const-string v3, "java.lang.Byte"

    invoke-static {v3}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_17
    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9a

    .line 306
    invoke-virtual {p3}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 307
    .local v0, "longValue":J
    const-wide/16 v3, 0x7f

    cmp-long v3, v0, v3

    if-lez v3, :cond_59

    .line 308
    new-instance v3, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " value \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' is too large for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 305
    .end local v0    # "longValue":J
    :cond_56
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_17

    .line 311
    .restart local v0    # "longValue":J
    :cond_59
    const-wide/16 v3, -0x80

    cmp-long v3, v0, v3

    if-gez v3, :cond_8e

    .line 312
    new-instance v3, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " value \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' is too small "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 315
    :cond_8e
    new-instance v3, Ljava/lang/Byte;

    invoke-virtual {p3}, Ljava/lang/Number;->byteValue()B

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Byte;-><init>(B)V

    move-object p3, v3

    goto/16 :goto_a

    .line 319
    .end local v0    # "longValue":J
    :cond_9a
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v3, :cond_e5

    const-string v3, "java.lang.Short"

    invoke-static {v3}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Short:Ljava/lang/Class;

    :goto_a6
    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_129

    .line 320
    invoke-virtual {p3}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 321
    .restart local v0    # "longValue":J
    const-wide/16 v3, 0x7fff

    cmp-long v3, v0, v3

    if-lez v3, :cond_e8

    .line 322
    new-instance v3, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " value \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' is too large for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 319
    .end local v0    # "longValue":J
    :cond_e5
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_a6

    .line 325
    .restart local v0    # "longValue":J
    :cond_e8
    const-wide/16 v3, -0x8000

    cmp-long v3, v0, v3

    if-gez v3, :cond_11d

    .line 326
    new-instance v3, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " value \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' is too small "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 329
    :cond_11d
    new-instance v3, Ljava/lang/Short;

    invoke-virtual {p3}, Ljava/lang/Number;->shortValue()S

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Short;-><init>(S)V

    move-object p3, v3

    goto/16 :goto_a

    .line 333
    .end local v0    # "longValue":J
    :cond_129
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v3, :cond_175

    const-string v3, "java.lang.Integer"

    invoke-static {v3}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_135
    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1ba

    .line 334
    invoke-virtual {p3}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 335
    .restart local v0    # "longValue":J
    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v0, v3

    if-lez v3, :cond_178

    .line 336
    new-instance v3, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " value \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' is too large for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 333
    .end local v0    # "longValue":J
    :cond_175
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_135

    .line 339
    .restart local v0    # "longValue":J
    :cond_178
    const-wide/32 v3, -0x80000000

    cmp-long v3, v0, v3

    if-gez v3, :cond_1ae

    .line 340
    new-instance v3, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " value \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' is too small "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 343
    :cond_1ae
    new-instance v3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    move-object p3, v3

    goto/16 :goto_a

    .line 347
    .end local v0    # "longValue":J
    :cond_1ba
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v3, :cond_1d8

    const-string v3, "java.lang.Long"

    invoke-static {v3}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    :goto_1c6
    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1db

    .line 348
    new-instance v3, Ljava/lang/Long;

    invoke-virtual {p3}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/lang/Long;-><init>(J)V

    move-object p3, v3

    goto/16 :goto_a

    .line 347
    :cond_1d8
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_1c6

    .line 352
    :cond_1db
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v3, :cond_229

    const-string v3, "java.lang.Float"

    invoke-static {v3}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Float:Ljava/lang/Class;

    :goto_1e7
    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_238

    .line 353
    invoke-virtual {p3}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    const-wide v5, 0x47efffffe0000000L    # 3.4028234663852886E38

    cmpl-double v3, v3, v5

    if-lez v3, :cond_22c

    .line 354
    new-instance v3, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " value \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' is too large for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 352
    :cond_229
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_1e7

    .line 357
    :cond_22c
    new-instance v3, Ljava/lang/Float;

    invoke-virtual {p3}, Ljava/lang/Number;->floatValue()F

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Float;-><init>(F)V

    move-object p3, v3

    goto/16 :goto_a

    .line 361
    :cond_238
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v3, :cond_256

    const-string v3, "java.lang.Double"

    invoke-static {v3}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Double:Ljava/lang/Class;

    :goto_244
    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_259

    .line 362
    new-instance v3, Ljava/lang/Double;

    invoke-virtual {p3}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/lang/Double;-><init>(D)V

    move-object p3, v3

    goto/16 :goto_a

    .line 361
    :cond_256
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_244

    .line 366
    :cond_259
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigDecimal:Ljava/lang/Class;

    if-nez v3, :cond_27f

    const-string v3, "java.math.BigDecimal"

    invoke-static {v3}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigDecimal:Ljava/lang/Class;

    :goto_265
    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_29a

    .line 367
    instance-of v3, p3, Ljava/lang/Float;

    if-nez v3, :cond_273

    instance-of v3, p3, Ljava/lang/Double;

    if-eqz v3, :cond_282

    .line 368
    :cond_273
    new-instance v3, Ljava/math/BigDecimal;

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    move-object p3, v3

    goto/16 :goto_a

    .line 366
    :cond_27f
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigDecimal:Ljava/lang/Class;

    goto :goto_265

    .line 369
    :cond_282
    instance-of v3, p3, Ljava/math/BigInteger;

    if-eqz v3, :cond_290

    .line 370
    new-instance v3, Ljava/math/BigDecimal;

    check-cast p3, Ljava/math/BigInteger;

    .end local p3    # "value":Ljava/lang/Number;
    invoke-direct {v3, p3}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    move-object p3, v3

    goto/16 :goto_a

    .line 372
    .restart local p3    # "value":Ljava/lang/Number;
    :cond_290
    invoke-virtual {p3}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object p3

    goto/16 :goto_a

    .line 377
    :cond_29a
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigInteger:Ljava/lang/Class;

    if-nez v3, :cond_2b8

    const-string v3, "java.math.BigInteger"

    invoke-static {v3}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigInteger:Ljava/lang/Class;

    :goto_2a6
    invoke-virtual {p2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2c5

    .line 378
    instance-of v3, p3, Ljava/math/BigDecimal;

    if-eqz v3, :cond_2bb

    .line 379
    check-cast p3, Ljava/math/BigDecimal;

    .end local p3    # "value":Ljava/lang/Number;
    invoke-virtual {p3}, Ljava/math/BigDecimal;->toBigInteger()Ljava/math/BigInteger;

    move-result-object p3

    goto/16 :goto_a

    .line 377
    .restart local p3    # "value":Ljava/lang/Number;
    :cond_2b8
    sget-object v3, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigInteger:Ljava/lang/Class;

    goto :goto_2a6

    .line 381
    :cond_2bb
    invoke-virtual {p3}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object p3

    goto/16 :goto_a

    .line 385
    :cond_2c5
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " cannot handle conversion to \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 387
    .local v2, "msg":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v3

    if-eqz v3, :cond_312

    .line 388
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "    "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 390
    :cond_312
    new-instance v3, Lorg/apache/commons/beanutils/ConversionException;

    invoke-direct {v3, v2}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private toNumber(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Number;
    .registers 8
    .param p1, "sourceType"    # Ljava/lang/Class;
    .param p2, "targetType"    # Ljava/lang/Class;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 417
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v1, :cond_18

    const-string v1, "java.lang.Byte"

    invoke-static {v1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_c
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 418
    new-instance v1, Ljava/lang/Byte;

    invoke-direct {v1, p3}, Ljava/lang/Byte;-><init>(Ljava/lang/String;)V

    .line 453
    :goto_17
    return-object v1

    .line 417
    :cond_18
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_c

    .line 422
    :cond_1b
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v1, :cond_33

    const-string v1, "java.lang.Short"

    invoke-static {v1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Short:Ljava/lang/Class;

    :goto_27
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    .line 423
    new-instance v1, Ljava/lang/Short;

    invoke-direct {v1, p3}, Ljava/lang/Short;-><init>(Ljava/lang/String;)V

    goto :goto_17

    .line 422
    :cond_33
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_27

    .line 427
    :cond_36
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v1, :cond_4e

    const-string v1, "java.lang.Integer"

    invoke-static {v1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_42
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_51

    .line 428
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p3}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    goto :goto_17

    .line 427
    :cond_4e
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_42

    .line 432
    :cond_51
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v1, :cond_69

    const-string v1, "java.lang.Long"

    invoke-static {v1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    :goto_5d
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6c

    .line 433
    new-instance v1, Ljava/lang/Long;

    invoke-direct {v1, p3}, Ljava/lang/Long;-><init>(Ljava/lang/String;)V

    goto :goto_17

    .line 432
    :cond_69
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_5d

    .line 437
    :cond_6c
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v1, :cond_84

    const-string v1, "java.lang.Float"

    invoke-static {v1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Float:Ljava/lang/Class;

    :goto_78
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_87

    .line 438
    new-instance v1, Ljava/lang/Float;

    invoke-direct {v1, p3}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    goto :goto_17

    .line 437
    :cond_84
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_78

    .line 442
    :cond_87
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v1, :cond_a0

    const-string v1, "java.lang.Double"

    invoke-static {v1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Double:Ljava/lang/Class;

    :goto_93
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a3

    .line 443
    new-instance v1, Ljava/lang/Double;

    invoke-direct {v1, p3}, Ljava/lang/Double;-><init>(Ljava/lang/String;)V

    goto/16 :goto_17

    .line 442
    :cond_a0
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_93

    .line 447
    :cond_a3
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigDecimal:Ljava/lang/Class;

    if-nez v1, :cond_bc

    const-string v1, "java.math.BigDecimal"

    invoke-static {v1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigDecimal:Ljava/lang/Class;

    :goto_af
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_bf

    .line 448
    new-instance v1, Ljava/math/BigDecimal;

    invoke-direct {v1, p3}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    goto/16 :goto_17

    .line 447
    :cond_bc
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigDecimal:Ljava/lang/Class;

    goto :goto_af

    .line 452
    :cond_bf
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigInteger:Ljava/lang/Class;

    if-nez v1, :cond_d8

    const-string v1, "java.math.BigInteger"

    invoke-static {v1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigInteger:Ljava/lang/Class;

    :goto_cb
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_db

    .line 453
    new-instance v1, Ljava/math/BigInteger;

    invoke-direct {v1, p3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    goto/16 :goto_17

    .line 452
    :cond_d8
    sget-object v1, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$math$BigInteger:Ljava/lang/Class;

    goto :goto_cb

    .line 456
    :cond_db
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " cannot handle conversion from \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' to \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 458
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_136

    .line 459
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "    "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 461
    :cond_136
    new-instance v1, Lorg/apache/commons/beanutils/ConversionException;

    invoke-direct {v1, v0}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method protected convertToString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 7
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 202
    const/4 v1, 0x0

    .line 203
    .local v1, "result":Ljava/lang/String;
    iget-boolean v2, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->useLocaleFormat:Z

    if-eqz v2, :cond_40

    instance-of v2, p1, Ljava/lang/Number;

    if-eqz v2, :cond_40

    .line 204
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->getFormat()Ljava/text/NumberFormat;

    move-result-object v0

    .line 205
    .local v0, "format":Ljava/text/NumberFormat;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/text/NumberFormat;->setGroupingUsed(Z)V

    .line 206
    invoke-virtual {v0, p1}, Ljava/text/NumberFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 207
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 208
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "    Converted  to String using format \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 217
    .end local v0    # "format":Ljava/text/NumberFormat;
    :cond_3f
    :goto_3f
    return-object v1

    .line 212
    :cond_40
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 213
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 214
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "    Converted  to String using toString() \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_3f
.end method

.method protected convertToType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "targetType"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 232
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 234
    .local v2, "sourceType":Ljava/lang/Class;
    instance-of v4, p2, Ljava/lang/Number;

    if-eqz v4, :cond_f

    .line 235
    check-cast p2, Ljava/lang/Number;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-direct {p0, v2, p1, p2}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toNumber(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v4

    .line 272
    :goto_e
    return-object v4

    .line 239
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_f
    instance-of v4, p2, Ljava/lang/Boolean;

    if-eqz v4, :cond_25

    .line 240
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_22

    sget-object v4, Lorg/apache/commons/beanutils/converters/NumberConverter;->ONE:Ljava/lang/Integer;

    :goto_1d
    invoke-direct {p0, v2, p1, v4}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toNumber(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v4

    goto :goto_e

    :cond_22
    sget-object v4, Lorg/apache/commons/beanutils/converters/NumberConverter;->ZERO:Ljava/lang/Integer;

    goto :goto_1d

    .line 244
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_25
    instance-of v4, p2, Ljava/util/Date;

    if-eqz v4, :cond_4a

    sget-object v4, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v4, :cond_47

    const-string v4, "java.lang.Long"

    invoke-static {v4}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    :goto_35
    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 245
    new-instance v4, Ljava/lang/Long;

    check-cast p2, Ljava/util/Date;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-direct {v4, v5, v6}, Ljava/lang/Long;-><init>(J)V

    goto :goto_e

    .line 244
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_47
    sget-object v4, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_35

    .line 249
    :cond_4a
    instance-of v4, p2, Ljava/util/Calendar;

    if-eqz v4, :cond_73

    sget-object v4, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v4, :cond_70

    const-string v4, "java.lang.Long"

    invoke-static {v4}, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    :goto_5a
    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_73

    .line 250
    new-instance v4, Ljava/lang/Long;

    check-cast p2, Ljava/util/Calendar;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-direct {v4, v5, v6}, Ljava/lang/Long;-><init>(J)V

    goto :goto_e

    .line 249
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_70
    sget-object v4, Lorg/apache/commons/beanutils/converters/NumberConverter;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_5a

    .line 254
    :cond_73
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 255
    .local v3, "stringValue":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_86

    .line 256
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->handleMissing(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_e

    .line 260
    :cond_86
    const/4 v1, 0x0

    .line 261
    .local v1, "number":Ljava/lang/Number;
    iget-boolean v4, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->useLocaleFormat:Z

    if-eqz v4, :cond_99

    .line 262
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->getFormat()Ljava/text/NumberFormat;

    move-result-object v0

    .line 263
    .local v0, "format":Ljava/text/NumberFormat;
    invoke-direct {p0, v2, p1, v3, v0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->parse(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;Ljava/text/NumberFormat;)Ljava/lang/Number;

    move-result-object v1

    .line 272
    .end local v0    # "format":Ljava/text/NumberFormat;
    :goto_93
    invoke-direct {p0, v2, p1, v1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toNumber(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v4

    goto/16 :goto_e

    .line 265
    :cond_99
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_ac

    .line 266
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v4

    const-string v5, "    No NumberFormat, using default conversion"

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 268
    :cond_ac
    invoke-direct {p0, v2, p1, v3}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toNumber(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v1

    goto :goto_93
.end method

.method public getLocale()Ljava/util/Locale;
    .registers 2

    .prologue
    .line 178
    iget-object v0, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method public getPattern()Ljava/lang/String;
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method public isAllowDecimals()Z
    .registers 2

    .prologue
    .line 129
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->allowDecimals:Z

    return v0
.end method

.method public setLocale(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 187
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    .line 188
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->setUseLocaleFormat(Z)V

    .line 189
    return-void
.end method

.method public setPattern(Ljava/lang/String;)V
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 167
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->pattern:Ljava/lang/String;

    .line 168
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->setUseLocaleFormat(Z)V

    .line 169
    return-void
.end method

.method public setUseLocaleFormat(Z)V
    .registers 2
    .param p1, "useLocaleFormat"    # Z

    .prologue
    .line 140
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->useLocaleFormat:Z

    .line 141
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 470
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 471
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/converters/NumberConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 472
    const-string v1, "[UseDefault="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 473
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/NumberConverter;->isUseDefault()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 474
    const-string v1, ", UseLocaleFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 475
    iget-boolean v1, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->useLocaleFormat:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 476
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->pattern:Ljava/lang/String;

    if-eqz v1, :cond_34

    .line 477
    const-string v1, ", Pattern="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 478
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->pattern:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 480
    :cond_34
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    if-eqz v1, :cond_42

    .line 481
    const-string v1, ", Locale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 482
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/NumberConverter;->locale:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 484
    :cond_42
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 485
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
