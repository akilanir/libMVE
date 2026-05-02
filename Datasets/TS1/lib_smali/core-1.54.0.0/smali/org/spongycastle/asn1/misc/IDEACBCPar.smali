.class public Lorg/spongycastle/asn1/misc/IDEACBCPar;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "IDEACBCPar.java"


# instance fields
.field iv:Lorg/spongycastle/asn1/ASN1OctetString;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 4
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 40
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_14

    .line 42
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetString;

    iput-object v0, p0, Lorg/spongycastle/asn1/misc/IDEACBCPar;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 48
    :goto_13
    return-void

    .line 46
    :cond_14
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/asn1/misc/IDEACBCPar;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    goto :goto_13
.end method

.method public constructor <init>([B)V
    .registers 3
    .param p1, "iv"    # [B

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 34
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    iput-object v0, p0, Lorg/spongycastle/asn1/misc/IDEACBCPar;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 35
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/misc/IDEACBCPar;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 19
    instance-of v0, p0, Lorg/spongycastle/asn1/misc/IDEACBCPar;

    if-eqz v0, :cond_7

    .line 21
    check-cast p0, Lorg/spongycastle/asn1/misc/IDEACBCPar;

    .line 28
    .end local p0    # "o":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 23
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 25
    new-instance v0, Lorg/spongycastle/asn1/misc/IDEACBCPar;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/misc/IDEACBCPar;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 28
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getIV()[B
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lorg/spongycastle/asn1/misc/IDEACBCPar;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v0, :cond_b

    .line 54
    iget-object v0, p0, Lorg/spongycastle/asn1/misc/IDEACBCPar;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v0

    .line 58
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 3

    .prologue
    .line 72
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 74
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/misc/IDEACBCPar;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v1, :cond_e

    .line 76
    iget-object v1, p0, Lorg/spongycastle/asn1/misc/IDEACBCPar;->iv:Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 79
    :cond_e
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method
