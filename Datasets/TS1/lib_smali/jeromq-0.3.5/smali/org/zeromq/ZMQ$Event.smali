.class public Lorg/zeromq/ZMQ$Event;
.super Ljava/lang/Object;
.source "ZMQ.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZMQ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Event"
.end annotation


# instance fields
.field private final address:Ljava/lang/String;

.field private final event:I

.field private final value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(ILjava/lang/Object;Ljava/lang/String;)V
    .registers 4
    .param p1, "event"    # I
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "address"    # Ljava/lang/String;

    .prologue
    .line 2019
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2020
    iput p1, p0, Lorg/zeromq/ZMQ$Event;->event:I

    .line 2021
    iput-object p2, p0, Lorg/zeromq/ZMQ$Event;->value:Ljava/lang/Object;

    .line 2022
    iput-object p3, p0, Lorg/zeromq/ZMQ$Event;->address:Ljava/lang/String;

    .line 2023
    return-void
.end method

.method public static recv(Lorg/zeromq/ZMQ$Socket;)Lorg/zeromq/ZMQ$Event;
    .registers 2
    .param p0, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 2062
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/zeromq/ZMQ$Event;->recv(Lorg/zeromq/ZMQ$Socket;I)Lorg/zeromq/ZMQ$Event;

    move-result-object v0

    return-object v0
.end method

.method public static recv(Lorg/zeromq/ZMQ$Socket;I)Lorg/zeromq/ZMQ$Event;
    .registers 7
    .param p0, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p1, "flags"    # I

    .prologue
    .line 2049
    # getter for: Lorg/zeromq/ZMQ$Socket;->base:Lzmq/SocketBase;
    invoke-static {p0}, Lorg/zeromq/ZMQ$Socket;->access$100(Lorg/zeromq/ZMQ$Socket;)Lzmq/SocketBase;

    move-result-object v1

    invoke-static {v1, p1}, Lzmq/ZMQ$Event;->read(Lzmq/SocketBase;I)Lzmq/ZMQ$Event;

    move-result-object v0

    .line 2050
    .local v0, "e":Lzmq/ZMQ$Event;
    if-eqz v0, :cond_16

    new-instance v1, Lorg/zeromq/ZMQ$Event;

    iget v2, v0, Lzmq/ZMQ$Event;->event:I

    iget-object v3, v0, Lzmq/ZMQ$Event;->arg:Ljava/lang/Object;

    iget-object v4, v0, Lzmq/ZMQ$Event;->addr:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lorg/zeromq/ZMQ$Event;-><init>(ILjava/lang/Object;Ljava/lang/String;)V

    :goto_15
    return-object v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2037
    iget-object v0, p0, Lorg/zeromq/ZMQ$Event;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getEvent()I
    .registers 2

    .prologue
    .line 2027
    iget v0, p0, Lorg/zeromq/ZMQ$Event;->event:I

    return v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 2032
    iget-object v0, p0, Lorg/zeromq/ZMQ$Event;->value:Ljava/lang/Object;

    return-object v0
.end method
