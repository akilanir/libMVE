.class public Lcom/sun/mail/util/logging/CompactFormatter;
.super Ljava/util/logging/Formatter;
.source "CompactFormatter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/mail/util/logging/CompactFormatter$Alternate;
    }
.end annotation


# instance fields
.field private final fmt:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/util/logging/Formatter;-><init>()V

    .line 77
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "p":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CompactFormatter;->initFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/util/logging/CompactFormatter;->fmt:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/util/logging/Formatter;-><init>()V

    .line 89
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 90
    .local v0, "p":Ljava/lang/String;
    if-nez p1, :cond_11

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CompactFormatter;->initFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .end local p1    # "format":Ljava/lang/String;
    :cond_11
    iput-object p1, p0, Lcom/sun/mail/util/logging/CompactFormatter;->fmt:Ljava/lang/String;

    .line 91
    return-void
.end method

.method private defaultIgnore(Ljava/lang/StackTraceElement;)Z
    .registers 3
    .param p1, "s"    # Ljava/lang/StackTraceElement;

    .prologue
    .line 384
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->isSynthetic(Ljava/lang/StackTraceElement;)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->isStaticUtility(Ljava/lang/StackTraceElement;)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->isReflection(Ljava/lang/StackTraceElement;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method private findAndFormat([Ljava/lang/StackTraceElement;)Ljava/lang/String;
    .registers 8
    .param p1, "trace"    # [Ljava/lang/StackTraceElement;

    .prologue
    const/4 v2, 0x0

    .line 294
    const-string v1, ""

    .line 295
    .local v1, "site":Ljava/lang/String;
    array-length v4, p1

    move v3, v2

    :goto_5
    if-ge v3, v4, :cond_13

    aget-object v0, p1, v3

    .line 296
    .local v0, "s":Ljava/lang/StackTraceElement;
    invoke-virtual {p0, v0}, Lcom/sun/mail/util/logging/CompactFormatter;->ignore(Ljava/lang/StackTraceElement;)Z

    move-result v5

    if-nez v5, :cond_29

    .line 297
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CompactFormatter;->formatStackTraceElement(Ljava/lang/StackTraceElement;)Ljava/lang/String;

    move-result-object v1

    .line 303
    .end local v0    # "s":Ljava/lang/StackTraceElement;
    :cond_13
    invoke-static {v1}, Lcom/sun/mail/util/logging/CompactFormatter;->isNullOrSpaces(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 304
    array-length v3, p1

    :goto_1a
    if-ge v2, v3, :cond_28

    aget-object v0, p1, v2

    .line 305
    .restart local v0    # "s":Ljava/lang/StackTraceElement;
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CompactFormatter;->defaultIgnore(Ljava/lang/StackTraceElement;)Z

    move-result v4

    if-nez v4, :cond_2c

    .line 306
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CompactFormatter;->formatStackTraceElement(Ljava/lang/StackTraceElement;)Ljava/lang/String;

    move-result-object v1

    .line 311
    .end local v0    # "s":Ljava/lang/StackTraceElement;
    :cond_28
    return-object v1

    .line 295
    .restart local v0    # "s":Ljava/lang/StackTraceElement;
    :cond_29
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 304
    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a
.end method

.method private formatStackTraceElement(Ljava/lang/StackTraceElement;)Ljava/lang/String;
    .registers 6
    .param p1, "s"    # Ljava/lang/StackTraceElement;

    .prologue
    .line 323
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/sun/mail/util/logging/CompactFormatter;->simpleClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 325
    .local v1, "v":Ljava/lang/String;
    if-eqz v1, :cond_31

    .line 326
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 332
    .local v0, "result":Ljava/lang/String;
    :goto_16
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/sun/mail/util/logging/CompactFormatter;->simpleFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 333
    if-eqz v1, :cond_30

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 334
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 336
    :cond_30
    return-object v0

    .line 328
    .end local v0    # "result":Ljava/lang/String;
    :cond_31
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_16
.end method

.method private initFormat(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 454
    invoke-static {}, Lcom/sun/mail/util/logging/LogManagerProperties;->getLogManager()Ljava/util/logging/LogManager;

    move-result-object v0

    .line 455
    .local v0, "m":Ljava/util/logging/LogManager;
    const-string v2, ".format"

    invoke-virtual {p1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 456
    .local v1, "v":Ljava/lang/String;
    invoke-static {v1}, Lcom/sun/mail/util/logging/CompactFormatter;->isNullOrSpaces(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 457
    const-string v1, "%7$#.160s%n"

    .line 459
    :cond_16
    return-object v1
.end method

.method private static isNullOrSpaces(Ljava/lang/String;)Z
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 544
    if-eqz p0, :cond_c

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private isReflection(Ljava/lang/StackTraceElement;)Z
    .registers 4
    .param p1, "s"    # Ljava/lang/StackTraceElement;

    .prologue
    .line 437
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->isReflectionClass(Ljava/lang/String;)Z
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_7} :catch_28
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_26
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_7} :catch_9

    move-result v0

    .line 443
    :goto_8
    return v0

    .line 440
    :catch_9
    move-exception v0

    .line 442
    :goto_a
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "java.lang.reflect."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_22

    .line 443
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "sun.reflect."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    :cond_22
    const/4 v0, 0x1

    goto :goto_8

    :cond_24
    const/4 v0, 0x0

    goto :goto_8

    .line 439
    :catch_26
    move-exception v0

    goto :goto_a

    .line 438
    :catch_28
    move-exception v0

    goto :goto_a
.end method

.method private isStaticUtility(Ljava/lang/StackTraceElement;)Z
    .registers 4
    .param p1, "s"    # Ljava/lang/StackTraceElement;

    .prologue
    .line 395
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->isStaticUtilityClass(Ljava/lang/String;)Z
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_7} :catch_34
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_32
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_7} :catch_9

    move-result v0

    .line 402
    :goto_8
    return v0

    .line 398
    :catch_9
    move-exception v0

    .line 400
    :goto_a
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "es"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_22

    .line 401
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "s"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2e

    .line 402
    :cond_22
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Util"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_30

    :cond_2e
    const/4 v0, 0x1

    goto :goto_8

    :cond_30
    const/4 v0, 0x0

    goto :goto_8

    .line 397
    :catch_32
    move-exception v0

    goto :goto_a

    .line 396
    :catch_34
    move-exception v0

    goto :goto_a
.end method

.method private isSynthetic(Ljava/lang/StackTraceElement;)Z
    .registers 4
    .param p1, "s"    # Ljava/lang/StackTraceElement;

    .prologue
    .line 413
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x24

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-le v0, v1, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private isUnknown(Ljava/lang/StackTraceElement;)Z
    .registers 3
    .param p1, "s"    # Ljava/lang/StackTraceElement;

    .prologue
    .line 425
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v0

    if-gez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private static replaceClassName(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 7
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 472
    invoke-static {p0}, Lcom/sun/mail/util/logging/CompactFormatter;->isNullOrSpaces(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_20

    .line 473
    const/4 v2, 0x0

    .line 474
    .local v2, "limit":I
    move-object v0, p1

    .local v0, "c":Ljava/lang/Throwable;
    :goto_8
    if-eqz v0, :cond_20

    .line 475
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 476
    .local v1, "k":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 479
    add-int/lit8 v2, v2, 0x1

    const/high16 v3, 0x10000

    if-ne v2, v3, :cond_21

    .line 484
    .end local v0    # "c":Ljava/lang/Throwable;
    .end local v1    # "k":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "limit":I
    :cond_20
    return-object p0

    .line 474
    .restart local v0    # "c":Ljava/lang/Throwable;
    .restart local v1    # "k":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "limit":I
    :cond_21
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_8
.end method

.method private static replaceClassName(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 8
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "p"    # [Ljava/lang/Object;

    .prologue
    .line 497
    invoke-static {p0}, Lcom/sun/mail/util/logging/CompactFormatter;->isNullOrSpaces(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_23

    if-eqz p1, :cond_23

    .line 498
    array-length v3, p1

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v3, :cond_23

    aget-object v1, p1, v2

    .line 499
    .local v1, "o":Ljava/lang/Object;
    if-eqz v1, :cond_20

    .line 500
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 501
    .local v0, "k":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 498
    .end local v0    # "k":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 505
    .end local v1    # "o":Ljava/lang/Object;
    :cond_23
    return-object p0
.end method

.method private static simpleClassName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 515
    if-eqz p0, :cond_11

    .line 516
    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 517
    .local v0, "index":I
    const/4 v1, -0x1

    if-le v0, v1, :cond_11

    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 519
    .end local v0    # "index":I
    :cond_11
    return-object p0
.end method

.method private static simpleFileName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 530
    if-eqz p0, :cond_10

    .line 531
    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 532
    .local v0, "index":I
    const/4 v1, -0x1

    if-le v0, v1, :cond_10

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 534
    .end local v0    # "index":I
    :cond_10
    return-object p0
.end method


# virtual methods
.method protected apply(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .registers 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 350
    invoke-static {}, Lcom/sun/mail/util/logging/SeverityComparator;->getInstance()Lcom/sun/mail/util/logging/SeverityComparator;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/sun/mail/util/logging/SeverityComparator;->apply(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/logging/LogRecord;)Ljava/lang/String;
    .registers 11
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 131
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getResourceBundle()Ljava/util/ResourceBundle;

    move-result-object v3

    .line 132
    .local v3, "rb":Ljava/util/ResourceBundle;
    if-nez v3, :cond_51

    const/4 v0, 0x0

    .line 134
    .local v0, "l":Ljava/util/Locale;
    :goto_7
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->formatMessage(Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v1

    .line 135
    .local v1, "msg":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->formatThrown(Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v4

    .line 136
    .local v4, "thrown":Ljava/lang/String;
    const/16 v5, 0x8

    new-array v2, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    new-instance v6, Ljava/util/Date;

    .line 137
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getMillis()J

    move-result-wide v7

    invoke-direct {v6, v7, v8}, Ljava/util/Date;-><init>(J)V

    aput-object v6, v2, v5

    const/4 v5, 0x1

    .line 138
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->formatSource(Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v5

    const/4 v5, 0x2

    .line 139
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->formatLoggerName(Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v5

    const/4 v5, 0x3

    .line 140
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->formatLevel(Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v5

    const/4 v5, 0x4

    aput-object v1, v2, v5

    const/4 v5, 0x5

    aput-object v4, v2, v5

    const/4 v5, 0x6

    new-instance v6, Lcom/sun/mail/util/logging/CompactFormatter$Alternate;

    invoke-direct {v6, p0, v1, v4}, Lcom/sun/mail/util/logging/CompactFormatter$Alternate;-><init>(Lcom/sun/mail/util/logging/CompactFormatter;Ljava/lang/String;Ljava/lang/String;)V

    aput-object v6, v2, v5

    const/4 v5, 0x7

    new-instance v6, Lcom/sun/mail/util/logging/CompactFormatter$Alternate;

    invoke-direct {v6, p0, v4, v1}, Lcom/sun/mail/util/logging/CompactFormatter$Alternate;-><init>(Lcom/sun/mail/util/logging/CompactFormatter;Ljava/lang/String;Ljava/lang/String;)V

    aput-object v6, v2, v5

    .line 146
    .local v2, "params":[Ljava/lang/Object;
    iget-object v5, p0, Lcom/sun/mail/util/logging/CompactFormatter;->fmt:Ljava/lang/String;

    invoke-static {v0, v5, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 132
    .end local v0    # "l":Ljava/util/Locale;
    .end local v1    # "msg":Ljava/lang/String;
    .end local v2    # "params":[Ljava/lang/Object;
    .end local v4    # "thrown":Ljava/lang/String;
    :cond_51
    invoke-virtual {v3}, Ljava/util/ResourceBundle;->getLocale()Ljava/util/Locale;

    move-result-object v0

    goto :goto_7
.end method

.method public formatBackTrace(Ljava/util/logging/LogRecord;)Ljava/lang/String;
    .registers 8
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 260
    const-string v3, ""

    .line 261
    .local v3, "site":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getThrown()Ljava/lang/Throwable;

    move-result-object v4

    .line 262
    .local v4, "t":Ljava/lang/Throwable;
    if-eqz v4, :cond_2e

    .line 263
    invoke-virtual {p0, v4}, Lcom/sun/mail/util/logging/CompactFormatter;->apply(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v2

    .line 264
    .local v2, "root":Ljava/lang/Throwable;
    if-eqz v2, :cond_2e

    .line 265
    invoke-virtual {v2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/sun/mail/util/logging/CompactFormatter;->findAndFormat([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    move-result-object v3

    .line 266
    invoke-static {v3}, Lcom/sun/mail/util/logging/CompactFormatter;->isNullOrSpaces(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 267
    const/4 v1, 0x0

    .line 268
    .local v1, "limit":I
    move-object v0, v4

    .local v0, "c":Ljava/lang/Throwable;
    :goto_1e
    if-eqz v0, :cond_2e

    .line 269
    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/sun/mail/util/logging/CompactFormatter;->findAndFormat([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    move-result-object v3

    .line 270
    invoke-static {v3}, Lcom/sun/mail/util/logging/CompactFormatter;->isNullOrSpaces(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2f

    .line 283
    .end local v0    # "c":Ljava/lang/Throwable;
    .end local v1    # "limit":I
    .end local v2    # "root":Ljava/lang/Throwable;
    :cond_2e
    return-object v3

    .line 276
    .restart local v0    # "c":Ljava/lang/Throwable;
    .restart local v1    # "limit":I
    .restart local v2    # "root":Ljava/lang/Throwable;
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    const/high16 v5, 0x10000

    if-eq v1, v5, :cond_2e

    .line 268
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_1e
.end method

.method public formatLevel(Ljava/util/logging/LogRecord;)Ljava/lang/String;
    .registers 3
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 184
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getLevel()Ljava/util/logging/Level;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/logging/Level;->getLocalizedName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public formatLoggerName(Ljava/util/logging/LogRecord;)Ljava/lang/String;
    .registers 3
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 217
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getLoggerName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sun/mail/util/logging/CompactFormatter;->simpleClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public formatMessage(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 173
    if-eqz p1, :cond_f

    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->apply(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->replaceClassName(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    const-string v0, ""

    goto :goto_e
.end method

.method public formatMessage(Ljava/util/logging/LogRecord;)Ljava/lang/String;
    .registers 4
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 158
    invoke-super {p0, p1}, Ljava/util/logging/Formatter;->formatMessage(Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v0

    .line 159
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getThrown()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sun/mail/util/logging/CompactFormatter;->replaceClassName(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    .line 160
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getParameters()[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sun/mail/util/logging/CompactFormatter;->replaceClassName(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 161
    return-object v0
.end method

.method public formatSource(Ljava/util/logging/LogRecord;)Ljava/lang/String;
    .registers 5
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 195
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getSourceClassName()Ljava/lang/String;

    move-result-object v0

    .line 196
    .local v0, "source":Ljava/lang/String;
    if-eqz v0, :cond_31

    .line 197
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getSourceMethodName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2c

    .line 198
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Lcom/sun/mail/util/logging/CompactFormatter;->simpleClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 199
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getSourceMethodName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 206
    :goto_2b
    return-object v0

    .line 201
    :cond_2c
    invoke-static {v0}, Lcom/sun/mail/util/logging/CompactFormatter;->simpleClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2b

    .line 204
    :cond_31
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getLoggerName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/sun/mail/util/logging/CompactFormatter;->simpleClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2b
.end method

.method public formatThrown(Ljava/util/logging/LogRecord;)Ljava/lang/String;
    .registers 9
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 232
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getThrown()Ljava/lang/Throwable;

    move-result-object v3

    .line 233
    .local v3, "t":Ljava/lang/Throwable;
    if-eqz v3, :cond_57

    .line 234
    invoke-virtual {p0, v3}, Lcom/sun/mail/util/logging/CompactFormatter;->apply(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    .line 235
    .local v1, "root":Ljava/lang/Throwable;
    if-eqz v1, :cond_54

    .line 236
    invoke-virtual {p0, v3}, Lcom/sun/mail/util/logging/CompactFormatter;->formatMessage(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    .line 237
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->formatBackTrace(Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v2

    .line 238
    .local v2, "site":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 239
    invoke-static {v2}, Lcom/sun/mail/util/logging/CompactFormatter;->isNullOrSpaces(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_40

    const-string v4, ""

    :goto_37
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 246
    .end local v1    # "root":Ljava/lang/Throwable;
    .end local v2    # "site":Ljava/lang/String;
    :goto_3f
    return-object v0

    .line 239
    .restart local v1    # "root":Ljava/lang/Throwable;
    .restart local v2    # "site":Ljava/lang/String;
    :cond_40
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v6, 0x20

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_37

    .line 241
    .end local v0    # "msg":Ljava/lang/String;
    .end local v2    # "site":Ljava/lang/String;
    :cond_54
    const-string v0, ""

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_3f

    .line 244
    .end local v0    # "msg":Ljava/lang/String;
    .end local v1    # "root":Ljava/lang/Throwable;
    :cond_57
    const-string v0, ""

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_3f
.end method

.method protected ignore(Ljava/lang/StackTraceElement;)Z
    .registers 3
    .param p1, "s"    # Ljava/lang/StackTraceElement;

    .prologue
    .line 361
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->isUnknown(Ljava/lang/StackTraceElement;)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/CompactFormatter;->defaultIgnore(Ljava/lang/StackTraceElement;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected toAlternate(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 372
    if-eqz p1, :cond_b

    const-string v0, "[\\x00-\\x1F\\x7F]+"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
