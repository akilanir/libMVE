.class Lch/qos/logback/core/net/server/ConcurrentServerRunner$ClientWrapper;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/net/server/Client;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lch/qos/logback/core/net/server/ConcurrentServerRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClientWrapper"
.end annotation


# instance fields
.field private final delegate:Lch/qos/logback/core/net/server/Client;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lch/qos/logback/core/net/server/ConcurrentServerRunner;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/net/server/ConcurrentServerRunner;Lch/qos/logback/core/net/server/Client;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iput-object p1, p0, Lch/qos/logback/core/net/server/ConcurrentServerRunner$ClientWrapper;->this$0:Lch/qos/logback/core/net/server/ConcurrentServerRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lch/qos/logback/core/net/server/ConcurrentServerRunner$ClientWrapper;->delegate:Lch/qos/logback/core/net/server/Client;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/server/ConcurrentServerRunner$ClientWrapper;->delegate:Lch/qos/logback/core/net/server/Client;

    invoke-interface {v0}, Lch/qos/logback/core/net/server/Client;->close()V

    return-void
.end method

.method public run()V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/net/server/ConcurrentServerRunner$ClientWrapper;->this$0:Lch/qos/logback/core/net/server/ConcurrentServerRunner;

    iget-object v1, p0, Lch/qos/logback/core/net/server/ConcurrentServerRunner$ClientWrapper;->delegate:Lch/qos/logback/core/net/server/Client;

    # invokes: Lch/qos/logback/core/net/server/ConcurrentServerRunner;->addClient(Lch/qos/logback/core/net/server/Client;)V
    invoke-static {v0, v1}, Lch/qos/logback/core/net/server/ConcurrentServerRunner;->access$000(Lch/qos/logback/core/net/server/ConcurrentServerRunner;Lch/qos/logback/core/net/server/Client;)V

    :try_start_7
    iget-object v0, p0, Lch/qos/logback/core/net/server/ConcurrentServerRunner$ClientWrapper;->delegate:Lch/qos/logback/core/net/server/Client;

    invoke-interface {v0}, Lch/qos/logback/core/net/server/Client;->run()V
    :try_end_c
    .catchall {:try_start_7 .. :try_end_c} :catchall_14

    iget-object v0, p0, Lch/qos/logback/core/net/server/ConcurrentServerRunner$ClientWrapper;->this$0:Lch/qos/logback/core/net/server/ConcurrentServerRunner;

    iget-object v1, p0, Lch/qos/logback/core/net/server/ConcurrentServerRunner$ClientWrapper;->delegate:Lch/qos/logback/core/net/server/Client;

    # invokes: Lch/qos/logback/core/net/server/ConcurrentServerRunner;->removeClient(Lch/qos/logback/core/net/server/Client;)V
    invoke-static {v0, v1}, Lch/qos/logback/core/net/server/ConcurrentServerRunner;->access$100(Lch/qos/logback/core/net/server/ConcurrentServerRunner;Lch/qos/logback/core/net/server/Client;)V

    return-void

    :catchall_14
    move-exception v0

    iget-object v1, p0, Lch/qos/logback/core/net/server/ConcurrentServerRunner$ClientWrapper;->this$0:Lch/qos/logback/core/net/server/ConcurrentServerRunner;

    iget-object v2, p0, Lch/qos/logback/core/net/server/ConcurrentServerRunner$ClientWrapper;->delegate:Lch/qos/logback/core/net/server/Client;

    # invokes: Lch/qos/logback/core/net/server/ConcurrentServerRunner;->removeClient(Lch/qos/logback/core/net/server/Client;)V
    invoke-static {v1, v2}, Lch/qos/logback/core/net/server/ConcurrentServerRunner;->access$100(Lch/qos/logback/core/net/server/ConcurrentServerRunner;Lch/qos/logback/core/net/server/Client;)V

    throw v0
.end method
