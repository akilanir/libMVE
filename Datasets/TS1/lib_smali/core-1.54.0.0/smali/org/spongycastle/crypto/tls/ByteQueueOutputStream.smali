.class public Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;
.super Ljava/io/OutputStream;
.source "ByteQueueOutputStream.java"


# instance fields
.field private buffer:Lorg/spongycastle/crypto/tls/ByteQueue;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 15
    new-instance v0, Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/ByteQueue;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;->buffer:Lorg/spongycastle/crypto/tls/ByteQueue;

    .line 16
    return-void
.end method


# virtual methods
.method public getBuffer()Lorg/spongycastle/crypto/tls/ByteQueue;
    .registers 2

    .prologue
    .line 20
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;->buffer:Lorg/spongycastle/crypto/tls/ByteQueue;

    return-object v0
.end method

.method public write(I)V
    .registers 7
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 25
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;->buffer:Lorg/spongycastle/crypto/tls/ByteQueue;

    new-array v1, v4, [B

    int-to-byte v2, p1

    aput-byte v2, v1, v3

    invoke-virtual {v0, v1, v3, v4}, Lorg/spongycastle/crypto/tls/ByteQueue;->addData([BII)V

    .line 26
    return-void
.end method

.method public write([BII)V
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
    .line 30
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/ByteQueueOutputStream;->buffer:Lorg/spongycastle/crypto/tls/ByteQueue;

    invoke-virtual {v0, p1, p2, p3}, Lorg/spongycastle/crypto/tls/ByteQueue;->addData([BII)V

    .line 31
    return-void
.end method
