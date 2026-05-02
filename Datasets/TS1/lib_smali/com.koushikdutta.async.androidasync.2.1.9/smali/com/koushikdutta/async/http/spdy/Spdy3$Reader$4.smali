.class Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;
.super Ljava/lang/Object;
.source "Spdy3.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/DataCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    .prologue
    .line 204
    iput-object p1, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 9
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 208
    sget-object v3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p2, v3}, Lcom/koushikdutta/async/ByteBufferList;->order(Ljava/nio/ByteOrder;)Lcom/koushikdutta/async/ByteBufferList;

    .line 210
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v3, v3, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->w1:I

    const/high16 v4, 0x7fff0000

    and-int/2addr v3, v4

    ushr-int/lit8 v2, v3, 0x10

    .line 211
    .local v2, "version":I
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v3, v3, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->w1:I

    const v4, 0xffff

    and-int v1, v3, v4

    .line 214
    .local v1, "type":I
    const/4 v3, 0x3

    if-eq v2, v3, :cond_3e

    .line 215
    :try_start_1a
    new-instance v3, Ljava/net/ProtocolException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "version != 3: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_33} :catch_33

    .line 257
    :catch_33
    move-exception v0

    .line 258
    .local v0, "e":Ljava/io/IOException;
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    # getter for: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;
    invoke-static {v3}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$400(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    move-result-object v3

    invoke-interface {v3, v0}, Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;->error(Ljava/lang/Exception;)V

    .line 260
    .end local v0    # "e":Ljava/io/IOException;
    :goto_3d
    return-void

    .line 218
    :cond_3e
    packed-switch v1, :pswitch_data_ba

    .line 252
    :pswitch_41
    :try_start_41
    invoke-virtual {p2}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    .line 255
    :goto_44
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    # invokes: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->parseFrameHeader()V
    invoke-static {v3}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$500(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)V

    goto :goto_3d

    .line 220
    :pswitch_4a
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->flags:I

    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v5, v5, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->length:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readSynStream(Lcom/koushikdutta/async/ByteBufferList;II)V
    invoke-static {v3, p2, v4, v5}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$600(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V

    goto :goto_44

    .line 224
    :pswitch_58
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->flags:I

    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v5, v5, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->length:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readSynReply(Lcom/koushikdutta/async/ByteBufferList;II)V
    invoke-static {v3, p2, v4, v5}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$700(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V

    goto :goto_44

    .line 228
    :pswitch_66
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->flags:I

    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v5, v5, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->length:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readRstStream(Lcom/koushikdutta/async/ByteBufferList;II)V
    invoke-static {v3, p2, v4, v5}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$800(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V

    goto :goto_44

    .line 232
    :pswitch_74
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->flags:I

    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v5, v5, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->length:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readSettings(Lcom/koushikdutta/async/ByteBufferList;II)V
    invoke-static {v3, p2, v4, v5}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$900(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V

    goto :goto_44

    .line 236
    :pswitch_82
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->flags:I

    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v5, v5, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->length:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readPing(Lcom/koushikdutta/async/ByteBufferList;II)V
    invoke-static {v3, p2, v4, v5}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$1000(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V

    goto :goto_44

    .line 240
    :pswitch_90
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->flags:I

    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v5, v5, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->length:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readGoAway(Lcom/koushikdutta/async/ByteBufferList;II)V
    invoke-static {v3, p2, v4, v5}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$1100(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V

    goto :goto_44

    .line 244
    :pswitch_9e
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->flags:I

    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v5, v5, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->length:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readHeaders(Lcom/koushikdutta/async/ByteBufferList;II)V
    invoke-static {v3, p2, v4, v5}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$1200(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V

    goto :goto_44

    .line 248
    :pswitch_ac
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->flags:I

    iget-object v5, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$4;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v5, v5, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->length:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->readWindowUpdate(Lcom/koushikdutta/async/ByteBufferList;II)V
    invoke-static {v3, p2, v4, v5}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$1300(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;Lcom/koushikdutta/async/ByteBufferList;II)V
    :try_end_b9
    .catch Ljava/io/IOException; {:try_start_41 .. :try_end_b9} :catch_33

    goto :goto_44

    .line 218
    :pswitch_data_ba
    .packed-switch 0x1
        :pswitch_4a
        :pswitch_58
        :pswitch_66
        :pswitch_74
        :pswitch_41
        :pswitch_82
        :pswitch_90
        :pswitch_9e
        :pswitch_ac
    .end packed-switch
.end method
