.class public Lorg/spongycastle/asn1/x509/X509Extensions;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "X509Extensions.java"


# static fields
.field public static final AuditIdentity:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final AuthorityInfoAccess:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final AuthorityKeyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final BasicConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final BiometricInfo:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final CRLDistributionPoints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final CRLNumber:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final CertificateIssuer:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final CertificatePolicies:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final DeltaCRLIndicator:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final ExtendedKeyUsage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final FreshestCRL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final InhibitAnyPolicy:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final InstructionCode:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final InvalidityDate:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final IssuerAlternativeName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final IssuingDistributionPoint:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final KeyUsage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final LogoType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final NameConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final NoRevAvail:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final PolicyConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final PolicyMappings:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final PrivateKeyUsagePeriod:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final QCStatements:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final ReasonCode:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final SubjectAlternativeName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final SubjectDirectoryAttributes:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final SubjectInfoAccess:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final SubjectKeyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final TargetInformation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# instance fields
.field private extensions:Ljava/util/Hashtable;

.field private ordering:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 27
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.9"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->SubjectDirectoryAttributes:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 33
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.14"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->SubjectKeyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 39
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.15"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->KeyUsage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 45
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.16"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->PrivateKeyUsagePeriod:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 51
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.17"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->SubjectAlternativeName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 57
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.18"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->IssuerAlternativeName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 63
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.19"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->BasicConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 69
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.20"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->CRLNumber:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 75
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.21"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->ReasonCode:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 81
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.23"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->InstructionCode:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 87
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.24"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->InvalidityDate:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 93
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.27"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->DeltaCRLIndicator:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 99
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.28"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->IssuingDistributionPoint:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 105
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.29"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->CertificateIssuer:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 111
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.30"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->NameConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 117
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.31"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->CRLDistributionPoints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 123
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.32"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->CertificatePolicies:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 129
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.33"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->PolicyMappings:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 135
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.35"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->AuthorityKeyIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 141
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.36"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->PolicyConstraints:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 147
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.37"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->ExtendedKeyUsage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 153
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.46"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->FreshestCRL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 159
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.54"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->InhibitAnyPolicy:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 165
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.3.6.1.5.5.7.1.1"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->AuthorityInfoAccess:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 171
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.3.6.1.5.5.7.1.11"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->SubjectInfoAccess:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 177
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.3.6.1.5.5.7.1.12"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->LogoType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 183
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.3.6.1.5.5.7.1.2"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->BiometricInfo:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 189
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.3.6.1.5.5.7.1.3"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->QCStatements:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 195
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "1.3.6.1.5.5.7.1.4"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->AuditIdentity:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 201
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.56"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->NoRevAvail:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 207
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    const-string v1, "2.5.29.55"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/spongycastle/asn1/x509/X509Extensions;->TargetInformation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-void
.end method

.method public constructor <init>(Ljava/util/Hashtable;)V
    .registers 3
    .param p1, "extensions"    # Ljava/util/Hashtable;

    .prologue
    .line 284
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/spongycastle/asn1/x509/X509Extensions;-><init>(Ljava/util/Vector;Ljava/util/Hashtable;)V

    .line 285
    return-void
.end method

.method public constructor <init>(Ljava/util/Vector;Ljava/util/Hashtable;)V
    .registers 8
    .param p1, "ordering"    # Ljava/util/Vector;
    .param p2, "extensions"    # Ljava/util/Hashtable;

    .prologue
    .line 296
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 209
    new-instance v3, Ljava/util/Hashtable;

    invoke-direct {v3}, Ljava/util/Hashtable;-><init>()V

    iput-object v3, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    .line 210
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    iput-object v3, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    .line 299
    if-nez p1, :cond_2b

    .line 301
    invoke-virtual {p2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 308
    .local v0, "e":Ljava/util/Enumeration;
    :goto_17
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_30

    .line 310
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_17

    .line 305
    .end local v0    # "e":Ljava/util/Enumeration;
    :cond_2b
    invoke-virtual {p1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .restart local v0    # "e":Ljava/util/Enumeration;
    goto :goto_17

    .line 313
    :cond_30
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 315
    :goto_36
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_50

    .line 317
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v2

    .line 318
    .local v2, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual {p2, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/x509/X509Extension;

    .line 320
    .local v1, "ext":Lorg/spongycastle/asn1/x509/X509Extension;
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v3, v2, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_36

    .line 322
    .end local v1    # "ext":Lorg/spongycastle/asn1/x509/X509Extension;
    .end local v2    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_50
    return-void
.end method

.method public constructor <init>(Ljava/util/Vector;Ljava/util/Vector;)V
    .registers 9
    .param p1, "objectIDs"    # Ljava/util/Vector;
    .param p2, "values"    # Ljava/util/Vector;

    .prologue
    .line 334
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 209
    new-instance v4, Ljava/util/Hashtable;

    invoke-direct {v4}, Ljava/util/Hashtable;-><init>()V

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    .line 210
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    .line 335
    invoke-virtual {p1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 337
    .local v1, "e":Ljava/util/Enumeration;
    :goto_15
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_25

    .line 339
    iget-object v4, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_15

    .line 342
    :cond_25
    const/4 v0, 0x0

    .line 344
    .local v0, "count":I
    iget-object v4, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 346
    :goto_2c
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_46

    .line 348
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 349
    .local v3, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-virtual {p2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/x509/X509Extension;

    .line 351
    .local v2, "ext":Lorg/spongycastle/asn1/x509/X509Extension;
    iget-object v4, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v4, v3, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    add-int/lit8 v0, v0, 0x1

    .line 353
    goto :goto_2c

    .line 354
    .end local v2    # "ext":Lorg/spongycastle/asn1/x509/X509Extension;
    .end local v3    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_46
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 12
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 252
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 209
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    .line 210
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    .line 253
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 255
    .local v0, "e":Ljava/util/Enumeration;
    :goto_18
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_8f

    .line 257
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    .line 259
    .local v1, "s":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_55

    .line 261
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v1, v7}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    new-instance v4, Lorg/spongycastle/asn1/x509/X509Extension;

    invoke-virtual {v1, v8}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1Boolean;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Boolean;

    move-result-object v5

    invoke-virtual {v1, v9}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/spongycastle/asn1/x509/X509Extension;-><init>(Lorg/spongycastle/asn1/ASN1Boolean;Lorg/spongycastle/asn1/ASN1OctetString;)V

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    :goto_4b
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    invoke-virtual {v1, v7}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_18

    .line 263
    :cond_55
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    if-ne v2, v9, :cond_72

    .line 265
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v1, v7}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    new-instance v4, Lorg/spongycastle/asn1/x509/X509Extension;

    invoke-virtual {v1, v8}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v5

    invoke-direct {v4, v7, v5}, Lorg/spongycastle/asn1/x509/X509Extension;-><init>(ZLorg/spongycastle/asn1/ASN1OctetString;)V

    invoke-virtual {v2, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4b

    .line 269
    :cond_72
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad sequence size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 274
    .end local v1    # "s":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_8f
    return-void
.end method

.method private getExtensionOIDs(Z)[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 6
    .param p1, "isCritical"    # Z

    .prologue
    .line 452
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 454
    .local v2, "oidVec":Ljava/util/Vector;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-eq v0, v3, :cond_28

    .line 456
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    .line 458
    .local v1, "oid":Ljava/lang/Object;
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v3, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/x509/X509Extension;

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/X509Extension;->isCritical()Z

    move-result v3

    if-ne v3, p1, :cond_25

    .line 460
    invoke-virtual {v2, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 454
    :cond_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 464
    .end local v1    # "oid":Ljava/lang/Object;
    :cond_28
    invoke-direct {p0, v2}, Lorg/spongycastle/asn1/x509/X509Extensions;->toOidArray(Ljava/util/Vector;)[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    return-object v3
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/X509Extensions;
    .registers 4
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 222
    if-eqz p0, :cond_6

    instance-of v0, p0, Lorg/spongycastle/asn1/x509/X509Extensions;

    if-eqz v0, :cond_9

    .line 224
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/x509/X509Extensions;

    .line 239
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 227
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v0, :cond_16

    .line 229
    new-instance v0, Lorg/spongycastle/asn1/x509/X509Extensions;

    check-cast p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/X509Extensions;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_8

    .line 232
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_16
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/Extensions;

    if-eqz v0, :cond_29

    .line 234
    new-instance v1, Lorg/spongycastle/asn1/x509/X509Extensions;

    check-cast p0, Lorg/spongycastle/asn1/x509/Extensions;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/Extensions;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/x509/X509Extensions;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v1

    goto :goto_8

    .line 237
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_29
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v0, :cond_38

    .line 239
    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/X509Extensions;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/X509Extensions;

    move-result-object p0

    goto :goto_8

    .line 242
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_38
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal object in getInstance: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/X509Extensions;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 216
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/x509/X509Extensions;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/X509Extensions;

    move-result-object v0

    return-object v0
.end method

.method private toOidArray(Ljava/util/Vector;)[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 5
    .param p1, "oidVec"    # Ljava/util/Vector;

    .prologue
    .line 469
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 471
    .local v1, "oids":[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    array-length v2, v1

    if-eq v0, v2, :cond_15

    .line 473
    invoke-virtual {p1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    aput-object v2, v1, v0

    .line 471
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 475
    :cond_15
    return-object v1
.end method


# virtual methods
.method public equivalent(Lorg/spongycastle/asn1/x509/X509Extensions;)Z
    .registers 7
    .param p1, "other"    # Lorg/spongycastle/asn1/x509/X509Extensions;

    .prologue
    const/4 v2, 0x0

    .line 415
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->size()I

    move-result v3

    iget-object v4, p1, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->size()I

    move-result v4

    if-eq v3, v4, :cond_10

    .line 432
    :goto_f
    return v2

    .line 420
    :cond_10
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 422
    .local v0, "e1":Ljava/util/Enumeration;
    :cond_16
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_33

    .line 424
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    .line 426
    .local v1, "key":Ljava/lang/Object;
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v3, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iget-object v4, p1, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v4, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_16

    goto :goto_f

    .line 432
    .end local v1    # "key":Ljava/lang/Object;
    :cond_33
    const/4 v2, 0x1

    goto :goto_f
.end method

.method public getCriticalExtensionOIDs()[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 447
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/x509/X509Extensions;->getExtensionOIDs(Z)[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    return-object v0
.end method

.method public getExtension(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x509/X509Extension;
    .registers 3
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 373
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/x509/X509Extension;

    return-object v0
.end method

.method public getExtensionOIDs()[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 437
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/x509/X509Extensions;->toOidArray(Ljava/util/Vector;)[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    return-object v0
.end method

.method public getNonCriticalExtensionOIDs()[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 2

    .prologue
    .line 442
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/x509/X509Extensions;->getExtensionOIDs(Z)[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    return-object v0
.end method

.method public oids()Ljava/util/Enumeration;
    .registers 2

    .prologue
    .line 361
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 7

    .prologue
    .line 388
    new-instance v4, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 389
    .local v4, "vec":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v5, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->ordering:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 391
    .local v0, "e":Ljava/util/Enumeration;
    :goto_b
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_42

    .line 393
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 394
    .local v2, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    iget-object v5, p0, Lorg/spongycastle/asn1/x509/X509Extensions;->extensions:Ljava/util/Hashtable;

    invoke-virtual {v5, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/x509/X509Extension;

    .line 395
    .local v1, "ext":Lorg/spongycastle/asn1/x509/X509Extension;
    new-instance v3, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 397
    .local v3, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    invoke-virtual {v3, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 399
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/X509Extension;->isCritical()Z

    move-result v5

    if-eqz v5, :cond_32

    .line 401
    sget-object v5, Lorg/spongycastle/asn1/ASN1Boolean;->TRUE:Lorg/spongycastle/asn1/ASN1Boolean;

    invoke-virtual {v3, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 404
    :cond_32
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x509/X509Extension;->getValue()Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 406
    new-instance v5, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v5, v3}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    invoke-virtual {v4, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_b

    .line 409
    .end local v1    # "ext":Lorg/spongycastle/asn1/x509/X509Extension;
    .end local v2    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .end local v3    # "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    :cond_42
    new-instance v5, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v5, v4}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v5
.end method
