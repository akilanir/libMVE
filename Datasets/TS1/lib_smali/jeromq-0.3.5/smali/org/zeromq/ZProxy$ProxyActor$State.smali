.class final Lorg/zeromq/ZProxy$ProxyActor$State;
.super Ljava/lang/Object;
.source "ZProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZProxy$ProxyActor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field private alive:Z

.field private hot:Lorg/zeromq/ZMsg;

.field private paused:Z

.field private restart:Z

.field private started:Z


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 693
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 696
    iput-boolean v0, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->alive:Z

    .line 698
    iput-boolean v0, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->started:Z

    .line 700
    iput-boolean v0, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->paused:Z

    .line 703
    iput-boolean v0, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->restart:Z

    return-void
.end method

.method synthetic constructor <init>(Lorg/zeromq/ZProxy$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/zeromq/ZProxy$1;

    .prologue
    .line 693
    invoke-direct {p0}, Lorg/zeromq/ZProxy$ProxyActor$State;-><init>()V

    return-void
.end method

.method static synthetic access$1100(Lorg/zeromq/ZProxy$ProxyActor$State;)Z
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZProxy$ProxyActor$State;

    .prologue
    .line 693
    iget-boolean v0, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->started:Z

    return v0
.end method

.method static synthetic access$1102(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZProxy$ProxyActor$State;
    .param p1, "x1"    # Z

    .prologue
    .line 693
    iput-boolean p1, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->started:Z

    return p1
.end method

.method static synthetic access$1200(Lorg/zeromq/ZProxy$ProxyActor$State;)Z
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZProxy$ProxyActor$State;

    .prologue
    .line 693
    iget-boolean v0, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->paused:Z

    return v0
.end method

.method static synthetic access$1202(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZProxy$ProxyActor$State;
    .param p1, "x1"    # Z

    .prologue
    .line 693
    iput-boolean p1, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->paused:Z

    return p1
.end method

.method static synthetic access$1300(Lorg/zeromq/ZProxy$ProxyActor$State;)Z
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZProxy$ProxyActor$State;

    .prologue
    .line 693
    iget-boolean v0, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->restart:Z

    return v0
.end method

.method static synthetic access$1302(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZProxy$ProxyActor$State;
    .param p1, "x1"    # Z

    .prologue
    .line 693
    iput-boolean p1, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->restart:Z

    return p1
.end method

.method static synthetic access$200(Lorg/zeromq/ZProxy$ProxyActor$State;)Z
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZProxy$ProxyActor$State;

    .prologue
    .line 693
    iget-boolean v0, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->alive:Z

    return v0
.end method

.method static synthetic access$202(Lorg/zeromq/ZProxy$ProxyActor$State;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZProxy$ProxyActor$State;
    .param p1, "x1"    # Z

    .prologue
    .line 693
    iput-boolean p1, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->alive:Z

    return p1
.end method

.method static synthetic access$300(Lorg/zeromq/ZProxy$ProxyActor$State;)Lorg/zeromq/ZMsg;
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZProxy$ProxyActor$State;

    .prologue
    .line 693
    iget-object v0, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->hot:Lorg/zeromq/ZMsg;

    return-object v0
.end method

.method static synthetic access$302(Lorg/zeromq/ZProxy$ProxyActor$State;Lorg/zeromq/ZMsg;)Lorg/zeromq/ZMsg;
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZProxy$ProxyActor$State;
    .param p1, "x1"    # Lorg/zeromq/ZMsg;

    .prologue
    .line 693
    iput-object p1, p0, Lorg/zeromq/ZProxy$ProxyActor$State;->hot:Lorg/zeromq/ZMsg;

    return-object p1
.end method
