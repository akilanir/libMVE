.class Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$3;
.super Ljava/lang/Object;
.source "GZIPInputFilter.java"

# interfaces
.implements Lcom/koushikdutta/async/PushParser$ParseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->done()V
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
.field final synthetic this$1:Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;)V
    .registers 2

    .prologue
    .line 119
    iput-object p1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$3;->this$1:Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parsed(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 119
    check-cast p1, [B

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$3;->parsed([B)V

    return-void
.end method

.method public parsed([B)V
    .registers 6
    .param p1, "header"    # [B

    .prologue
    const/4 v3, 0x0

    .line 121
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-static {p1, v3, v1}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->peekShort([BILjava/nio/ByteOrder;)S

    move-result v0

    .line 122
    .local v0, "crc16":S
    iget-object v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$3;->this$1:Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;

    iget-object v1, v1, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->this$0:Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

    iget-object v1, v1, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    long-to-int v1, v1

    int-to-short v1, v1

    if-eq v1, v0, :cond_24

    .line 123
    iget-object v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$3;->this$1:Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;

    iget-object v1, v1, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->this$0:Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

    new-instance v2, Ljava/io/IOException;

    const-string v3, "CRC mismatch"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->report(Ljava/lang/Exception;)V

    .line 130
    :goto_23
    return-void

    .line 126
    :cond_24
    iget-object v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$3;->this$1:Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;

    iget-object v1, v1, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->this$0:Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

    iget-object v1, v1, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->crc:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->reset()V

    .line 127
    iget-object v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$3;->this$1:Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;

    iget-object v1, v1, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->this$0:Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

    iput-boolean v3, v1, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->mNeedsHeader:Z

    .line 128
    iget-object v1, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$3;->this$1:Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;

    iget-object v1, v1, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->this$0:Lcom/koushikdutta/async/http/filter/GZIPInputFilter;

    iget-object v2, p0, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1$3;->this$1:Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;

    iget-object v2, v2, Lcom/koushikdutta/async/http/filter/GZIPInputFilter$1;->val$emitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/http/filter/GZIPInputFilter;->setDataEmitter(Lcom/koushikdutta/async/DataEmitter;)V

    goto :goto_23
.end method
