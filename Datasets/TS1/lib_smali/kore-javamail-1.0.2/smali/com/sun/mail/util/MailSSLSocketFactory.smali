.class public Lcom/sun/mail/util/MailSSLSocketFactory;
.super Ljavax/net/ssl/SSLSocketFactory;
.source "MailSSLSocketFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;
    }
.end annotation


# instance fields
.field private adapteeFactory:Ljavax/net/ssl/SSLSocketFactory;

.field private keyManagers:[Ljavax/net/ssl/KeyManager;

.field private secureRandom:Ljava/security/SecureRandom;

.field private sslcontext:Ljavax/net/ssl/SSLContext;

.field private trustAllHosts:Z

.field private trustManagers:[Ljavax/net/ssl/TrustManager;

.field private trustedHosts:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 94
    const-string v0, "TLS"

    invoke-direct {p0, v0}, Lcom/sun/mail/util/MailSSLSocketFactory;-><init>(Ljava/lang/String;)V

    .line 95
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 6
    .param p1, "protocol"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 106
    invoke-direct {p0}, Ljavax/net/ssl/SSLSocketFactory;-><init>()V

    .line 71
    iput-object v2, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustedHosts:[Ljava/lang/String;

    .line 86
    iput-object v2, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->adapteeFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 109
    iput-boolean v3, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustAllHosts:Z

    .line 112
    invoke-static {p1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->sslcontext:Ljavax/net/ssl/SSLContext;

    .line 115
    iput-object v2, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->keyManagers:[Ljavax/net/ssl/KeyManager;

    .line 116
    const/4 v0, 0x1

    new-array v0, v0, [Ljavax/net/ssl/TrustManager;

    new-instance v1, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;

    invoke-direct {v1, p0, v2}, Lcom/sun/mail/util/MailSSLSocketFactory$MailTrustManager;-><init>(Lcom/sun/mail/util/MailSSLSocketFactory;Lcom/sun/mail/util/MailSSLSocketFactory$1;)V

    aput-object v1, v0, v3

    iput-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustManagers:[Ljavax/net/ssl/TrustManager;

    .line 117
    iput-object v2, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->secureRandom:Ljava/security/SecureRandom;

    .line 120
    invoke-direct {p0}, Lcom/sun/mail/util/MailSSLSocketFactory;->newAdapteeFactory()V

    .line 121
    return-void
.end method

.method private declared-synchronized newAdapteeFactory()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyManagementException;
        }
    .end annotation

    .prologue
    .line 133
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->sslcontext:Ljavax/net/ssl/SSLContext;

    iget-object v1, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->keyManagers:[Ljavax/net/ssl/KeyManager;

    iget-object v2, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustManagers:[Ljavax/net/ssl/TrustManager;

    iget-object v3, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->secureRandom:Ljava/security/SecureRandom;

    invoke-virtual {v0, v1, v2, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 136
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->sslcontext:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->adapteeFactory:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 137
    monitor-exit p0

    return-void

    .line 133
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized createSocket()Ljava/net/Socket;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 279
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->adapteeFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createSocket(Ljava/lang/String;I)Ljava/net/Socket;
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 318
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->adapteeFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "i"    # I
    .param p3, "inetaddress"    # Ljava/net/InetAddress;
    .param p4, "j"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 309
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->adapteeFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    .registers 4
    .param p1, "inetaddress"    # Ljava/net/InetAddress;
    .param p2, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 298
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->adapteeFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 6
    .param p1, "inetaddress"    # Ljava/net/InetAddress;
    .param p2, "i"    # I
    .param p3, "inetaddress1"    # Ljava/net/InetAddress;
    .param p4, "j"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->adapteeFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "s"    # Ljava/lang/String;
    .param p3, "i"    # I
    .param p4, "flag"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->adapteeFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDefaultCipherSuites()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 263
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->adapteeFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->getDefaultCipherSuites()[Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getKeyManagers()[Ljavax/net/ssl/KeyManager;
    .registers 2

    .prologue
    .line 143
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->keyManagers:[Ljavax/net/ssl/KeyManager;

    invoke-virtual {v0}, [Ljavax/net/ssl/KeyManager;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljavax/net/ssl/KeyManager;

    check-cast v0, [Ljavax/net/ssl/KeyManager;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    monitor-exit p0

    return-object v0

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSecureRandom()Ljava/security/SecureRandom;
    .registers 2

    .prologue
    .line 160
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->secureRandom:Ljava/security/SecureRandom;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSupportedCipherSuites()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 271
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->adapteeFactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->getSupportedCipherSuites()[Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getTrustManagers()[Ljavax/net/ssl/TrustManager;
    .registers 2

    .prologue
    .line 177
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustManagers:[Ljavax/net/ssl/TrustManager;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getTrustedHosts()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 208
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustedHosts:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    monitor-exit p0

    return-object v0

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isServerTrusted(Ljava/lang/String;Ljavax/net/ssl/SSLSocket;)Z
    .registers 5
    .param p1, "server"    # Ljava/lang/String;
    .param p2, "sslSocket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    const/4 v0, 0x1

    .line 233
    monitor-enter p0

    :try_start_2
    iget-boolean v1, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustAllHosts:Z
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_17

    if-eqz v1, :cond_8

    .line 242
    :cond_6
    :goto_6
    monitor-exit p0

    return v0

    .line 238
    :cond_8
    :try_start_8
    iget-object v1, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustedHosts:[Ljava/lang/String;

    if-eqz v1, :cond_6

    .line 239
    iget-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustedHosts:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    :try_end_15
    .catchall {:try_start_8 .. :try_end_15} :catchall_17

    move-result v0

    goto :goto_6

    .line 233
    :catchall_17
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isTrustAllHosts()Z
    .registers 2

    .prologue
    .line 194
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustAllHosts:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setKeyManagers([Ljavax/net/ssl/KeyManager;)V
    .registers 3
    .param p1, "keyManagers"    # [Ljavax/net/ssl/KeyManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 152
    monitor-enter p0

    :try_start_1
    invoke-virtual {p1}, [Ljavax/net/ssl/KeyManager;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljavax/net/ssl/KeyManager;

    check-cast v0, [Ljavax/net/ssl/KeyManager;

    iput-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->keyManagers:[Ljavax/net/ssl/KeyManager;

    .line 153
    invoke-direct {p0}, Lcom/sun/mail/util/MailSSLSocketFactory;->newAdapteeFactory()V
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    .line 154
    monitor-exit p0

    return-void

    .line 152
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSecureRandom(Ljava/security/SecureRandom;)V
    .registers 3
    .param p1, "secureRandom"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 169
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->secureRandom:Ljava/security/SecureRandom;

    .line 170
    invoke-direct {p0}, Lcom/sun/mail/util/MailSSLSocketFactory;->newAdapteeFactory()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 171
    monitor-exit p0

    return-void

    .line 169
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setTrustAllHosts(Z)V
    .registers 3
    .param p1, "trustAllHosts"    # Z

    .prologue
    .line 201
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustAllHosts:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 202
    monitor-exit p0

    return-void

    .line 201
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setTrustManagers([Ljavax/net/ssl/TrustManager;)V
    .registers 3
    .param p1, "trustManagers"    # [Ljavax/net/ssl/TrustManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 186
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustManagers:[Ljavax/net/ssl/TrustManager;

    .line 187
    invoke-direct {p0}, Lcom/sun/mail/util/MailSSLSocketFactory;->newAdapteeFactory()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 188
    monitor-exit p0

    return-void

    .line 186
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setTrustedHosts([Ljava/lang/String;)V
    .registers 3
    .param p1, "trustedHosts"    # [Ljava/lang/String;

    .prologue
    .line 215
    monitor-enter p0

    :try_start_1
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/sun/mail/util/MailSSLSocketFactory;->trustedHosts:[Ljava/lang/String;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 216
    monitor-exit p0

    return-void

    .line 215
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method
