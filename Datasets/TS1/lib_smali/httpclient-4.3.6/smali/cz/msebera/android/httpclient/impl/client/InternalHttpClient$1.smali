.class Lcz/msebera/android/httpclient/impl/client/InternalHttpClient$1;
.super Ljava/lang/Object;
.source "InternalHttpClient.java"

# interfaces
.implements Lcz/msebera/android/httpclient/conn/ClientConnectionManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;->getConnectionManager()Lcz/msebera/android/httpclient/conn/ClientConnectionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;


# direct methods
.method constructor <init>(Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;)V
    .registers 2
    .param p1, "this$0"    # Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;

    .prologue
    .line 209
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/InternalHttpClient$1;->this$0:Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public closeExpiredConnections()V
    .registers 2

    .prologue
    .line 235
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/InternalHttpClient$1;->this$0:Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;

    # getter for: Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;
    invoke-static {v0}, Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;->access$000(Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;)Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->closeExpiredConnections()V

    .line 236
    return-void
.end method

.method public closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    .registers 5
    .param p1, "idletime"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 231
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/InternalHttpClient$1;->this$0:Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;

    # getter for: Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;
    invoke-static {v0}, Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;->access$000(Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;)Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V

    .line 232
    return-void
.end method

.method public getSchemeRegistry()Lcz/msebera/android/httpclient/conn/scheme/SchemeRegistry;
    .registers 2

    .prologue
    .line 227
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public releaseConnection(Lcz/msebera/android/httpclient/conn/ManagedClientConnection;JLjava/util/concurrent/TimeUnit;)V
    .registers 6
    .param p1, "conn"    # Lcz/msebera/android/httpclient/conn/ManagedClientConnection;
    .param p2, "validDuration"    # J
    .param p4, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 223
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public requestConnection(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Ljava/lang/Object;)Lcz/msebera/android/httpclient/conn/ClientConnectionRequest;
    .registers 4
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 217
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public shutdown()V
    .registers 2

    .prologue
    .line 212
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/InternalHttpClient$1;->this$0:Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;

    # getter for: Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;->connManager:Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;
    invoke-static {v0}, Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;->access$000(Lcz/msebera/android/httpclient/impl/client/InternalHttpClient;)Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;->shutdown()V

    .line 213
    return-void
.end method
