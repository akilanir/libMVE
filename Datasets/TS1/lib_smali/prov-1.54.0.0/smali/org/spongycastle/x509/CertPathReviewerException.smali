.class public Lorg/spongycastle/x509/CertPathReviewerException;
.super Lorg/spongycastle/i18n/LocalizedException;
.source "CertPathReviewerException.java"


# instance fields
.field private certPath:Ljava/security/cert/CertPath;

.field private index:I


# direct methods
.method public constructor <init>(Lorg/spongycastle/i18n/ErrorBundle;)V
    .registers 3
    .param p1, "errorMessage"    # Lorg/spongycastle/i18n/ErrorBundle;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lorg/spongycastle/i18n/LocalizedException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    .line 11
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/x509/CertPathReviewerException;->index:I

    .line 13
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/x509/CertPathReviewerException;->certPath:Ljava/security/cert/CertPath;

    .line 23
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "errorMessage"    # Lorg/spongycastle/i18n/ErrorBundle;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/i18n/LocalizedException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V

    .line 11
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/x509/CertPathReviewerException;->index:I

    .line 13
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/x509/CertPathReviewerException;->certPath:Ljava/security/cert/CertPath;

    .line 18
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;Ljava/security/cert/CertPath;I)V
    .registers 7
    .param p1, "errorMessage"    # Lorg/spongycastle/i18n/ErrorBundle;
    .param p2, "throwable"    # Ljava/lang/Throwable;
    .param p3, "certPath"    # Ljava/security/cert/CertPath;
    .param p4, "index"    # I

    .prologue
    const/4 v1, -0x1

    .line 31
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/i18n/LocalizedException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/lang/Throwable;)V

    .line 11
    iput v1, p0, Lorg/spongycastle/x509/CertPathReviewerException;->index:I

    .line 13
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/x509/CertPathReviewerException;->certPath:Ljava/security/cert/CertPath;

    .line 32
    if-eqz p3, :cond_d

    if-ne p4, v1, :cond_13

    .line 34
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 36
    :cond_13
    if-lt p4, v1, :cond_21

    if-eqz p3, :cond_27

    invoke-virtual {p3}, Ljava/security/cert/CertPath;->getCertificates()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p4, v0, :cond_27

    .line 38
    :cond_21
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 40
    :cond_27
    iput-object p3, p0, Lorg/spongycastle/x509/CertPathReviewerException;->certPath:Ljava/security/cert/CertPath;

    .line 41
    iput p4, p0, Lorg/spongycastle/x509/CertPathReviewerException;->index:I

    .line 42
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/i18n/ErrorBundle;Ljava/security/cert/CertPath;I)V
    .registers 6
    .param p1, "errorMessage"    # Lorg/spongycastle/i18n/ErrorBundle;
    .param p2, "certPath"    # Ljava/security/cert/CertPath;
    .param p3, "index"    # I

    .prologue
    const/4 v1, -0x1

    .line 49
    invoke-direct {p0, p1}, Lorg/spongycastle/i18n/LocalizedException;-><init>(Lorg/spongycastle/i18n/ErrorBundle;)V

    .line 11
    iput v1, p0, Lorg/spongycastle/x509/CertPathReviewerException;->index:I

    .line 13
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/x509/CertPathReviewerException;->certPath:Ljava/security/cert/CertPath;

    .line 50
    if-eqz p2, :cond_d

    if-ne p3, v1, :cond_13

    .line 52
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 54
    :cond_13
    if-lt p3, v1, :cond_21

    if-eqz p2, :cond_27

    invoke-virtual {p2}, Ljava/security/cert/CertPath;->getCertificates()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p3, v0, :cond_27

    .line 56
    :cond_21
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 58
    :cond_27
    iput-object p2, p0, Lorg/spongycastle/x509/CertPathReviewerException;->certPath:Ljava/security/cert/CertPath;

    .line 59
    iput p3, p0, Lorg/spongycastle/x509/CertPathReviewerException;->index:I

    .line 60
    return-void
.end method


# virtual methods
.method public getCertPath()Ljava/security/cert/CertPath;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lorg/spongycastle/x509/CertPathReviewerException;->certPath:Ljava/security/cert/CertPath;

    return-object v0
.end method

.method public getIndex()I
    .registers 2

    .prologue
    .line 69
    iget v0, p0, Lorg/spongycastle/x509/CertPathReviewerException;->index:I

    return v0
.end method
