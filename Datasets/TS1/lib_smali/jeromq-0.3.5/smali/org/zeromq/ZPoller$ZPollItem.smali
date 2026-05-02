.class public Lorg/zeromq/ZPoller$ZPollItem;
.super Lorg/zeromq/ZMQ$PollItem;
.source "ZPoller.java"

# interfaces
.implements Lorg/zeromq/ZPoller$ItemHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZPoller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ZPollItem"
.end annotation


# instance fields
.field private final handler:Lorg/zeromq/ZPoller$EventsHandler;


# direct methods
.method public constructor <init>(Ljava/nio/channels/SelectableChannel;Lorg/zeromq/ZPoller$EventsHandler;I)V
    .registers 4
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "handler"    # Lorg/zeromq/ZPoller$EventsHandler;
    .param p3, "ops"    # I

    .prologue
    .line 147
    invoke-direct {p0, p1, p3}, Lorg/zeromq/ZMQ$PollItem;-><init>(Ljava/nio/channels/SelectableChannel;I)V

    .line 148
    iput-object p2, p0, Lorg/zeromq/ZPoller$ZPollItem;->handler:Lorg/zeromq/ZPoller$EventsHandler;

    .line 149
    return-void
.end method

.method public constructor <init>(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller$EventsHandler;I)V
    .registers 4
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "handler"    # Lorg/zeromq/ZPoller$EventsHandler;
    .param p3, "ops"    # I

    .prologue
    .line 141
    invoke-direct {p0, p1, p3}, Lorg/zeromq/ZMQ$PollItem;-><init>(Lorg/zeromq/ZMQ$Socket;I)V

    .line 142
    iput-object p2, p0, Lorg/zeromq/ZPoller$ZPollItem;->handler:Lorg/zeromq/ZPoller$EventsHandler;

    .line 143
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 178
    if-ne p0, p1, :cond_5

    .line 220
    :cond_4
    :goto_4
    return v1

    .line 181
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 182
    goto :goto_4

    .line 184
    :cond_9
    instance-of v3, p1, Lorg/zeromq/ZPoller$ItemHolder;

    if-nez v3, :cond_f

    move v1, v2

    .line 185
    goto :goto_4

    :cond_f
    move-object v0, p1

    .line 187
    check-cast v0, Lorg/zeromq/ZPoller$ItemHolder;

    .line 188
    .local v0, "other":Lorg/zeromq/ZPoller$ItemHolder;
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->item()Lzmq/PollItem;

    move-result-object v3

    if-nez v3, :cond_20

    .line 189
    invoke-interface {v0}, Lorg/zeromq/ZPoller$ItemHolder;->item()Lzmq/PollItem;

    move-result-object v3

    if-eqz v3, :cond_30

    move v1, v2

    .line 190
    goto :goto_4

    .line 193
    :cond_20
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->item()Lzmq/PollItem;

    move-result-object v3

    invoke-interface {v0}, Lorg/zeromq/ZPoller$ItemHolder;->item()Lzmq/PollItem;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_30

    move v1, v2

    .line 194
    goto :goto_4

    .line 196
    :cond_30
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->item()Lzmq/PollItem;

    move-result-object v3

    invoke-virtual {v3}, Lzmq/PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v3

    if-nez v3, :cond_46

    .line 197
    invoke-interface {v0}, Lorg/zeromq/ZPoller$ItemHolder;->item()Lzmq/PollItem;

    move-result-object v3

    invoke-virtual {v3}, Lzmq/PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v3

    if-eqz v3, :cond_5e

    move v1, v2

    .line 198
    goto :goto_4

    .line 201
    :cond_46
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->item()Lzmq/PollItem;

    move-result-object v3

    invoke-virtual {v3}, Lzmq/PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v3

    invoke-interface {v0}, Lorg/zeromq/ZPoller$ItemHolder;->item()Lzmq/PollItem;

    move-result-object v4

    invoke-virtual {v4}, Lzmq/PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5e

    move v1, v2

    .line 202
    goto :goto_4

    .line 204
    :cond_5e
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->socket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v3

    if-nez v3, :cond_6c

    .line 205
    invoke-interface {v0}, Lorg/zeromq/ZPoller$ItemHolder;->socket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v3

    if-eqz v3, :cond_7c

    move v1, v2

    .line 206
    goto :goto_4

    .line 209
    :cond_6c
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->socket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v3

    invoke-interface {v0}, Lorg/zeromq/ZPoller$ItemHolder;->socket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7c

    move v1, v2

    .line 210
    goto :goto_4

    .line 212
    :cond_7c
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->handler()Lorg/zeromq/ZPoller$EventsHandler;

    move-result-object v3

    if-nez v3, :cond_8b

    .line 213
    invoke-interface {v0}, Lorg/zeromq/ZPoller$ItemHolder;->handler()Lorg/zeromq/ZPoller$EventsHandler;

    move-result-object v3

    if-eqz v3, :cond_4

    move v1, v2

    .line 214
    goto/16 :goto_4

    .line 217
    :cond_8b
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->handler()Lorg/zeromq/ZPoller$EventsHandler;

    move-result-object v3

    invoke-interface {v0}, Lorg/zeromq/ZPoller$ItemHolder;->handler()Lorg/zeromq/ZPoller$EventsHandler;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 218
    goto/16 :goto_4
.end method

.method public handler()Lorg/zeromq/ZPoller$EventsHandler;
    .registers 2

    .prologue
    .line 226
    iget-object v0, p0, Lorg/zeromq/ZPoller$ZPollItem;->handler:Lorg/zeromq/ZPoller$EventsHandler;

    return-object v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 166
    const/16 v0, 0x1f

    .line 167
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 168
    .local v1, "result":I
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->item()Lzmq/PollItem;

    move-result-object v2

    if-nez v2, :cond_2e

    move v2, v3

    :goto_b
    add-int/lit8 v1, v2, 0x1f

    .line 169
    mul-int/lit8 v4, v1, 0x1f

    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v2

    if-nez v2, :cond_37

    move v2, v3

    :goto_16
    add-int v1, v4, v2

    .line 170
    mul-int/lit8 v4, v1, 0x1f

    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->socket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v2

    if-nez v2, :cond_40

    move v2, v3

    :goto_21
    add-int v1, v4, v2

    .line 171
    mul-int/lit8 v2, v1, 0x1f

    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->handler()Lorg/zeromq/ZPoller$EventsHandler;

    move-result-object v4

    if-nez v4, :cond_49

    :goto_2b
    add-int v1, v2, v3

    .line 172
    return v1

    .line 168
    :cond_2e
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->item()Lzmq/PollItem;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_b

    .line 169
    :cond_37
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_16

    .line 170
    :cond_40
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->socket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_21

    .line 171
    :cond_49
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->handler()Lorg/zeromq/ZPoller$EventsHandler;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto :goto_2b
.end method

.method public item()Lzmq/PollItem;
    .registers 2

    .prologue
    .line 154
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->base()Lzmq/PollItem;

    move-result-object v0

    return-object v0
.end method

.method public socket()Lorg/zeromq/ZMQ$Socket;
    .registers 2

    .prologue
    .line 160
    invoke-virtual {p0}, Lorg/zeromq/ZPoller$ZPollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v0

    return-object v0
.end method
