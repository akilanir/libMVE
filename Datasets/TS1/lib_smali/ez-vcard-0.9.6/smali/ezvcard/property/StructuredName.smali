.class public Lezvcard/property/StructuredName;
.super Lezvcard/property/VCardProperty;
.source "StructuredName.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# instance fields
.field private additional:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private family:Ljava/lang/String;

.field private given:Ljava/lang/String;

.field private prefixes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private suffixes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 65
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lezvcard/property/StructuredName;->additional:Ljava/util/List;

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lezvcard/property/StructuredName;->prefixes:Ljava/util/List;

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lezvcard/property/StructuredName;->suffixes:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addAdditional(Ljava/lang/String;)V
    .registers 3
    .param p1, "additional"    # Ljava/lang/String;

    .prologue
    .line 117
    iget-object v0, p0, Lezvcard/property/StructuredName;->additional:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    return-void
.end method

.method public addPrefix(Ljava/lang/String;)V
    .registers 3
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 133
    iget-object v0, p0, Lezvcard/property/StructuredName;->prefixes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    return-void
.end method

.method public addSuffix(Ljava/lang/String;)V
    .registers 3
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 149
    iget-object v0, p0, Lezvcard/property/StructuredName;->suffixes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    return-void
.end method

.method public getAdditional()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lezvcard/property/StructuredName;->additional:Ljava/util/List;

    return-object v0
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 219
    iget-object v0, p0, Lezvcard/property/StructuredName;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFamily()Ljava/lang/String;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lezvcard/property/StructuredName;->family:Ljava/lang/String;

    return-object v0
.end method

.method public getGiven()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lezvcard/property/StructuredName;->given:Ljava/lang/String;

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 209
    invoke-super {p0}, Lezvcard/property/VCardProperty;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPrefixes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lezvcard/property/StructuredName;->prefixes:Ljava/util/List;

    return-object v0
.end method

.method public getSortAs()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 167
    iget-object v0, p0, Lezvcard/property/StructuredName;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getSortAs()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSuffixes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    iget-object v0, p0, Lezvcard/property/StructuredName;->suffixes:Ljava/util/List;

    return-object v0
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 224
    iget-object v0, p0, Lezvcard/property/StructuredName;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 225
    return-void
.end method

.method public setFamily(Ljava/lang/String;)V
    .registers 2
    .param p1, "family"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lezvcard/property/StructuredName;->family:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public setGiven(Ljava/lang/String;)V
    .registers 2
    .param p1, "given"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lezvcard/property/StructuredName;->given:Ljava/lang/String;

    .line 102
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-super {p0, p1}, Lezvcard/property/VCardProperty;->setLanguage(Ljava/lang/String;)V

    .line 215
    return-void
.end method

.method public setSortAs(Ljava/lang/String;)V
    .registers 5
    .param p1, "family"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 183
    if-nez p1, :cond_b

    .line 184
    iget-object v0, p0, Lezvcard/property/StructuredName;->parameters:Lezvcard/parameter/VCardParameters;

    new-array v1, v2, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->setSortAs([Ljava/lang/String;)V

    .line 188
    :goto_a
    return-void

    .line 186
    :cond_b
    iget-object v0, p0, Lezvcard/property/StructuredName;->parameters:Lezvcard/parameter/VCardParameters;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->setSortAs([Ljava/lang/String;)V

    goto :goto_a
.end method

.method public setSortAs(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "family"    # Ljava/lang/String;
    .param p2, "given"    # Ljava/lang/String;

    .prologue
    .line 204
    iget-object v0, p0, Lezvcard/property/StructuredName;->parameters:Lezvcard/parameter/VCardParameters;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->setSortAs([Ljava/lang/String;)V

    .line 205
    return-void
.end method
