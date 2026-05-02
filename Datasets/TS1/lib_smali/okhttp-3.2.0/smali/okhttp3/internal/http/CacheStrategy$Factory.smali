.class public Lokhttp3/internal/http/CacheStrategy$Factory;
.super Ljava/lang/Object;
.source "CacheStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/http/CacheStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# instance fields
.field private ageSeconds:I

.field final cacheResponse:Lokhttp3/Response;

.field private etag:Ljava/lang/String;

.field private expires:Ljava/util/Date;

.field private lastModified:Ljava/util/Date;

.field private lastModifiedString:Ljava/lang/String;

.field final nowMillis:J

.field private receivedResponseMillis:J

.field final request:Lokhttp3/Request;

.field private sentRequestMillis:J

.field private servedDate:Ljava/util/Date;

.field private servedDateString:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLokhttp3/Request;Lokhttp3/Response;)V
    .registers 13
    .param p1, "nowMillis"    # J
    .param p3, "request"    # Lokhttp3/Request;
    .param p4, "cacheResponse"    # Lokhttp3/Response;

    .prologue
    const/4 v7, -0x1

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    iput v7, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->ageSeconds:I

    .line 136
    iput-wide p1, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->nowMillis:J

    .line 137
    iput-object p3, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->request:Lokhttp3/Request;

    .line 138
    iput-object p4, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->cacheResponse:Lokhttp3/Response;

    .line 140
    if-eqz p4, :cond_8c

    .line 141
    invoke-virtual {p4}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v1

    .line 142
    .local v1, "headers":Lokhttp3/Headers;
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {v1}, Lokhttp3/Headers;->size()I

    move-result v3

    .local v3, "size":I
    :goto_17
    if-ge v2, v3, :cond_8c

    .line 143
    invoke-virtual {v1, v2}, Lokhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "fieldName":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lokhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v4

    .line 145
    .local v4, "value":Ljava/lang/String;
    const-string v5, "Date"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_34

    .line 146
    invoke-static {v4}, Lokhttp3/internal/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    iput-object v5, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    .line 147
    iput-object v4, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->servedDateString:Ljava/lang/String;

    .line 142
    :cond_31
    :goto_31
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 148
    :cond_34
    const-string v5, "Expires"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_43

    .line 149
    invoke-static {v4}, Lokhttp3/internal/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    iput-object v5, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    goto :goto_31

    .line 150
    :cond_43
    const-string v5, "Last-Modified"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_54

    .line 151
    invoke-static {v4}, Lokhttp3/internal/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    iput-object v5, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    .line 152
    iput-object v4, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->lastModifiedString:Ljava/lang/String;

    goto :goto_31

    .line 153
    :cond_54
    const-string v5, "ETag"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5f

    .line 154
    iput-object v4, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->etag:Ljava/lang/String;

    goto :goto_31

    .line 155
    :cond_5f
    const-string v5, "Age"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6e

    .line 156
    invoke-static {v4, v7}, Lokhttp3/internal/http/HeaderParser;->parseSeconds(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->ageSeconds:I

    goto :goto_31

    .line 157
    :cond_6e
    sget-object v5, Lokhttp3/internal/http/OkHeaders;->SENT_MILLIS:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7d

    .line 158
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->sentRequestMillis:J

    goto :goto_31

    .line 159
    :cond_7d
    sget-object v5, Lokhttp3/internal/http/OkHeaders;->RECEIVED_MILLIS:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_31

    .line 160
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    goto :goto_31

    .line 164
    .end local v0    # "fieldName":Ljava/lang/String;
    .end local v1    # "headers":Lokhttp3/Headers;
    .end local v2    # "i":I
    .end local v3    # "size":I
    .end local v4    # "value":Ljava/lang/String;
    :cond_8c
    return-void
.end method

.method private cacheResponseAge()J
    .registers 13

    .prologue
    const-wide/16 v0, 0x0

    .line 284
    iget-object v8, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v8, :cond_13

    iget-wide v8, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    iget-object v10, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    .line 285
    invoke-virtual {v10}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    sub-long/2addr v8, v10

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 287
    .local v0, "apparentReceivedAge":J
    :cond_13
    iget v8, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->ageSeconds:I

    const/4 v9, -0x1

    if-eq v8, v9, :cond_35

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget v9, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->ageSeconds:I

    int-to-long v9, v9

    .line 288
    invoke-virtual {v8, v9, v10}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 290
    .local v2, "receivedAge":J
    :goto_25
    iget-wide v8, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    iget-wide v10, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->sentRequestMillis:J

    sub-long v6, v8, v10

    .line 291
    .local v6, "responseDuration":J
    iget-wide v8, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->nowMillis:J

    iget-wide v10, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    sub-long v4, v8, v10

    .line 292
    .local v4, "residentDuration":J
    add-long v8, v2, v6

    add-long/2addr v8, v4

    return-wide v8

    .end local v2    # "receivedAge":J
    .end local v4    # "residentDuration":J
    .end local v6    # "responseDuration":J
    :cond_35
    move-wide v2, v0

    .line 288
    goto :goto_25
.end method

.method private computeFreshnessLifetime()J
    .registers 10

    .prologue
    const-wide/16 v5, 0x0

    .line 255
    iget-object v7, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->cacheResponse:Lokhttp3/Response;

    invoke-virtual {v7}, Lokhttp3/Response;->cacheControl()Lokhttp3/CacheControl;

    move-result-object v2

    .line 256
    .local v2, "responseCaching":Lokhttp3/CacheControl;
    invoke-virtual {v2}, Lokhttp3/CacheControl;->maxAgeSeconds()I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_1b

    .line 257
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2}, Lokhttp3/CacheControl;->maxAgeSeconds()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v5, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v5

    .line 276
    :cond_1a
    :goto_1a
    return-wide v5

    .line 258
    :cond_1b
    iget-object v7, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    if-eqz v7, :cond_3c

    .line 259
    iget-object v7, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v7, :cond_37

    iget-object v7, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    .line 260
    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    .line 262
    .local v3, "servedMillis":J
    :goto_29
    iget-object v7, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    sub-long v0, v7, v3

    .line 263
    .local v0, "delta":J
    cmp-long v7, v0, v5

    if-lez v7, :cond_3a

    .end local v0    # "delta":J
    :goto_35
    move-wide v5, v0

    goto :goto_1a

    .line 260
    .end local v3    # "servedMillis":J
    :cond_37
    iget-wide v3, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    goto :goto_29

    .restart local v0    # "delta":J
    .restart local v3    # "servedMillis":J
    :cond_3a
    move-wide v0, v5

    .line 263
    goto :goto_35

    .line 264
    .end local v0    # "delta":J
    .end local v3    # "servedMillis":J
    :cond_3c
    iget-object v7, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    if-eqz v7, :cond_1a

    iget-object v7, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->cacheResponse:Lokhttp3/Response;

    .line 265
    invoke-virtual {v7}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/HttpUrl;->query()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_1a

    .line 270
    iget-object v7, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v7, :cond_6b

    iget-object v7, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    .line 271
    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    .line 273
    .restart local v3    # "servedMillis":J
    :goto_5a
    iget-object v7, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    sub-long v0, v3, v7

    .line 274
    .restart local v0    # "delta":J
    cmp-long v7, v0, v5

    if-lez v7, :cond_1a

    const-wide/16 v5, 0xa

    div-long v5, v0, v5

    goto :goto_1a

    .line 271
    .end local v0    # "delta":J
    .end local v3    # "servedMillis":J
    :cond_6b
    iget-wide v3, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->sentRequestMillis:J

    goto :goto_5a
.end method

.method private getCandidate()Lokhttp3/internal/http/CacheStrategy;
    .registers 23

    .prologue
    .line 183
    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->cacheResponse:Lokhttp3/Response;

    move-object/from16 v18, v0

    if-nez v18, :cond_18

    .line 184
    new-instance v18, Lokhttp3/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->request:Lokhttp3/Request;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v21}, Lokhttp3/internal/http/CacheStrategy;-><init>(Lokhttp3/Request;Lokhttp3/Response;Lokhttp3/internal/http/CacheStrategy$1;)V

    .line 245
    :goto_17
    return-object v18

    .line 188
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->request:Lokhttp3/Request;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lokhttp3/Request;->isHttps()Z

    move-result v18

    if-eqz v18, :cond_40

    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->cacheResponse:Lokhttp3/Response;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lokhttp3/Response;->handshake()Lokhttp3/Handshake;

    move-result-object v18

    if-nez v18, :cond_40

    .line 189
    new-instance v18, Lokhttp3/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->request:Lokhttp3/Request;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v21}, Lokhttp3/internal/http/CacheStrategy;-><init>(Lokhttp3/Request;Lokhttp3/Response;Lokhttp3/internal/http/CacheStrategy$1;)V

    goto :goto_17

    .line 195
    :cond_40
    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->cacheResponse:Lokhttp3/Response;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->request:Lokhttp3/Request;

    move-object/from16 v19, v0

    invoke-static/range {v18 .. v19}, Lokhttp3/internal/http/CacheStrategy;->isCacheable(Lokhttp3/Response;Lokhttp3/Request;)Z

    move-result v18

    if-nez v18, :cond_62

    .line 196
    new-instance v18, Lokhttp3/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->request:Lokhttp3/Request;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v21}, Lokhttp3/internal/http/CacheStrategy;-><init>(Lokhttp3/Request;Lokhttp3/Response;Lokhttp3/internal/http/CacheStrategy$1;)V

    goto :goto_17

    .line 199
    :cond_62
    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->request:Lokhttp3/Request;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lokhttp3/Request;->cacheControl()Lokhttp3/CacheControl;

    move-result-object v16

    .line 200
    .local v16, "requestCaching":Lokhttp3/CacheControl;
    invoke-virtual/range {v16 .. v16}, Lokhttp3/CacheControl;->noCache()Z

    move-result v18

    if-nez v18, :cond_7e

    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->request:Lokhttp3/Request;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lokhttp3/internal/http/CacheStrategy$Factory;->hasConditions(Lokhttp3/Request;)Z

    move-result v18

    if-eqz v18, :cond_8e

    .line 201
    :cond_7e
    new-instance v18, Lokhttp3/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->request:Lokhttp3/Request;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v21}, Lokhttp3/internal/http/CacheStrategy;-><init>(Lokhttp3/Request;Lokhttp3/Response;Lokhttp3/internal/http/CacheStrategy$1;)V

    goto :goto_17

    .line 204
    :cond_8e
    invoke-direct/range {p0 .. p0}, Lokhttp3/internal/http/CacheStrategy$Factory;->cacheResponseAge()J

    move-result-wide v3

    .line 205
    .local v3, "ageMillis":J
    invoke-direct/range {p0 .. p0}, Lokhttp3/internal/http/CacheStrategy$Factory;->computeFreshnessLifetime()J

    move-result-wide v8

    .line 207
    .local v8, "freshMillis":J
    invoke-virtual/range {v16 .. v16}, Lokhttp3/CacheControl;->maxAgeSeconds()I

    move-result v18

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_b7

    .line 208
    sget-object v18, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v16 .. v16}, Lokhttp3/CacheControl;->maxAgeSeconds()I

    move-result v19

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    invoke-virtual/range {v18 .. v20}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 211
    :cond_b7
    const-wide/16 v12, 0x0

    .line 212
    .local v12, "minFreshMillis":J
    invoke-virtual/range {v16 .. v16}, Lokhttp3/CacheControl;->minFreshSeconds()I

    move-result v18

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_d4

    .line 213
    sget-object v18, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v16 .. v16}, Lokhttp3/CacheControl;->minFreshSeconds()I

    move-result v19

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    invoke-virtual/range {v18 .. v20}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v12

    .line 216
    :cond_d4
    const-wide/16 v10, 0x0

    .line 217
    .local v10, "maxStaleMillis":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->cacheResponse:Lokhttp3/Response;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lokhttp3/Response;->cacheControl()Lokhttp3/CacheControl;

    move-result-object v17

    .line 218
    .local v17, "responseCaching":Lokhttp3/CacheControl;
    invoke-virtual/range {v17 .. v17}, Lokhttp3/CacheControl;->mustRevalidate()Z

    move-result v18

    if-nez v18, :cond_101

    invoke-virtual/range {v16 .. v16}, Lokhttp3/CacheControl;->maxStaleSeconds()I

    move-result v18

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_101

    .line 219
    sget-object v18, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v16 .. v16}, Lokhttp3/CacheControl;->maxStaleSeconds()I

    move-result v19

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    invoke-virtual/range {v18 .. v20}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v10

    .line 222
    :cond_101
    invoke-virtual/range {v17 .. v17}, Lokhttp3/CacheControl;->noCache()Z

    move-result v18

    if-nez v18, :cond_151

    add-long v18, v3, v12

    add-long v20, v8, v10

    cmp-long v18, v18, v20

    if-gez v18, :cond_151

    .line 223
    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->cacheResponse:Lokhttp3/Response;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lokhttp3/Response;->newBuilder()Lokhttp3/Response$Builder;

    move-result-object v5

    .line 224
    .local v5, "builder":Lokhttp3/Response$Builder;
    add-long v18, v3, v12

    cmp-long v18, v18, v8

    if-ltz v18, :cond_12a

    .line 225
    const-string v18, "Warning"

    const-string v19, "110 HttpURLConnection \"Response is stale\""

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Lokhttp3/Response$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Response$Builder;

    .line 227
    :cond_12a
    const-wide/32 v14, 0x5265c00

    .line 228
    .local v14, "oneDayMillis":J
    cmp-long v18, v3, v14

    if-lez v18, :cond_142

    invoke-direct/range {p0 .. p0}, Lokhttp3/internal/http/CacheStrategy$Factory;->isFreshnessLifetimeHeuristic()Z

    move-result v18

    if-eqz v18, :cond_142

    .line 229
    const-string v18, "Warning"

    const-string v19, "113 HttpURLConnection \"Heuristic expiration\""

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Lokhttp3/Response$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Response$Builder;

    .line 231
    :cond_142
    new-instance v18, Lokhttp3/internal/http/CacheStrategy;

    const/16 v19, 0x0

    invoke-virtual {v5}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object v20

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v21}, Lokhttp3/internal/http/CacheStrategy;-><init>(Lokhttp3/Request;Lokhttp3/Response;Lokhttp3/internal/http/CacheStrategy$1;)V

    goto/16 :goto_17

    .line 234
    .end local v5    # "builder":Lokhttp3/Response$Builder;
    .end local v14    # "oneDayMillis":J
    :cond_151
    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->request:Lokhttp3/Request;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v7

    .line 236
    .local v7, "conditionalRequestBuilder":Lokhttp3/Request$Builder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->etag:Ljava/lang/String;

    move-object/from16 v18, v0

    if-eqz v18, :cond_191

    .line 237
    const-string v18, "If-None-Match"

    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->etag:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 244
    :cond_172
    :goto_172
    invoke-virtual {v7}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v6

    .line 245
    .local v6, "conditionalRequest":Lokhttp3/Request;
    invoke-static {v6}, Lokhttp3/internal/http/CacheStrategy$Factory;->hasConditions(Lokhttp3/Request;)Z

    move-result v18

    if-eqz v18, :cond_1c1

    new-instance v18, Lokhttp3/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->cacheResponse:Lokhttp3/Response;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v6, v1, v2}, Lokhttp3/internal/http/CacheStrategy;-><init>(Lokhttp3/Request;Lokhttp3/Response;Lokhttp3/internal/http/CacheStrategy$1;)V

    goto/16 :goto_17

    .line 238
    .end local v6    # "conditionalRequest":Lokhttp3/Request;
    :cond_191
    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    move-object/from16 v18, v0

    if-eqz v18, :cond_1a9

    .line 239
    const-string v18, "If-Modified-Since"

    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->lastModifiedString:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_172

    .line 240
    :cond_1a9
    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    move-object/from16 v18, v0

    if-eqz v18, :cond_172

    .line 241
    const-string v18, "If-Modified-Since"

    move-object/from16 v0, p0

    iget-object v0, v0, Lokhttp3/internal/http/CacheStrategy$Factory;->servedDateString:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_172

    .line 245
    .restart local v6    # "conditionalRequest":Lokhttp3/Request;
    :cond_1c1
    new-instance v18, Lokhttp3/internal/http/CacheStrategy;

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v6, v1, v2}, Lokhttp3/internal/http/CacheStrategy;-><init>(Lokhttp3/Request;Lokhttp3/Response;Lokhttp3/internal/http/CacheStrategy$1;)V

    goto/16 :goto_17
.end method

.method private static hasConditions(Lokhttp3/Request;)Z
    .registers 2
    .param p0, "request"    # Lokhttp3/Request;

    .prologue
    .line 309
    const-string v0, "If-Modified-Since"

    invoke-virtual {p0, v0}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_10

    const-string v0, "If-None-Match"

    invoke-virtual {p0, v0}, Lokhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

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

.method private isFreshnessLifetimeHeuristic()Z
    .registers 3

    .prologue
    .line 300
    iget-object v0, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->cacheResponse:Lokhttp3/Response;

    invoke-virtual {v0}, Lokhttp3/Response;->cacheControl()Lokhttp3/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/CacheControl;->maxAgeSeconds()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_13

    iget-object v0, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method


# virtual methods
.method public get()Lokhttp3/internal/http/CacheStrategy;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 170
    invoke-direct {p0}, Lokhttp3/internal/http/CacheStrategy$Factory;->getCandidate()Lokhttp3/internal/http/CacheStrategy;

    move-result-object v0

    .line 172
    .local v0, "candidate":Lokhttp3/internal/http/CacheStrategy;
    iget-object v1, v0, Lokhttp3/internal/http/CacheStrategy;->networkRequest:Lokhttp3/Request;

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lokhttp3/internal/http/CacheStrategy$Factory;->request:Lokhttp3/Request;

    invoke-virtual {v1}, Lokhttp3/Request;->cacheControl()Lokhttp3/CacheControl;

    move-result-object v1

    invoke-virtual {v1}, Lokhttp3/CacheControl;->onlyIfCached()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 174
    new-instance v0, Lokhttp3/internal/http/CacheStrategy;

    .end local v0    # "candidate":Lokhttp3/internal/http/CacheStrategy;
    invoke-direct {v0, v2, v2, v2}, Lokhttp3/internal/http/CacheStrategy;-><init>(Lokhttp3/Request;Lokhttp3/Response;Lokhttp3/internal/http/CacheStrategy$1;)V

    .line 177
    :cond_1a
    return-object v0
.end method
