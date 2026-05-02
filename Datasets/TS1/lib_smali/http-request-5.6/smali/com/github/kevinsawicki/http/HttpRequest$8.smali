.class Lcom/github/kevinsawicki/http/HttpRequest$8;
.super Lcom/github/kevinsawicki/http/HttpRequest$CloseOperation;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/kevinsawicki/http/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/github/kevinsawicki/http/HttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/kevinsawicki/http/HttpRequest$CloseOperation",
        "<",
        "Lcom/github/kevinsawicki/http/HttpRequest;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/kevinsawicki/http/HttpRequest;

.field final synthetic val$input:Ljava/io/InputStream;

.field final synthetic val$output:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Lcom/github/kevinsawicki/http/HttpRequest;Ljava/io/Closeable;ZLjava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 6
    .param p2, "x0"    # Ljava/io/Closeable;
    .param p3, "x1"    # Z

    .prologue
    .line 2573
    iput-object p1, p0, Lcom/github/kevinsawicki/http/HttpRequest$8;->this$0:Lcom/github/kevinsawicki/http/HttpRequest;

    iput-object p4, p0, Lcom/github/kevinsawicki/http/HttpRequest$8;->val$input:Ljava/io/InputStream;

    iput-object p5, p0, Lcom/github/kevinsawicki/http/HttpRequest$8;->val$output:Ljava/io/OutputStream;

    invoke-direct {p0, p2, p3}, Lcom/github/kevinsawicki/http/HttpRequest$CloseOperation;-><init>(Ljava/io/Closeable;Z)V

    return-void
.end method


# virtual methods
.method public run()Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2577
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest$8;->this$0:Lcom/github/kevinsawicki/http/HttpRequest;

    # getter for: Lcom/github/kevinsawicki/http/HttpRequest;->bufferSize:I
    invoke-static {v2}, Lcom/github/kevinsawicki/http/HttpRequest;->access$100(Lcom/github/kevinsawicki/http/HttpRequest;)I

    move-result v2

    new-array v0, v2, [B

    .line 2579
    .local v0, "buffer":[B
    :goto_8
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest$8;->val$input:Ljava/io/InputStream;

    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "read":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_33

    .line 2580
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest$8;->val$output:Ljava/io/OutputStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 2581
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest$8;->this$0:Lcom/github/kevinsawicki/http/HttpRequest;

    int-to-long v3, v1

    # += operator for: Lcom/github/kevinsawicki/http/HttpRequest;->totalWritten:J
    invoke-static {v2, v3, v4}, Lcom/github/kevinsawicki/http/HttpRequest;->access$214(Lcom/github/kevinsawicki/http/HttpRequest;J)J

    .line 2582
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest$8;->this$0:Lcom/github/kevinsawicki/http/HttpRequest;

    # getter for: Lcom/github/kevinsawicki/http/HttpRequest;->progress:Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;
    invoke-static {v2}, Lcom/github/kevinsawicki/http/HttpRequest;->access$400(Lcom/github/kevinsawicki/http/HttpRequest;)Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;

    move-result-object v2

    iget-object v3, p0, Lcom/github/kevinsawicki/http/HttpRequest$8;->this$0:Lcom/github/kevinsawicki/http/HttpRequest;

    # getter for: Lcom/github/kevinsawicki/http/HttpRequest;->totalWritten:J
    invoke-static {v3}, Lcom/github/kevinsawicki/http/HttpRequest;->access$200(Lcom/github/kevinsawicki/http/HttpRequest;)J

    move-result-wide v3

    iget-object v5, p0, Lcom/github/kevinsawicki/http/HttpRequest$8;->this$0:Lcom/github/kevinsawicki/http/HttpRequest;

    # getter for: Lcom/github/kevinsawicki/http/HttpRequest;->totalSize:J
    invoke-static {v5}, Lcom/github/kevinsawicki/http/HttpRequest;->access$300(Lcom/github/kevinsawicki/http/HttpRequest;)J

    move-result-wide v5

    invoke-interface {v2, v3, v4, v5, v6}, Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;->onUpload(JJ)V

    goto :goto_8

    .line 2584
    :cond_33
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest$8;->this$0:Lcom/github/kevinsawicki/http/HttpRequest;

    return-object v2
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2573
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest$8;->run()Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method
