.class public Lorg/joda/time/format/ISODateTimeFormat;
.super Ljava/lang/Object;
.source "ISODateTimeFormat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/joda/time/format/ISODateTimeFormat$Constants;
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method private static appendSeparator(Lorg/joda/time/format/DateTimeFormatterBuilder;Z)V
    .registers 3

    .prologue
    .line 475
    if-eqz p1, :cond_7

    .line 476
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 478
    :cond_7
    return-void
.end method

.method public static basicDate()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 895
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->bd:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$2300()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicDateTime()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 973
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->bdt:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$2800()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicDateTimeNoMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 988
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->bdtx:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$2900()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicOrdinalDate()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1001
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->bod:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$3000()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicOrdinalDateTime()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1017
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->bodt:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$3100()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicOrdinalDateTimeNoMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1033
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->bodtx:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$3200()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicTTime()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 942
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->btt:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$2600()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicTTimeNoMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 958
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->bttx:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$2700()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicTime()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 911
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->bt:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$2400()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicTimeNoMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 926
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->btx:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$2500()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicWeekDate()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1045
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->bwd:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$3300()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicWeekDateTime()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1060
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->bwdt:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$3400()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static basicWeekDateTimeNoMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1075
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->bwdtx:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$3500()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method private static checkNotStrictISO(Ljava/util/Collection;Z)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/joda/time/DateTimeFieldType;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 461
    if-eqz p1, :cond_1b

    .line 462
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No valid ISO8601 format for fields: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 464
    :cond_1b
    return-void
.end method

.method public static date()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 690
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat;->yearMonthDay()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method private static dateByMonth(Lorg/joda/time/format/DateTimeFormatterBuilder;Ljava/util/Collection;ZZ)Z
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/joda/time/format/DateTimeFormatterBuilder;",
            "Ljava/util/Collection",
            "<",
            "Lorg/joda/time/DateTimeFieldType;",
            ">;ZZ)Z"
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x2

    const/16 v3, 0x2d

    .line 219
    const/4 v0, 0x0

    .line 220
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->year()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_58

    .line 221
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->ye:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$000()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append(Lorg/joda/time/format/DateTimeFormatter;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 222
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->monthOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 223
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfMonth()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    .line 225
    invoke-static {p0, p2}, Lorg/joda/time/format/ISODateTimeFormat;->appendSeparator(Lorg/joda/time/format/DateTimeFormatterBuilder;Z)V

    .line 226
    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendMonthOfYear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 227
    invoke-static {p0, p2}, Lorg/joda/time/format/ISODateTimeFormat;->appendSeparator(Lorg/joda/time/format/DateTimeFormatterBuilder;Z)V

    .line 228
    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDayOfMonth(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 267
    :cond_36
    :goto_36
    return v0

    .line 231
    :cond_37
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 232
    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendMonthOfYear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move v0, v1

    .line 233
    goto :goto_36

    .line 236
    :cond_3f
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfMonth()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_56

    .line 238
    invoke-static {p1, p3}, Lorg/joda/time/format/ISODateTimeFormat;->checkNotStrictISO(Ljava/util/Collection;Z)V

    .line 239
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 240
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 241
    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDayOfMonth(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    goto :goto_36

    :cond_56
    move v0, v1

    .line 244
    goto :goto_36

    .line 248
    :cond_58
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->monthOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7e

    .line 249
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 250
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 251
    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendMonthOfYear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 252
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfMonth()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7c

    .line 254
    invoke-static {p0, p2}, Lorg/joda/time/format/ISODateTimeFormat;->appendSeparator(Lorg/joda/time/format/DateTimeFormatterBuilder;Z)V

    .line 255
    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDayOfMonth(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    goto :goto_36

    :cond_7c
    move v0, v1

    .line 258
    goto :goto_36

    .line 260
    :cond_7e
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfMonth()Lorg/joda/time/DateTimeFieldType;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_36

    .line 262
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 263
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 264
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 265
    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDayOfMonth(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    goto :goto_36
.end method

.method private static dateByOrdinal(Lorg/joda/time/format/DateTimeFormatterBuilder;Ljava/util/Collection;ZZ)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/joda/time/format/DateTimeFormatterBuilder;",
            "Ljava/util/Collection",
            "<",
            "Lorg/joda/time/DateTimeFieldType;",
            ">;ZZ)Z"
        }
    .end annotation

    .prologue
    const/4 v2, 0x3

    .line 287
    const/4 v0, 0x0

    .line 288
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->year()Lorg/joda/time/DateTimeFieldType;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 289
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->ye:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$000()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append(Lorg/joda/time/format/DateTimeFormatter;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 290
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 292
    invoke-static {p0, p2}, Lorg/joda/time/format/ISODateTimeFormat;->appendSeparator(Lorg/joda/time/format/DateTimeFormatterBuilder;Z)V

    .line 293
    invoke-virtual {p0, v2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDayOfYear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 304
    :cond_23
    :goto_23
    return v0

    .line 296
    :cond_24
    const/4 v0, 0x1

    goto :goto_23

    .line 299
    :cond_26
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 301
    const/16 v1, 0x2d

    invoke-virtual {p0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 302
    invoke-virtual {p0, v2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDayOfYear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    goto :goto_23
.end method

.method private static dateByWeek(Lorg/joda/time/format/DateTimeFormatterBuilder;Ljava/util/Collection;ZZ)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/joda/time/format/DateTimeFormatterBuilder;",
            "Ljava/util/Collection",
            "<",
            "Lorg/joda/time/DateTimeFieldType;",
            ">;ZZ)Z"
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/16 v4, 0x57

    const/16 v3, 0x2d

    const/4 v1, 0x1

    .line 324
    const/4 v0, 0x0

    .line 325
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->weekyear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5a

    .line 326
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->we:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$100()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append(Lorg/joda/time/format/DateTimeFormatter;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 327
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->weekOfWeekyear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 328
    invoke-static {p0, p2}, Lorg/joda/time/format/ISODateTimeFormat;->appendSeparator(Lorg/joda/time/format/DateTimeFormatterBuilder;Z)V

    .line 329
    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 330
    invoke-virtual {p0, v5}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendWeekOfWeekyear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 331
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfWeek()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 333
    invoke-static {p0, p2}, Lorg/joda/time/format/ISODateTimeFormat;->appendSeparator(Lorg/joda/time/format/DateTimeFormatterBuilder;Z)V

    .line 334
    invoke-virtual {p0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDayOfWeek(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 372
    :cond_3b
    :goto_3b
    return v0

    :cond_3c
    move v0, v1

    .line 337
    goto :goto_3b

    .line 340
    :cond_3e
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfWeek()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_58

    .line 342
    invoke-static {p1, p3}, Lorg/joda/time/format/ISODateTimeFormat;->checkNotStrictISO(Ljava/util/Collection;Z)V

    .line 343
    invoke-static {p0, p2}, Lorg/joda/time/format/ISODateTimeFormat;->appendSeparator(Lorg/joda/time/format/DateTimeFormatterBuilder;Z)V

    .line 344
    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 345
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 346
    invoke-virtual {p0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDayOfWeek(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    goto :goto_3b

    :cond_58
    move v0, v1

    .line 349
    goto :goto_3b

    .line 353
    :cond_5a
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->weekOfWeekyear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_80

    .line 354
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 355
    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 356
    invoke-virtual {p0, v5}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendWeekOfWeekyear(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 357
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfWeek()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7e

    .line 359
    invoke-static {p0, p2}, Lorg/joda/time/format/ISODateTimeFormat;->appendSeparator(Lorg/joda/time/format/DateTimeFormatterBuilder;Z)V

    .line 360
    invoke-virtual {p0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDayOfWeek(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    goto :goto_3b

    :cond_7e
    move v0, v1

    .line 363
    goto :goto_3b

    .line 365
    :cond_80
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfWeek()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 367
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 368
    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 369
    invoke-virtual {p0, v3}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 370
    invoke-virtual {p0, v1}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendDayOfWeek(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    goto :goto_3b
.end method

.method public static dateElementParser()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 534
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->dpe:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$400()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static dateHour()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1197
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->dh:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$4400()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static dateHourMinute()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1207
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->dhm:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$4500()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static dateHourMinuteSecond()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1218
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->dhms:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$4600()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static dateHourMinuteSecondFraction()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1242
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->dhmsf:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$4800()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static dateHourMinuteSecondMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1230
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->dhmsl:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$4700()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static dateOptionalTimeParser()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 649
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->dotp:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$900()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static dateParser()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 497
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->dp:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$200()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static dateTime()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 773
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->dt:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$1500()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static dateTimeNoMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 789
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->dtx:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$1600()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static dateTimeParser()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 623
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->dtp:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$800()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static forFields(Ljava/util/Collection;ZZ)Lorg/joda/time/format/DateTimeFormatter;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/joda/time/DateTimeFieldType;",
            ">;ZZ)",
            "Lorg/joda/time/format/DateTimeFormatter;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 156
    if-eqz p0, :cond_a

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    if-nez v0, :cond_12

    .line 157
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The fields must not be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 159
    :cond_12
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 160
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v5

    .line 162
    new-instance v0, Lorg/joda/time/format/DateTimeFormatterBuilder;

    invoke-direct {v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;-><init>()V

    .line 164
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->monthOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_59

    .line 165
    invoke-static {v0, v1, p1, p2}, Lorg/joda/time/format/ISODateTimeFormat;->dateByMonth(Lorg/joda/time/format/DateTimeFormatterBuilder;Ljava/util/Collection;ZZ)Z

    move-result v4

    .line 181
    :goto_2e
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v6

    if-ge v6, v5, :cond_bc

    move v5, v2

    :goto_35
    move v2, p1

    move v3, p2

    .line 184
    invoke-static/range {v0 .. v5}, Lorg/joda/time/format/ISODateTimeFormat;->time(Lorg/joda/time/format/DateTimeFormatterBuilder;Ljava/util/Collection;ZZZZ)V

    .line 187
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->canBuildFormatter()Z

    move-result v2

    if-nez v2, :cond_bf

    .line 188
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No valid format for fields: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 166
    :cond_59
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfYear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_68

    .line 167
    invoke-static {v0, v1, p1, p2}, Lorg/joda/time/format/ISODateTimeFormat;->dateByOrdinal(Lorg/joda/time/format/DateTimeFormatterBuilder;Ljava/util/Collection;ZZ)Z

    move-result v4

    goto :goto_2e

    .line 168
    :cond_68
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->weekOfWeekyear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_77

    .line 169
    invoke-static {v0, v1, p1, p2}, Lorg/joda/time/format/ISODateTimeFormat;->dateByWeek(Lorg/joda/time/format/DateTimeFormatterBuilder;Ljava/util/Collection;ZZ)Z

    move-result v4

    goto :goto_2e

    .line 170
    :cond_77
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfMonth()Lorg/joda/time/DateTimeFieldType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_86

    .line 171
    invoke-static {v0, v1, p1, p2}, Lorg/joda/time/format/ISODateTimeFormat;->dateByMonth(Lorg/joda/time/format/DateTimeFormatterBuilder;Ljava/util/Collection;ZZ)Z

    move-result v4

    goto :goto_2e

    .line 172
    :cond_86
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->dayOfWeek()Lorg/joda/time/DateTimeFieldType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_95

    .line 173
    invoke-static {v0, v1, p1, p2}, Lorg/joda/time/format/ISODateTimeFormat;->dateByWeek(Lorg/joda/time/format/DateTimeFormatterBuilder;Ljava/util/Collection;ZZ)Z

    move-result v4

    goto :goto_2e

    .line 174
    :cond_95
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->year()Lorg/joda/time/DateTimeFieldType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a8

    .line 175
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->ye:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$000()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append(Lorg/joda/time/format/DateTimeFormatter;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move v4, v2

    .line 176
    goto :goto_2e

    .line 177
    :cond_a8
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->weekyear()Lorg/joda/time/DateTimeFieldType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c9

    .line 178
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->we:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$100()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->append(Lorg/joda/time/format/DateTimeFormatter;)Lorg/joda/time/format/DateTimeFormatterBuilder;

    move v4, v2

    .line 179
    goto/16 :goto_2e

    :cond_bc
    move v5, v3

    .line 181
    goto/16 :goto_35

    .line 194
    :cond_bf
    :try_start_bf
    invoke-interface {p0, v1}, Ljava/util/Collection;->retainAll(Ljava/util/Collection;)Z
    :try_end_c2
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_bf .. :try_end_c2} :catch_c7

    .line 198
    :goto_c2
    invoke-virtual {v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->toFormatter()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0

    .line 195
    :catch_c7
    move-exception v1

    goto :goto_c2

    :cond_c9
    move v4, v3

    goto/16 :goto_2e
.end method

.method public static hour()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1143
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->hde:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$3900()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static hourMinute()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1153
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->hm:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$4000()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static hourMinuteSecond()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1163
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->hms:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$4100()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static hourMinuteSecondFraction()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1187
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->hmsf:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$4300()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static hourMinuteSecondMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1175
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->hmsl:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$4200()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static localDateOptionalTimeParser()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 676
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->ldotp:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$1000()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static localDateParser()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 517
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->ldp:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$300()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static localTimeParser()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 577
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->ltp:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$600()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static ordinalDate()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 803
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->od:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$1700()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static ordinalDateTime()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 820
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->odt:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$1800()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static ordinalDateTimeNoMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 837
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->odtx:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$1900()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static tTime()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 740
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->tt:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$1300()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static tTimeNoMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 757
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->ttx:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$1400()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static time()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 707
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->t:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$1100()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method private static time(Lorg/joda/time/format/DateTimeFormatterBuilder;Ljava/util/Collection;ZZZZ)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/joda/time/format/DateTimeFormatterBuilder;",
            "Ljava/util/Collection",
            "<",
            "Lorg/joda/time/DateTimeFieldType;",
            ">;ZZZZ)V"
        }
    .end annotation

    .prologue
    const/16 v7, 0x3a

    const/16 v6, 0x2d

    const/4 v5, 0x2

    .line 396
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->hourOfDay()Lorg/joda/time/DateTimeFieldType;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 397
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->minuteOfHour()Lorg/joda/time/DateTimeFieldType;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v1

    .line 398
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->secondOfMinute()Lorg/joda/time/DateTimeFieldType;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v2

    .line 399
    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->millisOfSecond()Lorg/joda/time/DateTimeFieldType;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v3

    .line 400
    if-nez v0, :cond_2e

    if-nez v1, :cond_2e

    if-nez v2, :cond_2e

    if-nez v3, :cond_2e

    .line 450
    :cond_2d
    :goto_2d
    return-void

    .line 403
    :cond_2e
    if-nez v0, :cond_36

    if-nez v1, :cond_36

    if-nez v2, :cond_36

    if-eqz v3, :cond_5a

    .line 404
    :cond_36
    if-eqz p3, :cond_53

    if-eqz p4, :cond_53

    .line 405
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No valid ISO8601 format for fields because Date was reduced precision: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 407
    :cond_53
    if-eqz p5, :cond_5a

    .line 408
    const/16 v4, 0x54

    invoke-virtual {p0, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 411
    :cond_5a
    if-eqz v0, :cond_60

    if-eqz v1, :cond_60

    if-nez v2, :cond_66

    :cond_60
    if-eqz v0, :cond_93

    if-nez v2, :cond_93

    if-nez v3, :cond_93

    .line 425
    :cond_66
    if-eqz v0, :cond_d7

    .line 426
    invoke-virtual {p0, v5}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendHourOfDay(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 430
    :cond_6b
    :goto_6b
    if-eqz p2, :cond_74

    if-eqz v0, :cond_74

    if-eqz v1, :cond_74

    .line 431
    invoke-virtual {p0, v7}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 433
    :cond_74
    if-eqz v1, :cond_e1

    .line 434
    invoke-virtual {p0, v5}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendMinuteOfHour(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 438
    :cond_79
    :goto_79
    if-eqz p2, :cond_82

    if-eqz v1, :cond_82

    if-eqz v2, :cond_82

    .line 439
    invoke-virtual {p0, v7}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 441
    :cond_82
    if-eqz v2, :cond_e9

    .line 442
    invoke-virtual {p0, v5}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendSecondOfMinute(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 446
    :cond_87
    :goto_87
    if-eqz v3, :cond_2d

    .line 447
    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    .line 448
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendMillisOfSecond(I)Lorg/joda/time/format/DateTimeFormatterBuilder;

    goto :goto_2d

    .line 414
    :cond_93
    if-eqz p3, :cond_b0

    if-eqz p5, :cond_b0

    .line 415
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No valid ISO8601 format for fields because Time was truncated: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 417
    :cond_b0
    if-nez v0, :cond_bc

    if-eqz v1, :cond_b6

    if-nez v2, :cond_66

    :cond_b6
    if-eqz v1, :cond_ba

    if-eqz v3, :cond_66

    :cond_ba
    if-nez v2, :cond_66

    .line 420
    :cond_bc
    if-eqz p3, :cond_66

    .line 421
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No valid ISO8601 format for fields: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 427
    :cond_d7
    if-nez v1, :cond_dd

    if-nez v2, :cond_dd

    if-eqz v3, :cond_6b

    .line 428
    :cond_dd
    invoke-virtual {p0, v6}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    goto :goto_6b

    .line 435
    :cond_e1
    if-nez v2, :cond_e5

    if-eqz v3, :cond_79

    .line 436
    :cond_e5
    invoke-virtual {p0, v6}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    goto :goto_79

    .line 443
    :cond_e9
    if-eqz v3, :cond_87

    .line 444
    invoke-virtual {p0, v6}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendLiteral(C)Lorg/joda/time/format/DateTimeFormatterBuilder;

    goto :goto_87
.end method

.method public static timeElementParser()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 596
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->tpe:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$700()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static timeNoMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 723
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->tx:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$1200()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static timeParser()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 555
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->tp:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$500()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static weekDate()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 850
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->wwd:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$2000()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static weekDateTime()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 866
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->wdt:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$2100()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static weekDateTimeNoMillis()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 882
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->wdtx:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$2200()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static weekyear()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1114
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->we:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$100()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static weekyearWeek()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1124
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->ww:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$3800()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static weekyearWeekDay()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1134
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->wwd:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$2000()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static year()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1085
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->ye:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$000()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static yearMonth()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1095
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->ym:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$3600()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method

.method public static yearMonthDay()Lorg/joda/time/format/DateTimeFormatter;
    .registers 1

    .prologue
    .line 1105
    # getter for: Lorg/joda/time/format/ISODateTimeFormat$Constants;->ymd:Lorg/joda/time/format/DateTimeFormatter;
    invoke-static {}, Lorg/joda/time/format/ISODateTimeFormat$Constants;->access$3700()Lorg/joda/time/format/DateTimeFormatter;

    move-result-object v0

    return-object v0
.end method
