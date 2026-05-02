.class public interface abstract Lzmq/Transfer;
.super Ljava/lang/Object;
.source "Transfer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Transfer$FileChannelTransfer;,
        Lzmq/Transfer$ByteBufferTransfer;
    }
.end annotation


# virtual methods
.method public abstract remaining()I
.end method

.method public abstract transferTo(Ljava/nio/channels/WritableByteChannel;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
