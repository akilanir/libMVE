.class public final Lcom/fasterxml/jackson/core/io/NumberInput;
.super Ljava/lang/Object;
.source "NumberInput.java"


# static fields
.field static final L_BILLION:J = 0x3b9aca00L

.field static final MAX_LONG_STR:Ljava/lang/String;

.field static final MIN_LONG_STR_NO_SIGN:Ljava/lang/String;

.field public static final NASTY_SMALL_DOUBLE:Ljava/lang/String; = "2.2250738585072012e-308"


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 18
    const-wide/high16 v0, -0x8000000000000000L

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/io/NumberInput;->MIN_LONG_STR_NO_SIGN:Ljava/lang/String;

    .line 19
    const-wide v0, 0x7fffffffffffffffL

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/io/NumberInput;->MAX_LONG_STR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static _badBigDecimal(Ljava/lang/String;)Ljava/lang/NumberFormatException;
    .registers 4

    .prologue
    .line 317
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Value \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" can not be represented as BigDecimal"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static inLongRange(Ljava/lang/String;Z)Z
    .registers 9

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 173
    if-eqz p1, :cond_11

    sget-object v0, Lcom/fasterxml/jackson/core/io/NumberInput;->MIN_LONG_STR_NO_SIGN:Ljava/lang/String;

    .line 174
    :goto_6
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    .line 175
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 176
    if-ge v3, v4, :cond_14

    .line 186
    :cond_10
    :goto_10
    return v1

    .line 173
    :cond_11
    sget-object v0, Lcom/fasterxml/jackson/core/io/NumberInput;->MAX_LONG_STR:Ljava/lang/String;

    goto :goto_6

    .line 177
    :cond_14
    if-le v3, v4, :cond_18

    move v1, v2

    goto :goto_10

    :cond_18
    move v3, v2

    .line 180
    :goto_19
    if-ge v3, v4, :cond_10

    .line 181
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    sub-int/2addr v5, v6

    .line 182
    if-eqz v5, :cond_2d

    .line 183
    if-gez v5, :cond_2b

    move v0, v1

    :goto_29
    move v1, v0

    goto :goto_10

    :cond_2b
    move v0, v2

    goto :goto_29

    .line 180
    :cond_2d
    add-int/lit8 v3, v3, 0x1

    goto :goto_19
.end method

.method public static inLongRange([CIIZ)Z
    .registers 11

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 150
    if-eqz p3, :cond_d

    sget-object v0, Lcom/fasterxml/jackson/core/io/NumberInput;->MIN_LONG_STR_NO_SIGN:Ljava/lang/String;

    .line 151
    :goto_6
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    .line 152
    if-ge p2, v4, :cond_10

    .line 161
    :cond_c
    :goto_c
    return v1

    .line 150
    :cond_d
    sget-object v0, Lcom/fasterxml/jackson/core/io/NumberInput;->MAX_LONG_STR:Ljava/lang/String;

    goto :goto_6

    .line 153
    :cond_10
    if-le p2, v4, :cond_14

    move v1, v2

    goto :goto_c

    :cond_14
    move v3, v2

    .line 155
    :goto_15
    if-ge v3, v4, :cond_c

    .line 156
    add-int v5, p1, v3

    aget-char v5, p0, v5

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    sub-int/2addr v5, v6

    .line 157
    if-eqz v5, :cond_29

    .line 158
    if-gez v5, :cond_27

    move v0, v1

    :goto_25
    move v1, v0

    goto :goto_c

    :cond_27
    move v0, v2

    goto :goto_25

    .line 155
    :cond_29
    add-int/lit8 v3, v3, 0x1

    goto :goto_15
.end method

.method public static parseAsDouble(Ljava/lang/String;D)D
    .registers 5

    .prologue
    .line 267
    if-nez p0, :cond_3

    .line 278
    :cond_2
    :goto_2
    return-wide p1

    .line 270
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 271
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 272
    if-eqz v1, :cond_2

    .line 276
    :try_start_d
    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseDouble(Ljava/lang/String;)D
    :try_end_10
    .catch Ljava/lang/NumberFormatException; {:try_start_d .. :try_end_10} :catch_12

    move-result-wide p1

    goto :goto_2

    .line 277
    :catch_12
    move-exception v0

    goto :goto_2
.end method

.method public static parseAsInt(Ljava/lang/String;I)I
    .registers 8

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 191
    if-nez p0, :cond_5

    .line 224
    :cond_4
    :goto_4
    return p1

    .line 194
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 195
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    .line 196
    if-eqz v2, :cond_4

    .line 201
    if-ge v0, v2, :cond_49

    .line 202
    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 203
    const/16 v5, 0x2b

    if-ne v4, v5, :cond_35

    .line 204
    invoke-virtual {v3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 205
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 210
    :goto_21
    if-ge v0, v1, :cond_40

    .line 211
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 213
    const/16 v4, 0x39

    if-gt v3, v4, :cond_2f

    const/16 v4, 0x30

    if-ge v3, v4, :cond_3d

    .line 215
    :cond_2f
    :try_start_2f
    invoke-static {v2}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseDouble(Ljava/lang/String;)D
    :try_end_32
    .catch Ljava/lang/NumberFormatException; {:try_start_2f .. :try_end_32} :catch_45

    move-result-wide v0

    double-to-int p1, v0

    goto :goto_4

    .line 206
    :cond_35
    const/16 v5, 0x2d

    if-ne v4, v5, :cond_49

    move v0, v1

    move v1, v2

    move-object v2, v3

    .line 207
    goto :goto_21

    .line 210
    :cond_3d
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 222
    :cond_40
    :try_start_40
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_43
    .catch Ljava/lang/NumberFormatException; {:try_start_40 .. :try_end_43} :catch_47

    move-result p1

    goto :goto_4

    .line 216
    :catch_45
    move-exception v0

    goto :goto_4

    .line 223
    :catch_47
    move-exception v0

    goto :goto_4

    :cond_49
    move v1, v2

    move-object v2, v3

    goto :goto_21
.end method

.method public static parseAsLong(Ljava/lang/String;J)J
    .registers 9

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 229
    if-nez p0, :cond_5

    .line 262
    :cond_4
    :goto_4
    return-wide p1

    .line 232
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 233
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    .line 234
    if-eqz v2, :cond_4

    .line 239
    if-ge v0, v2, :cond_49

    .line 240
    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 241
    const/16 v5, 0x2b

    if-ne v4, v5, :cond_35

    .line 242
    invoke-virtual {v3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 243
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 248
    :goto_21
    if-ge v0, v1, :cond_40

    .line 249
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 251
    const/16 v4, 0x39

    if-gt v3, v4, :cond_2f

    const/16 v4, 0x30

    if-ge v3, v4, :cond_3d

    .line 253
    :cond_2f
    :try_start_2f
    invoke-static {v2}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseDouble(Ljava/lang/String;)D
    :try_end_32
    .catch Ljava/lang/NumberFormatException; {:try_start_2f .. :try_end_32} :catch_45

    move-result-wide v0

    double-to-long p1, v0

    goto :goto_4

    .line 244
    :cond_35
    const/16 v5, 0x2d

    if-ne v4, v5, :cond_49

    move v0, v1

    move v1, v2

    move-object v2, v3

    .line 245
    goto :goto_21

    .line 248
    :cond_3d
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 260
    :cond_40
    :try_start_40
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_43
    .catch Ljava/lang/NumberFormatException; {:try_start_40 .. :try_end_43} :catch_47

    move-result-wide p1

    goto :goto_4

    .line 254
    :catch_45
    move-exception v0

    goto :goto_4

    .line 261
    :catch_47
    move-exception v0

    goto :goto_4

    :cond_49
    move v1, v2

    move-object v2, v3

    goto :goto_21
.end method

.method public static parseBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 296
    :try_start_0
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_5} :catch_6

    return-object v0

    .line 297
    :catch_6
    move-exception v0

    .line 298
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/NumberInput;->_badBigDecimal(Ljava/lang/String;)Ljava/lang/NumberFormatException;

    move-result-object v0

    throw v0
.end method

.method public static parseBigDecimal([C)Ljava/math/BigDecimal;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 303
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseBigDecimal([CII)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method

.method public static parseBigDecimal([CII)Ljava/math/BigDecimal;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 310
    :try_start_0
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0, p1, p2}, Ljava/math/BigDecimal;-><init>([CII)V
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_5} :catch_6

    return-object v0

    .line 311
    :catch_6
    move-exception v0

    .line 312
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0, p1, p2}, Ljava/lang/String;-><init>([CII)V

    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/NumberInput;->_badBigDecimal(Ljava/lang/String;)Ljava/lang/NumberFormatException;

    move-result-object v0

    throw v0
.end method

.method public static parseDouble(Ljava/lang/String;)D
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 287
    const-string v0, "2.2250738585072012e-308"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 288
    const-wide/16 v0, 0x1

    .line 290
    :goto_a
    return-wide v0

    :cond_b
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_a
.end method

.method public static parseInt(Ljava/lang/String;)I
    .registers 9

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    const/16 v6, 0x39

    const/16 v5, 0x30

    .line 70
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 71
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 72
    const/16 v3, 0x2d

    if-ne v0, v3, :cond_20

    move v3, v1

    .line 76
    :goto_13
    if-eqz v3, :cond_33

    .line 77
    if-eq v4, v1, :cond_1b

    const/16 v0, 0xa

    if-le v4, v0, :cond_22

    .line 78
    :cond_1b
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 114
    :cond_1f
    :goto_1f
    return v0

    :cond_20
    move v3, v2

    .line 72
    goto :goto_13

    .line 80
    :cond_22
    const/4 v0, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    move v7, v0

    move v0, v1

    move v1, v7

    .line 86
    :cond_2a
    if-gt v0, v6, :cond_2e

    if-ge v0, v5, :cond_3c

    .line 87
    :cond_2e
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_1f

    .line 82
    :cond_33
    const/16 v2, 0x9

    if-le v4, v2, :cond_2a

    .line 83
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_1f

    .line 89
    :cond_3c
    add-int/lit8 v0, v0, -0x30

    .line 90
    if-ge v1, v4, :cond_82

    .line 91
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 92
    if-gt v1, v6, :cond_4a

    if-ge v1, v5, :cond_4f

    .line 93
    :cond_4a
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_1f

    .line 95
    :cond_4f
    mul-int/lit8 v0, v0, 0xa

    add-int/lit8 v1, v1, -0x30

    add-int/2addr v0, v1

    .line 96
    if-ge v2, v4, :cond_82

    .line 97
    add-int/lit8 v1, v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 98
    if-gt v2, v6, :cond_60

    if-ge v2, v5, :cond_65

    .line 99
    :cond_60
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_1f

    .line 101
    :cond_65
    mul-int/lit8 v0, v0, 0xa

    add-int/lit8 v2, v2, -0x30

    add-int/2addr v0, v2

    .line 103
    if-ge v1, v4, :cond_82

    .line 105
    :goto_6c
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 106
    if-gt v1, v6, :cond_76

    if-ge v1, v5, :cond_7b

    .line 107
    :cond_76
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_1f

    .line 109
    :cond_7b
    mul-int/lit8 v0, v0, 0xa

    add-int/lit8 v1, v1, -0x30

    add-int/2addr v0, v1

    .line 110
    if-lt v2, v4, :cond_86

    .line 114
    :cond_82
    if-eqz v3, :cond_1f

    neg-int v0, v0

    goto :goto_1f

    :cond_86
    move v1, v2

    goto :goto_6c
.end method

.method public static parseInt([CII)I
    .registers 7

    .prologue
    .line 30
    aget-char v0, p0, p1

    add-int/lit8 v0, v0, -0x30

    .line 31
    add-int v1, p2, p1

    .line 33
    add-int/lit8 v2, p1, 0x1

    if-ge v2, v1, :cond_5e

    .line 34
    mul-int/lit8 v0, v0, 0xa

    aget-char v3, p0, v2

    add-int/lit8 v3, v3, -0x30

    add-int/2addr v0, v3

    .line 35
    add-int/lit8 v2, v2, 0x1

    if-ge v2, v1, :cond_5e

    .line 36
    mul-int/lit8 v0, v0, 0xa

    aget-char v3, p0, v2

    add-int/lit8 v3, v3, -0x30

    add-int/2addr v0, v3

    .line 37
    add-int/lit8 v2, v2, 0x1

    if-ge v2, v1, :cond_5e

    .line 38
    mul-int/lit8 v0, v0, 0xa

    aget-char v3, p0, v2

    add-int/lit8 v3, v3, -0x30

    add-int/2addr v0, v3

    .line 39
    add-int/lit8 v2, v2, 0x1

    if-ge v2, v1, :cond_5e

    .line 40
    mul-int/lit8 v0, v0, 0xa

    aget-char v3, p0, v2

    add-int/lit8 v3, v3, -0x30

    add-int/2addr v0, v3

    .line 41
    add-int/lit8 v2, v2, 0x1

    if-ge v2, v1, :cond_5e

    .line 42
    mul-int/lit8 v0, v0, 0xa

    aget-char v3, p0, v2

    add-int/lit8 v3, v3, -0x30

    add-int/2addr v0, v3

    .line 43
    add-int/lit8 v2, v2, 0x1

    if-ge v2, v1, :cond_5e

    .line 44
    mul-int/lit8 v0, v0, 0xa

    aget-char v3, p0, v2

    add-int/lit8 v3, v3, -0x30

    add-int/2addr v0, v3

    .line 45
    add-int/lit8 v2, v2, 0x1

    if-ge v2, v1, :cond_5e

    .line 46
    mul-int/lit8 v0, v0, 0xa

    aget-char v3, p0, v2

    add-int/lit8 v3, v3, -0x30

    add-int/2addr v0, v3

    .line 47
    add-int/lit8 v2, v2, 0x1

    if-ge v2, v1, :cond_5e

    .line 48
    mul-int/lit8 v0, v0, 0xa

    aget-char v1, p0, v2

    add-int/lit8 v1, v1, -0x30

    add-int/2addr v0, v1

    .line 57
    :cond_5e
    return v0
.end method

.method public static parseLong(Ljava/lang/String;)J
    .registers 3

    .prologue
    .line 130
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 131
    const/16 v1, 0x9

    if-gt v0, v1, :cond_e

    .line 132
    invoke-static {p0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseInt(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    .line 135
    :goto_d
    return-wide v0

    :cond_e
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    goto :goto_d
.end method

.method public static parseLong([CII)J
    .registers 8

    .prologue
    .line 120
    add-int/lit8 v0, p2, -0x9

    .line 121
    invoke-static {p0, p1, v0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseInt([CII)I

    move-result v1

    int-to-long v1, v1

    const-wide/32 v3, 0x3b9aca00

    mul-long/2addr v1, v3

    .line 122
    add-int/2addr v0, p1

    const/16 v3, 0x9

    invoke-static {p0, v0, v3}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseInt([CII)I

    move-result v0

    int-to-long v3, v0

    add-long v0, v1, v3

    return-wide v0
.end method
