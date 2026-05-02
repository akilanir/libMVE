.class public Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;
.super Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
.source "NativeFloat64Array.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView",
        "<",
        "Ljava/lang/Double;",
        ">;"
    }
.end annotation


# static fields
.field private static final BYTES_PER_ELEMENT:I = 0x8

.field private static final CLASS_NAME:Ljava/lang/String; = "Float64Array"

.field private static final serialVersionUID:J = -0x116c18c98c4965e7L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "len"    # I

    .prologue
    .line 39
    new-instance v0, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    mul-int/lit8 v1, p1, 0x8

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;-><init>(I)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;-><init>(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)V
    .registers 5
    .param p1, "ab"    # Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 34
    mul-int/lit8 v0, p3, 0x8

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;-><init>(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;III)V

    .line 35
    return-void
.end method

.method public static init(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "sealed"    # Z

    .prologue
    .line 50
    new-instance v0, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;

    invoke-direct {v0}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;-><init>()V

    .line 51
    .local v0, "a":Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;
    const/4 v1, 0x4

    invoke-virtual {v0, v1, p1, p2}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 52
    return-void
.end method


# virtual methods
.method protected construct(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    .registers 5
    .param p1, "ab"    # Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 57
    new-instance v0, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;

    invoke-direct {v0, p1, p2, p3}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;-><init>(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)V

    return-object v0
.end method

.method public get(I)Ljava/lang/Double;
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 100
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->checkIndex(I)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 101
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 103
    :cond_c
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->js_get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    return-object v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 20
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->get(I)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method

.method public getBytesPerElement()I
    .registers 2

    .prologue
    .line 63
    const/16 v0, 0x8

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 45
    const-string v0, "Float64Array"

    return-object v0
.end method

.method protected js_get(I)Ljava/lang/Object;
    .registers 7
    .param p1, "index"    # I

    .prologue
    .line 78
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->checkIndex(I)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 79
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 82
    :goto_8
    return-object v2

    .line 81
    :cond_9
    iget-object v2, p0, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v2, v2, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    mul-int/lit8 v3, p1, 0x8

    iget v4, p0, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->offset:I

    add-int/2addr v3, v4

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lorg/mozilla/javascript/typedarrays/ByteIo;->readUint64Primitive([BIZ)J

    move-result-wide v0

    .line 82
    .local v0, "base":J
    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    goto :goto_8
.end method

.method protected js_set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "index"    # I
    .param p2, "c"    # Ljava/lang/Object;

    .prologue
    .line 88
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->checkIndex(I)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 89
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 94
    :goto_8
    return-object v4

    .line 91
    :cond_9
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    .line 92
    .local v2, "val":D
    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 93
    .local v0, "base":J
    iget-object v4, p0, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iget-object v4, v4, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->buffer:[B

    mul-int/lit8 v5, p1, 0x8

    iget v6, p0, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->offset:I

    add-int/2addr v5, v6

    const/4 v6, 0x0

    invoke-static {v4, v5, v0, v1, v6}, Lorg/mozilla/javascript/typedarrays/ByteIo;->writeUint64([BIJZ)V

    .line 94
    const/4 v4, 0x0

    goto :goto_8
.end method

.method protected realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/typedarrays/NativeTypedArrayView;
    .registers 4
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 69
    instance-of v0, p1, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;

    if-nez v0, :cond_9

    .line 70
    invoke-static {p2}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 72
    :cond_9
    check-cast p1, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;

    .end local p1    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    return-object p1
.end method

.method public set(ILjava/lang/Double;)Ljava/lang/Double;
    .registers 4
    .param p1, "i"    # I
    .param p2, "aByte"    # Ljava/lang/Double;

    .prologue
    .line 109
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->checkIndex(I)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 110
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 112
    :cond_c
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->js_set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    return-object v0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # I
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 20
    check-cast p2, Ljava/lang/Double;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/typedarrays/NativeFloat64Array;->set(ILjava/lang/Double;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method
