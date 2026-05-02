.class final Lorg/msgpack/unpacker/SkipAccept;
.super Lorg/msgpack/unpacker/Accept;
.source "SkipAccept.java"


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/msgpack/unpacker/Accept;-><init>(Ljava/lang/String;)V

    .line 26
    return-void
.end method


# virtual methods
.method acceptArray(I)V
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 78
    return-void
.end method

.method acceptBoolean(Z)V
    .registers 2
    .param p1, "v"    # Z

    .prologue
    .line 30
    return-void
.end method

.method acceptDouble(D)V
    .registers 3
    .param p1, "v"    # D

    .prologue
    .line 94
    return-void
.end method

.method acceptEmptyRaw()V
    .registers 1

    .prologue
    .line 70
    return-void
.end method

.method acceptFloat(F)V
    .registers 2
    .param p1, "v"    # F

    .prologue
    .line 90
    return-void
.end method

.method acceptInteger(B)V
    .registers 2
    .param p1, "v"    # B

    .prologue
    .line 34
    return-void
.end method

.method acceptInteger(I)V
    .registers 2
    .param p1, "v"    # I

    .prologue
    .line 42
    return-void
.end method

.method acceptInteger(J)V
    .registers 3
    .param p1, "v"    # J

    .prologue
    .line 46
    return-void
.end method

.method acceptInteger(S)V
    .registers 2
    .param p1, "v"    # S

    .prologue
    .line 38
    return-void
.end method

.method acceptMap(I)V
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 82
    return-void
.end method

.method acceptNil()V
    .registers 1

    .prologue
    .line 86
    return-void
.end method

.method acceptRaw([B)V
    .registers 2
    .param p1, "raw"    # [B

    .prologue
    .line 66
    return-void
.end method

.method acceptUnsignedInteger(B)V
    .registers 2
    .param p1, "v"    # B

    .prologue
    .line 50
    return-void
.end method

.method acceptUnsignedInteger(I)V
    .registers 2
    .param p1, "v"    # I

    .prologue
    .line 58
    return-void
.end method

.method acceptUnsignedInteger(J)V
    .registers 3
    .param p1, "v"    # J

    .prologue
    .line 62
    return-void
.end method

.method acceptUnsignedInteger(S)V
    .registers 2
    .param p1, "v"    # S

    .prologue
    .line 54
    return-void
.end method

.method public refer(Ljava/nio/ByteBuffer;Z)V
    .registers 3
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .param p2, "gift"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    return-void
.end method
