.class final Lorg/zeromq/ZActor$ActorFortune;
.super Ljava/lang/Object;
.source "ZActor.java"

# interfaces
.implements Lorg/zeromq/ZStar$Fortune;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZActor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ActorFortune"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final actor:Lorg/zeromq/ZActor$Actor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 474
    const-class v0, Lorg/zeromq/ZActor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/zeromq/ZActor$ActorFortune;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lorg/zeromq/ZActor$Actor;)V
    .registers 3
    .param p1, "actor"    # Lorg/zeromq/ZActor$Actor;

    .prologue
    .line 479
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 480
    sget-boolean v0, Lorg/zeromq/ZActor$ActorFortune;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    if-nez p1, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 481
    :cond_f
    iput-object p1, p0, Lorg/zeromq/ZActor$ActorFortune;->actor:Lorg/zeromq/ZActor$Actor;

    .line 482
    return-void
.end method


# virtual methods
.method public create(Lorg/zeromq/ZContext;Lorg/zeromq/ZMQ$Socket;Ljava/nio/channels/Selector;ILorg/zeromq/ZStar$Star;[Ljava/lang/Object;)Lorg/zeromq/ZStar$Star;
    .registers 13
    .param p1, "ctx"    # Lorg/zeromq/ZContext;
    .param p2, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p3, "sel"    # Ljava/nio/channels/Selector;
    .param p4, "count"    # I
    .param p5, "previous"    # Lorg/zeromq/ZStar$Star;
    .param p6, "args"    # [Ljava/lang/Object;

    .prologue
    .line 494
    new-instance v0, Lorg/zeromq/ZActor$Double;

    iget-object v4, p0, Lorg/zeromq/ZActor$ActorFortune;->actor:Lorg/zeromq/ZActor$Actor;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lorg/zeromq/ZActor$Double;-><init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZMQ$Socket;Ljava/nio/channels/Selector;Lorg/zeromq/ZActor$Actor;[Ljava/lang/Object;)V

    .line 495
    .local v0, "star":Lorg/zeromq/ZStar$Star;
    return-object v0
.end method

.method public interview(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "mic"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 501
    iget-object v0, p0, Lorg/zeromq/ZActor$ActorFortune;->actor:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1}, Lorg/zeromq/ZActor$Actor;->finished(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v0

    return v0
.end method

.method public party(Lorg/zeromq/ZContext;)V
    .registers 2
    .param p1, "ctx"    # Lorg/zeromq/ZContext;

    .prologue
    .line 507
    return-void
.end method

.method public premiere(Lorg/zeromq/ZMQ$Socket;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p1, "mic"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 487
    iget-object v0, p0, Lorg/zeromq/ZActor$ActorFortune;->actor:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1}, Lorg/zeromq/ZActor$Actor;->premiere(Lorg/zeromq/ZMQ$Socket;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
