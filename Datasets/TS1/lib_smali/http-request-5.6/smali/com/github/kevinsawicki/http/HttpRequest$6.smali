.class Lcom/github/kevinsawicki/http/HttpRequest$6;
.super Lcom/github/kevinsawicki/http/HttpRequest$CloseOperation;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/kevinsawicki/http/HttpRequest;->receive(Ljava/lang/Appendable;)Lcom/github/kevinsawicki/http/HttpRequest;
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

.field final synthetic val$appendable:Ljava/lang/Appendable;

.field final synthetic val$reader:Ljava/io/BufferedReader;


# direct methods
.method constructor <init>(Lcom/github/kevinsawicki/http/HttpRequest;Ljava/io/Closeable;ZLjava/io/BufferedReader;Ljava/lang/Appendable;)V
    .registers 6
    .param p2, "x0"    # Ljava/io/Closeable;
    .param p3, "x1"    # Z

    .prologue
    .line 1962
    iput-object p1, p0, Lcom/github/kevinsawicki/http/HttpRequest$6;->this$0:Lcom/github/kevinsawicki/http/HttpRequest;

    iput-object p4, p0, Lcom/github/kevinsawicki/http/HttpRequest$6;->val$reader:Ljava/io/BufferedReader;

    iput-object p5, p0, Lcom/github/kevinsawicki/http/HttpRequest$6;->val$appendable:Ljava/lang/Appendable;

    invoke-direct {p0, p2, p3}, Lcom/github/kevinsawicki/http/HttpRequest$CloseOperation;-><init>(Ljava/io/Closeable;Z)V

    return-void
.end method


# virtual methods
.method public run()Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1966
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest$6;->this$0:Lcom/github/kevinsawicki/http/HttpRequest;

    # getter for: Lcom/github/kevinsawicki/http/HttpRequest;->bufferSize:I
    invoke-static {v2}, Lcom/github/kevinsawicki/http/HttpRequest;->access$100(Lcom/github/kevinsawicki/http/HttpRequest;)I

    move-result v2

    invoke-static {v2}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v0

    .line 1968
    .local v0, "buffer":Ljava/nio/CharBuffer;
    :goto_a
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest$6;->val$reader:Ljava/io/BufferedReader;

    invoke-virtual {v2, v0}, Ljava/io/BufferedReader;->read(Ljava/nio/CharBuffer;)I

    move-result v1

    .local v1, "read":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_20

    .line 1969
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->rewind()Ljava/nio/Buffer;

    .line 1970
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest$6;->val$appendable:Ljava/lang/Appendable;

    const/4 v3, 0x0

    invoke-interface {v2, v0, v3, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    .line 1971
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->rewind()Ljava/nio/Buffer;

    goto :goto_a

    .line 1973
    :cond_20
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest$6;->this$0:Lcom/github/kevinsawicki/http/HttpRequest;

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
    .line 1962
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest$6;->run()Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method
