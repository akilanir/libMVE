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

.field private contentLength:J

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
    .line 204
    .local p3, "partHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Headers;>;"
    .local p4, "partBodies":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/RequestBody;>;"
    invoke-direct {p0}, Lcom/squareup/okhttp/RequestBody;-><init>()V

    .line 201
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->contentLength:J

    .line 205
    if-nez p1, :cond_11

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "type == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 207
    :cond_11
    iput-object p2, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->boundary:Lokio/ByteString;

    .line 208
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

    .line 209
    invoke-static {p3}, Lcom/squareup/okhttp/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partHeaders:Ljava/util/List;

    .line 210
    invoke-static {p4}, Lcom/squareup/okhttp/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partBodies:Ljava/util/List;

    .line 211
    return-void
.end method

.method private writeOrCountBytes(Lokio/BufferedSink;Z)J
    .registers 17
    .param p1, "sink"    # Lokio/BufferedSink;
    .param p2, "countBytes"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    const-wide/16 v1, 0x0

    .line 232
    .local v1, "byteCount":J
    const/4 v3, 0x0

    .line 233
    .local v3, "byteCountBuffer":Lokio/Buffer;
    if-eqz p2, :cond_b

    .line 234
    new-instance v3, Lokio/Buffer;

    .end local v3    # "byteCountBuffer":Lokio/Buffer;
    invoke-direct {v3}, Lokio/Buffer;-><init>()V

    .restart local v3    # "byteCountBuffer":Lokio/Buffer;
    move-object p1, v3

    .line 237
    :cond_b
    const/4 v10, 0x0

    .local v10, "p":I
    iget-object v12, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partHeaders:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v11

    .local v11, "partCount":I
    :goto_12
    if-ge v10, v11, :cond_c1

    .line 238
    iget-object v12, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partHeaders:Ljava/util/List;

    invoke-interface {v12, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/squareup/okhttp/Headers;

    .line 239
    .local v9, "headers":Lcom/squareup/okhttp/Headers;
    iget-object v12, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partBodies:Ljava/util/List;

    invoke-interface {v12, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/RequestBody;

    .line 241
    .local v0, "body":Lcom/squareup/okhttp/RequestBody;
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->DASHDASH:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$000()[B

    move-result-object v12

    invoke-interface {p1, v12}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 242
    iget-object v12, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->boundary:Lokio/ByteString;

    invoke-interface {p1, v12}, Lokio/BufferedSink;->write(Lokio/ByteString;)Lokio/BufferedSink;

    .line 243
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v12

    invoke-interface {p1, v12}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 245
    if-eqz v9, :cond_62

    .line 246
    const/4 v7, 0x0

    .local v7, "h":I
    invoke-virtual {v9}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v8

    .local v8, "headerCount":I
    :goto_3e
    if-ge v7, v8, :cond_62

    .line 247
    invoke-virtual {v9, v7}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v12

    invoke-interface {p1, v12}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v12

    .line 248
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->COLONSPACE:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$200()[B

    move-result-object v13

    invoke-interface {v12, v13}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    move-result-object v12

    .line 249
    invoke-virtual {v9, v7}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v12

    .line 250
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v13

    invoke-interface {v12, v13}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 246
    add-int/lit8 v7, v7, 0x1

    goto :goto_3e

    .line 254
    .end local v7    # "h":I
    .end local v8    # "headerCount":I
    :cond_62
    invoke-virtual {v0}, Lcom/squareup/okhttp/RequestBody;->contentType()Lcom/squareup/okhttp/MediaType;

    move-result-object v6

    .line 255
    .local v6, "contentType":Lcom/squareup/okhttp/MediaType;
    if-eqz v6, :cond_7d

    .line 256
    const-string v12, "Content-Type: "

    invoke-interface {p1, v12}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v12

    .line 257
    invoke-virtual {v6}, Lcom/squareup/okhttp/MediaType;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v12

    .line 258
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v13

    invoke-interface {v12, v13}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 261
    :cond_7d
    invoke-virtual {v0}, Lcom/squareup/okhttp/RequestBody;->contentLength()J

    move-result-wide v4

    .line 262
    .local v4, "contentLength":J
    const-wide/16 v12, -0x1

    cmp-long v12, v4, v12

    if-eqz v12, :cond_ad

    .line 263
    const-string v12, "Content-Length: "

    invoke-interface {p1, v12}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    move-result-object v12

    .line 264
    invoke-interface {v12, v4, v5}, Lokio/BufferedSink;->writeDecimalLong(J)Lokio/BufferedSink;

    move-result-object v12

    .line 265
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v13

    invoke-interface {v12, v13}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 272
    :cond_98
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v12

    invoke-interface {p1, v12}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 274
    if-eqz p2, :cond_b5

    .line 275
    add-long/2addr v1, v4

    .line 280
    :goto_a2
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v12

    invoke-interface {p1, v12}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 237
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_12

    .line 266
    :cond_ad
    if-eqz p2, :cond_98

    .line 268
    invoke-virtual {v3}, Lokio/Buffer;->clear()V

    .line 269
    const-wide/16 v12, -0x1

    .line 293
    .end local v0    # "body":Lcom/squareup/okhttp/RequestBody;
    .end local v4    # "contentLength":J
    .end local v6    # "contentType":Lcom/squareup/okhttp/MediaType;
    .end local v9    # "headers":Lcom/squareup/okhttp/Headers;
    :goto_b4
    return-wide v12

    .line 277
    .restart local v0    # "body":Lcom/squareup/okhttp/RequestBody;
    .restart local v4    # "contentLength":J
    .restart local v6    # "contentType":Lcom/squareup/okhttp/MediaType;
    .restart local v9    # "headers":Lcom/squareup/okhttp/Headers;
    :cond_b5
    iget-object v12, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->partBodies:Ljava/util/List;

    invoke-interface {v12, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/squareup/okhttp/RequestBody;

    invoke-virtual {v12, p1}, Lcom/squareup/okhttp/RequestBody;->writeTo(Lokio/BufferedSink;)V

    goto :goto_a2

    .line 283
    .end local v0    # "body":Lcom/squareup/okhttp/RequestBody;
    .end local v4    # "contentLength":J
    .end local v6    # "contentType":Lcom/squareup/okhttp/MediaType;
    .end local v9    # "headers":Lcom/squareup/okhttp/Headers;
    :cond_c1
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->DASHDASH:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$000()[B

    move-result-object v12

    invoke-interface {p1, v12}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 284
    iget-object v12, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->boundary:Lokio/ByteString;

    invoke-interface {p1, v12}, Lokio/BufferedSink;->write(Lokio/ByteString;)Lokio/BufferedSink;

    .line 285
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->DASHDASH:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$000()[B

    move-result-object v12

    invoke-interface {p1, v12}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 286
    # getter for: Lcom/squareup/okhttp/MultipartBuilder;->CRLF:[B
    invoke-static {}, Lcom/squareup/okhttp/MultipartBuilder;->access$100()[B

    move-result-object v12

    invoke-interface {p1, v12}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 288
    if-eqz p2, :cond_e5

    .line 289
    invoke-virtual {v3}, Lokio/Buffer;->size()J

    move-result-wide v12

    add-long/2addr v1, v12

    .line 290
    invoke-virtual {v3}, Lokio/Buffer;->clear()V

    :cond_e5
    move-wide v12, v1

    .line 293
    goto :goto_b4
.end method


# virtual methods
.method public contentLength()J
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    iget-wide v0, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->contentLength:J

    .line 219
    .local v0, "result":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_9

    .line 220
    .end local v0    # "result":J
    :goto_8
    return-wide v0

    .restart local v0    # "result":J
    :cond_9
    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {p0, v2, v3}, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->writeOrCountBytes(Lokio/BufferedSink;Z)J

    move-result-wide v0

    .end local v0    # "result":J
    iput-wide v0, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->contentLength:J

    goto :goto_8
.end method

.method public contentType()Lcom/squareup/okhttp/MediaType;
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->contentType:Lcom/squareup/okhttp/MediaType;

    return-object v0
.end method

.method public writeTo(Lokio/BufferedSink;)V
    .registers 3
    .param p1, "sink"    # Lokio/BufferedSink;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 297
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/squareup/okhttp/MultipartBuilder$MultipartRequestBody;->writeOrCountBytes(Lokio/BufferedSink;Z)J

    .line 298
    return-void
.end method
