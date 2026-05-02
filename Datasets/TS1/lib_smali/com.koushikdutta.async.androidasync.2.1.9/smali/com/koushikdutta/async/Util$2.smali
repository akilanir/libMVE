.class final Lcom/koushikdutta/async/Util$2;
.super Ljava/lang/Object;
.source "Util.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/WritableCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/Util;->pump(Ljava/io/InputStream;JLcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field allocator:Lcom/koushikdutta/async/util/Allocator;

.field pending:Lcom/koushikdutta/async/ByteBufferList;

.field totalRead:I

.field final synthetic val$ds:Lcom/koushikdutta/async/DataSink;

.field final synthetic val$is:Ljava/io/InputStream;

.field final synthetic val$max:J

.field final synthetic val$wrapper:Lcom/koushikdutta/async/callback/CompletedCallback;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/DataSink;Ljava/io/InputStream;JLcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 7

    .prologue
    .line 74
    iput-object p1, p0, Lcom/koushikdutta/async/Util$2;->val$ds:Lcom/koushikdutta/async/DataSink;

    iput-object p2, p0, Lcom/koushikdutta/async/Util$2;->val$is:Ljava/io/InputStream;

    iput-wide p3, p0, Lcom/koushikdutta/async/Util$2;->val$max:J

    iput-object p5, p0, Lcom/koushikdutta/async/Util$2;->val$wrapper:Lcom/koushikdutta/async/callback/CompletedCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const/4 v0, 0x0

    iput v0, p0, Lcom/koushikdutta/async/Util$2;->totalRead:I

    .line 82
    new-instance v0, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v0}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/Util$2;->pending:Lcom/koushikdutta/async/ByteBufferList;

    .line 83
    new-instance v0, Lcom/koushikdutta/async/util/Allocator;

    invoke-direct {v0}, Lcom/koushikdutta/async/util/Allocator;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/Util$2;->allocator:Lcom/koushikdutta/async/util/Allocator;

    return-void
.end method

.method private cleanup()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 77
    iget-object v0, p0, Lcom/koushikdutta/async/Util$2;->val$ds:Lcom/koushikdutta/async/DataSink;

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/DataSink;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 78
    iget-object v0, p0, Lcom/koushikdutta/async/Util$2;->val$ds:Lcom/koushikdutta/async/DataSink;

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/DataSink;->setWriteableCallback(Lcom/koushikdutta/async/callback/WritableCallback;)V

    .line 79
    iget-object v0, p0, Lcom/koushikdutta/async/Util$2;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v0}, Lcom/koushikdutta/async/ByteBufferList;->recycle()V

    .line 80
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/io/Closeable;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/koushikdutta/async/Util$2;->val$is:Ljava/io/InputStream;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 81
    return-void
.end method


# virtual methods
.method public onWriteable()V
    .registers 10

    .prologue
    .line 89
    :cond_0
    :try_start_0
    iget-object v5, p0, Lcom/koushikdutta/async/Util$2;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v5}, Lcom/koushikdutta/async/ByteBufferList;->hasRemaining()Z

    move-result v5

    if-nez v5, :cond_56

    .line 90
    iget-object v5, p0, Lcom/koushikdutta/async/Util$2;->allocator:Lcom/koushikdutta/async/util/Allocator;

    invoke-virtual {v5}, Lcom/koushikdutta/async/util/Allocator;->allocate()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 92
    .local v0, "b":Ljava/nio/ByteBuffer;
    iget-wide v5, p0, Lcom/koushikdutta/async/Util$2;->val$max:J

    iget v7, p0, Lcom/koushikdutta/async/Util$2;->totalRead:I

    int-to-long v7, v7

    sub-long/2addr v5, v7

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v7

    int-to-long v7, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    .line 93
    .local v3, "toRead":J
    iget-object v5, p0, Lcom/koushikdutta/async/Util$2;->val$is:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    const/4 v7, 0x0

    long-to-int v8, v3

    invoke-virtual {v5, v6, v7, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 94
    .local v2, "read":I
    const/4 v5, -0x1

    if-eq v2, v5, :cond_35

    iget v5, p0, Lcom/koushikdutta/async/Util$2;->totalRead:I

    int-to-long v5, v5

    iget-wide v7, p0, Lcom/koushikdutta/async/Util$2;->val$max:J

    cmp-long v5, v5, v7

    if-nez v5, :cond_3f

    .line 95
    :cond_35
    invoke-direct {p0}, Lcom/koushikdutta/async/Util$2;->cleanup()V

    .line 96
    iget-object v5, p0, Lcom/koushikdutta/async/Util$2;->val$wrapper:Lcom/koushikdutta/async/callback/CompletedCallback;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    .line 114
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    .end local v2    # "read":I
    .end local v3    # "toRead":J
    :goto_3e
    return-void

    .line 99
    .restart local v0    # "b":Ljava/nio/ByteBuffer;
    .restart local v2    # "read":I
    .restart local v3    # "toRead":J
    :cond_3f
    iget-object v5, p0, Lcom/koushikdutta/async/Util$2;->allocator:Lcom/koushikdutta/async/util/Allocator;

    int-to-long v6, v2

    invoke-virtual {v5, v6, v7}, Lcom/koushikdutta/async/util/Allocator;->track(J)V

    .line 100
    iget v5, p0, Lcom/koushikdutta/async/Util$2;->totalRead:I

    add-int/2addr v5, v2

    iput v5, p0, Lcom/koushikdutta/async/Util$2;->totalRead:I

    .line 101
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 102
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 103
    iget-object v5, p0, Lcom/koushikdutta/async/Util$2;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v5, v0}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 106
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    .end local v2    # "read":I
    .end local v3    # "toRead":J
    :cond_56
    iget-object v5, p0, Lcom/koushikdutta/async/Util$2;->val$ds:Lcom/koushikdutta/async/DataSink;

    iget-object v6, p0, Lcom/koushikdutta/async/Util$2;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-interface {v5, v6}, Lcom/koushikdutta/async/DataSink;->write(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 108
    iget-object v5, p0, Lcom/koushikdutta/async/Util$2;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v5}, Lcom/koushikdutta/async/ByteBufferList;->hasRemaining()Z
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_62} :catch_66

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_3e

    .line 110
    :catch_66
    move-exception v1

    .line 111
    .local v1, "e":Ljava/lang/Exception;
    invoke-direct {p0}, Lcom/koushikdutta/async/Util$2;->cleanup()V

    .line 112
    iget-object v5, p0, Lcom/koushikdutta/async/Util$2;->val$wrapper:Lcom/koushikdutta/async/callback/CompletedCallback;

    invoke-interface {v5, v1}, Lcom/koushikdutta/async/callback/CompletedCallback;->onCompleted(Ljava/lang/Exception;)V

    goto :goto_3e
.end method
