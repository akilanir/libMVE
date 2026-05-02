.class Lcom/koushikdutta/async/http/HybiParser$3;
.super Ljava/lang/Object;
.source "HybiParser.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/DataCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/http/HybiParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/HybiParser;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/HybiParser;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/HybiParser;

    .prologue
    .line 170
    iput-object p1, p0, Lcom/koushikdutta/async/http/HybiParser$3;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 6
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 173
    iget-object v2, p0, Lcom/koushikdutta/async/http/HybiParser$3;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    # getter for: Lcom/koushikdutta/async/http/HybiParser;->mLengthSize:I
    invoke-static {v2}, Lcom/koushikdutta/async/http/HybiParser;->access$200(Lcom/koushikdutta/async/http/HybiParser;)I

    move-result v2

    new-array v0, v2, [B

    .line 174
    .local v0, "bytes":[B
    invoke-virtual {p2, v0}, Lcom/koushikdutta/async/ByteBufferList;->get([B)V

    .line 176
    :try_start_b
    iget-object v2, p0, Lcom/koushikdutta/async/http/HybiParser$3;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    # invokes: Lcom/koushikdutta/async/http/HybiParser;->parseExtendedLength([B)V
    invoke-static {v2, v0}, Lcom/koushikdutta/async/http/HybiParser;->access$300(Lcom/koushikdutta/async/http/HybiParser;[B)V
    :try_end_10
    .catch Lcom/koushikdutta/async/http/HybiParser$ProtocolError; {:try_start_b .. :try_end_10} :catch_16

    .line 182
    :goto_10
    iget-object v2, p0, Lcom/koushikdutta/async/http/HybiParser$3;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    invoke-virtual {v2}, Lcom/koushikdutta/async/http/HybiParser;->parse()V

    .line 183
    return-void

    .line 178
    :catch_16
    move-exception v1

    .line 179
    .local v1, "e":Lcom/koushikdutta/async/http/HybiParser$ProtocolError;
    iget-object v2, p0, Lcom/koushikdutta/async/http/HybiParser$3;->this$0:Lcom/koushikdutta/async/http/HybiParser;

    invoke-virtual {v2, v1}, Lcom/koushikdutta/async/http/HybiParser;->report(Ljava/lang/Exception;)V

    .line 180
    invoke-virtual {v1}, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;->printStackTrace()V

    goto :goto_10
.end method
