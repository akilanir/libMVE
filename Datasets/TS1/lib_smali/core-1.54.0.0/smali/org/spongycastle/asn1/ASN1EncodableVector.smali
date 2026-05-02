.class public Lorg/spongycastle/asn1/ASN1EncodableVector;
.super Ljava/lang/Object;
.source "ASN1EncodableVector.java"


# instance fields
.field private final v:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1EncodableVector;->v:Ljava/util/Vector;

    .line 18
    return-void
.end method


# virtual methods
.method public add(Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 3
    .param p1, "obj"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 27
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1EncodableVector;->v:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 28
    return-void
.end method

.method public addAll(Lorg/spongycastle/asn1/ASN1EncodableVector;)V
    .registers 5
    .param p1, "other"    # Lorg/spongycastle/asn1/ASN1EncodableVector;

    .prologue
    .line 37
    iget-object v1, p1, Lorg/spongycastle/asn1/ASN1EncodableVector;->v:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "en":Ljava/util/Enumeration;
    :goto_6
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 39
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1EncodableVector;->v:Ljava/util/Vector;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_6

    .line 41
    :cond_16
    return-void
.end method

.method public get(I)Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 51
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1EncodableVector;->v:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/asn1/ASN1Encodable;

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1EncodableVector;->v:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method
