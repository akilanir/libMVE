.class final Lorg/msgpack/unpacker/ByteArrayAccept;
.super Lorg/msgpack/unpacker/Accept;
.source "ByteArrayAccept.java"


# instance fields
.field value:[B


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 27
    const-string v0, "raw value"

    invoke-direct {p0, v0}, Lorg/msgpack/unpacker/Accept;-><init>(Ljava/lang/String;)V

    .line 28
    return-void
.end method


# virtual methods
.method acceptEmptyRaw()V
    .registers 2

    .prologue
    .line 37
    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/msgpack/unpacker/ByteArrayAccept;->value:[B

    .line 38
    return-void
.end method

.method acceptRaw([B)V
    .registers 2
    .param p1, "raw"    # [B

    .prologue
    .line 32
    iput-object p1, p0, Lorg/msgpack/unpacker/ByteArrayAccept;->value:[B

    .line 33
    return-void
.end method

.method public refer(Ljava/nio/ByteBuffer;Z)V
    .registers 4
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .param p2, "gift"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/msgpack/unpacker/ByteArrayAccept;->value:[B

    .line 44
    iget-object v0, p0, Lorg/msgpack/unpacker/ByteArrayAccept;->value:[B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 45
    return-void
.end method
