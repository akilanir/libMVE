.class Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;
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
    .line 158
    iput-object p1, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 9
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 161
    sget-object v3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p2, v3}, Lcom/koushikdutta/async/ByteBufferList;->order(Ljava/nio/ByteOrder;)Lcom/koushikdutta/async/ByteBufferList;

    .line 162
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    invoke-virtual {p2}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v4

    iput v4, v3, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->w1:I

    .line 163
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    invoke-virtual {p2}, Lcom/koushikdutta/async/ByteBufferList;->getInt()I

    move-result v4

    iput v4, v3, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->w2:I

    .line 165
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v3, v3, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->w1:I

    const/high16 v4, -0x80000000

    and-int/2addr v3, v4

    if-eqz v3, :cond_73

    move v0, v1

    .line 166
    .local v0, "control":Z
    :goto_21
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->w2:I

    const/high16 v5, -0x1000000

    and-int/2addr v4, v5

    ushr-int/lit8 v4, v4, 0x18

    iput v4, v3, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->flags:I

    .line 167
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->w2:I

    const v5, 0xffffff

    and-int/2addr v4, v5

    iput v4, v3, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->length:I

    .line 169
    if-nez v0, :cond_77

    .line 170
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->w1:I

    const v5, 0x7fffffff

    and-int/2addr v4, v5

    iput v4, v3, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->streamId:I

    .line 171
    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget-object v4, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v4, v4, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->flags:I

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_75

    :goto_52
    iput-boolean v1, v3, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->inFinished:Z

    .line 172
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    # getter for: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->onDataFrame:Lcom/koushikdutta/async/callback/DataCallback;
    invoke-static {v1}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$000(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)Lcom/koushikdutta/async/callback/DataCallback;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/koushikdutta/async/DataEmitter;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 174
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v1, v1, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->length:I

    if-nez v1, :cond_72

    .line 177
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    # getter for: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->onDataFrame:Lcom/koushikdutta/async/callback/DataCallback;
    invoke-static {v1}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$000(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)Lcom/koushikdutta/async/callback/DataCallback;

    move-result-object v1

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    # getter for: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->emptyList:Lcom/koushikdutta/async/ByteBufferList;
    invoke-static {v2}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$100(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)Lcom/koushikdutta/async/ByteBufferList;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Lcom/koushikdutta/async/callback/DataCallback;->onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V

    .line 183
    :cond_72
    :goto_72
    return-void

    .end local v0    # "control":Z
    :cond_73
    move v0, v2

    .line 165
    goto :goto_21

    .restart local v0    # "control":Z
    :cond_75
    move v1, v2

    .line 171
    goto :goto_52

    .line 181
    :cond_77
    iget-object v1, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    # getter for: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->reader:Lcom/koushikdutta/async/DataEmitterReader;
    invoke-static {v1}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$300(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)Lcom/koushikdutta/async/DataEmitterReader;

    move-result-object v1

    iget-object v2, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    iget v2, v2, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->length:I

    iget-object v3, p0, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader$2;->this$0:Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;

    # getter for: Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->onFullFrame:Lcom/koushikdutta/async/callback/DataCallback;
    invoke-static {v3}, Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;->access$200(Lcom/koushikdutta/async/http/spdy/Spdy3$Reader;)Lcom/koushikdutta/async/callback/DataCallback;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/koushikdutta/async/DataEmitterReader;->read(ILcom/koushikdutta/async/callback/DataCallback;)V

    goto :goto_72
.end method
