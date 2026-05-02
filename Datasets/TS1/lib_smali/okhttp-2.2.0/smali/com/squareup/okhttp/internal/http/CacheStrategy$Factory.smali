.class public Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;
.super Ljava/lang/Object;
.source "CacheStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/http/CacheStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# instance fields
.field private ageSeconds:I

.field final cacheResponse:Lcom/squareup/okhttp/Response;

.field private etag:Ljava/lang/String;

.field private expires:Ljava/util/Date;

.field private lastModified:Ljava/util/Date;

.field private lastModifiedString:Ljava/lang/String;

.field final nowMillis:J

.field private receivedResponseMillis:J

.field final request:Lcom/squareup/okhttp/Request;

.field private sentRequestMillis:J

.field private servedDate:Ljava/util/Date;

.field private servedDateString:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;)V
    .registers 13
    .param p1, "nowMillis"    # J
    .param p3, "request"    # Lcom/squareup/okhttp/Request;
    .param p4, "cacheResponse"    # Lcom/squareup/okhttp/Response;

    .prologue
    const/4 v7, -0x1

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    iput v7, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->ageSeconds:I

    .line 114
    iput-wide p1, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->nowMillis:J

    .line 115
    iput-object p3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    .line 116
    iput-object p4, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 118
    if-eqz p4, :cond_8c

    .line 119
    invoke-virtual {p4}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    .line 120
    .local v1, "headers":Lcom/squareup/okhttp/Headers;
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {v1}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v3

    .local v3, "size":I
    :goto_17
    if-ge v2, v3, :cond_8c

    .line 121
    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "fieldName":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v4

    .line 123
    .local v4, "value":Ljava/lang/String;
    const-string v5, "Date"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_34

    .line 124
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    iput-object v5, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    .line 125
    iput-object v4, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDateString:Ljava/lang/String;

    .line 120
    :cond_31
    :goto_31
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 126
    :cond_34
    const-string v5, "Expires"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_43

    .line 127
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    iput-object v5, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    goto :goto_31

    .line 128
    :cond_43
    const-string v5, "Last-Modified"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_54

    .line 129
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    iput-object v5, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    .line 130
    iput-object v4, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModifiedString:Ljava/lang/String;

    goto :goto_31

    .line 131
    :cond_54
    const-string v5, "ETag"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5f

    .line 132
    iput-object v4, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->etag:Ljava/lang/String;

    goto :goto_31

    .line 133
    :cond_5f
    const-string v5, "Age"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6e

    .line 134
    invoke-static {v4, v7}, Lcom/squareup/okhttp/internal/http/HeaderParser;->parseSeconds(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->ageSeconds:I

    goto :goto_31

    .line 135
    :cond_6e
    sget-object v5, Lcom/squareup/okhttp/internal/http/OkHeaders;->SENT_MILLIS:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7d

    .line 136
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->sentRequestMillis:J

    goto :goto_31

    .line 137
    :cond_7d
    sget-object v5, Lcom/squareup/okhttp/internal/http/OkHeaders;->RECEIVED_MILLIS:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_31

    .line 138
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    goto :goto_31

    .line 142
    .end local v0    # "fieldName":Ljava/lang/String;
    .end local v1    # "headers":Lcom/squareup/okhttp/Headers;
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

    .line 265
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v8, :cond_13

    iget-wide v8, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    iget-object v10, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    .line 266
    invoke-virtual {v10}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    sub-long/2addr v8, v10

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 268
    .local v0, "apparentReceivedAge":J
    :cond_13
    iget v8, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->ageSeconds:I

    const/4 v9, -0x1

    if-eq v8, v9, :cond_35

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget v9, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->ageSeconds:I

    int-to-long v9, v9

    .line 269
    invoke-virtual {v8, v9, v10}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 271
    .local v2, "receivedAge":J
    :goto_25
    iget-wide v8, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    iget-wide v10, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->sentRequestMillis:J

    sub-long v6, v8, v10

    .line 272
    .local v6, "responseDuration":J
    iget-wide v8, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->nowMillis:J

    iget-wide v10, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    sub-long v4, v8, v10

    .line 273
    .local v4, "residentDuration":J
    add-long v8, v2, v6

    add-long/2addr v8, v4

    return-wide v8

    .end local v2    # "receivedAge":J
    .end local v4    # "residentDuration":J
    .end local v6    # "responseDuration":J
    :cond_35
    move-wide v2, v0

    .line 269
    goto :goto_25
.end method

.method private computeFreshnessLifetime()J
    .registers 10

    .prologue
    const-wide/16 v5, 0x0

    .line 236
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v2

    .line 237
    .local v2, "responseCaching":Lcom/squareup/okhttp/CacheControl;
    invoke-virtual {v2}, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds()I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_1b

    .line 238
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2}, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v5, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v5

    .line 257
    :cond_1a
    :goto_1a
    return-wide v5

    .line 239
    :cond_1b
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    if-eqz v7, :cond_3c

    .line 240
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v7, :cond_37

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    .line 241
    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    .line 243
    .local v3, "servedMillis":J
    :goto_29
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    sub-long v0, v7, v3

    .line 244
    .local v0, "delta":J
    cmp-long v7, v0, v5

    if-lez v7, :cond_3a

    .end local v0    # "delta":J
    :goto_35
    move-wide v5, v0

    goto :goto_1a

    .line 241
    .end local v3    # "servedMillis":J
    :cond_37
    iget-wide v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->receivedResponseMillis:J

    goto :goto_29

    .restart local v0    # "delta":J
    .restart local v3    # "servedMillis":J
    :cond_3a
    move-wide v0, v5

    .line 244
    goto :goto_35

    .line 245
    .end local v0    # "delta":J
    .end local v3    # "servedMillis":J
    :cond_3c
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    if-eqz v7, :cond_1a

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 246
    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->request()Lcom/squareup/okhttp/Request;

    move-result-object v7

    invoke-virtual {v7}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_1a

    .line 251
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v7, :cond_6b

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    .line 252
    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    .line 254
    .restart local v3    # "servedMillis":J
    :goto_5a
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    sub-long v0, v3, v7

    .line 255
    .restart local v0    # "delta":J
    cmp-long v7, v0, v5

    if-lez v7, :cond_1a

    const-wide/16 v5, 0xa

    div-long v5, v0, v5

    goto :goto_1a

    .line 252
    .end local v0    # "delta":J
    .end local v3    # "servedMillis":J
    :cond_6b
    iget-wide v3, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->sentRequestMillis:J

    goto :goto_5a
.end method

.method private getCandidate()Lcom/squareup/okhttp/internal/http/CacheStrategy;
    .registers 23

    .prologue
    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v18, v0

    if-nez v18, :cond_18

    .line 163
    new-instance v18, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v21}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    .line 226
    :goto_17
    return-object v18

    .line 167
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/squareup/okhttp/Request;->isHttps()Z

    move-result v18

    if-eqz v18, :cond_40

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/squareup/okhttp/Response;->handshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v18

    if-nez v18, :cond_40

    .line 168
    new-instance v18, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v21}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto :goto_17

    .line 174
    :cond_40
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v19, v0

    invoke-static/range {v18 .. v19}, Lcom/squareup/okhttp/internal/http/CacheStrategy;->isCacheable(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Request;)Z

    move-result v18

    if-nez v18, :cond_62

    .line 175
    new-instance v18, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v21}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto :goto_17

    .line 178
    :cond_62
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/squareup/okhttp/Request;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v16

    .line 179
    .local v16, "requestCaching":Lcom/squareup/okhttp/CacheControl;
    invoke-virtual/range {v16 .. v16}, Lcom/squareup/okhttp/CacheControl;->noCache()Z

    move-result v18

    if-nez v18, :cond_7e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->hasConditions(Lcom/squareup/okhttp/Request;)Z

    move-result v18

    if-eqz v18, :cond_8e

    .line 180
    :cond_7e
    new-instance v18, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v21}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto :goto_17

    .line 183
    :cond_8e
    invoke-direct/range {p0 .. p0}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponseAge()J

    move-result-wide v3

    .line 184
    .local v3, "ageMillis":J
    invoke-direct/range {p0 .. p0}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->computeFreshnessLifetime()J

    move-result-wide v8

    .line 186
    .local v8, "freshMillis":J
    invoke-virtual/range {v16 .. v16}, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds()I

    move-result v18

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_b7

    .line 187
    sget-object v18, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v16 .. v16}, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds()I

    move-result v19

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    invoke-virtual/range {v18 .. v20}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 190
    :cond_b7
    const-wide/16 v12, 0x0

    .line 191
    .local v12, "minFreshMillis":J
    invoke-virtual/range {v16 .. v16}, Lcom/squareup/okhttp/CacheControl;->minFreshSeconds()I

    move-result v18

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_d4

    .line 192
    sget-object v18, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v16 .. v16}, Lcom/squareup/okhttp/CacheControl;->minFreshSeconds()I

    move-result v19

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    invoke-virtual/range {v18 .. v20}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v12

    .line 195
    :cond_d4
    const-wide/16 v10, 0x0

    .line 196
    .local v10, "maxStaleMillis":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/squareup/okhttp/Response;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v17

    .line 197
    .local v17, "responseCaching":Lcom/squareup/okhttp/CacheControl;
    invoke-virtual/range {v17 .. v17}, Lcom/squareup/okhttp/CacheControl;->mustRevalidate()Z

    move-result v18

    if-nez v18, :cond_101

    invoke-virtual/range {v16 .. v16}, Lcom/squareup/okhttp/CacheControl;->maxStaleSeconds()I

    move-result v18

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_101

    .line 198
    sget-object v18, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v16 .. v16}, Lcom/squareup/okhttp/CacheControl;->maxStaleSeconds()I

    move-result v19

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    invoke-virtual/range {v18 .. v20}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v10

    .line 201
    :cond_101
    invoke-virtual/range {v17 .. v17}, Lcom/squareup/okhttp/CacheControl;->noCache()Z

    move-result v18

    if-nez v18, :cond_151

    add-long v18, v3, v12

    add-long v20, v8, v10

    cmp-long v18, v18, v20

    if-gez v18, :cond_151

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v5

    .line 203
    .local v5, "builder":Lcom/squareup/okhttp/Response$Builder;
    add-long v18, v3, v12

    cmp-long v18, v18, v8

    if-ltz v18, :cond_12a

    .line 204
    const-string v18, "Warning"

    const-string v19, "110 HttpURLConnection \"Response is stale\""

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Lcom/squareup/okhttp/Response$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    .line 206
    :cond_12a
    const-wide/32 v14, 0x5265c00

    .line 207
    .local v14, "oneDayMillis":J
    cmp-long v18, v3, v14

    if-lez v18, :cond_142

    invoke-direct/range {p0 .. p0}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->isFreshnessLifetimeHeuristic()Z

    move-result v18

    if-eqz v18, :cond_142

    .line 208
    const-string v18, "Warning"

    const-string v19, "113 HttpURLConnection \"Heuristic expiration\""

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Lcom/squareup/okhttp/Response$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    .line 210
    :cond_142
    new-instance v18, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    const/16 v19, 0x0

    invoke-virtual {v5}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v20

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v21}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto/16 :goto_17

    .line 213
    .end local v5    # "builder":Lcom/squareup/okhttp/Response$Builder;
    .end local v14    # "oneDayMillis":J
    :cond_151
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/squareup/okhttp/Request;->newBuilder()Lcom/squareup/okhttp/Request$Builder;

    move-result-object v7

    .line 215
    .local v7, "conditionalRequestBuilder":Lcom/squareup/okhttp/Request$Builder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    move-object/from16 v18, v0

    if-eqz v18, :cond_1a8

    .line 216
    const-string v18, "If-Modified-Since"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->lastModifiedString:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 221
    :cond_172
    :goto_172
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->etag:Ljava/lang/String;

    move-object/from16 v18, v0

    if-eqz v18, :cond_189

    .line 222
    const-string v18, "If-None-Match"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->etag:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 225
    :cond_189
    invoke-virtual {v7}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v6

    .line 226
    .local v6, "conditionalRequest":Lcom/squareup/okhttp/Request;
    invoke-static {v6}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->hasConditions(Lcom/squareup/okhttp/Request;)Z

    move-result v18

    if-eqz v18, :cond_1c0

    new-instance v18, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v6, v1, v2}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto/16 :goto_17

    .line 217
    .end local v6    # "conditionalRequest":Lcom/squareup/okhttp/Request;
    :cond_1a8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    move-object/from16 v18, v0

    if-eqz v18, :cond_172

    .line 218
    const-string v18, "If-Modified-Since"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->servedDateString:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v7, v0, v1}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    goto :goto_172

    .line 226
    .restart local v6    # "conditionalRequest":Lcom/squareup/okhttp/Request;
    :cond_1c0
    new-instance v18, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v6, v1, v2}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    goto/16 :goto_17
.end method

.method private static hasConditions(Lcom/squareup/okhttp/Request;)Z
    .registers 2
    .param p0, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 291
    const-string v0, "If-Modified-Since"

    invoke-virtual {p0, v0}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_10

    const-string v0, "If-None-Match"

    invoke-virtual {p0, v0}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

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
    .line 282
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_13

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->expires:Ljava/util/Date;

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method


# virtual methods
.method public get()Lcom/squareup/okhttp/internal/http/CacheStrategy;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 149
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->getCandidate()Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-result-object v0

    .line 151
    .local v0, "candidate":Lcom/squareup/okhttp/internal/http/CacheStrategy;
    iget-object v1, v0, Lcom/squareup/okhttp/internal/http/CacheStrategy;->networkRequest:Lcom/squareup/okhttp/Request;

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/CacheControl;->onlyIfCached()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 153
    new-instance v0, Lcom/squareup/okhttp/internal/http/CacheStrategy;

    .end local v0    # "candidate":Lcom/squareup/okhttp/internal/http/CacheStrategy;
    invoke-direct {v0, v2, v2, v2}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V

    .line 156
    :cond_1a
    return-object v0
.end method
