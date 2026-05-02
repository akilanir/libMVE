.class abstract Lorg/msgpack/io/AbstractInput;
.super Ljava/lang/Object;
.source "AbstractInput.java"

# interfaces
.implements Lorg/msgpack/io/Input;


# instance fields
.field private readByteCount:I


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput v0, p0, Lorg/msgpack/io/AbstractInput;->readByteCount:I

    return-void
.end method


# virtual methods
.method public getReadByteCount()I
    .registers 2

    .prologue
    .line 25
    iget v0, p0, Lorg/msgpack/io/AbstractInput;->readByteCount:I

    return v0
.end method

.method protected final incrReadByteCount(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 33
    iget v0, p0, Lorg/msgpack/io/AbstractInput;->readByteCount:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/msgpack/io/AbstractInput;->readByteCount:I

    .line 34
    return-void
.end method

.method protected final incrReadOneByteCount()V
    .registers 2

    .prologue
    .line 37
    iget v0, p0, Lorg/msgpack/io/AbstractInput;->readByteCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/msgpack/io/AbstractInput;->readByteCount:I

    .line 38
    return-void
.end method

.method public resetReadByteCount()V
    .registers 2

    .prologue
    .line 29
    const/4 v0, 0x0

    iput v0, p0, Lorg/msgpack/io/AbstractInput;->readByteCount:I

    .line 30
    return-void
.end method
