.class public Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;
.super Ljava/lang/Object;
.source "SystemDefaultCredentialsProvider.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/CredentialsProvider;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation


# static fields
.field private static final SCHEME_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final internal:Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 56
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    .line 57
    sget-object v0, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    const-string v1, "Basic"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Basic"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    const-string v1, "Digest"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Digest"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    const-string v1, "NTLM"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "NTLM"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    const-string v1, "negotiate"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "SPNEGO"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    const-string v1, "Kerberos"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Kerberos"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    new-instance v0, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->internal:Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;

    .line 80
    return-void
.end method

.method private static getSystemCreds(Lcz/msebera/android/httpclient/auth/AuthScope;Ljava/net/Authenticator$RequestorType;)Ljava/net/PasswordAuthentication;
    .registers 10
    .param p0, "authscope"    # Lcz/msebera/android/httpclient/auth/AuthScope;
    .param p1, "requestorType"    # Ljava/net/Authenticator$RequestorType;

    .prologue
    const/4 v1, 0x0

    .line 89
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/auth/AuthScope;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 90
    .local v0, "hostname":Ljava/lang/String;
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/auth/AuthScope;->getPort()I

    move-result v2

    .line 91
    .local v2, "port":I
    const/16 v4, 0x1bb

    if-ne v2, v4, :cond_1f

    const-string v3, "https"

    .line 98
    .local v3, "protocol":Ljava/lang/String;
    :goto_f
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/auth/AuthScope;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->translateScheme(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v4, v1

    move-object v6, v1

    move-object v7, p1

    .line 92
    invoke-static/range {v0 .. v7}, Ljava/net/Authenticator;->requestPasswordAuthentication(Ljava/lang/String;Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;Ljava/net/Authenticator$RequestorType;)Ljava/net/PasswordAuthentication;

    move-result-object v1

    return-object v1

    .line 91
    .end local v3    # "protocol":Ljava/lang/String;
    :cond_1f
    const-string v3, "http"

    goto :goto_f
.end method

.method private static translateScheme(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 65
    if-nez p0, :cond_4

    .line 66
    const/4 v0, 0x0

    .line 69
    :cond_3
    :goto_3
    return-object v0

    .line 68
    :cond_4
    sget-object v1, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->SCHEME_MAP:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 69
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_3

    move-object v0, p0

    goto :goto_3
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->internal:Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;->clear()V

    .line 143
    return-void
.end method

.method public getCredentials(Lcz/msebera/android/httpclient/auth/AuthScope;)Lcz/msebera/android/httpclient/auth/Credentials;
    .registers 9
    .param p1, "authscope"    # Lcz/msebera/android/httpclient/auth/AuthScope;

    .prologue
    const/4 v3, 0x0

    .line 104
    const-string v4, "Auth scope"

    invoke-static {p1, v4}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 105
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->internal:Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;

    invoke-virtual {v4, p1}, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;->getCredentials(Lcz/msebera/android/httpclient/auth/AuthScope;)Lcz/msebera/android/httpclient/auth/Credentials;

    move-result-object v1

    .line 106
    .local v1, "localcreds":Lcz/msebera/android/httpclient/auth/Credentials;
    if-eqz v1, :cond_f

    .line 138
    .end local v1    # "localcreds":Lcz/msebera/android/httpclient/auth/Credentials;
    :goto_e
    return-object v1

    .line 109
    .restart local v1    # "localcreds":Lcz/msebera/android/httpclient/auth/Credentials;
    :cond_f
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/auth/AuthScope;->getHost()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_72

    .line 110
    sget-object v4, Ljava/net/Authenticator$RequestorType;->SERVER:Ljava/net/Authenticator$RequestorType;

    invoke-static {p1, v4}, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->getSystemCreds(Lcz/msebera/android/httpclient/auth/AuthScope;Ljava/net/Authenticator$RequestorType;)Ljava/net/PasswordAuthentication;

    move-result-object v2

    .line 112
    .local v2, "systemcreds":Ljava/net/PasswordAuthentication;
    if-nez v2, :cond_23

    .line 113
    sget-object v4, Ljava/net/Authenticator$RequestorType;->PROXY:Ljava/net/Authenticator$RequestorType;

    invoke-static {p1, v4}, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->getSystemCreds(Lcz/msebera/android/httpclient/auth/AuthScope;Ljava/net/Authenticator$RequestorType;)Ljava/net/PasswordAuthentication;

    move-result-object v2

    .line 116
    :cond_23
    if-eqz v2, :cond_72

    .line 117
    const-string v4, "http.auth.ntlm.domain"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 118
    .local v0, "domain":Ljava/lang/String;
    if-eqz v0, :cond_40

    .line 119
    new-instance v1, Lcz/msebera/android/httpclient/auth/NTCredentials;

    .line 120
    .end local v1    # "localcreds":Lcz/msebera/android/httpclient/auth/Credentials;
    invoke-virtual {v2}, Ljava/net/PasswordAuthentication;->getUserName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/String;

    .line 121
    invoke-virtual {v2}, Ljava/net/PasswordAuthentication;->getPassword()[C

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([C)V

    invoke-direct {v1, v4, v5, v3, v0}, Lcz/msebera/android/httpclient/auth/NTCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e

    .line 124
    .restart local v1    # "localcreds":Lcz/msebera/android/httpclient/auth/Credentials;
    :cond_40
    const-string v4, "NTLM"

    invoke-virtual {p1}, Lcz/msebera/android/httpclient/auth/AuthScope;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5f

    .line 126
    new-instance v1, Lcz/msebera/android/httpclient/auth/NTCredentials;

    .line 127
    .end local v1    # "localcreds":Lcz/msebera/android/httpclient/auth/Credentials;
    invoke-virtual {v2}, Ljava/net/PasswordAuthentication;->getUserName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/String;

    .line 128
    invoke-virtual {v2}, Ljava/net/PasswordAuthentication;->getPassword()[C

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([C)V

    invoke-direct {v1, v4, v5, v3, v3}, Lcz/msebera/android/httpclient/auth/NTCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e

    .line 131
    .restart local v1    # "localcreds":Lcz/msebera/android/httpclient/auth/Credentials;
    :cond_5f
    new-instance v1, Lcz/msebera/android/httpclient/auth/UsernamePasswordCredentials;

    .line 132
    .end local v1    # "localcreds":Lcz/msebera/android/httpclient/auth/Credentials;
    invoke-virtual {v2}, Ljava/net/PasswordAuthentication;->getUserName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/String;

    .line 133
    invoke-virtual {v2}, Ljava/net/PasswordAuthentication;->getPassword()[C

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([C)V

    invoke-direct {v1, v3, v4}, Lcz/msebera/android/httpclient/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e

    .end local v0    # "domain":Ljava/lang/String;
    .end local v2    # "systemcreds":Ljava/net/PasswordAuthentication;
    .restart local v1    # "localcreds":Lcz/msebera/android/httpclient/auth/Credentials;
    :cond_72
    move-object v1, v3

    .line 138
    goto :goto_e
.end method

.method public setCredentials(Lcz/msebera/android/httpclient/auth/AuthScope;Lcz/msebera/android/httpclient/auth/Credentials;)V
    .registers 4
    .param p1, "authscope"    # Lcz/msebera/android/httpclient/auth/AuthScope;
    .param p2, "credentials"    # Lcz/msebera/android/httpclient/auth/Credentials;

    .prologue
    .line 83
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/SystemDefaultCredentialsProvider;->internal:Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;

    invoke-virtual {v0, p1, p2}, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;->setCredentials(Lcz/msebera/android/httpclient/auth/AuthScope;Lcz/msebera/android/httpclient/auth/Credentials;)V

    .line 84
    return-void
.end method
