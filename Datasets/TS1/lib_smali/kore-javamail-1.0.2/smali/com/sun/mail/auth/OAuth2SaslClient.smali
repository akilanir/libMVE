.class public Lcom/sun/mail/auth/OAuth2SaslClient;
.super Ljava/lang/Object;
.source "OAuth2SaslClient.java"

# interfaces
.implements Ljavax/security/sasl/SaslClient;


# instance fields
.field private cbh:Ljavax/security/auth/callback/CallbackHandler;

.field private complete:Z

.field private props:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)V
    .registers 4
    .param p2, "cbh"    # Ljavax/security/auth/callback/CallbackHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;",
            "Ljavax/security/auth/callback/CallbackHandler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 67
    .local p1, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sun/mail/auth/OAuth2SaslClient;->complete:Z

    .line 68
    iput-object p1, p0, Lcom/sun/mail/auth/OAuth2SaslClient;->props:Ljava/util/Map;

    .line 69
    iput-object p2, p0, Lcom/sun/mail/auth/OAuth2SaslClient;->cbh:Ljavax/security/auth/callback/CallbackHandler;

    .line 70
    return-void
.end method


# virtual methods
.method public dispose()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/security/sasl/SaslException;
        }
    .end annotation

    .prologue
    .line 143
    return-void
.end method

.method public evaluateChallenge([B)[B
    .registers 13
    .param p1, "challenge"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/security/sasl/SaslException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v8, 0x0

    .line 84
    iget-boolean v7, p0, Lcom/sun/mail/auth/OAuth2SaslClient;->complete:Z

    if-eqz v7, :cond_9

    .line 85
    new-array v4, v8, [B

    .line 114
    :goto_8
    return-object v4

    .line 87
    :cond_9
    new-instance v1, Ljavax/security/auth/callback/NameCallback;

    const-string v7, "User name:"

    invoke-direct {v1, v7}, Ljavax/security/auth/callback/NameCallback;-><init>(Ljava/lang/String;)V

    .line 88
    .local v1, "ncb":Ljavax/security/auth/callback/NameCallback;
    new-instance v2, Ljavax/security/auth/callback/PasswordCallback;

    const-string v7, "OAuth token:"

    invoke-direct {v2, v7, v8}, Ljavax/security/auth/callback/PasswordCallback;-><init>(Ljava/lang/String;Z)V

    .line 90
    .local v2, "pcb":Ljavax/security/auth/callback/PasswordCallback;
    :try_start_17
    iget-object v7, p0, Lcom/sun/mail/auth/OAuth2SaslClient;->cbh:Ljavax/security/auth/callback/CallbackHandler;

    const/4 v8, 0x2

    new-array v8, v8, [Ljavax/security/auth/callback/Callback;

    const/4 v9, 0x0

    aput-object v1, v8, v9

    const/4 v9, 0x1

    aput-object v2, v8, v9

    invoke-interface {v7, v8}, Ljavax/security/auth/callback/CallbackHandler;->handle([Ljavax/security/auth/callback/Callback;)V
    :try_end_25
    .catch Ljavax/security/auth/callback/UnsupportedCallbackException; {:try_start_17 .. :try_end_25} :catch_61
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_25} :catch_6a

    .line 102
    invoke-virtual {v1}, Ljavax/security/auth/callback/NameCallback;->getName()Ljava/lang/String;

    move-result-object v6

    .line 103
    .local v6, "user":Ljava/lang/String;
    new-instance v5, Ljava/lang/String;

    invoke-virtual {v2}, Ljavax/security/auth/callback/PasswordCallback;->getPassword()[C

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/String;-><init>([C)V

    .line 104
    .local v5, "token":Ljava/lang/String;
    invoke-virtual {v2}, Ljavax/security/auth/callback/PasswordCallback;->clearPassword()V

    .line 105
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "user="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\u0001auth=Bearer "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\u0001\u0001"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 108
    .local v3, "resp":Ljava/lang/String;
    :try_start_58
    const-string v7, "utf-8"

    invoke-virtual {v3, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_5d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_58 .. :try_end_5d} :catch_73

    move-result-object v4

    .line 113
    .local v4, "response":[B
    :goto_5e
    iput-boolean v10, p0, Lcom/sun/mail/auth/OAuth2SaslClient;->complete:Z

    goto :goto_8

    .line 91
    .end local v3    # "resp":Ljava/lang/String;
    .end local v4    # "response":[B
    .end local v5    # "token":Ljava/lang/String;
    .end local v6    # "user":Ljava/lang/String;
    :catch_61
    move-exception v0

    .line 92
    .local v0, "ex":Ljavax/security/auth/callback/UnsupportedCallbackException;
    new-instance v7, Ljavax/security/sasl/SaslException;

    const-string v8, "Unsupported callback"

    invoke-direct {v7, v8, v0}, Ljavax/security/sasl/SaslException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 93
    .end local v0    # "ex":Ljavax/security/auth/callback/UnsupportedCallbackException;
    :catch_6a
    move-exception v0

    .line 94
    .local v0, "ex":Ljava/io/IOException;
    new-instance v7, Ljavax/security/sasl/SaslException;

    const-string v8, "Callback handler failed"

    invoke-direct {v7, v8, v0}, Ljavax/security/sasl/SaslException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 109
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v3    # "resp":Ljava/lang/String;
    .restart local v5    # "token":Ljava/lang/String;
    .restart local v6    # "user":Ljava/lang/String;
    :catch_73
    move-exception v0

    .line 111
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    invoke-static {v3}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    .restart local v4    # "response":[B
    goto :goto_5e
.end method

.method public getMechanismName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 74
    const-string v0, "XOAUTH2"

    return-object v0
.end method

.method public getNegotiatedProperty(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "propName"    # Ljava/lang/String;

    .prologue
    .line 136
    iget-boolean v0, p0, Lcom/sun/mail/auth/OAuth2SaslClient;->complete:Z

    if-nez v0, :cond_c

    .line 137
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "OAUTH2 getNegotiatedProperty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_c
    const/4 v0, 0x0

    return-object v0
.end method

.method public hasInitialResponse()Z
    .registers 2

    .prologue
    .line 79
    const/4 v0, 0x1

    return v0
.end method

.method public isComplete()Z
    .registers 2

    .prologue
    .line 119
    iget-boolean v0, p0, Lcom/sun/mail/auth/OAuth2SaslClient;->complete:Z

    return v0
.end method

.method public unwrap([BII)[B
    .registers 6
    .param p1, "incoming"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/security/sasl/SaslException;
        }
    .end annotation

    .prologue
    .line 125
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "OAUTH2 unwrap not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public wrap([BII)[B
    .registers 6
    .param p1, "outgoing"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/security/sasl/SaslException;
        }
    .end annotation

    .prologue
    .line 131
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "OAUTH2 wrap not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
