.class public final Lcom/google/common/io/CharStreams;
.super Ljava/lang/Object;
.source "CharStreams.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/io/CharStreams$NullWriter;
    }
.end annotation


# static fields
.field private static final BUF_SIZE:I = 0x800


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static asReader(Ljava/lang/Readable;)Ljava/io/Reader;
    .registers 2
    .param p0, "readable"    # Ljava/lang/Readable;

    .prologue
    .line 266
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    instance-of v0, p0, Ljava/io/Reader;

    if-eqz v0, :cond_a

    .line 268
    check-cast p0, Ljava/io/Reader;

    .line 270
    .end local p0    # "readable":Ljava/lang/Readable;
    :goto_9
    return-object p0

    .restart local p0    # "readable":Ljava/lang/Readable;
    :cond_a
    new-instance v0, Lcom/google/common/io/CharStreams$1;

    invoke-direct {v0, p0}, Lcom/google/common/io/CharStreams$1;-><init>(Ljava/lang/Readable;)V

    move-object p0, v0

    goto :goto_9
.end method

.method public static asWriter(Ljava/lang/Appendable;)Ljava/io/Writer;
    .registers 2
    .param p0, "target"    # Ljava/lang/Appendable;

    .prologue
    .line 257
    instance-of v0, p0, Ljava/io/Writer;

    if-eqz v0, :cond_7

    .line 258
    check-cast p0, Ljava/io/Writer;

    .line 260
    .end local p0    # "target":Ljava/lang/Appendable;
    :goto_6
    return-object p0

    .restart local p0    # "target":Ljava/lang/Appendable;
    :cond_7
    new-instance v0, Lcom/google/common/io/AppendableWriter;

    invoke-direct {v0, p0}, Lcom/google/common/io/AppendableWriter;-><init>(Ljava/lang/Appendable;)V

    move-object p0, v0

    goto :goto_6
.end method

.method public static copy(Ljava/lang/Readable;Ljava/lang/Appendable;)J
    .registers 7
    .param p0, "from"    # Ljava/lang/Readable;
    .param p1, "to"    # Ljava/lang/Appendable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    const/16 v3, 0x800

    invoke-static {v3}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v0

    .line 67
    .local v0, "buf":Ljava/nio/CharBuffer;
    const-wide/16 v1, 0x0

    .line 68
    .local v1, "total":J
    :goto_e
    invoke-interface {p0, v0}, Ljava/lang/Readable;->read(Ljava/nio/CharBuffer;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_25

    .line 69
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->flip()Ljava/nio/Buffer;

    .line 70
    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 71
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->remaining()I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    .line 72
    invoke-virtual {v0}, Ljava/nio/CharBuffer;->clear()Ljava/nio/Buffer;

    goto :goto_e

    .line 74
    :cond_25
    return-wide v1
.end method

.method public static nullWriter()Ljava/io/Writer;
    .registers 1

    .prologue
    .line 184
    # getter for: Lcom/google/common/io/CharStreams$NullWriter;->INSTANCE:Lcom/google/common/io/CharStreams$NullWriter;
    invoke-static {}, Lcom/google/common/io/CharStreams$NullWriter;->access$000()Lcom/google/common/io/CharStreams$NullWriter;

    move-result-object v0

    return-object v0
.end method

.method public static readLines(Ljava/lang/Readable;Lcom/google/common/io/LineProcessor;)Ljava/lang/Object;
    .registers 5
    .param p0, "readable"    # Ljava/lang/Readable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Readable;",
            "Lcom/google/common/io/LineProcessor",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    .local p1, "processor":Lcom/google/common/io/LineProcessor;, "Lcom/google/common/io/LineProcessor<TT;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    new-instance v1, Lcom/google/common/io/LineReader;

    invoke-direct {v1, p0}, Lcom/google/common/io/LineReader;-><init>(Ljava/lang/Readable;)V

    .line 143
    .local v1, "lineReader":Lcom/google/common/io/LineReader;
    :cond_b
    invoke-virtual {v1}, Lcom/google/common/io/LineReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, "line":Ljava/lang/String;
    if-eqz v0, :cond_17

    .line 144
    invoke-interface {p1, v0}, Lcom/google/common/io/LineProcessor;->processLine(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 148
    :cond_17
    invoke-interface {p1}, Lcom/google/common/io/LineProcessor;->getResult()Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static readLines(Ljava/lang/Readable;)Ljava/util/List;
    .registers 4
    .param p0, "r"    # Ljava/lang/Readable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Readable;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 118
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Lcom/google/common/io/LineReader;

    invoke-direct {v1, p0}, Lcom/google/common/io/LineReader;-><init>(Ljava/lang/Readable;)V

    .line 120
    .local v1, "lineReader":Lcom/google/common/io/LineReader;
    :goto_a
    invoke-virtual {v1}, Lcom/google/common/io/LineReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, "line":Ljava/lang/String;
    if-eqz v0, :cond_14

    .line 121
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 123
    :cond_14
    return-object v2
.end method

.method public static skipFully(Ljava/io/Reader;J)V
    .registers 9
    .param p0, "reader"    # Ljava/io/Reader;
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, 0x0

    .line 163
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    :goto_5
    cmp-long v2, p1, v4

    if-lez v2, :cond_24

    .line 165
    invoke-virtual {p0, p1, p2}, Ljava/io/Reader;->skip(J)J

    move-result-wide v0

    .line 166
    .local v0, "amt":J
    cmp-long v2, v0, v4

    if-nez v2, :cond_22

    .line 168
    invoke-virtual {p0}, Ljava/io/Reader;->read()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1e

    .line 169
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 171
    :cond_1e
    const-wide/16 v2, 0x1

    sub-long/2addr p1, v2

    goto :goto_5

    .line 173
    :cond_22
    sub-long/2addr p1, v0

    goto :goto_5

    .line 176
    .end local v0    # "amt":J
    :cond_24
    return-void
.end method

.method public static toString(Ljava/lang/Readable;)Ljava/lang/String;
    .registers 2
    .param p0, "r"    # Ljava/lang/Readable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    invoke-static {p0}, Lcom/google/common/io/CharStreams;->toStringBuilder(Ljava/lang/Readable;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static toStringBuilder(Ljava/lang/Readable;)Ljava/lang/StringBuilder;
    .registers 2
    .param p0, "r"    # Ljava/lang/Readable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-static {p0, v0}, Lcom/google/common/io/CharStreams;->copy(Ljava/lang/Readable;Ljava/lang/Appendable;)J

    .line 100
    return-object v0
.end method
