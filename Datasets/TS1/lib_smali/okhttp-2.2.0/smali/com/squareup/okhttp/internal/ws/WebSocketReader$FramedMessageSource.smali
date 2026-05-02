.class final Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;
.super Ljava/lang/Object;
.source "WebSocketReader.java"

# interfaces
.implements Lokio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/ws/WebSocketReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FramedMessageSource"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)V
    .registers 2

    .prologue
    .line 225
    iput-object p1, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/internal/ws/WebSocketReader;Lcom/squareup/okhttp/internal/ws/WebSocketReader$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocketReader;
    .param p2, "x1"    # Lcom/squareup/okhttp/internal/ws/WebSocketReader$1;

    .prologue
    .line 225
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;-><init>(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 262
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->messageClosed:Z
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$200(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 272
    :cond_8
    return-void

    .line 263
    :cond_9
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    const/4 v1, 0x1

    # setter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->messageClosed:Z
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$202(Lcom/squareup/okhttp/internal/ws/WebSocketReader;Z)Z

    .line 264
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->closed:Z
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$100(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 267
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$1000(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Lokio/BufferedSource;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->frameLength:J
    invoke-static {v1}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$400(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)J

    move-result-wide v1

    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->frameBytesRead:J
    invoke-static {v3}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$300(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-interface {v0, v1, v2}, Lokio/BufferedSource;->skip(J)V

    .line 268
    :goto_2d
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->isFinalFrame:Z
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$500(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 269
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # invokes: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->readUntilNonControlFrame()V
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$600(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)V

    .line 270
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$1000(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Lokio/BufferedSource;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->frameLength:J
    invoke-static {v1}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$400(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lokio/BufferedSource;->skip(J)V

    goto :goto_2d
.end method

.method public read(Lokio/Buffer;J)J
    .registers 14
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->closed:Z
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$100(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Z

    move-result v0

    if-eqz v0, :cond_10

    new-instance v0, Ljava/io/IOException;

    const-string v3, "Closed"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_10
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->messageClosed:Z
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$200(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Z

    move-result v0

    if-eqz v0, :cond_20

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "Closed"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 230
    :cond_20
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->frameBytesRead:J
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$300(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)J

    move-result-wide v3

    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->frameLength:J
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$400(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)J

    move-result-wide v8

    cmp-long v0, v3, v8

    if-nez v0, :cond_6b

    .line 231
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->isFinalFrame:Z
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$500(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Z

    move-result v0

    if-eqz v0, :cond_3b

    const-wide/16 v1, -0x1

    .line 254
    :goto_3a
    return-wide v1

    .line 233
    :cond_3b
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # invokes: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->readUntilNonControlFrame()V
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$600(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)V

    .line 234
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->opcode:I
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$700(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)I

    move-result v0

    if-eqz v0, :cond_6b

    .line 235
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected continuation opcode. Got: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->opcode:I
    invoke-static {v4}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$700(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 239
    :cond_6b
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->frameLength:J
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$400(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)J

    move-result-wide v3

    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->frameBytesRead:J
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$300(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)J

    move-result-wide v8

    sub-long/2addr v3, v8

    invoke-static {p2, p3, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    .line 242
    .local v6, "toRead":J
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->isMasked:Z
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$800(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Z

    move-result v0

    if-eqz v0, :cond_dd

    .line 243
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->maskBuffer:[B
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$900(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)[B

    move-result-object v0

    array-length v0, v0

    int-to-long v3, v0

    invoke-static {v6, v7, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    .line 244
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$1000(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Lokio/BufferedSource;

    move-result-object v0

    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->maskBuffer:[B
    invoke-static {v3}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$900(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)[B

    move-result-object v3

    const/4 v4, 0x0

    long-to-int v5, v6

    invoke-interface {v0, v3, v4, v5}, Lokio/BufferedSource;->read([BII)I

    move-result v0

    int-to-long v1, v0

    .line 245
    .local v1, "read":J
    const-wide/16 v3, -0x1

    cmp-long v0, v1, v3

    if-nez v0, :cond_af

    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 246
    :cond_af
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->maskBuffer:[B
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$900(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)[B

    move-result-object v0

    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->maskKey:[B
    invoke-static {v3}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$1100(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)[B

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->frameBytesRead:J
    invoke-static {v4}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$300(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)J

    move-result-wide v4

    invoke-static/range {v0 .. v5}, Lcom/squareup/okhttp/internal/ws/Protocol;->toggleMask([BJ[BJ)V

    .line 247
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->maskBuffer:[B
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$900(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)[B

    move-result-object v0

    const/4 v3, 0x0

    long-to-int v4, v1

    invoke-virtual {p1, v0, v3, v4}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    .line 253
    :cond_cf
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->frameBytesRead:J
    invoke-static {v3}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$300(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)J

    move-result-wide v3

    add-long/2addr v3, v1

    # setter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->frameBytesRead:J
    invoke-static {v0, v3, v4}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$302(Lcom/squareup/okhttp/internal/ws/WebSocketReader;J)J

    goto/16 :goto_3a

    .line 249
    .end local v1    # "read":J
    :cond_dd
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$1000(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Lokio/BufferedSource;

    move-result-object v0

    invoke-interface {v0, p1, v6, v7}, Lokio/BufferedSource;->read(Lokio/Buffer;J)J

    move-result-wide v1

    .line 250
    .restart local v1    # "read":J
    const-wide/16 v3, -0x1

    cmp-long v0, v1, v3

    if-nez v0, :cond_cf

    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocketReader$FramedMessageSource;->this$0:Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    # getter for: Lcom/squareup/okhttp/internal/ws/WebSocketReader;->source:Lokio/BufferedSource;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;->access$1000(Lcom/squareup/okhttp/internal/ws/WebSocketReader;)Lokio/BufferedSource;

    move-result-object v0

    invoke-interface {v0}, Lokio/BufferedSource;->timeout()Lokio/Timeout;

    move-result-object v0

    return-object v0
.end method
