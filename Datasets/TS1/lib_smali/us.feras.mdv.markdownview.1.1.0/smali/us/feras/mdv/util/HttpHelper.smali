.class public Lus/feras/mdv/util/HttpHelper;
.super Ljava/lang/Object;
.source "HttpHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lus/feras/mdv/util/HttpHelper$Response;
    }
.end annotation


# static fields
.field private static final CHARSET_UTF8:Ljava/lang/String; = "UTF-8"

.field public static final CONTENT_TYPE_JSON:Ljava/lang/String; = "json"

.field public static final CONTENT_TYPE_XML:Ljava/lang/String; = "xml"

.field private static final DEFULT_CONNECT_TIMEOUT:I = 0x1388

.field private static final DEFULT_READ_TIMEOUT:I = 0x1388


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    return-void
.end method

.method private static closeSilently(Ljava/io/OutputStream;)V
    .registers 2
    .param p0, "output"    # Ljava/io/OutputStream;

    .prologue
    .line 118
    if-eqz p0, :cond_5

    .line 120
    :try_start_2
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 124
    :cond_5
    :goto_5
    return-void

    .line 121
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public static get(Ljava/lang/String;)Lus/feras/mdv/util/HttpHelper$Response;
    .registers 3
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x1388

    .line 38
    const/4 v0, 0x0

    invoke-static {p0, v0, v1, v1}, Lus/feras/mdv/util/HttpHelper;->get(Ljava/lang/String;Ljava/lang/String;II)Lus/feras/mdv/util/HttpHelper$Response;

    move-result-object v0

    return-object v0
.end method

.method public static get(Ljava/lang/String;Ljava/lang/String;)Lus/feras/mdv/util/HttpHelper$Response;
    .registers 3
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v0, 0x1388

    .line 33
    invoke-static {p0, p1, v0, v0}, Lus/feras/mdv/util/HttpHelper;->get(Ljava/lang/String;Ljava/lang/String;II)Lus/feras/mdv/util/HttpHelper$Response;

    move-result-object v0

    return-object v0
.end method

.method public static get(Ljava/lang/String;Ljava/lang/String;II)Lus/feras/mdv/util/HttpHelper$Response;
    .registers 8
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "connectTimeout"    # I
    .param p3, "readTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    move-object v1, p0

    .line 44
    .local v1, "fullUrl":Ljava/lang/String;
    if-eqz p1, :cond_22

    const-string v2, ""

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_22

    .line 45
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 47
    :cond_22
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 48
    .local v0, "connection":Ljava/net/URLConnection;
    invoke-virtual {v0, p3}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 49
    invoke-virtual {v0, p2}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 50
    const-string v2, "Accept-Charset"

    const-string v3, "UTF-8"

    invoke-virtual {v0, v2, v3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    check-cast v0, Ljava/net/HttpURLConnection;

    .end local v0    # "connection":Ljava/net/URLConnection;
    invoke-static {v0}, Lus/feras/mdv/util/HttpHelper;->getResponse(Ljava/net/HttpURLConnection;)Lus/feras/mdv/util/HttpHelper$Response;

    move-result-object v2

    return-object v2
.end method

.method private static getResponse(Ljava/net/HttpURLConnection;)Lus/feras/mdv/util/HttpHelper$Response;
    .registers 4
    .param p0, "connection"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 86
    .local v0, "inputStream":Ljava/io/InputStream;
    new-instance v1, Lus/feras/mdv/util/HttpHelper$Response;

    invoke-direct {v1}, Lus/feras/mdv/util/HttpHelper$Response;-><init>()V

    .line 87
    .local v1, "response":Lus/feras/mdv/util/HttpHelper$Response;
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    invoke-virtual {v1, v2}, Lus/feras/mdv/util/HttpHelper$Response;->setHttpResponseCode(I)V

    .line 88
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1, v2}, Lus/feras/mdv/util/HttpHelper$Response;->setHttpResponseHeader(Ljava/util/Set;)V

    .line 89
    invoke-static {v0, p0}, Lus/feras/mdv/util/HttpHelper;->getResponseMessage(Ljava/io/InputStream;Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lus/feras/mdv/util/HttpHelper$Response;->setResponseMessage(Ljava/lang/String;)V

    .line 90
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lus/feras/mdv/util/HttpHelper$Response;->setHttpResponseMessage(Ljava/lang/String;)V

    .line 91
    return-object v1
.end method

.method private static getResponseMessage(Ljava/io/InputStream;Ljava/net/HttpURLConnection;)Ljava/lang/String;
    .registers 7
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .param p1, "connection"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    const/4 v2, 0x0

    .line 101
    .local v2, "responseMessage":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 102
    .local v3, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 104
    .local v1, "dis":Ljava/io/InputStream;
    :goto_a
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .local v0, "chr":I
    const/4 v4, -0x1

    if-eq v0, v4, :cond_16

    .line 105
    int-to-char v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_a

    .line 107
    :cond_16
    if-eqz v3, :cond_1c

    .line 108
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 110
    :cond_1c
    return-object v2
.end method

.method public static post(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lus/feras/mdv/util/HttpHelper$Response;
    .registers 4
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "contentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v0, 0x1388

    .line 56
    invoke-static {p0, p1, p2, v0, v0}, Lus/feras/mdv/util/HttpHelper;->post(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)Lus/feras/mdv/util/HttpHelper$Response;

    move-result-object v0

    return-object v0
.end method

.method public static post(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)Lus/feras/mdv/util/HttpHelper$Response;
    .registers 10
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "connectTimeout"    # I
    .param p4, "readTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 64
    .local v0, "connection":Ljava/net/URLConnection;
    invoke-virtual {v0, p4}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 65
    invoke-virtual {v0, p3}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 66
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 67
    const-string v2, "Accept-Charset"

    const-string v3, "UTF-8"

    invoke-virtual {v0, v2, v3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    const-string v2, "Content-Type"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "application/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const/4 v1, 0x0

    .line 72
    .local v1, "output":Ljava/io/OutputStream;
    :try_start_33
    invoke-virtual {v0}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 73
    const-string v2, "UTF-8"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_40
    .catchall {:try_start_33 .. :try_end_40} :catchall_4a

    .line 75
    invoke-static {v1}, Lus/feras/mdv/util/HttpHelper;->closeSilently(Ljava/io/OutputStream;)V

    .line 77
    check-cast v0, Ljava/net/HttpURLConnection;

    .end local v0    # "connection":Ljava/net/URLConnection;
    invoke-static {v0}, Lus/feras/mdv/util/HttpHelper;->getResponse(Ljava/net/HttpURLConnection;)Lus/feras/mdv/util/HttpHelper$Response;

    move-result-object v2

    return-object v2

    .line 75
    .restart local v0    # "connection":Ljava/net/URLConnection;
    :catchall_4a
    move-exception v2

    invoke-static {v1}, Lus/feras/mdv/util/HttpHelper;->closeSilently(Ljava/io/OutputStream;)V

    throw v2
.end method
