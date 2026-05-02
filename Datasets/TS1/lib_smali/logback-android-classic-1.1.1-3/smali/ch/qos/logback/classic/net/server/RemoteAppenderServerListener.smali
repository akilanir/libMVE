.class Lch/qos/logback/classic/net/server/RemoteAppenderServerListener;
.super Lch/qos/logback/core/net/server/ServerSocketListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lch/qos/logback/core/net/server/ServerSocketListener",
        "<",
        "Lch/qos/logback/classic/net/server/RemoteAppenderClient;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/net/ServerSocket;)V
    .registers 2

    invoke-direct {p0, p1}, Lch/qos/logback/core/net/server/ServerSocketListener;-><init>(Ljava/net/ServerSocket;)V

    return-void
.end method


# virtual methods
.method protected createClient(Ljava/lang/String;Ljava/net/Socket;)Lch/qos/logback/classic/net/server/RemoteAppenderClient;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;

    invoke-direct {v0, p1, p2}, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;-><init>(Ljava/lang/String;Ljava/net/Socket;)V

    return-object v0
.end method

.method protected bridge synthetic createClient(Ljava/lang/String;Ljava/net/Socket;)Lch/qos/logback/core/net/server/Client;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lch/qos/logback/classic/net/server/RemoteAppenderServerListener;->createClient(Ljava/lang/String;Ljava/net/Socket;)Lch/qos/logback/classic/net/server/RemoteAppenderClient;

    move-result-object v0

    return-object v0
.end method
