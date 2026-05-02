.class public Lkorex/mail/internet/MailDateFormat;
.super Ljava/text/SimpleDateFormat;
.source "MailDateFormat.java"


# static fields
.field private static final cal:Ljava/util/Calendar;

.field static debug:Z = false

.field private static logger:Lcom/sun/mail/util/MailLogger; = null

.field private static final serialVersionUID:J = -0x711451d5f59c82abL


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 257
    const/4 v0, 0x0

    sput-boolean v0, Lkorex/mail/internet/MailDateFormat;->debug:Z

    .line 258
    new-instance v0, Lcom/sun/mail/util/MailLogger;

    const-class v1, Lkorex/mail/internet/MailDateFormat;

    const-string v2, "DEBUG"

    sget-boolean v3, Lkorex/mail/internet/MailDateFormat;->debug:Z

    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;ZLjava/io/PrintStream;)V

    sput-object v0, Lkorex/mail/internet/MailDateFormat;->logger:Lcom/sun/mail/util/MailLogger;

    .line 349
    new-instance v0, Ljava/util/GregorianCalendar;

    const-string v1, "GMT"

    .line 350
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    sput-object v0, Lkorex/mail/internet/MailDateFormat;->cal:Ljava/util/Calendar;

    .line 349
    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 144
    const-string v0, "EEE, d MMM yyyy HH:mm:ss \'XXXXX\' (z)"

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {p0, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 145
    return-void
.end method

.method private static declared-synchronized ourUTC(IIIIIIIZ)Ljava/util/Date;
    .registers 11
    .param p0, "year"    # I
    .param p1, "mon"    # I
    .param p2, "mday"    # I
    .param p3, "hour"    # I
    .param p4, "min"    # I
    .param p5, "sec"    # I
    .param p6, "tzoffset"    # I
    .param p7, "lenient"    # Z

    .prologue
    .line 355
    const-class v1, Lkorex/mail/internet/MailDateFormat;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lkorex/mail/internet/MailDateFormat;->cal:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    .line 356
    sget-object v0, Lkorex/mail/internet/MailDateFormat;->cal:Ljava/util/Calendar;

    invoke-virtual {v0, p7}, Ljava/util/Calendar;->setLenient(Z)V

    .line 357
    sget-object v0, Lkorex/mail/internet/MailDateFormat;->cal:Ljava/util/Calendar;

    const/4 v2, 0x1

    invoke-virtual {v0, v2, p0}, Ljava/util/Calendar;->set(II)V

    .line 358
    sget-object v0, Lkorex/mail/internet/MailDateFormat;->cal:Ljava/util/Calendar;

    const/4 v2, 0x2

    invoke-virtual {v0, v2, p1}, Ljava/util/Calendar;->set(II)V

    .line 359
    sget-object v0, Lkorex/mail/internet/MailDateFormat;->cal:Ljava/util/Calendar;

    const/4 v2, 0x5

    invoke-virtual {v0, v2, p2}, Ljava/util/Calendar;->set(II)V

    .line 360
    sget-object v0, Lkorex/mail/internet/MailDateFormat;->cal:Ljava/util/Calendar;

    const/16 v2, 0xb

    invoke-virtual {v0, v2, p3}, Ljava/util/Calendar;->set(II)V

    .line 361
    sget-object v0, Lkorex/mail/internet/MailDateFormat;->cal:Ljava/util/Calendar;

    const/16 v2, 0xc

    invoke-virtual {v0, v2, p4}, Ljava/util/Calendar;->set(II)V

    .line 362
    sget-object v0, Lkorex/mail/internet/MailDateFormat;->cal:Ljava/util/Calendar;

    const/16 v2, 0xc

    invoke-virtual {v0, v2, p6}, Ljava/util/Calendar;->add(II)V

    .line 363
    sget-object v0, Lkorex/mail/internet/MailDateFormat;->cal:Ljava/util/Calendar;

    const/16 v2, 0xd

    invoke-virtual {v0, v2, p5}, Ljava/util/Calendar;->set(II)V

    .line 365
    sget-object v0, Lkorex/mail/internet/MailDateFormat;->cal:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    :try_end_40
    .catchall {:try_start_3 .. :try_end_40} :catchall_43

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 355
    :catchall_43
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static parseDate([CLjava/text/ParsePosition;Z)Ljava/util/Date;
    .registers 19
    .param p0, "orig"    # [C
    .param p1, "pos"    # Ljava/text/ParsePosition;
    .param p2, "lenient"    # Z

    .prologue
    .line 270
    const/4 v3, -0x1

    .line 271
    .local v3, "day":I
    const/4 v2, -0x1

    .line 272
    .local v2, "month":I
    const/4 v1, -0x1

    .line 273
    .local v1, "year":I
    const/4 v4, 0x0

    .line 274
    .local v4, "hours":I
    const/4 v5, 0x0

    .line 275
    .local v5, "minutes":I
    const/4 v6, 0x0

    .line 276
    .local v6, "seconds":I
    const/4 v7, 0x0

    .line 278
    .local v7, "offset":I
    :try_start_7
    new-instance v11, Lkorex/mail/internet/MailDateParser;

    invoke-virtual/range {p1 .. p1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v8

    move-object/from16 v0, p0

    invoke-direct {v11, v0, v8}, Lkorex/mail/internet/MailDateParser;-><init>([CI)V

    .line 281
    .local v11, "p":Lkorex/mail/internet/MailDateParser;
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->skipUntilNumber()V

    .line 282
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->parseNumber()I

    move-result v3

    .line 284
    const/16 v8, 0x2d

    invoke-virtual {v11, v8}, Lkorex/mail/internet/MailDateParser;->skipIfChar(C)Z

    move-result v8

    if-nez v8, :cond_24

    .line 285
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->skipWhiteSpace()V

    .line 289
    :cond_24
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->parseMonth()I

    move-result v2

    .line 290
    const/16 v8, 0x2d

    invoke-virtual {v11, v8}, Lkorex/mail/internet/MailDateParser;->skipIfChar(C)Z

    move-result v8

    if-nez v8, :cond_33

    .line 291
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->skipWhiteSpace()V

    .line 295
    :cond_33
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->parseNumber()I

    move-result v1

    .line 296
    const/16 v8, 0x32

    if-ge v1, v8, :cond_70

    .line 297
    add-int/lit16 v1, v1, 0x7d0

    .line 305
    :cond_3d
    :goto_3d
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->skipWhiteSpace()V

    .line 306
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->parseNumber()I

    move-result v4

    .line 309
    const/16 v8, 0x3a

    invoke-virtual {v11, v8}, Lkorex/mail/internet/MailDateParser;->skipChar(C)V

    .line 310
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->parseNumber()I

    move-result v5

    .line 313
    const/16 v8, 0x3a

    invoke-virtual {v11, v8}, Lkorex/mail/internet/MailDateParser;->skipIfChar(C)Z

    move-result v8

    if-eqz v8, :cond_59

    .line 314
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->parseNumber()I
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_58} :catch_a8

    move-result v6

    .line 320
    :cond_59
    :try_start_59
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->skipWhiteSpace()V

    .line 321
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->parseTimeZone()I
    :try_end_5f
    .catch Ljava/text/ParseException; {:try_start_59 .. :try_end_5f} :catch_77
    .catch Ljava/lang/Exception; {:try_start_59 .. :try_end_5f} :catch_a8

    move-result v7

    .line 329
    :cond_60
    :goto_60
    :try_start_60
    invoke-virtual {v11}, Lkorex/mail/internet/MailDateParser;->getIndex()I

    move-result v8

    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Ljava/text/ParsePosition;->setIndex(I)V

    move/from16 v8, p2

    .line 330
    invoke-static/range {v1 .. v8}, Lkorex/mail/internet/MailDateFormat;->ourUTC(IIIIIIIZ)Ljava/util/Date;

    move-result-object v9

    .line 345
    .end local v11    # "p":Lkorex/mail/internet/MailDateParser;
    :goto_6f
    return-object v9

    .line 298
    .restart local v11    # "p":Lkorex/mail/internet/MailDateParser;
    :cond_70
    const/16 v8, 0x64

    if-ge v1, v8, :cond_3d

    .line 299
    add-int/lit16 v1, v1, 0x76c

    goto :goto_3d

    .line 322
    :catch_77
    move-exception v12

    .line 323
    .local v12, "pe":Ljava/text/ParseException;
    sget-object v8, Lkorex/mail/internet/MailDateFormat;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v13, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v8, v13}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v8

    if-eqz v8, :cond_60

    .line 324
    sget-object v8, Lkorex/mail/internet/MailDateFormat;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v13, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "No timezone? : \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    new-instance v15, Ljava/lang/String;

    invoke-direct/range {v15 .. v16}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v13, v14, v12}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a7
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_a7} :catch_a8

    goto :goto_60

    .line 334
    .end local v11    # "p":Lkorex/mail/internet/MailDateParser;
    .end local v12    # "pe":Ljava/text/ParseException;
    :catch_a8
    move-exception v10

    .line 340
    .local v10, "e":Ljava/lang/Exception;
    sget-object v8, Lkorex/mail/internet/MailDateFormat;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v13, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v8, v13}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v8

    if-eqz v8, :cond_d8

    .line 341
    sget-object v8, Lkorex/mail/internet/MailDateFormat;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v13, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Bad date: \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    new-instance v15, Ljava/lang/String;

    invoke-direct/range {v15 .. v16}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v13, v14, v10}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 344
    :cond_d8
    const/4 v8, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 345
    const/4 v9, 0x0

    goto :goto_6f
.end method


# virtual methods
.method public format(Ljava/util/Date;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;
    .registers 15
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "dateStrBuf"    # Ljava/lang/StringBuffer;
    .param p3, "fieldPosition"    # Ljava/text/FieldPosition;

    .prologue
    const/16 v10, 0xa

    .line 168
    invoke-virtual {p2}, Ljava/lang/StringBuffer;->length()I

    move-result v6

    .line 169
    .local v6, "start":I
    invoke-super {p0, p1, p2, p3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;

    .line 170
    const/4 v3, 0x0

    .line 173
    .local v3, "pos":I
    add-int/lit8 v3, v6, 0x19

    :goto_c
    invoke-virtual {p2, v3}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v7

    const/16 v8, 0x58

    if-eq v7, v8, :cond_17

    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 177
    :cond_17
    iget-object v7, p0, Lkorex/mail/internet/MailDateFormat;->calendar:Ljava/util/Calendar;

    invoke-virtual {v7}, Ljava/util/Calendar;->clear()V

    .line 178
    iget-object v7, p0, Lkorex/mail/internet/MailDateFormat;->calendar:Ljava/util/Calendar;

    invoke-virtual {v7, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 179
    iget-object v7, p0, Lkorex/mail/internet/MailDateFormat;->calendar:Ljava/util/Calendar;

    const/16 v8, 0xf

    invoke-virtual {v7, v8}, Ljava/util/Calendar;->get(I)I

    move-result v7

    iget-object v8, p0, Lkorex/mail/internet/MailDateFormat;->calendar:Ljava/util/Calendar;

    const/16 v9, 0x10

    .line 180
    invoke-virtual {v8, v9}, Ljava/util/Calendar;->get(I)I

    move-result v8

    add-int v0, v7, v8

    .line 182
    .local v0, "offset":I
    if-gez v0, :cond_73

    .line 183
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .local v4, "pos":I
    const/16 v7, 0x2d

    invoke-virtual {p2, v3, v7}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 184
    neg-int v0, v0

    move v3, v4

    .line 188
    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    :goto_3e
    div-int/lit8 v7, v0, 0x3c

    div-int/lit16 v5, v7, 0x3e8

    .line 189
    .local v5, "rawOffsetInMins":I
    div-int/lit8 v1, v5, 0x3c

    .line 190
    .local v1, "offsetInHrs":I
    rem-int/lit8 v2, v5, 0x3c

    .line 192
    .local v2, "offsetInMins":I
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .restart local v4    # "pos":I
    div-int/lit8 v7, v1, 0xa

    invoke-static {v7, v10}, Ljava/lang/Character;->forDigit(II)C

    move-result v7

    invoke-virtual {p2, v3, v7}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 193
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    rem-int/lit8 v7, v1, 0xa

    invoke-static {v7, v10}, Ljava/lang/Character;->forDigit(II)C

    move-result v7

    invoke-virtual {p2, v4, v7}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 194
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .restart local v4    # "pos":I
    div-int/lit8 v7, v2, 0xa

    invoke-static {v7, v10}, Ljava/lang/Character;->forDigit(II)C

    move-result v7

    invoke-virtual {p2, v3, v7}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 195
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    rem-int/lit8 v7, v2, 0xa

    invoke-static {v7, v10}, Ljava/lang/Character;->forDigit(II)C

    move-result v7

    invoke-virtual {p2, v4, v7}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 198
    return-object p2

    .line 186
    .end local v1    # "offsetInHrs":I
    .end local v2    # "offsetInMins":I
    .end local v5    # "rawOffsetInMins":I
    :cond_73
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .restart local v4    # "pos":I
    const/16 v7, 0x2b

    invoke-virtual {p2, v3, v7}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    move v3, v4

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    goto :goto_3e
.end method

.method public parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;
    .registers 5
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .prologue
    .line 213
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-virtual {p0}, Lkorex/mail/internet/MailDateFormat;->isLenient()Z

    move-result v1

    invoke-static {v0, p2, v1}, Lkorex/mail/internet/MailDateFormat;->parseDate([CLjava/text/ParsePosition;Z)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public setCalendar(Ljava/util/Calendar;)V
    .registers 4
    .param p1, "newCalendar"    # Ljava/util/Calendar;

    .prologue
    .line 373
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Method setCalendar() shouldn\'t be called"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setNumberFormat(Ljava/text/NumberFormat;)V
    .registers 4
    .param p1, "newNumberFormat"    # Ljava/text/NumberFormat;

    .prologue
    .line 378
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Method setNumberFormat() shouldn\'t be called"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
