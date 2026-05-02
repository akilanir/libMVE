.class public Lorg/spongycastle/asn1/isismtt/x509/AdditionalInformationSyntax;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "AdditionalInformationSyntax.java"


# instance fields
.field private information:Lorg/spongycastle/asn1/x500/DirectoryString;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "information"    # Ljava/lang/String;

    .prologue
    .line 47
    new-instance v0, Lorg/spongycastle/asn1/x500/DirectoryString;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/x500/DirectoryString;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/isismtt/x509/AdditionalInformationSyntax;-><init>(Lorg/spongycastle/asn1/x500/DirectoryString;)V

    .line 48
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/x500/DirectoryString;)V
    .registers 2
    .param p1, "information"    # Lorg/spongycastle/asn1/x500/DirectoryString;

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/spongycastle/asn1/isismtt/x509/AdditionalInformationSyntax;->information:Lorg/spongycastle/asn1/x500/DirectoryString;

    .line 38
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/isismtt/x509/AdditionalInformationSyntax;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 22
    instance-of v0, p0, Lorg/spongycastle/asn1/isismtt/x509/AdditionalInformationSyntax;

    if-eqz v0, :cond_7

    .line 24
    check-cast p0, Lorg/spongycastle/asn1/isismtt/x509/AdditionalInformationSyntax;

    .line 32
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 27
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 29
    new-instance v0, Lorg/spongycastle/asn1/isismtt/x509/AdditionalInformationSyntax;

    invoke-static {p0}, Lorg/spongycastle/asn1/x500/DirectoryString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/DirectoryString;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/isismtt/x509/AdditionalInformationSyntax;-><init>(Lorg/spongycastle/asn1/x500/DirectoryString;)V

    move-object p0, v0

    goto :goto_6

    .line 32
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getInformation()Lorg/spongycastle/asn1/x500/DirectoryString;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lorg/spongycastle/asn1/isismtt/x509/AdditionalInformationSyntax;->information:Lorg/spongycastle/asn1/x500/DirectoryString;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lorg/spongycastle/asn1/isismtt/x509/AdditionalInformationSyntax;->information:Lorg/spongycastle/asn1/x500/DirectoryString;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/x500/DirectoryString;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    return-object v0
.end method
