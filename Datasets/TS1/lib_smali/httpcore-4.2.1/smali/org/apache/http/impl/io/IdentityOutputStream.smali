.class public Lorg/apache/http/impl/io/IdentityOutputStream;
.super Ljava/io/OutputStream;
.source "IdentityOutputStream.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private closed:Z

.field private final out:Lorg/apache/http/io/SessionOutputBuffer;


# direct methods
.method public constructor <init>(Lorg/apache/http/io/SessionOutputBuffer;)V
    .registers 4
    .param p1, "out"    # Lorg/apache/http/io/SessionOutputBuffer;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/impl/io/IdentityOutputStream;->closed:Z

    .line 61
    if-nez p1, :cond_10

    .line 62
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Session output buffer may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_10
    iput-object p1, p0, Lorg/apache/http/impl/io/IdentityOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    .line 65
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    iget-boolean v0, p0, Lorg/apache/http/impl/io/IdentityOutputStream;->closed:Z

    if-nez v0, :cond_c

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/io/IdentityOutputStream;->closed:Z

    .line 76
    iget-object v0, p0, Lorg/apache/http/impl/io/IdentityOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/http/io/SessionOutputBuffer;->flush()V

    .line 78
    :cond_c
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lorg/apache/http/impl/io/IdentityOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/http/io/SessionOutputBuffer;->flush()V

    .line 83
    return-void
.end method

.method public write(I)V
    .registers 4
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    iget-boolean v0, p0, Lorg/apache/http/impl/io/IdentityOutputStream;->closed:Z

    if-eqz v0, :cond_c

    .line 101
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Attempted write to closed stream."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 103
    :cond_c
    iget-object v0, p0, Lorg/apache/http/impl/io/IdentityOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0, p1}, Lorg/apache/http/io/SessionOutputBuffer;->write(I)V

    .line 104
    return-void
.end method

.method public write([B)V
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/http/impl/io/IdentityOutputStream;->write([BII)V

    .line 96
    return-void
.end method

.method public write([BII)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    iget-boolean v0, p0, Lorg/apache/http/impl/io/IdentityOutputStream;->closed:Z

    if-eqz v0, :cond_c

    .line 88
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Attempted write to closed stream."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_c
    iget-object v0, p0, Lorg/apache/http/impl/io/IdentityOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/http/io/SessionOutputBuffer;->write([BII)V

    .line 91
    return-void
.end method
