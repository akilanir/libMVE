.class final Lorg/osmdroid/contributor/GpxToPHPUploader$1;
.super Ljava/lang/Object;
.source "GpxToPHPUploader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/osmdroid/contributor/GpxToPHPUploader;->uploadAsync(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$recordedGeoPoints:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;)V
    .registers 2

    .prologue
    .line 36
    iput-object p1, p0, Lorg/osmdroid/contributor/GpxToPHPUploader$1;->val$recordedGeoPoints:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 16

    .prologue
    .line 40
    :try_start_0
    iget-object v10, p0, Lorg/osmdroid/contributor/GpxToPHPUploader$1;->val$recordedGeoPoints:Ljava/util/ArrayList;

    invoke-static {v10}, Lorg/osmdroid/contributor/util/Util;->isSufficienDataForUpload(Ljava/util/ArrayList;)Z

    move-result v10

    if-nez v10, :cond_9

    .line 79
    :goto_8
    return-void

    .line 43
    :cond_9
    new-instance v1, Ljava/io/ByteArrayInputStream;

    iget-object v10, p0, Lorg/osmdroid/contributor/GpxToPHPUploader$1;->val$recordedGeoPoints:Ljava/util/ArrayList;

    invoke-static {v10}, Lorg/osmdroid/contributor/util/RecordedRouteGPXFormatter;->create(Ljava/util/List;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v10

    invoke-direct {v1, v10}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 45
    .local v1, "gpxInputStream":Ljava/io/InputStream;
    invoke-static {}, Lorg/osmdroid/http/HttpClientFactory;->createHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v2

    .line 47
    .local v2, "httpClient":Lorg/apache/http/client/HttpClient;
    new-instance v5, Lorg/apache/http/client/methods/HttpPost;

    const-string v10, "http://www.PLACEYOURDOMAINHERE.com/anyfolder/gpxuploader/upload.php"

    invoke-direct {v5, v10}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 50
    .local v5, "request":Lorg/apache/http/client/methods/HttpPost;
    new-instance v6, Lorg/apache/http/entity/mime/MultipartEntity;

    invoke-direct {v6}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>()V

    .line 51
    .local v6, "requestEntity":Lorg/apache/http/entity/mime/MultipartEntity;
    const-string v10, "gpxfile"

    new-instance v11, Lorg/apache/http/entity/mime/content/InputStreamBody;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, ""

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ".gpx"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v1, v12}, Lorg/apache/http/entity/mime/content/InputStreamBody;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-virtual {v6, v10, v11}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 54
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v10

    const-string v11, "http.protocol.expect-continue"

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 57
    invoke-virtual {v5, v6}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 59
    invoke-interface {v2, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 60
    .local v7, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v10

    invoke-interface {v10}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v9

    .line 62
    .local v9, "status":I
    const/16 v10, 0xc8

    if-eq v9, v10, :cond_7a

    .line 63
    # getter for: Lorg/osmdroid/contributor/GpxToPHPUploader;->logger:Lorg/slf4j/Logger;
    invoke-static {}, Lorg/osmdroid/contributor/GpxToPHPUploader;->access$000()Lorg/slf4j/Logger;

    move-result-object v10

    const-string v11, "GPXUploader"

    const-string v12, "status != HttpStatus.SC_OK"

    invoke-interface {v10, v11, v12}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_8

    .line 76
    .end local v1    # "gpxInputStream":Ljava/io/InputStream;
    .end local v2    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v5    # "request":Lorg/apache/http/client/methods/HttpPost;
    .end local v6    # "requestEntity":Lorg/apache/http/entity/mime/MultipartEntity;
    .end local v7    # "response":Lorg/apache/http/HttpResponse;
    .end local v9    # "status":I
    :catch_78
    move-exception v10

    goto :goto_8

    .line 65
    .restart local v1    # "gpxInputStream":Ljava/io/InputStream;
    .restart local v2    # "httpClient":Lorg/apache/http/client/HttpClient;
    .restart local v5    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v6    # "requestEntity":Lorg/apache/http/entity/mime/MultipartEntity;
    .restart local v7    # "response":Lorg/apache/http/HttpResponse;
    .restart local v9    # "status":I
    :cond_7a
    new-instance v3, Ljava/io/InputStreamReader;

    new-instance v10, Ljava/io/BufferedInputStream;

    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 68
    .local v3, "r":Ljava/io/Reader;
    const/16 v10, 0x2000

    new-array v0, v10, [C

    .line 70
    .local v0, "buf":[C
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .local v8, "sb":Ljava/lang/StringBuilder;
    :goto_95
    invoke-virtual {v3, v0}, Ljava/io/Reader;->read([C)I

    move-result v4

    .local v4, "read":I
    const/4 v10, -0x1

    if-eq v4, v10, :cond_a1

    .line 72
    const/4 v10, 0x0

    invoke-virtual {v8, v0, v10, v4}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_95

    .line 74
    :cond_a1
    # getter for: Lorg/osmdroid/contributor/GpxToPHPUploader;->logger:Lorg/slf4j/Logger;
    invoke-static {}, Lorg/osmdroid/contributor/GpxToPHPUploader;->access$000()Lorg/slf4j/Logger;

    move-result-object v10

    const-string v11, "GPXUploader"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Response: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v10, v11, v12}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_c1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c1} :catch_78

    goto/16 :goto_8
.end method
