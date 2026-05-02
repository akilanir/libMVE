.class public Lorg/apache/commons/lang3/time/DurationFormatUtils;
.super Ljava/lang/Object;
.source "DurationFormatUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    }
.end annotation


# static fields
.field static final H:Ljava/lang/Object;

.field public static final ISO_EXTENDED_FORMAT_PATTERN:Ljava/lang/String; = "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.SSS\'S\'"

.field static final M:Ljava/lang/Object;

.field static final S:Ljava/lang/Object;

.field static final d:Ljava/lang/Object;

.field static final m:Ljava/lang/Object;

.field static final s:Ljava/lang/Object;

.field static final y:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 483
    const-string v0, "y"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->y:Ljava/lang/Object;

    .line 484
    const-string v0, "M"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->M:Ljava/lang/Object;

    .line 485
    const-string v0, "d"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->d:Ljava/lang/Object;

    .line 486
    const-string v0, "H"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->H:Ljava/lang/Object;

    .line 487
    const-string v0, "m"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->m:Ljava/lang/Object;

    .line 488
    const-string v0, "s"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->s:Ljava/lang/Object;

    .line 489
    const-string v0, "S"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->S:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    return-void
.end method

.method static format([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;JJJJJJJZ)Ljava/lang/String;
    .registers 29
    .param p0, "tokens"    # [Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    .param p1, "years"    # J
    .param p3, "months"    # J
    .param p5, "days"    # J
    .param p7, "hours"    # J
    .param p9, "minutes"    # J
    .param p11, "seconds"    # J
    .param p13, "milliseconds"    # J
    .param p15, "padWithZeros"    # Z

    .prologue
    .line 428
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 429
    .local v4, "buffer":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    .line 430
    .local v7, "lastOutputSeconds":Z
    move-object v3, p0

    .local v3, "arr$":[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    array-length v8, v3

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_9
    if-ge v6, v8, :cond_ae

    aget-object v9, v3, v6

    .line 431
    .local v9, "token":Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    invoke-virtual {v9}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->getValue()Ljava/lang/Object;

    move-result-object v10

    .line 432
    .local v10, "value":Ljava/lang/Object;
    invoke-virtual {v9}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->getCount()I

    move-result v5

    .line 433
    .local v5, "count":I
    instance-of v12, v10, Ljava/lang/StringBuilder;

    if-eqz v12, :cond_23

    .line 434
    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    :cond_20
    :goto_20
    add-int/lit8 v6, v6, 0x1

    goto :goto_9

    .line 436
    :cond_23
    sget-object v12, Lorg/apache/commons/lang3/time/DurationFormatUtils;->y:Ljava/lang/Object;

    if-ne v10, v12, :cond_32

    .line 437
    move/from16 v0, p15

    invoke-static {p1, p2, v0, v5}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    const/4 v7, 0x0

    goto :goto_20

    .line 439
    :cond_32
    sget-object v12, Lorg/apache/commons/lang3/time/DurationFormatUtils;->M:Ljava/lang/Object;

    if-ne v10, v12, :cond_43

    .line 440
    move-wide/from16 v0, p3

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v5}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    const/4 v7, 0x0

    goto :goto_20

    .line 442
    :cond_43
    sget-object v12, Lorg/apache/commons/lang3/time/DurationFormatUtils;->d:Ljava/lang/Object;

    if-ne v10, v12, :cond_54

    .line 443
    move-wide/from16 v0, p5

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v5}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    const/4 v7, 0x0

    goto :goto_20

    .line 445
    :cond_54
    sget-object v12, Lorg/apache/commons/lang3/time/DurationFormatUtils;->H:Ljava/lang/Object;

    if-ne v10, v12, :cond_65

    .line 446
    move-wide/from16 v0, p7

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v5}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 447
    const/4 v7, 0x0

    goto :goto_20

    .line 448
    :cond_65
    sget-object v12, Lorg/apache/commons/lang3/time/DurationFormatUtils;->m:Ljava/lang/Object;

    if-ne v10, v12, :cond_76

    .line 449
    move-wide/from16 v0, p9

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v5}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 450
    const/4 v7, 0x0

    goto :goto_20

    .line 451
    :cond_76
    sget-object v12, Lorg/apache/commons/lang3/time/DurationFormatUtils;->s:Ljava/lang/Object;

    if-ne v10, v12, :cond_87

    .line 452
    move-wide/from16 v0, p11

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v5}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    const/4 v7, 0x1

    goto :goto_20

    .line 454
    :cond_87
    sget-object v12, Lorg/apache/commons/lang3/time/DurationFormatUtils;->S:Ljava/lang/Object;

    if-ne v10, v12, :cond_20

    .line 455
    if-eqz v7, :cond_a2

    .line 457
    if-eqz p15, :cond_a0

    const/4 v12, 0x3

    invoke-static {v12, v5}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 458
    .local v11, "width":I
    :goto_94
    const/4 v12, 0x1

    move-wide/from16 v0, p13

    invoke-static {v0, v1, v12, v11}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 462
    .end local v11    # "width":I
    :goto_9e
    const/4 v7, 0x0

    goto :goto_20

    .line 457
    :cond_a0
    const/4 v11, 0x3

    goto :goto_94

    .line 460
    :cond_a2
    move-wide/from16 v0, p13

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v5}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9e

    .line 466
    .end local v5    # "count":I
    .end local v9    # "token":Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    .end local v10    # "value":Ljava/lang/Object;
    :cond_ae
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    return-object v12
.end method

.method public static formatDuration(JLjava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "durationMillis"    # J
    .param p2, "format"    # Ljava/lang/String;

    .prologue
    .line 114
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDuration(JLjava/lang/String;Z)Ljava/lang/String;
    .registers 20
    .param p0, "durationMillis"    # J
    .param p2, "format"    # Ljava/lang/String;
    .param p3, "padWithZeros"    # Z

    .prologue
    .line 131
    const-wide/16 v0, 0x0

    const-wide v2, 0x7fffffffffffffffL

    const-string v6, "durationMillis must not be negative"

    move-wide/from16 v4, p0

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang3/Validate;->inclusiveBetween(JJJLjava/lang/String;)V

    .line 133
    invoke-static/range {p2 .. p2}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->lexx(Ljava/lang/String;)[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    move-result-object v0

    .line 135
    .local v0, "tokens":[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    const-wide/16 v5, 0x0

    .line 136
    .local v5, "days":J
    const-wide/16 v7, 0x0

    .line 137
    .local v7, "hours":J
    const-wide/16 v9, 0x0

    .line 138
    .local v9, "minutes":J
    const-wide/16 v11, 0x0

    .line 139
    .local v11, "seconds":J
    move-wide/from16 v13, p0

    .line 141
    .local v13, "milliseconds":J
    sget-object v1, Lorg/apache/commons/lang3/time/DurationFormatUtils;->d:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 142
    const-wide/32 v1, 0x5265c00

    div-long v5, v13, v1

    .line 143
    const-wide/32 v1, 0x5265c00

    mul-long/2addr v1, v5

    sub-long/2addr v13, v1

    .line 145
    :cond_2e
    sget-object v1, Lorg/apache/commons/lang3/time/DurationFormatUtils;->H:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_40

    .line 146
    const-wide/32 v1, 0x36ee80

    div-long v7, v13, v1

    .line 147
    const-wide/32 v1, 0x36ee80

    mul-long/2addr v1, v7

    sub-long/2addr v13, v1

    .line 149
    :cond_40
    sget-object v1, Lorg/apache/commons/lang3/time/DurationFormatUtils;->m:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_52

    .line 150
    const-wide/32 v1, 0xea60

    div-long v9, v13, v1

    .line 151
    const-wide/32 v1, 0xea60

    mul-long/2addr v1, v9

    sub-long/2addr v13, v1

    .line 153
    :cond_52
    sget-object v1, Lorg/apache/commons/lang3/time/DurationFormatUtils;->s:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_62

    .line 154
    const-wide/16 v1, 0x3e8

    div-long v11, v13, v1

    .line 155
    const-wide/16 v1, 0x3e8

    mul-long/2addr v1, v11

    sub-long/2addr v13, v1

    .line 158
    :cond_62
    const-wide/16 v1, 0x0

    const-wide/16 v3, 0x0

    move/from16 v15, p3

    invoke-static/range {v0 .. v15}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->format([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;JJJJJJJZ)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static formatDurationHMS(J)Ljava/lang/String;
    .registers 3
    .param p0, "durationMillis"    # J

    .prologue
    .line 83
    const-string v0, "HH:mm:ss.SSS"

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDurationISO(J)Ljava/lang/String;
    .registers 4
    .param p0, "durationMillis"    # J

    .prologue
    .line 99
    const-string v0, "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.SSS\'S\'"

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDurationWords(JZZ)Ljava/lang/String;
    .registers 8
    .param p0, "durationMillis"    # J
    .param p2, "suppressLeadingZeroElements"    # Z
    .param p3, "suppressTrailingZeroElements"    # Z

    .prologue
    .line 181
    const-string v2, "d\' days \'H\' hours \'m\' minutes \'s\' seconds\'"

    invoke-static {p0, p1, v2}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 182
    .local v0, "duration":Ljava/lang/String;
    if-eqz p2, :cond_67

    .line 184
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 185
    const-string v2, " 0 days"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 186
    .local v1, "tmp":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_5c

    .line 187
    move-object v0, v1

    .line 188
    const-string v2, " 0 hours"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 189
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_5c

    .line 190
    move-object v0, v1

    .line 191
    const-string v2, " 0 minutes"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 192
    move-object v0, v1

    .line 193
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_5c

    .line 194
    const-string v2, " 0 seconds"

    const-string v3, ""

    invoke-static {v1, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 198
    :cond_5c
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_67

    .line 200
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 203
    .end local v1    # "tmp":Ljava/lang/String;
    :cond_67
    if-eqz p3, :cond_a9

    .line 204
    const-string v2, " 0 seconds"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 205
    .restart local v1    # "tmp":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_a9

    .line 206
    move-object v0, v1

    .line 207
    const-string v2, " 0 minutes"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 208
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_a9

    .line 209
    move-object v0, v1

    .line 210
    const-string v2, " 0 hours"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 211
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_a9

    .line 212
    const-string v2, " 0 days"

    const-string v3, ""

    invoke-static {v1, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 218
    .end local v1    # "tmp":Ljava/lang/String;
    :cond_a9
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 219
    const-string v2, " 1 seconds"

    const-string v3, " 1 second"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 220
    const-string v2, " 1 minutes"

    const-string v3, " 1 minute"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 221
    const-string v2, " 1 hours"

    const-string v3, " 1 hour"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 222
    const-string v2, " 1 days"

    const-string v3, " 1 day"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 223
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static formatPeriod(JJLjava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p0, "startMillis"    # J
    .param p2, "endMillis"    # J
    .param p4, "format"    # Ljava/lang/String;

    .prologue
    .line 252
    const/4 v5, 0x1

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    move-wide v0, p0

    move-wide v2, p2

    move-object v4, p4

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->formatPeriod(JJLjava/lang/String;ZLjava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatPeriod(JJLjava/lang/String;ZLjava/util/TimeZone;)Ljava/lang/String;
    .registers 35
    .param p0, "startMillis"    # J
    .param p2, "endMillis"    # J
    .param p4, "format"    # Ljava/lang/String;
    .param p5, "padWithZeros"    # Z
    .param p6, "timezone"    # Ljava/util/TimeZone;

    .prologue
    .line 281
    cmp-long v3, p0, p2

    if-gtz v3, :cond_b4

    const/4 v3, 0x1

    :goto_5
    const-string v4, "startMillis must not be greater than endMillis"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v3, v4, v5}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 290
    invoke-static/range {p4 .. p4}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->lexx(Ljava/lang/String;)[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    move-result-object v2

    .line 294
    .local v2, "tokens":[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    invoke-static/range {p6 .. p6}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v25

    .line 295
    .local v25, "start":Ljava/util/Calendar;
    new-instance v3, Ljava/util/Date;

    move-wide/from16 v0, p0

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 296
    invoke-static/range {p6 .. p6}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v19

    .line 297
    .local v19, "end":Ljava/util/Calendar;
    new-instance v3, Ljava/util/Date;

    move-wide/from16 v0, p2

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 300
    const/16 v3, 0xe

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/16 v4, 0xe

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    sub-int v21, v3, v4

    .line 301
    .local v21, "milliseconds":I
    const/16 v3, 0xd

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/16 v4, 0xd

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    sub-int v24, v3, v4

    .line 302
    .local v24, "seconds":I
    const/16 v3, 0xc

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/16 v4, 0xc

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    sub-int v22, v3, v4

    .line 303
    .local v22, "minutes":I
    const/16 v3, 0xb

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/16 v4, 0xb

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    sub-int v20, v3, v4

    .line 304
    .local v20, "hours":I
    const/4 v3, 0x5

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    sub-int v18, v3, v4

    .line 305
    .local v18, "days":I
    const/4 v3, 0x2

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x2

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    sub-int v23, v3, v4

    .line 306
    .local v23, "months":I
    const/4 v3, 0x1

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    sub-int v27, v3, v4

    .line 309
    .local v27, "years":I
    :goto_a9
    if-gez v21, :cond_b7

    .line 310
    move/from16 v0, v21

    add-int/lit16 v0, v0, 0x3e8

    move/from16 v21, v0

    .line 311
    add-int/lit8 v24, v24, -0x1

    goto :goto_a9

    .line 281
    .end local v2    # "tokens":[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    .end local v18    # "days":I
    .end local v19    # "end":Ljava/util/Calendar;
    .end local v20    # "hours":I
    .end local v21    # "milliseconds":I
    .end local v22    # "minutes":I
    .end local v23    # "months":I
    .end local v24    # "seconds":I
    .end local v25    # "start":Ljava/util/Calendar;
    .end local v27    # "years":I
    :cond_b4
    const/4 v3, 0x0

    goto/16 :goto_5

    .line 313
    .restart local v2    # "tokens":[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    .restart local v18    # "days":I
    .restart local v19    # "end":Ljava/util/Calendar;
    .restart local v20    # "hours":I
    .restart local v21    # "milliseconds":I
    .restart local v22    # "minutes":I
    .restart local v23    # "months":I
    .restart local v24    # "seconds":I
    .restart local v25    # "start":Ljava/util/Calendar;
    .restart local v27    # "years":I
    :cond_b7
    :goto_b7
    if-gez v24, :cond_be

    .line 314
    add-int/lit8 v24, v24, 0x3c

    .line 315
    add-int/lit8 v22, v22, -0x1

    goto :goto_b7

    .line 317
    :cond_be
    :goto_be
    if-gez v22, :cond_c5

    .line 318
    add-int/lit8 v22, v22, 0x3c

    .line 319
    add-int/lit8 v20, v20, -0x1

    goto :goto_be

    .line 321
    :cond_c5
    :goto_c5
    if-gez v20, :cond_cc

    .line 322
    add-int/lit8 v20, v20, 0x18

    .line 323
    add-int/lit8 v18, v18, -0x1

    goto :goto_c5

    .line 326
    :cond_cc
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->M:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_103

    .line 327
    :goto_d4
    if-gez v18, :cond_e9

    .line 328
    const/4 v3, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v3

    add-int v18, v18, v3

    .line 329
    add-int/lit8 v23, v23, -0x1

    .line 330
    const/4 v3, 0x2

    const/4 v4, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->add(II)V

    goto :goto_d4

    .line 333
    :cond_e9
    :goto_e9
    if-gez v23, :cond_f0

    .line 334
    add-int/lit8 v23, v23, 0xc

    .line 335
    add-int/lit8 v27, v27, -0x1

    goto :goto_e9

    .line 338
    :cond_f0
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->y:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_19a

    if-eqz v27, :cond_19a

    .line 339
    :goto_fa
    if-eqz v27, :cond_19a

    .line 340
    mul-int/lit8 v3, v27, 0xc

    add-int v23, v23, v3

    .line 341
    const/16 v27, 0x0

    goto :goto_fa

    .line 347
    :cond_103
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->y:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_162

    .line 348
    const/4 v3, 0x1

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v26

    .line 349
    .local v26, "target":I
    if-gez v23, :cond_116

    .line 351
    add-int/lit8 v26, v26, -0x1

    .line 354
    :cond_116
    :goto_116
    const/4 v3, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    move/from16 v0, v26

    if-eq v3, v0, :cond_160

    .line 355
    const/4 v3, 0x6

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v3

    const/4 v4, 0x6

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    sub-int/2addr v3, v4

    add-int v18, v18, v3

    .line 358
    move-object/from16 v0, v25

    instance-of v3, v0, Ljava/util/GregorianCalendar;

    if-eqz v3, :cond_14f

    const/4 v3, 0x2

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_14f

    const/4 v3, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/16 v4, 0x1d

    if-ne v3, v4, :cond_14f

    .line 361
    add-int/lit8 v18, v18, 0x1

    .line 364
    :cond_14f
    const/4 v3, 0x1

    const/4 v4, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->add(II)V

    .line 366
    const/4 v3, 0x6

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int v18, v18, v3

    goto :goto_116

    .line 369
    :cond_160
    const/16 v27, 0x0

    .line 372
    .end local v26    # "target":I
    :cond_162
    :goto_162
    const/4 v3, 0x2

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x2

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    if-eq v3, v4, :cond_183

    .line 373
    const/4 v3, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v3

    add-int v18, v18, v3

    .line 374
    const/4 v3, 0x2

    const/4 v4, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->add(II)V

    goto :goto_162

    .line 377
    :cond_183
    const/16 v23, 0x0

    .line 379
    :goto_185
    if-gez v18, :cond_19a

    .line 380
    const/4 v3, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v3

    add-int v18, v18, v3

    .line 381
    add-int/lit8 v23, v23, -0x1

    .line 382
    const/4 v3, 0x2

    const/4 v4, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->add(II)V

    goto :goto_185

    .line 391
    :cond_19a
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->d:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a8

    .line 392
    mul-int/lit8 v3, v18, 0x18

    add-int v20, v20, v3

    .line 393
    const/16 v18, 0x0

    .line 395
    :cond_1a8
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->H:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b6

    .line 396
    mul-int/lit8 v3, v20, 0x3c

    add-int v22, v22, v3

    .line 397
    const/16 v20, 0x0

    .line 399
    :cond_1b6
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->m:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1c4

    .line 400
    mul-int/lit8 v3, v22, 0x3c

    add-int v24, v24, v3

    .line 401
    const/16 v22, 0x0

    .line 403
    :cond_1c4
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->s:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1d4

    .line 404
    move/from16 v0, v24

    mul-int/lit16 v3, v0, 0x3e8

    add-int v21, v21, v3

    .line 405
    const/16 v24, 0x0

    .line 408
    :cond_1d4
    move/from16 v0, v27

    int-to-long v3, v0

    move/from16 v0, v23

    int-to-long v5, v0

    move/from16 v0, v18

    int-to-long v7, v0

    move/from16 v0, v20

    int-to-long v9, v0

    move/from16 v0, v22

    int-to-long v11, v0

    move/from16 v0, v24

    int-to-long v13, v0

    move/from16 v0, v21

    int-to-long v15, v0

    move/from16 v17, p5

    invoke-static/range {v2 .. v17}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->format([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;JJJJJJJZ)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static formatPeriodISO(JJ)Ljava/lang/String;
    .registers 11
    .param p0, "startMillis"    # J
    .param p2, "endMillis"    # J

    .prologue
    .line 238
    const-string v4, "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.SSS\'S\'"

    const/4 v5, 0x0

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    move-wide v0, p0

    move-wide v2, p2

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->formatPeriod(JJLjava/lang/String;ZLjava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static lexx(Ljava/lang/String;)[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    .registers 12
    .param p0, "format"    # Ljava/lang/String;

    .prologue
    .line 498
    new-instance v4, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    invoke-direct {v4, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 500
    .local v4, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;>;"
    const/4 v3, 0x0

    .line 503
    .local v3, "inLiteral":Z
    const/4 v0, 0x0

    .line 504
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 505
    .local v5, "previous":Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v2, v8, :cond_7b

    .line 506
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 507
    .local v1, "ch":C
    if-eqz v3, :cond_23

    const/16 v8, 0x27

    if-eq v1, v8, :cond_23

    .line 508
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 505
    :cond_20
    :goto_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 511
    :cond_23
    const/4 v7, 0x0

    .line 512
    .local v7, "value":Ljava/lang/Object;
    sparse-switch v1, :sswitch_data_a4

    .line 546
    if-nez v0, :cond_36

    .line 547
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 548
    .restart local v0    # "buffer":Ljava/lang/StringBuilder;
    new-instance v8, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    invoke-direct {v8, v0}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 550
    :cond_36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 553
    .end local v7    # "value":Ljava/lang/Object;
    :goto_39
    if-eqz v7, :cond_20

    .line 554
    if-eqz v5, :cond_71

    invoke-virtual {v5}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->getValue()Ljava/lang/Object;

    move-result-object v8

    if-ne v8, v7, :cond_71

    .line 555
    invoke-virtual {v5}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->increment()V

    .line 561
    :goto_46
    const/4 v0, 0x0

    goto :goto_20

    .line 515
    .restart local v7    # "value":Ljava/lang/Object;
    :sswitch_48
    if-eqz v3, :cond_4d

    .line 516
    const/4 v0, 0x0

    .line 517
    const/4 v3, 0x0

    goto :goto_39

    .line 519
    :cond_4d
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 520
    .restart local v0    # "buffer":Ljava/lang/StringBuilder;
    new-instance v8, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    invoke-direct {v8, v0}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 521
    const/4 v3, 0x1

    .line 523
    goto :goto_39

    .line 525
    :sswitch_5c
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->y:Ljava/lang/Object;

    .line 526
    goto :goto_39

    .line 528
    :sswitch_5f
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->M:Ljava/lang/Object;

    .line 529
    goto :goto_39

    .line 531
    :sswitch_62
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->d:Ljava/lang/Object;

    .line 532
    goto :goto_39

    .line 534
    :sswitch_65
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->H:Ljava/lang/Object;

    .line 535
    goto :goto_39

    .line 537
    :sswitch_68
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->m:Ljava/lang/Object;

    .line 538
    goto :goto_39

    .line 540
    :sswitch_6b
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->s:Ljava/lang/Object;

    .line 541
    goto :goto_39

    .line 543
    :sswitch_6e
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->S:Ljava/lang/Object;

    .line 544
    goto :goto_39

    .line 557
    .end local v7    # "value":Ljava/lang/Object;
    :cond_71
    new-instance v6, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    invoke-direct {v6, v7}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    .line 558
    .local v6, "token":Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 559
    move-object v5, v6

    goto :goto_46

    .line 564
    .end local v1    # "ch":C
    .end local v6    # "token":Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    :cond_7b
    if-eqz v3, :cond_96

    .line 565
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unmatched quote in format: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 567
    :cond_96
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    return-object v8

    .line 512
    nop

    :sswitch_data_a4
    .sparse-switch
        0x27 -> :sswitch_48
        0x48 -> :sswitch_65
        0x4d -> :sswitch_5f
        0x53 -> :sswitch_6e
        0x64 -> :sswitch_62
        0x6d -> :sswitch_68
        0x73 -> :sswitch_6b
        0x79 -> :sswitch_5c
    .end sparse-switch
.end method

.method private static paddedValue(JZI)Ljava/lang/String;
    .registers 6
    .param p0, "value"    # J
    .param p2, "padWithZeros"    # Z
    .param p3, "count"    # I

    .prologue
    .line 479
    invoke-static {p0, p1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    .line 480
    .local v0, "longString":Ljava/lang/String;
    if-eqz p2, :cond_c

    const/16 v1, 0x30

    invoke-static {v0, p3, v1}, Lorg/apache/commons/lang3/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "longString":Ljava/lang/String;
    :cond_c
    return-object v0
.end method
