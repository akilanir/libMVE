.class public Lcom/android/volley/toolbox/HttpHeaderParser;
.super Ljava/lang/Object;
.source "HttpHeaderParser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;
    .registers 30
    .param p0, "response"    # Lcom/android/volley/NetworkResponse;

    .prologue
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 42
    .local v14, "now":J
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    .line 44
    .local v7, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-wide/16 v16, 0x0

    .line 45
    .local v16, "serverDate":J
    const-wide/16 v9, 0x0

    .line 46
    .local v9, "lastModified":J
    const-wide/16 v19, 0x0

    .line 47
    .local v19, "serverExpires":J
    const-wide/16 v21, 0x0

    .line 48
    .local v21, "softExpire":J
    const-wide/16 v3, 0x0

    .line 49
    .local v3, "finalExpire":J
    const-wide/16 v11, 0x0

    .line 50
    .local v11, "maxAge":J
    const-wide/16 v23, 0x0

    .line 51
    .local v23, "staleWhileRevalidate":J
    const/4 v5, 0x0

    .line 52
    .local v5, "hasCacheControl":Z
    const/4 v13, 0x0

    .line 54
    .local v13, "mustRevalidate":Z
    const/16 v18, 0x0

    .line 57
    .local v18, "serverEtag":Ljava/lang/String;
    const-string v27, "Date"

    move-object/from16 v0, v27

    invoke-interface {v7, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 58
    .local v6, "headerValue":Ljava/lang/String;
    if-eqz v6, :cond_2a

    .line 59
    invoke-static {v6}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseDateAsEpoch(Ljava/lang/String;)J

    move-result-wide v16

    .line 62
    :cond_2a
    const-string v27, "Cache-Control"

    move-object/from16 v0, v27

    invoke-interface {v7, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "headerValue":Ljava/lang/String;
    check-cast v6, Ljava/lang/String;

    .line 63
    .restart local v6    # "headerValue":Ljava/lang/String;
    if-eqz v6, :cond_bb

    .line 64
    const/4 v5, 0x1

    .line 65
    const-string v27, ","

    move-object/from16 v0, v27

    invoke-virtual {v6, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v26

    .line 66
    .local v26, "tokens":[Ljava/lang/String;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_40
    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v27, v0

    move/from16 v0, v27

    if-ge v8, v0, :cond_bb

    .line 67
    aget-object v27, v26, v8

    invoke-virtual/range {v27 .. v27}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v25

    .line 68
    .local v25, "token":Ljava/lang/String;
    const-string v27, "no-cache"

    move-object/from16 v0, v25

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_67

    const-string v27, "no-store"

    move-object/from16 v0, v25

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_69

    .line 69
    :cond_67
    const/4 v2, 0x0

    .line 120
    .end local v8    # "i":I
    .end local v25    # "token":Ljava/lang/String;
    .end local v26    # "tokens":[Ljava/lang/String;
    :goto_68
    return-object v2

    .line 70
    .restart local v8    # "i":I
    .restart local v25    # "token":Ljava/lang/String;
    .restart local v26    # "tokens":[Ljava/lang/String;
    :cond_69
    const-string v27, "max-age="

    move-object/from16 v0, v25

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v27

    if-eqz v27, :cond_86

    .line 72
    const/16 v27, 0x8

    :try_start_77
    move-object/from16 v0, v25

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_77 .. :try_end_82} :catch_12f

    move-result-wide v11

    .line 66
    :cond_83
    :goto_83
    add-int/lit8 v8, v8, 0x1

    goto :goto_40

    .line 75
    :cond_86
    const-string v27, "stale-while-revalidate="

    move-object/from16 v0, v25

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v27

    if-eqz v27, :cond_a1

    .line 77
    const/16 v27, 0x17

    :try_start_94
    move-object/from16 v0, v25

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_9f
    .catch Ljava/lang/Exception; {:try_start_94 .. :try_end_9f} :catch_12c

    move-result-wide v23

    goto :goto_83

    .line 80
    :cond_a1
    const-string v27, "must-revalidate"

    move-object/from16 v0, v25

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_b9

    const-string v27, "proxy-revalidate"

    move-object/from16 v0, v25

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_83

    .line 81
    :cond_b9
    const/4 v13, 0x1

    goto :goto_83

    .line 86
    .end local v8    # "i":I
    .end local v25    # "token":Ljava/lang/String;
    .end local v26    # "tokens":[Ljava/lang/String;
    :cond_bb
    const-string v27, "Expires"

    move-object/from16 v0, v27

    invoke-interface {v7, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "headerValue":Ljava/lang/String;
    check-cast v6, Ljava/lang/String;

    .line 87
    .restart local v6    # "headerValue":Ljava/lang/String;
    if-eqz v6, :cond_cb

    .line 88
    invoke-static {v6}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseDateAsEpoch(Ljava/lang/String;)J

    move-result-wide v19

    .line 91
    :cond_cb
    const-string v27, "Last-Modified"

    move-object/from16 v0, v27

    invoke-interface {v7, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "headerValue":Ljava/lang/String;
    check-cast v6, Ljava/lang/String;

    .line 92
    .restart local v6    # "headerValue":Ljava/lang/String;
    if-eqz v6, :cond_db

    .line 93
    invoke-static {v6}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseDateAsEpoch(Ljava/lang/String;)J

    move-result-wide v9

    .line 96
    :cond_db
    const-string v27, "ETag"

    move-object/from16 v0, v27

    invoke-interface {v7, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    .end local v18    # "serverEtag":Ljava/lang/String;
    check-cast v18, Ljava/lang/String;

    .line 100
    .restart local v18    # "serverEtag":Ljava/lang/String;
    if-eqz v5, :cond_11b

    .line 101
    const-wide/16 v27, 0x3e8

    mul-long v27, v27, v11

    add-long v21, v14, v27

    .line 102
    if-eqz v13, :cond_114

    move-wide/from16 v3, v21

    .line 111
    :cond_f1
    :goto_f1
    new-instance v2, Lcom/android/volley/Cache$Entry;

    invoke-direct {v2}, Lcom/android/volley/Cache$Entry;-><init>()V

    .line 112
    .local v2, "entry":Lcom/android/volley/Cache$Entry;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/volley/NetworkResponse;->data:[B

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iput-object v0, v2, Lcom/android/volley/Cache$Entry;->data:[B

    .line 113
    move-object/from16 v0, v18

    iput-object v0, v2, Lcom/android/volley/Cache$Entry;->etag:Ljava/lang/String;

    .line 114
    move-wide/from16 v0, v21

    iput-wide v0, v2, Lcom/android/volley/Cache$Entry;->softTtl:J

    .line 115
    iput-wide v3, v2, Lcom/android/volley/Cache$Entry;->ttl:J

    .line 116
    move-wide/from16 v0, v16

    iput-wide v0, v2, Lcom/android/volley/Cache$Entry;->serverDate:J

    .line 117
    iput-wide v9, v2, Lcom/android/volley/Cache$Entry;->lastModified:J

    .line 118
    iput-object v7, v2, Lcom/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    goto/16 :goto_68

    .line 102
    .end local v2    # "entry":Lcom/android/volley/Cache$Entry;
    :cond_114
    const-wide/16 v27, 0x3e8

    mul-long v27, v27, v23

    add-long v3, v21, v27

    goto :goto_f1

    .line 105
    :cond_11b
    const-wide/16 v27, 0x0

    cmp-long v27, v16, v27

    if-lez v27, :cond_f1

    cmp-long v27, v19, v16

    if-ltz v27, :cond_f1

    .line 107
    sub-long v27, v19, v16

    add-long v21, v14, v27

    .line 108
    move-wide/from16 v3, v21

    goto :goto_f1

    .line 78
    .restart local v8    # "i":I
    .restart local v25    # "token":Ljava/lang/String;
    .restart local v26    # "tokens":[Ljava/lang/String;
    :catch_12c
    move-exception v27

    goto/16 :goto_83

    .line 73
    :catch_12f
    move-exception v27

    goto/16 :goto_83
.end method

.method public static parseCharset(Ljava/util/Map;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "ISO-8859-1"

    invoke-static {p0, v0}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCharset(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static parseCharset(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "defaultCharset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "Content-Type"

    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 146
    .local v0, "contentType":Ljava/lang/String;
    if-eqz v0, :cond_32

    .line 147
    const-string v4, ";"

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 148
    .local v3, "params":[Ljava/lang/String;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_11
    array-length v4, v3

    if-ge v1, v4, :cond_32

    .line 149
    aget-object v4, v3, v1

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 150
    .local v2, "pair":[Ljava/lang/String;
    array-length v4, v2

    const/4 v5, 0x2

    if-ne v4, v5, :cond_33

    .line 151
    const/4 v4, 0x0

    aget-object v4, v2, v4

    const-string v5, "charset"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_33

    .line 152
    const/4 v4, 0x1

    aget-object p1, v2, v4

    .line 158
    .end local v1    # "i":I
    .end local v2    # "pair":[Ljava/lang/String;
    .end local v3    # "params":[Ljava/lang/String;
    .end local p1    # "defaultCharset":Ljava/lang/String;
    :cond_32
    return-object p1

    .line 148
    .restart local v1    # "i":I
    .restart local v2    # "pair":[Ljava/lang/String;
    .restart local v3    # "params":[Ljava/lang/String;
    .restart local p1    # "defaultCharset":Ljava/lang/String;
    :cond_33
    add-int/lit8 v1, v1, 0x1

    goto :goto_11
.end method

.method public static parseDateAsEpoch(Ljava/lang/String;)J
    .registers 4
    .param p0, "dateStr"    # Ljava/lang/String;

    .prologue
    .line 129
    :try_start_0
    invoke-static {p0}, Lorg/apache/http/impl/cookie/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J
    :try_end_7
    .catch Lorg/apache/http/impl/cookie/DateParseException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-wide v1

    .line 132
    :goto_8
    return-wide v1

    .line 130
    :catch_9
    move-exception v0

    .line 132
    .local v0, "e":Lorg/apache/http/impl/cookie/DateParseException;
    const-wide/16 v1, 0x0

    goto :goto_8
.end method
