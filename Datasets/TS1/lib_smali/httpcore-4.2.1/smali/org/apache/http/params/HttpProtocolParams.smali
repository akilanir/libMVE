.class public final Lorg/apache/http/params/HttpProtocolParams;
.super Ljava/lang/Object;
.source "HttpProtocolParams.java"

# interfaces
.implements Lorg/apache/http/params/CoreProtocolPNames;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method public static getContentCharset(Lorg/apache/http/params/HttpParams;)Ljava/lang/String;
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 89
    if-nez p0, :cond_a

    .line 90
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "HTTP parameters may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 92
    :cond_a
    const-string v1, "http.protocol.content-charset"

    invoke-interface {p0, v1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 94
    .local v0, "charset":Ljava/lang/String;
    if-nez v0, :cond_1a

    .line 95
    sget-object v1, Lorg/apache/http/protocol/HTTP;->DEF_CONTENT_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    .line 97
    :cond_1a
    return-object v0
.end method

.method public static getHttpElementCharset(Lorg/apache/http/params/HttpParams;)Ljava/lang/String;
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 57
    if-nez p0, :cond_a

    .line 58
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "HTTP parameters may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 60
    :cond_a
    const-string v1, "http.protocol.element-charset"

    invoke-interface {p0, v1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 62
    .local v0, "charset":Ljava/lang/String;
    if-nez v0, :cond_1a

    .line 63
    sget-object v1, Lorg/apache/http/protocol/HTTP;->DEF_PROTOCOL_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    .line 65
    :cond_1a
    return-object v0
.end method

.method public static getMalformedInputAction(Lorg/apache/http/params/HttpParams;)Ljava/nio/charset/CodingErrorAction;
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 208
    if-nez p0, :cond_a

    .line 209
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "HTTP parameters may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 211
    :cond_a
    const-string v1, "http.malformed.input.action"

    invoke-interface {p0, v1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 212
    .local v0, "param":Ljava/lang/Object;
    if-nez v0, :cond_15

    .line 214
    sget-object v0, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    .line 216
    .end local v0    # "param":Ljava/lang/Object;
    :goto_14
    return-object v0

    .restart local v0    # "param":Ljava/lang/Object;
    :cond_15
    check-cast v0, Ljava/nio/charset/CodingErrorAction;

    goto :goto_14
.end method

.method public static getUnmappableInputAction(Lorg/apache/http/params/HttpParams;)Ljava/nio/charset/CodingErrorAction;
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 241
    if-nez p0, :cond_a

    .line 242
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "HTTP parameters may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 244
    :cond_a
    const-string v1, "http.unmappable.input.action"

    invoke-interface {p0, v1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 245
    .local v0, "param":Ljava/lang/Object;
    if-nez v0, :cond_15

    .line 247
    sget-object v0, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    .line 249
    .end local v0    # "param":Ljava/lang/Object;
    :goto_14
    return-object v0

    .restart local v0    # "param":Ljava/lang/Object;
    :cond_15
    check-cast v0, Ljava/nio/charset/CodingErrorAction;

    goto :goto_14
.end method

.method public static getUserAgent(Lorg/apache/http/params/HttpParams;)Ljava/lang/String;
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 153
    if-nez p0, :cond_a

    .line 154
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_a
    const-string v0, "http.useragent"

    invoke-interface {p0, v0}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getVersion(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/ProtocolVersion;
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 121
    if-nez p0, :cond_a

    .line 122
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "HTTP parameters may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 124
    :cond_a
    const-string v1, "http.protocol.version"

    invoke-interface {p0, v1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 126
    .local v0, "param":Ljava/lang/Object;
    if-nez v0, :cond_15

    .line 127
    sget-object v0, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    .line 129
    .end local v0    # "param":Ljava/lang/Object;
    :goto_14
    return-object v0

    .restart local v0    # "param":Ljava/lang/Object;
    :cond_15
    check-cast v0, Lorg/apache/http/ProtocolVersion;

    goto :goto_14
.end method

.method public static setContentCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 107
    if-nez p0, :cond_a

    .line 108
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 110
    :cond_a
    const-string v0, "http.protocol.content-charset"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 111
    return-void
.end method

.method public static setHttpElementCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 75
    if-nez p0, :cond_a

    .line 76
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_a
    const-string v0, "http.protocol.element-charset"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 79
    return-void
.end method

.method public static setMalformedInputAction(Lorg/apache/http/params/HttpParams;Ljava/nio/charset/CodingErrorAction;)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "action"    # Ljava/nio/charset/CodingErrorAction;

    .prologue
    .line 227
    if-nez p0, :cond_a

    .line 228
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 230
    :cond_a
    const-string v0, "http.malformed.input.action"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 231
    return-void
.end method

.method public static setUnmappableInputAction(Lorg/apache/http/params/HttpParams;Ljava/nio/charset/CodingErrorAction;)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "action"    # Ljava/nio/charset/CodingErrorAction;

    .prologue
    .line 260
    if-nez p0, :cond_a

    .line 261
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may no be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 263
    :cond_a
    const-string v0, "http.unmappable.input.action"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 264
    return-void
.end method

.method public static setUseExpectContinue(Lorg/apache/http/params/HttpParams;Z)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "b"    # Z

    .prologue
    .line 194
    if-nez p0, :cond_a

    .line 195
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 197
    :cond_a
    const-string v0, "http.protocol.expect-continue"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 198
    return-void
.end method

.method public static setUserAgent(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "useragent"    # Ljava/lang/String;

    .prologue
    .line 166
    if-nez p0, :cond_a

    .line 167
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_a
    const-string v0, "http.useragent"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 170
    return-void
.end method

.method public static setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "version"    # Lorg/apache/http/ProtocolVersion;

    .prologue
    .line 139
    if-nez p0, :cond_a

    .line 140
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :cond_a
    const-string v0, "http.protocol.version"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 143
    return-void
.end method

.method public static useExpectContinue(Lorg/apache/http/params/HttpParams;)Z
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 180
    if-nez p0, :cond_a

    .line 181
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 183
    :cond_a
    const-string v0, "http.protocol.expect-continue"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
