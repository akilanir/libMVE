.class Linfo/guardianproject/netcipher/client/StrongHttpsClient$1;
.super Linfo/guardianproject/netcipher/client/MyThreadSafeClientConnManager;
.source "StrongHttpsClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Linfo/guardianproject/netcipher/client/StrongHttpsClient;->createClientConnectionManager()Lch/boye/httpclientandroidlib/impl/conn/tsccm/ThreadSafeClientConnManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Linfo/guardianproject/netcipher/client/StrongHttpsClient;


# direct methods
.method constructor <init>(Linfo/guardianproject/netcipher/client/StrongHttpsClient;Lch/boye/httpclientandroidlib/params/HttpParams;Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)V
    .registers 4
    .param p2, "x0"    # Lch/boye/httpclientandroidlib/params/HttpParams;
    .param p3, "x1"    # Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    .prologue
    .line 99
    iput-object p1, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient$1;->this$0:Linfo/guardianproject/netcipher/client/StrongHttpsClient;

    invoke-direct {p0, p2, p3}, Linfo/guardianproject/netcipher/client/MyThreadSafeClientConnManager;-><init>(Lch/boye/httpclientandroidlib/params/HttpParams;Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)V

    return-void
.end method


# virtual methods
.method protected createConnectionOperator(Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)Lch/boye/httpclientandroidlib/conn/ClientConnectionOperator;
    .registers 5
    .param p1, "schreg"    # Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    .prologue
    .line 105
    new-instance v0, Linfo/guardianproject/netcipher/client/SocksProxyClientConnOperator;

    iget-object v1, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient$1;->this$0:Linfo/guardianproject/netcipher/client/StrongHttpsClient;

    # getter for: Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyHost:Lch/boye/httpclientandroidlib/HttpHost;
    invoke-static {v1}, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->access$000(Linfo/guardianproject/netcipher/client/StrongHttpsClient;)Lch/boye/httpclientandroidlib/HttpHost;

    move-result-object v1

    invoke-virtual {v1}, Lch/boye/httpclientandroidlib/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Linfo/guardianproject/netcipher/client/StrongHttpsClient$1;->this$0:Linfo/guardianproject/netcipher/client/StrongHttpsClient;

    # getter for: Linfo/guardianproject/netcipher/client/StrongHttpsClient;->proxyHost:Lch/boye/httpclientandroidlib/HttpHost;
    invoke-static {v2}, Linfo/guardianproject/netcipher/client/StrongHttpsClient;->access$000(Linfo/guardianproject/netcipher/client/StrongHttpsClient;)Lch/boye/httpclientandroidlib/HttpHost;

    move-result-object v2

    invoke-virtual {v2}, Lch/boye/httpclientandroidlib/HttpHost;->getPort()I

    move-result v2

    invoke-direct {v0, p1, v1, v2}, Linfo/guardianproject/netcipher/client/SocksProxyClientConnOperator;-><init>(Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;Ljava/lang/String;I)V

    return-object v0
.end method
