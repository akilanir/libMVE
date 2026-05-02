.class public Lcz/msebera/android/httpclient/client/params/HttpClientParams;
.super Ljava/lang/Object;
.source "HttpClientParams.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method public static getConnectionManagerTimeout(Lcz/msebera/android/httpclient/params/HttpParams;)J
    .registers 4
    .param p0, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;

    .prologue
    .line 108
    const-string v1, "HTTP parameters"

    invoke-static {p0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 109
    const-string v1, "http.conn-manager.timeout"

    invoke-interface {p0, v1}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 110
    .local v0, "timeout":Ljava/lang/Long;
    if-eqz v0, :cond_14

    .line 111
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 113
    :goto_13
    return-wide v1

    :cond_14
    invoke-static {p0}, Lcz/msebera/android/httpclient/params/HttpConnectionParams;->getConnectionTimeout(Lcz/msebera/android/httpclient/params/HttpParams;)I

    move-result v1

    int-to-long v1, v1

    goto :goto_13
.end method

.method public static getCookiePolicy(Lcz/msebera/android/httpclient/params/HttpParams;)Ljava/lang/String;
    .registers 3
    .param p0, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;

    .prologue
    .line 74
    const-string v1, "HTTP parameters"

    invoke-static {p0, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 75
    const-string v1, "http.protocol.cookie-policy"

    .line 76
    invoke-interface {p0, v1}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 77
    .local v0, "cookiePolicy":Ljava/lang/String;
    if-nez v0, :cond_11

    .line 78
    const-string v0, "best-match"

    .line 80
    .end local v0    # "cookiePolicy":Ljava/lang/String;
    :cond_11
    return-object v0
.end method

.method public static isAuthenticating(Lcz/msebera/android/httpclient/params/HttpParams;)Z
    .registers 3
    .param p0, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;

    .prologue
    .line 62
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 63
    const-string v0, "http.protocol.handle-authentication"

    const/4 v1, 0x1

    .line 64
    invoke-interface {p0, v0, v1}, Lcz/msebera/android/httpclient/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isRedirecting(Lcz/msebera/android/httpclient/params/HttpParams;)Z
    .registers 3
    .param p0, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;

    .prologue
    .line 50
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 51
    const-string v0, "http.protocol.handle-redirects"

    const/4 v1, 0x1

    .line 52
    invoke-interface {p0, v0, v1}, Lcz/msebera/android/httpclient/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static setAuthenticating(Lcz/msebera/android/httpclient/params/HttpParams;Z)V
    .registers 3
    .param p0, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .param p1, "value"    # Z

    .prologue
    .line 68
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 69
    const-string v0, "http.protocol.handle-authentication"

    .line 70
    invoke-interface {p0, v0, p1}, Lcz/msebera/android/httpclient/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lcz/msebera/android/httpclient/params/HttpParams;

    .line 71
    return-void
.end method

.method public static setConnectionManagerTimeout(Lcz/msebera/android/httpclient/params/HttpParams;J)V
    .registers 4
    .param p0, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .param p1, "timeout"    # J

    .prologue
    .line 94
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 95
    const-string v0, "http.conn-manager.timeout"

    invoke-interface {p0, v0, p1, p2}, Lcz/msebera/android/httpclient/params/HttpParams;->setLongParameter(Ljava/lang/String;J)Lcz/msebera/android/httpclient/params/HttpParams;

    .line 96
    return-void
.end method

.method public static setCookiePolicy(Lcz/msebera/android/httpclient/params/HttpParams;Ljava/lang/String;)V
    .registers 3
    .param p0, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .param p1, "cookiePolicy"    # Ljava/lang/String;

    .prologue
    .line 84
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 85
    const-string v0, "http.protocol.cookie-policy"

    invoke-interface {p0, v0, p1}, Lcz/msebera/android/httpclient/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/params/HttpParams;

    .line 86
    return-void
.end method

.method public static setRedirecting(Lcz/msebera/android/httpclient/params/HttpParams;Z)V
    .registers 3
    .param p0, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .param p1, "value"    # Z

    .prologue
    .line 56
    const-string v0, "HTTP parameters"

    invoke-static {p0, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 57
    const-string v0, "http.protocol.handle-redirects"

    .line 58
    invoke-interface {p0, v0, p1}, Lcz/msebera/android/httpclient/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lcz/msebera/android/httpclient/params/HttpParams;

    .line 59
    return-void
.end method
