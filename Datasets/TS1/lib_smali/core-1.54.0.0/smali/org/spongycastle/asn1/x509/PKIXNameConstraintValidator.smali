.class public Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;
.super Ljava/lang/Object;
.source "PKIXNameConstraintValidator.java"

# interfaces
.implements Lorg/spongycastle/asn1/x509/NameConstraintValidator;


# instance fields
.field private excludedSubtreesDN:Ljava/util/Set;

.field private excludedSubtreesDNS:Ljava/util/Set;

.field private excludedSubtreesEmail:Ljava/util/Set;

.field private excludedSubtreesIP:Ljava/util/Set;

.field private excludedSubtreesURI:Ljava/util/Set;

.field private permittedSubtreesDN:Ljava/util/Set;

.field private permittedSubtreesDNS:Ljava/util/Set;

.field private permittedSubtreesEmail:Ljava/util/Set;

.field private permittedSubtreesIP:Ljava/util/Set;

.field private permittedSubtreesURI:Ljava/util/Set;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDN:Ljava/util/Set;

    .line 24
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDNS:Ljava/util/Set;

    .line 26
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesEmail:Ljava/util/Set;

    .line 28
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesURI:Ljava/util/Set;

    .line 30
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesIP:Ljava/util/Set;

    .line 44
    return-void
.end method

.method private checkExcludedDN(Ljava/util/Set;Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 7
    .param p1, "excluded"    # Ljava/util/Set;
    .param p2, "dns"    # Lorg/spongycastle/asn1/ASN1Sequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 383
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 400
    :cond_6
    return-void

    .line 388
    :cond_7
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 390
    .local v0, "it":Ljava/util/Iterator;
    :cond_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 392
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 394
    .local v1, "subtree":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-static {p2, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDNSubtree(Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/ASN1Sequence;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 396
    new-instance v2, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;

    const-string v3, "Subject distinguished name is from an excluded subtree"

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private checkExcludedDN(Lorg/spongycastle/asn1/x500/X500Name;)V
    .registers 4
    .param p1, "dns"    # Lorg/spongycastle/asn1/x500/X500Name;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 324
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDN:Ljava/util/Set;

    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkExcludedDN(Ljava/util/Set;Lorg/spongycastle/asn1/ASN1Sequence;)V

    .line 325
    return-void
.end method

.method private checkExcludedDNS(Ljava/util/Set;Ljava/lang/String;)V
    .registers 7
    .param p1, "excluded"    # Ljava/util/Set;
    .param p2, "dns"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 992
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1010
    :cond_6
    return-void

    .line 997
    :cond_7
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 999
    .local v0, "it":Ljava/util/Iterator;
    :cond_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1001
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1004
    .local v1, "str":Ljava/lang/String;
    invoke-direct {p0, p2, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_23

    invoke-virtual {p2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 1006
    :cond_23
    new-instance v2, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;

    const-string v3, "DNS is from an excluded subtree."

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private checkExcludedEmail(Ljava/util/Set;Ljava/lang/String;)V
    .registers 7
    .param p1, "excluded"    # Ljava/util/Set;
    .param p2, "email"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 780
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 797
    :cond_6
    return-void

    .line 785
    :cond_7
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 787
    .local v0, "it":Ljava/util/Iterator;
    :cond_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 789
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 791
    .local v1, "str":Ljava/lang/String;
    invoke-direct {p0, p2, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->emailIsConstrained(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 793
    new-instance v2, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;

    const-string v3, "Email address is from an excluded subtree."

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private checkExcludedIP(Ljava/util/Set;[B)V
    .registers 7
    .param p1, "excluded"    # Ljava/util/Set;
    .param p2, "ip"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 847
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 864
    :cond_6
    return-void

    .line 852
    :cond_7
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 854
    .local v1, "it":Ljava/util/Iterator;
    :cond_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 856
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    move-object v0, v2

    check-cast v0, [B

    .line 858
    .local v0, "ipWithSubnet":[B
    invoke-direct {p0, p2, v0}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->isIPConstrained([B[B)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 860
    new-instance v2, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;

    const-string v3, "IP is from an excluded subtree."

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private checkExcludedURI(Ljava/util/Set;Ljava/lang/String;)V
    .registers 7
    .param p1, "excluded"    # Ljava/util/Set;
    .param p2, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 1477
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1494
    :cond_6
    return-void

    .line 1482
    :cond_7
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1484
    .local v0, "it":Ljava/util/Iterator;
    :cond_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1486
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1488
    .local v1, "str":Ljava/lang/String;
    invoke-direct {p0, p2, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->isUriConstrained(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 1490
    new-instance v2, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;

    const-string v3, "URI is from an excluded subtree."

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private checkPermittedDN(Ljava/util/Set;Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 7
    .param p1, "permitted"    # Ljava/util/Set;
    .param p2, "dns"    # Lorg/spongycastle/asn1/ASN1Sequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 355
    if-nez p1, :cond_3

    .line 372
    :cond_2
    :goto_2
    return-void

    .line 360
    :cond_3
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v2

    if-eqz v2, :cond_2

    .line 364
    :cond_f
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 366
    .local v0, "it":Ljava/util/Iterator;
    :cond_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 368
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 370
    .local v1, "subtree":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-static {p2, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDNSubtree(Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/ASN1Sequence;)Z

    move-result v2

    if-eqz v2, :cond_13

    goto :goto_2

    .line 376
    .end local v1    # "subtree":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_26
    new-instance v2, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;

    const-string v3, "Subject distinguished name is not from a permitted subtree"

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private checkPermittedDN(Lorg/spongycastle/asn1/x500/X500Name;)V
    .registers 4
    .param p1, "dns"    # Lorg/spongycastle/asn1/x500/X500Name;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 318
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDN:Ljava/util/Set;

    invoke-virtual {p1}, Lorg/spongycastle/asn1/x500/X500Name;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkPermittedDN(Ljava/util/Set;Lorg/spongycastle/asn1/ASN1Sequence;)V

    .line 319
    return-void
.end method

.method private checkPermittedDNS(Ljava/util/Set;Ljava/lang/String;)V
    .registers 7
    .param p1, "permitted"    # Ljava/util/Set;
    .param p2, "dns"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 964
    if-nez p1, :cond_3

    .line 983
    :cond_2
    :goto_2
    return-void

    .line 969
    :cond_3
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 971
    .local v0, "it":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 973
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 976
    .local v1, "str":Ljava/lang/String;
    invoke-direct {p0, p2, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    goto :goto_2

    .line 981
    .end local v1    # "str":Ljava/lang/String;
    :cond_20
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2c

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v2

    if-eqz v2, :cond_2

    .line 985
    :cond_2c
    new-instance v2, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;

    const-string v3, "DNS is not from a permitted subtree."

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private checkPermittedEmail(Ljava/util/Set;Ljava/lang/String;)V
    .registers 7
    .param p1, "permitted"    # Ljava/util/Set;
    .param p2, "email"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 751
    if-nez p1, :cond_3

    .line 770
    :cond_2
    :goto_2
    return-void

    .line 756
    :cond_3
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 758
    .local v0, "it":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 760
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 762
    .local v1, "str":Ljava/lang/String;
    invoke-direct {p0, p2, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->emailIsConstrained(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    goto :goto_2

    .line 768
    .end local v1    # "str":Ljava/lang/String;
    :cond_1a
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_26

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v2

    if-eqz v2, :cond_2

    .line 773
    :cond_26
    new-instance v2, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;

    const-string v3, "Subject email address is not from a permitted subtree."

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private checkPermittedIP(Ljava/util/Set;[B)V
    .registers 7
    .param p1, "permitted"    # Ljava/util/Set;
    .param p2, "ip"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 811
    if-nez p1, :cond_3

    .line 829
    :cond_2
    :goto_2
    return-void

    .line 816
    :cond_3
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 818
    .local v1, "it":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 820
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    move-object v0, v2

    check-cast v0, [B

    .line 822
    .local v0, "ipWithSubnet":[B
    invoke-direct {p0, p2, v0}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->isIPConstrained([B[B)Z

    move-result v2

    if-eqz v2, :cond_7

    goto :goto_2

    .line 827
    .end local v0    # "ipWithSubnet":[B
    :cond_1d
    array-length v2, p2

    if-nez v2, :cond_26

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v2

    if-eqz v2, :cond_2

    .line 831
    :cond_26
    new-instance v2, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;

    const-string v3, "IP is not from a permitted subtree."

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private checkPermittedURI(Ljava/util/Set;Ljava/lang/String;)V
    .registers 7
    .param p1, "permitted"    # Ljava/util/Set;
    .param p2, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 1647
    if-nez p1, :cond_3

    .line 1665
    :cond_2
    :goto_2
    return-void

    .line 1652
    :cond_3
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1654
    .local v0, "it":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 1656
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1658
    .local v1, "str":Ljava/lang/String;
    invoke-direct {p0, p2, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->isUriConstrained(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    goto :goto_2

    .line 1663
    .end local v1    # "str":Ljava/lang/String;
    :cond_1a
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_26

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v2

    if-eqz v2, :cond_2

    .line 1667
    :cond_26
    new-instance v2, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;

    const-string v3, "URI is not from a permitted subtree."

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private collectionsAreEqual(Ljava/util/Collection;Ljava/util/Collection;)Z
    .registers 12
    .param p1, "coll1"    # Ljava/util/Collection;
    .param p2, "coll2"    # Ljava/util/Collection;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1826
    if-ne p1, p2, :cond_5

    .line 1859
    :cond_4
    :goto_4
    return v5

    .line 1830
    :cond_5
    if-eqz p1, :cond_9

    if-nez p2, :cond_b

    :cond_9
    move v5, v6

    .line 1832
    goto :goto_4

    .line 1834
    :cond_b
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v7

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v8

    if-eq v7, v8, :cond_17

    move v5, v6

    .line 1836
    goto :goto_4

    .line 1838
    :cond_17
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1840
    .local v3, "it1":Ljava/util/Iterator;
    :cond_1b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1842
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 1843
    .local v0, "a":Ljava/lang/Object;
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 1844
    .local v4, "it2":Ljava/util/Iterator;
    const/4 v2, 0x0

    .line 1845
    .local v2, "found":Z
    :cond_2a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3b

    .line 1847
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 1848
    .local v1, "b":Ljava/lang/Object;
    invoke-direct {p0, v0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2a

    .line 1850
    const/4 v2, 0x1

    .line 1854
    .end local v1    # "b":Ljava/lang/Object;
    :cond_3b
    if-nez v2, :cond_1b

    move v5, v6

    .line 1856
    goto :goto_4
.end method

.method private static compareTo([B[B)I
    .registers 3
    .param p0, "ip1"    # [B
    .param p1, "ip2"    # [B

    .prologue
    .line 1772
    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1774
    const/4 v0, 0x0

    .line 1780
    :goto_7
    return v0

    .line 1776
    :cond_8
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->max([B[B)[B

    move-result-object v0

    invoke-static {v0, p0}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 1778
    const/4 v0, 0x1

    goto :goto_7

    .line 1780
    :cond_14
    const/4 v0, -0x1

    goto :goto_7
.end method

.method private emailIsConstrained(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p1, "email"    # Ljava/lang/String;
    .param p2, "constraint"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x40

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 904
    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 906
    .local v0, "sub":Ljava/lang/String;
    invoke-virtual {p2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1c

    .line 908
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 926
    :cond_1b
    :goto_1b
    return v1

    .line 914
    :cond_1c
    invoke-virtual {p2, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2e

    if-eq v3, v4, :cond_2c

    .line 916
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1b

    :cond_2a
    move v1, v2

    .line 926
    goto :goto_1b

    .line 922
    :cond_2c
    invoke-direct {p0, v0, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2a

    goto :goto_1b
.end method

.method private equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 1864
    if-ne p1, p2, :cond_4

    .line 1866
    const/4 v0, 0x1

    .line 1878
    .end local p1    # "o1":Ljava/lang/Object;
    .end local p2    # "o2":Ljava/lang/Object;
    :goto_3
    return v0

    .line 1868
    .restart local p1    # "o1":Ljava/lang/Object;
    .restart local p2    # "o2":Ljava/lang/Object;
    :cond_4
    if-eqz p1, :cond_8

    if-nez p2, :cond_a

    .line 1870
    :cond_8
    const/4 v0, 0x0

    goto :goto_3

    .line 1872
    :cond_a
    instance-of v0, p1, [B

    if-eqz v0, :cond_1f

    instance-of v0, p2, [B

    if-eqz v0, :cond_1f

    .line 1874
    check-cast p1, [B

    .end local p1    # "o1":Ljava/lang/Object;
    check-cast p1, [B

    check-cast p2, [B

    .end local p2    # "o2":Ljava/lang/Object;
    check-cast p2, [B

    invoke-static {p1, p2}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v0

    goto :goto_3

    .line 1878
    .restart local p1    # "o1":Ljava/lang/Object;
    .restart local p2    # "o2":Ljava/lang/Object;
    :cond_1f
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method private static extractHostFromURL(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x2f

    const/4 v4, 0x0

    const/4 v3, -0x1

    const/16 v2, 0x3a

    .line 1696
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1698
    .local v0, "sub":Ljava/lang/String;
    const-string v1, "//"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-eq v1, v3, :cond_24

    .line 1700
    const-string v1, "//"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1703
    :cond_24
    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_32

    .line 1705
    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1708
    :cond_32
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1709
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1711
    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_56

    .line 1713
    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1715
    :cond_56
    return-object v0
.end method

.method private extractIPsAndSubnetMasks([B[B)[[B
    .registers 10
    .param p1, "ipWithSubmask1"    # [B
    .param p2, "ipWithSubmask2"    # [B

    .prologue
    const/4 v6, 0x0

    .line 696
    array-length v5, p1

    div-int/lit8 v2, v5, 0x2

    .line 697
    .local v2, "ipLength":I
    new-array v0, v2, [B

    .line 698
    .local v0, "ip1":[B
    new-array v3, v2, [B

    .line 699
    .local v3, "subnetmask1":[B
    invoke-static {p1, v6, v0, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 700
    invoke-static {p1, v2, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 702
    new-array v1, v2, [B

    .line 703
    .local v1, "ip2":[B
    new-array v4, v2, [B

    .line 704
    .local v4, "subnetmask2":[B
    invoke-static {p2, v6, v1, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 705
    invoke-static {p2, v2, v4, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 706
    const/4 v5, 0x4

    new-array v5, v5, [[B

    aput-object v0, v5, v6

    const/4 v6, 0x1

    aput-object v3, v5, v6

    const/4 v6, 0x2

    aput-object v1, v5, v6

    const/4 v6, 0x3

    aput-object v4, v5, v6

    return-object v5
.end method

.method private extractNameAsString(Lorg/spongycastle/asn1/x509/GeneralName;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Lorg/spongycastle/asn1/x509/GeneralName;

    .prologue
    .line 1720
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/DERIA5String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERIA5String;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERIA5String;->getString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private hashCollection(Ljava/util/Collection;)I
    .registers 6
    .param p1, "coll"    # Ljava/util/Collection;

    .prologue
    .line 1803
    if-nez p1, :cond_4

    .line 1805
    const/4 v0, 0x0

    .line 1821
    :cond_3
    return v0

    .line 1807
    :cond_4
    const/4 v0, 0x0

    .line 1808
    .local v0, "hash":I
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1809
    .local v1, "it1":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1811
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1812
    .local v2, "o":Ljava/lang/Object;
    instance-of v3, v2, [B

    if-eqz v3, :cond_21

    .line 1814
    check-cast v2, [B

    .end local v2    # "o":Ljava/lang/Object;
    check-cast v2, [B

    invoke-static {v2}, Lorg/spongycastle/util/Arrays;->hashCode([B)I

    move-result v3

    add-int/2addr v0, v3

    goto :goto_9

    .line 1818
    .restart local v2    # "o":Ljava/lang/Object;
    :cond_21
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v0, v3

    goto :goto_9
.end method

.method private intersectDN(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;
    .registers 9
    .param p1, "permitted"    # Ljava/util/Set;
    .param p2, "dns"    # Ljava/util/Set;

    .prologue
    .line 404
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 405
    .local v2, "intersect":Ljava/util/Set;
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_51

    .line 408
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/x509/GeneralSubtree;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/GeneralSubtree;->getBase()Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    invoke-interface {v5}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v5

    .line 407
    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    .line 409
    .local v1, "dn":Lorg/spongycastle/asn1/ASN1Sequence;
    if-nez p1, :cond_2d

    .line 411
    if-eqz v1, :cond_9

    .line 413
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 418
    :cond_2d
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 419
    .local v0, "_iter":Ljava/util/Iterator;
    :cond_31
    :goto_31
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 421
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 423
    .local v4, "subtree":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-static {v1, v4}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDNSubtree(Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/ASN1Sequence;)Z

    move-result v5

    if-eqz v5, :cond_47

    .line 425
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_31

    .line 427
    :cond_47
    invoke-static {v4, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDNSubtree(Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/ASN1Sequence;)Z

    move-result v5

    if-eqz v5, :cond_31

    .line 429
    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_31

    .line 434
    .end local v0    # "_iter":Ljava/util/Iterator;
    .end local v1    # "dn":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v4    # "subtree":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_51
    return-object v2
.end method

.method private intersectDNS(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;
    .registers 9
    .param p1, "permitted"    # Ljava/util/Set;
    .param p2, "dnss"    # Ljava/util/Set;

    .prologue
    .line 1299
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 1300
    .local v3, "intersect":Ljava/util/Set;
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "it":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_49

    .line 1302
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/x509/GeneralSubtree;

    .line 1303
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/GeneralSubtree;->getBase()Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v5

    .line 1302
    invoke-direct {p0, v5}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->extractNameAsString(Lorg/spongycastle/asn1/x509/GeneralName;)Ljava/lang/String;

    move-result-object v2

    .line 1304
    .local v2, "dns":Ljava/lang/String;
    if-nez p1, :cond_25

    .line 1306
    if-eqz v2, :cond_9

    .line 1308
    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 1313
    :cond_25
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1314
    .local v0, "_iter":Ljava/util/Iterator;
    :cond_29
    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 1316
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1318
    .local v1, "_permitted":Ljava/lang/String;
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3f

    .line 1320
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_29

    .line 1322
    :cond_3f
    invoke-direct {p0, v2, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_29

    .line 1324
    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_29

    .line 1330
    .end local v0    # "_iter":Ljava/util/Iterator;
    .end local v1    # "_permitted":Ljava/lang/String;
    .end local v2    # "dns":Ljava/lang/String;
    :cond_49
    return-object v3
.end method

.method private intersectEmail(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;
    .registers 9
    .param p1, "permitted"    # Ljava/util/Set;
    .param p2, "emails"    # Ljava/util/Set;

    .prologue
    .line 479
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 480
    .local v2, "intersect":Ljava/util/Set;
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_39

    .line 482
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/x509/GeneralSubtree;

    .line 483
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/GeneralSubtree;->getBase()Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v5

    .line 482
    invoke-direct {p0, v5}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->extractNameAsString(Lorg/spongycastle/asn1/x509/GeneralName;)Ljava/lang/String;

    move-result-object v1

    .line 485
    .local v1, "email":Ljava/lang/String;
    if-nez p1, :cond_25

    .line 487
    if-eqz v1, :cond_9

    .line 489
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 494
    :cond_25
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 495
    .local v4, "it2":Ljava/util/Iterator;
    :goto_29
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 497
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 499
    .local v0, "_permitted":Ljava/lang/String;
    invoke-direct {p0, v1, v0, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->intersectEmail(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V

    goto :goto_29

    .line 503
    .end local v0    # "_permitted":Ljava/lang/String;
    .end local v1    # "email":Ljava/lang/String;
    .end local v4    # "it2":Ljava/util/Iterator;
    :cond_39
    return-object v2
.end method

.method private intersectEmail(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V
    .registers 8
    .param p1, "email1"    # Ljava/lang/String;
    .param p2, "email2"    # Ljava/lang/String;
    .param p3, "intersect"    # Ljava/util/Set;

    .prologue
    const/4 v3, -0x1

    const/16 v2, 0x40

    .line 1384
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_3f

    .line 1386
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1388
    .local v0, "_sub":Ljava/lang/String;
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_23

    .line 1390
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1392
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1472
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_22
    :goto_22
    return-void

    .line 1396
    .restart local v0    # "_sub":Ljava/lang/String;
    :cond_23
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 1398
    invoke-direct {p0, v0, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1400
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1406
    :cond_35
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1408
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1413
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_3f
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8d

    .line 1415
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_61

    .line 1417
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1418
    .restart local v0    # "_sub":Ljava/lang/String;
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1420
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1424
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_61
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_83

    .line 1426
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_75

    .line 1427
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_79

    .line 1429
    :cond_75
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1431
    :cond_79
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1433
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1438
    :cond_83
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1440
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1447
    :cond_8d
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_a8

    .line 1449
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1450
    .restart local v0    # "_sub":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1452
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1456
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_a8
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_bb

    .line 1458
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1460
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1466
    :cond_bb
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1468
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22
.end method

.method private intersectIP(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;
    .registers 9
    .param p1, "permitted"    # Ljava/util/Set;
    .param p2, "ips"    # Ljava/util/Set;

    .prologue
    .line 545
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 546
    .local v1, "intersect":Ljava/util/Set;
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_48

    .line 549
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/x509/GeneralSubtree;

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/GeneralSubtree;->getBase()Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v5

    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    .line 548
    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v5

    .line 549
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    .line 550
    .local v2, "ip":[B
    if-nez p1, :cond_2d

    .line 552
    if-eqz v2, :cond_9

    .line 554
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 559
    :cond_2d
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 560
    .local v4, "it2":Ljava/util/Iterator;
    :goto_31
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 562
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    move-object v0, v5

    check-cast v0, [B

    .line 563
    .local v0, "_permitted":[B
    invoke-direct {p0, v0, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->intersectIPRange([B[B)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_31

    .line 567
    .end local v0    # "_permitted":[B
    .end local v2    # "ip":[B
    .end local v4    # "it2":Ljava/util/Iterator;
    :cond_48
    return-object v1
.end method

.method private intersectIPRange([B[B)Ljava/util/Set;
    .registers 15
    .param p1, "ipWithSubmask1"    # [B
    .param p2, "ipWithSubmask2"    # [B

    .prologue
    .line 641
    array-length v10, p1

    array-length v11, p2

    if-eq v10, v11, :cond_7

    .line 643
    sget-object v10, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 665
    :goto_6
    return-object v10

    .line 645
    :cond_7
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->extractIPsAndSubnetMasks([B[B)[[B

    move-result-object v9

    .line 646
    .local v9, "temp":[[B
    const/4 v10, 0x0

    aget-object v1, v9, v10

    .line 647
    .local v1, "ip1":[B
    const/4 v10, 0x1

    aget-object v7, v9, v10

    .line 648
    .local v7, "subnetmask1":[B
    const/4 v10, 0x2

    aget-object v2, v9, v10

    .line 649
    .local v2, "ip2":[B
    const/4 v10, 0x3

    aget-object v8, v9, v10

    .line 651
    .local v8, "subnetmask2":[B
    invoke-direct {p0, v1, v7, v2, v8}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->minMaxIPs([B[B[B[B)[[B

    move-result-object v5

    .line 654
    .local v5, "minMax":[[B
    const/4 v10, 0x1

    aget-object v10, v5, v10

    const/4 v11, 0x3

    aget-object v11, v5, v11

    invoke-static {v10, v11}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->min([B[B)[B

    move-result-object v3

    .line 655
    .local v3, "max":[B
    const/4 v10, 0x0

    aget-object v10, v5, v10

    const/4 v11, 0x2

    aget-object v11, v5, v11

    invoke-static {v10, v11}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->max([B[B)[B

    move-result-object v4

    .line 658
    .local v4, "min":[B
    invoke-static {v4, v3}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->compareTo([B[B)I

    move-result v10

    const/4 v11, 0x1

    if-ne v10, v11, :cond_39

    .line 660
    sget-object v10, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    goto :goto_6

    .line 663
    :cond_39
    const/4 v10, 0x0

    aget-object v10, v5, v10

    const/4 v11, 0x2

    aget-object v11, v5, v11

    invoke-static {v10, v11}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->or([B[B)[B

    move-result-object v0

    .line 664
    .local v0, "ip":[B
    invoke-static {v7, v8}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->or([B[B)[B

    move-result-object v6

    .line 665
    .local v6, "subnetmask":[B
    invoke-direct {p0, v0, v6}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->ipWithSubnetMask([B[B)[B

    move-result-object v10

    invoke-static {v10}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v10

    goto :goto_6
.end method

.method private intersectURI(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;
    .registers 9
    .param p1, "permitted"    # Ljava/util/Set;
    .param p2, "uris"    # Ljava/util/Set;

    .prologue
    .line 1498
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 1499
    .local v2, "intersect":Ljava/util/Set;
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_39

    .line 1501
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/spongycastle/asn1/x509/GeneralSubtree;

    .line 1502
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x509/GeneralSubtree;->getBase()Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v5

    .line 1501
    invoke-direct {p0, v5}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->extractNameAsString(Lorg/spongycastle/asn1/x509/GeneralName;)Ljava/lang/String;

    move-result-object v4

    .line 1503
    .local v4, "uri":Ljava/lang/String;
    if-nez p1, :cond_25

    .line 1505
    if-eqz v4, :cond_9

    .line 1507
    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 1512
    :cond_25
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1513
    .local v0, "_iter":Ljava/util/Iterator;
    :goto_29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 1515
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1516
    .local v1, "_permitted":Ljava/lang/String;
    invoke-direct {p0, v1, v4, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->intersectURI(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V

    goto :goto_29

    .line 1520
    .end local v0    # "_iter":Ljava/util/Iterator;
    .end local v1    # "_permitted":Ljava/lang/String;
    .end local v4    # "uri":Ljava/lang/String;
    :cond_39
    return-object v2
.end method

.method private intersectURI(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V
    .registers 8
    .param p1, "email1"    # Ljava/lang/String;
    .param p2, "email2"    # Ljava/lang/String;
    .param p3, "intersect"    # Ljava/util/Set;

    .prologue
    const/4 v3, -0x1

    const/16 v2, 0x40

    .line 1554
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_3f

    .line 1556
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1558
    .local v0, "_sub":Ljava/lang/String;
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_23

    .line 1560
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1562
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1642
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_22
    :goto_22
    return-void

    .line 1566
    .restart local v0    # "_sub":Ljava/lang/String;
    :cond_23
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 1568
    invoke-direct {p0, v0, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1570
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1576
    :cond_35
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1578
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1583
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_3f
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8d

    .line 1585
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_61

    .line 1587
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1588
    .restart local v0    # "_sub":Ljava/lang/String;
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1590
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1594
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_61
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_83

    .line 1596
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_75

    .line 1597
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_79

    .line 1599
    :cond_75
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1601
    :cond_79
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1603
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1608
    :cond_83
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1610
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1617
    :cond_8d
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_a8

    .line 1619
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1620
    .restart local v0    # "_sub":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1622
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1626
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_a8
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_bb

    .line 1628
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1630
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1636
    :cond_bb
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 1638
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22
.end method

.method private ipWithSubnetMask([B[B)[B
    .registers 7
    .param p1, "ip"    # [B
    .param p2, "subnetMask"    # [B

    .prologue
    const/4 v3, 0x0

    .line 677
    array-length v0, p1

    .line 678
    .local v0, "ipLength":I
    mul-int/lit8 v2, v0, 0x2

    new-array v1, v2, [B

    .line 679
    .local v1, "temp":[B
    invoke-static {p1, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 680
    invoke-static {p2, v3, v1, v0, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 681
    return-object v1
.end method

.method private isIPConstrained([B[B)Z
    .registers 10
    .param p1, "ip"    # [B
    .param p2, "constraint"    # [B

    .prologue
    const/4 v5, 0x0

    .line 878
    array-length v1, p1

    .line 880
    .local v1, "ipLength":I
    array-length v6, p2

    div-int/lit8 v6, v6, 0x2

    if-eq v1, v6, :cond_8

    .line 899
    :goto_7
    return v5

    .line 885
    :cond_8
    new-array v4, v1, [B

    .line 886
    .local v4, "subnetMask":[B
    invoke-static {p2, v1, v4, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 888
    new-array v3, v1, [B

    .line 890
    .local v3, "permittedSubnetAddress":[B
    new-array v2, v1, [B

    .line 893
    .local v2, "ipSubnetAddress":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    if-ge v0, v1, :cond_27

    .line 895
    aget-byte v5, p2, v0

    aget-byte v6, v4, v0

    and-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v3, v0

    .line 896
    aget-byte v5, p1, v0

    aget-byte v6, v4, v0

    and-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v2, v0

    .line 893
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 899
    :cond_27
    invoke-static {v3, v2}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v5

    goto :goto_7
.end method

.method private isUriConstrained(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "constraint"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 1673
    invoke-static {p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->extractHostFromURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1675
    .local v0, "host":Ljava/lang/String;
    const-string v2, "."

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_14

    .line 1677
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 1689
    :cond_13
    :goto_13
    return v1

    .line 1684
    :cond_14
    invoke-direct {p0, v0, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_13

    .line 1689
    :cond_1a
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private static max([B[B)[B
    .registers 6
    .param p0, "ip1"    # [B
    .param p1, "ip2"    # [B

    .prologue
    const v3, 0xffff

    .line 1732
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v1, p0

    if-ge v0, v1, :cond_13

    .line 1734
    aget-byte v1, p0, v0

    and-int/2addr v1, v3

    aget-byte v2, p1, v0

    and-int/2addr v2, v3

    if-le v1, v2, :cond_10

    .line 1739
    .end local p0    # "ip1":[B
    :goto_f
    return-object p0

    .line 1732
    .restart local p0    # "ip1":[B
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_13
    move-object p0, p1

    .line 1739
    goto :goto_f
.end method

.method private static min([B[B)[B
    .registers 6
    .param p0, "ip1"    # [B
    .param p1, "ip2"    # [B

    .prologue
    const v3, 0xffff

    .line 1751
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v1, p0

    if-ge v0, v1, :cond_13

    .line 1753
    aget-byte v1, p0, v0

    and-int/2addr v1, v3

    aget-byte v2, p1, v0

    and-int/2addr v2, v3

    if-ge v1, v2, :cond_10

    .line 1758
    .end local p0    # "ip1":[B
    :goto_f
    return-object p0

    .line 1751
    .restart local p0    # "ip1":[B
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_13
    move-object p0, p1

    .line 1758
    goto :goto_f
.end method

.method private minMaxIPs([B[B[B[B)[[B
    .registers 13
    .param p1, "ip1"    # [B
    .param p2, "subnetmask1"    # [B
    .param p3, "ip2"    # [B
    .param p4, "subnetmask2"    # [B

    .prologue
    .line 729
    array-length v1, p1

    .line 730
    .local v1, "ipLength":I
    new-array v4, v1, [B

    .line 731
    .local v4, "min1":[B
    new-array v2, v1, [B

    .line 733
    .local v2, "max1":[B
    new-array v5, v1, [B

    .line 734
    .local v5, "min2":[B
    new-array v3, v1, [B

    .line 736
    .local v3, "max2":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_39

    .line 738
    aget-byte v6, p1, v0

    aget-byte v7, p2, v0

    and-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, v4, v0

    .line 739
    aget-byte v6, p1, v0

    aget-byte v7, p2, v0

    and-int/2addr v6, v7

    aget-byte v7, p2, v0

    xor-int/lit8 v7, v7, -0x1

    or-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, v2, v0

    .line 741
    aget-byte v6, p3, v0

    aget-byte v7, p4, v0

    and-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, v5, v0

    .line 742
    aget-byte v6, p3, v0

    aget-byte v7, p4, v0

    and-int/2addr v6, v7

    aget-byte v7, p4, v0

    xor-int/lit8 v7, v7, -0x1

    or-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, v3, v0

    .line 736
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 745
    :cond_39
    const/4 v6, 0x4

    new-array v6, v6, [[B

    const/4 v7, 0x0

    aput-object v4, v6, v7

    const/4 v7, 0x1

    aput-object v2, v6, v7

    const/4 v7, 0x2

    aput-object v5, v6, v7

    const/4 v7, 0x3

    aput-object v3, v6, v7

    return-object v6
.end method

.method private static or([B[B)[B
    .registers 6
    .param p0, "ip1"    # [B
    .param p1, "ip2"    # [B

    .prologue
    .line 1793
    array-length v2, p0

    new-array v1, v2, [B

    .line 1794
    .local v1, "temp":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p0

    if-ge v0, v2, :cond_12

    .line 1796
    aget-byte v2, p0, v0

    aget-byte v3, p1, v0

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 1794
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 1798
    :cond_12
    return-object v1
.end method

.method private stringifyIP([B)Ljava/lang/String;
    .registers 7
    .param p1, "ip"    # [B

    .prologue
    const/4 v4, 0x0

    .line 1890
    const-string v1, ""

    .line 1891
    .local v1, "temp":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p1

    div-int/lit8 v2, v2, 0x2

    if-ge v0, v2, :cond_2b

    .line 1893
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-byte v3, p1, v0

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1891
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 1895
    :cond_2b
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1896
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1897
    array-length v2, p1

    div-int/lit8 v0, v2, 0x2

    :goto_4b
    array-length v2, p1

    if-ge v0, v2, :cond_70

    .line 1899
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-byte v3, p1, v0

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1897
    add-int/lit8 v0, v0, 0x1

    goto :goto_4b

    .line 1901
    :cond_70
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1902
    return-object v1
.end method

.method private stringifyIPCollection(Ljava/util/Set;)Ljava/lang/String;
    .registers 6
    .param p1, "ips"    # Ljava/util/Set;

    .prologue
    .line 1907
    const-string v1, ""

    .line 1908
    .local v1, "temp":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1909
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_43

    .line 1911
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    check-cast v2, [B

    invoke-direct {p0, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->stringifyIP([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_19

    .line 1913
    :cond_43
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_55

    .line 1915
    const/4 v2, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1917
    :cond_55
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1918
    return-object v1
.end method

.method private unionDN(Ljava/util/Set;Lorg/spongycastle/asn1/ASN1Sequence;)Ljava/util/Set;
    .registers 7
    .param p1, "excluded"    # Ljava/util/Set;
    .param p2, "dn"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    .line 439
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 441
    if-nez p2, :cond_9

    .line 473
    .end local p1    # "excluded":Ljava/util/Set;
    :goto_8
    return-object p1

    .line 445
    .restart local p1    # "excluded":Ljava/util/Set;
    :cond_9
    invoke-interface {p1, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 451
    :cond_d
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 453
    .local v0, "intersect":Ljava/util/Set;
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 454
    .local v1, "it":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3d

    .line 456
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 458
    .local v2, "subtree":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-static {p2, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDNSubtree(Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/ASN1Sequence;)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 460
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 462
    :cond_2c
    invoke-static {v2, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDNSubtree(Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/ASN1Sequence;)Z

    move-result v3

    if-eqz v3, :cond_36

    .line 464
    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 468
    :cond_36
    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 469
    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .end local v2    # "subtree":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_3d
    move-object p1, v0

    .line 473
    goto :goto_8
.end method

.method private unionDNS(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;
    .registers 7
    .param p1, "excluded"    # Ljava/util/Set;
    .param p2, "dns"    # Ljava/lang/String;

    .prologue
    .line 1335
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 1337
    if-nez p2, :cond_9

    .line 1369
    .end local p1    # "excluded":Ljava/util/Set;
    :goto_8
    return-object p1

    .line 1341
    .restart local p1    # "excluded":Ljava/util/Set;
    :cond_9
    invoke-interface {p1, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 1347
    :cond_d
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 1349
    .local v2, "union":Ljava/util/Set;
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1350
    .local v0, "_iter":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3d

    .line 1352
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1354
    .local v1, "_permitted":Ljava/lang/String;
    invoke-direct {p0, v1, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 1356
    invoke-interface {v2, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 1358
    :cond_2c
    invoke-direct {p0, p2, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_36

    .line 1360
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 1364
    :cond_36
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1365
    invoke-interface {v2, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .end local v1    # "_permitted":Ljava/lang/String;
    :cond_3d
    move-object p1, v2

    .line 1369
    goto :goto_8
.end method

.method private unionEmail(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;
    .registers 7
    .param p1, "excluded"    # Ljava/util/Set;
    .param p2, "email"    # Ljava/lang/String;

    .prologue
    .line 508
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 510
    if-nez p2, :cond_9

    .line 529
    .end local p1    # "excluded":Ljava/util/Set;
    :goto_8
    return-object p1

    .line 514
    .restart local p1    # "excluded":Ljava/util/Set;
    :cond_9
    invoke-interface {p1, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 519
    :cond_d
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 521
    .local v2, "union":Ljava/util/Set;
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 522
    .local v1, "it":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    .line 524
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 526
    .local v0, "_excluded":Ljava/lang/String;
    invoke-direct {p0, v0, p2, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->unionEmail(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V

    goto :goto_16

    .end local v0    # "_excluded":Ljava/lang/String;
    :cond_26
    move-object p1, v2

    .line 529
    goto :goto_8
.end method

.method private unionEmail(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V
    .registers 8
    .param p1, "email1"    # Ljava/lang/String;
    .param p2, "email2"    # Ljava/lang/String;
    .param p3, "union"    # Ljava/util/Set;

    .prologue
    const/4 v3, -0x1

    const/16 v2, 0x40

    .line 1024
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_54

    .line 1026
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1028
    .local v0, "_sub":Ljava/lang/String;
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_2a

    .line 1030
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 1032
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1157
    .end local v0    # "_sub":Ljava/lang/String;
    :goto_22
    return-void

    .line 1036
    .restart local v0    # "_sub":Ljava/lang/String;
    :cond_23
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1037
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1041
    :cond_2a
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_43

    .line 1043
    invoke-direct {p0, v0, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 1045
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1049
    :cond_3c
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1050
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1056
    :cond_43
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4d

    .line 1058
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1062
    :cond_4d
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1063
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1068
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_54
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ba

    .line 1070
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_7d

    .line 1072
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1073
    .restart local v0    # "_sub":Ljava/lang/String;
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_76

    .line 1075
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1079
    :cond_76
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1080
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1084
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_7d
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a7

    .line 1086
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_91

    .line 1087
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_95

    .line 1089
    :cond_91
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1091
    :cond_95
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9f

    .line 1093
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1097
    :cond_9f
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1098
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1103
    :cond_a7
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b2

    .line 1105
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1109
    :cond_b2
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1110
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1117
    :cond_ba
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_dd

    .line 1119
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1120
    .restart local v0    # "_sub":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d5

    .line 1122
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1126
    :cond_d5
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1127
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1131
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_dd
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f8

    .line 1133
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f0

    .line 1135
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1139
    :cond_f0
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1140
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1146
    :cond_f8
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_103

    .line 1148
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1152
    :cond_103
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1153
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22
.end method

.method private unionIP(Ljava/util/Set;[B)Ljava/util/Set;
    .registers 7
    .param p1, "excluded"    # Ljava/util/Set;
    .param p2, "ip"    # [B

    .prologue
    .line 582
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 584
    if-nez p2, :cond_9

    .line 603
    .end local p1    # "excluded":Ljava/util/Set;
    :goto_8
    return-object p1

    .line 588
    .restart local p1    # "excluded":Ljava/util/Set;
    :cond_9
    invoke-interface {p1, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 594
    :cond_d
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 596
    .local v2, "union":Ljava/util/Set;
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 597
    .local v1, "it":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 599
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    move-object v0, v3

    check-cast v0, [B

    .line 600
    .local v0, "_excluded":[B
    invoke-direct {p0, v0, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->unionIPRange([B[B)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_16

    .end local v0    # "_excluded":[B
    :cond_2d
    move-object p1, v2

    .line 603
    goto :goto_8
.end method

.method private unionIPRange([B[B)Ljava/util/Set;
    .registers 5
    .param p1, "ipWithSubmask1"    # [B
    .param p2, "ipWithSubmask2"    # [B

    .prologue
    .line 616
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 619
    .local v0, "set":Ljava/util/Set;
    invoke-static {p1, p2}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 621
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 628
    :goto_e
    return-object v0

    .line 625
    :cond_f
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 626
    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_e
.end method

.method private unionURI(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;
    .registers 7
    .param p1, "excluded"    # Ljava/util/Set;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 1525
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 1527
    if-nez p2, :cond_9

    .line 1547
    .end local p1    # "excluded":Ljava/util/Set;
    :goto_8
    return-object p1

    .line 1531
    .restart local p1    # "excluded":Ljava/util/Set;
    :cond_9
    invoke-interface {p1, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 1537
    :cond_d
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 1539
    .local v2, "union":Ljava/util/Set;
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1540
    .local v1, "_iter":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    .line 1542
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1544
    .local v0, "_excluded":Ljava/lang/String;
    invoke-direct {p0, v0, p2, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->unionURI(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V

    goto :goto_16

    .end local v0    # "_excluded":Ljava/lang/String;
    :cond_26
    move-object p1, v2

    .line 1547
    goto :goto_8
.end method

.method private unionURI(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V
    .registers 8
    .param p1, "email1"    # Ljava/lang/String;
    .param p2, "email2"    # Ljava/lang/String;
    .param p3, "union"    # Ljava/util/Set;

    .prologue
    const/4 v3, -0x1

    const/16 v2, 0x40

    .line 1162
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_54

    .line 1164
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1166
    .local v0, "_sub":Ljava/lang/String;
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_2a

    .line 1168
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 1170
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1295
    .end local v0    # "_sub":Ljava/lang/String;
    :goto_22
    return-void

    .line 1174
    .restart local v0    # "_sub":Ljava/lang/String;
    :cond_23
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1175
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1179
    :cond_2a
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_43

    .line 1181
    invoke-direct {p0, v0, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 1183
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1187
    :cond_3c
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1188
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1194
    :cond_43
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4d

    .line 1196
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1200
    :cond_4d
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1201
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1206
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_54
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ba

    .line 1208
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_7d

    .line 1210
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1211
    .restart local v0    # "_sub":Ljava/lang/String;
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_76

    .line 1213
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1217
    :cond_76
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1218
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1222
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_7d
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a7

    .line 1224
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_91

    .line 1225
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_95

    .line 1227
    :cond_91
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1229
    :cond_95
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9f

    .line 1231
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 1235
    :cond_9f
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1236
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1241
    :cond_a7
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b2

    .line 1243
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1247
    :cond_b2
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1248
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1255
    :cond_ba
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-eq v1, v3, :cond_dd

    .line 1257
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1258
    .restart local v0    # "_sub":Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d5

    .line 1260
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1264
    :cond_d5
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1265
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1269
    .end local v0    # "_sub":Ljava/lang/String;
    :cond_dd
    const-string v1, "."

    invoke-virtual {p2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f8

    .line 1271
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->withinDomain(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f0

    .line 1273
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1277
    :cond_f0
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1278
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1284
    :cond_f8
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_103

    .line 1286
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22

    .line 1290
    :cond_103
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1291
    invoke-interface {p3, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22
.end method

.method private static withinDNSubtree(Lorg/spongycastle/asn1/ASN1Sequence;Lorg/spongycastle/asn1/ASN1Sequence;)Z
    .registers 7
    .param p0, "dns"    # Lorg/spongycastle/asn1/ASN1Sequence;
    .param p1, "subtree"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 331
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v3

    if-ge v3, v2, :cond_9

    .line 349
    :cond_8
    :goto_8
    return v1

    .line 336
    :cond_9
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v3

    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    if-gt v3, v4, :cond_8

    .line 341
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "j":I
    :goto_19
    if-ltz v0, :cond_2c

    .line 343
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-virtual {p0, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 341
    add-int/lit8 v0, v0, -0x1

    goto :goto_19

    :cond_2c
    move v1, v2

    .line 349
    goto :goto_8
.end method

.method private withinDomain(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 12
    .param p1, "testDomain"    # Ljava/lang/String;
    .param p2, "domain"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x2e

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 931
    move-object v3, p2

    .line 932
    .local v3, "tempDomain":Ljava/lang/String;
    const-string v7, "."

    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 934
    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 936
    :cond_11
    invoke-static {v3, v8}, Lorg/spongycastle/util/Strings;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v1

    .line 937
    .local v1, "domainParts":[Ljava/lang/String;
    invoke-static {p1, v8}, Lorg/spongycastle/util/Strings;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v4

    .line 939
    .local v4, "testDomainParts":[Ljava/lang/String;
    array-length v7, v4

    array-length v8, v1

    if-gt v7, v8, :cond_1e

    .line 958
    :cond_1d
    :goto_1d
    return v5

    .line 943
    :cond_1e
    array-length v7, v4

    array-length v8, v1

    sub-int v0, v7, v8

    .line 944
    .local v0, "d":I
    const/4 v2, -0x1

    .local v2, "i":I
    :goto_23
    array-length v7, v1

    if-ge v2, v7, :cond_45

    .line 946
    const/4 v7, -0x1

    if-ne v2, v7, :cond_38

    .line 948
    add-int v7, v2, v0

    aget-object v7, v4, v7

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1d

    .line 944
    :cond_35
    add-int/lit8 v2, v2, 0x1

    goto :goto_23

    .line 953
    :cond_38
    aget-object v7, v1, v2

    add-int v8, v2, v0

    aget-object v8, v4, v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_35

    goto :goto_1d

    :cond_45
    move v5, v6

    .line 958
    goto :goto_1d
.end method


# virtual methods
.method public addExcludedSubtree(Lorg/spongycastle/asn1/x509/GeneralSubtree;)V
    .registers 5
    .param p1, "subtree"    # Lorg/spongycastle/asn1/x509/GeneralSubtree;

    .prologue
    .line 197
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralSubtree;->getBase()Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v0

    .line 199
    .local v0, "base":Lorg/spongycastle/asn1/x509/GeneralName;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v1

    packed-switch v1, :pswitch_data_5c

    .line 222
    :goto_b
    :pswitch_b
    return-void

    .line 202
    :pswitch_c
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesEmail:Ljava/util/Set;

    .line 203
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->extractNameAsString(Lorg/spongycastle/asn1/x509/GeneralName;)Ljava/lang/String;

    move-result-object v2

    .line 202
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->unionEmail(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesEmail:Ljava/util/Set;

    goto :goto_b

    .line 206
    :pswitch_19
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDNS:Ljava/util/Set;

    .line 207
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->extractNameAsString(Lorg/spongycastle/asn1/x509/GeneralName;)Ljava/lang/String;

    move-result-object v2

    .line 206
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->unionDNS(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDNS:Ljava/util/Set;

    goto :goto_b

    .line 210
    :pswitch_26
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDN:Ljava/util/Set;

    .line 211
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-interface {v1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 210
    invoke-direct {p0, v2, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->unionDN(Ljava/util/Set;Lorg/spongycastle/asn1/ASN1Sequence;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDN:Ljava/util/Set;

    goto :goto_b

    .line 214
    :pswitch_39
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesURI:Ljava/util/Set;

    .line 215
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->extractNameAsString(Lorg/spongycastle/asn1/x509/GeneralName;)Ljava/lang/String;

    move-result-object v2

    .line 214
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->unionURI(Ljava/util/Set;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesURI:Ljava/util/Set;

    goto :goto_b

    .line 218
    :pswitch_46
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesIP:Ljava/util/Set;

    .line 219
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v2

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v2

    .line 218
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->unionIP(Ljava/util/Set;[B)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesIP:Ljava/util/Set;

    goto :goto_b

    .line 199
    nop

    :pswitch_data_5c
    .packed-switch 0x1
        :pswitch_c
        :pswitch_19
        :pswitch_b
        :pswitch_26
        :pswitch_b
        :pswitch_39
        :pswitch_46
    .end packed-switch
.end method

.method public checkExcluded(Lorg/spongycastle/asn1/x509/GeneralName;)V
    .registers 5
    .param p1, "name"    # Lorg/spongycastle/asn1/x509/GeneralName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v1

    packed-switch v1, :pswitch_data_54

    .line 110
    :goto_7
    :pswitch_7
    return-void

    .line 92
    :pswitch_8
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesEmail:Ljava/util/Set;

    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->extractNameAsString(Lorg/spongycastle/asn1/x509/GeneralName;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkExcludedEmail(Ljava/util/Set;Ljava/lang/String;)V

    goto :goto_7

    .line 95
    :pswitch_12
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDNS:Ljava/util/Set;

    .line 96
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    .line 95
    invoke-static {v2}, Lorg/spongycastle/asn1/DERIA5String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERIA5String;

    move-result-object v2

    .line 96
    invoke-virtual {v2}, Lorg/spongycastle/asn1/DERIA5String;->getString()Ljava/lang/String;

    move-result-object v2

    .line 95
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkExcludedDNS(Ljava/util/Set;Ljava/lang/String;)V

    goto :goto_7

    .line 99
    :pswitch_24
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkExcludedDN(Lorg/spongycastle/asn1/x500/X500Name;)V

    goto :goto_7

    .line 102
    :pswitch_30
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesURI:Ljava/util/Set;

    .line 103
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    .line 102
    invoke-static {v2}, Lorg/spongycastle/asn1/DERIA5String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERIA5String;

    move-result-object v2

    .line 103
    invoke-virtual {v2}, Lorg/spongycastle/asn1/DERIA5String;->getString()Ljava/lang/String;

    move-result-object v2

    .line 102
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkExcludedURI(Ljava/util/Set;Ljava/lang/String;)V

    goto :goto_7

    .line 106
    :pswitch_42
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v0

    .line 108
    .local v0, "ip":[B
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesIP:Ljava/util/Set;

    invoke-direct {p0, v1, v0}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkExcludedIP(Ljava/util/Set;[B)V

    goto :goto_7

    .line 89
    :pswitch_data_54
    .packed-switch 0x1
        :pswitch_8
        :pswitch_12
        :pswitch_7
        :pswitch_24
        :pswitch_7
        :pswitch_30
        :pswitch_42
    .end packed-switch
.end method

.method public checkPermitted(Lorg/spongycastle/asn1/x509/GeneralName;)V
    .registers 5
    .param p1, "name"    # Lorg/spongycastle/asn1/x509/GeneralName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/asn1/x509/NameConstraintValidatorException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v1

    packed-switch v1, :pswitch_data_54

    .line 77
    :goto_7
    :pswitch_7
    return-void

    .line 58
    :pswitch_8
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesEmail:Ljava/util/Set;

    .line 59
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->extractNameAsString(Lorg/spongycastle/asn1/x509/GeneralName;)Ljava/lang/String;

    move-result-object v2

    .line 58
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkPermittedEmail(Ljava/util/Set;Ljava/lang/String;)V

    goto :goto_7

    .line 62
    :pswitch_12
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDNS:Ljava/util/Set;

    .line 63
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    .line 62
    invoke-static {v2}, Lorg/spongycastle/asn1/DERIA5String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERIA5String;

    move-result-object v2

    .line 63
    invoke-virtual {v2}, Lorg/spongycastle/asn1/DERIA5String;->getString()Ljava/lang/String;

    move-result-object v2

    .line 62
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkPermittedDNS(Ljava/util/Set;Ljava/lang/String;)V

    goto :goto_7

    .line 66
    :pswitch_24
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/x500/X500Name;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x500/X500Name;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkPermittedDN(Lorg/spongycastle/asn1/x500/X500Name;)V

    goto :goto_7

    .line 69
    :pswitch_30
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesURI:Ljava/util/Set;

    .line 70
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    .line 69
    invoke-static {v2}, Lorg/spongycastle/asn1/DERIA5String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERIA5String;

    move-result-object v2

    .line 70
    invoke-virtual {v2}, Lorg/spongycastle/asn1/DERIA5String;->getString()Ljava/lang/String;

    move-result-object v2

    .line 69
    invoke-direct {p0, v1, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkPermittedURI(Ljava/util/Set;Ljava/lang/String;)V

    goto :goto_7

    .line 73
    :pswitch_42
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/GeneralName;->getName()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v0

    .line 75
    .local v0, "ip":[B
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesIP:Ljava/util/Set;

    invoke-direct {p0, v1, v0}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->checkPermittedIP(Ljava/util/Set;[B)V

    goto :goto_7

    .line 55
    :pswitch_data_54
    .packed-switch 0x1
        :pswitch_8
        :pswitch_12
        :pswitch_7
        :pswitch_24
        :pswitch_7
        :pswitch_30
        :pswitch_42
    .end packed-switch
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 240
    instance-of v2, p1, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;

    if-nez v2, :cond_6

    .line 254
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 244
    check-cast v0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;

    .line 245
    .local v0, "constraintValidator":Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;
    iget-object v2, v0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDN:Ljava/util/Set;

    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDN:Ljava/util/Set;

    invoke-direct {p0, v2, v3}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->collectionsAreEqual(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, v0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDNS:Ljava/util/Set;

    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDNS:Ljava/util/Set;

    .line 246
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->collectionsAreEqual(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, v0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesEmail:Ljava/util/Set;

    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesEmail:Ljava/util/Set;

    .line 247
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->collectionsAreEqual(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, v0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesIP:Ljava/util/Set;

    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesIP:Ljava/util/Set;

    .line 248
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->collectionsAreEqual(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, v0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesURI:Ljava/util/Set;

    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesURI:Ljava/util/Set;

    .line 249
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->collectionsAreEqual(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, v0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDN:Ljava/util/Set;

    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDN:Ljava/util/Set;

    .line 250
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->collectionsAreEqual(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, v0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDNS:Ljava/util/Set;

    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDNS:Ljava/util/Set;

    .line 251
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->collectionsAreEqual(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, v0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesEmail:Ljava/util/Set;

    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesEmail:Ljava/util/Set;

    .line 252
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->collectionsAreEqual(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, v0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesIP:Ljava/util/Set;

    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesIP:Ljava/util/Set;

    .line 253
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->collectionsAreEqual(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, v0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesURI:Ljava/util/Set;

    iget-object v3, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesURI:Ljava/util/Set;

    .line 254
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->collectionsAreEqual(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 226
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDN:Ljava/util/Set;

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->hashCollection(Ljava/util/Collection;)I

    move-result v0

    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDNS:Ljava/util/Set;

    .line 227
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->hashCollection(Ljava/util/Collection;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesEmail:Ljava/util/Set;

    .line 228
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->hashCollection(Ljava/util/Collection;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesIP:Ljava/util/Set;

    .line 229
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->hashCollection(Ljava/util/Collection;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesURI:Ljava/util/Set;

    .line 230
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->hashCollection(Ljava/util/Collection;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDN:Ljava/util/Set;

    .line 231
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->hashCollection(Ljava/util/Collection;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDNS:Ljava/util/Set;

    .line 232
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->hashCollection(Ljava/util/Collection;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesEmail:Ljava/util/Set;

    .line 233
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->hashCollection(Ljava/util/Collection;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesIP:Ljava/util/Set;

    .line 234
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->hashCollection(Ljava/util/Collection;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesURI:Ljava/util/Set;

    .line 235
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->hashCollection(Ljava/util/Collection;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public intersectEmptyPermittedSubtree(I)V
    .registers 3
    .param p1, "nameType"    # I

    .prologue
    .line 171
    packed-switch p1, :pswitch_data_2c

    .line 188
    :goto_3
    :pswitch_3
    return-void

    .line 174
    :pswitch_4
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesEmail:Ljava/util/Set;

    goto :goto_3

    .line 177
    :pswitch_c
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDNS:Ljava/util/Set;

    goto :goto_3

    .line 180
    :pswitch_14
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDN:Ljava/util/Set;

    goto :goto_3

    .line 183
    :pswitch_1c
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesURI:Ljava/util/Set;

    goto :goto_3

    .line 186
    :pswitch_24
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesIP:Ljava/util/Set;

    goto :goto_3

    .line 171
    :pswitch_data_2c
    .packed-switch 0x1
        :pswitch_4
        :pswitch_c
        :pswitch_3
        :pswitch_14
        :pswitch_3
        :pswitch_1c
        :pswitch_24
    .end packed-switch
.end method

.method public intersectPermittedSubtree(Lorg/spongycastle/asn1/x509/GeneralSubtree;)V
    .registers 4
    .param p1, "permitted"    # Lorg/spongycastle/asn1/x509/GeneralSubtree;

    .prologue
    .line 114
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/spongycastle/asn1/x509/GeneralSubtree;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->intersectPermittedSubtree([Lorg/spongycastle/asn1/x509/GeneralSubtree;)V

    .line 115
    return-void
.end method

.method public intersectPermittedSubtree([Lorg/spongycastle/asn1/x509/GeneralSubtree;)V
    .registers 10
    .param p1, "permitted"    # [Lorg/spongycastle/asn1/x509/GeneralSubtree;

    .prologue
    .line 125
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 128
    .local v4, "subtreesMap":Ljava/util/Map;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    array-length v6, p1

    if-eq v1, v6, :cond_31

    .line 130
    aget-object v3, p1, v1

    .line 131
    .local v3, "subtree":Lorg/spongycastle/asn1/x509/GeneralSubtree;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/GeneralSubtree;->getBase()Lorg/spongycastle/asn1/x509/GeneralName;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/asn1/x509/GeneralName;->getTagNo()I

    move-result v6

    invoke-static {v6}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 132
    .local v5, "tagNo":Ljava/lang/Integer;
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_25

    .line 134
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    :cond_25
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Set;

    invoke-interface {v6, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 128
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 139
    .end local v3    # "subtree":Lorg/spongycastle/asn1/x509/GeneralSubtree;
    .end local v5    # "tagNo":Ljava/lang/Integer;
    :cond_31
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_39
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9e

    .line 141
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 144
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    packed-switch v6, :pswitch_data_a0

    :pswitch_52
    goto :goto_39

    .line 147
    :pswitch_53
    iget-object v7, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesEmail:Ljava/util/Set;

    .line 148
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Set;

    .line 147
    invoke-direct {p0, v7, v6}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->intersectEmail(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesEmail:Ljava/util/Set;

    goto :goto_39

    .line 151
    :pswitch_62
    iget-object v7, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDNS:Ljava/util/Set;

    .line 152
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Set;

    .line 151
    invoke-direct {p0, v7, v6}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->intersectDNS(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDNS:Ljava/util/Set;

    goto :goto_39

    .line 155
    :pswitch_71
    iget-object v7, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDN:Ljava/util/Set;

    .line 156
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Set;

    .line 155
    invoke-direct {p0, v7, v6}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->intersectDN(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDN:Ljava/util/Set;

    goto :goto_39

    .line 159
    :pswitch_80
    iget-object v7, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesURI:Ljava/util/Set;

    .line 160
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Set;

    .line 159
    invoke-direct {p0, v7, v6}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->intersectURI(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesURI:Ljava/util/Set;

    goto :goto_39

    .line 163
    :pswitch_8f
    iget-object v7, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesIP:Ljava/util/Set;

    .line 164
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Set;

    .line 163
    invoke-direct {p0, v7, v6}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->intersectIP(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesIP:Ljava/util/Set;

    goto :goto_39

    .line 167
    .end local v0    # "entry":Ljava/util/Map$Entry;
    :cond_9e
    return-void

    .line 144
    nop

    :pswitch_data_a0
    .packed-switch 0x1
        :pswitch_53
        :pswitch_62
        :pswitch_52
        :pswitch_71
        :pswitch_52
        :pswitch_80
        :pswitch_8f
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 259
    const-string v0, ""

    .line 260
    .local v0, "temp":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "permitted:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 261
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDN:Ljava/util/Set;

    if-eqz v1, :cond_49

    .line 263
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "DN:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 264
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDN:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 266
    :cond_49
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDNS:Ljava/util/Set;

    if-eqz v1, :cond_7d

    .line 268
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "DNS:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 269
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesDNS:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 271
    :cond_7d
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesEmail:Ljava/util/Set;

    if-eqz v1, :cond_b1

    .line 273
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Email:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 274
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesEmail:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 276
    :cond_b1
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesURI:Ljava/util/Set;

    if-eqz v1, :cond_e5

    .line 278
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "URI:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 279
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesURI:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 281
    :cond_e5
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesIP:Ljava/util/Set;

    if-eqz v1, :cond_119

    .line 283
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "IP:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 284
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->permittedSubtreesIP:Ljava/util/Set;

    invoke-direct {p0, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->stringifyIPCollection(Ljava/util/Set;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 286
    :cond_119
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "excluded:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 287
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDN:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_164

    .line 289
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "DN:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 290
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDN:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 292
    :cond_164
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDNS:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_19c

    .line 294
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "DNS:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 295
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesDNS:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 297
    :cond_19c
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesEmail:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1d4

    .line 299
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Email:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 300
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesEmail:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 302
    :cond_1d4
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesURI:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_20c

    .line 304
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "URI:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 305
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesURI:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 307
    :cond_20c
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesIP:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_244

    .line 309
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "IP:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 310
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->excludedSubtreesIP:Ljava/util/Set;

    invoke-direct {p0, v2}, Lorg/spongycastle/asn1/x509/PKIXNameConstraintValidator;->stringifyIPCollection(Ljava/util/Set;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 312
    :cond_244
    return-object v0
.end method
