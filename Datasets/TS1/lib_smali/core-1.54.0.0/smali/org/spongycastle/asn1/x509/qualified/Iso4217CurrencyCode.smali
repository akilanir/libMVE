.class public Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "Iso4217CurrencyCode.java"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field final ALPHABETIC_MAXSIZE:I

.field final NUMERIC_MAXSIZE:I

.field final NUMERIC_MINSIZE:I

.field numeric:I

.field obj:Lorg/spongycastle/asn1/ASN1Encodable;


# direct methods
.method public constructor <init>(I)V
    .registers 5
    .param p1, "numeric"    # I

    .prologue
    const/16 v2, 0x3e7

    const/4 v1, 0x1

    .line 56
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 24
    const/4 v0, 0x3

    iput v0, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->ALPHABETIC_MAXSIZE:I

    .line 25
    iput v1, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->NUMERIC_MINSIZE:I

    .line 26
    iput v2, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->NUMERIC_MAXSIZE:I

    .line 57
    if-gt p1, v2, :cond_11

    if-ge p1, v1, :cond_19

    .line 59
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "wrong size in numeric code : not in (1..999)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 61
    :cond_19
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    int-to-long v1, p1

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 62
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "alphabetic"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x3

    .line 66
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 24
    iput v1, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->ALPHABETIC_MAXSIZE:I

    .line 25
    const/4 v0, 0x1

    iput v0, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->NUMERIC_MINSIZE:I

    .line 26
    const/16 v0, 0x3e7

    iput v0, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->NUMERIC_MAXSIZE:I

    .line 67
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_1b

    .line 69
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "wrong size in alphabetic code : max size is 3"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_1b
    new-instance v0, Lorg/spongycastle/asn1/DERPrintableString;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DERPrintableString;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 72
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 34
    if-eqz p0, :cond_6

    instance-of v3, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;

    if-eqz v3, :cond_9

    .line 36
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;

    .line 49
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_8
    return-object p0

    .line 39
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_9
    instance-of v3, p0, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v3, :cond_1f

    .line 41
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v2

    .line 42
    .local v2, "numericobj":Lorg/spongycastle/asn1/ASN1Integer;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    move-result v1

    .line 43
    .local v1, "numeric":I
    new-instance p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;-><init>(I)V

    goto :goto_8

    .line 46
    .end local v1    # "numeric":I
    .end local v2    # "numericobj":Lorg/spongycastle/asn1/ASN1Integer;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_1f
    instance-of v3, p0, Lorg/spongycastle/asn1/DERPrintableString;

    if-eqz v3, :cond_31

    .line 48
    invoke-static {p0}, Lorg/spongycastle/asn1/DERPrintableString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERPrintableString;

    move-result-object v0

    .line 49
    .local v0, "alphabetic":Lorg/spongycastle/asn1/DERPrintableString;
    new-instance p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERPrintableString;->getString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;-><init>(Ljava/lang/String;)V

    goto :goto_8

    .line 51
    .end local v0    # "alphabetic":Lorg/spongycastle/asn1/DERPrintableString;
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_31
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "unknown object in getInstance"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public getAlphabetic()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/DERPrintableString;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERPrintableString;->getString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNumeric()I
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    check-cast v0, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    return v0
.end method

.method public isAlphabetic()Z
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    instance-of v0, v0, Lorg/spongycastle/asn1/DERPrintableString;

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/Iso4217CurrencyCode;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    return-object v0
.end method
