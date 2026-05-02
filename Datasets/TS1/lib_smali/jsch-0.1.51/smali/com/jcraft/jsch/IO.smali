.class public Lcom/jcraft/jsch/IO;
.super Ljava/lang/Object;
.source "IO.java"


# instance fields
.field in:Ljava/io/InputStream;

.field private in_dontclose:Z

.field out:Ljava/io/OutputStream;

.field private out_dontclose:Z

.field out_ext:Ljava/io/OutputStream;

.field private out_ext_dontclose:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean v0, p0, Lcom/jcraft/jsch/IO;->in_dontclose:Z

    .line 40
    iput-boolean v0, p0, Lcom/jcraft/jsch/IO;->out_dontclose:Z

    .line 41
    iput-boolean v0, p0, Lcom/jcraft/jsch/IO;->out_ext_dontclose:Z

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 102
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_d

    iget-boolean v0, p0, Lcom/jcraft/jsch/IO;->in_dontclose:Z

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 103
    :cond_d
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_10} :catch_26

    .line 107
    :goto_10
    invoke-virtual {p0}, Lcom/jcraft/jsch/IO;->out_close()V

    .line 110
    :try_start_13
    iget-object v0, p0, Lcom/jcraft/jsch/IO;->out_ext:Ljava/io/OutputStream;

    if-eqz v0, :cond_20

    iget-boolean v0, p0, Lcom/jcraft/jsch/IO;->out_ext_dontclose:Z

    if-nez v0, :cond_20

    iget-object v0, p0, Lcom/jcraft/jsch/IO;->out_ext:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 111
    :cond_20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/IO;->out_ext:Ljava/io/OutputStream;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_23} :catch_24

    .line 114
    :goto_23
    return-void

    .line 113
    :catch_24
    move-exception v0

    goto :goto_23

    .line 105
    :catch_26
    move-exception v0

    goto :goto_10
.end method

.method getByte()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method

.method getByte([B)V
    .registers 4
    .param p1, "array"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/IO;->getByte([BII)V

    .line 78
    return-void
.end method

.method getByte([BII)V
    .registers 7
    .param p1, "array"    # [B
    .param p2, "begin"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    :cond_0
    iget-object v1, p0, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 83
    .local v0, "completed":I
    if-gez v0, :cond_10

    .line 84
    new-instance v1, Ljava/io/IOException;

    const-string v2, "End of IO Stream Read"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 86
    :cond_10
    add-int/2addr p2, v0

    .line 87
    sub-int/2addr p3, v0

    .line 89
    if-gtz p3, :cond_0

    .line 90
    return-void
.end method

.method out_close()V
    .registers 2

    .prologue
    .line 94
    :try_start_0
    iget-object v0, p0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_d

    iget-boolean v0, p0, Lcom/jcraft/jsch/IO;->out_dontclose:Z

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 95
    :cond_d
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_10} :catch_11

    .line 98
    :goto_10
    return-void

    .line 97
    :catch_11
    move-exception v0

    goto :goto_10
.end method

.method public put(Lcom/jcraft/jsch/Packet;)V
    .registers 6
    .param p1, "p"    # Lcom/jcraft/jsch/Packet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;

    iget-object v1, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v1, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/4 v2, 0x0

    iget-object v3, p1, Lcom/jcraft/jsch/Packet;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v3, v3, Lcom/jcraft/jsch/Buffer;->index:I

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 61
    iget-object v0, p0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 62
    return-void
.end method

.method put([BII)V
    .registers 5
    .param p1, "array"    # [B
    .param p2, "begin"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 65
    iget-object v0, p0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 66
    return-void
.end method

.method put_ext([BII)V
    .registers 5
    .param p1, "array"    # [B
    .param p2, "begin"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lcom/jcraft/jsch/IO;->out_ext:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 69
    iget-object v0, p0, Lcom/jcraft/jsch/IO;->out_ext:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 70
    return-void
.end method

.method setExtOutputStream(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/jcraft/jsch/IO;->out_ext:Ljava/io/OutputStream;

    return-void
.end method

.method setExtOutputStream(Ljava/io/OutputStream;Z)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "dontclose"    # Z

    .prologue
    .line 50
    iput-boolean p2, p0, Lcom/jcraft/jsch/IO;->out_ext_dontclose:Z

    .line 51
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/IO;->setExtOutputStream(Ljava/io/OutputStream;)V

    .line 52
    return-void
.end method

.method setInputStream(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    return-void
.end method

.method setInputStream(Ljava/io/InputStream;Z)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "dontclose"    # Z

    .prologue
    .line 55
    iput-boolean p2, p0, Lcom/jcraft/jsch/IO;->in_dontclose:Z

    .line 56
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/IO;->setInputStream(Ljava/io/InputStream;)V

    .line 57
    return-void
.end method

.method setOutputStream(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/jcraft/jsch/IO;->out:Ljava/io/OutputStream;

    return-void
.end method

.method setOutputStream(Ljava/io/OutputStream;Z)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "dontclose"    # Z

    .prologue
    .line 45
    iput-boolean p2, p0, Lcom/jcraft/jsch/IO;->out_dontclose:Z

    .line 46
    invoke-virtual {p0, p1}, Lcom/jcraft/jsch/IO;->setOutputStream(Ljava/io/OutputStream;)V

    .line 47
    return-void
.end method
