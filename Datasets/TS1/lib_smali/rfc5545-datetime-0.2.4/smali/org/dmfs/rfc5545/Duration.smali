.class public final Lorg/dmfs/rfc5545/Duration;
.super Ljava/lang/Object;


# static fields
.field private static final PARSER_STATE_D:I = 0x3

.field private static final PARSER_STATE_H:I = 0x5

.field private static final PARSER_STATE_M:I = 0x6

.field private static final PARSER_STATE_P:I = 0x1

.field private static final PARSER_STATE_S:I = 0x7

.field private static final PARSER_STATE_SIGN:I = 0x0

.field private static final PARSER_STATE_T:I = 0x4

.field private static final PARSER_STATE_W:I = 0x8


# instance fields
.field private final mDays:I

.field private final mSign:I

.field private final mTime:I


# direct methods
.method public constructor <init>(II)V
    .registers 5

    mul-int/lit8 v0, p2, 0x7

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/dmfs/rfc5545/Duration;-><init>(III)V

    return-void
.end method

.method public constructor <init>(III)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-eq p1, v0, :cond_11

    const/4 v0, -0x1

    if-eq p1, v0, :cond_11

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "sign must be 1 or -1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_11
    if-ltz p2, :cond_15

    if-gez p3, :cond_1d

    :cond_15
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Duration values must be >=0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1d
    iput p1, p0, Lorg/dmfs/rfc5545/Duration;->mSign:I

    iput p2, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    iput p3, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    return-void
.end method

.method public constructor <init>(IIIII)V
    .registers 8

    mul-int/lit16 v0, p3, 0xe10

    mul-int/lit8 v1, p4, 0x3c

    add-int/2addr v0, v1

    add-int/2addr v0, p5

    invoke-direct {p0, p1, p2, v0}, Lorg/dmfs/rfc5545/Duration;-><init>(III)V

    return-void
.end method

.method public static parse(Ljava/lang/String;)Lorg/dmfs/rfc5545/Duration;
    .registers 20

    if-eqz p0, :cond_9

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x3

    if-ge v1, v2, :cond_24

    :cond_9
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid Duration string: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_24
    const/4 v12, 0x1

    const/4 v11, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v10, 0x0

    const/4 v4, -0x1

    const/4 v9, -0x1

    const/4 v8, 0x0

    const/4 v7, 0x0

    const/4 v1, 0x0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v14

    move v13, v4

    move v4, v2

    move v2, v12

    move v12, v1

    :goto_38
    if-ge v12, v14, :cond_161

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v15

    const/4 v1, 0x0

    sparse-switch v15, :sswitch_data_19c

    const/16 v1, 0x30

    if-lt v15, v1, :cond_4c

    const/16 v1, 0x39

    if-le v15, v1, :cond_12f

    :cond_4c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected char \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' at position "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :sswitch_6f
    const/4 v2, -0x1

    :sswitch_70
    const/4 v9, 0x0

    move/from16 v16, v7

    move v7, v4

    move v4, v9

    move v9, v11

    move v11, v2

    move/from16 v2, v16

    move/from16 v17, v5

    move v5, v10

    move/from16 v10, v17

    move/from16 v18, v8

    move v8, v3

    move/from16 v3, v18

    :goto_83
    if-gt v13, v4, :cond_89

    if-nez v1, :cond_149

    if-ne v13, v4, :cond_149

    :cond_89
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected char \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' at position "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :sswitch_ac
    const/4 v9, 0x1

    move/from16 v16, v7

    move v7, v4

    move v4, v9

    move v9, v11

    move v11, v2

    move/from16 v2, v16

    move/from16 v17, v5

    move v5, v10

    move/from16 v10, v17

    move/from16 v18, v8

    move v8, v3

    move/from16 v3, v18

    goto :goto_83

    :sswitch_c0
    const/4 v9, 0x0

    const/4 v8, 0x3

    const/4 v3, 0x1

    move/from16 v16, v7

    move v7, v4

    move v4, v8

    move v8, v10

    move v10, v5

    move v5, v9

    move v9, v11

    move v11, v2

    move/from16 v2, v16

    goto :goto_83

    :sswitch_cf
    const/4 v9, 0x4

    const/4 v7, 0x1

    move/from16 v16, v7

    move v7, v4

    move v4, v9

    move v9, v11

    move v11, v2

    move/from16 v2, v16

    move/from16 v17, v5

    move v5, v10

    move/from16 v10, v17

    move/from16 v18, v8

    move v8, v3

    move/from16 v3, v18

    goto :goto_83

    :sswitch_e4
    const/4 v9, 0x0

    const/4 v4, 0x5

    move/from16 v16, v7

    move v7, v10

    move v10, v5

    move v5, v9

    move v9, v11

    move v11, v2

    move/from16 v2, v16

    move/from16 v17, v8

    move v8, v3

    move/from16 v3, v17

    goto :goto_83

    :sswitch_f5
    const/4 v9, 0x0

    const/4 v5, 0x6

    move/from16 v16, v7

    move v7, v4

    move v4, v5

    move v5, v9

    move v9, v11

    move v11, v2

    move/from16 v2, v16

    move/from16 v17, v8

    move v8, v3

    move/from16 v3, v17

    goto/16 :goto_83

    :sswitch_107
    const/4 v9, 0x0

    const/4 v6, 0x7

    move/from16 v16, v7

    move v7, v4

    move v4, v6

    move v6, v10

    move v10, v5

    move v5, v9

    move v9, v11

    move v11, v2

    move/from16 v2, v16

    move/from16 v17, v8

    move v8, v3

    move/from16 v3, v17

    goto/16 :goto_83

    :sswitch_11b
    const/4 v11, 0x0

    const/16 v9, 0x8

    move/from16 v16, v7

    move v7, v4

    move v4, v9

    move v9, v10

    move v10, v5

    move v5, v11

    move v11, v2

    move/from16 v2, v16

    move/from16 v17, v8

    move v8, v3

    move/from16 v3, v17

    goto/16 :goto_83

    :cond_12f
    mul-int/lit8 v1, v10, 0xa

    add-int/lit8 v10, v15, -0x30

    add-int/2addr v10, v1

    const/4 v1, 0x1

    move/from16 v16, v7

    move v7, v4

    move v4, v9

    move v9, v11

    move v11, v2

    move/from16 v2, v16

    move/from16 v17, v5

    move v5, v10

    move/from16 v10, v17

    move/from16 v18, v8

    move v8, v3

    move/from16 v3, v18

    goto/16 :goto_83

    :cond_149
    add-int/lit8 v1, v12, 0x1

    move v12, v1

    move v13, v4

    move/from16 v16, v3

    move v3, v8

    move/from16 v8, v16

    move/from16 v17, v2

    move v2, v11

    move v11, v9

    move v9, v4

    move v4, v7

    move/from16 v7, v17

    move/from16 v18, v5

    move v5, v10

    move/from16 v10, v18

    goto/16 :goto_38

    :cond_161
    const/4 v1, 0x1

    if-le v13, v1, :cond_172

    if-nez v8, :cond_169

    const/4 v1, 0x4

    if-eq v13, v1, :cond_172

    :cond_169
    if-nez v7, :cond_18d

    const/4 v1, 0x4

    if-le v13, v1, :cond_18d

    const/16 v1, 0x8

    if-ge v13, v1, :cond_18d

    :cond_172
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid duration string: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_18d
    if-eqz v11, :cond_195

    new-instance v1, Lorg/dmfs/rfc5545/Duration;

    invoke-direct {v1, v2, v11}, Lorg/dmfs/rfc5545/Duration;-><init>(II)V

    :goto_194
    return-object v1

    :cond_195
    new-instance v1, Lorg/dmfs/rfc5545/Duration;

    invoke-direct/range {v1 .. v6}, Lorg/dmfs/rfc5545/Duration;-><init>(IIIII)V

    goto :goto_194

    nop

    :sswitch_data_19c
    .sparse-switch
        0x2b -> :sswitch_70
        0x2d -> :sswitch_6f
        0x44 -> :sswitch_c0
        0x48 -> :sswitch_e4
        0x4d -> :sswitch_f5
        0x50 -> :sswitch_ac
        0x53 -> :sswitch_107
        0x54 -> :sswitch_cf
        0x57 -> :sswitch_11b
        0x64 -> :sswitch_c0
        0x68 -> :sswitch_e4
        0x6d -> :sswitch_f5
        0x70 -> :sswitch_ac
        0x73 -> :sswitch_107
        0x74 -> :sswitch_cf
        0x77 -> :sswitch_11b
    .end sparse-switch
.end method


# virtual methods
.method public addDuration(Lorg/dmfs/rfc5545/Duration;)Lorg/dmfs/rfc5545/Duration;
    .registers 9

    const v6, 0x15180

    const/4 v5, 0x1

    const/4 v4, -0x1

    if-nez p1, :cond_f

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Duration must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f
    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Duration;->isZero()Z

    move-result v0

    if-eqz v0, :cond_16

    :goto_15
    return-object p0

    :cond_16
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/Duration;->isZero()Z

    move-result v0

    if-eqz v0, :cond_1e

    move-object p0, p1

    goto :goto_15

    :cond_1e
    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mSign:I

    iget v1, p1, Lorg/dmfs/rfc5545/Duration;->mSign:I

    if-ne v0, v1, :cond_37

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    iget v1, p1, Lorg/dmfs/rfc5545/Duration;->mDays:I

    add-int/2addr v0, v1

    iget v1, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    iget v2, p1, Lorg/dmfs/rfc5545/Duration;->mTime:I

    add-int/2addr v1, v2

    new-instance p1, Lorg/dmfs/rfc5545/Duration;

    iget v2, p0, Lorg/dmfs/rfc5545/Duration;->mSign:I

    invoke-direct {p1, v2, v0, v1}, Lorg/dmfs/rfc5545/Duration;-><init>(III)V

    move-object p0, p1

    goto :goto_15

    :cond_37
    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mSign:I

    iget v1, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    mul-int/2addr v0, v1

    iget v1, p1, Lorg/dmfs/rfc5545/Duration;->mSign:I

    iget v2, p1, Lorg/dmfs/rfc5545/Duration;->mDays:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    iget v1, p0, Lorg/dmfs/rfc5545/Duration;->mSign:I

    iget v2, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    mul-int/2addr v1, v2

    iget v2, p1, Lorg/dmfs/rfc5545/Duration;->mSign:I

    iget v3, p1, Lorg/dmfs/rfc5545/Duration;->mTime:I

    mul-int/2addr v2, v3

    add-int/2addr v1, v2

    if-ltz v0, :cond_57

    if-ltz v1, :cond_57

    new-instance p0, Lorg/dmfs/rfc5545/Duration;

    invoke-direct {p0, v5, v0, v1}, Lorg/dmfs/rfc5545/Duration;-><init>(III)V

    goto :goto_15

    :cond_57
    if-gez v0, :cond_63

    if-gez v1, :cond_63

    new-instance p0, Lorg/dmfs/rfc5545/Duration;

    neg-int v0, v0

    neg-int v1, v1

    invoke-direct {p0, v4, v0, v1}, Lorg/dmfs/rfc5545/Duration;-><init>(III)V

    goto :goto_15

    :cond_63
    mul-int/lit8 v0, v0, 0x18

    mul-int/lit16 v0, v0, 0xe10

    add-int/2addr v0, v1

    div-int v1, v0, v6

    rem-int v2, v0, v6

    if-ltz v0, :cond_74

    new-instance p0, Lorg/dmfs/rfc5545/Duration;

    invoke-direct {p0, v5, v1, v2}, Lorg/dmfs/rfc5545/Duration;-><init>(III)V

    goto :goto_15

    :cond_74
    new-instance p0, Lorg/dmfs/rfc5545/Duration;

    neg-int v0, v1

    neg-int v1, v2

    invoke-direct {p0, v4, v0, v1}, Lorg/dmfs/rfc5545/Duration;-><init>(III)V

    goto :goto_15
.end method

.method public addTo(Ljava/util/TimeZone;J)J
    .registers 6

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/Duration;->isZero()Z

    move-result v0

    if-eqz v0, :cond_7

    :goto_6
    return-wide p2

    :cond_7
    if-eqz p1, :cond_f

    invoke-virtual {p1}, Ljava/util/TimeZone;->useDaylightTime()Z

    move-result v0

    if-nez v0, :cond_15

    :cond_f
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/Duration;->toMillis()J

    move-result-wide v0

    add-long/2addr p2, v0

    goto :goto_6

    :cond_15
    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    invoke-direct {v0, p1, p2, p3}, Lorg/dmfs/rfc5545/DateTime;-><init>(Ljava/util/TimeZone;J)V

    invoke-virtual {v0, p0}, Lorg/dmfs/rfc5545/DateTime;->addDuration(Lorg/dmfs/rfc5545/Duration;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide p2

    goto :goto_6
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x0

    instance-of v1, p1, Lorg/dmfs/rfc5545/Duration;

    if-nez v1, :cond_6

    :cond_5
    :goto_5
    return v0

    :cond_6
    check-cast p1, Lorg/dmfs/rfc5545/Duration;

    iget v1, p0, Lorg/dmfs/rfc5545/Duration;->mSign:I

    iget v2, p1, Lorg/dmfs/rfc5545/Duration;->mSign:I

    if-ne v1, v2, :cond_5

    iget v1, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    iget v2, p1, Lorg/dmfs/rfc5545/Duration;->mDays:I

    if-ne v1, v2, :cond_5

    iget v1, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    iget v2, p1, Lorg/dmfs/rfc5545/Duration;->mTime:I

    if-ne v1, v2, :cond_5

    const/4 v0, 0x1

    goto :goto_5
.end method

.method public getDays()I
    .registers 3

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    rem-int/lit8 v0, v0, 0x7

    iget v1, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    add-int/2addr v0, v1

    if-lez v0, :cond_c

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public getHours()I
    .registers 2

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    div-int/lit16 v0, v0, 0xe10

    return v0
.end method

.method public getMinutes()I
    .registers 2

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    div-int/lit8 v0, v0, 0x3c

    rem-int/lit8 v0, v0, 0x3c

    return v0
.end method

.method public getRawDays()I
    .registers 2

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    return v0
.end method

.method public getSeconds()I
    .registers 2

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    rem-int/lit8 v0, v0, 0x3c

    return v0
.end method

.method public getSecondsOfDay()I
    .registers 2

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    return v0
.end method

.method public getSign()I
    .registers 2

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mSign:I

    return v0
.end method

.method public getWeeks()I
    .registers 3

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    rem-int/lit8 v0, v0, 0x7

    iget v1, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    add-int/2addr v0, v1

    if-nez v0, :cond_e

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    div-int/lit8 v0, v0, 0x7

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public hashCode()I
    .registers 4

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mSign:I

    iget v1, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    mul-int/lit8 v1, v1, 0x18

    mul-int/lit16 v1, v1, 0xe10

    iget v2, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    add-int/2addr v1, v2

    mul-int/2addr v0, v1

    return v0
.end method

.method public isZero()Z
    .registers 3

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    iget v1, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    add-int/2addr v0, v1

    if-nez v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public toMillis()J
    .registers 7

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mSign:I

    int-to-long v0, v0

    iget v2, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    int-to-long v2, v2

    const-wide/16 v4, 0x18

    mul-long/2addr v2, v4

    const-wide/16 v4, 0xe10

    mul-long/2addr v2, v4

    iget v4, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    int-to-long v4, v4

    add-long/2addr v2, v4

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/Duration;->writeTo(Ljava/lang/StringBuilder;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Ljava/io/Writer;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mSign:I

    if-gez v0, :cond_11

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    if-gtz v0, :cond_c

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    if-lez v0, :cond_11

    :cond_c
    const/16 v0, 0x2d

    invoke-virtual {p1, v0}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    :cond_11
    const/16 v0, 0x50

    invoke-virtual {p1, v0}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/Duration;->getWeeks()I

    move-result v0

    if-lez v0, :cond_29

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const/16 v0, 0x57

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    :cond_28
    :goto_28
    return-void

    :cond_29
    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    if-lez v0, :cond_3b

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const/16 v0, 0x44

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    :cond_3b
    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    if-eqz v0, :cond_7b

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/Duration;->getHours()I

    move-result v0

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/Duration;->getMinutes()I

    move-result v1

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/Duration;->getSeconds()I

    move-result v2

    const/16 v3, 0x54

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    if-lez v0, :cond_5e

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const/16 v0, 0x48

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    :cond_5e
    if-lez v1, :cond_6c

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const/16 v0, 0x4d

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    :cond_6c
    if-lez v2, :cond_28

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const/16 v0, 0x53

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    goto :goto_28

    :cond_7b
    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    if-nez v0, :cond_28

    const-string v0, "0D"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_28
.end method

.method public writeTo(Ljava/lang/StringBuilder;)V
    .registers 6

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mSign:I

    if-gez v0, :cond_11

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    if-gtz v0, :cond_c

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    if-lez v0, :cond_11

    :cond_c
    const/16 v0, 0x2d

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_11
    const/16 v0, 0x50

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/Duration;->getWeeks()I

    move-result v0

    if-lez v0, :cond_25

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v0, 0x57

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_24
    :goto_24
    return-void

    :cond_25
    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    if-lez v0, :cond_33

    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v0, 0x44

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_33
    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mTime:I

    if-eqz v0, :cond_67

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/Duration;->getHours()I

    move-result v0

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/Duration;->getMinutes()I

    move-result v1

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/Duration;->getSeconds()I

    move-result v2

    const/16 v3, 0x54

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-lez v0, :cond_52

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v0, 0x48

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_52
    if-lez v1, :cond_5c

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v0, 0x4d

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_5c
    if-lez v2, :cond_24

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v0, 0x53

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_24

    :cond_67
    iget v0, p0, Lorg/dmfs/rfc5545/Duration;->mDays:I

    if-nez v0, :cond_24

    const-string v0, "0D"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_24
.end method
