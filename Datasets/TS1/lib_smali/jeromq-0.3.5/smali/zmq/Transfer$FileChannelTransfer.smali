.class public Lzmq/Transfer$FileChannelTransfer;
.super Ljava/lang/Object;
.source "Transfer.java"

# interfaces
.implements Lzmq/Transfer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Transfer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileChannelTransfer"
.end annotation


# instance fields
.field private channel:Ljava/nio/channels/FileChannel;

.field private count:J

.field private parent:Lzmq/Transfer;

.field private position:J

.field private remaining:I


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;Ljava/nio/channels/FileChannel;JJ)V
    .registers 10
    .param p1, "buf"    # Ljava/nio/ByteBuffer;
    .param p2, "channel"    # Ljava/nio/channels/FileChannel;
    .param p3, "position"    # J
    .param p5, "count"    # J

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Lzmq/Transfer$ByteBufferTransfer;

    invoke-direct {v0, p1}, Lzmq/Transfer$ByteBufferTransfer;-><init>(Ljava/nio/ByteBuffer;)V

    iput-object v0, p0, Lzmq/Transfer$FileChannelTransfer;->parent:Lzmq/Transfer;

    .line 65
    iput-object p2, p0, Lzmq/Transfer$FileChannelTransfer;->channel:Ljava/nio/channels/FileChannel;

    .line 66
    iput-wide p3, p0, Lzmq/Transfer$FileChannelTransfer;->position:J

    .line 67
    iput-wide p5, p0, Lzmq/Transfer$FileChannelTransfer;->count:J

    .line 68
    iget-object v0, p0, Lzmq/Transfer$FileChannelTransfer;->parent:Lzmq/Transfer;

    invoke-interface {v0}, Lzmq/Transfer;->remaining()I

    move-result v0

    iget-wide v1, p0, Lzmq/Transfer$FileChannelTransfer;->count:J

    long-to-int v1, v1

    add-int/2addr v0, v1

    iput v0, p0, Lzmq/Transfer$FileChannelTransfer;->remaining:I

    .line 69
    return-void
.end method


# virtual methods
.method public final remaining()I
    .registers 2

    .prologue
    .line 98
    iget v0, p0, Lzmq/Transfer$FileChannelTransfer;->remaining:I

    return v0
.end method

.method public final transferTo(Ljava/nio/channels/WritableByteChannel;)I
    .registers 11
    .param p1, "s"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    const/4 v8, 0x0

    .line 75
    .local v8, "sent":I
    iget-object v0, p0, Lzmq/Transfer$FileChannelTransfer;->parent:Lzmq/Transfer;

    invoke-interface {v0}, Lzmq/Transfer;->remaining()I

    move-result v0

    if-lez v0, :cond_f

    .line 76
    iget-object v0, p0, Lzmq/Transfer$FileChannelTransfer;->parent:Lzmq/Transfer;

    invoke-interface {v0, p1}, Lzmq/Transfer;->transferTo(Ljava/nio/channels/WritableByteChannel;)I

    move-result v8

    .line 79
    :cond_f
    iget-object v0, p0, Lzmq/Transfer$FileChannelTransfer;->parent:Lzmq/Transfer;

    invoke-interface {v0}, Lzmq/Transfer;->remaining()I

    move-result v0

    if-nez v0, :cond_2f

    .line 80
    iget-object v0, p0, Lzmq/Transfer$FileChannelTransfer;->channel:Ljava/nio/channels/FileChannel;

    iget-wide v1, p0, Lzmq/Transfer$FileChannelTransfer;->position:J

    iget-wide v3, p0, Lzmq/Transfer$FileChannelTransfer;->count:J

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    move-result-wide v6

    .line 81
    .local v6, "fileSent":J
    iget-wide v0, p0, Lzmq/Transfer$FileChannelTransfer;->position:J

    add-long/2addr v0, v6

    iput-wide v0, p0, Lzmq/Transfer$FileChannelTransfer;->position:J

    .line 82
    iget-wide v0, p0, Lzmq/Transfer$FileChannelTransfer;->count:J

    sub-long/2addr v0, v6

    iput-wide v0, p0, Lzmq/Transfer$FileChannelTransfer;->count:J

    .line 83
    int-to-long v0, v8

    add-long/2addr v0, v6

    long-to-int v8, v0

    .line 86
    .end local v6    # "fileSent":J
    :cond_2f
    iget v0, p0, Lzmq/Transfer$FileChannelTransfer;->remaining:I

    sub-int/2addr v0, v8

    iput v0, p0, Lzmq/Transfer$FileChannelTransfer;->remaining:I

    .line 88
    iget v0, p0, Lzmq/Transfer$FileChannelTransfer;->remaining:I

    if-nez v0, :cond_3d

    .line 89
    iget-object v0, p0, Lzmq/Transfer$FileChannelTransfer;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 92
    :cond_3d
    return v8
.end method
