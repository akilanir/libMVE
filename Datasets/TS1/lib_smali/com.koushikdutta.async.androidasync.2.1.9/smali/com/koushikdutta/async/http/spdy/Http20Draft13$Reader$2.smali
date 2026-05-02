.class Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;
.super Ljava/lang/Object;
.source "Http20Draft13.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/DataCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 8
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 148
    :try_start_0
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-byte v1, v1, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->type:B

    packed-switch v1, :pswitch_data_d4

    .line 191
    invoke-virtual {p2}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    .line 193
    :goto_a
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    # invokes: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->parseFrameHeader()V
    invoke-static {v1}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$1300(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;)V

    .line 198
    :goto_f
    return-void

    .line 150
    :pswitch_10
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-short v2, v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->length:S

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-byte v3, v3, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->flags:B

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->streamId:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->readData(Lcom/koushikdutta/async/ByteBufferList;SBI)V
    invoke-static {v1, p2, v2, v3, v4}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$300(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;Lcom/koushikdutta/async/ByteBufferList;SBI)V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_21} :catch_22

    goto :goto_a

    .line 195
    :catch_22
    move-exception v0

    .line 196
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    # getter for: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->handler:Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;
    invoke-static {v1}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$1400(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;)Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/koushikdutta/async/http/spdy/FrameReader$Handler;->error(Ljava/lang/Exception;)V

    goto :goto_f

    .line 154
    .end local v0    # "e":Ljava/io/IOException;
    :pswitch_2d
    :try_start_2d
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-short v2, v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->length:S

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-byte v3, v3, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->flags:B

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->streamId:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->readHeaders(Lcom/koushikdutta/async/ByteBufferList;SBI)V
    invoke-static {v1, p2, v2, v3, v4}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$400(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;Lcom/koushikdutta/async/ByteBufferList;SBI)V

    goto :goto_a

    .line 158
    :pswitch_3f
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-short v2, v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->length:S

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-byte v3, v3, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->flags:B

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->streamId:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->readPriority(Lcom/koushikdutta/async/ByteBufferList;SBI)V
    invoke-static {v1, p2, v2, v3, v4}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$500(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;Lcom/koushikdutta/async/ByteBufferList;SBI)V

    goto :goto_a

    .line 162
    :pswitch_51
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-short v2, v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->length:S

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-byte v3, v3, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->flags:B

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->streamId:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->readRstStream(Lcom/koushikdutta/async/ByteBufferList;SBI)V
    invoke-static {v1, p2, v2, v3, v4}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$600(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;Lcom/koushikdutta/async/ByteBufferList;SBI)V

    goto :goto_a

    .line 166
    :pswitch_63
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-short v2, v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->length:S

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-byte v3, v3, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->flags:B

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->streamId:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->readSettings(Lcom/koushikdutta/async/ByteBufferList;SBI)V
    invoke-static {v1, p2, v2, v3, v4}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$700(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;Lcom/koushikdutta/async/ByteBufferList;SBI)V

    goto :goto_a

    .line 170
    :pswitch_75
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-short v2, v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->length:S

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-byte v3, v3, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->flags:B

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->streamId:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->readPushPromise(Lcom/koushikdutta/async/ByteBufferList;SBI)V
    invoke-static {v1, p2, v2, v3, v4}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$800(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;Lcom/koushikdutta/async/ByteBufferList;SBI)V

    goto :goto_a

    .line 174
    :pswitch_87
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-short v2, v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->length:S

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-byte v3, v3, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->flags:B

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->streamId:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->readPing(Lcom/koushikdutta/async/ByteBufferList;SBI)V
    invoke-static {v1, p2, v2, v3, v4}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$900(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;Lcom/koushikdutta/async/ByteBufferList;SBI)V

    goto/16 :goto_a

    .line 178
    :pswitch_9a
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-short v2, v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->length:S

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-byte v3, v3, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->flags:B

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->streamId:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->readGoAway(Lcom/koushikdutta/async/ByteBufferList;SBI)V
    invoke-static {v1, p2, v2, v3, v4}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$1000(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;Lcom/koushikdutta/async/ByteBufferList;SBI)V

    goto/16 :goto_a

    .line 182
    :pswitch_ad
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-short v2, v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->length:S

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-byte v3, v3, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->flags:B

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->streamId:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->readWindowUpdate(Lcom/koushikdutta/async/ByteBufferList;SBI)V
    invoke-static {v1, p2, v2, v3, v4}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$1100(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;Lcom/koushikdutta/async/ByteBufferList;SBI)V

    goto/16 :goto_a

    .line 186
    :pswitch_c0
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-short v2, v2, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->length:S

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget-byte v3, v3, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->flags:B

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->streamId:I

    # invokes: Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->readContinuation(Lcom/koushikdutta/async/ByteBufferList;SBI)V
    invoke-static {v1, p2, v2, v3, v4}, Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;->access$1200(Lcom/koushikdutta/async/http/spdy/Http20Draft13$Reader;Lcom/koushikdutta/async/ByteBufferList;SBI)V
    :try_end_d1
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_d1} :catch_22

    goto/16 :goto_a

    .line 148
    nop

    :pswitch_data_d4
    .packed-switch 0x0
        :pswitch_10
        :pswitch_2d
        :pswitch_3f
        :pswitch_51
        :pswitch_63
        :pswitch_75
        :pswitch_87
        :pswitch_9a
        :pswitch_ad
        :pswitch_c0
    .end packed-switch
.end method
