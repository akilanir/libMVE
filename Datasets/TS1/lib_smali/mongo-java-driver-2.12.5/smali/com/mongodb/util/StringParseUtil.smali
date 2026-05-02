.class public final Lcom/mongodb/util/StringParseUtil;
.super Ljava/lang/Object;
.source "StringParseUtil.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseBoolean(Ljava/lang/String;Z)Z
    .registers 5
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "d"    # Z

    .prologue
    const/4 v1, 0x0

    .line 34
    if-nez p0, :cond_4

    .line 51
    .end local p1    # "d":Z
    :cond_3
    :goto_3
    return p1

    .line 37
    .restart local p1    # "d":Z
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3

    .line 41
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 43
    .local v0, "c":C
    const/16 v2, 0x74

    if-eq v0, v2, :cond_22

    const/16 v2, 0x54

    if-eq v0, v2, :cond_22

    const/16 v2, 0x79

    if-eq v0, v2, :cond_22

    const/16 v2, 0x59

    if-ne v0, v2, :cond_24

    .line 45
    :cond_22
    const/4 p1, 0x1

    goto :goto_3

    .line 47
    :cond_24
    const/16 v2, 0x66

    if-eq v0, v2, :cond_34

    const/16 v2, 0x46

    if-eq v0, v2, :cond_34

    const/16 v2, 0x6e

    if-eq v0, v2, :cond_34

    const/16 v2, 0x4e

    if-ne v0, v2, :cond_3

    :cond_34
    move p1, v1

    .line 49
    goto :goto_3
.end method

.method public static parseIfInt(Ljava/lang/String;I)I
    .registers 4
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "def"    # I

    .prologue
    .line 258
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_9

    .line 267
    .end local p1    # "def":I
    :cond_8
    :goto_8
    return p1

    .line 261
    .restart local p1    # "def":I
    :cond_9
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 263
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_21

    .line 264
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 263
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 267
    :cond_21
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    goto :goto_8
.end method

.method public static parseInt(Ljava/lang/String;I)I
    .registers 4
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "def"    # I

    .prologue
    .line 60
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lcom/mongodb/util/StringParseUtil;->parseInt(Ljava/lang/String;I[IZ)I

    move-result v0

    return v0
.end method

.method public static parseInt(Ljava/lang/String;I[IZ)I
    .registers 11
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "def"    # I
    .param p2, "lastIdx"    # [I
    .param p3, "allowNegative"    # Z

    .prologue
    const/4 v4, 0x0

    .line 103
    if-eqz p2, :cond_f

    array-length v5, p2

    if-lez v5, :cond_f

    const/4 v3, 0x1

    .line 104
    .local v3, "useLastIdx":Z
    :goto_7
    if-eqz v3, :cond_c

    .line 105
    const/4 v5, -0x1

    aput v5, p2, v4

    .line 107
    :cond_c
    if-nez p0, :cond_11

    .line 134
    .end local p1    # "def":I
    :cond_e
    :goto_e
    return p1

    .end local v3    # "useLastIdx":Z
    .restart local p1    # "def":I
    :cond_f
    move v3, v4

    .line 103
    goto :goto_7

    .line 110
    .restart local v3    # "useLastIdx":Z
    :cond_11
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 111
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_e

    .line 114
    const/4 v0, -0x1

    .line 115
    .local v0, "firstDigit":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1d
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_2e

    .line 116
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_45

    .line 117
    move v0, v1

    .line 122
    :cond_2e
    if-ltz v0, :cond_e

    .line 125
    add-int/lit8 v2, v0, 0x1

    .line 126
    .local v2, "lastDigit":I
    :goto_32
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_48

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_48

    .line 127
    add-int/lit8 v2, v2, 0x1

    goto :goto_32

    .line 115
    .end local v2    # "lastDigit":I
    :cond_45
    add-int/lit8 v1, v1, 0x1

    goto :goto_1d

    .line 129
    .restart local v2    # "lastDigit":I
    :cond_48
    if-eqz p3, :cond_58

    if-lez v0, :cond_58

    add-int/lit8 v5, v0, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2d

    if-ne v5, v6, :cond_58

    .line 130
    add-int/lit8 v0, v0, -0x1

    .line 132
    :cond_58
    if-eqz v3, :cond_5c

    .line 133
    aput v2, p2, v4

    .line 134
    :cond_5c
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    goto :goto_e
.end method

.method public static parseIntRadix(Ljava/lang/String;I)Ljava/lang/Number;
    .registers 9
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "radix"    # I

    .prologue
    const/4 v4, 0x0

    const-wide/high16 v5, 0x7ff8000000000000L    # Double.NaN

    .line 69
    if-nez p0, :cond_a

    .line 70
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    .line 91
    :goto_9
    return-object v3

    .line 72
    :cond_a
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_19

    .line 74
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    goto :goto_9

    .line 76
    :cond_19
    const/4 v1, -0x1

    .line 77
    .local v1, "firstDigit":I
    const/4 v2, 0x0

    .line 78
    .local v2, "i":I
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2d

    if-ne v3, v4, :cond_24

    .line 79
    const/4 v2, 0x1

    .line 81
    :cond_24
    :goto_24
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_35

    .line 82
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3, p1}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_3f

    .line 88
    :cond_35
    const/4 v3, 0x0

    :try_start_36
    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;I)Ljava/lang/Long;
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_3d} :catch_42

    move-result-object v3

    goto :goto_9

    .line 81
    :cond_3f
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 90
    :catch_42
    move-exception v0

    .line 91
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    goto :goto_9
.end method

.method public static parseNumber(Ljava/lang/String;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 10
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "def"    # Ljava/lang/Number;

    .prologue
    const/16 v7, 0x2e

    .line 143
    if-nez p0, :cond_5

    .line 202
    .end local p1    # "def":Ljava/lang/Number;
    :cond_4
    :goto_4
    return-object p1

    .line 146
    .restart local p1    # "def":Ljava/lang/Number;
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 147
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_4

    .line 151
    const/4 v1, -0x1

    .line 152
    .local v1, "firstDigit":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_22

    .line 153
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_39

    .line 154
    move v1, v2

    .line 159
    :cond_22
    if-ltz v1, :cond_4

    .line 162
    add-int/lit8 v4, v1, 0x1

    .line 163
    .local v4, "lastDigit":I
    :goto_26
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_3c

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_3c

    .line 164
    add-int/lit8 v4, v4, 0x1

    goto :goto_26

    .line 152
    .end local v4    # "lastDigit":I
    :cond_39
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 166
    .restart local v4    # "lastDigit":I
    :cond_3c
    const/4 v3, 0x0

    .line 168
    .local v3, "isDouble":Z
    if-lez v1, :cond_4a

    add-int/lit8 v5, v1, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_4a

    .line 169
    add-int/lit8 v1, v1, -0x1

    .line 170
    const/4 v3, 0x1

    .line 173
    :cond_4a
    if-lez v1, :cond_58

    add-int/lit8 v5, v1, -0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2d

    if-ne v5, v6, :cond_58

    .line 174
    add-int/lit8 v1, v1, -0x1

    .line 176
    :cond_58
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_7a

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v7, :cond_7a

    .line 177
    add-int/lit8 v4, v4, 0x1

    .line 178
    :goto_66
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_79

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_79

    .line 179
    add-int/lit8 v4, v4, 0x1

    goto :goto_66

    .line 181
    :cond_79
    const/4 v3, 0x1

    .line 184
    :cond_7a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_9e

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x45

    if-ne v5, v6, :cond_9e

    .line 185
    add-int/lit8 v4, v4, 0x1

    .line 186
    :goto_8a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_9d

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_9d

    .line 187
    add-int/lit8 v4, v4, 0x1

    goto :goto_8a

    .line 189
    :cond_9d
    const/4 v3, 0x1

    .line 193
    :cond_9e
    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 195
    .local v0, "actual":Ljava/lang/String;
    if-nez v3, :cond_ac

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x11

    if-le v5, v6, :cond_b2

    .line 196
    :cond_ac
    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p1

    goto/16 :goto_4

    .line 199
    :cond_b2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0xa

    if-le v5, v6, :cond_c0

    .line 200
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    goto/16 :goto_4

    .line 202
    :cond_c0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    goto/16 :goto_4
.end method

.method public static parseStrict(Ljava/lang/String;)Ljava/lang/Number;
    .registers 14
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const-wide/high16 v11, 0x4004000000000000L    # 2.5

    const-wide/high16 v9, -0x4020000000000000L    # -0.5

    const/4 v0, -0x1

    const/4 v8, 0x0

    .line 210
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_12

    .line 211
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 254
    :goto_11
    return-object v5

    .line 212
    :cond_12
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x2b

    if-ne v6, v7, :cond_1e

    .line 213
    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 215
    :cond_1e
    const-string v6, "(\\+|-)?Infinity"

    invoke-virtual {p0, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3c

    .line 216
    const-string v5, "-"

    invoke-virtual {p0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_35

    .line 217
    const-wide/high16 v5, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    goto :goto_11

    .line 220
    :cond_35
    const-wide/high16 v5, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    goto :goto_11

    .line 223
    :cond_3c
    const/16 v6, 0x2e

    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ne v6, v0, :cond_4c

    const-string v6, "-0"

    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_51

    .line 225
    :cond_4c
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v5

    goto :goto_11

    .line 228
    :cond_51
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "0x"

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-le v6, v0, :cond_c3

    .line 229
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x2d

    if-ne v6, v7, :cond_86

    .line 230
    .local v0, "coef":I
    :goto_65
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x11

    if-le v5, v6, :cond_88

    .line 231
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Can\'t handle a number this big: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .end local v0    # "coef":I
    :cond_86
    move v0, v5

    .line 229
    goto :goto_65

    .line 236
    .restart local v0    # "coef":I
    :cond_88
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x9

    if-le v5, v6, :cond_aa

    .line 237
    int-to-long v5, v0

    int-to-double v7, v0

    mul-double/2addr v7, v9

    add-double/2addr v7, v11

    double-to-int v7, v7

    invoke-virtual {p0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x10

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(Ljava/lang/String;I)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    mul-long/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    goto/16 :goto_11

    .line 238
    :cond_aa
    int-to-double v5, v0

    mul-double/2addr v5, v9

    add-double/2addr v5, v11

    double-to-int v5, v5

    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x10

    invoke-static {v5, v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    mul-int/2addr v5, v0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    goto/16 :goto_11

    .line 241
    .end local v0    # "coef":I
    :cond_c3
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x65

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 243
    .local v1, "e":I
    if-lez v1, :cond_ef

    .line 244
    invoke-virtual {p0, v8, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    .line 245
    .local v3, "num":D
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 246
    .local v2, "exp":I
    const-wide/high16 v5, 0x4024000000000000L    # 10.0

    int-to-double v7, v2

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    mul-double/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    goto/16 :goto_11

    .line 250
    .end local v2    # "exp":I
    .end local v3    # "num":D
    :cond_ef
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x11

    if-le v5, v6, :cond_fd

    .line 251
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v5

    goto/16 :goto_11

    .line 252
    :cond_fd
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x9

    if-le v5, v6, :cond_10b

    .line 253
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    goto/16 :goto_11

    .line 254
    :cond_10b
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    goto/16 :goto_11
.end method
