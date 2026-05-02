.class public Lorg/spongycastle/asn1/BERSequence;
.super Lorg/spongycastle/asn1/ASN1Sequence;
.source "BERSequence.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Sequence;-><init>()V

    .line 17
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 2
    .param p1, "obj"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V
    .registers 2
    .param p1, "v"    # Lorg/spongycastle/asn1/ASN1EncodableVector;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 35
    return-void
.end method

.method public constructor <init>([Lorg/spongycastle/asn1/ASN1Encodable;)V
    .registers 2
    .param p1, "array"    # [Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;-><init>([Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 44
    return-void
.end method


# virtual methods
.method encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V
    .registers 5
    .param p1, "out"    # Lorg/spongycastle/asn1/ASN1OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 62
    const/16 v1, 0x30

    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;->write(I)V

    .line 63
    const/16 v1, 0x80

    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;->write(I)V

    .line 65
    invoke-virtual {p0}, Lorg/spongycastle/asn1/BERSequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .line 66
    .local v0, "e":Ljava/util/Enumeration;
    :goto_f
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 68
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeObject(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_f

    .line 71
    :cond_1f
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1OutputStream;->write(I)V

    .line 72
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1OutputStream;->write(I)V

    .line 73
    return-void
.end method

.method encodedLength()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    const/4 v1, 0x0

    .line 50
    .local v1, "length":I
    invoke-virtual {p0}, Lorg/spongycastle/asn1/BERSequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_5
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 52
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v2}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Primitive;->encodedLength()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_5

    .line 55
    :cond_1b
    add-int/lit8 v2, v1, 0x2

    add-int/lit8 v2, v2, 0x2

    return v2
.end method
