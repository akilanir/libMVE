.class public Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;
.super Ljava/lang/Object;
.source "DefaultUserTokenHandler.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/UserTokenHandler;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;->INSTANCE:Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getAuthPrincipal(Lcz/msebera/android/httpclient/auth/AuthState;)Ljava/security/Principal;
    .registers 4
    .param p0, "authState"    # Lcz/msebera/android/httpclient/auth/AuthState;

    .prologue
    .line 91
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/auth/AuthState;->getAuthScheme()Lcz/msebera/android/httpclient/auth/AuthScheme;

    move-result-object v1

    .line 92
    .local v1, "scheme":Lcz/msebera/android/httpclient/auth/AuthScheme;
    if-eqz v1, :cond_1d

    invoke-interface {v1}, Lcz/msebera/android/httpclient/auth/AuthScheme;->isComplete()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Lcz/msebera/android/httpclient/auth/AuthScheme;->isConnectionBased()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 93
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/auth/AuthState;->getCredentials()Lcz/msebera/android/httpclient/auth/Credentials;

    move-result-object v0

    .line 94
    .local v0, "creds":Lcz/msebera/android/httpclient/auth/Credentials;
    if-eqz v0, :cond_1d

    .line 95
    invoke-interface {v0}, Lcz/msebera/android/httpclient/auth/Credentials;->getUserPrincipal()Ljava/security/Principal;

    move-result-object v2

    .line 98
    .end local v0    # "creds":Lcz/msebera/android/httpclient/auth/Credentials;
    :goto_1c
    return-object v2

    :cond_1d
    const/4 v2, 0x0

    goto :goto_1c
.end method


# virtual methods
.method public getUserToken(Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/lang/Object;
    .registers 9
    .param p1, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;

    .prologue
    .line 64
    invoke-static {p1}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v0

    .line 66
    .local v0, "clientContext":Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    const/4 v5, 0x0

    .line 68
    .local v5, "userPrincipal":Ljava/security/Principal;
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getTargetAuthState()Lcz/msebera/android/httpclient/auth/AuthState;

    move-result-object v4

    .line 69
    .local v4, "targetAuthState":Lcz/msebera/android/httpclient/auth/AuthState;
    if-eqz v4, :cond_19

    .line 70
    invoke-static {v4}, Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;->getAuthPrincipal(Lcz/msebera/android/httpclient/auth/AuthState;)Ljava/security/Principal;

    move-result-object v5

    .line 71
    if-nez v5, :cond_19

    .line 72
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getProxyAuthState()Lcz/msebera/android/httpclient/auth/AuthState;

    move-result-object v2

    .line 73
    .local v2, "proxyAuthState":Lcz/msebera/android/httpclient/auth/AuthState;
    invoke-static {v2}, Lcz/msebera/android/httpclient/impl/client/DefaultUserTokenHandler;->getAuthPrincipal(Lcz/msebera/android/httpclient/auth/AuthState;)Ljava/security/Principal;

    move-result-object v5

    .line 77
    .end local v2    # "proxyAuthState":Lcz/msebera/android/httpclient/auth/AuthState;
    :cond_19
    if-nez v5, :cond_35

    .line 78
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->getConnection()Lcz/msebera/android/httpclient/HttpConnection;

    move-result-object v1

    .line 79
    .local v1, "conn":Lcz/msebera/android/httpclient/HttpConnection;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/HttpConnection;->isOpen()Z

    move-result v6

    if-eqz v6, :cond_35

    instance-of v6, v1, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    if-eqz v6, :cond_35

    .line 80
    check-cast v1, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    .end local v1    # "conn":Lcz/msebera/android/httpclient/HttpConnection;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->getSSLSession()Ljavax/net/ssl/SSLSession;

    move-result-object v3

    .line 81
    .local v3, "sslsession":Ljavax/net/ssl/SSLSession;
    if-eqz v3, :cond_35

    .line 82
    invoke-interface {v3}, Ljavax/net/ssl/SSLSession;->getLocalPrincipal()Ljava/security/Principal;

    move-result-object v5

    .line 87
    .end local v3    # "sslsession":Ljavax/net/ssl/SSLSession;
    :cond_35
    return-object v5
.end method
