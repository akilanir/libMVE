.class abstract Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;
.super Lcz/msebera/android/httpclient/entity/HttpEntityWrapper;
.source "DecompressingEntity.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x800


# instance fields
.field private content:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/HttpEntity;)V
    .registers 2
    .param p1, "wrapped"    # Lcz/msebera/android/httpclient/HttpEntity;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/entity/HttpEntityWrapper;-><init>(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 63
    return-void
.end method

.method private getDecompressingStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v1, p0, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;->wrappedEntity:Lcz/msebera/android/httpclient/HttpEntity;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    .line 69
    .local v0, "in":Ljava/io/InputStream;
    new-instance v1, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;

    invoke-direct {v1, v0, p0}, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;-><init>(Ljava/io/InputStream;Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;)V

    return-object v1
.end method


# virtual methods
.method abstract decorate(Ljava/io/InputStream;)Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getContent()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;->wrappedEntity:Lcz/msebera/android/httpclient/HttpEntity;

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpEntity;->isStreaming()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 78
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;->content:Ljava/io/InputStream;

    if-nez v0, :cond_12

    .line 79
    invoke-direct {p0}, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;->getDecompressingStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;->content:Ljava/io/InputStream;

    .line 81
    :cond_12
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;->content:Ljava/io/InputStream;

    .line 83
    :goto_14
    return-object v0

    :cond_15
    invoke-direct {p0}, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;->getDecompressingStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_14
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 6
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    const-string v3, "Output stream"

    invoke-static {p1, v3}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 93
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;->getContent()Ljava/io/InputStream;

    move-result-object v1

    .line 95
    .local v1, "instream":Ljava/io/InputStream;
    const/16 v3, 0x800

    :try_start_b
    new-array v0, v3, [B

    .line 97
    .local v0, "buffer":[B
    :goto_d
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "l":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_1e

    .line 98
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_18
    .catchall {:try_start_b .. :try_end_18} :catchall_19

    goto :goto_d

    .line 101
    .end local v0    # "buffer":[B
    .end local v2    # "l":I
    :catchall_19
    move-exception v3

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v3

    .restart local v0    # "buffer":[B
    .restart local v2    # "l":I
    :cond_1e
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 103
    return-void
.end method
