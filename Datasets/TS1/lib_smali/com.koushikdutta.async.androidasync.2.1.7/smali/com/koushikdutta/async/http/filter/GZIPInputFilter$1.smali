.class Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;
.super Ljava/lang/Object;
.source "GZIPInputFilter.java"

# interfaces
.implements Lcom/koushikdutta/async/PushParser$ParseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/PushParser$ParseCallback",
        "<[B>;"
    }
.end annotation


# instance fields
.field flags:I

.field hcrc:Z

.field final synthetic this$0:Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

.field final synthetic val$emitter:Lcom/koushikdutta/async/DataEmitter;

.field final synthetic val$parser:Lcom/koushikdutta/async/PushParser;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/filter/GZIPInputFilter;Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/PushParser;)V
    .registers 4

    .prologue
    .line 51
    iput-object p1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->this$0:Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

    iput-object p2, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->val$emitter:Lcom/koushikdutta/async/DataEmitter;

    iput-object p3, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->val$parser:Lcom/koushikdutta/async/PushParser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;)V
    .registers 1
    .param p0, "x0"    # Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->next()V

    return-void
.end method

.method static synthetic access$100(Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;)V
    .registers 1
    .param p0, "x0"    # Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->done()V

    return-void
.end method

.method private done()V
    .registers 4

    .prologue
    .line 118
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->hcrc:Z

    if-eqz v0, :cond_10

    .line 119
    iget-object v0, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->val$parser:Lcom/koushikdutta/async/PushParser;

    const/4 v1, 0x2

    new-instance v2, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$3;

    invoke-direct {v2, p0}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$3;-><init>(Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;)V

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/PushParser;->readByteArray(ILcom/koushikdutta/async/PushParser$ParseCallback;)Lcom/koushikdutta/async/PushParser;

    .line 136
    :goto_f
    return-void

    .line 133
    :cond_10
    iget-object v0, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->this$0:Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->mNeedsHeader:Z

    .line 134
    iget-object v0, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->this$0:Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

    iget-object v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->val$emitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    goto :goto_f
.end method

.method private next()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 90
    new-instance v0, Lcom/koushikdutta/async/PushParser;

    iget-object v2, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->val$emitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-direct {v0, v2}, Lcom/koushikdutta/async/PushParser;-><init>(Lcom/koushikdutta/async/DataEmitter;)V

    .line 91
    .local v0, "parser":Lcom/koushikdutta/async/PushParser;
    new-instance v1, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$2;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$2;-><init>(Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;)V

    .line 105
    .local v1, "summer":Lcom/koushikdutta/async/callback/DataCallback;
    iget v2, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->flags:I

    and-int/lit8 v2, v2, 0x8

    if-eqz v2, :cond_17

    .line 106
    invoke-virtual {v0, v3, v1}, Lcom/koushikdutta/async/PushParser;->until(BLcom/koushikdutta/async/callback/DataCallback;)Lcom/koushikdutta/async/PushParser;

    .line 115
    :goto_16
    return-void

    .line 109
    :cond_17
    iget v2, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->flags:I

    and-int/lit8 v2, v2, 0x10

    if-eqz v2, :cond_21

    .line 110
    invoke-virtual {v0, v3, v1}, Lcom/koushikdutta/async/PushParser;->until(BLcom/koushikdutta/async/callback/DataCallback;)Lcom/koushikdutta/async/PushParser;

    goto :goto_16

    .line 114
    :cond_21
    invoke-direct {p0}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->done()V

    goto :goto_16
.end method


# virtual methods
.method public bridge synthetic parsed(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 51
    check-cast p1, [B

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->parsed([B)V

    return-void
.end method

.method public parsed([B)V
    .registers 9
    .param p1, "header"    # [B

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 56
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {p1, v2, v3}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->peekShort([BILjava/nio/ByteOrder;)S

    move-result v0

    .line 57
    .local v0, "magic":S
    const/16 v3, -0x74e1

    if-eq v0, v3, :cond_2f

    .line 58
    iget-object v3, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->this$0:Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

    new-instance v4, Ljava/io/IOException;

    const-string v5, "unknown format (magic number %x)"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v6

    aput-object v6, v1, v2

    invoke-static {v5, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->report(Ljava/lang/Exception;)V

    .line 59
    iget-object v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->val$emitter:Lcom/koushikdutta/async/DataEmitter;

    new-instance v2, Lcom/koushikdutta/async/callback/DataCallback$NullDataCallback;

    invoke-direct {v2}, Lcom/koushikdutta/async/callback/DataCallback$NullDataCallback;-><init>()V

    invoke-interface {v1, v2}, Lcom/koushikdutta/async/DataEmitter;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 87
    :goto_2e
    return-void

    .line 62
    :cond_2f
    const/4 v3, 0x3

    aget-byte v3, p1, v3

    iput v3, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->flags:I

    .line 63
    iget v3, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->flags:I

    and-int/lit8 v3, v3, 0x2

    if-eqz v3, :cond_5a

    :goto_3a
    iput-boolean v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->hcrc:Z

    .line 64
    iget-boolean v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->hcrc:Z

    if-eqz v1, :cond_48

    .line 65
    iget-object v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->this$0:Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

    iget-object v1, v1, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->crc:Ljava/util/zip/CRC32;

    array-length v3, p1

    invoke-virtual {v1, p1, v2, v3}, Ljava/util/zip/CRC32;->update([BII)V

    .line 67
    :cond_48
    iget v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->flags:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_5c

    .line 68
    iget-object v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->val$parser:Lcom/koushikdutta/async/PushParser;

    const/4 v2, 0x2

    new-instance v3, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$1;

    invoke-direct {v3, p0}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$1;-><init>(Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;)V

    invoke-virtual {v1, v2, v3}, Lcom/koushikdutta/async/PushParser;->readByteArray(ILcom/koushikdutta/async/PushParser$ParseCallback;)Lcom/koushikdutta/async/PushParser;

    goto :goto_2e

    :cond_5a
    move v1, v2

    .line 63
    goto :goto_3a

    .line 85
    :cond_5c
    invoke-direct {p0}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->next()V

    goto :goto_2e
.end method
