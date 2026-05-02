.class public Lorg/apache/http/impl/io/SocketOutputBuffer;
.super Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;
.source "SocketOutputBuffer.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# direct methods
.method public constructor <init>(Ljava/net/Socket;ILorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "buffersize"    # I
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/apache/http/impl/io/AbstractSessionOutputBuffer;-><init>()V

    .line 67
    if-nez p1, :cond_d

    .line 68
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Socket may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_d
    if-gez p2, :cond_13

    .line 71
    invoke-virtual {p1}, Ljava/net/Socket;->getSendBufferSize()I

    move-result p2

    .line 73
    :cond_13
    const/16 v0, 0x400

    if-ge p2, v0, :cond_19

    .line 74
    const/16 p2, 0x400

    .line 76
    :cond_19
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/http/impl/io/SocketOutputBuffer;->init(Ljava/io/OutputStream;ILorg/apache/http/params/HttpParams;)V

    .line 77
    return-void
.end method
