.class public interface abstract Lorg/msgpack/io/ByteBufferOutput$ExpandBufferCallback;
.super Ljava/lang/Object;
.source "ByteBufferOutput.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/msgpack/io/ByteBufferOutput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ExpandBufferCallback"
.end annotation


# virtual methods
.method public abstract call(Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
