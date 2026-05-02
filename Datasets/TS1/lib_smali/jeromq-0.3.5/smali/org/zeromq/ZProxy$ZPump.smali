.class public Lorg/zeromq/ZProxy$ZPump;
.super Ljava/lang/Object;
.source "ZProxy.java"

# interfaces
.implements Lorg/zeromq/ZProxy$Pump;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ZPump"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZProxy$ZPump$Identity;,
        Lorg/zeromq/ZProxy$ZPump$Transformer;
    }
.end annotation


# static fields
.field private static final IDENTITY:Lorg/zeromq/ZProxy$ZPump$Identity;


# instance fields
.field private final transformer:Lorg/zeromq/ZProxy$ZPump$Transformer;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 980
    new-instance v0, Lorg/zeromq/ZProxy$ZPump$Identity;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/zeromq/ZProxy$ZPump$Identity;-><init>(Lorg/zeromq/ZProxy$1;)V

    sput-object v0, Lorg/zeromq/ZProxy$ZPump;->IDENTITY:Lorg/zeromq/ZProxy$ZPump$Identity;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 1012
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/zeromq/ZProxy$ZPump;-><init>(Lorg/zeromq/ZProxy$ZPump$Transformer;)V

    .line 1013
    return-void
.end method

.method public constructor <init>(Lorg/zeromq/ZProxy$ZPump$Transformer;)V
    .registers 2
    .param p1, "transformer"    # Lorg/zeromq/ZProxy$ZPump$Transformer;

    .prologue
    .line 1017
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1018
    if-nez p1, :cond_7

    sget-object p1, Lorg/zeromq/ZProxy$ZPump;->IDENTITY:Lorg/zeromq/ZProxy$ZPump$Identity;

    .end local p1    # "transformer":Lorg/zeromq/ZProxy$ZPump$Transformer;
    :cond_7
    iput-object p1, p0, Lorg/zeromq/ZProxy$ZPump;->transformer:Lorg/zeromq/ZProxy$ZPump$Transformer;

    .line 1019
    return-void
.end method


# virtual methods
.method public flow(Lorg/zeromq/ZProxy$Plug;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;Lorg/zeromq/ZMQ$Socket;)Z
    .registers 13
    .param p1, "splug"    # Lorg/zeromq/ZProxy$Plug;
    .param p2, "source"    # Lorg/zeromq/ZMQ$Socket;
    .param p3, "capture"    # Lorg/zeromq/ZMQ$Socket;
    .param p4, "dplug"    # Lorg/zeromq/ZProxy$Plug;
    .param p5, "destination"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    const/4 v1, 0x0

    .line 1025
    const/4 v4, 0x0

    .line 1028
    .local v4, "success":Z
    invoke-static {p2}, Lorg/zeromq/ZMsg;->recvMsg(Lorg/zeromq/ZMQ$Socket;)Lorg/zeromq/ZMsg;

    move-result-object v3

    .line 1030
    .local v3, "msg":Lorg/zeromq/ZMsg;
    if-nez v3, :cond_9

    .line 1054
    :goto_8
    return v1

    .line 1034
    :cond_9
    if-eqz p3, :cond_1c

    .line 1037
    iget-object v5, p0, Lorg/zeromq/ZProxy$ZPump;->transformer:Lorg/zeromq/ZProxy$ZPump$Transformer;

    sget-object v6, Lorg/zeromq/ZProxy$Plug;->CAPTURE:Lorg/zeromq/ZProxy$Plug;

    invoke-interface {v5, v3, p1, v6}, Lorg/zeromq/ZProxy$ZPump$Transformer;->transform(Lorg/zeromq/ZMsg;Lorg/zeromq/ZProxy$Plug;Lorg/zeromq/ZProxy$Plug;)Lorg/zeromq/ZMsg;

    move-result-object v0

    .line 1040
    .local v0, "cpt":Lorg/zeromq/ZMsg;
    if-eq v3, v0, :cond_16

    const/4 v1, 0x1

    .line 1041
    .local v1, "destroy":Z
    :cond_16
    invoke-virtual {v0, p3, v1}, Lorg/zeromq/ZMsg;->send(Lorg/zeromq/ZMQ$Socket;Z)Z

    move-result v4

    .line 1042
    if-nez v4, :cond_1c

    .line 1047
    .end local v0    # "cpt":Lorg/zeromq/ZMsg;
    .end local v1    # "destroy":Z
    :cond_1c
    iget-object v5, p0, Lorg/zeromq/ZProxy$ZPump;->transformer:Lorg/zeromq/ZProxy$ZPump$Transformer;

    invoke-interface {v5, v3, p1, p4}, Lorg/zeromq/ZProxy$ZPump$Transformer;->transform(Lorg/zeromq/ZMsg;Lorg/zeromq/ZProxy$Plug;Lorg/zeromq/ZProxy$Plug;)Lorg/zeromq/ZMsg;

    move-result-object v2

    .line 1049
    .local v2, "dst":Lorg/zeromq/ZMsg;
    invoke-virtual {v2, p5}, Lorg/zeromq/ZMsg;->send(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v4

    .line 1052
    invoke-virtual {v3}, Lorg/zeromq/ZMsg;->destroy()V

    move v1, v4

    .line 1054
    goto :goto_8
.end method
