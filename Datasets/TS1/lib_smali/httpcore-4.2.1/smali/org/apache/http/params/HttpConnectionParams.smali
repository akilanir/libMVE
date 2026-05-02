.class public final Lorg/apache/http/params/HttpConnectionParams;
.super Ljava/lang/Object;
.source "HttpConnectionParams.java"

# interfaces
.implements Lorg/apache/http/params/CoreConnectionPNames;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method public static getConnectionTimeout(Lorg/apache/http/params/HttpParams;)I
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 192
    if-nez p0, :cond_a

    .line 193
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 195
    :cond_a
    const-string v0, "http.connection.timeout"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getLinger(Lorg/apache/http/params/HttpParams;)I
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 165
    if-nez p0, :cond_a

    .line 166
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 168
    :cond_a
    const-string v0, "http.socket.linger"

    const/4 v1, -0x1

    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getSoKeepalive(Lorg/apache/http/params/HttpParams;)Z
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 254
    if-nez p0, :cond_a

    .line 255
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 257
    :cond_a
    const-string v0, "http.socket.keepalive"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getSoReuseaddr(Lorg/apache/http/params/HttpParams;)Z
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 79
    if-nez p0, :cond_a

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_a
    const-string v0, "http.socket.reuseaddr"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getSoTimeout(Lorg/apache/http/params/HttpParams;)I
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 49
    if-nez p0, :cond_a

    .line 50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_a
    const-string v0, "http.socket.timeout"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getSocketBufferSize(Lorg/apache/http/params/HttpParams;)I
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 136
    if-nez p0, :cond_a

    .line 137
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 139
    :cond_a
    const-string v0, "http.socket.buffer-size"

    const/4 v1, -0x1

    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getTcpNoDelay(Lorg/apache/http/params/HttpParams;)Z
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 108
    if-nez p0, :cond_a

    .line 109
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_a
    const-string v0, "http.tcp.nodelay"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isStaleCheckingEnabled(Lorg/apache/http/params/HttpParams;)Z
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 222
    if-nez p0, :cond_a

    .line 223
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 225
    :cond_a
    const-string v0, "http.connection.stalecheck"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "timeout"    # I

    .prologue
    .line 207
    if-nez p0, :cond_a

    .line 208
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 210
    :cond_a
    const-string v0, "http.connection.timeout"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    .line 212
    return-void
.end method

.method public static setLinger(Lorg/apache/http/params/HttpParams;I)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "value"    # I

    .prologue
    .line 178
    if-nez p0, :cond_a

    .line 179
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 181
    :cond_a
    const-string v0, "http.socket.linger"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    .line 182
    return-void
.end method

.method public static setSoKeepalive(Lorg/apache/http/params/HttpParams;Z)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "enableKeepalive"    # Z

    .prologue
    .line 269
    if-nez p0, :cond_a

    .line 270
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 272
    :cond_a
    const-string v0, "http.socket.keepalive"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 273
    return-void
.end method

.method public static setSoReuseaddr(Lorg/apache/http/params/HttpParams;Z)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "reuseaddr"    # Z

    .prologue
    .line 94
    if-nez p0, :cond_a

    .line 95
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :cond_a
    const-string v0, "http.socket.reuseaddr"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 98
    return-void
.end method

.method public static setSoTimeout(Lorg/apache/http/params/HttpParams;I)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "timeout"    # I

    .prologue
    .line 62
    if-nez p0, :cond_a

    .line 63
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_a
    const-string v0, "http.socket.timeout"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    .line 67
    return-void
.end method

.method public static setSocketBufferSize(Lorg/apache/http/params/HttpParams;I)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "size"    # I

    .prologue
    .line 151
    if-nez p0, :cond_a

    .line 152
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 154
    :cond_a
    const-string v0, "http.socket.buffer-size"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    .line 155
    return-void
.end method

.method public static setStaleCheckingEnabled(Lorg/apache/http/params/HttpParams;Z)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "value"    # Z

    .prologue
    .line 237
    if-nez p0, :cond_a

    .line 238
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 240
    :cond_a
    const-string v0, "http.connection.stalecheck"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 242
    return-void
.end method

.method public static setTcpNoDelay(Lorg/apache/http/params/HttpParams;Z)V
    .registers 4
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "value"    # Z

    .prologue
    .line 122
    if-nez p0, :cond_a

    .line 123
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP parameters may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_a
    const-string v0, "http.tcp.nodelay"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 126
    return-void
.end method
