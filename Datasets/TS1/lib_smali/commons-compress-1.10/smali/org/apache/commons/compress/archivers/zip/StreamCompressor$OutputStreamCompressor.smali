.class final Lorg/apache/commons/compress/archivers/zip/StreamCompressor$OutputStreamCompressor;
.super Lorg/apache/commons/compress/archivers/zip/StreamCompressor;
.source "StreamCompressor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/zip/StreamCompressor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OutputStreamCompressor"
.end annotation


# instance fields
.field private final os:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/util/zip/Deflater;Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "deflater"    # Ljava/util/zip/Deflater;
    .param p2, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 282
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/StreamCompressor;-><init>(Ljava/util/zip/Deflater;)V

    .line 283
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor$OutputStreamCompressor;->os:Ljava/io/OutputStream;

    .line 284
    return-void
.end method


# virtual methods
.method protected final writeOut([BII)V
    .registers 5
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 288
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/StreamCompressor$OutputStreamCompressor;->os:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 289
    return-void
.end method
