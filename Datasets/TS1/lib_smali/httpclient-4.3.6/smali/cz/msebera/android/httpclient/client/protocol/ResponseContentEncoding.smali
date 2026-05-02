.class public Lcz/msebera/android/httpclient/client/protocol/ResponseContentEncoding;
.super Ljava/lang/Object;
.source "ResponseContentEncoding.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpResponseInterceptor;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final UNCOMPRESSED:Ljava/lang/String; = "http.client.response.uncompressed"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 13
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p2, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v4

    .line 78
    .local v4, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    if-eqz v4, :cond_59

    invoke-interface {v4}, Lcz/msebera/android/httpclient/HttpEntity;->getContentLength()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-eqz v6, :cond_59

    .line 79
    invoke-interface {v4}, Lcz/msebera/android/httpclient/HttpEntity;->getContentEncoding()Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 80
    .local v0, "ceheader":Lcz/msebera/android/httpclient/Header;
    if-eqz v0, :cond_59

    .line 81
    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getElements()[Lcz/msebera/android/httpclient/HeaderElement;

    move-result-object v3

    .line 82
    .local v3, "codecs":[Lcz/msebera/android/httpclient/HeaderElement;
    const/4 v5, 0x0

    .line 83
    .local v5, "uncompressed":Z
    array-length v6, v3

    const/4 v7, 0x0

    if-ge v7, v6, :cond_48

    aget-object v1, v3, v7

    .line 84
    .local v1, "codec":Lcz/msebera/android/httpclient/HeaderElement;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 85
    .local v2, "codecname":Ljava/lang/String;
    const-string v6, "gzip"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3b

    const-string v6, "x-gzip"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5a

    .line 86
    :cond_3b
    new-instance v6, Lcz/msebera/android/httpclient/client/entity/GzipDecompressingEntity;

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v7

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/client/entity/GzipDecompressingEntity;-><init>(Lcz/msebera/android/httpclient/HttpEntity;)V

    invoke-interface {p1, v6}, Lcz/msebera/android/httpclient/HttpResponse;->setEntity(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 87
    const/4 v5, 0x1

    .line 101
    .end local v1    # "codec":Lcz/msebera/android/httpclient/HeaderElement;
    .end local v2    # "codecname":Ljava/lang/String;
    :cond_48
    :goto_48
    if-eqz v5, :cond_59

    .line 102
    const-string v6, "Content-Length"

    invoke-interface {p1, v6}, Lcz/msebera/android/httpclient/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 103
    const-string v6, "Content-Encoding"

    invoke-interface {p1, v6}, Lcz/msebera/android/httpclient/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 104
    const-string v6, "Content-MD5"

    invoke-interface {p1, v6}, Lcz/msebera/android/httpclient/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 108
    .end local v0    # "ceheader":Lcz/msebera/android/httpclient/Header;
    .end local v3    # "codecs":[Lcz/msebera/android/httpclient/HeaderElement;
    .end local v5    # "uncompressed":Z
    :cond_59
    return-void

    .line 89
    .restart local v0    # "ceheader":Lcz/msebera/android/httpclient/Header;
    .restart local v1    # "codec":Lcz/msebera/android/httpclient/HeaderElement;
    .restart local v2    # "codecname":Ljava/lang/String;
    .restart local v3    # "codecs":[Lcz/msebera/android/httpclient/HeaderElement;
    .restart local v5    # "uncompressed":Z
    :cond_5a
    const-string v6, "deflate"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_70

    .line 90
    new-instance v6, Lcz/msebera/android/httpclient/client/entity/DeflateDecompressingEntity;

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v7

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/client/entity/DeflateDecompressingEntity;-><init>(Lcz/msebera/android/httpclient/HttpEntity;)V

    invoke-interface {p1, v6}, Lcz/msebera/android/httpclient/HttpResponse;->setEntity(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 91
    const/4 v5, 0x1

    .line 92
    goto :goto_48

    .line 93
    :cond_70
    const-string v6, "identity"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_59

    .line 98
    new-instance v6, Lcz/msebera/android/httpclient/HttpException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unsupported Content-Coding: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v1}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/HttpException;-><init>(Ljava/lang/String;)V

    throw v6
.end method
