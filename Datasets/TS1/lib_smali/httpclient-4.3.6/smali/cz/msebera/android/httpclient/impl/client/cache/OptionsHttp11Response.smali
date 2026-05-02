.class final Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;
.super Lcz/msebera/android/httpclient/message/AbstractHttpMessage;
.source "OptionsHttp11Response.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpResponse;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final statusLine:Lcz/msebera/android/httpclient/StatusLine;

.field private final version:Lcz/msebera/android/httpclient/ProtocolVersion;


# direct methods
.method constructor <init>()V
    .registers 5

    .prologue
    .line 50
    invoke-direct {p0}, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;-><init>()V

    .line 52
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicStatusLine;

    sget-object v1, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    const/16 v2, 0x1f5

    const-string v3, ""

    invoke-direct {v0, v1, v2, v3}, Lcz/msebera/android/httpclient/message/BasicStatusLine;-><init>(Lcz/msebera/android/httpclient/ProtocolVersion;ILjava/lang/String;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->statusLine:Lcz/msebera/android/httpclient/StatusLine;

    .line 54
    sget-object v0, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_1:Lcz/msebera/android/httpclient/HttpVersion;

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    return-void
.end method


# virtual methods
.method public addHeader(Lcz/msebera/android/httpclient/Header;)V
    .registers 2
    .param p1, "header"    # Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 128
    return-void
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 133
    return-void
.end method

.method public containsHeader(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 102
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->containsHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getAllHeaders()[Lcz/msebera/android/httpclient/Header;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/message/HeaderGroup;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public getEntity()Lcz/msebera/android/httpclient/HttpEntity;
    .registers 2

    .prologue
    .line 81
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 112
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 107
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public getLastHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 117
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->getLastHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public getLocale()Ljava/util/Locale;
    .registers 2

    .prologue
    .line 89
    const/4 v0, 0x0

    return-object v0
.end method

.method public getParams()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 2

    .prologue
    .line 172
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    if-nez v0, :cond_b

    .line 173
    new-instance v0, Lcz/msebera/android/httpclient/params/BasicHttpParams;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/params/BasicHttpParams;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 175
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    return-object v0
.end method

.method public getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->version:Lcz/msebera/android/httpclient/ProtocolVersion;

    return-object v0
.end method

.method public getStatusLine()Lcz/msebera/android/httpclient/StatusLine;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->statusLine:Lcz/msebera/android/httpclient/StatusLine;

    return-object v0
.end method

.method public headerIterator()Lcz/msebera/android/httpclient/HeaderIterator;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/message/HeaderGroup;->iterator()Lcz/msebera/android/httpclient/HeaderIterator;

    move-result-object v0

    return-object v0
.end method

.method public headerIterator(Ljava/lang/String;)Lcz/msebera/android/httpclient/HeaderIterator;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 167
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/OptionsHttp11Response;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->iterator(Ljava/lang/String;)Lcz/msebera/android/httpclient/HeaderIterator;

    move-result-object v0

    return-object v0
.end method

.method public removeHeader(Lcz/msebera/android/httpclient/Header;)V
    .registers 2
    .param p1, "header"    # Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 153
    return-void
.end method

.method public removeHeaders(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 158
    return-void
.end method

.method public setEntity(Lcz/msebera/android/httpclient/HttpEntity;)V
    .registers 2
    .param p1, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;

    .prologue
    .line 86
    return-void
.end method

.method public setHeader(Lcz/msebera/android/httpclient/Header;)V
    .registers 2
    .param p1, "header"    # Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 138
    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 143
    return-void
.end method

.method public setHeaders([Lcz/msebera/android/httpclient/Header;)V
    .registers 2
    .param p1, "headers"    # [Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 148
    return-void
.end method

.method public setLocale(Ljava/util/Locale;)V
    .registers 2
    .param p1, "loc"    # Ljava/util/Locale;

    .prologue
    .line 94
    return-void
.end method

.method public setParams(Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 2
    .param p1, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;

    .prologue
    .line 181
    return-void
.end method

.method public setReasonPhrase(Ljava/lang/String;)V
    .registers 2
    .param p1, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 78
    return-void
.end method

.method public setStatusCode(I)V
    .registers 2
    .param p1, "code"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 74
    return-void
.end method

.method public setStatusLine(Lcz/msebera/android/httpclient/ProtocolVersion;I)V
    .registers 3
    .param p1, "ver"    # Lcz/msebera/android/httpclient/ProtocolVersion;
    .param p2, "code"    # I

    .prologue
    .line 66
    return-void
.end method

.method public setStatusLine(Lcz/msebera/android/httpclient/ProtocolVersion;ILjava/lang/String;)V
    .registers 4
    .param p1, "ver"    # Lcz/msebera/android/httpclient/ProtocolVersion;
    .param p2, "code"    # I
    .param p3, "reason"    # Ljava/lang/String;

    .prologue
    .line 70
    return-void
.end method

.method public setStatusLine(Lcz/msebera/android/httpclient/StatusLine;)V
    .registers 2
    .param p1, "statusline"    # Lcz/msebera/android/httpclient/StatusLine;

    .prologue
    .line 62
    return-void
.end method
