.class public Lcz/msebera/android/httpclient/impl/client/cache/HeapResourceFactory;
.super Ljava/lang/Object;
.source "HeapResourceFactory.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/cache/ResourceFactory;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public copy(Ljava/lang/String;Lcz/msebera/android/httpclient/client/cache/Resource;)Lcz/msebera/android/httpclient/client/cache/Resource;
    .registers 6
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "resource"    # Lcz/msebera/android/httpclient/client/cache/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    instance-of v2, p2, Lcz/msebera/android/httpclient/impl/client/cache/HeapResource;

    if-eqz v2, :cond_f

    .line 70
    check-cast p2, Lcz/msebera/android/httpclient/impl/client/cache/HeapResource;

    .end local p2    # "resource":Lcz/msebera/android/httpclient/client/cache/Resource;
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/impl/client/cache/HeapResource;->getByteArray()[B

    move-result-object v0

    .line 76
    .local v0, "body":[B
    :goto_a
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/client/cache/HeapResourceFactory;->createResource([B)Lcz/msebera/android/httpclient/client/cache/Resource;

    move-result-object v2

    return-object v2

    .line 72
    .end local v0    # "body":[B
    .restart local p2    # "resource":Lcz/msebera/android/httpclient/client/cache/Resource;
    :cond_f
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 73
    .local v1, "outstream":Ljava/io/ByteArrayOutputStream;
    invoke-interface {p2}, Lcz/msebera/android/httpclient/client/cache/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2, v1}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->copyAndClose(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 74
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .restart local v0    # "body":[B
    goto :goto_a
.end method

.method createResource([B)Lcz/msebera/android/httpclient/client/cache/Resource;
    .registers 3
    .param p1, "buf"    # [B

    .prologue
    .line 80
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/cache/HeapResource;

    invoke-direct {v0, p1}, Lcz/msebera/android/httpclient/impl/client/cache/HeapResource;-><init>([B)V

    return-object v0
.end method

.method public generate(Ljava/lang/String;Ljava/io/InputStream;Lcz/msebera/android/httpclient/client/cache/InputLimit;)Lcz/msebera/android/httpclient/client/cache/Resource;
    .registers 11
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "instream"    # Ljava/io/InputStream;
    .param p3, "limit"    # Lcz/msebera/android/httpclient/client/cache/InputLimit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 51
    .local v2, "outstream":Ljava/io/ByteArrayOutputStream;
    const/16 v5, 0x800

    new-array v0, v5, [B

    .line 52
    .local v0, "buf":[B
    const-wide/16 v3, 0x0

    .line 54
    .local v3, "total":J
    :cond_b
    invoke-virtual {p2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "l":I
    const/4 v5, -0x1

    if-eq v1, v5, :cond_25

    .line 55
    const/4 v5, 0x0

    invoke-virtual {v2, v0, v5, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 56
    int-to-long v5, v1

    add-long/2addr v3, v5

    .line 57
    if-eqz p3, :cond_b

    invoke-virtual {p3}, Lcz/msebera/android/httpclient/client/cache/InputLimit;->getValue()J

    move-result-wide v5

    cmp-long v5, v3, v5

    if-lez v5, :cond_b

    .line 58
    invoke-virtual {p3}, Lcz/msebera/android/httpclient/client/cache/InputLimit;->reached()V

    .line 62
    :cond_25
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-virtual {p0, v5}, Lcz/msebera/android/httpclient/impl/client/cache/HeapResourceFactory;->createResource([B)Lcz/msebera/android/httpclient/client/cache/Resource;

    move-result-object v5

    return-object v5
.end method
