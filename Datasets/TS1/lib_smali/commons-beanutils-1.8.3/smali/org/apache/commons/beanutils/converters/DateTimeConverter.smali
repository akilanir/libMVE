.class public abstract Lorg/apache/commons/beanutils/converters/DateTimeConverter;
.super Lorg/apache/commons/beanutils/converters/AbstractConverter;
.source "DateTimeConverter.java"


# static fields
.field static class$java$sql$Date:Ljava/lang/Class;

.field static class$java$sql$Time:Ljava/lang/Class;

.field static class$java$sql$Timestamp:Ljava/lang/Class;

.field static class$java$util$Calendar:Ljava/lang/Class;

.field static class$java$util$Date:Ljava/lang/Class;


# instance fields
.field private displayPatterns:Ljava/lang/String;

.field private locale:Ljava/util/Locale;

.field private patterns:[Ljava/lang/String;

.field private timeZone:Ljava/util/TimeZone;

.field private useLocaleFormat:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 95
    invoke-direct {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>()V

    .line 96
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 107
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;-><init>(Ljava/lang/Object;)V

    .line 108
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 335
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

.method private getFormat(Ljava/lang/String;)Ljava/text/DateFormat;
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 498
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 499
    .local v0, "format":Ljava/text/DateFormat;
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    if-eqz v1, :cond_e

    .line 500
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 502
    :cond_e
    return-object v0
.end method

.method private logFormat(Ljava/lang/String;Ljava/text/DateFormat;)V
    .registers 6
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "format"    # Ljava/text/DateFormat;

    .prologue
    .line 602
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_61

    .line 603
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x2d

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 604
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 605
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 606
    const-string v1, " with Format"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 607
    instance-of v1, p2, Ljava/text/SimpleDateFormat;

    if-eqz v1, :cond_35

    .line 608
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 609
    check-cast p2, Ljava/text/SimpleDateFormat;

    .end local p2    # "format":Ljava/text/DateFormat;
    invoke-virtual {p2}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 610
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 612
    :cond_35
    const-string v1, " for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 613
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    if-nez v1, :cond_62

    .line 614
    const-string v1, "default locale"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 620
    :goto_43
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    if-eqz v1, :cond_56

    .line 621
    const-string v1, ", TimeZone["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 622
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 623
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 625
    :cond_56
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 627
    .end local v0    # "buffer":Ljava/lang/StringBuffer;
    :cond_61
    return-void

    .line 616
    .restart local v0    # "buffer":Ljava/lang/StringBuffer;
    :cond_62
    const-string v1, "locale["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 617
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 618
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43
.end method

.method private parse(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/Calendar;
    .registers 12
    .param p1, "sourceType"    # Ljava/lang/Class;
    .param p2, "targetType"    # Ljava/lang/Class;
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 516
    const/4 v2, 0x0

    .line 517
    .local v2, "firstEx":Ljava/lang/Exception;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    iget-object v5, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->patterns:[Ljava/lang/String;

    array-length v5, v5

    if-ge v4, v5, :cond_1b

    .line 519
    :try_start_7
    iget-object v5, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->patterns:[Ljava/lang/String;

    aget-object v5, v5, v4

    invoke-direct {p0, v5}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->getFormat(Ljava/lang/String;)Ljava/text/DateFormat;

    move-result-object v3

    .line 520
    .local v3, "format":Ljava/text/DateFormat;
    invoke-direct {p0, p1, p2, p3, v3}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->parse(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Calendar;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_12} :catch_14

    move-result-object v0

    .line 521
    .local v0, "calendar":Ljava/util/Calendar;
    return-object v0

    .line 522
    .end local v0    # "calendar":Ljava/util/Calendar;
    .end local v3    # "format":Ljava/text/DateFormat;
    :catch_14
    move-exception v1

    .line 523
    .local v1, "ex":Ljava/lang/Exception;
    if-nez v2, :cond_18

    .line 524
    move-object v2, v1

    .line 517
    :cond_18
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 528
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_1b
    iget-object v5, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->patterns:[Ljava/lang/String;

    array-length v5, v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_5e

    .line 529
    new-instance v5, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Error converting \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' to \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' using  patterns \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->displayPatterns:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 532
    :cond_5e
    throw v2
.end method

.method private parse(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Calendar;
    .registers 12
    .param p1, "sourceType"    # Ljava/lang/Class;
    .param p2, "targetType"    # Ljava/lang/Class;
    .param p3, "value"    # Ljava/lang/String;
    .param p4, "format"    # Ljava/text/DateFormat;

    .prologue
    const/4 v5, 0x0

    .line 549
    const-string v4, "Parsing"

    invoke-direct {p0, v4, p4}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->logFormat(Ljava/lang/String;Ljava/text/DateFormat;)V

    .line 550
    invoke-virtual {p4, v5}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 551
    new-instance v3, Ljava/text/ParsePosition;

    invoke-direct {v3, v5}, Ljava/text/ParsePosition;-><init>(I)V

    .line 552
    .local v3, "pos":Ljava/text/ParsePosition;
    invoke-virtual {p4, p3, v3}, Ljava/text/DateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v2

    .line 553
    .local v2, "parsedDate":Ljava/util/Date;
    invoke-virtual {v3}, Ljava/text/ParsePosition;->getErrorIndex()I

    move-result v4

    if-gez v4, :cond_24

    invoke-virtual {v3}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v5

    if-ne v4, v5, :cond_24

    if-nez v2, :cond_a0

    .line 554
    :cond_24
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Error converting \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' to \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 555
    .local v1, "msg":Ljava/lang/String;
    instance-of v4, p4, Ljava/text/SimpleDateFormat;

    if-eqz v4, :cond_76

    .line 556
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " using pattern \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    check-cast p4, Ljava/text/SimpleDateFormat;

    .end local p4    # "format":Ljava/text/DateFormat;
    invoke-virtual {p4}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 558
    :cond_76
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_9a

    .line 559
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "    "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 561
    :cond_9a
    new-instance v4, Lorg/apache/commons/beanutils/ConversionException;

    invoke-direct {v4, v1}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 563
    .end local v1    # "msg":Ljava/lang/String;
    .restart local p4    # "format":Ljava/text/DateFormat;
    :cond_a0
    invoke-virtual {p4}, Ljava/text/DateFormat;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 564
    .local v0, "calendar":Ljava/util/Calendar;
    return-object v0
.end method

.method private toDate(Ljava/lang/Class;J)Ljava/lang/Object;
    .registers 9
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # J

    .prologue
    .line 368
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$util$Date:Ljava/lang/Class;

    if-nez v2, :cond_18

    const-string v2, "java.util.Date"

    invoke-static {v2}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$util$Date:Ljava/lang/Class;

    :goto_c
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 369
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p2, p3}, Ljava/util/Date;-><init>(J)V

    .line 401
    :goto_17
    return-object v0

    .line 368
    :cond_18
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$util$Date:Ljava/lang/Class;

    goto :goto_c

    .line 373
    :cond_1b
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Date:Ljava/lang/Class;

    if-nez v2, :cond_33

    const-string v2, "java.sql.Date"

    invoke-static {v2}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Date:Ljava/lang/Class;

    :goto_27
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_36

    .line 374
    new-instance v0, Ljava/sql/Date;

    invoke-direct {v0, p2, p3}, Ljava/sql/Date;-><init>(J)V

    goto :goto_17

    .line 373
    :cond_33
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Date:Ljava/lang/Class;

    goto :goto_27

    .line 378
    :cond_36
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Time:Ljava/lang/Class;

    if-nez v2, :cond_4e

    const-string v2, "java.sql.Time"

    invoke-static {v2}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Time:Ljava/lang/Class;

    :goto_42
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_51

    .line 379
    new-instance v0, Ljava/sql/Time;

    invoke-direct {v0, p2, p3}, Ljava/sql/Time;-><init>(J)V

    goto :goto_17

    .line 378
    :cond_4e
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Time:Ljava/lang/Class;

    goto :goto_42

    .line 383
    :cond_51
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Timestamp:Ljava/lang/Class;

    if-nez v2, :cond_69

    const-string v2, "java.sql.Timestamp"

    invoke-static {v2}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Timestamp:Ljava/lang/Class;

    :goto_5d
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6c

    .line 384
    new-instance v0, Ljava/sql/Timestamp;

    invoke-direct {v0, p2, p3}, Ljava/sql/Timestamp;-><init>(J)V

    goto :goto_17

    .line 383
    :cond_69
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Timestamp:Ljava/lang/Class;

    goto :goto_5d

    .line 388
    :cond_6c
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$util$Calendar:Ljava/lang/Class;

    if-nez v2, :cond_98

    const-string v2, "java.util.Calendar"

    invoke-static {v2}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$util$Calendar:Ljava/lang/Class;

    :goto_78
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ba

    .line 389
    const/4 v0, 0x0

    .line 390
    .local v0, "calendar":Ljava/util/Calendar;
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    if-nez v2, :cond_9b

    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    if-nez v2, :cond_9b

    .line 391
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 399
    :goto_8b
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, p2, p3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 400
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->setLenient(Z)V

    goto :goto_17

    .line 388
    .end local v0    # "calendar":Ljava/util/Calendar;
    :cond_98
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$util$Calendar:Ljava/lang/Class;

    goto :goto_78

    .line 392
    .restart local v0    # "calendar":Ljava/util/Calendar;
    :cond_9b
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    if-nez v2, :cond_a6

    .line 393
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    invoke-static {v2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    goto :goto_8b

    .line 394
    :cond_a6
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    if-nez v2, :cond_b1

    .line 395
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    invoke-static {v2}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    goto :goto_8b

    .line 397
    :cond_b1
    iget-object v2, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    iget-object v3, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    invoke-static {v2, v3}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    goto :goto_8b

    .line 404
    .end local v0    # "calendar":Ljava/util/Calendar;
    :cond_ba
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " cannot handle conversion to \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 406
    .local v1, "msg":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v2

    if-eqz v2, :cond_107

    .line 407
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "    "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 409
    :cond_107
    new-instance v2, Lorg/apache/commons/beanutils/ConversionException;

    invoke-direct {v2, v1}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private toDate(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 8
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 432
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Date:Ljava/lang/Class;

    if-nez v2, :cond_17

    const-string v2, "java.sql.Date"

    invoke-static {v2}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Date:Ljava/lang/Class;

    :goto_c
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23

    .line 434
    :try_start_12
    invoke-static {p2}, Ljava/sql/Date;->valueOf(Ljava/lang/String;)Ljava/sql/Date;
    :try_end_15
    .catch Ljava/lang/IllegalArgumentException; {:try_start_12 .. :try_end_15} :catch_1a

    move-result-object v2

    .line 454
    :goto_16
    return-object v2

    .line 432
    :cond_17
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Date:Ljava/lang/Class;

    goto :goto_c

    .line 435
    :catch_1a
    move-exception v0

    .line 436
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Lorg/apache/commons/beanutils/ConversionException;

    const-string v3, "String must be in JDBC format [yyyy-MM-dd] to create a java.sql.Date"

    invoke-direct {v2, v3}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 442
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_23
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Time:Ljava/lang/Class;

    if-nez v2, :cond_3a

    const-string v2, "java.sql.Time"

    invoke-static {v2}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Time:Ljava/lang/Class;

    :goto_2f
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_46

    .line 444
    :try_start_35
    invoke-static {p2}, Ljava/sql/Time;->valueOf(Ljava/lang/String;)Ljava/sql/Time;
    :try_end_38
    .catch Ljava/lang/IllegalArgumentException; {:try_start_35 .. :try_end_38} :catch_3d

    move-result-object v2

    goto :goto_16

    .line 442
    :cond_3a
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Time:Ljava/lang/Class;

    goto :goto_2f

    .line 445
    :catch_3d
    move-exception v0

    .line 446
    .restart local v0    # "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Lorg/apache/commons/beanutils/ConversionException;

    const-string v3, "String must be in JDBC format [HH:mm:ss] to create a java.sql.Time"

    invoke-direct {v2, v3}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 452
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_46
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Timestamp:Ljava/lang/Class;

    if-nez v2, :cond_5d

    const-string v2, "java.sql.Timestamp"

    invoke-static {v2}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Timestamp:Ljava/lang/Class;

    :goto_52
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_69

    .line 454
    :try_start_58
    invoke-static {p2}, Ljava/sql/Timestamp;->valueOf(Ljava/lang/String;)Ljava/sql/Timestamp;
    :try_end_5b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_58 .. :try_end_5b} :catch_60

    move-result-object v2

    goto :goto_16

    .line 452
    :cond_5d
    sget-object v2, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$sql$Timestamp:Ljava/lang/Class;

    goto :goto_52

    .line 455
    :catch_60
    move-exception v0

    .line 456
    .restart local v0    # "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Lorg/apache/commons/beanutils/ConversionException;

    const-string v3, "String must be in JDBC format [yyyy-MM-dd HH:mm:ss.fffffffff] to create a java.sql.Timestamp"

    invoke-direct {v2, v3}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 462
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_69
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " does not support default String to \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' conversion."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 464
    .local v1, "msg":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v2

    if-eqz v2, :cond_bf

    .line 465
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "    "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 466
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    const-string v3, "    (N.B. Re-configure Converter or use alternative implementation)"

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 468
    :cond_bf
    new-instance v2, Lorg/apache/commons/beanutils/ConversionException;

    invoke-direct {v2, v1}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method protected convertToString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 8
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 224
    const/4 v0, 0x0

    .line 225
    .local v0, "date":Ljava/util/Date;
    instance-of v3, p1, Ljava/util/Date;

    if-eqz v3, :cond_56

    move-object v0, p1

    .line 226
    check-cast v0, Ljava/util/Date;

    .line 233
    :cond_8
    :goto_8
    const/4 v2, 0x0

    .line 234
    .local v2, "result":Ljava/lang/String;
    iget-boolean v3, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->useLocaleFormat:Z

    if-eqz v3, :cond_7c

    if-eqz v0, :cond_7c

    .line 235
    const/4 v1, 0x0

    .line 236
    .local v1, "format":Ljava/text/DateFormat;
    iget-object v3, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->patterns:[Ljava/lang/String;

    if-eqz v3, :cond_73

    iget-object v3, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->patterns:[Ljava/lang/String;

    array-length v3, v3

    if-lez v3, :cond_73

    .line 237
    iget-object v3, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->patterns:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-direct {p0, v3}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->getFormat(Ljava/lang/String;)Ljava/text/DateFormat;

    move-result-object v1

    .line 241
    :goto_22
    const-string v3, "Formatting"

    invoke-direct {p0, v3, v1}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->logFormat(Ljava/lang/String;Ljava/text/DateFormat;)V

    .line 242
    invoke-virtual {v1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 243
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_55

    .line 244
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "    Converted  to String using format \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 252
    .end local v1    # "format":Ljava/text/DateFormat;
    :cond_55
    :goto_55
    return-object v2

    .line 227
    .end local v2    # "result":Ljava/lang/String;
    :cond_56
    instance-of v3, p1, Ljava/util/Calendar;

    if-eqz v3, :cond_62

    move-object v3, p1

    .line 228
    check-cast v3, Ljava/util/Calendar;

    invoke-virtual {v3}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    goto :goto_8

    .line 229
    :cond_62
    instance-of v3, p1, Ljava/lang/Long;

    if-eqz v3, :cond_8

    .line 230
    new-instance v0, Ljava/util/Date;

    .end local v0    # "date":Ljava/util/Date;
    move-object v3, p1

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-direct {v0, v3, v4}, Ljava/util/Date;-><init>(J)V

    .restart local v0    # "date":Ljava/util/Date;
    goto :goto_8

    .line 239
    .restart local v1    # "format":Ljava/text/DateFormat;
    .restart local v2    # "result":Ljava/lang/String;
    :cond_73
    iget-object v3, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    iget-object v4, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {p0, v3, v4}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->getFormat(Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/text/DateFormat;

    move-result-object v1

    goto :goto_22

    .line 247
    .end local v1    # "format":Ljava/text/DateFormat;
    :cond_7c
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 248
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_55

    .line 249
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "    Converted  to String using toString() \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_55
.end method

.method protected convertToType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16
    .param p1, "targetType"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const-wide/16 v11, 0x3e8

    .line 286
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 289
    .local v4, "sourceType":Ljava/lang/Class;
    instance-of v9, p2, Ljava/sql/Timestamp;

    if-eqz v9, :cond_23

    move-object v8, p2

    .line 295
    check-cast v8, Ljava/sql/Timestamp;

    .line 296
    .local v8, "timestamp":Ljava/sql/Timestamp;
    invoke-virtual {v8}, Ljava/sql/Timestamp;->getTime()J

    move-result-wide v9

    div-long/2addr v9, v11

    mul-long v6, v9, v11

    .line 297
    .local v6, "timeInMillis":J
    invoke-virtual {v8}, Ljava/sql/Timestamp;->getNanos()I

    move-result v9

    const v10, 0xf4240

    div-int/2addr v9, v10

    int-to-long v9, v9

    add-long/2addr v6, v9

    .line 299
    invoke-direct {p0, p1, v6, v7}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toDate(Ljava/lang/Class;J)Ljava/lang/Object;

    move-result-object v0

    .line 343
    .end local v6    # "timeInMillis":J
    .end local v8    # "timestamp":Ljava/sql/Timestamp;
    :cond_22
    :goto_22
    return-object v0

    .line 303
    :cond_23
    instance-of v9, p2, Ljava/util/Date;

    if-eqz v9, :cond_33

    move-object v1, p2

    .line 304
    check-cast v1, Ljava/util/Date;

    .line 305
    .local v1, "date":Ljava/util/Date;
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    invoke-direct {p0, p1, v9, v10}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toDate(Ljava/lang/Class;J)Ljava/lang/Object;

    move-result-object v0

    goto :goto_22

    .line 309
    .end local v1    # "date":Ljava/util/Date;
    :cond_33
    instance-of v9, p2, Ljava/util/Calendar;

    if-eqz v9, :cond_47

    move-object v0, p2

    .line 310
    check-cast v0, Ljava/util/Calendar;

    .line 311
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    invoke-direct {p0, p1, v9, v10}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toDate(Ljava/lang/Class;J)Ljava/lang/Object;

    move-result-object v0

    goto :goto_22

    .line 315
    .end local v0    # "calendar":Ljava/util/Calendar;
    :cond_47
    instance-of v9, p2, Ljava/lang/Long;

    if-eqz v9, :cond_57

    move-object v3, p2

    .line 316
    check-cast v3, Ljava/lang/Long;

    .line 317
    .local v3, "longObj":Ljava/lang/Long;
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    invoke-direct {p0, p1, v9, v10}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toDate(Ljava/lang/Class;J)Ljava/lang/Object;

    move-result-object v0

    goto :goto_22

    .line 321
    .end local v3    # "longObj":Ljava/lang/Long;
    :cond_57
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 322
    .local v5, "stringValue":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_6a

    .line 323
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->handleMissing(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_22

    .line 327
    :cond_6a
    iget-boolean v9, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->useLocaleFormat:Z

    if-eqz v9, :cond_ab

    .line 328
    const/4 v0, 0x0

    .line 329
    .restart local v0    # "calendar":Ljava/util/Calendar;
    iget-object v9, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->patterns:[Ljava/lang/String;

    if-eqz v9, :cond_9b

    iget-object v9, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->patterns:[Ljava/lang/String;

    array-length v9, v9

    if-lez v9, :cond_9b

    .line 330
    invoke-direct {p0, v4, p1, v5}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->parse(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/Calendar;

    move-result-object v0

    .line 335
    :goto_7c
    sget-object v9, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$util$Calendar:Ljava/lang/Class;

    if-nez v9, :cond_a8

    const-string v9, "java.util.Calendar"

    invoke-static {v9}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    sput-object v9, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$util$Calendar:Ljava/lang/Class;

    :goto_88
    invoke-virtual {v9, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-nez v9, :cond_22

    .line 338
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    invoke-direct {p0, p1, v9, v10}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toDate(Ljava/lang/Class;J)Ljava/lang/Object;

    move-result-object v0

    goto :goto_22

    .line 332
    :cond_9b
    iget-object v9, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    iget-object v10, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {p0, v9, v10}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->getFormat(Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/text/DateFormat;

    move-result-object v2

    .line 333
    .local v2, "format":Ljava/text/DateFormat;
    invoke-direct {p0, v4, p1, v5, v2}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->parse(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;Ljava/text/DateFormat;)Ljava/util/Calendar;

    move-result-object v0

    goto :goto_7c

    .line 335
    .end local v2    # "format":Ljava/text/DateFormat;
    :cond_a8
    sget-object v9, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->class$java$util$Calendar:Ljava/lang/Class;

    goto :goto_88

    .line 343
    .end local v0    # "calendar":Ljava/util/Calendar;
    :cond_ab
    invoke-direct {p0, p1, v5}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toDate(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto/16 :goto_22
.end method

.method protected getFormat(Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/text/DateFormat;
    .registers 5
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    const/4 v1, 0x3

    .line 479
    const/4 v0, 0x0

    .line 480
    .local v0, "format":Ljava/text/DateFormat;
    if-nez p1, :cond_e

    .line 481
    invoke-static {v1}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    .line 485
    :goto_8
    if-eqz p2, :cond_d

    .line 486
    invoke-virtual {v0, p2}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 488
    :cond_d
    return-object v0

    .line 483
    :cond_e
    invoke-static {v1, p1}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v0

    goto :goto_8
.end method

.method public getLocale()Ljava/util/Locale;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method public getPatterns()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 182
    iget-object v0, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->patterns:[Ljava/lang/String;

    return-object v0
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    return-object v0
.end method

.method public setLocale(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 158
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    .line 159
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->setUseLocaleFormat(Z)V

    .line 160
    return-void
.end method

.method public setPattern(Ljava/lang/String;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 170
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->setPatterns([Ljava/lang/String;)V

    .line 171
    return-void
.end method

.method public setPatterns([Ljava/lang/String;)V
    .registers 6
    .param p1, "patterns"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 193
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->patterns:[Ljava/lang/String;

    .line 194
    if-eqz p1, :cond_26

    array-length v2, p1

    if-le v2, v3, :cond_26

    .line 195
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 196
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    array-length v2, p1

    if-ge v1, v2, :cond_20

    .line 197
    if-lez v1, :cond_18

    .line 198
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 200
    :cond_18
    aget-object v2, p1, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 196
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 202
    :cond_20
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->displayPatterns:Ljava/lang/String;

    .line 204
    .end local v0    # "buffer":Ljava/lang/StringBuffer;
    .end local v1    # "i":I
    :cond_26
    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->setUseLocaleFormat(Z)V

    .line 205
    return-void
.end method

.method public setTimeZone(Ljava/util/TimeZone;)V
    .registers 2
    .param p1, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 139
    iput-object p1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    .line 140
    return-void
.end method

.method public setUseLocaleFormat(Z)V
    .registers 2
    .param p1, "useLocaleFormat"    # Z

    .prologue
    .line 120
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->useLocaleFormat:Z

    .line 121
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 573
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 574
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 575
    const-string v1, "[UseDefault="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 576
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->isUseDefault()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 577
    const-string v1, ", UseLocaleFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 578
    iget-boolean v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->useLocaleFormat:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 579
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->displayPatterns:Ljava/lang/String;

    if-eqz v1, :cond_39

    .line 580
    const-string v1, ", Patterns={"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 581
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->displayPatterns:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 582
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 584
    :cond_39
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    if-eqz v1, :cond_47

    .line 585
    const-string v1, ", Locale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 586
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->locale:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 588
    :cond_47
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    if-eqz v1, :cond_55

    .line 589
    const-string v1, ", TimeZone="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 590
    iget-object v1, p0, Lorg/apache/commons/beanutils/converters/DateTimeConverter;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 592
    :cond_55
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 593
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
