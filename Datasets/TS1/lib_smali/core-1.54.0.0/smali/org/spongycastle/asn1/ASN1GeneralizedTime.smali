.class public Lorg/spongycastle/asn1/ASN1GeneralizedTime;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "ASN1GeneralizedTime.java"


# instance fields
.field private time:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 6
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 93
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    .line 96
    :try_start_9
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getDate()Ljava/util/Date;
    :try_end_c
    .catch Ljava/text/ParseException; {:try_start_9 .. :try_end_c} :catch_d

    .line 102
    return-void

    .line 98
    :catch_d
    move-exception v0

    .line 100
    .local v0, "e":Ljava/text/ParseException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid date string: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .registers 6
    .param p1, "time"    # Ljava/util/Date;

    .prologue
    .line 111
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 112
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMddHHmmss\'Z\'"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 114
    .local v0, "dateF":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/SimpleTimeZone;

    const/4 v2, 0x0

    const-string v3, "Z"

    invoke-direct {v1, v2, v3}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 116
    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    .line 117
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Ljava/util/Locale;)V
    .registers 7
    .param p1, "time"    # Ljava/util/Date;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 129
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 130
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMddHHmmss\'Z\'"

    invoke-direct {v0, v1, p2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 132
    .local v0, "dateF":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/SimpleTimeZone;

    const/4 v2, 0x0

    const-string v3, "Z"

    invoke-direct {v1, v2, v3}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 134
    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    .line 135
    return-void
.end method

.method constructor <init>([B)V
    .registers 2
    .param p1, "bytes"    # [B

    .prologue
    .line 139
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 140
    iput-object p1, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    .line 141
    return-void
.end method

.method private calculateGMTOffset()Ljava/lang/String;
    .registers 8

    .prologue
    .line 208
    const-string v3, "+"

    .line 209
    .local v3, "sign":Ljava/lang/String;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v4

    .line 210
    .local v4, "timeZone":Ljava/util/TimeZone;
    invoke-virtual {v4}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v2

    .line 211
    .local v2, "offset":I
    if-gez v2, :cond_f

    .line 213
    const-string v3, "-"

    .line 214
    neg-int v2, v2

    .line 216
    :cond_f
    const v5, 0x36ee80

    div-int v0, v2, v5

    .line 217
    .local v0, "hours":I
    mul-int/lit8 v5, v0, 0x3c

    mul-int/lit8 v5, v5, 0x3c

    mul-int/lit16 v5, v5, 0x3e8

    sub-int v5, v2, v5

    const v6, 0xea60

    div-int v1, v5, v6

    .line 221
    .local v1, "minutes":I
    :try_start_21
    invoke-virtual {v4}, Ljava/util/TimeZone;->useDaylightTime()Z

    move-result v5

    if-eqz v5, :cond_3b

    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getDate()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 223
    const-string v5, "+"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_36
    .catch Ljava/text/ParseException; {:try_start_21 .. :try_end_36} :catch_67

    move-result v5

    if-eqz v5, :cond_65

    const/4 v5, 0x1

    :goto_3a
    add-int/2addr v0, v5

    .line 231
    :cond_3b
    :goto_3b
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "GMT"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->convert(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->convert(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 223
    :cond_65
    const/4 v5, -0x1

    goto :goto_3a

    .line 226
    :catch_67
    move-exception v5

    goto :goto_3b
.end method

.method private convert(I)Ljava/lang/String;
    .registers 4
    .param p1, "time"    # I

    .prologue
    .line 236
    const/16 v0, 0xa

    if-ge p1, v0, :cond_18

    .line 238
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 241
    :goto_17
    return-object v0

    :cond_18
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_17
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 35
    if-eqz p0, :cond_6

    instance-of v1, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    if-eqz v1, :cond_a

    .line 37
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .end local p0    # "obj":Ljava/lang/Object;
    move-object v1, p0

    .line 44
    :goto_9
    return-object v1

    .line 40
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_a
    instance-of v1, p0, [B

    if-eqz v1, :cond_37

    .line 44
    :try_start_e
    check-cast p0, [B

    .end local p0    # "obj":Ljava/lang/Object;
    check-cast p0, [B

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_18} :catch_19

    goto :goto_9

    .line 46
    :catch_19
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "encoding error in getInstance: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 52
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_37
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "illegal object in getInstance: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1GeneralizedTime;
    .registers 5
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 69
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 71
    .local v0, "o":Lorg/spongycastle/asn1/ASN1Primitive;
    if-nez p1, :cond_a

    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    if-eqz v1, :cond_f

    .line 73
    :cond_a
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    move-result-object v1

    .line 77
    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :goto_e
    return-object v1

    .restart local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_f
    new-instance v1, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetString;

    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;-><init>([B)V

    goto :goto_e
.end method

.method private hasFractionalSeconds()Z
    .registers 4

    .prologue
    .line 328
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    array-length v1, v1

    if-eq v0, v1, :cond_17

    .line 330
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    aget-byte v1, v1, v0

    const/16 v2, 0x2e

    if-ne v1, v2, :cond_14

    .line 332
    const/16 v1, 0xe

    if-ne v0, v1, :cond_14

    .line 334
    const/4 v1, 0x1

    .line 338
    :goto_13
    return v1

    .line 328
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 338
    :cond_17
    const/4 v1, 0x0

    goto :goto_13
.end method


# virtual methods
.method asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .registers 4
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    .line 363
    instance-of v0, p1, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    if-nez v0, :cond_6

    .line 365
    const/4 v0, 0x0

    .line 368
    .end local p1    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :goto_5
    return v0

    .restart local p1    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_6
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    check-cast p1, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .end local p1    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    iget-object v1, p1, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v0

    goto :goto_5
.end method

.method encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V
    .registers 4
    .param p1, "out"    # Lorg/spongycastle/asn1/ASN1OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 357
    const/16 v0, 0x18

    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    invoke-virtual {p1, v0, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeEncoded(I[B)V

    .line 358
    return-void
.end method

.method encodedLength()I
    .registers 3

    .prologue
    .line 348
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    array-length v0, v1

    .line 350
    .local v0, "length":I
    invoke-static {v0}, Lorg/spongycastle/asn1/StreamUtil;->calculateBodyLength(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    add-int/2addr v1, v0

    return v1
.end method

.method public getDate()Ljava/util/Date;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/16 v9, 0xe

    const/4 v8, 0x0

    .line 248
    iget-object v6, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    invoke-static {v6}, Lorg/spongycastle/util/Strings;->fromByteArray([B)Ljava/lang/String;

    move-result-object v5

    .line 249
    .local v5, "stime":Ljava/lang/String;
    move-object v1, v5

    .line 251
    .local v1, "d":Ljava/lang/String;
    const-string v6, "Z"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_87

    .line 253
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->hasFractionalSeconds()Z

    move-result v6

    if-eqz v6, :cond_7f

    .line 255
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyyMMddHHmmss.SSS\'Z\'"

    invoke-direct {v2, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 262
    .local v2, "dateF":Ljava/text/SimpleDateFormat;
    :goto_1f
    new-instance v6, Ljava/util/SimpleTimeZone;

    const-string v7, "Z"

    invoke-direct {v6, v8, v7}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 292
    :goto_29
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->hasFractionalSeconds()Z

    move-result v6

    if-eqz v6, :cond_7a

    .line 295
    invoke-virtual {v1, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 297
    .local v3, "frac":Ljava/lang/String;
    const/4 v4, 0x1

    .local v4, "index":I
    :goto_34
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v4, v6, :cond_46

    .line 299
    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 300
    .local v0, "ch":C
    const/16 v6, 0x30

    if-gt v6, v0, :cond_46

    const/16 v6, 0x39

    if-le v0, v6, :cond_e3

    .line 306
    .end local v0    # "ch":C
    :cond_46
    add-int/lit8 v6, v4, -0x1

    const/4 v7, 0x3

    if-le v6, v7, :cond_e7

    .line 308
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v7, 0x4

    invoke-virtual {v3, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 309
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 323
    .end local v3    # "frac":Ljava/lang/String;
    .end local v4    # "index":I
    :cond_7a
    :goto_7a
    invoke-virtual {v2, v1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v6

    return-object v6

    .line 259
    .end local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :cond_7f
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyyMMddHHmmss\'Z\'"

    invoke-direct {v2, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .restart local v2    # "dateF":Ljava/text/SimpleDateFormat;
    goto :goto_1f

    .line 264
    .end local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :cond_87
    const/16 v6, 0x2d

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-gtz v6, :cond_97

    const/16 v6, 0x2b

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-lez v6, :cond_bc

    .line 266
    :cond_97
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getTime()Ljava/lang/String;

    move-result-object v1

    .line 267
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->hasFractionalSeconds()Z

    move-result v6

    if-eqz v6, :cond_b4

    .line 269
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyyMMddHHmmss.SSSz"

    invoke-direct {v2, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 276
    .restart local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :goto_a8
    new-instance v6, Ljava/util/SimpleTimeZone;

    const-string v7, "Z"

    invoke-direct {v6, v8, v7}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    goto/16 :goto_29

    .line 273
    .end local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :cond_b4
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyyMMddHHmmssz"

    invoke-direct {v2, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .restart local v2    # "dateF":Ljava/text/SimpleDateFormat;
    goto :goto_a8

    .line 280
    .end local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :cond_bc
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->hasFractionalSeconds()Z

    move-result v6

    if-eqz v6, :cond_db

    .line 282
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyyMMddHHmmss.SSS"

    invoke-direct {v2, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 289
    .restart local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :goto_c9
    new-instance v6, Ljava/util/SimpleTimeZone;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v8, v7}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    goto/16 :goto_29

    .line 286
    .end local v2    # "dateF":Ljava/text/SimpleDateFormat;
    :cond_db
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyyMMddHHmmss"

    invoke-direct {v2, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .restart local v2    # "dateF":Ljava/text/SimpleDateFormat;
    goto :goto_c9

    .line 297
    .restart local v0    # "ch":C
    .restart local v3    # "frac":Ljava/lang/String;
    .restart local v4    # "index":I
    :cond_e3
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_34

    .line 311
    .end local v0    # "ch":C
    :cond_e7
    add-int/lit8 v6, v4, -0x1

    const/4 v7, 0x1

    if-ne v6, v7, :cond_122

    .line 313
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "00"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 314
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_7a

    .line 316
    :cond_122
    add-int/lit8 v6, v4, -0x1

    const/4 v7, 0x2

    if-ne v6, v7, :cond_7a

    .line 318
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "0"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 319
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_7a
.end method

.method public getTime()Ljava/lang/String;
    .registers 9

    .prologue
    const/16 v7, 0x2d

    const/16 v6, 0x2b

    const/4 v5, 0x0

    .line 169
    iget-object v3, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    invoke-static {v3}, Lorg/spongycastle/util/Strings;->fromByteArray([B)Ljava/lang/String;

    move-result-object v2

    .line 174
    .local v2, "stime":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5a

    if-ne v3, v4, :cond_37

    .line 176
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "GMT+00:00"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 203
    :goto_36
    return-object v3

    .line 180
    :cond_37
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v1, v3, -0x5

    .line 181
    .local v1, "signPos":I
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 182
    .local v0, "sign":C
    if-eq v0, v7, :cond_45

    if-ne v0, v6, :cond_77

    .line 184
    :cond_45
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "GMT"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v1, 0x3

    .line 186
    invoke-virtual {v2, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v1, 0x3

    .line 188
    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_36

    .line 192
    :cond_77
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v1, v3, -0x3

    .line 193
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 194
    if-eq v0, v7, :cond_85

    if-ne v0, v6, :cond_ab

    .line 196
    :cond_85
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "GMT"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 198
    invoke-virtual {v2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":00"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_36

    .line 203
    :cond_ab
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->calculateGMTOffset()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_36
.end method

.method public getTimeString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    invoke-static {v0}, Lorg/spongycastle/util/Strings;->fromByteArray([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 373
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->time:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method isConstructed()Z
    .registers 2

    .prologue
    .line 343
    const/4 v0, 0x0

    return v0
.end method
