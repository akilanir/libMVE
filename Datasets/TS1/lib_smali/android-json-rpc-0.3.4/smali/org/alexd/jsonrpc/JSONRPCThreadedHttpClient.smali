.class public Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;
.super Lorg/alexd/jsonrpc/JSONRPCThreadedClient;
.source "JSONRPCThreadedHttpClient.java"


# static fields
.field private static final PROTOCOL_VERSION:Lorg/apache/http/ProtocolVersion;


# instance fields
.field private httpClient:Lorg/apache/http/client/HttpClient;

.field private serviceUri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 39
    new-instance v0, Lorg/apache/http/ProtocolVersion;

    const-string v1, "HTTP"

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/ProtocolVersion;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;->PROTOCOL_VERSION:Lorg/apache/http/ProtocolVersion;

    .line 26
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 62
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;-><init>(Lorg/apache/http/client/HttpClient;Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/HttpClient;Ljava/lang/String;)V
    .registers 3
    .param p1, "cleint"    # Lorg/apache/http/client/HttpClient;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/alexd/jsonrpc/JSONRPCThreadedClient;-><init>()V

    .line 50
    iput-object p1, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 51
    iput-object p2, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;->serviceUri:Ljava/lang/String;

    .line 52
    return-void
.end method


# virtual methods
.method protected doJSONRequest(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 16
    .param p1, "jsonRequest"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/alexd/jsonrpc/JSONRPCException;
        }
    .end annotation

    .prologue
    .line 68
    iget-boolean v11, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;->_debug:Z

    if-eqz v11, :cond_20

    .line 69
    const-class v11, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;

    invoke-virtual {v11}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Request: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    :cond_20
    new-instance v6, Lorg/apache/http/client/methods/HttpPost;

    iget-object v11, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;->serviceUri:Ljava/lang/String;

    invoke-direct {v6, v11}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 73
    .local v6, "request":Lorg/apache/http/client/methods/HttpPost;
    new-instance v5, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v5}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 74
    .local v5, "params":Lorg/apache/http/params/HttpParams;
    invoke-virtual {p0}, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;->getConnectionTimeout()I

    move-result v11

    invoke-static {v5, v11}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 75
    invoke-virtual {p0}, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;->getSoTimeout()I

    move-result v11

    invoke-static {v5, v11}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 76
    sget-object v11, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;->PROTOCOL_VERSION:Lorg/apache/http/ProtocolVersion;

    invoke-static {v5, v11}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    .line 77
    invoke-virtual {v6, v5}, Lorg/apache/http/client/methods/HttpPost;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 82
    :try_start_42
    new-instance v2, Lorg/alexd/jsonrpc/JSONEntity;

    invoke-direct {v2, p1}, Lorg/alexd/jsonrpc/JSONEntity;-><init>(Lorg/json/JSONObject;)V
    :try_end_47
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_42 .. :try_end_47} :catch_b1

    .line 88
    .local v2, "entity":Lorg/apache/http/HttpEntity;
    invoke-virtual {v6, v2}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 93
    :try_start_4a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 94
    .local v9, "t":J
    iget-object v11, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v11, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 95
    .local v7, "response":Lorg/apache/http/HttpResponse;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    sub-long v9, v11, v9

    .line 96
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v11

    invoke-static {v11}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v8

    .line 98
    .local v8, "responseString":Ljava/lang/String;
    iget-boolean v11, p0, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;->_debug:Z

    if-eqz v11, :cond_7e

    .line 99
    const-class v11, Lorg/alexd/jsonrpc/JSONRPCThreadedHttpClient;

    invoke-virtual {v11}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Response: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    :cond_7e
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 103
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 105
    .local v4, "jsonResponse":Lorg/json/JSONObject;
    const-string v11, "error"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_cc

    .line 107
    const-string v11, "error"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 108
    .local v3, "jsonError":Ljava/lang/Object;
    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_cc

    .line 109
    new-instance v11, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v12, "error"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/Object;)V

    throw v11
    :try_end_a8
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_4a .. :try_end_a8} :catch_a8
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_a8} :catch_ba
    .catch Lorg/json/JSONException; {:try_start_4a .. :try_end_a8} :catch_c3

    .line 118
    .end local v3    # "jsonError":Ljava/lang/Object;
    .end local v4    # "jsonResponse":Lorg/json/JSONObject;
    .end local v7    # "response":Lorg/apache/http/HttpResponse;
    .end local v8    # "responseString":Ljava/lang/String;
    .end local v9    # "t":J
    :catch_a8
    move-exception v0

    .line 120
    .local v0, "e":Lorg/apache/http/client/ClientProtocolException;
    new-instance v11, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v12, "HTTP error"

    invoke-direct {v11, v12, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 84
    .end local v0    # "e":Lorg/apache/http/client/ClientProtocolException;
    .end local v2    # "entity":Lorg/apache/http/HttpEntity;
    :catch_b1
    move-exception v1

    .line 86
    .local v1, "e1":Ljava/io/UnsupportedEncodingException;
    new-instance v11, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v12, "Unsupported encoding"

    invoke-direct {v11, v12, v1}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 122
    .end local v1    # "e1":Ljava/io/UnsupportedEncodingException;
    .restart local v2    # "entity":Lorg/apache/http/HttpEntity;
    :catch_ba
    move-exception v0

    .line 124
    .local v0, "e":Ljava/io/IOException;
    new-instance v11, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v12, "IO error"

    invoke-direct {v11, v12, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 126
    .end local v0    # "e":Ljava/io/IOException;
    :catch_c3
    move-exception v0

    .line 128
    .local v0, "e":Lorg/json/JSONException;
    new-instance v11, Lorg/alexd/jsonrpc/JSONRPCException;

    const-string v12, "Invalid JSON response"

    invoke-direct {v11, v12, v0}, Lorg/alexd/jsonrpc/JSONRPCException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 114
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v4    # "jsonResponse":Lorg/json/JSONObject;
    .restart local v7    # "response":Lorg/apache/http/HttpResponse;
    .restart local v8    # "responseString":Ljava/lang/String;
    .restart local v9    # "t":J
    :cond_cc
    return-object v4
.end method
