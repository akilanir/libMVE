.class public interface abstract Lorg/msgpack/MessagePackable;
.super Ljava/lang/Object;
.source "MessagePackable.java"


# virtual methods
.method public abstract readFrom(Lorg/msgpack/unpacker/Unpacker;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeTo(Lorg/msgpack/packer/Packer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
