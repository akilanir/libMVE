.class public Lorg/apache/commons/codec/language/Metaphone;
.super Ljava/lang/Object;
.source "Metaphone.java"

# interfaces
.implements Lorg/apache/commons/codec/StringEncoder;


# static fields
.field private static final FRONTV:Ljava/lang/String; = "EIY"

.field private static final VARSON:Ljava/lang/String; = "CSPTG"

.field private static final VOWELS:Ljava/lang/String; = "AEIOU"


# instance fields
.field private maxCodeLen:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x4

    iput v0, p0, Lorg/apache/commons/codec/language/Metaphone;->maxCodeLen:I

    .line 73
    return-void
.end method

.method private isLastChar(II)Z
    .registers 4
    .param p1, "wdsz"    # I
    .param p2, "n"    # I

    .prologue
    .line 363
    add-int/lit8 v0, p2, 0x1

    if-ne v0, p1, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private isNextChar(Ljava/lang/StringBuilder;IC)Z
    .registers 6
    .param p1, "string"    # Ljava/lang/StringBuilder;
    .param p2, "index"    # I
    .param p3, "c"    # C

    .prologue
    .line 344
    const/4 v0, 0x0

    .line 345
    .local v0, "matches":Z
    if-ltz p2, :cond_14

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge p2, v1, :cond_14

    .line 347
    add-int/lit8 v1, p2, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    if-ne v1, p3, :cond_15

    const/4 v0, 0x1

    .line 349
    :cond_14
    :goto_14
    return v0

    .line 347
    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method private isPreviousChar(Ljava/lang/StringBuilder;IC)Z
    .registers 6
    .param p1, "string"    # Ljava/lang/StringBuilder;
    .param p2, "index"    # I
    .param p3, "c"    # C

    .prologue
    .line 335
    const/4 v0, 0x0

    .line 336
    .local v0, "matches":Z
    if-lez p2, :cond_12

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-ge p2, v1, :cond_12

    .line 338
    add-int/lit8 v1, p2, -0x1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    if-ne v1, p3, :cond_13

    const/4 v0, 0x1

    .line 340
    :cond_12
    :goto_12
    return v0

    .line 338
    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method private isVowel(Ljava/lang/StringBuilder;I)Z
    .registers 5
    .param p1, "string"    # Ljava/lang/StringBuilder;
    .param p2, "index"    # I

    .prologue
    .line 331
    const-string v0, "AEIOU"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private regionMatch(Ljava/lang/StringBuilder;ILjava/lang/String;)Z
    .registers 8
    .param p1, "string"    # Ljava/lang/StringBuilder;
    .param p2, "index"    # I
    .param p3, "test"    # Ljava/lang/String;

    .prologue
    .line 353
    const/4 v0, 0x0

    .line 354
    .local v0, "matches":Z
    if-ltz p2, :cond_1d

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, p2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-ge v2, v3, :cond_1d

    .line 356
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, p2

    invoke-virtual {p1, p2, v2}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 357
    .local v1, "substring":Ljava/lang/String;
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 359
    .end local v1    # "substring":Ljava/lang/String;
    :cond_1d
    return v0
.end method


# virtual methods
.method public encode(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/EncoderException;
        }
    .end annotation

    .prologue
    .line 381
    instance-of v0, p1, Ljava/lang/String;

    if-nez v0, :cond_c

    .line 382
    new-instance v0, Lorg/apache/commons/codec/EncoderException;

    const-string v1, "Parameter supplied to Metaphone encode is not of type java.lang.String"

    invoke-direct {v0, v1}, Lorg/apache/commons/codec/EncoderException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 384
    :cond_c
    check-cast p1, Ljava/lang/String;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/language/Metaphone;->metaphone(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 395
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/language/Metaphone;->metaphone(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMaxCodeLen()I
    .registers 2

    .prologue
    .line 414
    iget v0, p0, Lorg/apache/commons/codec/language/Metaphone;->maxCodeLen:I

    return v0
.end method

.method public isMetaphoneEqual(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "str1"    # Ljava/lang/String;
    .param p2, "str2"    # Ljava/lang/String;

    .prologue
    .line 407
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/language/Metaphone;->metaphone(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/apache/commons/codec/language/Metaphone;->metaphone(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public metaphone(Ljava/lang/String;)Ljava/lang/String;
    .registers 16
    .param p1, "txt"    # Ljava/lang/String;

    .prologue
    const/16 v13, 0x58

    const/16 v12, 0x4b

    const/16 v11, 0x53

    const/16 v10, 0x48

    const/4 v9, 0x1

    .line 86
    const/4 v1, 0x0

    .line 87
    .local v1, "hard":Z
    if-eqz p1, :cond_12

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_15

    .line 88
    :cond_12
    const-string v7, ""

    .line 327
    :goto_14
    return-object v7

    .line 91
    :cond_15
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-ne v7, v9, :cond_22

    .line 92
    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v7}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    goto :goto_14

    .line 95
    :cond_22
    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v7}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 97
    .local v2, "inwd":[C
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v7, 0x28

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 98
    .local v3, "local":Ljava/lang/StringBuilder;
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v7, 0xa

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 100
    .local v0, "code":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    aget-char v7, v2, v7

    sparse-switch v7, :sswitch_data_2b4

    .line 134
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 137
    :goto_43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    .line 138
    .local v6, "wdsz":I
    const/4 v4, 0x0

    .line 140
    .local v4, "n":I
    :cond_48
    :goto_48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    invoke-virtual {p0}, Lorg/apache/commons/codec/language/Metaphone;->getMaxCodeLen()I

    move-result v8

    if-ge v7, v8, :cond_2ad

    if-ge v4, v6, :cond_2ad

    .line 142
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v5

    .line 144
    .local v5, "symb":C
    const/16 v7, 0x43

    if-eq v5, v7, :cond_c1

    invoke-direct {p0, v3, v4, v5}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-eqz v7, :cond_c1

    .line 145
    add-int/lit8 v4, v4, 0x1

    .line 323
    :goto_64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    invoke-virtual {p0}, Lorg/apache/commons/codec/language/Metaphone;->getMaxCodeLen()I

    move-result v8

    if-le v7, v8, :cond_48

    .line 324
    invoke-virtual {p0}, Lorg/apache/commons/codec/language/Metaphone;->getMaxCodeLen()I

    move-result v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_48

    .line 104
    .end local v4    # "n":I
    .end local v5    # "symb":C
    .end local v6    # "wdsz":I
    :sswitch_76
    aget-char v7, v2, v9

    const/16 v8, 0x4e

    if-ne v7, v8, :cond_83

    .line 105
    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v3, v2, v9, v7}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_43

    .line 107
    :cond_83
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_43

    .line 111
    :sswitch_87
    aget-char v7, v2, v9

    const/16 v8, 0x45

    if-ne v7, v8, :cond_94

    .line 112
    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v3, v2, v9, v7}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_43

    .line 114
    :cond_94
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_43

    .line 118
    :sswitch_98
    aget-char v7, v2, v9

    const/16 v8, 0x52

    if-ne v7, v8, :cond_a5

    .line 119
    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v3, v2, v9, v7}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_43

    .line 122
    :cond_a5
    aget-char v7, v2, v9

    if-ne v7, v10, :cond_b6

    .line 123
    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v3, v2, v9, v7}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 124
    const/4 v7, 0x0

    const/16 v8, 0x57

    invoke-virtual {v3, v7, v8}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_43

    .line 126
    :cond_b6
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_43

    .line 130
    :sswitch_ba
    const/4 v7, 0x0

    aput-char v11, v2, v7

    .line 131
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_43

    .line 147
    .restart local v4    # "n":I
    .restart local v5    # "symb":C
    .restart local v6    # "wdsz":I
    :cond_c1
    packed-switch v5, :pswitch_data_2ce

    .line 321
    :cond_c4
    :goto_c4
    add-int/lit8 v4, v4, 0x1

    goto :goto_64

    .line 153
    :pswitch_c7
    if-nez v4, :cond_c4

    .line 154
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_c4

    .line 158
    :pswitch_cd
    const/16 v7, 0x4d

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-eqz v7, :cond_db

    invoke-direct {p0, v6, v4}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    move-result v7

    if-nez v7, :cond_c4

    .line 162
    :cond_db
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_c4

    .line 166
    :pswitch_df
    invoke-direct {p0, v3, v4, v11}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-eqz v7, :cond_f9

    invoke-direct {p0, v6, v4}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    move-result v7

    if-nez v7, :cond_f9

    const-string v7, "EIY"

    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-gez v7, :cond_c4

    .line 171
    :cond_f9
    const-string v7, "CIA"

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuilder;ILjava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_105

    .line 172
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_c4

    .line 175
    :cond_105
    invoke-direct {p0, v6, v4}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    move-result v7

    if-nez v7, :cond_11d

    const-string v7, "EIY"

    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :cond_11d

    .line 177
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_c4

    .line 180
    :cond_11d
    invoke-direct {p0, v3, v4, v11}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-eqz v7, :cond_12d

    invoke-direct {p0, v3, v4, v10}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-eqz v7, :cond_12d

    .line 182
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_c4

    .line 185
    :cond_12d
    invoke-direct {p0, v3, v4, v10}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-eqz v7, :cond_148

    .line 186
    if-nez v4, :cond_143

    const/4 v7, 0x3

    if-lt v6, v7, :cond_143

    const/4 v7, 0x2

    invoke-direct {p0, v3, v7}, Lorg/apache/commons/codec/language/Metaphone;->isVowel(Ljava/lang/StringBuilder;I)Z

    move-result v7

    if-eqz v7, :cond_143

    .line 189
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_c4

    .line 191
    :cond_143
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 194
    :cond_148
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 198
    :pswitch_14d
    add-int/lit8 v7, v4, 0x1

    invoke-direct {p0, v6, v7}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    move-result v7

    if-nez v7, :cond_174

    const/16 v7, 0x47

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-eqz v7, :cond_174

    const-string v7, "EIY"

    add-int/lit8 v8, v4, 0x2

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :cond_174

    .line 201
    const/16 v7, 0x4a

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x2

    goto/16 :goto_c4

    .line 203
    :cond_174
    const/16 v7, 0x54

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 207
    :pswitch_17b
    add-int/lit8 v7, v4, 0x1

    invoke-direct {p0, v6, v7}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    move-result v7

    if-eqz v7, :cond_189

    invoke-direct {p0, v3, v4, v10}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-nez v7, :cond_c4

    .line 211
    :cond_189
    add-int/lit8 v7, v4, 0x1

    invoke-direct {p0, v6, v7}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    move-result v7

    if-nez v7, :cond_19f

    invoke-direct {p0, v3, v4, v10}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-eqz v7, :cond_19f

    add-int/lit8 v7, v4, 0x2

    invoke-direct {p0, v3, v7}, Lorg/apache/commons/codec/language/Metaphone;->isVowel(Ljava/lang/StringBuilder;I)Z

    move-result v7

    if-eqz v7, :cond_c4

    .line 216
    :cond_19f
    if-lez v4, :cond_1b1

    const-string v7, "GN"

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuilder;ILjava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_c4

    const-string v7, "GNED"

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuilder;ILjava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_c4

    .line 221
    :cond_1b1
    const/16 v7, 0x47

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-eqz v7, :cond_1d7

    .line 223
    const/4 v1, 0x1

    .line 227
    :goto_1ba
    invoke-direct {p0, v6, v4}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    move-result v7

    if-nez v7, :cond_1d9

    const-string v7, "EIY"

    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :cond_1d9

    if-nez v1, :cond_1d9

    .line 230
    const/16 v7, 0x4a

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 225
    :cond_1d7
    const/4 v1, 0x0

    goto :goto_1ba

    .line 232
    :cond_1d9
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 236
    :pswitch_1de
    invoke-direct {p0, v6, v4}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    move-result v7

    if-nez v7, :cond_c4

    .line 239
    if-lez v4, :cond_1f4

    const-string v7, "CSPTG"

    add-int/lit8 v8, v4, -0x1

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-gez v7, :cond_c4

    .line 243
    :cond_1f4
    add-int/lit8 v7, v4, 0x1

    invoke-direct {p0, v3, v7}, Lorg/apache/commons/codec/language/Metaphone;->isVowel(Ljava/lang/StringBuilder;I)Z

    move-result v7

    if-eqz v7, :cond_c4

    .line 244
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 253
    :pswitch_201
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 256
    :pswitch_206
    if-lez v4, :cond_215

    .line 257
    const/16 v7, 0x43

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-nez v7, :cond_c4

    .line 258
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 261
    :cond_215
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 265
    :pswitch_21a
    invoke-direct {p0, v3, v4, v10}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuilder;IC)Z

    move-result v7

    if-eqz v7, :cond_227

    .line 267
    const/16 v7, 0x46

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 269
    :cond_227
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 273
    :pswitch_22c
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 276
    :pswitch_231
    const-string v7, "SH"

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuilder;ILjava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_249

    const-string v7, "SIO"

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuilder;ILjava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_249

    const-string v7, "SIA"

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuilder;ILjava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_24e

    .line 279
    :cond_249
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 281
    :cond_24e
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 285
    :pswitch_253
    const-string v7, "TIA"

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuilder;ILjava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_263

    const-string v7, "TIO"

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuilder;ILjava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_268

    .line 287
    :cond_263
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 290
    :cond_268
    const-string v7, "TCH"

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuilder;ILjava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_c4

    .line 295
    const-string v7, "TH"

    invoke-direct {p0, v3, v4, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuilder;ILjava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_27f

    .line 296
    const/16 v7, 0x30

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 298
    :cond_27f
    const/16 v7, 0x54

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 302
    :pswitch_286
    const/16 v7, 0x46

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 305
    :pswitch_28d
    invoke-direct {p0, v6, v4}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    move-result v7

    if-nez v7, :cond_c4

    add-int/lit8 v7, v4, 0x1

    invoke-direct {p0, v3, v7}, Lorg/apache/commons/codec/language/Metaphone;->isVowel(Ljava/lang/StringBuilder;I)Z

    move-result v7

    if-eqz v7, :cond_c4

    .line 307
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 311
    :pswitch_2a0
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 312
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 315
    :pswitch_2a8
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_c4

    .line 327
    .end local v5    # "symb":C
    :cond_2ad
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_14

    .line 100
    nop

    :sswitch_data_2b4
    .sparse-switch
        0x41 -> :sswitch_87
        0x47 -> :sswitch_76
        0x4b -> :sswitch_76
        0x50 -> :sswitch_76
        0x57 -> :sswitch_98
        0x58 -> :sswitch_ba
    .end sparse-switch

    .line 147
    :pswitch_data_2ce
    .packed-switch 0x41
        :pswitch_c7
        :pswitch_cd
        :pswitch_df
        :pswitch_14d
        :pswitch_c7
        :pswitch_201
        :pswitch_17b
        :pswitch_1de
        :pswitch_c7
        :pswitch_201
        :pswitch_206
        :pswitch_201
        :pswitch_201
        :pswitch_201
        :pswitch_c7
        :pswitch_21a
        :pswitch_22c
        :pswitch_201
        :pswitch_231
        :pswitch_253
        :pswitch_c7
        :pswitch_286
        :pswitch_28d
        :pswitch_2a0
        :pswitch_28d
        :pswitch_2a8
    .end packed-switch
.end method

.method public setMaxCodeLen(I)V
    .registers 2
    .param p1, "maxCodeLen"    # I

    .prologue
    .line 420
    iput p1, p0, Lorg/apache/commons/codec/language/Metaphone;->maxCodeLen:I

    return-void
.end method
