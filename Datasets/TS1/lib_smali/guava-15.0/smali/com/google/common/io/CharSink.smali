.class public abstract Lcom/google/common/io/CharSink;
.super Ljava/lang/Object;
.source "CharSink.java"

# interfaces
.implements Lcom/google/common/io/OutputSupplier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/io/OutputSupplier",
        "<",
        "Ljava/io/Writer;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getOutput()Ljava/io/Writer;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/google/common/io/CharSink;->openStream()Ljava/io/Writer;

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
    .line 49
    invoke-virtual {p0}, Lcom/google/common/io/CharSink;->getOutput()Ljava/io/Writer;

    move-result-object v0

    return-object v0
.end method

.method public openBufferedStream()Ljava/io/Writer;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/google/common/io/CharSink;->openStream()Ljava/io/Writer;

    move-result-object v0

    .line 90
    .local v0, "writer":Ljava/io/Writer;
    instance-of v1, v0, Ljava/io/BufferedWriter;

    if-eqz v1, :cond_b

    check-cast v0, Ljava/io/BufferedWriter;

    .end local v0    # "writer":Ljava/io/Writer;
    :goto_a
    return-object v0

    .restart local v0    # "writer":Ljava/io/Writer;
    :cond_b
    new-instance v1, Ljava/io/BufferedWriter;

    invoke-direct {v1, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    move-object v0, v1

    goto :goto_a
.end method

.method public abstract openStream()Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public write(Ljava/lang/CharSequence;)V
    .registers 6
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    invoke-static {}, Lcom/google/common/io/Closer;->create()Lcom/google/common/io/Closer;

    move-result-object v0

    .line 105
    .local v0, "closer":Lcom/google/common/io/Closer;
    :try_start_7
    invoke-virtual {p0}, Lcom/google/common/io/CharSink;->openStream()Ljava/io/Writer;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/common/io/Closer;->register(Ljava/io/Closeable;)Ljava/io/Closeable;

    move-result-object v2

    check-cast v2, Ljava/io/Writer;

    .line 106
    .local v2, "out":Ljava/io/Writer;
    invoke-virtual {v2, p1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 107
    invoke-virtual {v2}, Ljava/io/Writer;->flush()V
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_17} :catch_1b
    .catchall {:try_start_7 .. :try_end_17} :catchall_21

    .line 111
    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    .line 113
    return-void

    .line 108
    .end local v2    # "out":Ljava/io/Writer;
    :catch_1b
    move-exception v1

    .line 109
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_1c
    invoke-virtual {v0, v1}, Lcom/google/common/io/Closer;->rethrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3
    :try_end_21
    .catchall {:try_start_1c .. :try_end_21} :catchall_21

    .line 111
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_21
    move-exception v3

    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    throw v3
.end method

.method public writeFrom(Ljava/lang/Readable;)J
    .registers 8
    .param p1, "readable"    # Ljava/lang/Readable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    invoke-static {}, Lcom/google/common/io/Closer;->create()Lcom/google/common/io/Closer;

    move-result-object v0

    .line 163
    .local v0, "closer":Lcom/google/common/io/Closer;
    :try_start_7
    invoke-virtual {p0}, Lcom/google/common/io/CharSink;->openStream()Ljava/io/Writer;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/google/common/io/Closer;->register(Ljava/io/Closeable;)Ljava/io/Closeable;

    move-result-object v2

    check-cast v2, Ljava/io/Writer;

    .line 164
    .local v2, "out":Ljava/io/Writer;
    invoke-static {p1, v2}, Lcom/google/common/io/CharStreams;->copy(Ljava/lang/Readable;Ljava/lang/Appendable;)J

    move-result-wide v3

    .line 165
    .local v3, "written":J
    invoke-virtual {v2}, Ljava/io/Writer;->flush()V
    :try_end_18
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_18} :catch_1c
    .catchall {:try_start_7 .. :try_end_18} :catchall_22

    .line 170
    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    return-wide v3

    .line 167
    .end local v2    # "out":Ljava/io/Writer;
    .end local v3    # "written":J
    :catch_1c
    move-exception v1

    .line 168
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_1d
    invoke-virtual {v0, v1}, Lcom/google/common/io/Closer;->rethrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5
    :try_end_22
    .catchall {:try_start_1d .. :try_end_22} :catchall_22

    .line 170
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_22
    move-exception v5

    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    throw v5
.end method

.method public writeLines(Ljava/lang/Iterable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Ljava/lang/CharSequence;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    .local p1, "lines":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Ljava/lang/CharSequence;>;"
    const-string v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/common/io/CharSink;->writeLines(Ljava/lang/Iterable;Ljava/lang/String;)V

    .line 124
    return-void
.end method

.method public writeLines(Ljava/lang/Iterable;Ljava/lang/String;)V
    .registers 9
    .param p2, "lineSeparator"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Ljava/lang/CharSequence;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    .local p1, "lines":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Ljava/lang/CharSequence;>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    invoke-static {}, Lcom/google/common/io/Closer;->create()Lcom/google/common/io/Closer;

    move-result-object v0

    .line 139
    .local v0, "closer":Lcom/google/common/io/Closer;
    :try_start_a
    invoke-virtual {p0}, Lcom/google/common/io/CharSink;->openBufferedStream()Ljava/io/Writer;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/google/common/io/Closer;->register(Ljava/io/Closeable;)Ljava/io/Closeable;

    move-result-object v4

    check-cast v4, Ljava/io/Writer;

    .line 140
    .local v4, "out":Ljava/io/Writer;
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_37

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    .line 141
    .local v3, "line":Ljava/lang/CharSequence;
    invoke-virtual {v4, v3}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;
    :try_end_2b
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_2b} :catch_2c
    .catchall {:try_start_a .. :try_end_2b} :catchall_32

    goto :goto_18

    .line 144
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "line":Ljava/lang/CharSequence;
    .end local v4    # "out":Ljava/io/Writer;
    :catch_2c
    move-exception v1

    .line 145
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_2d
    invoke-virtual {v0, v1}, Lcom/google/common/io/Closer;->rethrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5
    :try_end_32
    .catchall {:try_start_2d .. :try_end_32} :catchall_32

    .line 147
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_32
    move-exception v5

    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    throw v5

    .line 143
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "out":Ljava/io/Writer;
    :cond_37
    :try_start_37
    invoke-virtual {v4}, Ljava/io/Writer;->flush()V
    :try_end_3a
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_3a} :catch_2c
    .catchall {:try_start_37 .. :try_end_3a} :catchall_32

    .line 147
    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    .line 149
    return-void
.end method
