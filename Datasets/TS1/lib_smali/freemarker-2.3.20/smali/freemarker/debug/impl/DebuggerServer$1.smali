.class Lfreemarker/debug/impl/DebuggerServer$1;
.super Ljava/lang/Object;
.source "DebuggerServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final this$0:Lfreemarker/debug/impl/DebuggerServer;


# direct methods
.method constructor <init>(Lfreemarker/debug/impl/DebuggerServer;)V
    .registers 2

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/debug/impl/DebuggerServer$1;->this$0:Lfreemarker/debug/impl/DebuggerServer;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lfreemarker/debug/impl/DebuggerServer$1;->this$0:Lfreemarker/debug/impl/DebuggerServer;

    invoke-static {v0}, Lfreemarker/debug/impl/DebuggerServer;->access$000(Lfreemarker/debug/impl/DebuggerServer;)V

    .line 108
    return-void
.end method
