.class public Lorg/zeromq/ZAgent$Creator;
.super Ljava/lang/Object;
.source "ZAgent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZAgent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Creator"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Lorg/zeromq/ZMQ$Socket;Ljava/lang/String;)Lorg/zeromq/ZAgent;
    .registers 3
    .param p0, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p1, "lock"    # Ljava/lang/String;

    .prologue
    .line 121
    new-instance v0, Lorg/zeromq/ZAgent$SimpleAgent;

    invoke-direct {v0, p0, p1}, Lorg/zeromq/ZAgent$SimpleAgent;-><init>(Lorg/zeromq/ZMQ$Socket;Ljava/lang/String;)V

    return-object v0
.end method
