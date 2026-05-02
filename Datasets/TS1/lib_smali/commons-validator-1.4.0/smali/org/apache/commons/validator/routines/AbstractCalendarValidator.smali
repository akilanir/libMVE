.class public abstract Lorg/apache/commons/validator/routines/AbstractCalendarValidator;
.super Lorg/apache/commons/validator/routines/AbstractFormatValidator;
.source "AbstractCalendarValidator.java"


# static fields
.field private static final serialVersionUID:J = -0x13915b56a1570bb3L


# instance fields
.field private final dateStyle:I

.field private final timeStyle:I


# direct methods
.method public constructor <init>(ZII)V
    .registers 4
    .param p1, "strict"    # Z
    .param p2, "dateStyle"    # I
    .param p3, "timeStyle"    # I

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/apache/commons/validator/routines/AbstractFormatValidator;-><init>(Z)V

    .line 55
    iput p2, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->dateStyle:I

    .line 56
    iput p3, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->timeStyle:I

    .line 57
    return-void
.end method

.method private calculateCompareResult(Ljava/util/Calendar;Ljava/util/Calendar;I)I
    .registers 7
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;
    .param p3, "field"    # I

    .prologue
    .line 413
    invoke-virtual {p1, p3}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p2, p3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    sub-int v0, v1, v2

    .line 414
    .local v0, "difference":I
    if-gez v0, :cond_e

    .line 415
    const/4 v1, -0x1

    .line 419
    :goto_d
    return v1

    .line 416
    :cond_e
    if-lez v0, :cond_12

    .line 417
    const/4 v1, 0x1

    goto :goto_d

    .line 419
    :cond_12
    const/4 v1, 0x0

    goto :goto_d
.end method

.method private calculateQuarter(Ljava/util/Calendar;I)I
    .registers 8
    .param p1, "calendar"    # Ljava/util/Calendar;
    .param p2, "monthOfFirstQuarter"    # I

    .prologue
    .line 387
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 389
    .local v3, "year":I
    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v0, v4, 0x1

    .line 390
    .local v0, "month":I
    if-lt v0, p2, :cond_1c

    sub-int v2, v0, p2

    .line 393
    .local v2, "relativeMonth":I
    :goto_10
    div-int/lit8 v4, v2, 0x3

    add-int/lit8 v1, v4, 0x1

    .line 395
    .local v1, "quarter":I
    if-ge v0, p2, :cond_18

    .line 396
    add-int/lit8 v3, v3, -0x1

    .line 398
    :cond_18
    mul-int/lit8 v4, v3, 0xa

    add-int/2addr v4, v1

    return v4

    .line 390
    .end local v1    # "quarter":I
    .end local v2    # "relativeMonth":I
    :cond_1c
    rsub-int/lit8 v4, p2, 0xc

    add-int v2, v0, v4

    goto :goto_10
.end method


# virtual methods
.method protected compare(Ljava/util/Calendar;Ljava/util/Calendar;I)I
    .registers 10
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;
    .param p3, "field"    # I

    .prologue
    const/4 v5, 0x5

    const/4 v4, 0x4

    const/4 v3, 0x3

    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 271
    const/4 v0, 0x0

    .line 274
    .local v0, "result":I
    invoke-direct {p0, p1, p2, v1}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateCompareResult(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    .line 275
    if-nez v0, :cond_e

    if-ne p3, v1, :cond_10

    :cond_e
    move v1, v0

    .line 309
    :goto_f
    return v1

    .line 280
    :cond_10
    if-ne p3, v3, :cond_17

    .line 281
    invoke-direct {p0, p1, p2, v3}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateCompareResult(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v1

    goto :goto_f

    .line 285
    :cond_17
    const/4 v1, 0x6

    if-ne p3, v1, :cond_20

    .line 286
    const/4 v1, 0x6

    invoke-direct {p0, p1, p2, v1}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateCompareResult(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v1

    goto :goto_f

    .line 290
    :cond_20
    invoke-direct {p0, p1, p2, v2}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateCompareResult(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    .line 291
    if-nez v0, :cond_28

    if-ne p3, v2, :cond_2a

    :cond_28
    move v1, v0

    .line 292
    goto :goto_f

    .line 296
    :cond_2a
    if-ne p3, v4, :cond_31

    .line 297
    invoke-direct {p0, p1, p2, v4}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateCompareResult(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v1

    goto :goto_f

    .line 301
    :cond_31
    invoke-direct {p0, p1, p2, v5}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateCompareResult(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    .line 302
    if-nez v0, :cond_40

    if-eq p3, v5, :cond_40

    const/4 v1, 0x7

    if-eq p3, v1, :cond_40

    const/16 v1, 0x8

    if-ne p3, v1, :cond_42

    :cond_40
    move v1, v0

    .line 305
    goto :goto_f

    .line 309
    :cond_42
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->compareTime(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v1

    goto :goto_f
.end method

.method protected compareQuarters(Ljava/util/Calendar;Ljava/util/Calendar;I)I
    .registers 7
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;
    .param p3, "monthOfFirstQuarter"    # I

    .prologue
    .line 367
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateQuarter(Ljava/util/Calendar;I)I

    move-result v1

    .line 368
    .local v1, "valueQuarter":I
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateQuarter(Ljava/util/Calendar;I)I

    move-result v0

    .line 369
    .local v0, "compareQuarter":I
    if-ge v1, v0, :cond_c

    .line 370
    const/4 v2, -0x1

    .line 374
    :goto_b
    return v2

    .line 371
    :cond_c
    if-le v1, v0, :cond_10

    .line 372
    const/4 v2, 0x1

    goto :goto_b

    .line 374
    :cond_10
    const/4 v2, 0x0

    goto :goto_b
.end method

.method protected compareTime(Ljava/util/Calendar;Ljava/util/Calendar;I)I
    .registers 10
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;
    .param p3, "field"    # I

    .prologue
    const/16 v5, 0xe

    const/16 v4, 0xd

    const/16 v3, 0xc

    const/16 v2, 0xb

    .line 327
    const/4 v0, 0x0

    .line 330
    .local v0, "result":I
    invoke-direct {p0, p1, p2, v2}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateCompareResult(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    .line 331
    if-nez v0, :cond_15

    const/16 v1, 0xa

    if-eq p3, v1, :cond_15

    if-ne p3, v2, :cond_17

    :cond_15
    move v1, v0

    .line 349
    :goto_16
    return v1

    .line 336
    :cond_17
    invoke-direct {p0, p1, p2, v3}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateCompareResult(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    .line 337
    if-nez v0, :cond_1f

    if-ne p3, v3, :cond_21

    :cond_1f
    move v1, v0

    .line 338
    goto :goto_16

    .line 342
    :cond_21
    invoke-direct {p0, p1, p2, v4}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateCompareResult(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    .line 343
    if-nez v0, :cond_29

    if-ne p3, v4, :cond_2b

    :cond_29
    move v1, v0

    .line 344
    goto :goto_16

    .line 348
    :cond_2b
    if-ne p3, v5, :cond_32

    .line 349
    invoke-direct {p0, p1, p2, v5}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->calculateCompareResult(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v1

    goto :goto_16

    .line 352
    :cond_32
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Invalid field: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public format(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 123
    const/4 v0, 0x0

    check-cast v0, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->format(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/String;
    .registers 7
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;
    .param p4, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 138
    invoke-virtual {p0, p2, p3}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->getFormat(Ljava/lang/String;Ljava/util/Locale;)Ljava/text/Format;

    move-result-object v0

    check-cast v0, Ljava/text/DateFormat;

    .line 139
    .local v0, "formatter":Ljava/text/DateFormat;
    if-eqz p4, :cond_10

    .line 140
    invoke-virtual {v0, p4}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 144
    :cond_b
    :goto_b
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->format(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 141
    :cond_10
    instance-of v1, p1, Ljava/util/Calendar;

    if-eqz v1, :cond_b

    move-object v1, p1

    .line 142
    check-cast v1, Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    goto :goto_b
.end method

.method public format(Ljava/lang/Object;Ljava/lang/String;Ljava/util/TimeZone;)Ljava/lang/String;
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 96
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->format(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected format(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/String;
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    .line 155
    if-nez p1, :cond_4

    .line 156
    const/4 v0, 0x0

    .line 160
    .end local p1    # "value":Ljava/lang/Object;
    :goto_3
    return-object v0

    .line 157
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_4
    instance-of v0, p1, Ljava/util/Calendar;

    if-eqz v0, :cond_e

    .line 158
    check-cast p1, Ljava/util/Calendar;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    .line 160
    :cond_e
    invoke-virtual {p2, p1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public format(Ljava/lang/Object;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/String;
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 110
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2, p3}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->format(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/lang/Object;Ljava/util/TimeZone;)Ljava/lang/String;
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    const/4 v1, 0x0

    .line 82
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1, p2}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->format(Ljava/lang/Object;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getFormat(Ljava/lang/String;Ljava/util/Locale;)Ljava/text/Format;
    .registers 8
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    const/4 v3, 0x0

    .line 208
    const/4 v0, 0x0

    .line 209
    .local v0, "formatter":Ljava/text/DateFormat;
    if-eqz p1, :cond_17

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_17

    const/4 v2, 0x1

    .line 210
    .local v2, "usePattern":Z
    :goto_b
    if-nez v2, :cond_19

    .line 211
    invoke-virtual {p0, p2}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->getFormat(Ljava/util/Locale;)Ljava/text/Format;

    move-result-object v0

    .end local v0    # "formatter":Ljava/text/DateFormat;
    check-cast v0, Ljava/text/DateFormat;

    .line 218
    .restart local v0    # "formatter":Ljava/text/DateFormat;
    :goto_13
    invoke-virtual {v0, v3}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 219
    return-object v0

    .end local v2    # "usePattern":Z
    :cond_17
    move v2, v3

    .line 209
    goto :goto_b

    .line 212
    .restart local v2    # "usePattern":Z
    :cond_19
    if-nez p2, :cond_21

    .line 213
    new-instance v0, Ljava/text/SimpleDateFormat;

    .end local v0    # "formatter":Ljava/text/DateFormat;
    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .restart local v0    # "formatter":Ljava/text/DateFormat;
    goto :goto_13

    .line 215
    :cond_21
    new-instance v1, Ljava/text/DateFormatSymbols;

    invoke-direct {v1, p2}, Ljava/text/DateFormatSymbols;-><init>(Ljava/util/Locale;)V

    .line 216
    .local v1, "symbols":Ljava/text/DateFormatSymbols;
    new-instance v0, Ljava/text/SimpleDateFormat;

    .end local v0    # "formatter":Ljava/text/DateFormat;
    invoke-direct {v0, p1, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/text/DateFormatSymbols;)V

    .restart local v0    # "formatter":Ljava/text/DateFormat;
    goto :goto_13
.end method

.method protected getFormat(Ljava/util/Locale;)Ljava/text/Format;
    .registers 6
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 231
    const/4 v0, 0x0

    .line 232
    .local v0, "formatter":Ljava/text/DateFormat;
    iget v2, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->dateStyle:I

    if-ltz v2, :cond_21

    iget v2, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->timeStyle:I

    if-ltz v2, :cond_21

    .line 233
    if-nez p1, :cond_18

    .line 234
    iget v2, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->dateStyle:I

    iget v3, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->timeStyle:I

    invoke-static {v2, v3}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v0

    .line 252
    :goto_13
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 253
    return-object v0

    .line 236
    :cond_18
    iget v2, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->dateStyle:I

    iget v3, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->timeStyle:I

    invoke-static {v2, v3, p1}, Ljava/text/DateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v0

    goto :goto_13

    .line 238
    :cond_21
    iget v2, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->timeStyle:I

    if-ltz v2, :cond_35

    .line 239
    if-nez p1, :cond_2e

    .line 240
    iget v2, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->timeStyle:I

    invoke-static {v2}, Ljava/text/DateFormat;->getTimeInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    goto :goto_13

    .line 242
    :cond_2e
    iget v2, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->timeStyle:I

    invoke-static {v2, p1}, Ljava/text/DateFormat;->getTimeInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v0

    goto :goto_13

    .line 245
    :cond_35
    iget v2, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->dateStyle:I

    if-ltz v2, :cond_42

    iget v1, p0, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->dateStyle:I

    .line 246
    .local v1, "useDateStyle":I
    :goto_3b
    if-nez p1, :cond_44

    .line 247
    invoke-static {v1}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    goto :goto_13

    .line 245
    .end local v1    # "useDateStyle":I
    :cond_42
    const/4 v1, 0x3

    goto :goto_3b

    .line 249
    .restart local v1    # "useDateStyle":I
    :cond_44
    invoke-static {v1, p1}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v0

    goto :goto_13
.end method

.method public isValid(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Z
    .registers 6
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 68
    const/4 v1, 0x0

    check-cast v1, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, p2, p3, v1}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    .line 69
    .local v0, "parsedValue":Ljava/lang/Object;
    if-nez v0, :cond_b

    const/4 v1, 0x0

    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x1

    goto :goto_a
.end method

.method protected parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;
    .registers 8
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;
    .param p4, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    const/4 v1, 0x0

    .line 175
    if-nez p1, :cond_d

    move-object p1, v1

    .line 176
    :goto_4
    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_12

    .line 183
    :cond_c
    :goto_c
    return-object v1

    .line 175
    :cond_d
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    goto :goto_4

    .line 179
    :cond_12
    invoke-virtual {p0, p2, p3}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->getFormat(Ljava/lang/String;Ljava/util/Locale;)Ljava/text/Format;

    move-result-object v0

    check-cast v0, Ljava/text/DateFormat;

    .line 180
    .local v0, "formatter":Ljava/text/DateFormat;
    if-eqz p4, :cond_1d

    .line 181
    invoke-virtual {v0, p4}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 183
    :cond_1d
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->parse(Ljava/lang/String;Ljava/text/Format;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_c
.end method

.method protected abstract processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
.end method
