.class Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;
.super Ljava/lang/Object;
.source "MailSSLSocketFactory.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/util/MailSSLSocketFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MailTrustManager"
.end annotation


# instance fields
.field private adapteeTrustManager:Ljavax/net/ssl/X509TrustManager;

.field final synthetic this$0:Lcom/sun/mail/util/MailSSLSocketFactory;


# direct methods
.method private constructor <init>(Lcom/sun/mail/util/MailSSLSocketFactory;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 337
    iput-object p1, p0, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;->this$0:Lcom/sun/mail/util/MailSSLSocketFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 332
    iput-object v1, p0, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;->adapteeTrustManager:Ljavax/net/ssl/X509TrustManager;

    .line 338
    const-string v2, "X509"

    invoke-static {v2}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v0

    .line 339
    .local v0, "tmf":Ljavax/net/ssl/TrustManagerFactory;
    check-cast v1, Ljava/security/KeyStore;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 340
    invoke-virtual {v0}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    check-cast v1, Ljavax/net/ssl/X509TrustManager;

    iput-object v1, p0, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;->adapteeTrustManager:Ljavax/net/ssl/X509TrustManager;

    .line 341
    return-void
.end method

.method synthetic constructor <init>(Lcom/sun/mail/util/MailSSLSocketFactory;Lcom/sun/mail/util/MailSSLSocketFactory$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/sun/mail/util/MailSSLSocketFactory;
    .param p2, "x1"    # Lcom/sun/mail/util/MailSSLSocketFactory$1;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 329
    invoke-direct {p0, p1}, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;-><init>(Lcom/sun/mail/util/MailSSLSocketFactory;)V

    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .registers 4
    .param p1, "certs"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 349
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;->this$0:Lcom/sun/mail/util/MailSSLSocketFactory;

    invoke-virtual {v0}, Lcom/sun/mail/util/MailSSLSocketFactory;->isTrustAllHosts()Z

    move-result v0

    if-nez v0, :cond_15

    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;->this$0:Lcom/sun/mail/util/MailSSLSocketFactory;

    invoke-virtual {v0}, Lcom/sun/mail/util/MailSSLSocketFactory;->getTrustedHosts()[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_15

    .line 350
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;->adapteeTrustManager:Ljavax/net/ssl/X509TrustManager;

    invoke-interface {v0, p1, p2}, Ljavax/net/ssl/X509TrustManager;->checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V

    .line 351
    :cond_15
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .registers 4
    .param p1, "certs"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 360
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;->this$0:Lcom/sun/mail/util/MailSSLSocketFactory;

    invoke-virtual {v0}, Lcom/sun/mail/util/MailSSLSocketFactory;->isTrustAllHosts()Z

    move-result v0

    if-nez v0, :cond_15

    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;->this$0:Lcom/sun/mail/util/MailSSLSocketFactory;

    invoke-virtual {v0}, Lcom/sun/mail/util/MailSSLSocketFactory;->getTrustedHosts()[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_15

    .line 361
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;->adapteeTrustManager:Ljavax/net/ssl/X509TrustManager;

    invoke-interface {v0, p1, p2}, Ljavax/net/ssl/X509TrustManager;->checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V

    .line 362
    :cond_15
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .registers 2

    .prologue
    .line 368
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;->adapteeTrustManager:Ljavax/net/ssl/X509TrustManager;

    invoke-interface {v0}, Ljavax/net/ssl/X509TrustManager;->getAcceptedIssuers()[Ljava/security/cert/X509Certificate;

    move-result-object v0

    return-object v0
.end method
