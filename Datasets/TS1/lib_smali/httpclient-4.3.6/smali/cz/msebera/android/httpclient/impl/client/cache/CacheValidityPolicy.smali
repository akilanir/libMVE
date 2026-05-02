.class Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;
.super Ljava/lang/Object;
.source "CacheValidityPolicy.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final MAX_AGE:J = 0x80000000L


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method private mayReturnStaleIfError([Lcz/msebera/android/httpclient/Header;J)Z
    .registers 16
    .param p1, "headers"    # [Lcz/msebera/android/httpclient/Header;
    .param p2, "stalenessSecs"    # J

    .prologue
    const/4 v5, 0x0

    .line 155
    const/4 v2, 0x0

    .line 156
    .local v2, "result":Z
    array-length v7, p1

    move v6, v5

    :goto_4
    if-ge v6, v7, :cond_34

    aget-object v1, p1, v6

    .line 157
    .local v1, "h":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v8

    array-length v9, v8

    move v4, v5

    :goto_e
    if-ge v4, v9, :cond_2c

    aget-object v0, v8, v4

    .line 158
    .local v0, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    const-string v10, "stale-if-error"

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_31

    .line 160
    :try_start_1e
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_25
    .catch Ljava/lang/NumberFormatException; {:try_start_1e .. :try_end_25} :catch_30

    move-result v3

    .line 161
    .local v3, "staleIfErrorSecs":I
    int-to-long v10, v3

    cmp-long v10, p2, v10

    if-gtz v10, :cond_31

    .line 162
    const/4 v2, 0x1

    .line 156
    .end local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v3    # "staleIfErrorSecs":I
    :cond_2c
    add-int/lit8 v4, v6, 0x1

    move v6, v4

    goto :goto_4

    .line 165
    .restart local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    :catch_30
    move-exception v10

    .line 157
    :cond_31
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 171
    .end local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v1    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_34
    return v2
.end method


# virtual methods
.method protected contentLengthHeaderMatchesActualLength(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z
    .registers 6
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 217
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->hasContentLengthHeader(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getContentLengthValue(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J

    move-result-wide v0

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getResource()Lcz/msebera/android/httpclient/client/cache/Resource;

    move-result-object v2

    invoke-interface {v2}, Lcz/msebera/android/httpclient/client/cache/Resource;->length()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_18

    :cond_16
    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method protected getAgeValue(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J
    .registers 13
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 233
    const-wide/16 v0, 0x0

    .line 234
    .local v0, "ageValue":J
    const-string v6, "Age"

    invoke-virtual {p1, v6}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v7

    array-length v8, v7

    const/4 v6, 0x0

    :goto_a
    if-ge v6, v8, :cond_30

    aget-object v2, v7, v6

    .line 237
    .local v2, "hdr":Lcz/msebera/android/httpclient/Header;
    :try_start_e
    invoke-interface {v2}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_15
    .catch Ljava/lang/NumberFormatException; {:try_start_e .. :try_end_15} :catch_29

    move-result-wide v3

    .line 238
    .local v3, "hdrAge":J
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-gez v9, :cond_21

    .line 239
    const-wide v3, 0x80000000L

    .line 244
    :cond_21
    :goto_21
    cmp-long v9, v3, v0

    if-lez v9, :cond_26

    move-wide v0, v3

    .line 234
    :cond_26
    add-int/lit8 v6, v6, 0x1

    goto :goto_a

    .line 241
    .end local v3    # "hdrAge":J
    :catch_29
    move-exception v5

    .line 242
    .local v5, "nfe":Ljava/lang/NumberFormatException;
    const-wide v3, 0x80000000L

    .restart local v3    # "hdrAge":J
    goto :goto_21

    .line 246
    .end local v2    # "hdr":Lcz/msebera/android/httpclient/Header;
    .end local v3    # "hdrAge":J
    .end local v5    # "nfe":Ljava/lang/NumberFormatException;
    :cond_30
    return-wide v0
.end method

.method protected getApparentAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J
    .registers 11
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    const-wide/16 v3, 0x0

    .line 221
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 222
    .local v0, "dateValue":Ljava/util/Date;
    if-nez v0, :cond_e

    .line 223
    const-wide v3, 0x80000000L

    .line 229
    :cond_d
    :goto_d
    return-wide v3

    .line 225
    :cond_e
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getResponseDate()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    sub-long v1, v5, v7

    .line 226
    .local v1, "diff":J
    cmp-long v5, v1, v3

    if-ltz v5, :cond_d

    .line 229
    const-wide/16 v3, 0x3e8

    div-long v3, v1, v3

    goto :goto_d
.end method

.method protected getContentLengthValue(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J
    .registers 7
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    const-wide/16 v2, -0x1

    .line 193
    const-string v4, "Content-Length"

    invoke-virtual {p1, v4}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 194
    .local v0, "cl":Lcz/msebera/android/httpclient/Header;
    if-nez v0, :cond_b

    .line 201
    :goto_a
    return-wide v2

    .line 199
    :cond_b
    :try_start_b
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_12
    .catch Ljava/lang/NumberFormatException; {:try_start_b .. :try_end_12} :catch_14

    move-result-wide v2

    goto :goto_a

    .line 200
    :catch_14
    move-exception v1

    .line 201
    .local v1, "ex":Ljava/lang/NumberFormatException;
    goto :goto_a
.end method

.method protected getCorrectedInitialAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J
    .registers 6
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 261
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getCorrectedReceivedAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J

    move-result-wide v0

    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getResponseDelaySecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J

    move-result-wide v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method protected getCorrectedReceivedAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J
    .registers 7
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 250
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getApparentAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J

    move-result-wide v2

    .line 251
    .local v2, "apparentAge":J
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getAgeValue(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J

    move-result-wide v0

    .line 252
    .local v0, "ageValue":J
    cmp-long v4, v2, v0

    if-lez v4, :cond_d

    .end local v2    # "apparentAge":J
    :goto_c
    return-wide v2

    .restart local v2    # "apparentAge":J
    :cond_d
    move-wide v2, v0

    goto :goto_c
.end method

.method public getCurrentAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J
    .registers 7
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;

    .prologue
    .line 53
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getCorrectedInitialAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J

    move-result-wide v0

    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getResidentTimeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method protected getDateValue(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Ljava/util/Date;
    .registers 3
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 181
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getDate()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method protected getExpirationDate(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Ljava/util/Date;
    .registers 4
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 291
    const-string v1, "Expires"

    invoke-virtual {p1, v1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 292
    .local v0, "expiresHeader":Lcz/msebera/android/httpclient/Header;
    if-nez v0, :cond_a

    .line 293
    const/4 v1, 0x0

    .line 295
    :goto_9
    return-object v1

    :cond_a
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    goto :goto_9
.end method

.method public getFreshnessLifetimeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J
    .registers 12
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    const-wide/16 v6, 0x0

    .line 57
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getMaxAge(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J

    move-result-wide v4

    .line 58
    .local v4, "maxage":J
    const-wide/16 v8, -0x1

    cmp-long v8, v4, v8

    if-lez v8, :cond_d

    .line 72
    .end local v4    # "maxage":J
    :goto_c
    return-wide v4

    .line 62
    .restart local v4    # "maxage":J
    :cond_d
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 63
    .local v0, "dateValue":Ljava/util/Date;
    if-nez v0, :cond_15

    move-wide v4, v6

    .line 64
    goto :goto_c

    .line 67
    :cond_15
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getExpirationDate(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Ljava/util/Date;

    move-result-object v3

    .line 68
    .local v3, "expiry":Ljava/util/Date;
    if-nez v3, :cond_1d

    move-wide v4, v6

    .line 69
    goto :goto_c

    .line 71
    :cond_1d
    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long v1, v6, v8

    .line 72
    .local v1, "diff":J
    const-wide/16 v6, 0x3e8

    div-long v4, v1, v6

    goto :goto_c
.end method

.method public getHeuristicFreshnessLifetimeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;FJ)J
    .registers 15
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p2, "coefficient"    # F
    .param p3, "defaultLifetime"    # J

    .prologue
    const-wide/16 v4, 0x0

    .line 99
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 100
    .local v0, "dateValue":Ljava/util/Date;
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getLastModifiedValue(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Ljava/util/Date;

    move-result-object v3

    .line 102
    .local v3, "lastModifiedValue":Ljava/util/Date;
    if-eqz v0, :cond_1d

    if-eqz v3, :cond_1d

    .line 103
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long v1, v6, v8

    .line 104
    .local v1, "diff":J
    cmp-long v6, v1, v4

    if-gez v6, :cond_1e

    move-wide p3, v4

    .line 110
    .end local v1    # "diff":J
    .end local p3    # "defaultLifetime":J
    :cond_1d
    :goto_1d
    return-wide p3

    .line 107
    .restart local v1    # "diff":J
    .restart local p3    # "defaultLifetime":J
    :cond_1e
    const-wide/16 v4, 0x3e8

    div-long v4, v1, v4

    long-to-float v4, v4

    mul-float/2addr v4, p2

    float-to-long p3, v4

    goto :goto_1d
.end method

.method protected getLastModifiedValue(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Ljava/util/Date;
    .registers 4
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 185
    const-string v1, "Last-Modified"

    invoke-virtual {p1, v1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 186
    .local v0, "dateHdr":Lcz/msebera/android/httpclient/Header;
    if-nez v0, :cond_a

    .line 187
    const/4 v1, 0x0

    .line 189
    :goto_9
    return-object v1

    :cond_a
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    goto :goto_9
.end method

.method protected getMaxAge(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J
    .registers 18
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 270
    const-wide/16 v5, -0x1

    .line 271
    .local v5, "maxage":J
    const-string v8, "Cache-Control"

    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v10

    array-length v11, v10

    const/4 v8, 0x0

    move v9, v8

    :goto_d
    if-ge v9, v11, :cond_51

    aget-object v4, v10, v9

    .line 272
    .local v4, "hdr":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v4}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v12

    array-length v13, v12

    const/4 v8, 0x0

    :goto_17
    if-ge v8, v13, :cond_4d

    aget-object v3, v12, v8

    .line 273
    .local v3, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    const-string v14, "max-age"

    invoke-interface {v3}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_33

    const-string v14, "s-maxage"

    .line 274
    invoke-interface {v3}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_46

    .line 276
    :cond_33
    :try_start_33
    invoke-interface {v3}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_3a
    .catch Ljava/lang/NumberFormatException; {:try_start_33 .. :try_end_3a} :catch_49

    move-result-wide v1

    .line 277
    .local v1, "currMaxAge":J
    const-wide/16 v14, -0x1

    cmp-long v14, v5, v14

    if-eqz v14, :cond_45

    cmp-long v14, v1, v5

    if-gez v14, :cond_46

    .line 278
    :cond_45
    move-wide v5, v1

    .line 272
    .end local v1    # "currMaxAge":J
    :cond_46
    :goto_46
    add-int/lit8 v8, v8, 0x1

    goto :goto_17

    .line 280
    :catch_49
    move-exception v7

    .line 282
    .local v7, "nfe":Ljava/lang/NumberFormatException;
    const-wide/16 v5, 0x0

    goto :goto_46

    .line 271
    .end local v3    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v7    # "nfe":Ljava/lang/NumberFormatException;
    :cond_4d
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    goto :goto_d

    .line 287
    .end local v4    # "hdr":Lcz/msebera/android/httpclient/Header;
    :cond_51
    return-wide v5
.end method

.method protected getResidentTimeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J
    .registers 9
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;

    .prologue
    .line 265
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getResponseDate()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 266
    .local v0, "diff":J
    const-wide/16 v2, 0x3e8

    div-long v2, v0, v2

    return-wide v2
.end method

.method protected getResponseDelaySecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J
    .registers 8
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 256
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getResponseDate()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getRequestDate()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 257
    .local v0, "diff":J
    const-wide/16 v2, 0x3e8

    div-long v2, v0, v2

    return-wide v2
.end method

.method public getStalenessSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J
    .registers 9
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;

    .prologue
    .line 311
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    .line 312
    .local v0, "age":J
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getFreshnessLifetimeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J

    move-result-wide v2

    .line 313
    .local v2, "freshness":J
    cmp-long v4, v0, v2

    if-gtz v4, :cond_f

    .line 314
    const-wide/16 v4, 0x0

    .line 316
    :goto_e
    return-wide v4

    :cond_f
    sub-long v4, v0, v2

    goto :goto_e
.end method

.method public hasCacheControlDirective(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/lang/String;)Z
    .registers 13
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p2, "directive"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 300
    const-string v3, "Cache-Control"

    invoke-virtual {p1, v3}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v5

    array-length v6, v5

    move v4, v2

    :goto_9
    if-ge v4, v6, :cond_22

    aget-object v1, v5, v4

    .line 301
    .local v1, "h":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v7

    array-length v8, v7

    move v3, v2

    :goto_13
    if-ge v3, v8, :cond_26

    aget-object v0, v7, v3

    .line 302
    .local v0, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p2, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_23

    .line 303
    const/4 v2, 0x1

    .line 307
    .end local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v1    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_22
    return v2

    .line 301
    .restart local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .restart local v1    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_23
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 300
    .end local v0    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_26
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_9
.end method

.method protected hasContentLengthHeader(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z
    .registers 3
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 206
    const-string v0, "Content-Length"

    invoke-virtual {p1, v0}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isResponseFresh(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .registers 7
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;

    .prologue
    .line 76
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getFreshnessLifetimeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isResponseHeuristicallyFresh(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;FJ)Z
    .registers 10
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;
    .param p3, "coefficient"    # F
    .param p4, "defaultLifetime"    # J

    .prologue
    .line 94
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    invoke-virtual {p0, p1, p3, p4, p5}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getHeuristicFreshnessLifetimeSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;FJ)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isRevalidatable(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z
    .registers 3
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 114
    const-string v0, "ETag"

    invoke-virtual {p1, v0}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    if-nez v0, :cond_10

    const-string v0, "Last-Modified"

    .line 115
    invoke-virtual {p1, v0}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public mayReturnStaleIfError(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .registers 7
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    .line 147
    invoke-virtual {p0, p2, p3}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getStalenessSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    .line 148
    .local v0, "stalenessSecs":J
    const-string v2, "Cache-Control"

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/HttpRequest;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    invoke-direct {p0, v2, v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->mayReturnStaleIfError([Lcz/msebera/android/httpclient/Header;J)Z

    move-result v2

    if-nez v2, :cond_1c

    const-string v2, "Cache-Control"

    .line 150
    invoke-virtual {p2, v2}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v2

    invoke-direct {p0, v2, v0, v1}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->mayReturnStaleIfError([Lcz/msebera/android/httpclient/Header;J)Z

    move-result v2

    if-eqz v2, :cond_1e

    :cond_1c
    const/4 v2, 0x1

    :goto_1d
    return v2

    :cond_1e
    const/4 v2, 0x0

    goto :goto_1d
.end method

.method public mayReturnStaleWhileRevalidating(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .registers 16
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;

    .prologue
    .line 127
    const-string v3, "Cache-Control"

    invoke-virtual {p1, v3}, Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v5

    array-length v6, v5

    const/4 v3, 0x0

    move v4, v3

    :goto_9
    if-ge v4, v6, :cond_3e

    aget-object v2, v5, v4

    .line 128
    .local v2, "h":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v2}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v7

    array-length v8, v7

    const/4 v3, 0x0

    :goto_13
    if-ge v3, v8, :cond_3a

    aget-object v1, v7, v3

    .line 129
    .local v1, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    const-string v9, "stale-while-revalidate"

    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_37

    .line 131
    :try_start_23
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 132
    .local v0, "allowedStalenessLifetime":I
    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->getStalenessSecs(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/util/Date;)J
    :try_end_2e
    .catch Ljava/lang/NumberFormatException; {:try_start_23 .. :try_end_2e} :catch_36

    move-result-wide v9

    int-to-long v11, v0

    cmp-long v9, v9, v11

    if-gtz v9, :cond_37

    .line 133
    const/4 v3, 0x1

    .line 142
    .end local v0    # "allowedStalenessLifetime":I
    .end local v1    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v2    # "h":Lcz/msebera/android/httpclient/Header;
    :goto_35
    return v3

    .line 135
    .restart local v1    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    .restart local v2    # "h":Lcz/msebera/android/httpclient/Header;
    :catch_36
    move-exception v9

    .line 128
    :cond_37
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 127
    .end local v1    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_3a
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    goto :goto_9

    .line 142
    .end local v2    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_3e
    const/4 v3, 0x0

    goto :goto_35
.end method

.method public mustRevalidate(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z
    .registers 3
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 119
    const-string v0, "must-revalidate"

    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->hasCacheControlDirective(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public proxyRevalidate(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;)Z
    .registers 3
    .param p1, "entry"    # Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;

    .prologue
    .line 123
    const-string v0, "proxy-revalidate"

    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/impl/client/cache/CacheValidityPolicy;->hasCacheControlDirective(Lcz/msebera/android/httpclient/client/cache/HttpCacheEntry;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
