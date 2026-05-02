.class Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;
.super Ljava/io/InputStream;
.source "LazyDecompressingInputStream.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final decompressingEntity:Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;

.field private final wrappedStream:Ljava/io/InputStream;

.field private wrapperStream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;)V
    .registers 3
    .param p1, "wrappedStream"    # Ljava/io/InputStream;
    .param p2, "decompressingEntity"    # Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 49
    iput-object p1, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrappedStream:Ljava/io/InputStream;

    .line 50
    iput-object p2, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->decompressingEntity:Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;

    .line 51
    return-void
.end method

.method private initWrapper()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrapperStream:Ljava/io/InputStream;

    if-nez v0, :cond_e

    .line 55
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->decompressingEntity:Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;

    iget-object v1, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrappedStream:Ljava/io/InputStream;

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;->decorate(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrapperStream:Ljava/io/InputStream;

    .line 57
    :cond_e
    return-void
.end method


# virtual methods
.method public available()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-direct {p0}, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->initWrapper()V

    .line 91
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrapperStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    :try_start_0
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrapperStream:Ljava/io/InputStream;

    if-eqz v0, :cond_9

    .line 98
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrapperStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_f

    .line 101
    :cond_9
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrappedStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 103
    return-void

    .line 101
    :catchall_f
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrappedStream:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 85
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-direct {p0}, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->initWrapper()V

    .line 62
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrapperStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([B)I
    .registers 3
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-direct {p0}, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->initWrapper()V

    .line 68
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrapperStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0}, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->initWrapper()V

    .line 74
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrapperStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public skip(J)J
    .registers 5
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-direct {p0}, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->initWrapper()V

    .line 80
    iget-object v0, p0, Lcz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream;->wrapperStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method
