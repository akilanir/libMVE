.class public Lorg/jivesoftware/smack/ConnectionConfiguration;
.super Ljava/lang/Object;
.source "ConnectionConfiguration.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;
    }
.end annotation


# instance fields
.field private callbackHandler:Ljavax/security/auth/callback/CallbackHandler;

.field private compressionEnabled:Z

.field private debuggerEnabled:Z

.field private expiredCertificatesCheckEnabled:Z

.field private host:Ljava/lang/String;

.field private keystorePath:Ljava/lang/String;

.field private keystoreType:Ljava/lang/String;

.field private notMatchingDomainCheckEnabled:Z

.field private password:Ljava/lang/String;

.field private pkcs11Library:Ljava/lang/String;

.field private port:I

.field protected proxy:Lorg/jivesoftware/smack/proxy/ProxyInfo;

.field private reconnectionAllowed:Z

.field private resource:Ljava/lang/String;

.field private rosterLoadedAtLogin:Z

.field private saslAuthenticationEnabled:Z

.field private securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

.field private selfSignedCertificateEnabled:Z

.field private sendPresence:Z

.field private serviceName:Ljava/lang/String;

.field private socketFactory:Ljavax/net/SocketFactory;

.field private truststorePassword:Ljava/lang/String;

.field private truststorePath:Ljava/lang/String;

.field private truststoreType:Ljava/lang/String;

.field private username:Ljava/lang/String;

.field private verifyChainEnabled:Z

.field private verifyRootCAEnabled:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 6
    .param p1, "serviceName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 58
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 59
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 60
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 61
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 63
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 65
    iput-boolean v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 71
    sget-boolean v1, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 74
    iput-boolean v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 83
    iput-boolean v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 84
    iput-boolean v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 85
    sget-object v1, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 99
    invoke-static {p1}, Lorg/jivesoftware/smack/util/DNSUtil;->resolveXMPPDomain(Ljava/lang/String;)Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;

    move-result-object v0

    .line 100
    .local v0, "address":Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->getPort()I

    move-result v2

    invoke-static {}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->forDefaultProxy()Lorg/jivesoftware/smack/proxy/ProxyInfo;

    move-result-object v3

    invoke-direct {p0, v1, v2, p1, v3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 58
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 59
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 60
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 61
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 63
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 65
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 71
    sget-boolean v0, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 74
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 83
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 84
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 85
    sget-object v0, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 164
    invoke-static {}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->forDefaultProxy()Lorg/jivesoftware/smack/proxy/ProxyInfo;

    move-result-object v0

    invoke-direct {p0, p1, p2, p1, v0}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 165
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "serviceName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 58
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 59
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 60
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 61
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 63
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 65
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 71
    sget-boolean v0, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 74
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 83
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 84
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 85
    sget-object v0, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 134
    invoke-static {}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->forDefaultProxy()Lorg/jivesoftware/smack/proxy/ProxyInfo;

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 135
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V
    .registers 7
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "serviceName"    # Ljava/lang/String;
    .param p4, "proxy"    # Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 58
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 59
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 60
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 61
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 63
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 65
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 71
    sget-boolean v0, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 74
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 83
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 84
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 85
    sget-object v0, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 153
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 154
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILorg/jivesoftware/smack/proxy/ProxyInfo;)V
    .registers 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "proxy"    # Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 58
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 59
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 60
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 61
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 63
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 65
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 71
    sget-boolean v0, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 74
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 83
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 84
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 85
    sget-object v0, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 176
    invoke-direct {p0, p1, p2, p1, p3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 177
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V
    .registers 6
    .param p1, "serviceName"    # Ljava/lang/String;
    .param p2, "proxy"    # Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 58
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 59
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 60
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 61
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 63
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 65
    iput-boolean v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 71
    sget-boolean v1, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 74
    iput-boolean v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 83
    iput-boolean v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 84
    iput-boolean v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 85
    sget-object v1, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 115
    invoke-static {p1}, Lorg/jivesoftware/smack/util/DNSUtil;->resolveXMPPDomain(Ljava/lang/String;)Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;

    move-result-object v0

    .line 116
    .local v0, "address":Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/DNSUtil$HostAddress;->getPort()I

    move-result v2

    invoke-direct {p0, v1, v2, p1, p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 117
    return-void
.end method

.method private init(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V
    .registers 9
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "serviceName"    # Ljava/lang/String;
    .param p4, "proxy"    # Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .prologue
    .line 180
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->host:Ljava/lang/String;

    .line 181
    iput p2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->port:I

    .line 182
    iput-object p3, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->serviceName:Ljava/lang/String;

    .line 183
    iput-object p4, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->proxy:Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .line 187
    const-string v2, "java.home"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "javaHome":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "lib"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "security"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "cacerts"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePath:Ljava/lang/String;

    .line 194
    const-string v2, "jks"

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststoreType:Ljava/lang/String;

    .line 196
    const-string v2, "changeit"

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePassword:Ljava/lang/String;

    .line 197
    const-string v2, "javax.net.ssl.keyStore"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystorePath:Ljava/lang/String;

    .line 198
    const-string v2, "jks"

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystoreType:Ljava/lang/String;

    .line 199
    const-string v2, "pkcs11.config"

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->pkcs11Library:Ljava/lang/String;

    .line 202
    invoke-virtual {p4}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->socketFactory:Ljavax/net/SocketFactory;

    .line 203
    return-void
.end method


# virtual methods
.method public getCallbackHandler()Ljavax/security/auth/callback/CallbackHandler;
    .registers 2

    .prologue
    .line 630
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->callbackHandler:Ljavax/security/auth/callback/CallbackHandler;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 231
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getKeystorePath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 332
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystorePath:Ljava/lang/String;

    return-object v0
.end method

.method public getKeystoreType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 352
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystoreType:Ljava/lang/String;

    return-object v0
.end method

.method public getPKCS11Library()Ljava/lang/String;
    .registers 2

    .prologue
    .line 372
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->pkcs11Library:Ljava/lang/String;

    return-object v0
.end method

.method getPassword()Ljava/lang/String;
    .registers 2

    .prologue
    .line 698
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 241
    iget v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->port:I

    return v0
.end method

.method getResource()Ljava/lang/String;
    .registers 2

    .prologue
    .line 707
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->resource:Ljava/lang/String;

    return-object v0
.end method

.method public getSecurityMode()Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;
    .registers 2

    .prologue
    .line 251
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    return-object v0
.end method

.method public getServiceName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 220
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->serviceName:Ljava/lang/String;

    return-object v0
.end method

.method public getSocketFactory()Ljavax/net/SocketFactory;
    .registers 2

    .prologue
    .line 653
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method

.method public getTruststorePassword()Ljava/lang/String;
    .registers 2

    .prologue
    .line 311
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePassword:Ljava/lang/String;

    return-object v0
.end method

.method public getTruststorePath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 272
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePath:Ljava/lang/String;

    return-object v0
.end method

.method public getTruststoreType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 292
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststoreType:Ljava/lang/String;

    return-object v0
.end method

.method getUsername()Ljava/lang/String;
    .registers 2

    .prologue
    .line 689
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->username:Ljava/lang/String;

    return-object v0
.end method

.method public isCompressionEnabled()Z
    .registers 2

    .prologue
    .line 498
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    return v0
.end method

.method public isDebuggerEnabled()Z
    .registers 2

    .prologue
    .line 544
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    return v0
.end method

.method public isExpiredCertificatesCheckEnabled()Z
    .registers 2

    .prologue
    .line 453
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    return v0
.end method

.method public isNotMatchingDomainCheckEnabled()Z
    .registers 2

    .prologue
    .line 475
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    return v0
.end method

.method public isReconnectionAllowed()Z
    .registers 2

    .prologue
    .line 573
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    return v0
.end method

.method public isRosterLoadedAtLogin()Z
    .registers 2

    .prologue
    .line 606
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    return v0
.end method

.method public isSASLAuthenticationEnabled()Z
    .registers 2

    .prologue
    .line 522
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    return v0
.end method

.method public isSelfSignedCertificateEnabled()Z
    .registers 2

    .prologue
    .line 432
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    return v0
.end method

.method isSendPresence()Z
    .registers 2

    .prologue
    .line 716
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    return v0
.end method

.method public isVerifyChainEnabled()Z
    .registers 2

    .prologue
    .line 393
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    return v0
.end method

.method public isVerifyRootCAEnabled()Z
    .registers 2

    .prologue
    .line 413
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    return v0
.end method

.method public setCallbackHandler(Ljavax/security/auth/callback/CallbackHandler;)V
    .registers 2
    .param p1, "callbackHandler"    # Ljavax/security/auth/callback/CallbackHandler;

    .prologue
    .line 643
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->callbackHandler:Ljavax/security/auth/callback/CallbackHandler;

    .line 644
    return-void
.end method

.method public setCompressionEnabled(Z)V
    .registers 2
    .param p1, "compressionEnabled"    # Z

    .prologue
    .line 510
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 511
    return-void
.end method

.method public setDebuggerEnabled(Z)V
    .registers 2
    .param p1, "debuggerEnabled"    # Z

    .prologue
    .line 554
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 555
    return-void
.end method

.method public setExpiredCertificatesCheckEnabled(Z)V
    .registers 2
    .param p1, "expiredCertificatesCheckEnabled"    # Z

    .prologue
    .line 464
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 465
    return-void
.end method

.method public setKeystorePath(Ljava/lang/String;)V
    .registers 2
    .param p1, "keystorePath"    # Ljava/lang/String;

    .prologue
    .line 343
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystorePath:Ljava/lang/String;

    .line 344
    return-void
.end method

.method public setKeystoreType(Ljava/lang/String;)V
    .registers 2
    .param p1, "keystoreType"    # Ljava/lang/String;

    .prologue
    .line 361
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystoreType:Ljava/lang/String;

    .line 362
    return-void
.end method

.method setLoginInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "resource"    # Ljava/lang/String;

    .prologue
    .line 720
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->username:Ljava/lang/String;

    .line 721
    iput-object p2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->password:Ljava/lang/String;

    .line 722
    iput-object p3, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->resource:Ljava/lang/String;

    .line 723
    return-void
.end method

.method public setNotMatchingDomainCheckEnabled(Z)V
    .registers 2
    .param p1, "notMatchingDomainCheckEnabled"    # Z

    .prologue
    .line 486
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 487
    return-void
.end method

.method public setPKCS11Library(Ljava/lang/String;)V
    .registers 2
    .param p1, "pkcs11Library"    # Ljava/lang/String;

    .prologue
    .line 382
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->pkcs11Library:Ljava/lang/String;

    .line 383
    return-void
.end method

.method public setReconnectionAllowed(Z)V
    .registers 2
    .param p1, "isAllowed"    # Z

    .prologue
    .line 564
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 565
    return-void
.end method

.method public setRosterLoadedAtLogin(Z)V
    .registers 2
    .param p1, "rosterLoadedAtLogin"    # Z

    .prologue
    .line 617
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 618
    return-void
.end method

.method public setSASLAuthenticationEnabled(Z)V
    .registers 2
    .param p1, "saslAuthenticationEnabled"    # Z

    .prologue
    .line 534
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 535
    return-void
.end method

.method public setSecurityMode(Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;)V
    .registers 2
    .param p1, "securityMode"    # Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .prologue
    .line 261
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 262
    return-void
.end method

.method public setSelfSignedCertificateEnabled(Z)V
    .registers 2
    .param p1, "selfSignedCertificateEnabled"    # Z

    .prologue
    .line 442
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 443
    return-void
.end method

.method public setSendPresence(Z)V
    .registers 2
    .param p1, "sendPresence"    # Z

    .prologue
    .line 595
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 596
    return-void
.end method

.method public setServiceName(Ljava/lang/String;)V
    .registers 2
    .param p1, "serviceName"    # Ljava/lang/String;

    .prologue
    .line 211
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->serviceName:Ljava/lang/String;

    .line 212
    return-void
.end method

.method public setSocketFactory(Ljavax/net/SocketFactory;)V
    .registers 2
    .param p1, "socketFactory"    # Ljavax/net/SocketFactory;

    .prologue
    .line 583
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->socketFactory:Ljavax/net/SocketFactory;

    .line 584
    return-void
.end method

.method public setTruststorePassword(Ljava/lang/String;)V
    .registers 2
    .param p1, "truststorePassword"    # Ljava/lang/String;

    .prologue
    .line 321
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePassword:Ljava/lang/String;

    .line 322
    return-void
.end method

.method public setTruststorePath(Ljava/lang/String;)V
    .registers 2
    .param p1, "truststorePath"    # Ljava/lang/String;

    .prologue
    .line 283
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePath:Ljava/lang/String;

    .line 284
    return-void
.end method

.method public setTruststoreType(Ljava/lang/String;)V
    .registers 2
    .param p1, "truststoreType"    # Ljava/lang/String;

    .prologue
    .line 301
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststoreType:Ljava/lang/String;

    .line 302
    return-void
.end method

.method public setVerifyChainEnabled(Z)V
    .registers 2
    .param p1, "verifyChainEnabled"    # Z

    .prologue
    .line 404
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 405
    return-void
.end method

.method public setVerifyRootCAEnabled(Z)V
    .registers 2
    .param p1, "verifyRootCAEnabled"    # Z

    .prologue
    .line 422
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 423
    return-void
.end method
