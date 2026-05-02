.class Lorg/alexd/jsonrpc/JSONEntity;
.super Lorg/apache/http/entity/StringEntity;
.source "JSONEntity.java"


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .registers 3
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 23
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    .line 24
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 4
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    invoke-virtual {p0, p2}, Lorg/alexd/jsonrpc/JSONEntity;->setContentEncoding(Ljava/lang/String;)V

    .line 36
    return-void
.end method


# virtual methods
.method public getContentType()Lorg/apache/http/Header;
    .registers 4

    .prologue
    .line 41
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    const-string v1, "Content-Type"

    const-string v2, "application/json"

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
