.class public interface abstract Lzmq/IDecoder;
.super Ljava/lang/Object;
.source "IDecoder.java"


# virtual methods
.method public abstract getBuffer()Ljava/nio/ByteBuffer;
.end method

.method public abstract processBuffer(Ljava/nio/ByteBuffer;I)I
.end method

.method public abstract setMsgSink(Lzmq/IMsgSink;)V
.end method

.method public abstract stalled()Z
.end method
