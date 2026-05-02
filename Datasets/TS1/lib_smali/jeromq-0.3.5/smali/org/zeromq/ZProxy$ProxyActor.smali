.class final Lorg/zeromq/ZProxy$ProxyActor;
.super Lorg/zeromq/ZActor$SimpleActor;
.source "ZProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ProxyActor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZProxy$ProxyActor$State;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private args:[Ljava/lang/Object;

.field private backend:Lorg/zeromq/ZMQ$Socket;

.field private capture:Lorg/zeromq/ZMQ$Socket;

.field private frontend:Lorg/zeromq/ZMQ$Socket;

.field private final name:Ljava/lang/String;

.field private provider:Lorg/zeromq/ZProxy$Proxy;

.field private final state:Lorg/zeromq/ZProxy$ProxyActor$State;

.field private final transport:Lorg/zeromq/ZProxy$Pump;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 690
    const-class v0, Lorg/zeromq/ZProxy;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/zeromq/ZProxy$ProxyActor;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/zeromq/ZProxy$Pump;I)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "transport"    # Lorg/zeromq/ZProxy$Pump;
    .param p3, "id"    # I

    .prologue
    .line 729
    invoke-direct {p0}, Lorg/zeromq/ZActor$SimpleActor;-><init>()V

    .line 709
    new-instance v0, Lorg/zeromq/ZProxy$ProxyActor$State;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/zeromq/ZProxy$ProxyActor$State;-><init>(Lorg/zeromq/ZProxy$1;)V

    iput-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    .line 730
    if-nez p1, :cond_22

    .line 732
    const-string v0, "ZProxy-%sd"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->name:Ljava/lang/String;

    .line 737
    :goto_1f
    iput-object p2, p0, Lorg/zeromq/ZProxy$ProxyActor;->transport:Lorg/zeromq/ZProxy$Pump;

    .line 738
    return-void

    .line 735
    :cond_22
    iput-object p1, p0, Lorg/zeromq/ZProxy$ProxyActor;->name:Ljava/lang/String;

    goto :goto_1f
.end method

.method private pause(Lorg/zeromq/ZPoller;Z)Z
    .registers 5
    .param p1, "poller"    # Lorg/zeromq/ZPoller;
    .param p2, "pause"    # Z

    .prologue
    const/4 v1, 0x1

    .line 861
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->paused:Z
    invoke-static {v0, p2}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1202(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z

    .line 862
    if-eqz p2, :cond_13

    .line 863
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {p1, v0}, Lorg/zeromq/ZPoller;->unregister(Ljava/lang/Object;)Z

    .line 864
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {p1, v0}, Lorg/zeromq/ZPoller;->unregister(Ljava/lang/Object;)Z

    .line 872
    :goto_12
    return v1

    .line 868
    :cond_13
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {p1, v0, v1}, Lorg/zeromq/ZPoller;->register(Lorg/zeromq/ZMQ$Socket;I)Z

    .line 869
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {p1, v0, v1}, Lorg/zeromq/ZPoller;->register(Lorg/zeromq/ZMQ$Socket;I)Z

    goto :goto_12
.end method

.method private restart(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;Z)Z
    .registers 7
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;
    .param p3, "hot"    # Z

    .prologue
    const/4 v0, 0x1

    .line 887
    if-eqz p3, :cond_20

    .line 888
    sget-boolean v1, Lorg/zeromq/ZProxy$ProxyActor;->$assertionsDisabled:Z

    if-nez v1, :cond_11

    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    if-nez v1, :cond_11

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 889
    :cond_11
    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    invoke-static {p1}, Lorg/zeromq/ZMsg;->recvMsg(Lorg/zeromq/ZMQ$Socket;)Lorg/zeromq/ZMsg;

    move-result-object v2

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->hot:Lorg/zeromq/ZMsg;
    invoke-static {v1, v2}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$302(Lorg/zeromq/ZProxy$ProxyActor$State;Lorg/zeromq/ZMsg;)Lorg/zeromq/ZMsg;

    .line 890
    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->restart:Z
    invoke-static {v1, v0}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1302(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z

    .line 899
    :goto_1f
    return v0

    .line 895
    :cond_20
    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->restart:Z
    invoke-static {v1, v0}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1302(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z

    .line 899
    const/4 v0, 0x0

    goto :goto_1f
.end method

.method private start(Lorg/zeromq/ZPoller;)Z
    .registers 7
    .param p1, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    const/4 v4, 0x1

    .line 845
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # getter for: Lorg/zeromq/ZProxy$ProxyActor$State;->started:Z
    invoke-static {v0}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1100(Lorg/zeromq/ZProxy$ProxyActor$State;)Z

    move-result v0

    if-nez v0, :cond_2f

    .line 846
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->started:Z
    invoke-static {v0, v4}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1102(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z

    .line 848
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    sget-object v2, Lorg/zeromq/ZProxy$Plug;->FRONT:Lorg/zeromq/ZProxy$Plug;

    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    invoke-interface {v0, v1, v2, v3}, Lorg/zeromq/ZProxy$Proxy;->configure(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)V

    .line 849
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    sget-object v2, Lorg/zeromq/ZProxy$Plug;->BACK:Lorg/zeromq/ZProxy$Plug;

    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    invoke-interface {v0, v1, v2, v3}, Lorg/zeromq/ZProxy$Proxy;->configure(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)V

    .line 850
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->capture:Lorg/zeromq/ZMQ$Socket;

    sget-object v2, Lorg/zeromq/ZProxy$Plug;->CAPTURE:Lorg/zeromq/ZProxy$Plug;

    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    invoke-interface {v0, v1, v2, v3}, Lorg/zeromq/ZProxy$Proxy;->configure(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)V

    .line 852
    :cond_2f
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # getter for: Lorg/zeromq/ZProxy$ProxyActor$State;->paused:Z
    invoke-static {v0}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1200(Lorg/zeromq/ZProxy$ProxyActor$State;)Z

    move-result v0

    if-nez v0, :cond_3b

    .line 853
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/zeromq/ZProxy$ProxyActor;->pause(Lorg/zeromq/ZPoller;Z)Z

    .line 855
    :cond_3b
    return v4
.end method

.method private status()Lorg/zeromq/ZMsg;
    .registers 3

    .prologue
    .line 823
    new-instance v0, Lorg/zeromq/ZMsg;

    invoke-direct {v0}, Lorg/zeromq/ZMsg;-><init>()V

    .line 824
    .local v0, "reply":Lorg/zeromq/ZMsg;
    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # getter for: Lorg/zeromq/ZProxy$ProxyActor$State;->alive:Z
    invoke-static {v1}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$200(Lorg/zeromq/ZProxy$ProxyActor$State;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 825
    sget-object v1, Lorg/zeromq/ZProxy;->EXITED:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/zeromq/ZMsg;->add(Ljava/lang/String;)Z

    .line 839
    :goto_12
    return-object v0

    .line 828
    :cond_13
    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # getter for: Lorg/zeromq/ZProxy$ProxyActor$State;->started:Z
    invoke-static {v1}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1100(Lorg/zeromq/ZProxy$ProxyActor$State;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 829
    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # getter for: Lorg/zeromq/ZProxy$ProxyActor$State;->paused:Z
    invoke-static {v1}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1200(Lorg/zeromq/ZProxy$ProxyActor$State;)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 830
    sget-object v1, Lorg/zeromq/ZProxy;->PAUSED:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/zeromq/ZMsg;->add(Ljava/lang/String;)Z

    goto :goto_12

    .line 833
    :cond_29
    sget-object v1, Lorg/zeromq/ZProxy;->STARTED:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/zeromq/ZMsg;->add(Ljava/lang/String;)Z

    goto :goto_12

    .line 837
    :cond_2f
    sget-object v1, Lorg/zeromq/ZProxy;->STOPPED:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/zeromq/ZMsg;->add(Ljava/lang/String;)Z

    goto :goto_12
.end method

.method private stop(Lorg/zeromq/ZPoller;)Z
    .registers 5
    .param p1, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    const/4 v2, 0x1

    .line 878
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    const/4 v1, 0x0

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->started:Z
    invoke-static {v0, v1}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1102(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z

    .line 880
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->restart:Z
    invoke-static {v0, v2}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1302(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z

    .line 881
    return v2
.end method


# virtual methods
.method public backstage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z
    .registers 17
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;
    .param p3, "events"    # I

    .prologue
    .line 780
    sget-boolean v0, Lorg/zeromq/ZProxy$ProxyActor;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # getter for: Lorg/zeromq/ZProxy$ProxyActor$State;->hot:Lorg/zeromq/ZMsg;
    invoke-static {v0}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$300(Lorg/zeromq/ZProxy$ProxyActor$State;)Lorg/zeromq/ZMsg;

    move-result-object v0

    if-eqz v0, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 782
    :cond_12
    invoke-virtual {p1}, Lorg/zeromq/ZMQ$Socket;->recvStr()Ljava/lang/String;

    move-result-object v5

    .line 784
    .local v5, "cmd":Ljava/lang/String;
    # getter for: Lorg/zeromq/ZProxy;->START:Ljava/lang/String;
    invoke-static {}, Lorg/zeromq/ZProxy;->access$400()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 785
    invoke-direct {p0, p2}, Lorg/zeromq/ZProxy$ProxyActor;->start(Lorg/zeromq/ZPoller;)Z

    .line 786
    invoke-direct {p0}, Lorg/zeromq/ZProxy$ProxyActor;->status()Lorg/zeromq/ZMsg;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/zeromq/ZMsg;->send(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v11

    .line 817
    .end local v5    # "cmd":Ljava/lang/String;
    :goto_2b
    return v11

    .line 788
    .restart local v5    # "cmd":Ljava/lang/String;
    :cond_2c
    # getter for: Lorg/zeromq/ZProxy;->STOP:Ljava/lang/String;
    invoke-static {}, Lorg/zeromq/ZProxy;->access$500()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    .line 789
    invoke-direct {p0, p2}, Lorg/zeromq/ZProxy$ProxyActor;->stop(Lorg/zeromq/ZPoller;)Z

    .line 790
    invoke-direct {p0}, Lorg/zeromq/ZProxy$ProxyActor;->status()Lorg/zeromq/ZMsg;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/zeromq/ZMsg;->send(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v11

    goto :goto_2b

    .line 792
    :cond_42
    # getter for: Lorg/zeromq/ZProxy;->PAUSE:Ljava/lang/String;
    invoke-static {}, Lorg/zeromq/ZProxy;->access$600()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_59

    .line 793
    const/4 v0, 0x1

    invoke-direct {p0, p2, v0}, Lorg/zeromq/ZProxy$ProxyActor;->pause(Lorg/zeromq/ZPoller;Z)Z

    .line 794
    invoke-direct {p0}, Lorg/zeromq/ZProxy$ProxyActor;->status()Lorg/zeromq/ZMsg;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/zeromq/ZMsg;->send(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v11

    goto :goto_2b

    .line 796
    :cond_59
    # getter for: Lorg/zeromq/ZProxy;->RESTART:Ljava/lang/String;
    invoke-static {}, Lorg/zeromq/ZProxy;->access$700()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_70

    .line 797
    invoke-virtual {p1}, Lorg/zeromq/ZMQ$Socket;->recvStr()Ljava/lang/String;

    move-result-object v12

    .line 798
    .local v12, "val":Ljava/lang/String;
    invoke-static {v12}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v10

    .line 799
    .local v10, "hot":Z
    invoke-direct {p0, p1, p2, v10}, Lorg/zeromq/ZProxy$ProxyActor;->restart(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;Z)Z

    move-result v11

    goto :goto_2b

    .line 801
    .end local v10    # "hot":Z
    .end local v12    # "val":Ljava/lang/String;
    :cond_70
    # getter for: Lorg/zeromq/ZProxy;->STATUS:Ljava/lang/String;
    invoke-static {}, Lorg/zeromq/ZProxy;->access$800()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_83

    .line 802
    invoke-direct {p0}, Lorg/zeromq/ZProxy$ProxyActor;->status()Lorg/zeromq/ZMsg;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/zeromq/ZMsg;->send(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v11

    goto :goto_2b

    .line 804
    :cond_83
    # getter for: Lorg/zeromq/ZProxy;->CONFIG:Ljava/lang/String;
    invoke-static {}, Lorg/zeromq/ZProxy;->access$900()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a4

    .line 805
    invoke-static {p1}, Lorg/zeromq/ZMsg;->recvMsg(Lorg/zeromq/ZMQ$Socket;)Lorg/zeromq/ZMsg;

    move-result-object v2

    .line 806
    .local v2, "cfg":Lorg/zeromq/ZMsg;
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    iget-object v4, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    iget-object v5, p0, Lorg/zeromq/ZProxy$ProxyActor;->capture:Lorg/zeromq/ZMQ$Socket;

    .end local v5    # "cmd":Ljava/lang/String;
    iget-object v6, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    move-object v1, p1

    invoke-interface/range {v0 .. v6}, Lorg/zeromq/ZProxy$Proxy;->configure(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMsg;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;[Ljava/lang/Object;)Z

    move-result v11

    .line 807
    .local v11, "rc":Z
    invoke-virtual {v2}, Lorg/zeromq/ZMsg;->destroy()V

    goto :goto_2b

    .line 810
    .end local v2    # "cfg":Lorg/zeromq/ZMsg;
    .end local v11    # "rc":Z
    .restart local v5    # "cmd":Ljava/lang/String;
    :cond_a4
    # getter for: Lorg/zeromq/ZProxy;->EXIT:Ljava/lang/String;
    invoke-static {}, Lorg/zeromq/ZProxy;->access$1000()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b1

    .line 817
    const/4 v11, 0x0

    goto/16 :goto_2b

    .line 815
    :cond_b1
    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    iget-object v6, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    iget-object v7, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    iget-object v8, p0, Lorg/zeromq/ZProxy$ProxyActor;->capture:Lorg/zeromq/ZMQ$Socket;

    iget-object v9, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    move-object v4, p1

    invoke-interface/range {v3 .. v9}, Lorg/zeromq/ZProxy$Proxy;->custom(Lorg/zeromq/ZMQ$Socket;Ljava/lang/String;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;[Ljava/lang/Object;)Z

    move-result v11

    goto/16 :goto_2b
.end method

.method public createSockets(Lorg/zeromq/ZContext;[Ljava/lang/Object;)Ljava/util/List;
    .registers 8
    .param p1, "ctx"    # Lorg/zeromq/ZContext;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/zeromq/ZContext;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/zeromq/ZMQ$Socket;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 750
    aget-object v0, p2, v3

    check-cast v0, Lorg/zeromq/ZProxy$Proxy;

    iput-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    .line 752
    array-length v0, p2

    add-int/lit8 v0, v0, -0x1

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    .line 753
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    array-length v1, v1

    invoke-static {p2, v4, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 755
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    sget-object v1, Lorg/zeromq/ZProxy$Plug;->FRONT:Lorg/zeromq/ZProxy$Plug;

    iget-object v2, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    invoke-interface {v0, p1, v1, v2}, Lorg/zeromq/ZProxy$Proxy;->create(Lorg/zeromq/ZContext;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)Lorg/zeromq/ZMQ$Socket;

    move-result-object v0

    iput-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    .line 756
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    sget-object v1, Lorg/zeromq/ZProxy$Plug;->CAPTURE:Lorg/zeromq/ZProxy$Plug;

    iget-object v2, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    invoke-interface {v0, p1, v1, v2}, Lorg/zeromq/ZProxy$Proxy;->create(Lorg/zeromq/ZContext;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)Lorg/zeromq/ZMQ$Socket;

    move-result-object v0

    iput-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->capture:Lorg/zeromq/ZMQ$Socket;

    .line 757
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    sget-object v1, Lorg/zeromq/ZProxy$Plug;->BACK:Lorg/zeromq/ZProxy$Plug;

    iget-object v2, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    invoke-interface {v0, p1, v1, v2}, Lorg/zeromq/ZProxy$Proxy;->create(Lorg/zeromq/ZContext;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)Lorg/zeromq/ZMQ$Socket;

    move-result-object v0

    iput-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    .line 759
    sget-boolean v0, Lorg/zeromq/ZProxy$ProxyActor;->$assertionsDisabled:Z

    if-nez v0, :cond_49

    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    if-nez v0, :cond_49

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 760
    :cond_49
    sget-boolean v0, Lorg/zeromq/ZProxy$ProxyActor;->$assertionsDisabled:Z

    if-nez v0, :cond_57

    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    if-nez v0, :cond_57

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 762
    :cond_57
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/zeromq/ZMQ$Socket;

    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    aput-object v1, v0, v3

    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    aput-object v1, v0, v4

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public destroyed(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z
    .registers 5
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    .line 963
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->capture:Lorg/zeromq/ZMQ$Socket;

    if-eqz v0, :cond_9

    .line 964
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->capture:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {v0}, Lorg/zeromq/ZMQ$Socket;->close()V

    .line 966
    :cond_9
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # getter for: Lorg/zeromq/ZProxy$ProxyActor$State;->restart:Z
    invoke-static {v0}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1300(Lorg/zeromq/ZProxy$ProxyActor$State;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 967
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    const/4 v1, 0x0

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->alive:Z
    invoke-static {v0, v1}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$202(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z

    .line 968
    invoke-direct {p0}, Lorg/zeromq/ZProxy$ProxyActor;->status()Lorg/zeromq/ZMsg;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/zeromq/ZMsg;->send(Lorg/zeromq/ZMQ$Socket;)Z

    .line 970
    :cond_1e
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # getter for: Lorg/zeromq/ZProxy$ProxyActor$State;->restart:Z
    invoke-static {v0}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1300(Lorg/zeromq/ZProxy$ProxyActor$State;)Z

    move-result v0

    return v0
.end method

.method public looped(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z
    .registers 10
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    .line 935
    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # getter for: Lorg/zeromq/ZProxy$ProxyActor$State;->restart:Z
    invoke-static {v3}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1300(Lorg/zeromq/ZProxy$ProxyActor$State;)Z

    move-result v3

    if-eqz v3, :cond_65

    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # getter for: Lorg/zeromq/ZProxy$ProxyActor$State;->hot:Lorg/zeromq/ZMsg;
    invoke-static {v3}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$300(Lorg/zeromq/ZProxy$ProxyActor$State;)Lorg/zeromq/ZMsg;

    move-result-object v3

    if-eqz v3, :cond_65

    .line 937
    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # getter for: Lorg/zeromq/ZProxy$ProxyActor$State;->hot:Lorg/zeromq/ZMsg;
    invoke-static {v3}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$300(Lorg/zeromq/ZProxy$ProxyActor$State;)Lorg/zeromq/ZMsg;

    move-result-object v0

    .line 938
    .local v0, "cfg":Lorg/zeromq/ZMsg;
    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    const/4 v4, 0x0

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->hot:Lorg/zeromq/ZMsg;
    invoke-static {v3, v4}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$302(Lorg/zeromq/ZProxy$ProxyActor$State;Lorg/zeromq/ZMsg;)Lorg/zeromq/ZMsg;

    .line 939
    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    const/4 v4, 0x0

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->restart:Z
    invoke-static {v3, v4}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1302(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z

    .line 942
    invoke-virtual {v0}, Lorg/zeromq/ZMsg;->duplicate()Lorg/zeromq/ZMsg;

    move-result-object v2

    .line 943
    .local v2, "dup":Lorg/zeromq/ZMsg;
    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    iget-object v4, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    sget-object v5, Lorg/zeromq/ZProxy$Plug;->FRONT:Lorg/zeromq/ZProxy$Plug;

    iget-object v6, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    invoke-interface {v3, v2, v4, v5, v6}, Lorg/zeromq/ZProxy$Proxy;->restart(Lorg/zeromq/ZMsg;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)Z

    move-result v1

    .line 944
    .local v1, "cold":Z
    invoke-virtual {v2}, Lorg/zeromq/ZMsg;->destroy()V

    .line 945
    invoke-virtual {v0}, Lorg/zeromq/ZMsg;->duplicate()Lorg/zeromq/ZMsg;

    move-result-object v2

    .line 946
    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    iget-object v4, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    sget-object v5, Lorg/zeromq/ZProxy$Plug;->BACK:Lorg/zeromq/ZProxy$Plug;

    iget-object v6, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    invoke-interface {v3, v2, v4, v5, v6}, Lorg/zeromq/ZProxy$Proxy;->restart(Lorg/zeromq/ZMsg;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v1, v3

    .line 947
    invoke-virtual {v2}, Lorg/zeromq/ZMsg;->destroy()V

    .line 948
    invoke-virtual {v0}, Lorg/zeromq/ZMsg;->duplicate()Lorg/zeromq/ZMsg;

    move-result-object v2

    .line 949
    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->provider:Lorg/zeromq/ZProxy$Proxy;

    iget-object v4, p0, Lorg/zeromq/ZProxy$ProxyActor;->capture:Lorg/zeromq/ZMQ$Socket;

    sget-object v5, Lorg/zeromq/ZProxy$Plug;->CAPTURE:Lorg/zeromq/ZProxy$Plug;

    iget-object v6, p0, Lorg/zeromq/ZProxy$ProxyActor;->args:[Ljava/lang/Object;

    invoke-interface {v3, v2, v4, v5, v6}, Lorg/zeromq/ZProxy$Proxy;->restart(Lorg/zeromq/ZMsg;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;[Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v1, v3

    .line 950
    invoke-virtual {v2}, Lorg/zeromq/ZMsg;->destroy()V

    .line 951
    invoke-virtual {v0}, Lorg/zeromq/ZMsg;->destroy()V

    .line 954
    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->restart:Z
    invoke-static {v3, v1}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$1302(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z

    .line 956
    .end local v0    # "cfg":Lorg/zeromq/ZMsg;
    .end local v1    # "cold":Z
    .end local v2    # "dup":Lorg/zeromq/ZMsg;
    :cond_65
    const/4 v3, 0x1

    return v3
.end method

.method public looping(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)J
    .registers 5
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    .line 906
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    const/4 v1, 0x0

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->hot:Lorg/zeromq/ZMsg;
    invoke-static {v0, v1}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$302(Lorg/zeromq/ZProxy$ProxyActor$State;Lorg/zeromq/ZMsg;)Lorg/zeromq/ZMsg;

    .line 907
    invoke-super {p0, p1, p2}, Lorg/zeromq/ZActor$SimpleActor;->looping(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)J

    move-result-wide v0

    return-wide v0
.end method

.method public premiere(Lorg/zeromq/ZMQ$Socket;)Ljava/lang/String;
    .registers 3
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 743
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->name:Ljava/lang/String;

    return-object v0
.end method

.method public stage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z
    .registers 11
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p3, "poller"    # Lorg/zeromq/ZPoller;
    .param p4, "events"    # I

    .prologue
    .line 915
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    if-ne p1, v0, :cond_15

    .line 917
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->transport:Lorg/zeromq/ZProxy$Pump;

    sget-object v1, Lorg/zeromq/ZProxy$Plug;->FRONT:Lorg/zeromq/ZProxy$Plug;

    iget-object v2, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->capture:Lorg/zeromq/ZMQ$Socket;

    sget-object v4, Lorg/zeromq/ZProxy$Plug;->BACK:Lorg/zeromq/ZProxy$Plug;

    iget-object v5, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    invoke-interface/range {v0 .. v5}, Lorg/zeromq/ZProxy$Pump;->flow(Lorg/zeromq/ZProxy$Plug;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;Lorg/zeromq/ZMQ$Socket;)Z

    move-result v0

    .line 929
    :goto_14
    return v0

    .line 922
    :cond_15
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    if-ne p1, v0, :cond_2a

    .line 924
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor;->transport:Lorg/zeromq/ZProxy$Pump;

    sget-object v1, Lorg/zeromq/ZProxy$Plug;->BACK:Lorg/zeromq/ZProxy$Plug;

    iget-object v2, p0, Lorg/zeromq/ZProxy$ProxyActor;->backend:Lorg/zeromq/ZMQ$Socket;

    iget-object v3, p0, Lorg/zeromq/ZProxy$ProxyActor;->capture:Lorg/zeromq/ZMQ$Socket;

    sget-object v4, Lorg/zeromq/ZProxy$Plug;->FRONT:Lorg/zeromq/ZProxy$Plug;

    iget-object v5, p0, Lorg/zeromq/ZProxy$ProxyActor;->frontend:Lorg/zeromq/ZMQ$Socket;

    invoke-interface/range {v0 .. v5}, Lorg/zeromq/ZProxy$Pump;->flow(Lorg/zeromq/ZProxy$Plug;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZProxy$Plug;Lorg/zeromq/ZMQ$Socket;)Z

    move-result v0

    goto :goto_14

    .line 929
    :cond_2a
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public start(Lorg/zeromq/ZMQ$Socket;Ljava/util/List;Lorg/zeromq/ZPoller;)V
    .registers 7
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p3, "poller"    # Lorg/zeromq/ZPoller;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/zeromq/ZMQ$Socket;",
            "Ljava/util/List",
            "<",
            "Lorg/zeromq/ZMQ$Socket;",
            ">;",
            "Lorg/zeromq/ZPoller;",
            ")V"
        }
    .end annotation

    .prologue
    .line 769
    .local p2, "sockets":Ljava/util/List;, "Ljava/util/List<Lorg/zeromq/ZMQ$Socket;>;"
    iget-object v1, p0, Lorg/zeromq/ZProxy$ProxyActor;->state:Lorg/zeromq/ZProxy$ProxyActor$State;

    const/4 v2, 0x1

    # setter for: Lorg/zeromq/ZProxy$ProxyActor$State;->alive:Z
    invoke-static {v1, v2}, Lorg/zeromq/ZProxy$ProxyActor$State;->access$202(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z

    .line 771
    new-instance v0, Lorg/zeromq/ZMsg;

    invoke-direct {v0}, Lorg/zeromq/ZMsg;-><init>()V

    .line 772
    .local v0, "reply":Lorg/zeromq/ZMsg;
    sget-object v1, Lorg/zeromq/ZProxy;->ALIVE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/zeromq/ZMsg;->add(Ljava/lang/String;)Z

    .line 773
    invoke-virtual {v0, p1}, Lorg/zeromq/ZMsg;->send(Lorg/zeromq/ZMQ$Socket;)Z

    .line 774
    return-void
.end method
