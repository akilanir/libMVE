.class public Lorg/spongycastle/asn1/BEROutputStream;
.super Lorg/spongycastle/asn1/DEROutputStream;
.source "BEROutputStream.java"


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DEROutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 13
    return-void
.end method


# virtual methods
.method public writeObject(Ljava/lang/Object;)V
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 19
    if-nez p1, :cond_6

    .line 21
    invoke-virtual {p0}, Lorg/spongycastle/asn1/BEROutputStream;->writeNull()V

    .line 35
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_5
    return-void

    .line 23
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_6
    instance-of v0, p1, Lorg/spongycastle/asn1/ASN1Primitive;

    if-eqz v0, :cond_10

    .line 25
    check-cast p1, Lorg/spongycastle/asn1/ASN1Primitive;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1, p0}, Lorg/spongycastle/asn1/ASN1Primitive;->encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V

    goto :goto_5

    .line 27
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_10
    instance-of v0, p1, Lorg/spongycastle/asn1/ASN1Encodable;

    if-eqz v0, :cond_1e

    .line 29
    check-cast p1, Lorg/spongycastle/asn1/ASN1Encodable;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1Primitive;->encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V

    goto :goto_5

    .line 33
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1e
    new-instance v0, Ljava/io/IOException;

    const-string v1, "object not BEREncodable"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
