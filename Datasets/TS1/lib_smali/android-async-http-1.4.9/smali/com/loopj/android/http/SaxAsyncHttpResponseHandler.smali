.class public abstract Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;
.super Lcom/loopj/android/http/AsyncHttpResponseHandler;
.source "SaxAsyncHttpResponseHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/xml/sax/helpers/DefaultHandler;",
        ">",
        "Lcom/loopj/android/http/AsyncHttpResponseHandler;"
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "SaxAsyncHttpRH"


# instance fields
.field private handler:Lorg/xml/sax/helpers/DefaultHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/xml/sax/helpers/DefaultHandler;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;, "Lcom/loopj/android/http/SaxAsyncHttpResponseHandler<TT;>;"
    .local p1, "t":Lorg/xml/sax/helpers/DefaultHandler;, "TT;"
    invoke-direct {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;->handler:Lorg/xml/sax/helpers/DefaultHandler;

    .line 76
    if-nez p1, :cond_10

    .line 77
    new-instance v0, Ljava/lang/Error;

    const-string v1, "null instance of <T extends DefaultHandler> passed to constructor"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_10
    iput-object p1, p0, Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;->handler:Lorg/xml/sax/helpers/DefaultHandler;

    .line 80
    return-void
.end method


# virtual methods
.method protected getResponseData(Lcz/msebera/android/httpclient/HttpEntity;)[B
    .registers 12
    .param p1, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "this":Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;, "Lcom/loopj/android/http/SaxAsyncHttpResponseHandler<TT;>;"
    if-eqz p1, :cond_33

    .line 93
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v3

    .line 94
    .local v3, "instream":Ljava/io/InputStream;
    const/4 v1, 0x0

    .line 95
    .local v1, "inputStreamReader":Ljava/io/InputStreamReader;
    if-eqz v3, :cond_33

    .line 97
    :try_start_9
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v5

    .line 98
    .local v5, "sfactory":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v5}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v6

    .line 99
    .local v6, "sparser":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v6}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v4

    .line 100
    .local v4, "rssReader":Lorg/xml/sax/XMLReader;
    iget-object v7, p0, Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;->handler:Lorg/xml/sax/helpers/DefaultHandler;

    invoke-interface {v4, v7}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 101
    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;->getCharset()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v3, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_23
    .catch Lorg/xml/sax/SAXException; {:try_start_9 .. :try_end_23} :catch_35
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_9 .. :try_end_23} :catch_4a
    .catchall {:try_start_9 .. :try_end_23} :catchall_5f

    .line 102
    .end local v1    # "inputStreamReader":Ljava/io/InputStreamReader;
    .local v2, "inputStreamReader":Ljava/io/InputStreamReader;
    :try_start_23
    new-instance v7, Lorg/xml/sax/InputSource;

    invoke-direct {v7, v2}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface {v4, v7}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_2b
    .catch Lorg/xml/sax/SAXException; {:try_start_23 .. :try_end_2b} :catch_73
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_23 .. :try_end_2b} :catch_70
    .catchall {:try_start_23 .. :try_end_2b} :catchall_6d

    .line 108
    invoke-static {v3}, Lcom/loopj/android/http/AsyncHttpClient;->silentCloseInputStream(Ljava/io/InputStream;)V

    .line 109
    if-eqz v2, :cond_33

    .line 111
    :try_start_30
    invoke-virtual {v2}, Ljava/io/InputStreamReader;->close()V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_33} :catch_69

    .line 117
    .end local v2    # "inputStreamReader":Ljava/io/InputStreamReader;
    .end local v3    # "instream":Ljava/io/InputStream;
    .end local v4    # "rssReader":Lorg/xml/sax/XMLReader;
    .end local v5    # "sfactory":Ljavax/xml/parsers/SAXParserFactory;
    .end local v6    # "sparser":Ljavax/xml/parsers/SAXParser;
    :cond_33
    :goto_33
    const/4 v7, 0x0

    return-object v7

    .line 103
    .restart local v1    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v3    # "instream":Ljava/io/InputStream;
    :catch_35
    move-exception v0

    .line 104
    .local v0, "e":Lorg/xml/sax/SAXException;
    :goto_36
    :try_start_36
    sget-object v7, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v8, "SaxAsyncHttpRH"

    const-string v9, "getResponseData exception"

    invoke-interface {v7, v8, v9, v0}, Lcom/loopj/android/http/LogInterface;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3f
    .catchall {:try_start_36 .. :try_end_3f} :catchall_5f

    .line 108
    invoke-static {v3}, Lcom/loopj/android/http/AsyncHttpClient;->silentCloseInputStream(Ljava/io/InputStream;)V

    .line 109
    if-eqz v1, :cond_33

    .line 111
    :try_start_44
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_44 .. :try_end_47} :catch_48

    goto :goto_33

    .line 112
    :catch_48
    move-exception v7

    goto :goto_33

    .line 105
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    :catch_4a
    move-exception v0

    .line 106
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    :goto_4b
    :try_start_4b
    sget-object v7, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v8, "SaxAsyncHttpRH"

    const-string v9, "getResponseData exception"

    invoke-interface {v7, v8, v9, v0}, Lcom/loopj/android/http/LogInterface;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_54
    .catchall {:try_start_4b .. :try_end_54} :catchall_5f

    .line 108
    invoke-static {v3}, Lcom/loopj/android/http/AsyncHttpClient;->silentCloseInputStream(Ljava/io/InputStream;)V

    .line 109
    if-eqz v1, :cond_33

    .line 111
    :try_start_59
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V
    :try_end_5c
    .catch Ljava/io/IOException; {:try_start_59 .. :try_end_5c} :catch_5d

    goto :goto_33

    .line 112
    :catch_5d
    move-exception v7

    goto :goto_33

    .line 108
    .end local v0    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    :catchall_5f
    move-exception v7

    :goto_60
    invoke-static {v3}, Lcom/loopj/android/http/AsyncHttpClient;->silentCloseInputStream(Ljava/io/InputStream;)V

    .line 109
    if-eqz v1, :cond_68

    .line 111
    :try_start_65
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V
    :try_end_68
    .catch Ljava/io/IOException; {:try_start_65 .. :try_end_68} :catch_6b

    .line 112
    :cond_68
    :goto_68
    throw v7

    .end local v1    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v2    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v4    # "rssReader":Lorg/xml/sax/XMLReader;
    .restart local v5    # "sfactory":Ljavax/xml/parsers/SAXParserFactory;
    .restart local v6    # "sparser":Ljavax/xml/parsers/SAXParser;
    :catch_69
    move-exception v7

    goto :goto_33

    .end local v2    # "inputStreamReader":Ljava/io/InputStreamReader;
    .end local v4    # "rssReader":Lorg/xml/sax/XMLReader;
    .end local v5    # "sfactory":Ljavax/xml/parsers/SAXParserFactory;
    .end local v6    # "sparser":Ljavax/xml/parsers/SAXParser;
    .restart local v1    # "inputStreamReader":Ljava/io/InputStreamReader;
    :catch_6b
    move-exception v8

    goto :goto_68

    .line 108
    .end local v1    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v2    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v4    # "rssReader":Lorg/xml/sax/XMLReader;
    .restart local v5    # "sfactory":Ljavax/xml/parsers/SAXParserFactory;
    .restart local v6    # "sparser":Ljavax/xml/parsers/SAXParser;
    :catchall_6d
    move-exception v7

    move-object v1, v2

    .end local v2    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v1    # "inputStreamReader":Ljava/io/InputStreamReader;
    goto :goto_60

    .line 105
    .end local v1    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v2    # "inputStreamReader":Ljava/io/InputStreamReader;
    :catch_70
    move-exception v0

    move-object v1, v2

    .end local v2    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v1    # "inputStreamReader":Ljava/io/InputStreamReader;
    goto :goto_4b

    .line 103
    .end local v1    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v2    # "inputStreamReader":Ljava/io/InputStreamReader;
    :catch_73
    move-exception v0

    move-object v1, v2

    .end local v2    # "inputStreamReader":Ljava/io/InputStreamReader;
    .restart local v1    # "inputStreamReader":Ljava/io/InputStreamReader;
    goto :goto_36
.end method

.method public abstract onFailure(I[Lcz/msebera/android/httpclient/Header;Lorg/xml/sax/helpers/DefaultHandler;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[",
            "Lcz/msebera/android/httpclient/Header;",
            "TT;)V"
        }
    .end annotation
.end method

.method public onFailure(I[Lcz/msebera/android/httpclient/Header;[BLjava/lang/Throwable;)V
    .registers 6
    .param p1, "statusCode"    # I
    .param p2, "headers"    # [Lcz/msebera/android/httpclient/Header;
    .param p3, "responseBody"    # [B
    .param p4, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 146
    .local p0, "this":Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;, "Lcom/loopj/android/http/SaxAsyncHttpResponseHandler<TT;>;"
    iget-object v0, p0, Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;->handler:Lorg/xml/sax/helpers/DefaultHandler;

    invoke-virtual {p0, p1, p2, v0}, Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;->onFailure(I[Lcz/msebera/android/httpclient/Header;Lorg/xml/sax/helpers/DefaultHandler;)V

    .line 147
    return-void
.end method

.method public abstract onSuccess(I[Lcz/msebera/android/httpclient/Header;Lorg/xml/sax/helpers/DefaultHandler;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[",
            "Lcz/msebera/android/httpclient/Header;",
            "TT;)V"
        }
    .end annotation
.end method

.method public onSuccess(I[Lcz/msebera/android/httpclient/Header;[B)V
    .registers 5
    .param p1, "statusCode"    # I
    .param p2, "headers"    # [Lcz/msebera/android/httpclient/Header;
    .param p3, "responseBody"    # [B

    .prologue
    .line 131
    .local p0, "this":Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;, "Lcom/loopj/android/http/SaxAsyncHttpResponseHandler<TT;>;"
    iget-object v0, p0, Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;->handler:Lorg/xml/sax/helpers/DefaultHandler;

    invoke-virtual {p0, p1, p2, v0}, Lcom/loopj/android/http/SaxAsyncHttpResponseHandler;->onSuccess(I[Lcz/msebera/android/httpclient/Header;Lorg/xml/sax/helpers/DefaultHandler;)V

    .line 132
    return-void
.end method
