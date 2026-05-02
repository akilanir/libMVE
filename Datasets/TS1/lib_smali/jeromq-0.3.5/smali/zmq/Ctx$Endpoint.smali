.class Lzmq/Ctx$Endpoint;
.super Ljava/lang/Object;
.source "Ctx.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Ctx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Endpoint"
.end annotation


# instance fields
.field public final options:Lzmq/Options;

.field public final socket:Lzmq/SocketBase;


# direct methods
.method public constructor <init>(Lzmq/SocketBase;Lzmq/Options;)V
    .registers 3
    .param p1, "socket"    # Lzmq/SocketBase;
    .param p2, "options"    # Lzmq/Options;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lzmq/Ctx$Endpoint;->socket:Lzmq/SocketBase;

    .line 53
    iput-object p2, p0, Lzmq/Ctx$Endpoint;->options:Lzmq/Options;

    .line 54
    return-void
.end method
