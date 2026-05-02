.class public Lorg/apache/commons/net/ftp/FTPSTrustManager;
.super Ljava/lang/Object;
.source "FTPSTrustManager.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final EMPTY_X509CERTIFICATE_ARRAY:[Ljava/security/cert/X509Certificate;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/security/cert/X509Certificate;

    sput-object v0, Lorg/apache/commons/net/ftp/FTPSTrustManager;->EMPTY_X509CERTIFICATE_ARRAY:[Ljava/security/cert/X509Certificate;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .registers 3
    .param p1, "certificates"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;

    .prologue
    .line 41
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .registers 7
    .param p1, "certificates"    # [Ljava/security/cert/X509Certificate;
    .param p2, "authType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 47
    move-object v0, p1

    .local v0, "arr$":[Ljava/security/cert/X509Certificate;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_d

    aget-object v1, v0, v2

    .line 49
    .local v1, "certificate":Ljava/security/cert/X509Certificate;
    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->checkValidity()V

    .line 47
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 51
    .end local v1    # "certificate":Ljava/security/cert/X509Certificate;
    :cond_d
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .registers 2

    .prologue
    .line 56
    sget-object v0, Lorg/apache/commons/net/ftp/FTPSTrustManager;->EMPTY_X509CERTIFICATE_ARRAY:[Ljava/security/cert/X509Certificate;

    return-object v0
.end method
