.class public Lcom/sun/mail/auth/OAuth2SaslClientFactory;
.super Ljava/lang/Object;
.source "OAuth2SaslClientFactory.java"

# interfaces
.implements Ljavax/security/sasl/SaslClientFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/mail/auth/OAuth2SaslClientFactory$OAuth2Provider;
    }
.end annotation


# static fields
.field private static final MECHANISM_NAME:Ljava/lang/String; = "SaslClientFactory.XOAUTH2"

.field private static final PROVIDER_NAME:Ljava/lang/String; = "JavaMail-OAuth2"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static init()V
    .registers 1

    .prologue
    .line 91
    :try_start_0
    const-string v0, "JavaMail-OAuth2"

    invoke-static {v0}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    move-result-object v0

    if-nez v0, :cond_10

    .line 92
    new-instance v0, Lcom/sun/mail/auth/OAuth2SaslClientFactory$OAuth2Provider;

    invoke-direct {v0}, Lcom/sun/mail/auth/OAuth2SaslClientFactory$OAuth2Provider;-><init>()V

    invoke-static {v0}, Ljava/security/Security;->addProvider(Ljava/security/Provider;)I
    :try_end_10
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_10} :catch_11

    .line 96
    :cond_10
    :goto_10
    return-void

    .line 93
    :catch_11
    move-exception v0

    goto :goto_10
.end method


# virtual methods
.method public createSaslClient([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)Ljavax/security/sasl/SaslClient;
    .registers 11
    .param p1, "mechanisms"    # [Ljava/lang/String;
    .param p2, "authorizationId"    # Ljava/lang/String;
    .param p3, "protocol"    # Ljava/lang/String;
    .param p4, "serverName"    # Ljava/lang/String;
    .param p6, "cbh"    # Ljavax/security/auth/callback/CallbackHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;",
            "Ljavax/security/auth/callback/CallbackHandler;",
            ")",
            "Ljavax/security/sasl/SaslClient;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/security/sasl/SaslException;
        }
    .end annotation

    .prologue
    .line 73
    .local p5, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    array-length v2, p1

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_17

    aget-object v0, p1, v1

    .line 74
    .local v0, "m":Ljava/lang/String;
    const-string v3, "XOAUTH2"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 75
    new-instance v1, Lcom/sun/mail/auth/OAuth2SaslClient;

    invoke-direct {v1, p5, p6}, Lcom/sun/mail/auth/OAuth2SaslClient;-><init>(Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)V

    .line 77
    .end local v0    # "m":Ljava/lang/String;
    :goto_13
    return-object v1

    .line 73
    .restart local v0    # "m":Ljava/lang/String;
    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 77
    .end local v0    # "m":Ljava/lang/String;
    :cond_17
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public getMechanismNames(Ljava/util/Map;)[Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 82
    .local p1, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "XOAUTH2"

    aput-object v2, v0, v1

    return-object v0
.end method
