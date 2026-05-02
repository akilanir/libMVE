.class public Lcom/sun/mail/util/logging/CollectorFormatter;
.super Ljava/util/logging/Formatter;
.source "CollectorFormatter.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final INIT_TIME:J


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<-",
            "Ljava/util/logging/LogRecord;",
            ">;"
        }
    .end annotation
.end field

.field private count:J

.field private final fmt:Ljava/lang/String;

.field private final formatter:Ljava/util/logging/Formatter;

.field private last:Ljava/util/logging/LogRecord;

.field private maxMillis:J

.field private minMillis:J

.field private thrown:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 86
    const-class v0, Lcom/sun/mail/util/logging/CollectorFormatter;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/util/logging/CollectorFormatter;->$assertionsDisabled:Z

    .line 91
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/sun/mail/util/logging/CollectorFormatter;->INIT_TIME:J

    return-void

    .line 86
    :cond_12
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/util/logging/Formatter;-><init>()V

    .line 135
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "p":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CollectorFormatter;->initFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->fmt:Ljava/lang/String;

    .line 137
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CollectorFormatter;->initFormatter(Ljava/lang/String;)Ljava/util/logging/Formatter;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->formatter:Ljava/util/logging/Formatter;

    .line 138
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CollectorFormatter;->initComparator(Ljava/lang/String;)Ljava/util/Comparator;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->comparator:Ljava/util/Comparator;

    .line 139
    invoke-direct {p0}, Lcom/sun/mail/util/logging/CollectorFormatter;->reset()V

    .line 140
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 151
    invoke-direct {p0}, Ljava/util/logging/Formatter;-><init>()V

    .line 152
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 153
    .local v0, "p":Ljava/lang/String;
    if-nez p1, :cond_11

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CollectorFormatter;->initFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .end local p1    # "format":Ljava/lang/String;
    :cond_11
    iput-object p1, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->fmt:Ljava/lang/String;

    .line 154
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CollectorFormatter;->initFormatter(Ljava/lang/String;)Ljava/util/logging/Formatter;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->formatter:Ljava/util/logging/Formatter;

    .line 155
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CollectorFormatter;->initComparator(Ljava/lang/String;)Ljava/util/Comparator;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->comparator:Ljava/util/Comparator;

    .line 156
    invoke-direct {p0}, Lcom/sun/mail/util/logging/CollectorFormatter;->reset()V

    .line 157
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/logging/Formatter;Ljava/util/Comparator;)V
    .registers 6
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "f"    # Ljava/util/logging/Formatter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/logging/Formatter;",
            "Ljava/util/Comparator",
            "<-",
            "Ljava/util/logging/LogRecord;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 173
    .local p3, "c":Ljava/util/Comparator;, "Ljava/util/Comparator<-Ljava/util/logging/LogRecord;>;"
    invoke-direct {p0}, Ljava/util/logging/Formatter;-><init>()V

    .line 174
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 175
    .local v0, "p":Ljava/lang/String;
    if-nez p1, :cond_11

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/CollectorFormatter;->initFormat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .end local p1    # "format":Ljava/lang/String;
    :cond_11
    iput-object p1, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->fmt:Ljava/lang/String;

    .line 176
    iput-object p2, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->formatter:Ljava/util/logging/Formatter;

    .line 177
    iput-object p3, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->comparator:Ljava/util/Comparator;

    .line 178
    invoke-direct {p0}, Lcom/sun/mail/util/logging/CollectorFormatter;->reset()V

    .line 179
    return-void
.end method

.method private declared-synchronized accept(Ljava/util/logging/LogRecord;)V
    .registers 8
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    const-wide/16 v4, 0x1

    .line 305
    monitor-enter p0

    :try_start_3
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getMillis()J

    move-result-wide v0

    .line 306
    .local v0, "millis":J
    iget-wide v2, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->minMillis:J

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->minMillis:J

    .line 307
    iget-wide v2, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->maxMillis:J

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->maxMillis:J

    .line 308
    iget-wide v2, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->count:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->count:J

    .line 309
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getThrown()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_27

    .line 310
    iget-wide v2, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->thrown:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->thrown:J
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_29

    .line 312
    :cond_27
    monitor-exit p0

    return-void

    .line 305
    .end local v0    # "millis":J
    :catchall_29
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private declared-synchronized acceptAndUpdate(Ljava/util/logging/LogRecord;Ljava/util/logging/LogRecord;)Z
    .registers 4
    .param p1, "e"    # Ljava/util/logging/LogRecord;
    .param p2, "u"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 421
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->last:Ljava/util/logging/LogRecord;

    if-ne p1, v0, :cond_d

    .line 422
    invoke-direct {p0, p2}, Lcom/sun/mail/util/logging/CollectorFormatter;->accept(Ljava/util/logging/LogRecord;)V

    .line 423
    iput-object p2, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->last:Ljava/util/logging/LogRecord;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_f

    .line 424
    const/4 v0, 0x1

    .line 426
    :goto_b
    monitor-exit p0

    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_b

    .line 421
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private formatRecord(Ljava/util/logging/Handler;Z)Ljava/lang/String;
    .registers 25
    .param p1, "h"    # Ljava/util/logging/Handler;
    .param p2, "reset"    # Z

    .prologue
    .line 340
    monitor-enter p0

    .line 341
    :try_start_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/util/logging/CollectorFormatter;->last:Ljava/util/logging/LogRecord;

    .line 342
    .local v14, "record":Ljava/util/logging/LogRecord;
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/sun/mail/util/logging/CollectorFormatter;->count:J

    .line 343
    .local v2, "c":J
    move-object/from16 v0, p0

    iget-wide v15, v0, Lcom/sun/mail/util/logging/CollectorFormatter;->thrown:J

    .line 344
    .local v15, "t":J
    move-object/from16 v0, p0

    iget-wide v11, v0, Lcom/sun/mail/util/logging/CollectorFormatter;->minMillis:J

    .line 345
    .local v11, "msl":J
    move-object/from16 v0, p0

    iget-wide v9, v0, Lcom/sun/mail/util/logging/CollectorFormatter;->maxMillis:J

    .line 347
    .local v9, "msh":J
    if-eqz p2, :cond_1a

    .line 348
    invoke-direct/range {p0 .. p0}, Lcom/sun/mail/util/logging/CollectorFormatter;->reset()V

    .line 350
    :cond_1a
    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_bf

    .line 352
    const-wide/16 v18, 0x0

    cmp-long v18, v2, v18

    if-nez v18, :cond_27

    .line 353
    sget-wide v11, Lcom/sun/mail/util/logging/CollectorFormatter;->INIT_TIME:J

    .line 354
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 360
    :cond_27
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/util/logging/CollectorFormatter;->formatter:Ljava/util/logging/Formatter;

    .line 361
    .local v4, "f":Ljava/util/logging/Formatter;
    if-eqz v4, :cond_c9

    .line 362
    monitor-enter v4

    .line 363
    :try_start_2e
    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/util/logging/Formatter;->getHead(Ljava/util/logging/Handler;)Ljava/lang/String;

    move-result-object v5

    .line 364
    .local v5, "head":Ljava/lang/String;
    if-eqz v14, :cond_c2

    invoke-virtual {v4, v14}, Ljava/util/logging/Formatter;->format(Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v8

    .line 365
    .local v8, "msg":Ljava/lang/String;
    :goto_3a
    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/util/logging/Formatter;->getTail(Ljava/util/logging/Handler;)Ljava/lang/String;

    move-result-object v17

    .line 366
    .local v17, "tail":Ljava/lang/String;
    monitor-exit v4
    :try_end_41
    .catchall {:try_start_2e .. :try_end_41} :catchall_c6

    .line 371
    :goto_41
    const/4 v6, 0x0

    .line 372
    .local v6, "l":Ljava/util/Locale;
    if-eqz v14, :cond_4b

    .line 373
    invoke-virtual {v14}, Ljava/util/logging/LogRecord;->getResourceBundle()Ljava/util/ResourceBundle;

    move-result-object v13

    .line 374
    .local v13, "rb":Ljava/util/ResourceBundle;
    if-nez v13, :cond_d1

    const/4 v6, 0x0

    .line 378
    .end local v13    # "rb":Ljava/util/ResourceBundle;
    :cond_4b
    :goto_4b
    if-nez v6, :cond_d7

    .line 379
    new-instance v7, Ljava/text/MessageFormat;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/CollectorFormatter;->fmt:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-direct {v7, v0}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    .line 387
    .local v7, "mf":Ljava/text/MessageFormat;
    :goto_5a
    const/16 v18, 0x9

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/sun/mail/util/logging/CollectorFormatter;->finish(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/sun/mail/util/logging/CollectorFormatter;->finish(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/logging/CollectorFormatter;->finish(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x3

    .line 388
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x4

    const-wide/16 v20, 0x1

    sub-long v20, v2, v20

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x5

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x6

    sub-long v20, v2, v15

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x7

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x8

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    aput-object v20, v18, v19

    .line 387
    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Ljava/text/MessageFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    return-object v18

    .line 350
    .end local v2    # "c":J
    .end local v4    # "f":Ljava/util/logging/Formatter;
    .end local v5    # "head":Ljava/lang/String;
    .end local v6    # "l":Ljava/util/Locale;
    .end local v7    # "mf":Ljava/text/MessageFormat;
    .end local v8    # "msg":Ljava/lang/String;
    .end local v9    # "msh":J
    .end local v11    # "msl":J
    .end local v14    # "record":Ljava/util/logging/LogRecord;
    .end local v15    # "t":J
    .end local v17    # "tail":Ljava/lang/String;
    :catchall_bf
    move-exception v18

    :try_start_c0
    monitor-exit p0
    :try_end_c1
    .catchall {:try_start_c0 .. :try_end_c1} :catchall_bf

    throw v18

    .line 364
    .restart local v2    # "c":J
    .restart local v4    # "f":Ljava/util/logging/Formatter;
    .restart local v5    # "head":Ljava/lang/String;
    .restart local v9    # "msh":J
    .restart local v11    # "msl":J
    .restart local v14    # "record":Ljava/util/logging/LogRecord;
    .restart local v15    # "t":J
    :cond_c2
    :try_start_c2
    const-string v8, ""

    goto/16 :goto_3a

    .line 366
    .end local v5    # "head":Ljava/lang/String;
    :catchall_c6
    move-exception v18

    monitor-exit v4
    :try_end_c8
    .catchall {:try_start_c2 .. :try_end_c8} :catchall_c6

    throw v18

    .line 368
    :cond_c9
    const-string v17, ""

    .restart local v17    # "tail":Ljava/lang/String;
    move-object/from16 v8, v17

    .restart local v8    # "msg":Ljava/lang/String;
    move-object/from16 v5, v17

    .restart local v5    # "head":Ljava/lang/String;
    goto/16 :goto_41

    .line 374
    .restart local v6    # "l":Ljava/util/Locale;
    .restart local v13    # "rb":Ljava/util/ResourceBundle;
    :cond_d1
    invoke-virtual {v13}, Ljava/util/ResourceBundle;->getLocale()Ljava/util/Locale;

    move-result-object v6

    goto/16 :goto_4b

    .line 381
    .end local v13    # "rb":Ljava/util/ResourceBundle;
    :cond_d7
    new-instance v7, Ljava/text/MessageFormat;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/CollectorFormatter;->fmt:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-direct {v7, v0, v6}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .restart local v7    # "mf":Ljava/text/MessageFormat;
    goto/16 :goto_5a
.end method

.method private initComparator(Ljava/lang/String;)Ljava/util/Comparator;
    .registers 10
    .param p1, "p"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Comparator",
            "<-",
            "Ljava/util/logging/LogRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 490
    invoke-static {}, Lcom/sun/mail/util/logging/LogManagerProperties;->getLogManager()Ljava/util/logging/LogManager;

    move-result-object v2

    .line 492
    .local v2, "m":Ljava/util/logging/LogManager;
    const-string v6, ".comparator"

    invoke-virtual {p1, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 493
    .local v3, "name":Ljava/lang/String;
    const-string v6, ".comparator.reverse"

    invoke-virtual {p1, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 495
    .local v5, "reverse":Ljava/lang/String;
    if-eqz v3, :cond_58

    :try_start_1a
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_58

    .line 496
    const-string v6, "null"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_45

    .line 497
    invoke-static {v3}, Lcom/sun/mail/util/logging/LogManagerProperties;->newComparator(Ljava/lang/String;)Ljava/util/Comparator;

    move-result-object v0

    .line 498
    .local v0, "c":Ljava/util/Comparator;, "Ljava/util/Comparator<-Ljava/util/logging/LogRecord;>;"
    invoke-static {v5}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_44

    .line 499
    sget-boolean v6, Lcom/sun/mail/util/logging/CollectorFormatter;->$assertionsDisabled:Z

    if-nez v6, :cond_40

    if-nez v0, :cond_40

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6
    :try_end_3e
    .catch Ljava/lang/RuntimeException; {:try_start_1a .. :try_end_3e} :catch_3e
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_3e} :catch_4f

    .line 519
    .end local v0    # "c":Ljava/util/Comparator;, "Ljava/util/Comparator<-Ljava/util/logging/LogRecord;>;"
    :catch_3e
    move-exception v4

    .line 520
    .local v4, "re":Ljava/lang/RuntimeException;
    throw v4

    .line 500
    .end local v4    # "re":Ljava/lang/RuntimeException;
    .restart local v0    # "c":Ljava/util/Comparator;, "Ljava/util/Comparator<-Ljava/util/logging/LogRecord;>;"
    :cond_40
    :try_start_40
    invoke-static {v0}, Lcom/sun/mail/util/logging/LogManagerProperties;->reverseOrder(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v0

    .line 524
    :cond_44
    :goto_44
    return-object v0

    .line 503
    .end local v0    # "c":Ljava/util/Comparator;, "Ljava/util/Comparator<-Ljava/util/logging/LogRecord;>;"
    :cond_45
    if-eqz v5, :cond_56

    .line 504
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "No comparator to reverse."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_4f
    .catch Ljava/lang/RuntimeException; {:try_start_40 .. :try_end_4f} :catch_3e
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_4f} :catch_4f

    .line 521
    :catch_4f
    move-exception v1

    .line 522
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-direct {v6, v1}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 507
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_56
    const/4 v0, 0x0

    .restart local v0    # "c":Ljava/util/Comparator;, "Ljava/util/Comparator<-Ljava/util/logging/LogRecord;>;"
    goto :goto_44

    .line 511
    .end local v0    # "c":Ljava/util/Comparator;, "Ljava/util/Comparator<-Ljava/util/logging/LogRecord;>;"
    :cond_58
    if-eqz v5, :cond_62

    .line 512
    :try_start_5a
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "No comparator to reverse."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 516
    :cond_62
    const-class v6, Ljava/util/Comparator;

    invoke-static {}, Lcom/sun/mail/util/logging/SeverityComparator;->getInstance()Lcom/sun/mail/util/logging/SeverityComparator;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Comparator;
    :try_end_6e
    .catch Ljava/lang/RuntimeException; {:try_start_5a .. :try_end_6e} :catch_3e
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_6e} :catch_4f

    .restart local v0    # "c":Ljava/util/Comparator;, "Ljava/util/Comparator<-Ljava/util/logging/LogRecord;>;"
    goto :goto_44
.end method

.method private initFormat(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 438
    invoke-static {}, Lcom/sun/mail/util/logging/LogManagerProperties;->getLogManager()Ljava/util/logging/LogManager;

    move-result-object v0

    .line 439
    .local v0, "m":Ljava/util/logging/LogManager;
    const-string v2, ".format"

    invoke-virtual {p1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 440
    .local v1, "v":Ljava/lang/String;
    if-eqz v1, :cond_16

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_18

    .line 441
    :cond_16
    const-string v1, "{0}{1}{2}{4,choice,-1#|0#|0<... {4,number,integer} more}\n"

    .line 443
    :cond_18
    return-object v1
.end method

.method private initFormatter(Ljava/lang/String;)Ljava/util/logging/Formatter;
    .registers 9
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 455
    invoke-static {}, Lcom/sun/mail/util/logging/LogManagerProperties;->getLogManager()Ljava/util/logging/LogManager;

    move-result-object v2

    .line 457
    .local v2, "m":Ljava/util/logging/LogManager;
    const-string v5, ".formatter"

    invoke-virtual {p1, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 458
    .local v4, "v":Ljava/lang/String;
    if-eqz v4, :cond_2e

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_2e

    .line 459
    const-string v5, "null"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2c

    .line 461
    :try_start_1e
    invoke-static {v4}, Lcom/sun/mail/util/logging/LogManagerProperties;->newFormatter(Ljava/lang/String;)Ljava/util/logging/Formatter;
    :try_end_21
    .catch Ljava/lang/RuntimeException; {:try_start_1e .. :try_end_21} :catch_23
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_21} :catch_25

    move-result-object v1

    .line 474
    .local v1, "f":Ljava/util/logging/Formatter;
    :goto_22
    return-object v1

    .line 462
    .end local v1    # "f":Ljava/util/logging/Formatter;
    :catch_23
    move-exception v3

    .line 463
    .local v3, "re":Ljava/lang/RuntimeException;
    throw v3

    .line 464
    .end local v3    # "re":Ljava/lang/RuntimeException;
    :catch_25
    move-exception v0

    .line 465
    .local v0, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-direct {v5, v0}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 468
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2c
    const/4 v1, 0x0

    .restart local v1    # "f":Ljava/util/logging/Formatter;
    goto :goto_22

    .line 472
    .end local v1    # "f":Ljava/util/logging/Formatter;
    :cond_2e
    const-class v5, Ljava/util/logging/Formatter;

    new-instance v6, Lcom/sun/mail/util/logging/CompactFormatter;

    invoke-direct {v6}, Lcom/sun/mail/util/logging/CompactFormatter;-><init>()V

    invoke-virtual {v5, v6}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/logging/Formatter;

    .restart local v1    # "f":Ljava/util/logging/Formatter;
    goto :goto_22
.end method

.method private declared-synchronized peek()Ljava/util/logging/LogRecord;
    .registers 2

    .prologue
    .line 409
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->last:Ljava/util/logging/LogRecord;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized reset()V
    .registers 3

    .prologue
    .line 318
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->last:Ljava/util/logging/LogRecord;

    .line 319
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->count:J

    .line 320
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->thrown:J

    .line 321
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->minMillis:J

    .line 322
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->maxMillis:J
    :try_end_17
    .catchall {:try_start_2 .. :try_end_17} :catchall_19

    .line 323
    monitor-exit p0

    return-void

    .line 318
    :catchall_19
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method protected apply(Ljava/util/logging/LogRecord;Ljava/util/logging/LogRecord;)Ljava/util/logging/LogRecord;
    .registers 4
    .param p1, "t"    # Ljava/util/logging/LogRecord;
    .param p2, "u"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 288
    if-eqz p1, :cond_4

    if-nez p2, :cond_a

    .line 289
    :cond_4
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 292
    :cond_a
    iget-object v0, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->comparator:Ljava/util/Comparator;

    if-eqz v0, :cond_19

    .line 293
    iget-object v0, p0, Lcom/sun/mail/util/logging/CollectorFormatter;->comparator:Ljava/util/Comparator;

    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_17

    .line 295
    .end local p1    # "t":Ljava/util/logging/LogRecord;
    :goto_16
    return-object p1

    .restart local p1    # "t":Ljava/util/logging/LogRecord;
    :cond_17
    move-object p1, p2

    .line 293
    goto :goto_16

    :cond_19
    move-object p1, p2

    .line 295
    goto :goto_16
.end method

.method protected finish(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 400
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/logging/LogRecord;)Ljava/lang/String;
    .registers 6
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 192
    if-nez p1, :cond_8

    .line 193
    new-instance v3, Ljava/lang/NullPointerException;

    invoke-direct {v3}, Ljava/lang/NullPointerException;-><init>()V

    throw v3

    .line 198
    :cond_8
    invoke-direct {p0}, Lcom/sun/mail/util/logging/CollectorFormatter;->peek()Ljava/util/logging/LogRecord;

    move-result-object v1

    .line 200
    .local v1, "peek":Ljava/util/logging/LogRecord;
    if-eqz v1, :cond_21

    move-object v3, v1

    :goto_f
    invoke-virtual {p0, v3, p1}, Lcom/sun/mail/util/logging/CollectorFormatter;->apply(Ljava/util/logging/LogRecord;Ljava/util/logging/LogRecord;)Ljava/util/logging/LogRecord;

    move-result-object v2

    .line 201
    .local v2, "update":Ljava/util/logging/LogRecord;
    if-eq v1, v2, :cond_23

    .line 202
    invoke-virtual {v2}, Ljava/util/logging/LogRecord;->getSourceMethodName()Ljava/lang/String;

    .line 203
    invoke-direct {p0, v1, v2}, Lcom/sun/mail/util/logging/CollectorFormatter;->acceptAndUpdate(Ljava/util/logging/LogRecord;Ljava/util/logging/LogRecord;)Z

    move-result v0

    .line 208
    .local v0, "accepted":Z
    :goto_1c
    if-eqz v0, :cond_8

    .line 209
    const-string v3, ""

    return-object v3

    .end local v0    # "accepted":Z
    .end local v2    # "update":Ljava/util/logging/LogRecord;
    :cond_21
    move-object v3, p1

    .line 200
    goto :goto_f

    .line 205
    .restart local v2    # "update":Ljava/util/logging/LogRecord;
    :cond_23
    const/4 v0, 0x1

    .line 206
    .restart local v0    # "accepted":Z
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/CollectorFormatter;->accept(Ljava/util/logging/LogRecord;)V

    goto :goto_1c
.end method

.method public getTail(Ljava/util/logging/Handler;)Ljava/lang/String;
    .registers 3
    .param p1, "h"    # Ljava/util/logging/Handler;

    .prologue
    .line 257
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/util/logging/CollectorFormatter;->formatRecord(Ljava/util/logging/Handler;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 271
    const/4 v2, 0x0

    :try_start_1
    check-cast v2, Ljava/util/logging/Handler;

    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Lcom/sun/mail/util/logging/CollectorFormatter;->formatRecord(Ljava/util/logging/Handler;Z)Ljava/lang/String;
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_7} :catch_9

    move-result-object v1

    .line 275
    .local v1, "result":Ljava/lang/String;
    :goto_8
    return-object v1

    .line 272
    .end local v1    # "result":Ljava/lang/String;
    :catch_9
    move-exception v0

    .line 273
    .local v0, "ignore":Ljava/lang/RuntimeException;
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "result":Ljava/lang/String;
    goto :goto_8
.end method
