.class Lzmq/Router$Outpipe;
.super Ljava/lang/Object;
.source "Router.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Router;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Outpipe"
.end annotation


# instance fields
.field private active:Z

.field private pipe:Lzmq/Pipe;

.field final synthetic this$0:Lzmq/Router;


# direct methods
.method public constructor <init>(Lzmq/Router;Lzmq/Pipe;Z)V
    .registers 4
    .param p2, "pipe"    # Lzmq/Pipe;
    .param p3, "active"    # Z

    .prologue
    .line 66
    iput-object p1, p0, Lzmq/Router$Outpipe;->this$0:Lzmq/Router;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p2, p0, Lzmq/Router$Outpipe;->pipe:Lzmq/Pipe;

    .line 68
    iput-boolean p3, p0, Lzmq/Router$Outpipe;->active:Z

    .line 69
    return-void
.end method

.method static synthetic access$000(Lzmq/Router$Outpipe;)Lzmq/Pipe;
    .registers 2
    .param p0, "x0"    # Lzmq/Router$Outpipe;

    .prologue
    .line 60
    iget-object v0, p0, Lzmq/Router$Outpipe;->pipe:Lzmq/Pipe;

    return-object v0
.end method

.method static synthetic access$100(Lzmq/Router$Outpipe;)Z
    .registers 2
    .param p0, "x0"    # Lzmq/Router$Outpipe;

    .prologue
    .line 60
    iget-boolean v0, p0, Lzmq/Router$Outpipe;->active:Z

    return v0
.end method

.method static synthetic access$102(Lzmq/Router$Outpipe;Z)Z
    .registers 2
    .param p0, "x0"    # Lzmq/Router$Outpipe;
    .param p1, "x1"    # Z

    .prologue
    .line 60
    iput-boolean p1, p0, Lzmq/Router$Outpipe;->active:Z

    return p1
.end method
