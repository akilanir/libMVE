.class final Lcom/koushikdutta/async/http/cache/ResponseHeaders;
.super Ljava/lang/Object;
.source "ResponseHeaders.java"


# static fields
.field private static final RECEIVED_MILLIS:Ljava/lang/String; = "X-Android-Received-Millis"

.field private static final SENT_MILLIS:Ljava/lang/String; = "X-Android-Sent-Millis"


# instance fields
.field private ageSeconds:I

.field private connection:Ljava/lang/String;

.field private contentEncoding:Ljava/lang/String;

.field private contentLength:J

.field private etag:Ljava/lang/String;

.field private expires:Ljava/util/Date;

.field private final headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

.field private isPublic:Z

.field private lastModified:Ljava/util/Date;

.field private maxAgeSeconds:I

.field private mustRevalidate:Z

.field private noCache:Z

.field private noStore:Z

.field private proxyAuthenticate:Ljava/lang/String;

.field private receivedResponseMillis:J

.field private sMaxAgeSeconds:I

.field private sentRequestMillis:J

.field private servedDate:Ljava/util/Date;

.field private transferEncoding:Ljava/lang/String;

.field private final uri:Landroid/net/Uri;

.field private varyFields:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private wwwAuthenticate:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Lcom/koushikdutta/async/http/cache/RawHeaders;)V
    .registers 13
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "headers"    # Lcom/koushikdutta/async/http/cache/RawHeaders;

    .prologue
    const/4 v8, -0x1

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->maxAgeSeconds:I

    .line 92
    iput v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->sMaxAgeSeconds:I

    .line 104
    iput v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->ageSeconds:I

    .line 107
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v8

    iput-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->varyFields:Ljava/util/Set;

    .line 111
    const-wide/16 v8, -0x1

    iput-wide v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->contentLength:J

    .line 117
    iput-object p1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->uri:Landroid/net/Uri;

    .line 118
    iput-object p2, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    .line 120
    new-instance v2, Lcom/koushikdutta/async/http/cache/ResponseHeaders$1;

    invoke-direct {v2, p0}, Lcom/koushikdutta/async/http/cache/ResponseHeaders$1;-><init>(Lcom/koushikdutta/async/http/cache/ResponseHeaders;)V

    .line 138
    .local v2, "handler":Lcom/koushikdutta/async/http/cache/HeaderParser$CacheControlHandler;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1e
    invoke-virtual {p2}, Lcom/koushikdutta/async/http/cache/RawHeaders;->length()I

    move-result v8

    if-ge v3, v8, :cond_139

    .line 139
    invoke-virtual {p2, v3}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getFieldName(I)Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "fieldName":Ljava/lang/String;
    invoke-virtual {p2, v3}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getValue(I)Ljava/lang/String;

    move-result-object v6

    .line 141
    .local v6, "value":Ljava/lang/String;
    const-string v8, "Cache-Control"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3a

    .line 142
    invoke-static {v6, v2}, Lcom/koushikdutta/async/http/cache/HeaderParser;->parseCacheControl(Ljava/lang/String;Lcom/koushikdutta/async/http/cache/HeaderParser$CacheControlHandler;)V

    .line 138
    :cond_37
    :goto_37
    add-int/lit8 v3, v3, 0x1

    goto :goto_1e

    .line 143
    :cond_3a
    const-string v8, "Date"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_49

    .line 144
    invoke-static {v6}, Lcom/koushikdutta/async/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v8

    iput-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->servedDate:Ljava/util/Date;

    goto :goto_37

    .line 145
    :cond_49
    const-string v8, "Expires"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_58

    .line 146
    invoke-static {v6}, Lcom/koushikdutta/async/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v8

    iput-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->expires:Ljava/util/Date;

    goto :goto_37

    .line 147
    :cond_58
    const-string v8, "Last-Modified"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_67

    .line 148
    invoke-static {v6}, Lcom/koushikdutta/async/http/HttpDate;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v8

    iput-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->lastModified:Ljava/util/Date;

    goto :goto_37

    .line 149
    :cond_67
    const-string v8, "ETag"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_72

    .line 150
    iput-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->etag:Ljava/lang/String;

    goto :goto_37

    .line 151
    :cond_72
    const-string v8, "Pragma"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_86

    .line 152
    const-string v8, "no-cache"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_37

    .line 153
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->noCache:Z

    goto :goto_37

    .line 155
    :cond_86
    const-string v8, "Age"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_95

    .line 156
    invoke-static {v6}, Lcom/koushikdutta/async/http/cache/HeaderParser;->parseSeconds(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->ageSeconds:I

    goto :goto_37

    .line 157
    :cond_95
    const-string v8, "Vary"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_ca

    .line 159
    iget-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->varyFields:Ljava/util/Set;

    invoke-interface {v8}, Ljava/util/Set;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_ae

    .line 160
    new-instance v8, Ljava/util/TreeSet;

    sget-object v9, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v8, v9}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->varyFields:Ljava/util/Set;

    .line 162
    :cond_ae
    const-string v8, ","

    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_b6
    if-ge v4, v5, :cond_37

    aget-object v7, v0, v4

    .line 163
    .local v7, "varyField":Ljava/lang/String;
    iget-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->varyFields:Ljava/util/Set;

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 162
    add-int/lit8 v4, v4, 0x1

    goto :goto_b6

    .line 165
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v7    # "varyField":Ljava/lang/String;
    :cond_ca
    const-string v8, "Content-Encoding"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d6

    .line 166
    iput-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->contentEncoding:Ljava/lang/String;

    goto/16 :goto_37

    .line 167
    :cond_d6
    const-string v8, "Transfer-Encoding"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_e2

    .line 168
    iput-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->transferEncoding:Ljava/lang/String;

    goto/16 :goto_37

    .line 169
    :cond_e2
    const-string v8, "Content-Length"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_f5

    .line 171
    :try_start_ea
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    iput-wide v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->contentLength:J
    :try_end_f0
    .catch Ljava/lang/NumberFormatException; {:try_start_ea .. :try_end_f0} :catch_f2

    goto/16 :goto_37

    .line 172
    :catch_f2
    move-exception v8

    goto/16 :goto_37

    .line 174
    :cond_f5
    const-string v8, "Connection"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_101

    .line 175
    iput-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->connection:Ljava/lang/String;

    goto/16 :goto_37

    .line 176
    :cond_101
    const-string v8, "Proxy-Authenticate"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_10d

    .line 177
    iput-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->proxyAuthenticate:Ljava/lang/String;

    goto/16 :goto_37

    .line 178
    :cond_10d
    const-string v8, "WWW-Authenticate"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_119

    .line 179
    iput-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->wwwAuthenticate:Ljava/lang/String;

    goto/16 :goto_37

    .line 180
    :cond_119
    const-string v8, "X-Android-Sent-Millis"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_129

    .line 181
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    iput-wide v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->sentRequestMillis:J

    goto/16 :goto_37

    .line 182
    :cond_129
    const-string v8, "X-Android-Received-Millis"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_37

    .line 183
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    iput-wide v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->receivedResponseMillis:J

    goto/16 :goto_37

    .line 186
    .end local v1    # "fieldName":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_139
    return-void
.end method

.method static synthetic access$002(Lcom/koushikdutta/async/http/cache/ResponseHeaders;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/cache/ResponseHeaders;
    .param p1, "x1"    # Z

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->noCache:Z

    return p1
.end method

.method static synthetic access$102(Lcom/koushikdutta/async/http/cache/ResponseHeaders;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/cache/ResponseHeaders;
    .param p1, "x1"    # Z

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->noStore:Z

    return p1
.end method

.method static synthetic access$202(Lcom/koushikdutta/async/http/cache/ResponseHeaders;I)I
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/cache/ResponseHeaders;
    .param p1, "x1"    # I

    .prologue
    .line 35
    iput p1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->maxAgeSeconds:I

    return p1
.end method

.method static synthetic access$302(Lcom/koushikdutta/async/http/cache/ResponseHeaders;I)I
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/cache/ResponseHeaders;
    .param p1, "x1"    # I

    .prologue
    .line 35
    iput p1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->sMaxAgeSeconds:I

    return p1
.end method

.method static synthetic access$402(Lcom/koushikdutta/async/http/cache/ResponseHeaders;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/cache/ResponseHeaders;
    .param p1, "x1"    # Z

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->isPublic:Z

    return p1
.end method

.method static synthetic access$502(Lcom/koushikdutta/async/http/cache/ResponseHeaders;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/cache/ResponseHeaders;
    .param p1, "x1"    # Z

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->mustRevalidate:Z

    return p1
.end method

.method private computeAge(J)J
    .registers 15
    .param p1, "nowMillis"    # J

    .prologue
    const-wide/16 v0, 0x0

    .line 289
    iget-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->servedDate:Ljava/util/Date;

    if-eqz v8, :cond_13

    iget-wide v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->receivedResponseMillis:J

    iget-object v10, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->servedDate:Ljava/util/Date;

    .line 290
    invoke-virtual {v10}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    sub-long/2addr v8, v10

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 292
    .local v0, "apparentReceivedAge":J
    :cond_13
    iget v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->ageSeconds:I

    const/4 v9, -0x1

    if-eq v8, v9, :cond_33

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget v9, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->ageSeconds:I

    int-to-long v9, v9

    .line 293
    invoke-virtual {v8, v9, v10}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 295
    .local v2, "receivedAge":J
    :goto_25
    iget-wide v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->receivedResponseMillis:J

    iget-wide v10, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->sentRequestMillis:J

    sub-long v6, v8, v10

    .line 296
    .local v6, "responseDuration":J
    iget-wide v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->receivedResponseMillis:J

    sub-long v4, p1, v8

    .line 297
    .local v4, "residentDuration":J
    add-long v8, v2, v6

    add-long/2addr v8, v4

    return-wide v8

    .end local v2    # "receivedAge":J
    .end local v4    # "residentDuration":J
    .end local v6    # "responseDuration":J
    :cond_33
    move-wide v2, v0

    .line 293
    goto :goto_25
.end method

.method private computeFreshnessLifetime()J
    .registers 9

    .prologue
    const-wide/16 v4, 0x0

    .line 305
    iget v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->maxAgeSeconds:I

    const/4 v7, -0x1

    if-eq v6, v7, :cond_11

    .line 306
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget v5, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->maxAgeSeconds:I

    int-to-long v5, v5

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    .line 322
    :cond_10
    :goto_10
    return-wide v4

    .line 307
    :cond_11
    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->expires:Ljava/util/Date;

    if-eqz v6, :cond_32

    .line 308
    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->servedDate:Ljava/util/Date;

    if-eqz v6, :cond_2d

    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->servedDate:Ljava/util/Date;

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 309
    .local v2, "servedMillis":J
    :goto_1f
    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->expires:Ljava/util/Date;

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    sub-long v0, v6, v2

    .line 310
    .local v0, "delta":J
    cmp-long v6, v0, v4

    if-lez v6, :cond_30

    .end local v0    # "delta":J
    :goto_2b
    move-wide v4, v0

    goto :goto_10

    .line 308
    .end local v2    # "servedMillis":J
    :cond_2d
    iget-wide v2, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->receivedResponseMillis:J

    goto :goto_1f

    .restart local v0    # "delta":J
    .restart local v2    # "servedMillis":J
    :cond_30
    move-wide v0, v4

    .line 310
    goto :goto_2b

    .line 311
    .end local v0    # "delta":J
    .end local v2    # "servedMillis":J
    :cond_32
    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->lastModified:Ljava/util/Date;

    if-eqz v6, :cond_10

    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->uri:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_10

    .line 318
    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->servedDate:Ljava/util/Date;

    if-eqz v6, :cond_59

    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->servedDate:Ljava/util/Date;

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 319
    .restart local v2    # "servedMillis":J
    :goto_48
    iget-object v6, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->lastModified:Ljava/util/Date;

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    sub-long v0, v2, v6

    .line 320
    .restart local v0    # "delta":J
    cmp-long v6, v0, v4

    if-lez v6, :cond_10

    const-wide/16 v4, 0xa

    div-long v4, v0, v4

    goto :goto_10

    .line 318
    .end local v0    # "delta":J
    .end local v2    # "servedMillis":J
    :cond_59
    iget-wide v2, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->sentRequestMillis:J

    goto :goto_48
.end method

.method private static isEndToEnd(Ljava/lang/String;)Z
    .registers 2
    .param p0, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 512
    const-string v0, "Connection"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "Keep-Alive"

    .line 513
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "Proxy-Authenticate"

    .line 514
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "Proxy-Authorization"

    .line 515
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "TE"

    .line 516
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "Trailers"

    .line 517
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "Transfer-Encoding"

    .line 518
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "Upgrade"

    .line 519
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_42

    const/4 v0, 0x1

    :goto_41
    return v0

    :cond_42
    const/4 v0, 0x0

    goto :goto_41
.end method

.method private isFreshnessLifetimeHeuristic()Z
    .registers 3

    .prologue
    .line 331
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->maxAgeSeconds:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_b

    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->expires:Ljava/util/Date;

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method


# virtual methods
.method public chooseResponseSource(JLcom/koushikdutta/async/http/cache/RequestHeaders;)Lcom/koushikdutta/async/http/cache/ResponseSource;
    .registers 16
    .param p1, "nowMillis"    # J
    .param p3, "request"    # Lcom/koushikdutta/async/http/cache/RequestHeaders;

    .prologue
    const/4 v11, -0x1

    .line 401
    invoke-virtual {p0, p3}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->isCacheable(Lcom/koushikdutta/async/http/cache/RequestHeaders;)Z

    move-result v8

    if-nez v8, :cond_a

    .line 402
    sget-object v8, Lcom/koushikdutta/async/http/cache/ResponseSource;->NETWORK:Lcom/koushikdutta/async/http/cache/ResponseSource;

    .line 451
    :goto_9
    return-object v8

    .line 405
    :cond_a
    invoke-virtual {p3}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->isNoCache()Z

    move-result v8

    if-nez v8, :cond_16

    invoke-virtual {p3}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->hasConditions()Z

    move-result v8

    if-eqz v8, :cond_19

    .line 406
    :cond_16
    sget-object v8, Lcom/koushikdutta/async/http/cache/ResponseSource;->NETWORK:Lcom/koushikdutta/async/http/cache/ResponseSource;

    goto :goto_9

    .line 409
    :cond_19
    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->computeAge(J)J

    move-result-wide v0

    .line 410
    .local v0, "ageMillis":J
    invoke-direct {p0}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->computeFreshnessLifetime()J

    move-result-wide v2

    .line 412
    .local v2, "freshMillis":J
    invoke-virtual {p3}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->getMaxAgeSeconds()I

    move-result v8

    if-eq v8, v11, :cond_36

    .line 413
    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 414
    invoke-virtual {p3}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->getMaxAgeSeconds()I

    move-result v9

    int-to-long v9, v9

    invoke-virtual {v8, v9, v10}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    .line 413
    invoke-static {v2, v3, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    .line 417
    :cond_36
    const-wide/16 v6, 0x0

    .line 418
    .local v6, "minFreshMillis":J
    invoke-virtual {p3}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->getMinFreshSeconds()I

    move-result v8

    if-eq v8, v11, :cond_49

    .line 419
    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p3}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->getMinFreshSeconds()I

    move-result v9

    int-to-long v9, v9

    invoke-virtual {v8, v9, v10}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v6

    .line 422
    :cond_49
    const-wide/16 v4, 0x0

    .line 423
    .local v4, "maxStaleMillis":J
    iget-boolean v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->mustRevalidate:Z

    if-nez v8, :cond_60

    invoke-virtual {p3}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->getMaxStaleSeconds()I

    move-result v8

    if-eq v8, v11, :cond_60

    .line 424
    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p3}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->getMaxStaleSeconds()I

    move-result v9

    int-to-long v9, v9

    invoke-virtual {v8, v9, v10}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    .line 427
    :cond_60
    iget-boolean v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->noCache:Z

    if-nez v8, :cond_95

    add-long v8, v0, v6

    add-long v10, v2, v4

    cmp-long v8, v8, v10

    if-gez v8, :cond_95

    .line 428
    add-long v8, v0, v6

    cmp-long v8, v8, v2

    if-ltz v8, :cond_7b

    .line 429
    iget-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    const-string v9, "Warning"

    const-string v10, "110 HttpURLConnection \"Response is stale\""

    invoke-virtual {v8, v9, v10}, Lcom/koushikdutta/async/http/cache/RawHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 435
    :cond_7b
    const-wide/32 v8, 0x5265c00

    cmp-long v8, v0, v8

    if-lez v8, :cond_91

    invoke-direct {p0}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->isFreshnessLifetimeHeuristic()Z

    move-result v8

    if-eqz v8, :cond_91

    .line 436
    iget-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    const-string v9, "Warning"

    const-string v10, "113 HttpURLConnection \"Heuristic expiration\""

    invoke-virtual {v8, v9, v10}, Lcom/koushikdutta/async/http/cache/RawHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 438
    :cond_91
    sget-object v8, Lcom/koushikdutta/async/http/cache/ResponseSource;->CACHE:Lcom/koushikdutta/async/http/cache/ResponseSource;

    goto/16 :goto_9

    .line 441
    :cond_95
    iget-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->etag:Ljava/lang/String;

    if-eqz v8, :cond_a8

    .line 442
    iget-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->etag:Ljava/lang/String;

    invoke-virtual {p3, v8}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->setIfNoneMatch(Ljava/lang/String;)V

    .line 451
    :cond_9e
    :goto_9e
    invoke-virtual {p3}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->hasConditions()Z

    move-result v8

    if-eqz v8, :cond_bc

    sget-object v8, Lcom/koushikdutta/async/http/cache/ResponseSource;->CONDITIONAL_CACHE:Lcom/koushikdutta/async/http/cache/ResponseSource;

    goto/16 :goto_9

    .line 444
    :cond_a8
    iget-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->lastModified:Ljava/util/Date;

    if-eqz v8, :cond_b2

    .line 445
    iget-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->lastModified:Ljava/util/Date;

    invoke-virtual {p3, v8}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->setIfModifiedSince(Ljava/util/Date;)V

    goto :goto_9e

    .line 446
    :cond_b2
    iget-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->servedDate:Ljava/util/Date;

    if-eqz v8, :cond_9e

    .line 447
    iget-object v8, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->servedDate:Ljava/util/Date;

    invoke-virtual {p3, v8}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->setIfModifiedSince(Ljava/util/Date;)V

    goto :goto_9e

    .line 451
    :cond_bc
    sget-object v8, Lcom/koushikdutta/async/http/cache/ResponseSource;->NETWORK:Lcom/koushikdutta/async/http/cache/ResponseSource;

    goto/16 :goto_9
.end method

.method public combine(Lcom/koushikdutta/async/http/cache/ResponseHeaders;)Lcom/koushikdutta/async/http/cache/ResponseHeaders;
    .registers 8
    .param p1, "network"    # Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    .prologue
    .line 484
    new-instance v2, Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-direct {v2}, Lcom/koushikdutta/async/http/cache/RawHeaders;-><init>()V

    .line 486
    .local v2, "result":Lcom/koushikdutta/async/http/cache/RawHeaders;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-virtual {v4}, Lcom/koushikdutta/async/http/cache/RawHeaders;->length()I

    move-result v4

    if-ge v1, v4, :cond_3f

    .line 487
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-virtual {v4, v1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getFieldName(I)Ljava/lang/String;

    move-result-object v0

    .line 488
    .local v0, "fieldName":Ljava/lang/String;
    iget-object v4, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-virtual {v4, v1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getValue(I)Ljava/lang/String;

    move-result-object v3

    .line 489
    .local v3, "value":Ljava/lang/String;
    const-string v4, "Warning"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    const-string v4, "1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 486
    :cond_2a
    :goto_2a
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 492
    :cond_2d
    invoke-static {v0}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->isEndToEnd(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3b

    iget-object v4, p1, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-virtual {v4, v0}, Lcom/koushikdutta/async/http/cache/RawHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2a

    .line 493
    :cond_3b
    invoke-virtual {v2, v0, v3}, Lcom/koushikdutta/async/http/cache/RawHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2a

    .line 497
    .end local v0    # "fieldName":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_3f
    const/4 v1, 0x0

    :goto_40
    iget-object v4, p1, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-virtual {v4}, Lcom/koushikdutta/async/http/cache/RawHeaders;->length()I

    move-result v4

    if-ge v1, v4, :cond_60

    .line 498
    iget-object v4, p1, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-virtual {v4, v1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getFieldName(I)Ljava/lang/String;

    move-result-object v0

    .line 499
    .restart local v0    # "fieldName":Ljava/lang/String;
    invoke-static {v0}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->isEndToEnd(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5d

    .line 500
    iget-object v4, p1, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-virtual {v4, v1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v0, v4}, Lcom/koushikdutta/async/http/cache/RawHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    :cond_5d
    add-int/lit8 v1, v1, 0x1

    goto :goto_40

    .line 504
    .end local v0    # "fieldName":Ljava/lang/String;
    :cond_60
    new-instance v4, Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    iget-object v5, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->uri:Landroid/net/Uri;

    invoke-direct {v4, v5, v2}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;-><init>(Landroid/net/Uri;Lcom/koushikdutta/async/http/cache/RawHeaders;)V

    return-object v4
.end method

.method public getConnection()Ljava/lang/String;
    .registers 2

    .prologue
    .line 266
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->connection:Ljava/lang/String;

    return-object v0
.end method

.method public getContentEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->contentEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 262
    iget-wide v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->contentLength:J

    return-wide v0
.end method

.method public getEtag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 250
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->etag:Ljava/lang/String;

    return-object v0
.end method

.method public getExpires()Ljava/util/Date;
    .registers 2

    .prologue
    .line 222
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->expires:Ljava/util/Date;

    return-object v0
.end method

.method public getHeaders()Lcom/koushikdutta/async/http/cache/RawHeaders;
    .registers 2

    .prologue
    .line 210
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    return-object v0
.end method

.method public getLastModified()Ljava/util/Date;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->lastModified:Ljava/util/Date;

    return-object v0
.end method

.method public getMaxAgeSeconds()I
    .registers 2

    .prologue
    .line 234
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->maxAgeSeconds:I

    return v0
.end method

.method public getProxyAuthenticate()Ljava/lang/String;
    .registers 2

    .prologue
    .line 270
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->proxyAuthenticate:Ljava/lang/String;

    return-object v0
.end method

.method public getSMaxAgeSeconds()I
    .registers 2

    .prologue
    .line 238
    iget v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->sMaxAgeSeconds:I

    return v0
.end method

.method public getServedDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->servedDate:Ljava/util/Date;

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 206
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->uri:Landroid/net/Uri;

    return-object v0
.end method

.method public getVaryFields()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 254
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->varyFields:Ljava/util/Set;

    return-object v0
.end method

.method public getWwwAuthenticate()Ljava/lang/String;
    .registers 2

    .prologue
    .line 274
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->wwwAuthenticate:Ljava/lang/String;

    return-object v0
.end method

.method public hasConnectionClose()Z
    .registers 3

    .prologue
    .line 202
    const-string v0, "close"

    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->connection:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasVaryAll()Z
    .registers 3

    .prologue
    .line 375
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->varyFields:Ljava/util/Set;

    const-string v1, "*"

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isCacheable(Lcom/koushikdutta/async/http/cache/RequestHeaders;)Z
    .registers 6
    .param p1, "request"    # Lcom/koushikdutta/async/http/cache/RequestHeaders;

    .prologue
    const/4 v1, 0x0

    .line 343
    iget-object v2, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getResponseCode()I

    move-result v0

    .line 344
    .local v0, "responseCode":I
    const/16 v2, 0xc8

    if-eq v0, v2, :cond_1c

    const/16 v2, 0xcb

    if-eq v0, v2, :cond_1c

    const/16 v2, 0x12c

    if-eq v0, v2, :cond_1c

    const/16 v2, 0x12d

    if-eq v0, v2, :cond_1c

    const/16 v2, 0x19a

    if-eq v0, v2, :cond_1c

    .line 367
    :cond_1b
    :goto_1b
    return v1

    .line 356
    :cond_1c
    invoke-virtual {p1}, Lcom/koushikdutta/async/http/cache/RequestHeaders;->hasAuthorization()Z

    move-result v2

    if-eqz v2, :cond_2f

    iget-boolean v2, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->isPublic:Z

    if-nez v2, :cond_2f

    iget-boolean v2, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->mustRevalidate:Z

    if-nez v2, :cond_2f

    iget v2, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->sMaxAgeSeconds:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1b

    .line 363
    :cond_2f
    iget-boolean v2, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->noStore:Z

    if-nez v2, :cond_1b

    .line 367
    const/4 v1, 0x1

    goto :goto_1b
.end method

.method public isChunked()Z
    .registers 3

    .prologue
    .line 198
    const-string v0, "chunked"

    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->transferEncoding:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isContentEncodingGzip()Z
    .registers 3

    .prologue
    .line 189
    const-string v0, "gzip"

    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->contentEncoding:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isMustRevalidate()Z
    .registers 2

    .prologue
    .line 246
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->mustRevalidate:Z

    return v0
.end method

.method public isNoCache()Z
    .registers 2

    .prologue
    .line 226
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->noCache:Z

    return v0
.end method

.method public isNoStore()Z
    .registers 2

    .prologue
    .line 230
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->noStore:Z

    return v0
.end method

.method public isPublic()Z
    .registers 2

    .prologue
    .line 242
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->isPublic:Z

    return v0
.end method

.method public setLocalTimestamps(JJ)V
    .registers 8
    .param p1, "sentRequestMillis"    # J
    .param p3, "receivedResponseMillis"    # J

    .prologue
    .line 278
    iput-wide p1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->sentRequestMillis:J

    .line 279
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    const-string v1, "X-Android-Sent-Millis"

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/http/cache/RawHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    iput-wide p3, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->receivedResponseMillis:J

    .line 281
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    const-string v1, "X-Android-Received-Millis"

    invoke-static {p3, p4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/http/cache/RawHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    return-void
.end method

.method public stripContentEncoding()V
    .registers 3

    .prologue
    .line 193
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->contentEncoding:Ljava/lang/String;

    .line 194
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    const-string v1, "Content-Encoding"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->removeAll(Ljava/lang/String;)V

    .line 195
    return-void
.end method

.method public validate(Lcom/koushikdutta/async/http/cache/ResponseHeaders;)Z
    .registers 7
    .param p1, "networkResponse"    # Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    .prologue
    const/4 v0, 0x1

    .line 461
    iget-object v1, p1, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->headers:Lcom/koushikdutta/async/http/cache/RawHeaders;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/cache/RawHeaders;->getResponseCode()I

    move-result v1

    const/16 v2, 0x130

    if-ne v1, v2, :cond_c

    .line 476
    :cond_b
    :goto_b
    return v0

    .line 470
    :cond_c
    iget-object v1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->lastModified:Ljava/util/Date;

    if-eqz v1, :cond_24

    iget-object v1, p1, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->lastModified:Ljava/util/Date;

    if-eqz v1, :cond_24

    iget-object v1, p1, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->lastModified:Ljava/util/Date;

    .line 472
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    iget-object v3, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->lastModified:Ljava/util/Date;

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-ltz v1, :cond_b

    .line 476
    :cond_24
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public varyMatches(Ljava/util/Map;Ljava/util/Map;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)Z"
        }
    .end annotation

    .prologue
    .line 384
    .local p1, "cachedRequest":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .local p2, "newRequest":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v2, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->varyFields:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 385
    .local v0, "field":Ljava/lang/String;
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/koushikdutta/async/http/cache/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 386
    const/4 v2, 0x0

    .line 389
    .end local v0    # "field":Ljava/lang/String;
    :goto_21
    return v2

    :cond_22
    const/4 v2, 0x1

    goto :goto_21
.end method
