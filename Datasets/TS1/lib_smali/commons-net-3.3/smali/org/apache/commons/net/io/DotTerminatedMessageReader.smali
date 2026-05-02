.class public final Lorg/apache/commons/net/io/DotTerminatedMessageReader;
.super Ljava/io/BufferedReader;
.source "DotTerminatedMessageReader.java"


# static fields
.field private static final CR:C = '\r'

.field private static final DOT:I = 0x2e

.field private static final LF:C = '\n'


# instance fields
.field private atBeginning:Z

.field private eof:Z

.field private seenCR:Z


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    .line 61
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
    .line 210
    iget-object v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 212
    :try_start_3
    iget-boolean v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    if-nez v0, :cond_e

    .line 214
    :cond_7
    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->read()I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_7

    .line 219
    :cond_e
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    .line 220
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    .line 221
    monitor-exit v1

    .line 222
    return-void

    .line 221
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_16

    throw v0
.end method

.method public read()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0xa

    const/16 v2, 0x2e

    const/4 v1, -0x1

    .line 77
    iget-object v3, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->lock:Ljava/lang/Object;

    monitor-enter v3

    .line 78
    :try_start_8
    iget-boolean v4, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    if-eqz v4, :cond_f

    .line 79
    monitor-exit v3

    move v0, v1

    .line 131
    :goto_e
    return v0

    .line 81
    :cond_f
    invoke-super {p0}, Ljava/io/BufferedReader;->read()I

    move-result v0

    .line 82
    .local v0, "chint":I
    if-ne v0, v1, :cond_1b

    .line 83
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    .line 84
    monitor-exit v3

    move v0, v1

    goto :goto_e

    .line 86
    :cond_1b
    iget-boolean v4, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    if-eqz v4, :cond_5c

    .line 87
    const/4 v4, 0x0

    iput-boolean v4, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    .line 88
    if-ne v0, v2, :cond_5c

    .line 89
    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->mark(I)V

    .line 90
    invoke-super {p0}, Ljava/io/BufferedReader;->read()I

    move-result v0

    .line 91
    if-ne v0, v1, :cond_34

    .line 93
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    .line 94
    monitor-exit v3

    move v0, v2

    goto :goto_e

    .line 96
    :cond_34
    if-ne v0, v2, :cond_3b

    .line 98
    monitor-exit v3

    goto :goto_e

    .line 132
    .end local v0    # "chint":I
    :catchall_38
    move-exception v1

    monitor-exit v3
    :try_end_3a
    .catchall {:try_start_8 .. :try_end_3a} :catchall_38

    throw v1

    .line 100
    .restart local v0    # "chint":I
    :cond_3b
    const/16 v4, 0xd

    if-ne v0, v4, :cond_56

    .line 101
    :try_start_3f
    invoke-super {p0}, Ljava/io/BufferedReader;->read()I

    move-result v0

    .line 102
    if-ne v0, v1, :cond_4b

    .line 104
    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->reset()V

    .line 105
    monitor-exit v3

    move v0, v2

    goto :goto_e

    .line 107
    :cond_4b
    if-ne v0, v5, :cond_56

    .line 108
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    .line 109
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->eof:Z

    .line 111
    monitor-exit v3

    move v0, v1

    goto :goto_e

    .line 116
    :cond_56
    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->reset()V

    .line 117
    monitor-exit v3

    move v0, v2

    goto :goto_e

    .line 122
    :cond_5c
    iget-boolean v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->seenCR:Z

    if-eqz v1, :cond_68

    .line 123
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->seenCR:Z

    .line 124
    if-ne v0, v5, :cond_68

    .line 125
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    .line 128
    :cond_68
    const/16 v1, 0xd

    if-ne v0, v1, :cond_6f

    .line 129
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->seenCR:Z

    .line 131
    :cond_6f
    monitor-exit v3
    :try_end_70
    .catchall {:try_start_3f .. :try_end_70} :catchall_38

    goto :goto_e
.end method

.method public read([C)I
    .registers 4
    .param p1, "buffer"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->read([CII)I

    move-result v0

    return v0
.end method

.method public read([CII)I
    .registers 10
    .param p1, "buffer"    # [C
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 169
    const/4 v4, 0x1

    if-ge p3, v4, :cond_6

    .line 171
    const/4 v3, 0x0

    .line 189
    :goto_5
    return v3

    .line 174
    :cond_6
    iget-object v4, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->lock:Ljava/lang/Object;

    monitor-enter v4

    .line 176
    :try_start_9
    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->read()I

    move-result v0

    .local v0, "ch":I
    if-ne v0, v3, :cond_14

    .line 178
    monitor-exit v4

    goto :goto_5

    .line 190
    .end local v0    # "ch":I
    :catchall_11
    move-exception v3

    monitor-exit v4
    :try_end_13
    .catchall {:try_start_9 .. :try_end_13} :catchall_11

    throw v3

    .line 181
    .restart local v0    # "ch":I
    :cond_14
    move v1, p2

    .local v1, "off":I
    move v2, p2

    .line 185
    .end local p2    # "offset":I
    .local v2, "offset":I
    :goto_16
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "offset":I
    .restart local p2    # "offset":I
    int-to-char v5, v0

    :try_start_19
    aput-char v5, p1, v2

    .line 187
    add-int/lit8 p3, p3, -0x1

    if-lez p3, :cond_25

    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->read()I

    move-result v0

    if-ne v0, v3, :cond_29

    .line 189
    :cond_25
    sub-int v3, p2, v1

    monitor-exit v4
    :try_end_28
    .catchall {:try_start_19 .. :try_end_28} :catchall_11

    goto :goto_5

    :cond_29
    move v2, p2

    .end local p2    # "offset":I
    .restart local v2    # "offset":I
    goto :goto_16
.end method

.method public readLine()Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 234
    .local v1, "sb":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->lock:Ljava/lang/Object;

    monitor-enter v4

    .line 235
    :goto_8
    :try_start_8
    invoke-virtual {p0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->read()I

    move-result v0

    .local v0, "intch":I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_2c

    .line 237
    const/16 v3, 0xa

    if-ne v0, v3, :cond_24

    iget-boolean v3, p0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;->atBeginning:Z

    if-eqz v3, :cond_24

    .line 238
    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v1, v3, v5}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v2

    monitor-exit v4

    .line 249
    :cond_23
    :goto_23
    return-object v2

    .line 240
    :cond_24
    int-to-char v3, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_8

    .line 242
    .end local v0    # "intch":I
    :catchall_29
    move-exception v3

    monitor-exit v4
    :try_end_2b
    .catchall {:try_start_8 .. :try_end_2b} :catchall_29

    throw v3

    .restart local v0    # "intch":I
    :cond_2c
    :try_start_2c
    monitor-exit v4
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_29

    .line 243
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 244
    .local v2, "string":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_23

    .line 245
    const/4 v2, 0x0

    goto :goto_23
.end method
