.class public abstract Lorg/jivesoftware/smack/sasl/SASLMechanism;
.super Ljava/lang/Object;
.source "SASLMechanism.java"

# interfaces
.implements Ljavax/security/auth/callback/CallbackHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;,
        Lorg/jivesoftware/smack/sasl/SASLMechanism$Success;,
        Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;,
        Lorg/jivesoftware/smack/sasl/SASLMechanism$Challenge;,
        Lorg/jivesoftware/smack/sasl/SASLMechanism$AuthMechanism;
    }
.end annotation


# instance fields
.field protected authenticationId:Ljava/lang/String;

.field protected hostname:Ljava/lang/String;

.field protected password:Ljava/lang/String;

.field private saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

.field protected sc:Ljavax/security/sasl/SaslClient;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/SASLAuthentication;)V
    .registers 2
    .param p1, "saslAuthentication"    # Lorg/jivesoftware/smack/SASLAuthentication;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    .line 68
    return-void
.end method


# virtual methods
.method protected authenticate()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 114
    const/4 v0, 0x0

    .line 116
    .local v0, "authenticationText":Ljava/lang/String;
    :try_start_1
    iget-object v3, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    invoke-interface {v3}, Ljavax/security/sasl/SaslClient;->hasInitialResponse()Z

    move-result v3

    if-eqz v3, :cond_18

    .line 117
    iget-object v3, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    const/4 v4, 0x0

    new-array v4, v4, [B

    invoke-interface {v3, v4}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v2

    .line 118
    .local v2, "response":[B
    const/16 v3, 0x8

    invoke-static {v2, v3}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([BI)Ljava/lang/String;
    :try_end_17
    .catch Ljavax/security/sasl/SaslException; {:try_start_1 .. :try_end_17} :catch_29

    move-result-object v0

    .line 125
    .end local v2    # "response":[B
    :cond_18
    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v3

    new-instance v4, Lorg/jivesoftware/smack/sasl/SASLMechanism$AuthMechanism;

    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, v5, v0}, Lorg/jivesoftware/smack/sasl/SASLMechanism$AuthMechanism;-><init>(Lorg/jivesoftware/smack/sasl/SASLMechanism;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/SASLAuthentication;->send(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 126
    return-void

    .line 120
    :catch_29
    move-exception v1

    .line 121
    .local v1, "e":Ljavax/security/sasl/SaslException;
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string v4, "SASL authentication failed"

    invoke-direct {v3, v4, v1}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

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
    .line 86
    iput-object p1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticationId:Ljava/lang/String;

    .line 87
    iput-object p3, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->password:Ljava/lang/String;

    .line 88
    iput-object p2, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->hostname:Ljava/lang/String;

    .line 90
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 91
    .local v0, "mechanisms":[Ljava/lang/String;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 92
    .local v4, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "xmpp"

    move-object v1, p1

    move-object v3, p2

    move-object v5, p0

    invoke-static/range {v0 .. v5}, Ljavax/security/sasl/Sasl;->createSaslClient([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)Ljavax/security/sasl/SaslClient;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    .line 93
    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticate()V

    .line 94
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
    .line 107
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 108
    .local v0, "mechanisms":[Ljava/lang/String;
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 109
    .local v4, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "xmpp"

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Ljavax/security/sasl/Sasl;->createSaslClient([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)Ljavax/security/sasl/SaslClient;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    .line 110
    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticate()V

    .line 111
    return-void
.end method

.method public challengeReceived(Ljava/lang/String;)V
    .registers 6
    .param p1, "challenge"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    if-eqz p1, :cond_1b

    .line 139
    iget-object v2, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    invoke-static {p1}, Lorg/jivesoftware/smack/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v3

    invoke-interface {v2, v3}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v0

    .line 145
    .local v0, "response":[B
    :goto_c
    if-nez v0, :cond_25

    .line 146
    new-instance v1, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;-><init>(Lorg/jivesoftware/smack/sasl/SASLMechanism;)V

    .line 153
    .local v1, "responseStanza":Lorg/jivesoftware/smack/packet/Packet;
    :goto_13
    invoke-virtual {p0}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->send(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 154
    return-void

    .line 141
    .end local v0    # "response":[B
    .end local v1    # "responseStanza":Lorg/jivesoftware/smack/packet/Packet;
    :cond_1b
    iget-object v2, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->sc:Ljavax/security/sasl/SaslClient;

    const/4 v3, 0x0

    new-array v3, v3, [B

    invoke-interface {v2, v3}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v0

    .restart local v0    # "response":[B
    goto :goto_c

    .line 149
    :cond_25
    new-instance v1, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;

    const/16 v2, 0x8

    invoke-static {v0, v2}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([BI)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;-><init>(Lorg/jivesoftware/smack/sasl/SASLMechanism;Ljava/lang/String;)V

    .restart local v1    # "responseStanza":Lorg/jivesoftware/smack/packet/Packet;
    goto :goto_13
.end method

.method protected abstract getName()Ljava/lang/String;
.end method

.method protected getSASLAuthentication()Lorg/jivesoftware/smack/SASLAuthentication;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->saslAuthentication:Lorg/jivesoftware/smack/SASLAuthentication;

    return-object v0
.end method

.method public handle([Ljavax/security/auth/callback/Callback;)V
    .registers 8
    .param p1, "callbacks"    # [Ljavax/security/auth/callback/Callback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/security/auth/callback/UnsupportedCallbackException;
        }
    .end annotation

    .prologue
    .line 172
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v4, p1

    if-ge v0, v4, :cond_48

    .line 173
    aget-object v4, p1, v0

    instance-of v4, v4, Ljavax/security/auth/callback/NameCallback;

    if-eqz v4, :cond_16

    .line 174
    aget-object v1, p1, v0

    check-cast v1, Ljavax/security/auth/callback/NameCallback;

    .line 175
    .local v1, "ncb":Ljavax/security/auth/callback/NameCallback;
    iget-object v4, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticationId:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljavax/security/auth/callback/NameCallback;->setName(Ljava/lang/String;)V

    .line 172
    .end local v1    # "ncb":Ljavax/security/auth/callback/NameCallback;
    :cond_13
    :goto_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 176
    :cond_16
    aget-object v4, p1, v0

    instance-of v4, v4, Ljavax/security/auth/callback/PasswordCallback;

    if-eqz v4, :cond_2a

    .line 177
    aget-object v2, p1, v0

    check-cast v2, Ljavax/security/auth/callback/PasswordCallback;

    .line 178
    .local v2, "pcb":Ljavax/security/auth/callback/PasswordCallback;
    iget-object v4, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->password:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    invoke-virtual {v2, v4}, Ljavax/security/auth/callback/PasswordCallback;->setPassword([C)V

    goto :goto_13

    .line 179
    .end local v2    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    :cond_2a
    aget-object v4, p1, v0

    instance-of v4, v4, Ljavax/security/sasl/RealmCallback;

    if-eqz v4, :cond_3a

    .line 180
    aget-object v3, p1, v0

    check-cast v3, Ljavax/security/sasl/RealmCallback;

    .line 181
    .local v3, "rcb":Ljavax/security/sasl/RealmCallback;
    iget-object v4, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism;->hostname:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljavax/security/sasl/RealmCallback;->setText(Ljava/lang/String;)V

    goto :goto_13

    .line 182
    .end local v3    # "rcb":Ljavax/security/sasl/RealmCallback;
    :cond_3a
    aget-object v4, p1, v0

    instance-of v4, v4, Ljavax/security/sasl/RealmChoiceCallback;

    if-nez v4, :cond_13

    .line 186
    new-instance v4, Ljavax/security/auth/callback/UnsupportedCallbackException;

    aget-object v5, p1, v0

    invoke-direct {v4, v5}, Ljavax/security/auth/callback/UnsupportedCallbackException;-><init>(Ljavax/security/auth/callback/Callback;)V

    throw v4

    .line 189
    :cond_48
    return-void
.end method
