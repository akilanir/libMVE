.class public final Lorg/msgpack/unpacker/UnpackerStack;
.super Ljava/lang/Object;
.source "UnpackerStack.java"


# static fields
.field public static final MAX_STACK_SIZE:I = 0x80

.field private static final TYPE_ARRAY:B = 0x1t

.field private static final TYPE_INVALID:B = 0x0t

.field private static final TYPE_MAP:B = 0x2t


# instance fields
.field private counts:[I

.field private top:I

.field private types:[B


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/16 v2, 0x80

    const/4 v1, 0x0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    .line 35
    new-array v0, v2, [B

    iput-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->types:[B

    .line 36
    new-array v0, v2, [I

    iput-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->counts:[I

    .line 37
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->types:[B

    aput-byte v1, v0, v1

    .line 38
    return-void
.end method


# virtual methods
.method public checkCount()V
    .registers 3

    .prologue
    .line 56
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->counts:[I

    iget v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    aget v0, v0, v1

    if-lez v0, :cond_9

    .line 67
    :cond_8
    return-void

    .line 60
    :cond_9
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->types:[B

    iget v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    aget-byte v0, v0, v1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1a

    .line 61
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "Array is end but readArrayEnd() is not called"

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_1a
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->types:[B

    iget v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    aget-byte v0, v0, v1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_8

    .line 64
    new-instance v0, Lorg/msgpack/MessageTypeException;

    const-string v1, "Map is end but readMapEnd() is not called"

    invoke-direct {v0, v1}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 96
    const/4 v0, 0x0

    iput v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    .line 97
    return-void
.end method

.method public getDepth()I
    .registers 2

    .prologue
    .line 80
    iget v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    return v0
.end method

.method public getTopCount()I
    .registers 3

    .prologue
    .line 84
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->counts:[I

    iget v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    aget v0, v0, v1

    return v0
.end method

.method public pop()V
    .registers 2

    .prologue
    .line 76
    iget v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    .line 77
    return-void
.end method

.method public pushArray(I)V
    .registers 5
    .param p1, "size"    # I

    .prologue
    .line 41
    iget v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    .line 42
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->types:[B

    iget v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    const/4 v2, 0x1

    aput-byte v2, v0, v1

    .line 43
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->counts:[I

    iget v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    aput p1, v0, v1

    .line 44
    return-void
.end method

.method public pushMap(I)V
    .registers 5
    .param p1, "size"    # I

    .prologue
    .line 47
    iget v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    .line 48
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->types:[B

    iget v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    const/4 v2, 0x2

    aput-byte v2, v0, v1

    .line 49
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->counts:[I

    iget v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    mul-int/lit8 v2, p1, 0x2

    aput v2, v0, v1

    .line 50
    return-void
.end method

.method public reduceCount()V
    .registers 4

    .prologue
    .line 72
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->counts:[I

    iget v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    aget v2, v0, v1

    add-int/lit8 v2, v2, -0x1

    aput v2, v0, v1

    .line 73
    return-void
.end method

.method public topIsArray()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 88
    iget-object v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->types:[B

    iget v2, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    aget-byte v1, v1, v2

    if-ne v1, v0, :cond_a

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public topIsMap()Z
    .registers 3

    .prologue
    .line 92
    iget-object v0, p0, Lorg/msgpack/unpacker/UnpackerStack;->types:[B

    iget v1, p0, Lorg/msgpack/unpacker/UnpackerStack;->top:I

    aget-byte v0, v0, v1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
