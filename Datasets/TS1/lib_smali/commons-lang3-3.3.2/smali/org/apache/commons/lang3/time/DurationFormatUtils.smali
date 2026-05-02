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

.field public static final ISO_EXTENDED_FORMAT_PATTERN:Ljava/lang/String; = "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.S\'S\'"

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
    .line 466
    const-string v0, "y"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->y:Ljava/lang/Object;

    .line 467
    const-string v0, "M"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->M:Ljava/lang/Object;

    .line 468
    const-string v0, "d"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->d:Ljava/lang/Object;

    .line 469
    const-string v0, "H"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->H:Ljava/lang/Object;

    .line 470
    const-string v0, "m"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->m:Ljava/lang/Object;

    .line 471
    const-string v0, "s"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->s:Ljava/lang/Object;

    .line 472
    const-string v0, "S"

    sput-object v0, Lorg/apache/commons/lang3/time/DurationFormatUtils;->S:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    return-void
.end method

.method static format([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;JJJJJJJZ)Ljava/lang/String;
    .registers 28
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
    .line 417
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 418
    .local v3, "buffer":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    .line 419
    .local v6, "lastOutputSeconds":Z
    array-length v7, p0

    .line 420
    .local v7, "sz":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_8
    if-ge v5, v7, :cond_ac

    .line 421
    aget-object v8, p0, v5

    .line 422
    .local v8, "token":Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    invoke-virtual {v8}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->getValue()Ljava/lang/Object;

    move-result-object v9

    .line 423
    .local v9, "value":Ljava/lang/Object;
    invoke-virtual {v8}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->getCount()I

    move-result v4

    .line 424
    .local v4, "count":I
    instance-of v11, v9, Ljava/lang/StringBuilder;

    if-eqz v11, :cond_22

    .line 425
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    :cond_1f
    :goto_1f
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 427
    :cond_22
    sget-object v11, Lorg/apache/commons/lang3/time/DurationFormatUtils;->y:Ljava/lang/Object;

    if-ne v9, v11, :cond_31

    .line 428
    move/from16 v0, p15

    invoke-static {p1, p2, v0, v4}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 429
    const/4 v6, 0x0

    goto :goto_1f

    .line 430
    :cond_31
    sget-object v11, Lorg/apache/commons/lang3/time/DurationFormatUtils;->M:Ljava/lang/Object;

    if-ne v9, v11, :cond_41

    .line 431
    move-wide v0, p3

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v4}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    const/4 v6, 0x0

    goto :goto_1f

    .line 433
    :cond_41
    sget-object v11, Lorg/apache/commons/lang3/time/DurationFormatUtils;->d:Ljava/lang/Object;

    if-ne v9, v11, :cond_52

    .line 434
    move-wide/from16 v0, p5

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v4}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    const/4 v6, 0x0

    goto :goto_1f

    .line 436
    :cond_52
    sget-object v11, Lorg/apache/commons/lang3/time/DurationFormatUtils;->H:Ljava/lang/Object;

    if-ne v9, v11, :cond_63

    .line 437
    move-wide/from16 v0, p7

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v4}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    const/4 v6, 0x0

    goto :goto_1f

    .line 439
    :cond_63
    sget-object v11, Lorg/apache/commons/lang3/time/DurationFormatUtils;->m:Ljava/lang/Object;

    if-ne v9, v11, :cond_74

    .line 440
    move-wide/from16 v0, p9

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v4}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    const/4 v6, 0x0

    goto :goto_1f

    .line 442
    :cond_74
    sget-object v11, Lorg/apache/commons/lang3/time/DurationFormatUtils;->s:Ljava/lang/Object;

    if-ne v9, v11, :cond_85

    .line 443
    move-wide/from16 v0, p11

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v4}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    const/4 v6, 0x1

    goto :goto_1f

    .line 445
    :cond_85
    sget-object v11, Lorg/apache/commons/lang3/time/DurationFormatUtils;->S:Ljava/lang/Object;

    if-ne v9, v11, :cond_1f

    .line 446
    if-eqz v6, :cond_a0

    .line 448
    if-eqz p15, :cond_9e

    const/4 v11, 0x3

    invoke-static {v11, v4}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 449
    .local v10, "width":I
    :goto_92
    const/4 v11, 0x1

    move-wide/from16 v0, p13

    invoke-static {v0, v1, v11, v10}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    .end local v10    # "width":I
    :goto_9c
    const/4 v6, 0x0

    goto :goto_1f

    .line 448
    :cond_9e
    const/4 v10, 0x3

    goto :goto_92

    .line 451
    :cond_a0
    move-wide/from16 v0, p13

    move/from16 v2, p15

    invoke-static {v0, v1, v2, v4}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->paddedValue(JZI)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9c

    .line 457
    .end local v4    # "count":I
    .end local v8    # "token":Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    .end local v9    # "value":Ljava/lang/Object;
    :cond_ac
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    return-object v11
.end method

.method public static formatDuration(JLjava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "durationMillis"    # J
    .param p2, "format"    # Ljava/lang/String;

    .prologue
    .line 111
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
    .line 128
    invoke-static/range {p2 .. p2}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->lexx(Ljava/lang/String;)[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    move-result-object v0

    .line 130
    .local v0, "tokens":[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    const-wide/16 v5, 0x0

    .line 131
    .local v5, "days":J
    const-wide/16 v7, 0x0

    .line 132
    .local v7, "hours":J
    const-wide/16 v9, 0x0

    .line 133
    .local v9, "minutes":J
    const-wide/16 v11, 0x0

    .line 134
    .local v11, "seconds":J
    move-wide/from16 v13, p0

    .line 136
    .local v13, "milliseconds":J
    sget-object v1, Lorg/apache/commons/lang3/time/DurationFormatUtils;->d:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 137
    const-wide/32 v1, 0x5265c00

    div-long v5, v13, v1

    .line 138
    const-wide/32 v1, 0x5265c00

    mul-long/2addr v1, v5

    sub-long/2addr v13, v1

    .line 140
    :cond_20
    sget-object v1, Lorg/apache/commons/lang3/time/DurationFormatUtils;->H:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 141
    const-wide/32 v1, 0x36ee80

    div-long v7, v13, v1

    .line 142
    const-wide/32 v1, 0x36ee80

    mul-long/2addr v1, v7

    sub-long/2addr v13, v1

    .line 144
    :cond_32
    sget-object v1, Lorg/apache/commons/lang3/time/DurationFormatUtils;->m:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 145
    const-wide/32 v1, 0xea60

    div-long v9, v13, v1

    .line 146
    const-wide/32 v1, 0xea60

    mul-long/2addr v1, v9

    sub-long/2addr v13, v1

    .line 148
    :cond_44
    sget-object v1, Lorg/apache/commons/lang3/time/DurationFormatUtils;->s:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_54

    .line 149
    const-wide/16 v1, 0x3e8

    div-long v11, v13, v1

    .line 150
    const-wide/16 v1, 0x3e8

    mul-long/2addr v1, v11

    sub-long/2addr v13, v1

    .line 153
    :cond_54
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
    .line 82
    const-string v0, "H:mm:ss.SSS"

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDurationISO(J)Ljava/lang/String;
    .registers 4
    .param p0, "durationMillis"    # J

    .prologue
    .line 97
    const-string v0, "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.S\'S\'"

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
    .line 175
    const-string v2, "d\' days \'H\' hours \'m\' minutes \'s\' seconds\'"

    invoke-static {p0, p1, v2}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "duration":Ljava/lang/String;
    if-eqz p2, :cond_67

    .line 178
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 179
    const-string v2, " 0 days"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 180
    .local v1, "tmp":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_5c

    .line 181
    move-object v0, v1

    .line 182
    const-string v2, " 0 hours"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 183
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_5c

    .line 184
    move-object v0, v1

    .line 185
    const-string v2, " 0 minutes"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 186
    move-object v0, v1

    .line 187
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_5c

    .line 188
    const-string v2, " 0 seconds"

    const-string v3, ""

    invoke-static {v1, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 192
    :cond_5c
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_67

    .line 194
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 197
    .end local v1    # "tmp":Ljava/lang/String;
    :cond_67
    if-eqz p3, :cond_a9

    .line 198
    const-string v2, " 0 seconds"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 199
    .restart local v1    # "tmp":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_a9

    .line 200
    move-object v0, v1

    .line 201
    const-string v2, " 0 minutes"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 202
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_a9

    .line 203
    move-object v0, v1

    .line 204
    const-string v2, " 0 hours"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 205
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_a9

    .line 206
    const-string v2, " 0 days"

    const-string v3, ""

    invoke-static {v1, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 212
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

    .line 213
    const-string v2, " 1 seconds"

    const-string v3, " 1 second"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 214
    const-string v2, " 1 minutes"

    const-string v3, " 1 minute"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 215
    const-string v2, " 1 hours"

    const-string v3, " 1 hour"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 216
    const-string v2, " 1 days"

    const-string v3, " 1 day"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 217
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
    .line 244
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
    .line 279
    invoke-static/range {p4 .. p4}, Lorg/apache/commons/lang3/time/DurationFormatUtils;->lexx(Ljava/lang/String;)[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    move-result-object v2

    .line 283
    .local v2, "tokens":[Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    invoke-static/range {p6 .. p6}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v25

    .line 284
    .local v25, "start":Ljava/util/Calendar;
    new-instance v3, Ljava/util/Date;

    move-wide/from16 v0, p0

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 285
    invoke-static/range {p6 .. p6}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v19

    .line 286
    .local v19, "end":Ljava/util/Calendar;
    new-instance v3, Ljava/util/Date;

    move-wide/from16 v0, p2

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 289
    const/16 v3, 0xe

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/16 v4, 0xe

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    sub-int v21, v3, v4

    .line 290
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

    .line 291
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

    .line 292
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

    .line 293
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

    .line 294
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

    .line 295
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

    .line 298
    .local v27, "years":I
    :goto_9c
    if-gez v21, :cond_a7

    .line 299
    move/from16 v0, v21

    add-int/lit16 v0, v0, 0x3e8

    move/from16 v21, v0

    .line 300
    add-int/lit8 v24, v24, -0x1

    goto :goto_9c

    .line 302
    :cond_a7
    :goto_a7
    if-gez v24, :cond_ae

    .line 303
    add-int/lit8 v24, v24, 0x3c

    .line 304
    add-int/lit8 v22, v22, -0x1

    goto :goto_a7

    .line 306
    :cond_ae
    :goto_ae
    if-gez v22, :cond_b5

    .line 307
    add-int/lit8 v22, v22, 0x3c

    .line 308
    add-int/lit8 v20, v20, -0x1

    goto :goto_ae

    .line 310
    :cond_b5
    :goto_b5
    if-gez v20, :cond_bc

    .line 311
    add-int/lit8 v20, v20, 0x18

    .line 312
    add-int/lit8 v18, v18, -0x1

    goto :goto_b5

    .line 315
    :cond_bc
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->M:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f3

    .line 316
    :goto_c4
    if-gez v18, :cond_d9

    .line 317
    const/4 v3, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v3

    add-int v18, v18, v3

    .line 318
    add-int/lit8 v23, v23, -0x1

    .line 319
    const/4 v3, 0x2

    const/4 v4, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->add(II)V

    goto :goto_c4

    .line 322
    :cond_d9
    :goto_d9
    if-gez v23, :cond_e0

    .line 323
    add-int/lit8 v23, v23, 0xc

    .line 324
    add-int/lit8 v27, v27, -0x1

    goto :goto_d9

    .line 327
    :cond_e0
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->y:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_18a

    if-eqz v27, :cond_18a

    .line 328
    :goto_ea
    if-eqz v27, :cond_18a

    .line 329
    mul-int/lit8 v3, v27, 0xc

    add-int v23, v23, v3

    .line 330
    const/16 v27, 0x0

    goto :goto_ea

    .line 336
    :cond_f3
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->y:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_152

    .line 337
    const/4 v3, 0x1

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v26

    .line 338
    .local v26, "target":I
    if-gez v23, :cond_106

    .line 340
    add-int/lit8 v26, v26, -0x1

    .line 343
    :cond_106
    :goto_106
    const/4 v3, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    move/from16 v0, v26

    if-eq v3, v0, :cond_150

    .line 344
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

    .line 347
    move-object/from16 v0, v25

    instance-of v3, v0, Ljava/util/GregorianCalendar;

    if-eqz v3, :cond_13f

    const/4 v3, 0x2

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_13f

    const/4 v3, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/16 v4, 0x1d

    if-ne v3, v4, :cond_13f

    .line 350
    add-int/lit8 v18, v18, 0x1

    .line 353
    :cond_13f
    const/4 v3, 0x1

    const/4 v4, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->add(II)V

    .line 355
    const/4 v3, 0x6

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int v18, v18, v3

    goto :goto_106

    .line 358
    :cond_150
    const/16 v27, 0x0

    .line 361
    .end local v26    # "target":I
    :cond_152
    :goto_152
    const/4 v3, 0x2

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x2

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    if-eq v3, v4, :cond_173

    .line 362
    const/4 v3, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v3

    add-int v18, v18, v3

    .line 363
    const/4 v3, 0x2

    const/4 v4, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->add(II)V

    goto :goto_152

    .line 366
    :cond_173
    const/16 v23, 0x0

    .line 368
    :goto_175
    if-gez v18, :cond_18a

    .line 369
    const/4 v3, 0x5

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v3

    add-int v18, v18, v3

    .line 370
    add-int/lit8 v23, v23, -0x1

    .line 371
    const/4 v3, 0x2

    const/4 v4, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->add(II)V

    goto :goto_175

    .line 380
    :cond_18a
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->d:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_198

    .line 381
    mul-int/lit8 v3, v18, 0x18

    add-int v20, v20, v3

    .line 382
    const/16 v18, 0x0

    .line 384
    :cond_198
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->H:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a6

    .line 385
    mul-int/lit8 v3, v20, 0x3c

    add-int v22, v22, v3

    .line 386
    const/16 v20, 0x0

    .line 388
    :cond_1a6
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->m:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b4

    .line 389
    mul-int/lit8 v3, v22, 0x3c

    add-int v24, v24, v3

    .line 390
    const/16 v22, 0x0

    .line 392
    :cond_1b4
    sget-object v3, Lorg/apache/commons/lang3/time/DurationFormatUtils;->s:Ljava/lang/Object;

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1c4

    .line 393
    move/from16 v0, v24

    mul-int/lit16 v3, v0, 0x3e8

    add-int v21, v21, v3

    .line 394
    const/16 v24, 0x0

    .line 397
    :cond_1c4
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
    .line 231
    const-string v4, "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.S\'S\'"

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
    .line 481
    new-instance v4, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    invoke-direct {v4, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 483
    .local v4, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;>;"
    const/4 v3, 0x0

    .line 486
    .local v3, "inLiteral":Z
    const/4 v0, 0x0

    .line 487
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 488
    .local v5, "previous":Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v2, v8, :cond_7b

    .line 489
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 490
    .local v1, "ch":C
    if-eqz v3, :cond_23

    const/16 v8, 0x27

    if-eq v1, v8, :cond_23

    .line 491
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 488
    :cond_20
    :goto_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 494
    :cond_23
    const/4 v7, 0x0

    .line 495
    .local v7, "value":Ljava/lang/Object;
    sparse-switch v1, :sswitch_data_a4

    .line 529
    if-nez v0, :cond_36

    .line 530
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 531
    .restart local v0    # "buffer":Ljava/lang/StringBuilder;
    new-instance v8, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    invoke-direct {v8, v0}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 533
    :cond_36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 536
    .end local v7    # "value":Ljava/lang/Object;
    :goto_39
    if-eqz v7, :cond_20

    .line 537
    if-eqz v5, :cond_71

    invoke-virtual {v5}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->getValue()Ljava/lang/Object;

    move-result-object v8

    if-ne v8, v7, :cond_71

    .line 538
    invoke-virtual {v5}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;->increment()V

    .line 544
    :goto_46
    const/4 v0, 0x0

    goto :goto_20

    .line 498
    .restart local v7    # "value":Ljava/lang/Object;
    :sswitch_48
    if-eqz v3, :cond_4d

    .line 499
    const/4 v0, 0x0

    .line 500
    const/4 v3, 0x0

    goto :goto_39

    .line 502
    :cond_4d
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 503
    .restart local v0    # "buffer":Ljava/lang/StringBuilder;
    new-instance v8, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    invoke-direct {v8, v0}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 504
    const/4 v3, 0x1

    .line 506
    goto :goto_39

    .line 508
    :sswitch_5c
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->y:Ljava/lang/Object;

    .line 509
    goto :goto_39

    .line 511
    :sswitch_5f
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->M:Ljava/lang/Object;

    .line 512
    goto :goto_39

    .line 514
    :sswitch_62
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->d:Ljava/lang/Object;

    .line 515
    goto :goto_39

    .line 517
    :sswitch_65
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->H:Ljava/lang/Object;

    .line 518
    goto :goto_39

    .line 520
    :sswitch_68
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->m:Ljava/lang/Object;

    .line 521
    goto :goto_39

    .line 523
    :sswitch_6b
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->s:Ljava/lang/Object;

    .line 524
    goto :goto_39

    .line 526
    :sswitch_6e
    sget-object v7, Lorg/apache/commons/lang3/time/DurationFormatUtils;->S:Ljava/lang/Object;

    .line 527
    goto :goto_39

    .line 540
    .end local v7    # "value":Ljava/lang/Object;
    :cond_71
    new-instance v6, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    invoke-direct {v6, v7}, Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    .line 541
    .local v6, "token":Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 542
    move-object v5, v6

    goto :goto_46

    .line 547
    .end local v1    # "ch":C
    .end local v6    # "token":Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;
    :cond_7b
    if-eqz v3, :cond_96

    .line 548
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

    .line 550
    :cond_96
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Lorg/apache/commons/lang3/time/DurationFormatUtils$Token;

    return-object v8

    .line 495
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
    .line 462
    invoke-static {p0, p1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    .line 463
    .local v0, "longString":Ljava/lang/String;
    if-eqz p2, :cond_c

    const/16 v1, 0x30

    invoke-static {v0, p3, v1}, Lorg/apache/commons/lang3/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "longString":Ljava/lang/String;
    :cond_c
    return-object v0
.end method
