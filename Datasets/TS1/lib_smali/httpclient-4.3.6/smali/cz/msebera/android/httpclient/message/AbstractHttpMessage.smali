.class public abstract Lcz/msebera/android/httpclient/message/AbstractHttpMessage;
.super Ljava/lang/Object;
.source "AbstractHttpMessage.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpMessage;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field protected headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

.field protected params:Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;-><init>(Lcz/msebera/android/httpclient/params/HttpParams;)V

    .line 64
    return-void
.end method

.method protected constructor <init>(Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 3
    .param p1, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/message/HeaderGroup;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    .line 59
    iput-object p1, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 60
    return-void
.end method


# virtual methods
.method public addHeader(Lcz/msebera/android/httpclient/Header;)V
    .registers 3
    .param p1, "header"    # Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 93
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 94
    return-void
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 98
    const-string v0, "Header name"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 99
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    new-instance v1, Lcz/msebera/android/httpclient/message/BasicHeader;

    invoke-direct {v1, p1, p2}, Lcz/msebera/android/httpclient/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->addHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 100
    return-void
.end method

.method public containsHeader(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 68
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->containsHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getAllHeaders()[Lcz/msebera/android/httpclient/Header;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/message/HeaderGroup;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 78
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 73
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->getHeaders(Ljava/lang/String;)[Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public getLastHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 83
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->getLastHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    return-object v0
.end method

.method public getParams()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 151
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    if-nez v0, :cond_b

    .line 152
    new-instance v0, Lcz/msebera/android/httpclient/params/BasicHttpParams;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/params/BasicHttpParams;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 154
    :cond_b
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    return-object v0
.end method

.method public headerIterator()Lcz/msebera/android/httpclient/HeaderIterator;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/message/HeaderGroup;->iterator()Lcz/msebera/android/httpclient/HeaderIterator;

    move-result-object v0

    return-object v0
.end method

.method public headerIterator(Ljava/lang/String;)Lcz/msebera/android/httpclient/HeaderIterator;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 143
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->iterator(Ljava/lang/String;)Lcz/msebera/android/httpclient/HeaderIterator;

    move-result-object v0

    return-object v0
.end method

.method public removeHeader(Lcz/msebera/android/httpclient/Header;)V
    .registers 3
    .param p1, "header"    # Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 120
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->removeHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 121
    return-void
.end method

.method public removeHeaders(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 125
    if-nez p1, :cond_3

    .line 134
    :cond_2
    return-void

    .line 128
    :cond_3
    iget-object v2, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/message/HeaderGroup;->iterator()Lcz/msebera/android/httpclient/HeaderIterator;

    move-result-object v1

    .local v1, "i":Lcz/msebera/android/httpclient/HeaderIterator;
    :cond_9
    :goto_9
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 129
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderIterator;->nextHeader()Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 130
    .local v0, "header":Lcz/msebera/android/httpclient/Header;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 131
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderIterator;->remove()V

    goto :goto_9
.end method

.method public setHeader(Lcz/msebera/android/httpclient/Header;)V
    .registers 3
    .param p1, "header"    # Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 104
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->updateHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 105
    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 109
    const-string v0, "Header name"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 110
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    new-instance v1, Lcz/msebera/android/httpclient/message/BasicHeader;

    invoke-direct {v1, p1, p2}, Lcz/msebera/android/httpclient/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->updateHeader(Lcz/msebera/android/httpclient/Header;)V

    .line 111
    return-void
.end method

.method public setHeaders([Lcz/msebera/android/httpclient/Header;)V
    .registers 3
    .param p1, "headers"    # [Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 115
    iget-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->headergroup:Lcz/msebera/android/httpclient/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lcz/msebera/android/httpclient/message/HeaderGroup;->setHeaders([Lcz/msebera/android/httpclient/Header;)V

    .line 116
    return-void
.end method

.method public setParams(Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 3
    .param p1, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 162
    const-string v0, "HTTP parameters"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/params/HttpParams;

    iput-object v0, p0, Lcz/msebera/android/httpclient/message/AbstractHttpMessage;->params:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 163
    return-void
.end method
