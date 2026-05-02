.class public Lorg/spongycastle/jcajce/PKIXExtendedParameters;
.super Ljava/lang/Object;
.source "PKIXExtendedParameters.java"

# interfaces
.implements Ljava/security/cert/CertPathParameters;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    }
.end annotation


# static fields
.field public static final CHAIN_VALIDITY_MODEL:I = 0x1

.field public static final PKIX_VALIDITY_MODEL:I


# instance fields
.field private final baseParameters:Ljava/security/cert/PKIXParameters;

.field private final date:Ljava/util/Date;

.field private final extraCRLStores:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/spongycastle/jcajce/PKIXCRLStore;",
            ">;"
        }
    .end annotation
.end field

.field private final extraCertStores:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/spongycastle/jcajce/PKIXCertStore;",
            ">;"
        }
    .end annotation
.end field

.field private final namedCRLStoreMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/spongycastle/asn1/x509/GeneralName;",
            "Lorg/spongycastle/jcajce/PKIXCRLStore;",
            ">;"
        }
    .end annotation
.end field

.field private final namedCertificateStoreMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/spongycastle/asn1/x509/GeneralName;",
            "Lorg/spongycastle/jcajce/PKIXCertStore;",
            ">;"
        }
    .end annotation
.end field

.field private final revocationEnabled:Z

.field private final targetConstraints:Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

.field private final trustAnchors:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/security/cert/TrustAnchor;",
            ">;"
        }
    .end annotation
.end field

.field private final useDeltas:Z

.field private final validityModel:I


# direct methods
.method private constructor <init>(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)V
    .registers 4
    .param p1, "builder"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;

    .prologue
    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 211
    # getter for: Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->baseParameters:Ljava/security/cert/PKIXParameters;
    invoke-static {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->access$1000(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)Ljava/security/cert/PKIXParameters;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->baseParameters:Ljava/security/cert/PKIXParameters;

    .line 212
    # getter for: Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->date:Ljava/util/Date;
    invoke-static {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->access$1100(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->date:Ljava/util/Date;

    .line 213
    # getter for: Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->extraCertStores:Ljava/util/List;
    invoke-static {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->access$1200(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->extraCertStores:Ljava/util/List;

    .line 214
    new-instance v0, Ljava/util/HashMap;

    # getter for: Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->namedCertificateStoreMap:Ljava/util/Map;
    invoke-static {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->access$1300(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->namedCertificateStoreMap:Ljava/util/Map;

    .line 215
    # getter for: Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->extraCRLStores:Ljava/util/List;
    invoke-static {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->access$1400(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->extraCRLStores:Ljava/util/List;

    .line 216
    new-instance v0, Ljava/util/HashMap;

    # getter for: Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->namedCRLStoreMap:Ljava/util/Map;
    invoke-static {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->access$1500(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->namedCRLStoreMap:Ljava/util/Map;

    .line 217
    # getter for: Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->targetConstraints:Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    invoke-static {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->access$1600(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->targetConstraints:Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    .line 218
    # getter for: Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->revocationEnabled:Z
    invoke-static {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->access$1700(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->revocationEnabled:Z

    .line 219
    # getter for: Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->useDeltas:Z
    invoke-static {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->access$1800(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->useDeltas:Z

    .line 220
    # getter for: Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->validityModel:I
    invoke-static {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->access$1900(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)I

    move-result v0

    iput v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->validityModel:I

    .line 221
    # getter for: Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->trustAnchors:Ljava/util/Set;
    invoke-static {p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;->access$2000(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->trustAnchors:Ljava/util/Set;

    .line 222
    return-void
.end method

.method synthetic constructor <init>(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;Lorg/spongycastle/jcajce/PKIXExtendedParameters$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;
    .param p2, "x1"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters$1;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lorg/spongycastle/jcajce/PKIXExtendedParameters;-><init>(Lorg/spongycastle/jcajce/PKIXExtendedParameters$Builder;)V

    return-void
.end method

.method static synthetic access$000(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/security/cert/PKIXParameters;
    .registers 2
    .param p0, "x0"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .prologue
    .line 21
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->baseParameters:Ljava/security/cert/PKIXParameters;

    return-object v0
.end method

.method static synthetic access$100(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/util/Date;
    .registers 2
    .param p0, "x0"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .prologue
    .line 21
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->date:Ljava/util/Date;

    return-object v0
.end method

.method static synthetic access$200(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    .registers 2
    .param p0, "x0"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .prologue
    .line 21
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->targetConstraints:Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    return-object v0
.end method

.method static synthetic access$300(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .prologue
    .line 21
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->extraCertStores:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .prologue
    .line 21
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->namedCertificateStoreMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$500(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .prologue
    .line 21
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->extraCRLStores:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$600(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .prologue
    .line 21
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->namedCRLStoreMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$700(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)Z
    .registers 2
    .param p0, "x0"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .prologue
    .line 21
    iget-boolean v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->useDeltas:Z

    return v0
.end method

.method static synthetic access$800(Lorg/spongycastle/jcajce/PKIXExtendedParameters;)I
    .registers 2
    .param p0, "x0"    # Lorg/spongycastle/jcajce/PKIXExtendedParameters;

    .prologue
    .line 21
    iget v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->validityModel:I

    return v0
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 1

    .prologue
    .line 277
    return-object p0
.end method

.method public getCRLStores()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/spongycastle/jcajce/PKIXCRLStore;",
            ">;"
        }
    .end annotation

    .prologue
    .line 237
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->extraCRLStores:Ljava/util/List;

    return-object v0
.end method

.method public getCertPathCheckers()Ljava/util/List;
    .registers 2

    .prologue
    .line 327
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->baseParameters:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v0}, Ljava/security/cert/PKIXParameters;->getCertPathCheckers()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getCertStores()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/security/cert/CertStore;",
            ">;"
        }
    .end annotation

    .prologue
    .line 332
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->baseParameters:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v0}, Ljava/security/cert/PKIXParameters;->getCertStores()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getCertificateStores()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/spongycastle/jcajce/PKIXCertStore;",
            ">;"
        }
    .end annotation

    .prologue
    .line 226
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->extraCertStores:Ljava/util/List;

    return-object v0
.end method

.method public getDate()Ljava/util/Date;
    .registers 4

    .prologue
    .line 247
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->date:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getInitialPolicies()Ljava/util/Set;
    .registers 2

    .prologue
    .line 302
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->baseParameters:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v0}, Ljava/security/cert/PKIXParameters;->getInitialPolicies()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getNamedCRLStoreMap()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lorg/spongycastle/asn1/x509/GeneralName;",
            "Lorg/spongycastle/jcajce/PKIXCRLStore;",
            ">;"
        }
    .end annotation

    .prologue
    .line 242
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->namedCRLStoreMap:Ljava/util/Map;

    return-object v0
.end method

.method public getNamedCertificateStoreMap()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lorg/spongycastle/asn1/x509/GeneralName;",
            "Lorg/spongycastle/jcajce/PKIXCertStore;",
            ">;"
        }
    .end annotation

    .prologue
    .line 232
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->namedCertificateStoreMap:Ljava/util/Map;

    return-object v0
.end method

.method public getSigProvider()Ljava/lang/String;
    .registers 2

    .prologue
    .line 307
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->baseParameters:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v0}, Ljava/security/cert/PKIXParameters;->getSigProvider()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTargetConstraints()Lorg/spongycastle/jcajce/PKIXCertStoreSelector;
    .registers 2

    .prologue
    .line 292
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->targetConstraints:Lorg/spongycastle/jcajce/PKIXCertStoreSelector;

    return-object v0
.end method

.method public getTrustAnchors()Ljava/util/Set;
    .registers 2

    .prologue
    .line 297
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->trustAnchors:Ljava/util/Set;

    return-object v0
.end method

.method public getValidityModel()I
    .registers 2

    .prologue
    .line 272
    iget v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->validityModel:I

    return v0
.end method

.method public isAnyPolicyInhibited()Z
    .registers 2

    .prologue
    .line 317
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->baseParameters:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v0}, Ljava/security/cert/PKIXParameters;->isAnyPolicyInhibited()Z

    move-result v0

    return v0
.end method

.method public isExplicitPolicyRequired()Z
    .registers 2

    .prologue
    .line 312
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->baseParameters:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v0}, Ljava/security/cert/PKIXParameters;->isExplicitPolicyRequired()Z

    move-result v0

    return v0
.end method

.method public isPolicyMappingInhibited()Z
    .registers 2

    .prologue
    .line 322
    iget-object v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->baseParameters:Ljava/security/cert/PKIXParameters;

    invoke-virtual {v0}, Ljava/security/cert/PKIXParameters;->isPolicyMappingInhibited()Z

    move-result v0

    return v0
.end method

.method public isRevocationEnabled()Z
    .registers 2

    .prologue
    .line 337
    iget-boolean v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->revocationEnabled:Z

    return v0
.end method

.method public isUseDeltasEnabled()Z
    .registers 2

    .prologue
    .line 260
    iget-boolean v0, p0, Lorg/spongycastle/jcajce/PKIXExtendedParameters;->useDeltas:Z

    return v0
.end method
