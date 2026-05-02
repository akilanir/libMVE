.class public Lfreemarker/template/utility/DateUtil;
.super Ljava/lang/Object;
.source "DateUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/template/utility/DateUtil$TimeZoneOffsetCalculator;,
        Lfreemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory;,
        Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;
    }
.end annotation


# static fields
.field public static final ACCURACY_HOURS:I = 0x4

.field public static final ACCURACY_MILLISECONDS:I = 0x7

.field public static final ACCURACY_MINUTES:I = 0x5

.field public static final ACCURACY_SECONDS:I = 0x6

.field private static final TIME_ZONE_OFFSET_CALCULATOR:Lfreemarker/template/utility/DateUtil$TimeZoneOffsetCalculator;

.field public static final UTC:Ljava/util/TimeZone;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 68
    const-string v0, "UTC"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/DateUtil;->UTC:Ljava/util/TimeZone;

    .line 70
    invoke-static {}, Lfreemarker/template/utility/DateUtil;->getTimeZoneOffsetCalculator()Lfreemarker/template/utility/DateUtil$TimeZoneOffsetCalculator;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/DateUtil;->TIME_ZONE_OFFSET_CALCULATOR:Lfreemarker/template/utility/DateUtil$TimeZoneOffsetCalculator;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    return-void
.end method

.method private static append00([CII)I
    .registers 5
    .param p0, "res"    # [C
    .param p1, "dstIdx"    # I
    .param p2, "x"    # I

    .prologue
    .line 352
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "dstIdx":I
    .local v0, "dstIdx":I
    div-int/lit8 v1, p2, 0xa

    add-int/lit8 v1, v1, 0x30

    int-to-char v1, v1

    aput-char v1, p0, p1

    .line 353
    add-int/lit8 p1, v0, 0x1

    .end local v0    # "dstIdx":I
    .restart local p1    # "dstIdx":I
    rem-int/lit8 v1, p2, 0xa

    add-int/lit8 v1, v1, 0x30

    int-to-char v1, v1

    aput-char v1, p0, v0

    .line 354
    return p1
.end method

.method public static dateToISO8601String(Ljava/util/Date;ZZZILjava/util/TimeZone;Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;)Ljava/lang/String;
    .registers 25
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "datePart"    # Z
    .param p2, "timePart"    # Z
    .param p3, "offsetPart"    # Z
    .param p4, "accuracy"    # I
    .param p5, "timeZone"    # Ljava/util/TimeZone;
    .param p6, "calendarFactory"    # Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;

    .prologue
    .line 213
    if-nez p2, :cond_c

    if-eqz p3, :cond_c

    .line 214
    new-instance v16, Ljava/lang/IllegalArgumentException;

    const-string v17, "ISO 8601:2004 doesn\'t specify any formats where the offset is shown but the time isn\'t."

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 219
    :cond_c
    if-nez p5, :cond_10

    .line 220
    sget-object p5, Lfreemarker/template/utility/DateUtil;->UTC:Ljava/util/TimeZone;

    .line 223
    :cond_10
    move-object/from16 v0, p6

    move-object/from16 v1, p5

    move-object/from16 v2, p0

    invoke-interface {v0, v1, v2}, Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;->get(Ljava/util/TimeZone;Ljava/util/Date;)Ljava/util/GregorianCalendar;

    move-result-object v3

    .line 226
    .local v3, "cal":Ljava/util/GregorianCalendar;
    if-nez p2, :cond_111

    .line 227
    const/16 v8, 0xa

    .line 235
    .local v8, "maxLength":I
    :goto_1e
    new-array v13, v8, [C

    .line 236
    .local v13, "res":[C
    const/4 v4, 0x0

    .line 238
    .local v4, "dstIdx":I
    if-eqz p1, :cond_af

    .line 239
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v14

    .line 240
    .local v14, "x":I
    if-lez v14, :cond_3c

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v16

    if-nez v16, :cond_3c

    .line 241
    neg-int v0, v14

    move/from16 v16, v0

    add-int/lit8 v14, v16, 0x1

    .line 243
    :cond_3c
    if-ltz v14, :cond_11b

    const/16 v16, 0x270f

    move/from16 v0, v16

    if-ge v14, v0, :cond_11b

    .line 244
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .local v5, "dstIdx":I
    div-int/lit16 v0, v14, 0x3e8

    move/from16 v16, v0

    add-int/lit8 v16, v16, 0x30

    move/from16 v0, v16

    int-to-char v0, v0

    move/from16 v16, v0

    aput-char v16, v13, v4

    .line 245
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    rem-int/lit16 v0, v14, 0x3e8

    move/from16 v16, v0

    div-int/lit8 v16, v16, 0x64

    add-int/lit8 v16, v16, 0x30

    move/from16 v0, v16

    int-to-char v0, v0

    move/from16 v16, v0

    aput-char v16, v13, v5

    .line 246
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    rem-int/lit8 v16, v14, 0x64

    div-int/lit8 v16, v16, 0xa

    add-int/lit8 v16, v16, 0x30

    move/from16 v0, v16

    int-to-char v0, v0

    move/from16 v16, v0

    aput-char v16, v13, v4

    .line 247
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    rem-int/lit8 v16, v14, 0xa

    add-int/lit8 v16, v16, 0x30

    move/from16 v0, v16

    int-to-char v0, v0

    move/from16 v16, v0

    aput-char v16, v13, v5

    .line 260
    :cond_80
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    const/16 v16, 0x2d

    aput-char v16, v13, v4

    .line 262
    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v16

    add-int/lit8 v14, v16, 0x1

    .line 263
    invoke-static {v13, v5, v14}, Lfreemarker/template/utility/DateUtil;->append00([CII)I

    move-result v4

    .line 265
    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    const/16 v16, 0x2d

    aput-char v16, v13, v4

    .line 267
    const/16 v16, 0x5

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v14

    .line 268
    invoke-static {v13, v5, v14}, Lfreemarker/template/utility/DateUtil;->append00([CII)I

    move-result v4

    .line 270
    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    if-eqz p2, :cond_af

    .line 271
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    const/16 v16, 0x54

    aput-char v16, v13, v4

    move v4, v5

    .line 275
    .end local v5    # "dstIdx":I
    .end local v14    # "x":I
    .restart local v4    # "dstIdx":I
    :cond_af
    if-eqz p2, :cond_1c6

    .line 276
    const/16 v16, 0xb

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v14

    .line 277
    .restart local v14    # "x":I
    invoke-static {v13, v4, v14}, Lfreemarker/template/utility/DateUtil;->append00([CII)I

    move-result v4

    .line 279
    const/16 v16, 0x5

    move/from16 v0, p4

    move/from16 v1, v16

    if-lt v0, v1, :cond_1c6

    .line 280
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    const/16 v16, 0x3a

    aput-char v16, v13, v4

    .line 282
    const/16 v16, 0xc

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v14

    .line 283
    invoke-static {v13, v5, v14}, Lfreemarker/template/utility/DateUtil;->append00([CII)I

    move-result v4

    .line 285
    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    const/16 v16, 0x6

    move/from16 v0, p4

    move/from16 v1, v16

    if-lt v0, v1, :cond_1c6

    .line 286
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    const/16 v16, 0x3a

    aput-char v16, v13, v4

    .line 288
    const/16 v16, 0xd

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v14

    .line 289
    invoke-static {v13, v5, v14}, Lfreemarker/template/utility/DateUtil;->append00([CII)I

    move-result v4

    .line 291
    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    const/16 v16, 0x7

    move/from16 v0, p4

    move/from16 v1, v16

    if-lt v0, v1, :cond_1c6

    .line 292
    const/16 v16, 0xe

    move/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v14

    .line 293
    if-eqz v14, :cond_1c6

    .line 294
    const/16 v16, 0x3e7

    move/from16 v0, v16

    if-le v14, v0, :cond_13e

    .line 296
    new-instance v16, Ljava/lang/RuntimeException;

    const-string v17, "Calendar.MILLISECOND > 999"

    invoke-direct/range {v16 .. v17}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 229
    .end local v4    # "dstIdx":I
    .end local v8    # "maxLength":I
    .end local v13    # "res":[C
    .end local v14    # "x":I
    :cond_111
    if-nez p1, :cond_117

    .line 230
    const/16 v8, 0x12

    .restart local v8    # "maxLength":I
    goto/16 :goto_1e

    .line 232
    .end local v8    # "maxLength":I
    :cond_117
    const/16 v8, 0x1d

    .restart local v8    # "maxLength":I
    goto/16 :goto_1e

    .line 249
    .restart local v4    # "dstIdx":I
    .restart local v13    # "res":[C
    .restart local v14    # "x":I
    :cond_11b
    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v15

    .line 252
    .local v15, "yearString":Ljava/lang/String;
    add-int/lit8 v16, v8, -0x4

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v17

    add-int v8, v16, v17

    .line 253
    new-array v13, v8, [C

    .line 255
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_12a
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v16

    move/from16 v0, v16

    if-ge v7, v0, :cond_80

    .line 256
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    invoke-virtual {v15, v7}, Ljava/lang/String;->charAt(I)C

    move-result v16

    aput-char v16, v13, v4

    .line 255
    add-int/lit8 v7, v7, 0x1

    move v4, v5

    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    goto :goto_12a

    .line 299
    .end local v7    # "i":I
    .end local v15    # "yearString":Ljava/lang/String;
    :cond_13e
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    const/16 v16, 0x2e

    aput-char v16, v13, v4

    :cond_144
    move v4, v5

    .line 301
    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    div-int/lit8 v16, v14, 0x64

    add-int/lit8 v16, v16, 0x30

    move/from16 v0, v16

    int-to-char v0, v0

    move/from16 v16, v0

    aput-char v16, v13, v4

    .line 302
    rem-int/lit8 v16, v14, 0x64

    mul-int/lit8 v14, v16, 0xa

    .line 303
    if-nez v14, :cond_144

    .line 310
    .end local v14    # "x":I
    :goto_158
    if-eqz p3, :cond_1c4

    .line 311
    sget-object v16, Lfreemarker/template/utility/DateUtil;->UTC:Ljava/util/TimeZone;

    move-object/from16 v0, p5

    move-object/from16 v1, v16

    if-ne v0, v1, :cond_174

    .line 312
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    const/16 v16, 0x5a

    aput-char v16, v13, v5

    .line 345
    :cond_168
    :goto_168
    new-instance v16, Ljava/lang/String;

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v0, v13, v1, v4}, Ljava/lang/String;-><init>([CII)V

    return-object v16

    .line 314
    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    :cond_174
    sget-object v16, Lfreemarker/template/utility/DateUtil;->TIME_ZONE_OFFSET_CALCULATOR:Lfreemarker/template/utility/DateUtil$TimeZoneOffsetCalculator;

    move-object/from16 v0, v16

    move-object/from16 v1, p5

    move-object/from16 v2, p0

    invoke-interface {v0, v1, v2}, Lfreemarker/template/utility/DateUtil$TimeZoneOffsetCalculator;->getOffset(Ljava/util/TimeZone;Ljava/util/Date;)I

    move-result v6

    .line 316
    .local v6, "dt":I
    if-gez v6, :cond_19c

    .line 317
    const/4 v12, 0x0

    .line 318
    .local v12, "positive":Z
    neg-int v6, v6

    .line 323
    :goto_184
    div-int/lit16 v6, v6, 0x3e8

    .line 324
    rem-int/lit8 v11, v6, 0x3c

    .line 325
    .local v11, "offS":I
    div-int/lit8 v6, v6, 0x3c

    .line 326
    rem-int/lit8 v10, v6, 0x3c

    .line 327
    .local v10, "offM":I
    div-int/lit8 v6, v6, 0x3c

    .line 328
    move v9, v6

    .line 330
    .local v9, "offH":I
    if-nez v11, :cond_19e

    if-nez v10, :cond_19e

    if-nez v9, :cond_19e

    .line 331
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    const/16 v16, 0x5a

    aput-char v16, v13, v5

    goto :goto_168

    .line 320
    .end local v4    # "dstIdx":I
    .end local v9    # "offH":I
    .end local v10    # "offM":I
    .end local v11    # "offS":I
    .end local v12    # "positive":Z
    .restart local v5    # "dstIdx":I
    :cond_19c
    const/4 v12, 0x1

    .restart local v12    # "positive":Z
    goto :goto_184

    .line 333
    .restart local v9    # "offH":I
    .restart local v10    # "offM":I
    .restart local v11    # "offS":I
    :cond_19e
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    if-eqz v12, :cond_1c1

    const/16 v16, 0x2b

    :goto_1a4
    aput-char v16, v13, v5

    .line 334
    invoke-static {v13, v4, v9}, Lfreemarker/template/utility/DateUtil;->append00([CII)I

    move-result v4

    .line 335
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    const/16 v16, 0x3a

    aput-char v16, v13, v4

    .line 336
    invoke-static {v13, v5, v10}, Lfreemarker/template/utility/DateUtil;->append00([CII)I

    move-result v4

    .line 337
    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    if-eqz v11, :cond_168

    .line 338
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    const/16 v16, 0x3a

    aput-char v16, v13, v4

    .line 339
    invoke-static {v13, v5, v11}, Lfreemarker/template/utility/DateUtil;->append00([CII)I

    move-result v4

    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    goto :goto_168

    .line 333
    :cond_1c1
    const/16 v16, 0x2d

    goto :goto_1a4

    .end local v4    # "dstIdx":I
    .end local v6    # "dt":I
    .end local v9    # "offH":I
    .end local v10    # "offM":I
    .end local v11    # "offS":I
    .end local v12    # "positive":Z
    .restart local v5    # "dstIdx":I
    :cond_1c4
    move v4, v5

    .end local v5    # "dstIdx":I
    .restart local v4    # "dstIdx":I
    goto :goto_168

    :cond_1c6
    move v5, v4

    .end local v4    # "dstIdx":I
    .restart local v5    # "dstIdx":I
    goto :goto_158
.end method

.method public static getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/utility/UnrecognizedTimeZoneException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-static {p0}, Lfreemarker/template/utility/DateUtil;->isGMTish(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 106
    const-string v1, "UTC"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 107
    sget-object v0, Lfreemarker/template/utility/DateUtil;->UTC:Ljava/util/TimeZone;

    .line 115
    :cond_10
    :goto_10
    return-object v0

    .line 109
    :cond_11
    invoke-static {p0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    goto :goto_10

    .line 111
    :cond_16
    invoke-static {p0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .line 112
    .local v0, "tz":Ljava/util/TimeZone;
    invoke-virtual {v0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lfreemarker/template/utility/DateUtil;->isGMTish(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 113
    new-instance v1, Lfreemarker/template/utility/UnrecognizedTimeZoneException;

    invoke-direct {v1, p0}, Lfreemarker/template/utility/UnrecognizedTimeZoneException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static getTimeZoneOffsetCalculator()Lfreemarker/template/utility/DateUtil$TimeZoneOffsetCalculator;
    .registers 3

    .prologue
    .line 75
    :try_start_0
    const-string v2, "freemarker.template.utility.J2SE14TimeZoneOffsetCalculator"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 77
    .local v0, "cl":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/template/utility/DateUtil$TimeZoneOffsetCalculator;
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_c} :catch_d

    .line 79
    :goto_c
    return-object v2

    .line 78
    :catch_d
    move-exception v1

    .line 79
    .local v1, "e":Ljava/lang/Throwable;
    new-instance v2, Lfreemarker/template/utility/DateUtil$1;

    invoke-direct {v2, v1}, Lfreemarker/template/utility/DateUtil$1;-><init>(Ljava/lang/Throwable;)V

    goto :goto_c
.end method

.method private static isGMTish(Ljava/lang/String;)Z
    .registers 11
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x74

    const/16 v8, 0x54

    const/4 v7, 0x3

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 123
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v6, v7, :cond_e

    .line 160
    :cond_d
    :goto_d
    return v4

    .line 126
    :cond_e
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 127
    .local v0, "c1":C
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 128
    .local v1, "c2":C
    const/4 v6, 0x2

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 129
    .local v2, "c3":C
    const/16 v6, 0x47

    if-eq v0, v6, :cond_23

    const/16 v6, 0x67

    if-ne v0, v6, :cond_2f

    :cond_23
    const/16 v6, 0x4d

    if-eq v1, v6, :cond_2b

    const/16 v6, 0x6d

    if-ne v1, v6, :cond_2f

    :cond_2b
    if-eq v2, v8, :cond_53

    if-eq v2, v9, :cond_53

    :cond_2f
    const/16 v6, 0x55

    if-eq v0, v6, :cond_37

    const/16 v6, 0x75

    if-ne v0, v6, :cond_43

    :cond_37
    if-eq v1, v8, :cond_3b

    if-ne v1, v9, :cond_43

    :cond_3b
    const/16 v6, 0x43

    if-eq v2, v6, :cond_53

    const/16 v6, 0x63

    if-eq v2, v6, :cond_53

    :cond_43
    const/16 v6, 0x55

    if-eq v0, v6, :cond_4b

    const/16 v6, 0x75

    if-ne v0, v6, :cond_d

    :cond_4b
    if-eq v1, v8, :cond_4f

    if-ne v1, v9, :cond_d

    :cond_4f
    const/16 v6, 0x31

    if-ne v2, v6, :cond_d

    .line 151
    :cond_53
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v6, v7, :cond_5b

    move v4, v5

    .line 152
    goto :goto_d

    .line 155
    :cond_5b
    invoke-virtual {p0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 156
    .local v3, "offset":Ljava/lang/String;
    const-string v6, "+"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_81

    .line 157
    const-string v6, "+0"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7f

    const-string v6, "+00"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7f

    const-string v6, "+00:00"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    :cond_7f
    move v4, v5

    goto :goto_d

    .line 160
    :cond_81
    const-string v6, "-0"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_99

    const-string v6, "-00"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_99

    const-string v6, "-00:00"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    :cond_99
    move v4, v5

    goto/16 :goto_d
.end method
