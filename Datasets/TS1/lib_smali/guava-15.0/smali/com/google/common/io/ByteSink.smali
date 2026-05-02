.class public abstract Lcom/google/common/io/ByteSink;
.super Ljava/lang/Object;
.source "ByteSink.java"

# interfaces
.implements Lcom/google/common/io/OutputSupplier;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/io/ByteSink$1;,
        Lcom/google/common/io/ByteSink$AsCharSink;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/io/OutputSupplier",
        "<",
        "Ljava/io/OutputStream;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    return-void
.end method


# virtual methods
.method public asCharSink(Ljava/nio/charset/Charset;)Lcom/google/common/io/CharSink;
    .registers 4
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 54
    new-instance v0, Lcom/google/common/io/ByteSink$AsCharSink;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/google/common/io/ByteSink$AsCharSink;-><init>(Lcom/google/common/io/ByteSink;Ljava/nio/charset/Charset;Lcom/google/common/io/ByteSink$1;)V

    return-object v0
.end method

.method public final getOutput()Ljava/io/OutputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 79
    invoke-virtual {p0}, Lcom/google/common/io/ByteSink;->openStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getOutput()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/google/common/io/ByteSink;->getOutput()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public openBufferedStream()Ljava/io/OutputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/google/common/io/ByteSink;->openStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 96
    .local v0, "out":Ljava/io/OutputStream;
    instance-of v1, v0, Ljava/io/BufferedOutputStream;

    if-eqz v1, :cond_b

    check-cast v0, Ljava/io/BufferedOutputStream;

    .end local v0    # "out":Ljava/io/OutputStream;
    :goto_a
    return-object v0

    .restart local v0    # "out":Ljava/io/OutputStream;
    :cond_b
    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-direct {v1, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v0, v1

    goto :goto_a
.end method

.method public abstract openStream()Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public write([B)V
    .registers 6
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    invoke-static {}, Lcom/google/common/io/Closer;->create()Lcom/google/common/io/Closer;

    move-result-object v0

    .line 111
    .local v0, "closer":Lcom/google/common/io/Closer;
    :try_start_7
    invoke-virtual {p0}, Lcom/google/common/io/ByteSink;->openStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/common/io/Closer;->register(Ljava/io/Closeable;)Ljava/io/Closeable;

    move-result-object v2

    check-cast v2, Ljava/io/OutputStream;

    .line 112
    .local v2, "out":Ljava/io/OutputStream;
    invoke-virtual {v2, p1}, Ljava/io/OutputStream;->write([B)V

    .line 113
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_17} :catch_1b
    .catchall {:try_start_7 .. :try_end_17} :catchall_21

    .line 117
    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    .line 119
    return-void

    .line 114
    .end local v2    # "out":Ljava/io/OutputStream;
    :catch_1b
    move-exception v1

    .line 115
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_1c
    invoke-virtual {v0, v1}, Lcom/google/common/io/Closer;->rethrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3
    :try_end_21
    .catchall {:try_start_1c .. :try_end_21} :catchall_21

    .line 117
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_21
    move-exception v3

    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    throw v3
.end method

.method public writeFrom(Ljava/io/InputStream;)J
    .registers 8
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    invoke-static {}, Lcom/google/common/io/Closer;->create()Lcom/google/common/io/Closer;

    move-result-object v0

    .line 133
    .local v0, "closer":Lcom/google/common/io/Closer;
    :try_start_7
    invoke-virtual {p0}, Lcom/google/common/io/ByteSink;->openStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/google/common/io/Closer;->register(Ljava/io/Closeable;)Ljava/io/Closeable;

    move-result-object v2

    check-cast v2, Ljava/io/OutputStream;

    .line 134
    .local v2, "out":Ljava/io/OutputStream;
    invoke-static {p1, v2}, Lcom/google/common/io/ByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    move-result-wide v3

    .line 135
    .local v3, "written":J
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_18
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_18} :catch_1c
    .catchall {:try_start_7 .. :try_end_18} :catchall_22

    .line 140
    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    return-wide v3

    .line 137
    .end local v2    # "out":Ljava/io/OutputStream;
    .end local v3    # "written":J
    :catch_1c
    move-exception v1

    .line 138
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_1d
    invoke-virtual {v0, v1}, Lcom/google/common/io/Closer;->rethrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5
    :try_end_22
    .catchall {:try_start_1d .. :try_end_22} :catchall_22

    .line 140
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_22
    move-exception v5

    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    throw v5
.end method
