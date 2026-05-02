.class public Lorg/jivesoftware/smack/sasl/SASLGSSAPIMechanism;
.super Lorg/jivesoftware/smack/sasl/SASLMechanism;
.source "SASLGSSAPIMechanism.java"


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/SASLAuthentication;)V
    .registers 4
    .param p1, "saslAuthentication"    # Lorg/jivesoftware/smack/SASLAuthentication;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/sasl/SASLMechanism;-><init>(Lorg/jivesoftware/smack/SASLAuthentication;)V

    .line 42
    const-string v0, "javax.security.auth.useSubjectCredsOnly"

    const-string v1, "false"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 43
    const-string v0, "java.security.auth.login.config"

    const-string v1, "gss.conf"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    return-void
.end method


# virtual methods
.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 82
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLGSSAPIMechanism;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 83
    .local v0, "mechanisms":[Ljava/lang/String;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 84
    .local v4, "props":Ljava/util/Map;
    const-string v1, "javax.security.sasl.server.authentication"

    const-string v2, "TRUE"

    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    const-string v2, "xmpp"

    move-object v1, p1

    move-object v3, p2

    move-object v5, p0

    invoke-static/range {v0 .. v5}, Ljavax/security/sasl/Sasl;->createSaslClient([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)Ljavax/security/sasl/SaslClient;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/sasl/SASLGSSAPIMechanism;->sc:Ljavax/security/sasl/SaslClient;

    .line 86
    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLGSSAPIMechanism;->authenticate()V

    .line 87
    return-void
.end method

.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljavax/security/auth/callback/CallbackHandler;)V
    .registers 10
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "cbh"    # Ljavax/security/auth/callback/CallbackHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 63
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLGSSAPIMechanism;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 64
    .local v0, "mechanisms":[Ljava/lang/String;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 65
    .local v4, "props":Ljava/util/Map;
    const-string v1, "javax.security.sasl.server.authentication"

    const-string v2, "TRUE"

    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    const-string v2, "xmpp"

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Ljavax/security/sasl/Sasl;->createSaslClient([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)Ljavax/security/sasl/SaslClient;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/sasl/SASLGSSAPIMechanism;->sc:Ljavax/security/sasl/SaslClient;

    .line 67
    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLGSSAPIMechanism;->authenticate()V

    .line 68
    return-void
.end method

.method protected getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 48
    const-string v0, "GSSAPI"

    return-object v0
.end method
