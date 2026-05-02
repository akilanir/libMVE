.class public Lezvcard/property/Label;
.super Lezvcard/property/TextProperty;
.source "Label.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lezvcard/property/TextProperty;-><init>(Ljava/lang/String;)V

    .line 89
    return-void
.end method


# virtual methods
.method public _supportedVersions()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lezvcard/VCardVersion;",
            ">;"
        }
    .end annotation

    .prologue
    .line 93
    sget-object v0, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    sget-object v1, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method public addType(Lezvcard/parameter/AddressType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/AddressType;

    .prologue
    .line 114
    iget-object v0, p0, Lezvcard/property/Label;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/AddressType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->addType(Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 127
    invoke-super {p0}, Lezvcard/property/TextProperty;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTypes()Ljava/util/Set;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lezvcard/parameter/AddressType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 101
    iget-object v4, p0, Lezvcard/property/Label;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v4}, Lezvcard/parameter/VCardParameters;->getTypes()Ljava/util/Set;

    move-result-object v3

    .line 102
    .local v3, "values":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 103
    .local v1, "types":Ljava/util/Set;, "Ljava/util/Set<Lezvcard/parameter/AddressType;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 104
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Lezvcard/parameter/AddressType;->get(Ljava/lang/String;)Lezvcard/parameter/AddressType;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 106
    .end local v2    # "value":Ljava/lang/String;
    :cond_27
    return-object v1
.end method

.method public removeType(Lezvcard/parameter/AddressType;)V
    .registers 4
    .param p1, "type"    # Lezvcard/parameter/AddressType;

    .prologue
    .line 122
    iget-object v0, p0, Lezvcard/property/Label;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {p1}, Lezvcard/parameter/AddressType;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->removeType(Ljava/lang/String;)V

    .line 123
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 132
    invoke-super {p0, p1}, Lezvcard/property/TextProperty;->setLanguage(Ljava/lang/String;)V

    .line 133
    return-void
.end method
