.class public Lzmq/Msg;
.super Ljava/lang/Object;
.source "Msg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Msg$Type;
    }
.end annotation


# static fields
.field public static final COMMAND:I = 0x2

.field public static final IDENTITY:I = 0x40

.field public static final MORE:I = 0x1

.field public static final SHARED:I = 0x80


# instance fields
.field private buf:Ljava/nio/ByteBuffer;

.field private data:[B

.field private flags:I

.field private size:I

.field private type:Lzmq/Msg$Type;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    sget-object v0, Lzmq/Msg$Type;->DATA:Lzmq/Msg$Type;

    iput-object v0, p0, Lzmq/Msg;->type:Lzmq/Msg$Type;

    .line 47
    iput v1, p0, Lzmq/Msg;->flags:I

    .line 48
    iput v1, p0, Lzmq/Msg;->size:I

    .line 49
    new-array v0, v1, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    .line 50
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    iput-object v0, p0, Lzmq/Msg;->data:[B

    .line 51
    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "capacity"    # I

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    sget-object v0, Lzmq/Msg$Type;->DATA:Lzmq/Msg$Type;

    iput-object v0, p0, Lzmq/Msg;->type:Lzmq/Msg$Type;

    .line 56
    const/4 v0, 0x0

    iput v0, p0, Lzmq/Msg;->flags:I

    .line 57
    iput p1, p0, Lzmq/Msg;->size:I

    .line 58
    new-array v0, p1, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    .line 59
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    iput-object v0, p0, Lzmq/Msg;->data:[B

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .registers 4
    .param p1, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    if-nez p1, :cond_d

    .line 77
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ByteBuffer cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_d
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    if-lez v0, :cond_1b

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ByteBuffer position is not zero, did you forget to flip it?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_1b
    sget-object v0, Lzmq/Msg$Type;->DATA:Lzmq/Msg$Type;

    iput-object v0, p0, Lzmq/Msg;->type:Lzmq/Msg$Type;

    .line 83
    const/4 v0, 0x0

    iput v0, p0, Lzmq/Msg;->flags:I

    .line 84
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    .line 85
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v0

    if-eqz v0, :cond_41

    .line 86
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    iput-object v0, p0, Lzmq/Msg;->data:[B

    .line 91
    :goto_38
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    iput v0, p0, Lzmq/Msg;->size:I

    .line 92
    return-void

    .line 89
    :cond_41
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/Msg;->data:[B

    goto :goto_38
.end method

.method public constructor <init>(Lzmq/Msg;)V
    .registers 6
    .param p1, "m"    # Lzmq/Msg;

    .prologue
    const/4 v3, 0x0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    if-nez p1, :cond_e

    .line 97
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Msg cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_e
    iget-object v0, p1, Lzmq/Msg;->type:Lzmq/Msg$Type;

    iput-object v0, p0, Lzmq/Msg;->type:Lzmq/Msg$Type;

    .line 100
    iget v0, p1, Lzmq/Msg;->flags:I

    iput v0, p0, Lzmq/Msg;->flags:I

    .line 101
    iget v0, p1, Lzmq/Msg;->size:I

    iput v0, p0, Lzmq/Msg;->size:I

    .line 102
    iget-object v0, p1, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_36

    iget-object v0, p1, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v0

    :goto_24
    iput-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    .line 103
    iget v0, p0, Lzmq/Msg;->size:I

    new-array v0, v0, [B

    iput-object v0, p0, Lzmq/Msg;->data:[B

    .line 104
    iget-object v0, p1, Lzmq/Msg;->data:[B

    iget-object v1, p0, Lzmq/Msg;->data:[B

    iget v2, p1, Lzmq/Msg;->size:I

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 105
    return-void

    .line 102
    :cond_36
    const/4 v0, 0x0

    goto :goto_24
.end method

.method public constructor <init>([B)V
    .registers 4
    .param p1, "src"    # [B

    .prologue
    const/4 v1, 0x0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    if-nez p1, :cond_8

    .line 65
    new-array p1, v1, [B

    .line 67
    :cond_8
    sget-object v0, Lzmq/Msg$Type;->DATA:Lzmq/Msg$Type;

    iput-object v0, p0, Lzmq/Msg;->type:Lzmq/Msg$Type;

    .line 68
    iput v1, p0, Lzmq/Msg;->flags:I

    .line 69
    array-length v0, p1

    iput v0, p0, Lzmq/Msg;->size:I

    .line 70
    iput-object p1, p0, Lzmq/Msg;->data:[B

    .line 71
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    .line 72
    return-void
.end method


# virtual methods
.method public buf()Ljava/nio/ByteBuffer;
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public check()Z
    .registers 2

    .prologue
    .line 119
    const/4 v0, 0x1

    return v0
.end method

.method public data()[B
    .registers 4

    .prologue
    .line 145
    iget-object v2, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 146
    iget-object v2, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    .line 147
    .local v1, "length":I
    new-array v0, v1, [B

    .line 148
    .local v0, "bytes":[B
    iget-object v2, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 151
    .end local v0    # "bytes":[B
    .end local v1    # "length":I
    :goto_19
    return-object v0

    :cond_1a
    iget-object v0, p0, Lzmq/Msg;->data:[B

    goto :goto_19
.end method

.method public flags()I
    .registers 2

    .prologue
    .line 124
    iget v0, p0, Lzmq/Msg;->flags:I

    return v0
.end method

.method public get()B
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    return v0
.end method

.method public get(I)B
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 176
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    return v0
.end method

.method public getBytes(ILjava/nio/ByteBuffer;I)I
    .registers 7
    .param p1, "index"    # I
    .param p2, "bb"    # Ljava/nio/ByteBuffer;
    .param p3, "len"    # I

    .prologue
    .line 226
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    iget v2, p0, Lzmq/Msg;->size:I

    sub-int/2addr v2, p1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 227
    .local v0, "count":I
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 228
    iget-object v1, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {p2, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 229
    return v0
.end method

.method public getBytes(I[BII)I
    .registers 8
    .param p1, "index"    # I
    .param p2, "dst"    # [B
    .param p3, "off"    # I
    .param p4, "len"    # I

    .prologue
    .line 213
    iget v2, p0, Lzmq/Msg;->size:I

    invoke-static {p4, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 214
    .local v0, "count":I
    iget-object v2, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 215
    iget-object v2, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 216
    .local v1, "dup":Ljava/nio/ByteBuffer;
    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 217
    invoke-virtual {v1, p2, p3, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 221
    .end local v1    # "dup":Ljava/nio/ByteBuffer;
    :goto_1a
    return v0

    .line 220
    :cond_1b
    iget-object v2, p0, Lzmq/Msg;->data:[B

    invoke-static {v2, p1, p2, p3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1a
.end method

.method public hasMore()Z
    .registers 2

    .prologue
    .line 129
    iget v0, p0, Lzmq/Msg;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-lez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public initDelimiter()V
    .registers 2

    .prologue
    .line 139
    sget-object v0, Lzmq/Msg$Type;->DELIMITER:Lzmq/Msg$Type;

    iput-object v0, p0, Lzmq/Msg;->type:Lzmq/Msg$Type;

    .line 140
    const/4 v0, 0x0

    iput v0, p0, Lzmq/Msg;->flags:I

    .line 141
    return-void
.end method

.method public isDelimiter()Z
    .registers 3

    .prologue
    .line 114
    iget-object v0, p0, Lzmq/Msg;->type:Lzmq/Msg$Type;

    sget-object v1, Lzmq/Msg$Type;->DELIMITER:Lzmq/Msg$Type;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isIdentity()Z
    .registers 3

    .prologue
    .line 109
    iget v0, p0, Lzmq/Msg;->flags:I

    and-int/lit8 v0, v0, 0x40

    const/16 v1, 0x40

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public put(B)Lzmq/Msg;
    .registers 3
    .param p1, "b"    # B

    .prologue
    .line 181
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 182
    return-object p0
.end method

.method public put(IB)Lzmq/Msg;
    .registers 4
    .param p1, "index"    # I
    .param p2, "b"    # B

    .prologue
    .line 187
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 188
    return-object p0
.end method

.method public put(Ljava/nio/ByteBuffer;)Lzmq/Msg;
    .registers 3
    .param p1, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 207
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 208
    return-object p0
.end method

.method public put([B)Lzmq/Msg;
    .registers 4
    .param p1, "src"    # [B

    .prologue
    .line 193
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lzmq/Msg;->put([BII)Lzmq/Msg;

    move-result-object v0

    return-object v0
.end method

.method public put([BII)Lzmq/Msg;
    .registers 5
    .param p1, "src"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 198
    if-nez p1, :cond_3

    .line 202
    :goto_2
    return-object p0

    .line 201
    :cond_3
    iget-object v0, p0, Lzmq/Msg;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    goto :goto_2
.end method

.method public resetFlags(I)V
    .registers 4
    .param p1, "f"    # I

    .prologue
    .line 166
    iget v0, p0, Lzmq/Msg;->flags:I

    xor-int/lit8 v1, p1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lzmq/Msg;->flags:I

    .line 167
    return-void
.end method

.method public setFlags(I)V
    .registers 3
    .param p1, "flags"    # I

    .prologue
    .line 134
    iget v0, p0, Lzmq/Msg;->flags:I

    or-int/2addr v0, p1

    iput v0, p0, Lzmq/Msg;->flags:I

    .line 135
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 161
    iget v0, p0, Lzmq/Msg;->size:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 235
    const-string v0, "#zmq.Msg{type=%s, size=%s, flags=%s}"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lzmq/Msg;->type:Lzmq/Msg$Type;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lzmq/Msg;->size:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget v3, p0, Lzmq/Msg;->flags:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
