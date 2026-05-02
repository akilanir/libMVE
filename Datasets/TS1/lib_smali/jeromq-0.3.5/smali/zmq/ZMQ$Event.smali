.class public Lzmq/ZMQ$Event;
.super Ljava/lang/Object;
.source "ZMQ.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/ZMQ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Event"
.end annotation


# static fields
.field private static final VALUE_CHANNEL:I = 0x2

.field private static final VALUE_INTEGER:I = 0x1


# instance fields
.field public final addr:Ljava/lang/String;

.field public final arg:Ljava/lang/Object;

.field public final event:I

.field private final flag:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "event"    # I
    .param p2, "addr"    # Ljava/lang/String;
    .param p3, "arg"    # Ljava/lang/Object;

    .prologue
    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    iput p1, p0, Lzmq/ZMQ$Event;->event:I

    .line 180
    iput-object p2, p0, Lzmq/ZMQ$Event;->addr:Ljava/lang/String;

    .line 181
    iput-object p3, p0, Lzmq/ZMQ$Event;->arg:Ljava/lang/Object;

    .line 182
    instance-of v0, p3, Ljava/lang/Integer;

    if-eqz v0, :cond_11

    .line 183
    const/4 v0, 0x1

    iput v0, p0, Lzmq/ZMQ$Event;->flag:I

    .line 191
    :goto_10
    return-void

    .line 185
    :cond_11
    instance-of v0, p3, Ljava/nio/channels/SelectableChannel;

    if-eqz v0, :cond_19

    .line 186
    const/4 v0, 0x2

    iput v0, p0, Lzmq/ZMQ$Event;->flag:I

    goto :goto_10

    .line 189
    :cond_19
    const/4 v0, 0x0

    iput v0, p0, Lzmq/ZMQ$Event;->flag:I

    goto :goto_10
.end method

.method public static read(Lzmq/SocketBase;)Lzmq/ZMQ$Event;
    .registers 2
    .param p0, "s"    # Lzmq/SocketBase;

    .prologue
    .line 239
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lzmq/ZMQ$Event;->read(Lzmq/SocketBase;I)Lzmq/ZMQ$Event;

    move-result-object v0

    return-object v0
.end method

.method public static read(Lzmq/SocketBase;I)Lzmq/ZMQ$Event;
    .registers 12
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "flags"    # I

    .prologue
    .line 216
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->recv(I)Lzmq/Msg;

    move-result-object v6

    .line 217
    .local v6, "msg":Lzmq/Msg;
    if-nez v6, :cond_8

    .line 218
    const/4 v7, 0x0

    .line 234
    :goto_7
    return-object v7

    .line 221
    :cond_8
    invoke-virtual {v6}, Lzmq/Msg;->buf()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 223
    .local v2, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    .line 224
    .local v3, "event":I
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    .line 225
    .local v5, "len":I
    new-array v0, v5, [B

    .line 226
    .local v0, "addr":[B
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 227
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    .line 228
    .local v4, "flag":I
    const/4 v1, 0x0

    .line 230
    .local v1, "arg":Ljava/lang/Object;
    const/4 v7, 0x1

    if-ne v4, v7, :cond_29

    .line 231
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 234
    .end local v1    # "arg":Ljava/lang/Object;
    :cond_29
    new-instance v7, Lzmq/ZMQ$Event;

    new-instance v8, Ljava/lang/String;

    sget-object v9, Lzmq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v8, v0, v9}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-direct {v7, v3, v8, v1}, Lzmq/ZMQ$Event;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    goto :goto_7
.end method


# virtual methods
.method public write(Lzmq/SocketBase;)Z
    .registers 8
    .param p1, "s"    # Lzmq/SocketBase;

    .prologue
    const/4 v5, 0x1

    .line 195
    iget-object v3, p0, Lzmq/ZMQ$Event;->addr:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x5

    add-int/lit8 v2, v3, 0x1

    .line 196
    .local v2, "size":I
    iget v3, p0, Lzmq/ZMQ$Event;->flag:I

    if-ne v3, v5, :cond_11

    .line 197
    add-int/lit8 v2, v2, 0x4

    .line 200
    :cond_11
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 201
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    iget v3, p0, Lzmq/ZMQ$Event;->event:I

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 202
    iget-object v3, p0, Lzmq/ZMQ$Event;->addr:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    int-to-byte v3, v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 203
    iget-object v3, p0, Lzmq/ZMQ$Event;->addr:Ljava/lang/String;

    sget-object v4, Lzmq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 204
    iget v3, p0, Lzmq/ZMQ$Event;->flag:I

    int-to-byte v3, v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 205
    iget v3, p0, Lzmq/ZMQ$Event;->flag:I

    if-ne v3, v5, :cond_4a

    .line 206
    iget-object v3, p0, Lzmq/ZMQ$Event;->arg:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 208
    :cond_4a
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 210
    new-instance v1, Lzmq/Msg;

    invoke-direct {v1, v0}, Lzmq/Msg;-><init>(Ljava/nio/ByteBuffer;)V

    .line 211
    .local v1, "msg":Lzmq/Msg;
    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3}, Lzmq/SocketBase;->send(Lzmq/Msg;I)Z

    move-result v3

    return v3
.end method
