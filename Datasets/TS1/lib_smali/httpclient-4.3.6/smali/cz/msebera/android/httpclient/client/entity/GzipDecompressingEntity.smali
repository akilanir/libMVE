.class public Lcz/msebera/android/httpclient/client/entity/GzipDecompressingEntity;
.super Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;
.source "GzipDecompressingEntity.java"


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/HttpEntity;)V
    .registers 2
    .param p1, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;-><init>(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 53
    return-void
.end method


# virtual methods
.method decorate(Ljava/io/InputStream;)Ljava/io/InputStream;
    .registers 3
    .param p1, "wrapped"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    new-instance v0, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v0, p1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method public bridge synthetic getContent()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-super {p0}, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getContentEncoding()Lcz/msebera/android/httpclient/Header;
    .registers 2

    .prologue
    .line 67
    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 77
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public bridge synthetic writeTo(Ljava/io/OutputStream;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-super {p0, p1}, Lcz/msebera/android/httpclient/client/entity/DecompressingEntity;->writeTo(Ljava/io/OutputStream;)V

    return-void
.end method
