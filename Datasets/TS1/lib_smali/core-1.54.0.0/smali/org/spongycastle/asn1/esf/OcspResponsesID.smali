.class public Lorg/spongycastle/asn1/esf/OcspResponsesID;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "OcspResponsesID.java"


# instance fields
.field private ocspIdentifier:Lorg/spongycastle/asn1/esf/OcspIdentifier;

.field private ocspRepHash:Lorg/spongycastle/asn1/esf/OtherHash;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 5
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v2, 0x1

    .line 39
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 40
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    if-lt v0, v2, :cond_11

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_2e

    .line 42
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad sequence size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 43
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_2e
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/esf/OcspIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/OcspIdentifier;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/esf/OcspResponsesID;->ocspIdentifier:Lorg/spongycastle/asn1/esf/OcspIdentifier;

    .line 46
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    if-le v0, v2, :cond_49

    .line 48
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/esf/OtherHash;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/OtherHash;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/esf/OcspResponsesID;->ocspRepHash:Lorg/spongycastle/asn1/esf/OtherHash;

    .line 50
    :cond_49
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/esf/OcspIdentifier;)V
    .registers 3
    .param p1, "ocspIdentifier"    # Lorg/spongycastle/asn1/esf/OcspIdentifier;

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/esf/OcspResponsesID;-><init>(Lorg/spongycastle/asn1/esf/OcspIdentifier;Lorg/spongycastle/asn1/esf/OtherHash;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/esf/OcspIdentifier;Lorg/spongycastle/asn1/esf/OtherHash;)V
    .registers 3
    .param p1, "ocspIdentifier"    # Lorg/spongycastle/asn1/esf/OcspIdentifier;
    .param p2, "ocspRepHash"    # Lorg/spongycastle/asn1/esf/OtherHash;

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/spongycastle/asn1/esf/OcspResponsesID;->ocspIdentifier:Lorg/spongycastle/asn1/esf/OcspIdentifier;

    .line 60
    iput-object p2, p0, Lorg/spongycastle/asn1/esf/OcspResponsesID;->ocspRepHash:Lorg/spongycastle/asn1/esf/OtherHash;

    .line 61
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/OcspResponsesID;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 26
    instance-of v0, p0, Lorg/spongycastle/asn1/esf/OcspResponsesID;

    if-eqz v0, :cond_7

    .line 28
    check-cast p0, Lorg/spongycastle/asn1/esf/OcspResponsesID;

    .line 35
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 30
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 32
    new-instance v0, Lorg/spongycastle/asn1/esf/OcspResponsesID;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/esf/OcspResponsesID;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 35
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getOcspIdentifier()Lorg/spongycastle/asn1/esf/OcspIdentifier;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/OcspResponsesID;->ocspIdentifier:Lorg/spongycastle/asn1/esf/OcspIdentifier;

    return-object v0
.end method

.method public getOcspRepHash()Lorg/spongycastle/asn1/esf/OtherHash;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/OcspResponsesID;->ocspRepHash:Lorg/spongycastle/asn1/esf/OtherHash;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 75
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 76
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/OcspResponsesID;->ocspIdentifier:Lorg/spongycastle/asn1/esf/OcspIdentifier;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 77
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/OcspResponsesID;->ocspRepHash:Lorg/spongycastle/asn1/esf/OtherHash;

    if-eqz v1, :cond_13

    .line 79
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/OcspResponsesID;->ocspRepHash:Lorg/spongycastle/asn1/esf/OtherHash;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 81
    :cond_13
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
