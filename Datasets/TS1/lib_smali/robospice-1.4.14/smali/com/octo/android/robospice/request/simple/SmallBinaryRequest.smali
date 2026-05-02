.class public Lcom/octo/android/robospice/request/simple/SmallBinaryRequest;
.super Lcom/octo/android/robospice/request/simple/BinaryRequest;
.source "SmallBinaryRequest.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/request/simple/BinaryRequest;-><init>(Ljava/lang/String;)V

    .line 21
    return-void
.end method


# virtual methods
.method public processStream(ILjava/io/InputStream;)Ljava/io/InputStream;
    .registers 8
    .param p1, "contentLength"    # I
    .param p2, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 26
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Lcom/octo/android/robospice/request/ProgressByteProcessor;

    int-to-long v3, p1

    invoke-direct {v2, p0, v0, v3, v4}, Lcom/octo/android/robospice/request/ProgressByteProcessor;-><init>(Lcom/octo/android/robospice/request/SpiceRequest;Ljava/io/OutputStream;J)V

    invoke-virtual {p0, p2, v2}, Lcom/octo/android/robospice/request/simple/SmallBinaryRequest;->readBytes(Ljava/io/InputStream;Lcom/octo/android/robospice/request/ProgressByteProcessor;)V

    .line 28
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 29
    .local v1, "bytes":[B
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v2
.end method
