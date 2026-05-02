.class public final Lcom/google/common/io/ByteStreams;
.super Ljava/lang/Object;
.source "ByteStreams.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/io/ByteStreams$LimitedInputStream;,
        Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;,
        Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;
    }
.end annotation


# static fields
.field private static final BUF_SIZE:I = 0x1000

.field private static final NULL_OUTPUT_STREAM:Ljava/io/OutputStream;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 539
    new-instance v0, Lcom/google/common/io/ByteStreams$1;

    invoke-direct {v0}, Lcom/google/common/io/ByteStreams$1;-><init>()V

    sput-object v0, Lcom/google/common/io/ByteStreams;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asByteSink(Lcom/google/common/io/OutputSupplier;)Lcom/google/common/io/ByteSink;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/io/OutputSupplier",
            "<+",
            "Ljava/io/OutputStream;",
            ">;)",
            "Lcom/google/common/io/ByteSink;"
        }
    .end annotation

    .prologue
    .line 928
    .local p0, "supplier":Lcom/google/common/io/OutputSupplier;, "Lcom/google/common/io/OutputSupplier<+Ljava/io/OutputStream;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 929
    new-instance v0, Lcom/google/common/io/ByteStreams$4;

    invoke-direct {v0, p0}, Lcom/google/common/io/ByteStreams$4;-><init>(Lcom/google/common/io/OutputSupplier;)V

    return-object v0
.end method

.method public static asByteSource(Lcom/google/common/io/InputSupplier;)Lcom/google/common/io/ByteSource;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;)",
            "Lcom/google/common/io/ByteSource;"
        }
    .end annotation

    .prologue
    .line 903
    .local p0, "supplier":Lcom/google/common/io/InputSupplier;, "Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 904
    new-instance v0, Lcom/google/common/io/ByteStreams$3;

    invoke-direct {v0, p0}, Lcom/google/common/io/ByteStreams$3;-><init>(Lcom/google/common/io/InputSupplier;)V

    return-object v0
.end method

.method public static asByteSource([B)Lcom/google/common/io/ByteSource;
    .registers 2
    .param p0, "b"    # [B
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 93
    invoke-static {p0}, Lcom/google/common/io/ByteSource;->wrap([B)Lcom/google/common/io/ByteSource;

    move-result-object v0

    return-object v0
.end method

.method static asInputSupplier(Lcom/google/common/io/ByteSource;)Lcom/google/common/io/InputSupplier;
    .registers 2
    .param p0, "source"    # Lcom/google/common/io/ByteSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/io/InputStream;",
            ">(",
            "Lcom/google/common/io/ByteSource;",
            ")",
            "Lcom/google/common/io/InputSupplier",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 945
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/io/InputSupplier;

    return-object v0
.end method

.method static asOutputSupplier(Lcom/google/common/io/ByteSink;)Lcom/google/common/io/OutputSupplier;
    .registers 2
    .param p0, "sink"    # Lcom/google/common/io/ByteSink;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/io/OutputStream;",
            ">(",
            "Lcom/google/common/io/ByteSink;",
            ")",
            "Lcom/google/common/io/OutputSupplier",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 951
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/io/OutputSupplier;

    return-object v0
.end method

.method public static copy(Lcom/google/common/io/InputSupplier;Lcom/google/common/io/OutputSupplier;)J
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;",
            "Lcom/google/common/io/OutputSupplier",
            "<+",
            "Ljava/io/OutputStream;",
            ">;)J"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "from":Lcom/google/common/io/InputSupplier;, "Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    .local p1, "to":Lcom/google/common/io/OutputSupplier;, "Lcom/google/common/io/OutputSupplier<+Ljava/io/OutputStream;>;"
    invoke-static {p0}, Lcom/google/common/io/ByteStreams;->asByteSource(Lcom/google/common/io/InputSupplier;)Lcom/google/common/io/ByteSource;

    move-result-object v0

    invoke-static {p1}, Lcom/google/common/io/ByteStreams;->asByteSink(Lcom/google/common/io/OutputSupplier;)Lcom/google/common/io/ByteSink;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/io/ByteSource;->copyTo(Lcom/google/common/io/ByteSink;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static copy(Lcom/google/common/io/InputSupplier;Ljava/io/OutputStream;)J
    .registers 4
    .param p1, "to"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;",
            "Ljava/io/OutputStream;",
            ")J"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    .local p0, "from":Lcom/google/common/io/InputSupplier;, "Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    invoke-static {p0}, Lcom/google/common/io/ByteStreams;->asByteSource(Lcom/google/common/io/InputSupplier;)Lcom/google/common/io/ByteSource;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/common/io/ByteSource;->copyTo(Ljava/io/OutputStream;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static copy(Ljava/io/InputStream;Lcom/google/common/io/OutputSupplier;)J
    .registers 4
    .param p0, "from"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Lcom/google/common/io/OutputSupplier",
            "<+",
            "Ljava/io/OutputStream;",
            ">;)J"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    .local p1, "to":Lcom/google/common/io/OutputSupplier;, "Lcom/google/common/io/OutputSupplier<+Ljava/io/OutputStream;>;"
    invoke-static {p1}, Lcom/google/common/io/ByteStreams;->asByteSink(Lcom/google/common/io/OutputSupplier;)Lcom/google/common/io/ByteSink;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/common/io/ByteSink;->writeFrom(Ljava/io/InputStream;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .registers 8
    .param p0, "from"    # Ljava/io/InputStream;
    .param p1, "to"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    const/16 v4, 0x1000

    new-array v0, v4, [B

    .line 167
    .local v0, "buf":[B
    const-wide/16 v2, 0x0

    .line 169
    .local v2, "total":J
    :goto_c
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 170
    .local v1, "r":I
    const/4 v4, -0x1

    if-ne v1, v4, :cond_14

    .line 176
    return-wide v2

    .line 173
    :cond_14
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 174
    int-to-long v4, v1

    add-long/2addr v2, v4

    .line 175
    goto :goto_c
.end method

.method public static copy(Ljava/nio/channels/ReadableByteChannel;Ljava/nio/channels/WritableByteChannel;)J
    .registers 7
    .param p0, "from"    # Ljava/nio/channels/ReadableByteChannel;
    .param p1, "to"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    const/16 v3, 0x1000

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 193
    .local v0, "buf":Ljava/nio/ByteBuffer;
    const-wide/16 v1, 0x0

    .line 194
    .local v1, "total":J
    :goto_e
    invoke-interface {p0, v0}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_29

    .line 195
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 196
    :goto_18
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_25

    .line 197
    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    goto :goto_18

    .line 199
    :cond_25
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    goto :goto_e

    .line 201
    :cond_29
    return-wide v1
.end method

.method public static equal(Lcom/google/common/io/InputSupplier;Lcom/google/common/io/InputSupplier;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 661
    .local p0, "supplier1":Lcom/google/common/io/InputSupplier;, "Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    .local p1, "supplier2":Lcom/google/common/io/InputSupplier;, "Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    invoke-static {p0}, Lcom/google/common/io/ByteStreams;->asByteSource(Lcom/google/common/io/InputSupplier;)Lcom/google/common/io/ByteSource;

    move-result-object v0

    invoke-static {p1}, Lcom/google/common/io/ByteStreams;->asByteSource(Lcom/google/common/io/InputSupplier;)Lcom/google/common/io/ByteSource;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/io/ByteSource;->contentEquals(Lcom/google/common/io/ByteSource;)Z

    move-result v0

    return v0
.end method

.method public static hash(Lcom/google/common/io/InputSupplier;Lcom/google/common/hash/HashFunction;)Lcom/google/common/hash/HashCode;
    .registers 3
    .param p1, "hashFunction"    # Lcom/google/common/hash/HashFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;",
            "Lcom/google/common/hash/HashFunction;",
            ")",
            "Lcom/google/common/hash/HashCode;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 792
    .local p0, "supplier":Lcom/google/common/io/InputSupplier;, "Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    invoke-static {p0}, Lcom/google/common/io/ByteStreams;->asByteSource(Lcom/google/common/io/InputSupplier;)Lcom/google/common/io/ByteSource;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/common/io/ByteSource;->hash(Lcom/google/common/hash/HashFunction;)Lcom/google/common/hash/HashCode;

    move-result-object v0

    return-object v0
.end method

.method public static join(Ljava/lang/Iterable;)Lcom/google/common/io/InputSupplier;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;>;)",
            "Lcom/google/common/io/InputSupplier",
            "<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 872
    .local p0, "suppliers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 873
    new-instance v1, Lcom/google/common/io/ByteStreams$2;

    invoke-direct {v1}, Lcom/google/common/io/ByteStreams$2;-><init>()V

    invoke-static {p0, v1}, Lcom/google/common/collect/Iterables;->transform(Ljava/lang/Iterable;Lcom/google/common/base/Function;)Ljava/lang/Iterable;

    move-result-object v0

    .line 880
    .local v0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/common/io/ByteSource;>;"
    invoke-static {v0}, Lcom/google/common/io/ByteSource;->concat(Ljava/lang/Iterable;)Lcom/google/common/io/ByteSource;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/io/ByteStreams;->asInputSupplier(Lcom/google/common/io/ByteSource;)Lcom/google/common/io/InputSupplier;

    move-result-object v1

    return-object v1
.end method

.method public static varargs join([Lcom/google/common/io/InputSupplier;)Lcom/google/common/io/InputSupplier;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;)",
            "Lcom/google/common/io/InputSupplier",
            "<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 887
    .local p0, "suppliers":[Lcom/google/common/io/InputSupplier;, "[Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/io/ByteStreams;->join(Ljava/lang/Iterable;)Lcom/google/common/io/InputSupplier;

    move-result-object v0

    return-object v0
.end method

.method public static length(Lcom/google/common/io/InputSupplier;)J
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;)J"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 651
    .local p0, "supplier":Lcom/google/common/io/InputSupplier;, "Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    invoke-static {p0}, Lcom/google/common/io/ByteStreams;->asByteSource(Lcom/google/common/io/InputSupplier;)Lcom/google/common/io/ByteSource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/io/ByteSource;->size()J

    move-result-wide v0

    return-wide v0
.end method

.method public static limit(Ljava/io/InputStream;J)Ljava/io/InputStream;
    .registers 4
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "limit"    # J

    .prologue
    .line 578
    new-instance v0, Lcom/google/common/io/ByteStreams$LimitedInputStream;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/common/io/ByteStreams$LimitedInputStream;-><init>(Ljava/io/InputStream;J)V

    return-object v0
.end method

.method public static newDataInput([B)Lcom/google/common/io/ByteArrayDataInput;
    .registers 2
    .param p0, "bytes"    # [B

    .prologue
    .line 234
    new-instance v0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;

    invoke-direct {v0, p0}, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;-><init>([B)V

    return-object v0
.end method

.method public static newDataInput([BI)Lcom/google/common/io/ByteArrayDataInput;
    .registers 3
    .param p0, "bytes"    # [B
    .param p1, "start"    # I

    .prologue
    .line 245
    array-length v0, p0

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndex(II)I

    .line 246
    new-instance v0, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;

    invoke-direct {v0, p0, p1}, Lcom/google/common/io/ByteStreams$ByteArrayDataInputStream;-><init>([BI)V

    return-object v0
.end method

.method public static newDataOutput()Lcom/google/common/io/ByteArrayDataOutput;
    .registers 1

    .prologue
    .line 388
    new-instance v0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;

    invoke-direct {v0}, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;-><init>()V

    return-object v0
.end method

.method public static newDataOutput(I)Lcom/google/common/io/ByteArrayDataOutput;
    .registers 6
    .param p0, "size"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 398
    if-ltz p0, :cond_18

    move v0, v1

    :goto_5
    const-string v3, "Invalid size: %s"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 399
    new-instance v0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;

    invoke-direct {v0, p0}, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;-><init>(I)V

    return-object v0

    :cond_18
    move v0, v2

    .line 398
    goto :goto_5
.end method

.method public static newInputStreamSupplier([B)Lcom/google/common/io/InputSupplier;
    .registers 2
    .param p0, "b"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Lcom/google/common/io/InputSupplier",
            "<",
            "Ljava/io/ByteArrayInputStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    invoke-static {p0}, Lcom/google/common/io/ByteSource;->wrap([B)Lcom/google/common/io/ByteSource;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/io/ByteStreams;->asInputSupplier(Lcom/google/common/io/ByteSource;)Lcom/google/common/io/InputSupplier;

    move-result-object v0

    return-object v0
.end method

.method public static newInputStreamSupplier([BII)Lcom/google/common/io/InputSupplier;
    .registers 8
    .param p0, "b"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII)",
            "Lcom/google/common/io/InputSupplier",
            "<",
            "Ljava/io/ByteArrayInputStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    invoke-static {p0}, Lcom/google/common/io/ByteSource;->wrap([B)Lcom/google/common/io/ByteSource;

    move-result-object v0

    int-to-long v1, p1

    int-to-long v3, p2

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/common/io/ByteSource;->slice(JJ)Lcom/google/common/io/ByteSource;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/io/ByteStreams;->asInputSupplier(Lcom/google/common/io/ByteSource;)Lcom/google/common/io/InputSupplier;

    move-result-object v0

    return-object v0
.end method

.method public static nullOutputStream()Ljava/io/OutputStream;
    .registers 1

    .prologue
    .line 565
    sget-object v0, Lcom/google/common/io/ByteStreams;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-object v0
.end method

.method public static read(Ljava/io/InputStream;[BII)I
    .registers 8
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 821
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 822
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 823
    if-gez p3, :cond_10

    .line 824
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    const-string v3, "len is negative"

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 826
    :cond_10
    const/4 v1, 0x0

    .line 827
    .local v1, "total":I
    :goto_11
    if-ge v1, p3, :cond_1e

    .line 828
    add-int v2, p2, v1

    sub-int v3, p3, v1

    invoke-virtual {p0, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 829
    .local v0, "result":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_1f

    .line 834
    .end local v0    # "result":I
    :cond_1e
    return v1

    .line 832
    .restart local v0    # "result":I
    :cond_1f
    add-int/2addr v1, v0

    .line 833
    goto :goto_11
.end method

.method public static readBytes(Lcom/google/common/io/InputSupplier;Lcom/google/common/io/ByteProcessor;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;",
            "Lcom/google/common/io/ByteProcessor",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 743
    .local p0, "supplier":Lcom/google/common/io/InputSupplier;, "Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    .local p1, "processor":Lcom/google/common/io/ByteProcessor;, "Lcom/google/common/io/ByteProcessor<TT;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 744
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 746
    invoke-static {}, Lcom/google/common/io/Closer;->create()Lcom/google/common/io/Closer;

    move-result-object v0

    .line 748
    .local v0, "closer":Lcom/google/common/io/Closer;
    :try_start_a
    invoke-interface {p0}, Lcom/google/common/io/InputSupplier;->getInput()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/Closeable;

    invoke-virtual {v0, v3}, Lcom/google/common/io/Closer;->register(Ljava/io/Closeable;)Ljava/io/Closeable;

    move-result-object v2

    check-cast v2, Ljava/io/InputStream;

    .line 749
    .local v2, "in":Ljava/io/InputStream;
    invoke-static {v2, p1}, Lcom/google/common/io/ByteStreams;->readBytes(Ljava/io/InputStream;Lcom/google/common/io/ByteProcessor;)Ljava/lang/Object;
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_19} :catch_1e
    .catchall {:try_start_a .. :try_end_19} :catchall_24

    move-result-object v3

    .line 753
    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    return-object v3

    .line 750
    .end local v2    # "in":Ljava/io/InputStream;
    :catch_1e
    move-exception v1

    .line 751
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_1f
    invoke-virtual {v0, v1}, Lcom/google/common/io/Closer;->rethrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3
    :try_end_24
    .catchall {:try_start_1f .. :try_end_24} :catchall_24

    .line 753
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_24
    move-exception v3

    invoke-virtual {v0}, Lcom/google/common/io/Closer;->close()V

    throw v3
.end method

.method public static readBytes(Ljava/io/InputStream;Lcom/google/common/io/ByteProcessor;)Ljava/lang/Object;
    .registers 5
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Lcom/google/common/io/ByteProcessor",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 768
    .local p1, "processor":Lcom/google/common/io/ByteProcessor;, "Lcom/google/common/io/ByteProcessor<TT;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 769
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 771
    const/16 v2, 0x1000

    new-array v0, v2, [B

    .line 774
    .local v0, "buf":[B
    :cond_a
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 775
    .local v1, "read":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_18

    const/4 v2, 0x0

    invoke-interface {p1, v0, v2, v1}, Lcom/google/common/io/ByteProcessor;->processBytes([BII)Z

    move-result v2

    if-nez v2, :cond_a

    .line 776
    :cond_18
    invoke-interface {p1}, Lcom/google/common/io/ByteProcessor;->getResult()Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public static readFully(Ljava/io/InputStream;[B)V
    .registers 4
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 676
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p0, p1, v0, v1}, Lcom/google/common/io/ByteStreams;->readFully(Ljava/io/InputStream;[BII)V

    .line 677
    return-void
.end method

.method public static readFully(Ljava/io/InputStream;[BII)V
    .registers 8
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 695
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/io/ByteStreams;->read(Ljava/io/InputStream;[BII)I

    move-result v0

    .line 696
    .local v0, "read":I
    if-eq v0, p3, :cond_2f

    .line 697
    new-instance v1, Ljava/io/EOFException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "reached end of stream after reading "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes; "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes expected"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 700
    :cond_2f
    return-void
.end method

.method public static skipFully(Ljava/io/InputStream;J)V
    .registers 13
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    .line 715
    move-wide v4, p1

    .line 716
    .local v4, "toSkip":J
    :goto_3
    cmp-long v6, p1, v8

    if-lez v6, :cond_47

    .line 717
    invoke-virtual {p0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 718
    .local v0, "amt":J
    cmp-long v6, v0, v8

    if-nez v6, :cond_45

    .line 720
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_41

    .line 721
    sub-long v2, v4, p1

    .line 722
    .local v2, "skipped":J
    new-instance v6, Ljava/io/EOFException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "reached end of stream after skipping "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " bytes; "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " bytes expected"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 725
    .end local v2    # "skipped":J
    :cond_41
    const-wide/16 v6, 0x1

    sub-long/2addr p1, v6

    goto :goto_3

    .line 727
    :cond_45
    sub-long/2addr p1, v0

    goto :goto_3

    .line 730
    .end local v0    # "amt":J
    :cond_47
    return-void
.end method

.method public static slice(Lcom/google/common/io/InputSupplier;JJ)Lcom/google/common/io/InputSupplier;
    .registers 6
    .param p1, "offset"    # J
    .param p3, "length"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;JJ)",
            "Lcom/google/common/io/InputSupplier",
            "<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .prologue
    .line 852
    .local p0, "supplier":Lcom/google/common/io/InputSupplier;, "Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    invoke-static {p0}, Lcom/google/common/io/ByteStreams;->asByteSource(Lcom/google/common/io/InputSupplier;)Lcom/google/common/io/ByteSource;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/common/io/ByteSource;->slice(JJ)Lcom/google/common/io/ByteSource;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/io/ByteStreams;->asInputSupplier(Lcom/google/common/io/ByteSource;)Lcom/google/common/io/InputSupplier;

    move-result-object v0

    return-object v0
.end method

.method public static toByteArray(Lcom/google/common/io/InputSupplier;)[B
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/io/InputSupplier",
            "<+",
            "Ljava/io/InputStream;",
            ">;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    .local p0, "supplier":Lcom/google/common/io/InputSupplier;, "Lcom/google/common/io/InputSupplier<+Ljava/io/InputStream;>;"
    invoke-static {p0}, Lcom/google/common/io/ByteStreams;->asByteSource(Lcom/google/common/io/InputSupplier;)Lcom/google/common/io/ByteSource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/io/ByteSource;->read()[B

    move-result-object v0

    return-object v0
.end method

.method public static toByteArray(Ljava/io/InputStream;)[B
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 213
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 214
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    invoke-static {p0, v0}, Lcom/google/common/io/ByteStreams;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 215
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static write([BLcom/google/common/io/OutputSupplier;)V
    .registers 3
    .param p0, "from"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Lcom/google/common/io/OutputSupplier",
            "<+",
            "Ljava/io/OutputStream;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    .local p1, "to":Lcom/google/common/io/OutputSupplier;, "Lcom/google/common/io/OutputSupplier<+Ljava/io/OutputStream;>;"
    invoke-static {p1}, Lcom/google/common/io/ByteStreams;->asByteSink(Lcom/google/common/io/OutputSupplier;)Lcom/google/common/io/ByteSink;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/common/io/ByteSink;->write([B)V

    .line 106
    return-void
.end method
