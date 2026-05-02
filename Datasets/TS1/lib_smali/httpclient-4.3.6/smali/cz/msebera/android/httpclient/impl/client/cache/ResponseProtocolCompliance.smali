.class Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;
.super Ljava/lang/Object;
.source "ResponseProtocolCompliance.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field private static final UNEXPECTED_100_CONTINUE:Ljava/lang/String; = "The incoming request did not contain a 100-continue header, but the response was a Status 100, continue."

.field private static final UNEXPECTED_PARTIAL_CONTENT:Ljava/lang/String; = "partial content was returned for a request that did not ask for it"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private backendResponseMustNotHaveBody(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 5
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "backendResponse"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 214
    const-string v0, "HEAD"

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    .line 215
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0xcc

    if-eq v0, v1, :cond_34

    .line 216
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0xcd

    if-eq v0, v1, :cond_34

    .line 217
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0x130

    if-ne v0, v1, :cond_36

    :cond_34
    const/4 v0, 0x1

    :goto_35
    return v0

    :cond_36
    const/4 v0, 0x0

    goto :goto_35
.end method

.method private consumeBody(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 3
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    .line 95
    .local v0, "body":Lcz/msebera/android/httpclient/HttpEntity;
    if-eqz v0, :cond_9

    .line 96
    invoke-static {v0}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 98
    :cond_9
    return-void
.end method

.method private ensure200ForOPTIONSRequestWithNoBodyHasContentLengthZero(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 5
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 188
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "OPTIONS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_11

    .line 199
    :cond_10
    :goto_10
    return-void

    .line 192
    :cond_11
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_10

    .line 196
    const-string v0, "Content-Length"

    invoke-interface {p2, v0}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    if-nez v0, :cond_10

    .line 197
    const-string v0, "Content-Length"

    const-string v1, "0"

    invoke-interface {p2, v0, v1}, Lcz/msebera/android/httpclient/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_10
.end method

.method private ensure206ContainsDateHeader(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 4
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 169
    const-string v0, "Date"

    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    if-nez v0, :cond_16

    .line 170
    const-string v0, "Date"

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-static {v1}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->formatDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcz/msebera/android/httpclient/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    :cond_16
    return-void
.end method

.method private ensure304DoesNotContainExtraEntityHeaders(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 7
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    const/4 v2, 0x0

    .line 202
    const/16 v3, 0x8

    new-array v0, v3, [Ljava/lang/String;

    const-string v3, "Allow"

    aput-object v3, v0, v2

    const/4 v3, 0x1

    const-string v4, "Content-Encoding"

    aput-object v4, v0, v3

    const/4 v3, 0x2

    const-string v4, "Content-Language"

    aput-object v4, v0, v3

    const/4 v3, 0x3

    const-string v4, "Content-Length"

    aput-object v4, v0, v3

    const/4 v3, 0x4

    const-string v4, "Content-MD5"

    aput-object v4, v0, v3

    const/4 v3, 0x5

    const-string v4, "Content-Range"

    aput-object v4, v0, v3

    const/4 v3, 0x6

    const-string v4, "Content-Type"

    aput-object v4, v0, v3

    const/4 v3, 0x7

    const-string v4, "Last-Modified"

    aput-object v4, v0, v3

    .line 206
    .local v0, "disallowedEntityHeaders":[Ljava/lang/String;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v3

    const/16 v4, 0x130

    if-ne v3, v4, :cond_43

    .line 207
    array-length v3, v0

    :goto_39
    if-ge v2, v3, :cond_43

    aget-object v1, v0, v2

    .line 208
    .local v1, "hdr":Ljava/lang/String;
    invoke-interface {p1, v1}, Lcz/msebera/android/httpclient/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 207
    add-int/lit8 v2, v2, 0x1

    goto :goto_39

    .line 211
    .end local v1    # "hdr":Ljava/lang/String;
    :cond_43
    return-void
.end method

.method private ensurePartialContentIsNotSentToAClientThatDidNotRequestIt(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 5
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    const-string v0, "Range"

    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    if-nez v0, :cond_14

    .line 178
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0xce

    if-eq v0, v1, :cond_15

    .line 179
    :cond_14
    return-void

    .line 182
    :cond_15
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->consumeBody(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 183
    new-instance v0, Lcz/msebera/android/httpclient/client/ClientProtocolException;

    const-string v1, "partial content was returned for a request that did not ask for it"

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/client/ClientProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private identityIsNotUsedInContentEncoding(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 18
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 134
    const-string v9, "Content-Encoding"

    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Lcz/msebera/android/httpclient/HttpResponse;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v5

    .line 135
    .local v5, "hdrs":[Lcz/msebera/android/httpclient/Header;
    if-eqz v5, :cond_d

    array-length v9, v5

    if-nez v9, :cond_e

    .line 166
    :cond_d
    return-void

    .line 138
    :cond_e
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .local v8, "newHeaders":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/Header;>;"
    const/4 v6, 0x0

    .line 140
    .local v6, "modified":Z
    array-length v11, v5

    const/4 v9, 0x0

    move v10, v9

    :goto_17
    if-ge v10, v11, :cond_65

    aget-object v4, v5, v10

    .line 141
    .local v4, "h":Lcz/msebera/android/httpclient/Header;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .local v1, "buf":Ljava/lang/StringBuilder;
    const/4 v3, 0x1

    .line 143
    .local v3, "first":Z
    invoke-interface {v4}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v12

    array-length v13, v12

    const/4 v9, 0x0

    :goto_27
    if-ge v9, v13, :cond_4b

    aget-object v2, v12, v9

    .line 144
    .local v2, "elt":Lcz/msebera/android/httpclient/HeaderElement;
    const-string v14, "identity"

    invoke-interface {v2}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3b

    .line 145
    const/4 v6, 0x1

    .line 143
    :goto_38
    add-int/lit8 v9, v9, 0x1

    goto :goto_27

    .line 147
    :cond_3b
    if-nez v3, :cond_42

    .line 148
    const-string v14, ","

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    :cond_42
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    const/4 v3, 0x0

    goto :goto_38

    .line 154
    .end local v2    # "elt":Lcz/msebera/android/httpclient/HeaderElement;
    :cond_4b
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 155
    .local v7, "newHeaderValue":Ljava/lang/String;
    const-string v9, ""

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_61

    .line 156
    new-instance v9, Lcz/msebera/android/httpclient/message/BasicHeader;

    const-string v12, "Content-Encoding"

    invoke-direct {v9, v12, v7}, Lcz/msebera/android/httpclient/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    :cond_61
    add-int/lit8 v9, v10, 0x1

    move v10, v9

    goto :goto_17

    .line 159
    .end local v1    # "buf":Ljava/lang/StringBuilder;
    .end local v3    # "first":Z
    .end local v4    # "h":Lcz/msebera/android/httpclient/Header;
    .end local v7    # "newHeaderValue":Ljava/lang/String;
    :cond_65
    if-eqz v6, :cond_d

    .line 162
    const-string v9, "Content-Encoding"

    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Lcz/msebera/android/httpclient/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 163
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_72
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_d

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcz/msebera/android/httpclient/Header;

    .line 164
    .restart local v4    # "h":Lcz/msebera/android/httpclient/Header;
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lcz/msebera/android/httpclient/HttpResponse;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    goto :goto_72
.end method

.method private removeResponseTransferEncoding(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 3
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 247
    const-string v0, "TE"

    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 248
    const-string v0, "Transfer-Encoding"

    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 249
    return-void
.end method

.method private requestDidNotExpect100ContinueButResponseIsOne(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 6
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0x64

    if-eq v1, v2, :cond_d

    .line 229
    :cond_c
    return-void

    .line 226
    :cond_d
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getOriginal()Lcz/msebera/android/httpclient/HttpRequest;

    move-result-object v0

    .line 227
    .local v0, "originalRequest":Lcz/msebera/android/httpclient/HttpRequest;
    instance-of v1, v0, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    if-eqz v1, :cond_1d

    .line 228
    check-cast v0, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    .end local v0    # "originalRequest":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;->expectContinue()Z

    move-result v1

    if-nez v1, :cond_c

    .line 232
    :cond_1d
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->consumeBody(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 233
    new-instance v1, Lcz/msebera/android/httpclient/client/ClientProtocolException;

    const-string v2, "The incoming request did not contain a 100-continue header, but the response was a Status 100, continue."

    invoke-direct {v1, v2}, Lcz/msebera/android/httpclient/client/ClientProtocolException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private transferEncodingIsNotReturnedTo1_0Client(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 6
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 238
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;->getOriginal()Lcz/msebera/android/httpclient/HttpRequest;

    move-result-object v0

    .line 239
    .local v0, "originalRequest":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpRequest;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v1

    sget-object v2, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/ProtocolVersion;->compareToVersion(Lcz/msebera/android/httpclient/ProtocolVersion;)I

    move-result v1

    if-ltz v1, :cond_11

    .line 244
    :goto_10
    return-void

    .line 243
    :cond_11
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->removeResponseTransferEncoding(Lcz/msebera/android/httpclient/HttpResponse;)V

    goto :goto_10
.end method

.method private warningsWithNonMatchingWarnDatesAreRemoved(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 18
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 102
    const-string v8, "Date"

    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v8

    invoke-interface {v8}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcz/msebera/android/httpclient/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    .line 103
    .local v4, "responseDate":Ljava/util/Date;
    if-nez v4, :cond_13

    .line 131
    :cond_12
    return-void

    .line 107
    :cond_13
    const-string v8, "Warning"

    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Lcz/msebera/android/httpclient/HttpResponse;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v6

    .line 109
    .local v6, "warningHeaders":[Lcz/msebera/android/httpclient/Header;
    if-eqz v6, :cond_12

    array-length v8, v6

    if-eqz v8, :cond_12

    .line 113
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .local v3, "newWarningHeaders":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/Header;>;"
    const/4 v2, 0x0

    .line 115
    .local v2, "modified":Z
    array-length v10, v6

    const/4 v8, 0x0

    move v9, v8

    :goto_29
    if-ge v9, v10, :cond_5a

    aget-object v1, v6, v9

    .line 116
    .local v1, "h":Lcz/msebera/android/httpclient/Header;
    invoke-static {v1}, Lcz/msebera/android/httpclient/impl/client/cache/WarningValue;->getWarningValues(Lcz/msebera/android/httpclient/Header;)[Lcz/msebera/android/httpclient/impl/client/cache/WarningValue;

    move-result-object v11

    array-length v12, v11

    const/4 v8, 0x0

    :goto_33
    if-ge v8, v12, :cond_56

    aget-object v7, v11, v8

    .line 117
    .local v7, "wv":Lcz/msebera/android/httpclient/impl/client/cache/WarningValue;
    invoke-virtual {v7}, Lcz/msebera/android/httpclient/impl/client/cache/WarningValue;->getWarnDate()Ljava/util/Date;

    move-result-object v5

    .line 118
    .local v5, "warnDate":Ljava/util/Date;
    if-eqz v5, :cond_43

    invoke-virtual {v5, v4}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_54

    .line 119
    :cond_43
    new-instance v13, Lcz/msebera/android/httpclient/message/BasicHeader;

    const-string v14, "Warning"

    invoke-virtual {v7}, Lcz/msebera/android/httpclient/impl/client/cache/WarningValue;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v13, v14, v15}, Lcz/msebera/android/httpclient/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    :goto_51
    add-int/lit8 v8, v8, 0x1

    goto :goto_33

    .line 121
    :cond_54
    const/4 v2, 0x1

    goto :goto_51

    .line 115
    .end local v5    # "warnDate":Ljava/util/Date;
    .end local v7    # "wv":Lcz/msebera/android/httpclient/impl/client/cache/WarningValue;
    :cond_56
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    goto :goto_29

    .line 125
    .end local v1    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_5a
    if-eqz v2, :cond_12

    .line 126
    const-string v8, "Warning"

    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Lcz/msebera/android/httpclient/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 127
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_67
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_12

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcz/msebera/android/httpclient/Header;

    .line 128
    .restart local v1    # "h":Lcz/msebera/android/httpclient/Header;
    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/HttpResponse;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    goto :goto_67
.end method


# virtual methods
.method public ensureProtocolCompliance(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 4
    .param p1, "request"    # Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->backendResponseMustNotHaveBody(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 72
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->consumeBody(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 73
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Lcz/msebera/android/httpclient/HttpResponse;->setEntity(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 76
    :cond_d
    invoke-direct {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->requestDidNotExpect100ContinueButResponseIsOne(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 78
    invoke-direct {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->transferEncodingIsNotReturnedTo1_0Client(Lcz/msebera/android/httpclient/client/methods/HttpRequestWrapper;Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 80
    invoke-direct {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->ensurePartialContentIsNotSentToAClientThatDidNotRequestIt(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 82
    invoke-direct {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->ensure200ForOPTIONSRequestWithNoBodyHasContentLengthZero(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 84
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->ensure206ContainsDateHeader(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 86
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->ensure304DoesNotContainExtraEntityHeaders(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 88
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->identityIsNotUsedInContentEncoding(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 90
    invoke-direct {p0, p2}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProtocolCompliance;->warningsWithNonMatchingWarnDatesAreRemoved(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 91
    return-void
.end method
