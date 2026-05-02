.class final Lorg/msgpack/unpacker/IntAccept;
.super Lorg/msgpack/unpacker/Accept;
.source "IntAccept.java"


# instance fields
.field value:I


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 26
    const-string v0, "integer"

    invoke-direct {p0, v0}, Lorg/msgpack/unpacker/Accept;-><init>(Ljava/lang/String;)V

    .line 27
    return-void
.end method


# virtual methods
.method acceptInteger(B)V
    .registers 2
    .param p1, "v"    # B

    .prologue
    .line 31
    iput p1, p0, Lorg/msgpack/unpacker/IntAccept;->value:I

    .line 32
    return-void
.end method

.method acceptInteger(I)V
    .registers 2
    .param p1, "v"    # I

    .prologue
    .line 41
    iput p1, p0, Lorg/msgpack/unpacker/IntAccept;->value:I

    .line 42
    return-void
.end method

.method acceptInteger(J)V
    .registers 5
    .param p1, "v"    # J

    .prologue
    .line 46
    const-wide/32 v0, -0x80000000

    cmp-long v0, p1, v0

    if-ltz v0, :cond_e

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-lez v0, :cond_14

    .line 47
    :cond_e
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0

    .line 49
    :cond_14
    long-to-int v0, p1

    iput v0, p0, Lorg/msgpack/unpacker/IntAccept;->value:I

    .line 50
    return-void
.end method

.method acceptInteger(S)V
    .registers 2
    .param p1, "v"    # S

    .prologue
    .line 36
    iput p1, p0, Lorg/msgpack/unpacker/IntAccept;->value:I

    .line 37
    return-void
.end method

.method acceptUnsignedInteger(B)V
    .registers 3
    .param p1, "v"    # B

    .prologue
    .line 54
    and-int/lit16 v0, p1, 0xff

    iput v0, p0, Lorg/msgpack/unpacker/IntAccept;->value:I

    .line 55
    return-void
.end method

.method acceptUnsignedInteger(I)V
    .registers 3
    .param p1, "v"    # I

    .prologue
    .line 64
    if-gez p1, :cond_8

    .line 65
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0

    .line 67
    :cond_8
    iput p1, p0, Lorg/msgpack/unpacker/IntAccept;->value:I

    .line 68
    return-void
.end method

.method acceptUnsignedInteger(J)V
    .registers 5
    .param p1, "v"    # J

    .prologue
    .line 72
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_d

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-lez v0, :cond_13

    .line 73
    :cond_d
    new-instance v0, Lorg/msgpack/MessageTypeException;

    invoke-direct {v0}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v0

    .line 75
    :cond_13
    long-to-int v0, p1

    iput v0, p0, Lorg/msgpack/unpacker/IntAccept;->value:I

    .line 76
    return-void
.end method

.method acceptUnsignedInteger(S)V
    .registers 3
    .param p1, "v"    # S

    .prologue
    .line 59
    const v0, 0xffff

    and-int/2addr v0, p1

    iput v0, p0, Lorg/msgpack/unpacker/IntAccept;->value:I

    .line 60
    return-void
.end method
