.class final Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;
.super Lcom/squareup/okhttp/RequestBody;
.source "MultipartBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/MultipartBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MultipartRequestBody"
.end annotation


# instance fields
.field private final boundary:Lokio/ByteString;

.field private final contentType:Lcom/squareup/okhttp/MediaType;

.field private final partBodies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/RequestBody;",
            ">;"
        }
    .end annotation
.end field

.field private final partHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Headers;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/MediaType;Lokio/ByteString;Ljava/util/List;Ljava/util/List;)V
    .registers 7
    .param p1, "type"    # Lcom/squareup/okhttp/MediaType;
    .param p2, "boundary"    # Lokio/ByteString;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/squareup/okhttp/MediaType;",
            "Lokio/ByteString;",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Headers;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/RequestBody;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 202
    .local p3, "partHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Headers;>;"
    .local p4, "partBodies":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/RequestBody;>;"
    invoke-direct {p0}, Lcom/squareup/okhttp/RequestBody;-><init>()V

    .line 203
    if-nez p1, :cond_d

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "type == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 205
    :cond_d
    iput-object p2, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->boundary:Lokio/ByteString;

    .line 206
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; boundary="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lokio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/squareup/okhttp/MediaType;->parse(Ljava/lang/String;)Lcom/squareup/okhttp/MediaType;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->contentType:Lcom/squareup/okhttp/MediaType;

    .line 207
    invoke-static {p3}, Lcom/squareup/okhttp/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partHeaders:Ljava/util/List;

    .line 208
    invoke-static {p4}, Lcom/squareup/okhttp/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partBodies:Ljava/util/List;

    .line 209
    return-void
.end method


# virtual methods
.method public contentLength()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 216
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public contentType()Lcom/squareup/okhttp/MediaType;
    .registers 2

    .prologue
    .line 212
    iget-object v0, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->contentType:Lcom/squareup/okhttp/MediaType;

    return-object v0
.end method

.method public writeTo(Lokio/BufferedSink;)V
    .registers 13
    .param p1, "sink"    # Lokio/BufferedSink;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    const/4 v7, 0x0

    .local v7, "p":I
    iget-object v9, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partHeaders:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v8

    .local v8, "partCount":I
    :goto_7
    if-ge v7, v8, :cond_ae

    .line 221
    iget-object v9, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partHeaders:Ljava/util/List;

    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/squareup/okhttp/Headers;

    .line 222
    .local v6, "headers":Lcom/squareup/okhttp/Headers;
    iget-object v9, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partBodies:Ljava/util/List;

    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/RequestBody;

    .line 224
    .local v0, "body":Lcom/squareup/okhttp/RequestBody;
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->DASHDASH:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$000()[B

    move-result-object v9

    invoke-interface {p1, v9}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 225
    iget-object v9, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->boundary:Lokio/ByteString;

    invoke-interface {p1, v9}, Lokio/BufferedSink;->write(Lokio/ByteString;)Lokio/BufferedSink;

    .line 226
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v9

    invoke-interface {p1, v9}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 228
    if-eqz v6, :cond_57

    .line 229
    const/4 v4, 0x0

    .local v4, "h":I
    invoke-virtual {v6}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v5

    .local v5, "headerCount":I
    :goto_33
    if-ge v4, v5, :cond_57

    .line 230
    invoke-virtual {v6, v4}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {p1, v9}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v9

    .line 231
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->COLONSPACE:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$200()[B

    move-result-object v10

    invoke-interface {v9, v10}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    move-result-object v9

    .line 232
    invoke-virtual {v6, v4}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v9

    .line 233
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v10

    invoke-interface {v9, v10}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 229
    add-int/lit8 v4, v4, 0x1

    goto :goto_33

    .line 237
    .end local v4    # "h":I
    .end local v5    # "headerCount":I
    :cond_57
    invoke-virtual {v0}, Lcom/squareup/okhttp/RequestBody;->contentType()Lcom/squareup/okhttp/MediaType;

    move-result-object v3

    .line 238
    .local v3, "contentType":Lcom/squareup/okhttp/MediaType;
    if-eqz v3, :cond_72

    .line 239
    const-string v9, "Content-Type: "

    invoke-interface {p1, v9}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v9

    .line 240
    invoke-virtual {v3}, Lcom/squareup/okhttp/MediaType;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v9

    .line 241
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v10

    invoke-interface {v9, v10}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 244
    :cond_72
    invoke-virtual {v0}, Lcom/squareup/okhttp/RequestBody;->contentLength()J

    move-result-wide v1

    .line 245
    .local v1, "contentLength":J
    const-wide/16 v9, -0x1

    cmp-long v9, v1, v9

    if-eqz v9, :cond_91

    .line 246
    const-string v9, "Content-Length: "

    invoke-interface {p1, v9}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v9

    .line 247
    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v9

    .line 248
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v10

    invoke-interface {v9, v10}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 251
    :cond_91
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v9

    invoke-interface {p1, v9}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 252
    iget-object v9, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partBodies:Ljava/util/List;

    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/squareup/okhttp/RequestBody;

    invoke-virtual {v9, p1}, Lcom/squareup/okhttp/RequestBody;->writeTo(Lokio/BufferedSink;)V

    .line 253
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v9

    invoke-interface {p1, v9}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 220
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_7

    .line 256
    .end local v0    # "body":Lcom/squareup/okhttp/RequestBody;
    .end local v1    # "contentLength":J
    .end local v3    # "contentType":Lcom/squareup/okhttp/MediaType;
    .end local v6    # "headers":Lcom/squareup/okhttp/Headers;
    :cond_ae
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->DASHDASH:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$000()[B

    move-result-object v9

    invoke-interface {p1, v9}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 257
    iget-object v9, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->boundary:Lokio/ByteString;

    invoke-interface {p1, v9}, Lokio/BufferedSink;->write(Lokio/ByteString;)Lokio/BufferedSink;

    .line 258
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->DASHDASH:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$000()[B

    move-result-object v9

    invoke-interface {p1, v9}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 259
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v9

    invoke-interface {p1, v9}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 260
    return-void
.end method
