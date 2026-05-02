.class public Lcom/koushikdutta/async/stream/FileDataSink;
.super Lcom/koushikdutta/async/stream/OutputStreamDataSink;
.source "FileDataSink.java"


# instance fields
.field file:Ljava/io/File;


# direct methods
.method public constructor <init>(Lcom/koushikdutta/async/AsyncServer;Ljava/io/File;)V
    .registers 3
    .param p1, "server"    # Lcom/koushikdutta/async/AsyncServer;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/stream/OutputStreamDataSink;-><init>(Lcom/koushikdutta/async/AsyncServer;)V

    .line 17
    iput-object p2, p0, Lcom/koushikdutta/async/stream/FileDataSink;->file:Ljava/io/File;

    .line 18
    return-void
.end method


# virtual methods
.method public getOutputStream()Ljava/io/OutputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-super {p0}, Lcom/koushikdutta/async/stream/OutputStreamDataSink;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 23
    .local v0, "ret":Ljava/io/OutputStream;
    if-nez v0, :cond_10

    .line 24
    new-instance v0, Ljava/io/FileOutputStream;

    .end local v0    # "ret":Ljava/io/OutputStream;
    iget-object v1, p0, Lcom/koushikdutta/async/stream/FileDataSink;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 25
    .restart local v0    # "ret":Ljava/io/OutputStream;
    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/stream/FileDataSink;->setOutputStream(Ljava/io/OutputStream;)V

    .line 27
    :cond_10
    return-object v0
.end method
