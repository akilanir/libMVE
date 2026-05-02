.class public Lzmq/Transfer$ByteBufferTransfer;
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
    name = "ByteBufferTransfer"
.end annotation


# instance fields
.field private buf:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .registers 2
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lzmq/Transfer$ByteBufferTransfer;->buf:Ljava/nio/ByteBuffer;

    .line 39
    return-void
.end method


# virtual methods
.method public final remaining()I
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lzmq/Transfer$ByteBufferTransfer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    return v0
.end method

.method public final transferTo(Ljava/nio/channels/WritableByteChannel;)I
    .registers 3
    .param p1, "s"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lzmq/Transfer$ByteBufferTransfer;->buf:Ljava/nio/ByteBuffer;

    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v0

    return v0
.end method
