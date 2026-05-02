.class public final Lorg/apache/commons/net/io/DotTerminatedMessageWriter;
.super Ljava/io/Writer;
.source "DotTerminatedMessageWriter.java"


# static fields
.field private static final __LAST_WAS_CR_STATE:I = 0x1

.field private static final __LAST_WAS_NL_STATE:I = 0x2

.field private static final __NOTHING_SPECIAL_STATE:I


# instance fields
.field private __output:Ljava/io/Writer;

.field private __state:I


# direct methods
.method public constructor <init>(Ljava/io/Writer;)V
    .registers 3
    .param p1, "output"    # Ljava/io/Writer;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Ljava/io/Writer;-><init>(Ljava/lang/Object;)V

    .line 58
    iput-object p1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    .line 59
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__state:I

    .line 60
    return-void
.end method


# virtual methods
.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    iget-object v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 202
    :try_start_3
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    if-nez v0, :cond_9

    .line 203
    monitor-exit v1

    .line 217
    :goto_8
    return-void

    .line 206
    :cond_9
    iget v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__state:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_29

    .line 207
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/io/Writer;->write(I)V

    .line 212
    :cond_15
    :goto_15
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    const-string v2, ".\r\n"

    invoke-virtual {v0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 214
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 215
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    .line 216
    monitor-exit v1

    goto :goto_8

    :catchall_26
    move-exception v0

    monitor-exit v1
    :try_end_28
    .catchall {:try_start_3 .. :try_end_28} :catchall_26

    throw v0

    .line 208
    :cond_29
    :try_start_29
    iget v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__state:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_15

    .line 209
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    const-string v2, "\r\n"

    invoke-virtual {v0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_35
    .catchall {:try_start_29 .. :try_end_35} :catchall_26

    goto :goto_15
.end method

.method public flush()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    iget-object v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 184
    :try_start_3
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 185
    monitor-exit v1

    .line 186
    return-void

    .line 185
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public write(I)V
    .registers 6
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 77
    iget-object v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 79
    sparse-switch p1, :sswitch_data_44

    .line 99
    :cond_8
    :goto_8
    const/4 v0, 0x0

    :try_start_9
    iput v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__state:I

    .line 100
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(I)V

    .line 101
    monitor-exit v1

    :goto_11
    return-void

    .line 82
    :sswitch_12
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__state:I

    .line 83
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    const/16 v2, 0xd

    invoke-virtual {v0, v2}, Ljava/io/Writer;->write(I)V

    .line 84
    monitor-exit v1

    goto :goto_11

    .line 103
    :catchall_1e
    move-exception v0

    monitor-exit v1
    :try_end_20
    .catchall {:try_start_9 .. :try_end_20} :catchall_1e

    throw v0

    .line 86
    :sswitch_21
    :try_start_21
    iget v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__state:I

    if-eq v0, v2, :cond_2c

    .line 87
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    const/16 v2, 0xd

    invoke-virtual {v0, v2}, Ljava/io/Writer;->write(I)V

    .line 89
    :cond_2c
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/io/Writer;->write(I)V

    .line 90
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__state:I

    .line 91
    monitor-exit v1

    goto :goto_11

    .line 94
    :sswitch_38
    iget v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__state:I

    if-ne v0, v3, :cond_8

    .line 95
    iget-object v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->__output:Ljava/io/Writer;

    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/io/Writer;->write(I)V
    :try_end_43
    .catchall {:try_start_21 .. :try_end_43} :catchall_1e

    goto :goto_8

    .line 79
    :sswitch_data_44
    .sparse-switch
        0xa -> :sswitch_21
        0xd -> :sswitch_12
        0x2e -> :sswitch_38
    .end sparse-switch
.end method

.method public write(Ljava/lang/String;)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->write([C)V

    .line 154
    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .registers 5
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 169
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->write([CII)V

    .line 170
    return-void
.end method

.method public write([C)V
    .registers 4
    .param p1, "buffer"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->write([CII)V

    .line 140
    return-void
.end method

.method public write([CII)V
    .registers 8
    .param p1, "buffer"    # [C
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    iget-object v3, p0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->lock:Ljava/lang/Object;

    monitor-enter v3

    move v0, p3

    .end local p3    # "length":I
    .local v0, "length":I
    move v1, p2

    .line 122
    .end local p2    # "offset":I
    .local v1, "offset":I
    :goto_5
    add-int/lit8 p3, v0, -0x1

    .end local v0    # "length":I
    .restart local p3    # "length":I
    if-lez v0, :cond_13

    .line 123
    add-int/lit8 p2, v1, 0x1

    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    :try_start_b
    aget-char v2, p1, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;->write(I)V
    :try_end_10
    .catchall {:try_start_b .. :try_end_10} :catchall_15

    move v0, p3

    .end local p3    # "length":I
    .restart local v0    # "length":I
    move v1, p2

    .end local p2    # "offset":I
    .restart local v1    # "offset":I
    goto :goto_5

    .line 125
    .end local v0    # "length":I
    .restart local p3    # "length":I
    :cond_13
    :try_start_13
    monitor-exit v3
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_18

    .line 126
    return-void

    .line 125
    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    :catchall_15
    move-exception v2

    :goto_16
    :try_start_16
    monitor-exit v3
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    throw v2

    .end local p2    # "offset":I
    .restart local v1    # "offset":I
    :catchall_18
    move-exception v2

    move p2, v1

    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    goto :goto_16
.end method
