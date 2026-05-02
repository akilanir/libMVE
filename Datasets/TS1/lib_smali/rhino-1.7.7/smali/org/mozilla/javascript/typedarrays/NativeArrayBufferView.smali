.class public abstract Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeArrayBufferView.java"


# static fields
.field private static final Id_buffer:I = 0x1

.field private static final Id_byteLength:I = 0x3

.field private static final Id_byteOffset:I = 0x2

.field private static final MAX_INSTANCE_ID:I = 0x3

.field private static final serialVersionUID:J = 0x5f8a921134035913L


# instance fields
.field protected final arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

.field protected final byteLength:I

.field protected final offset:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 31
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 32
    sget-object v0, Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;->EMPTY_BUFFER:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    iput-object v0, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    .line 33
    iput v1, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->offset:I

    .line 34
    iput v1, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->byteLength:I

    .line 35
    return-void
.end method

.method protected constructor <init>(Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;II)V
    .registers 4
    .param p1, "ab"    # Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .param p2, "offset"    # I
    .param p3, "byteLength"    # I

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 39
    iput p2, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->offset:I

    .line 40
    iput p3, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->byteLength:I

    .line 41
    iput-object p1, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    .line 42
    return-void
.end method

.method protected static isArg([Ljava/lang/Object;I)Z
    .registers 4
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "i"    # I

    .prologue
    .line 67
    array-length v0, p0

    if-le v0, p1, :cond_f

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p0, p1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method


# virtual methods
.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .registers 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 111
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 112
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 113
    .local v3, "s_length":I
    const/4 v4, 0x6

    if-ne v3, v4, :cond_1e

    const-string v0, "buffer"

    const/4 v2, 0x1

    .line 119
    :cond_c
    :goto_c
    if-eqz v0, :cond_17

    if-eq v0, p1, :cond_17

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_17

    const/4 v2, 0x0

    .line 123
    :cond_17
    if-nez v2, :cond_37

    .line 124
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v4

    .line 126
    :goto_1d
    return v4

    .line 114
    :cond_1e
    const/16 v4, 0xa

    if-ne v3, v4, :cond_c

    .line 115
    const/4 v4, 0x4

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 116
    .local v1, "c":I
    const/16 v4, 0x4c

    if-ne v1, v4, :cond_2f

    const-string v0, "byteLength"

    const/4 v2, 0x3

    goto :goto_c

    .line 117
    :cond_2f
    const/16 v4, 0x4f

    if-ne v1, v4, :cond_c

    const-string v0, "byteOffset"

    const/4 v2, 0x2

    goto :goto_c

    .line 126
    .end local v1    # "c":I
    :cond_37
    const/4 v4, 0x5

    invoke-static {v4, v2}, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->instanceIdInfo(II)I

    move-result v4

    goto :goto_1d
.end method

.method public getBuffer()Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    return-object v0
.end method

.method public getByteLength()I
    .registers 2

    .prologue
    .line 62
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->byteLength:I

    return v0
.end method

.method public getByteOffset()I
    .registers 2

    .prologue
    .line 55
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->offset:I

    return v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 81
    packed-switch p1, :pswitch_data_12

    .line 85
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 82
    :pswitch_8
    const-string v0, "buffer"

    goto :goto_7

    .line 83
    :pswitch_b
    const-string v0, "byteOffset"

    goto :goto_7

    .line 84
    :pswitch_e
    const-string v0, "byteLength"

    goto :goto_7

    .line 81
    nop

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_8
        :pswitch_b
        :pswitch_e
    .end packed-switch
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 92
    packed-switch p1, :pswitch_data_1a

    .line 100
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    :goto_7
    return-object v0

    .line 94
    :pswitch_8
    iget-object v0, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->arrayBuffer:Lorg/mozilla/javascript/typedarrays/NativeArrayBuffer;

    goto :goto_7

    .line 96
    :pswitch_b
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->offset:I

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_7

    .line 98
    :pswitch_12
    iget v0, p0, Lorg/mozilla/javascript/typedarrays/NativeArrayBufferView;->byteLength:I

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_7

    .line 92
    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_8
        :pswitch_b
        :pswitch_12
    .end packed-switch
.end method

.method protected getMaxInstanceId()I
    .registers 2

    .prologue
    .line 75
    const/4 v0, 0x3

    return v0
.end method
