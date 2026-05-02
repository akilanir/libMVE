.class public Lorg/spongycastle/crypto/ec/CustomNamedCurves;
.super Ljava/lang/Object;
.source "CustomNamedCurves.java"


# static fields
.field static curve25519:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static final nameToCurve:Ljava/util/Hashtable;

.field static final nameToOID:Ljava/util/Hashtable;

.field static final names:Ljava/util/Vector;

.field static final oidToCurve:Ljava/util/Hashtable;

.field static final oidToName:Ljava/util/Hashtable;

.field static secp128r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static secp160k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static secp160r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static secp160r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static secp192k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static secp192r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static secp224k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static secp224r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static secp256k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static secp256r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static secp384r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static secp521r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect113r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect113r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect131r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect131r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect163k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect163r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect163r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect193r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect193r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect233k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect233r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect239k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect283k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect283r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect409k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect409r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect571k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

.field static sect571r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 65
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$1;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$1;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->curve25519:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 92
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$2;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$2;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp128r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 108
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$3;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$3;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp160k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 136
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$4;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$4;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp160r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 152
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$5;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$5;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp160r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 168
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$6;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$6;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp192k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 196
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$7;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$7;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp192r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 212
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$8;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$8;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp224k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 240
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$9;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$9;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp224r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 256
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$10;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$10;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp256k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 284
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$11;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$11;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp256r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 300
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$12;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$12;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp384r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 316
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$13;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$13;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp521r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 332
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$14;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$14;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect113r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 348
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$15;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$15;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect113r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 364
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$16;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$16;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect131r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 380
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$17;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$17;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect131r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 396
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$18;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$18;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect163k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 412
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$19;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$19;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect163r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 428
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$20;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$20;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect163r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 444
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$21;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$21;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect193r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 460
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$22;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$22;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect193r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 476
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$23;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$23;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect233k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 492
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$24;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$24;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect233r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 508
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$25;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$25;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect239k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 524
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$26;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$26;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect283k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 540
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$27;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$27;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect283r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 556
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$28;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$28;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect409k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 572
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$29;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$29;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect409r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 588
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$30;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$30;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect571k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 604
    new-instance v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves$31;

    invoke-direct {v0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves$31;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect571r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 618
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->nameToCurve:Ljava/util/Hashtable;

    .line 619
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->nameToOID:Ljava/util/Hashtable;

    .line 620
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->oidToCurve:Ljava/util/Hashtable;

    .line 621
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->oidToName:Ljava/util/Hashtable;

    .line 622
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->names:Ljava/util/Vector;

    .line 656
    const-string v0, "curve25519"

    sget-object v1, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->curve25519:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurve(Ljava/lang/String;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 660
    const-string v0, "secp128r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp128r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp128r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 662
    const-string v0, "secp160k1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp160k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp160k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 663
    const-string v0, "secp160r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp160r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp160r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 664
    const-string v0, "secp160r2"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp160r2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp160r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 665
    const-string v0, "secp192k1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp192k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp192k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 666
    const-string v0, "secp192r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp192r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp192r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 667
    const-string v0, "secp224k1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp224k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp224k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 668
    const-string v0, "secp224r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp224r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp224r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 669
    const-string v0, "secp256k1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp256k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp256k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 670
    const-string v0, "secp256r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp256r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp256r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 671
    const-string v0, "secp384r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp384r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp384r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 672
    const-string v0, "secp521r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp521r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->secp521r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 674
    const-string v0, "sect113r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect113r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect113r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 675
    const-string v0, "sect113r2"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect113r2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect113r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 676
    const-string v0, "sect131r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect131r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect131r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 677
    const-string v0, "sect131r2"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect131r2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect131r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 678
    const-string v0, "sect163k1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect163k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect163k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 679
    const-string v0, "sect163r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect163r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect163r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 680
    const-string v0, "sect163r2"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect163r2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect163r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 681
    const-string v0, "sect193r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect193r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect193r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 682
    const-string v0, "sect193r2"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect193r2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect193r2:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 683
    const-string v0, "sect233k1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect233k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect233k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 684
    const-string v0, "sect233r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect233r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect233r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 685
    const-string v0, "sect239k1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect239k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect239k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 686
    const-string v0, "sect283k1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect283k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect283k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 687
    const-string v0, "sect283r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect283r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect283r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 688
    const-string v0, "sect409k1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect409k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect409k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 689
    const-string v0, "sect409r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect409r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect409r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 690
    const-string v0, "sect571k1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect571k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect571k1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 691
    const-string v0, "sect571r1"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect571r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->sect571r1:Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    invoke-static {v0, v1, v2}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V

    .line 693
    const-string v0, "B-163"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect163r2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 694
    const-string v0, "B-233"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect233r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 695
    const-string v0, "B-283"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect283r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 696
    const-string v0, "B-409"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect409r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 697
    const-string v0, "B-571"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect571r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 699
    const-string v0, "K-163"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect163k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 700
    const-string v0, "K-233"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect233k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 701
    const-string v0, "K-283"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect283k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 702
    const-string v0, "K-409"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect409k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 703
    const-string v0, "K-571"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->sect571k1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 705
    const-string v0, "P-192"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp192r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 706
    const-string v0, "P-224"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp224r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 707
    const-string v0, "P-256"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp256r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 708
    const-string v0, "P-384"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp384r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 709
    const-string v0, "P-521"

    sget-object v1, Lorg/spongycastle/asn1/sec/SECObjectIdentifiers;->secp521r1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 710
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/spongycastle/math/ec/ECCurve;)Lorg/spongycastle/math/ec/ECCurve;
    .registers 2
    .param p0, "x0"    # Lorg/spongycastle/math/ec/ECCurve;

    .prologue
    .line 50
    invoke-static {p0}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->configureCurve(Lorg/spongycastle/math/ec/ECCurve;)Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;)Lorg/spongycastle/math/ec/ECCurve;
    .registers 3
    .param p0, "x0"    # Lorg/spongycastle/math/ec/ECCurve;
    .param p1, "x1"    # Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;

    .prologue
    .line 50
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->configureCurveGLV(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;)Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v0

    return-object v0
.end method

.method private static configureCurve(Lorg/spongycastle/math/ec/ECCurve;)Lorg/spongycastle/math/ec/ECCurve;
    .registers 1
    .param p0, "curve"    # Lorg/spongycastle/math/ec/ECCurve;

    .prologue
    .line 54
    return-object p0
.end method

.method private static configureCurveGLV(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;)Lorg/spongycastle/math/ec/ECCurve;
    .registers 4
    .param p0, "c"    # Lorg/spongycastle/math/ec/ECCurve;
    .param p1, "p"    # Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;

    .prologue
    .line 59
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve;->configure()Lorg/spongycastle/math/ec/ECCurve$Config;

    move-result-object v0

    new-instance v1, Lorg/spongycastle/math/ec/endo/GLVTypeBEndomorphism;

    invoke-direct {v1, p0, p1}, Lorg/spongycastle/math/ec/endo/GLVTypeBEndomorphism;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/endo/GLVTypeBParameters;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/math/ec/ECCurve$Config;->setEndomorphism(Lorg/spongycastle/math/ec/endo/ECEndomorphism;)Lorg/spongycastle/math/ec/ECCurve$Config;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve$Config;->create()Lorg/spongycastle/math/ec/ECCurve;

    move-result-object v0

    return-object v0
.end method

.method static defineCurve(Ljava/lang/String;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V
    .registers 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "holder"    # Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .prologue
    .line 626
    sget-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->names:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 627
    invoke-static {p0}, Lorg/spongycastle/util/Strings;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 628
    sget-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->nameToCurve:Ljava/util/Hashtable;

    invoke-virtual {v0, p0, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 629
    return-void
.end method

.method static defineCurveAlias(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 643
    sget-object v1, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->oidToCurve:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 644
    .local v0, "curve":Ljava/lang/Object;
    if-nez v0, :cond_e

    .line 646
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 649
    :cond_e
    invoke-static {p0}, Lorg/spongycastle/util/Strings;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 650
    sget-object v1, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->nameToOID:Ljava/util/Hashtable;

    invoke-virtual {v1, p0, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 651
    sget-object v1, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->nameToCurve:Ljava/util/Hashtable;

    invoke-virtual {v1, p0, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 652
    return-void
.end method

.method static defineCurveWithOID(Ljava/lang/String;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/x9/X9ECParametersHolder;)V
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "holder"    # Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .prologue
    .line 633
    sget-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->names:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 634
    sget-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->oidToName:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 635
    sget-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->oidToCurve:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    invoke-static {p0}, Lorg/spongycastle/util/Strings;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 637
    sget-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->nameToOID:Ljava/util/Hashtable;

    invoke-virtual {v0, p0, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    sget-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->nameToCurve:Ljava/util/Hashtable;

    invoke-virtual {v0, p0, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 639
    return-void
.end method

.method public static getByName(Ljava/lang/String;)Lorg/spongycastle/asn1/x9/X9ECParameters;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 714
    sget-object v1, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->nameToCurve:Ljava/util/Hashtable;

    invoke-static {p0}, Lorg/spongycastle/util/Strings;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 715
    .local v0, "holder":Lorg/spongycastle/asn1/x9/X9ECParametersHolder;
    if-nez v0, :cond_10

    const/4 v1, 0x0

    :goto_f
    return-object v1

    :cond_10
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x9/X9ECParametersHolder;->getParameters()Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v1

    goto :goto_f
.end method

.method public static getByOID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/x9/X9ECParameters;
    .registers 3
    .param p0, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 727
    sget-object v1, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->oidToCurve:Ljava/util/Hashtable;

    invoke-virtual {v1, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/x9/X9ECParametersHolder;

    .line 728
    .local v0, "holder":Lorg/spongycastle/asn1/x9/X9ECParametersHolder;
    if-nez v0, :cond_c

    const/4 v1, 0x0

    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x9/X9ECParametersHolder;->getParameters()Lorg/spongycastle/asn1/x9/X9ECParameters;

    move-result-object v1

    goto :goto_b
.end method

.method public static getName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;
    .registers 2
    .param p0, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 747
    sget-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->oidToName:Ljava/util/Hashtable;

    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getNames()Ljava/util/Enumeration;
    .registers 1

    .prologue
    .line 755
    sget-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->names:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public static getOID(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 739
    sget-object v0, Lorg/spongycastle/crypto/ec/CustomNamedCurves;->nameToOID:Ljava/util/Hashtable;

    invoke-static {p0}, Lorg/spongycastle/util/Strings;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-object v0
.end method
