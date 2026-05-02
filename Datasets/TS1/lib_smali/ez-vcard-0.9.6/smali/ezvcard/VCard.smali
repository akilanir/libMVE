.class public Lezvcard/VCard;
.super Ljava/lang/Object;
.source "VCard.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lezvcard/property/VCardProperty;",
        ">;"
    }
.end annotation


# instance fields
.field private final properties:Lezvcard/util/ListMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lezvcard/util/ListMultimap",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lezvcard/property/VCardProperty;",
            ">;",
            "Lezvcard/property/VCardProperty;",
            ">;"
        }
    .end annotation
.end field

.field private version:Lezvcard/VCardVersion;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    sget-object v0, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    iput-object v0, p0, Lezvcard/VCard;->version:Lezvcard/VCardVersion;

    .line 113
    new-instance v0, Lezvcard/util/ListMultimap;

    invoke-direct {v0}, Lezvcard/util/ListMultimap;-><init>()V

    iput-object v0, p0, Lezvcard/VCard;->properties:Lezvcard/util/ListMultimap;

    return-void
.end method

.method static generateAltId(Ljava/util/Collection;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lezvcard/property/HasAltId;",
            ">(",
            "Ljava/util/Collection",
            "<TT;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 4704
    .local p0, "properties":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 4705
    .local v1, "altIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lezvcard/property/HasAltId;

    .line 4706
    .local v3, "property":Lezvcard/property/HasAltId;, "TT;"
    invoke-interface {v3}, Lezvcard/property/HasAltId;->getAltId()Ljava/lang/String;

    move-result-object v0

    .line 4707
    .local v0, "altId":Ljava/lang/String;
    if-eqz v0, :cond_9

    .line 4708
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 4712
    .end local v0    # "altId":Ljava/lang/String;
    .end local v3    # "property":Lezvcard/property/HasAltId;, "TT;"
    :cond_1f
    const/4 v0, 0x1

    .line 4713
    .local v0, "altId":I
    :goto_20
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3c

    .line 4714
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 4716
    :cond_3c
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public addAddress(Lezvcard/property/Address;)V
    .registers 2
    .param p1, "address"    # Lezvcard/property/Address;

    .prologue
    .line 2281
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 2282
    return-void
.end method

.method public addAddressAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Address;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2301
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Address;>;"
    const-class v0, Lezvcard/property/Address;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 2302
    return-void
.end method

.method public varargs addAddressAlt([Lezvcard/property/Address;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Address;

    .prologue
    .line 2321
    const-class v0, Lezvcard/property/Address;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 2322
    return-void
.end method

.method public addCalendarRequestUri(Lezvcard/property/CalendarRequestUri;)V
    .registers 2
    .param p1, "calendarRequestUri"    # Lezvcard/property/CalendarRequestUri;

    .prologue
    .line 3789
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 3790
    return-void
.end method

.method public addCalendarRequestUriAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/CalendarRequestUri;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3808
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/CalendarRequestUri;>;"
    const-class v0, Lezvcard/property/CalendarRequestUri;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3809
    return-void
.end method

.method public varargs addCalendarRequestUriAlt([Lezvcard/property/CalendarRequestUri;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/CalendarRequestUri;

    .prologue
    .line 3827
    const-class v0, Lezvcard/property/CalendarRequestUri;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3828
    return-void
.end method

.method public addCalendarUri(Lezvcard/property/CalendarUri;)V
    .registers 2
    .param p1, "calendarUri"    # Lezvcard/property/CalendarUri;

    .prologue
    .line 3855
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 3856
    return-void
.end method

.method public addCalendarUriAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/CalendarUri;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3874
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/CalendarUri;>;"
    const-class v0, Lezvcard/property/CalendarUri;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3875
    return-void
.end method

.method public varargs addCalendarUriAlt([Lezvcard/property/CalendarUri;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/CalendarUri;

    .prologue
    .line 3893
    const-class v0, Lezvcard/property/CalendarUri;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3894
    return-void
.end method

.method public addCategories(Lezvcard/property/Categories;)V
    .registers 2
    .param p1, "categories"    # Lezvcard/property/Categories;

    .prologue
    .line 3305
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 3306
    return-void
.end method

.method public addCategoriesAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Categories;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3247
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Categories;>;"
    const-class v0, Lezvcard/property/Categories;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3248
    return-void
.end method

.method public varargs addCategoriesAlt([Lezvcard/property/Categories;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Categories;

    .prologue
    .line 3267
    const-class v0, Lezvcard/property/Categories;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3268
    return-void
.end method

.method public addClientPidMap(Lezvcard/property/ClientPidMap;)V
    .registers 2
    .param p1, "clientPidMap"    # Lezvcard/property/ClientPidMap;

    .prologue
    .line 3991
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 3992
    return-void
.end method

.method public varargs addEmail(Ljava/lang/String;[Lezvcard/parameter/EmailType;)Lezvcard/property/Email;
    .registers 8
    .param p1, "email"    # Ljava/lang/String;
    .param p2, "types"    # [Lezvcard/parameter/EmailType;

    .prologue
    .line 2398
    new-instance v4, Lezvcard/property/Email;

    invoke-direct {v4, p1}, Lezvcard/property/Email;-><init>(Ljava/lang/String;)V

    .line 2399
    .local v4, "type":Lezvcard/property/Email;
    move-object v0, p2

    .local v0, "arr$":[Lezvcard/parameter/EmailType;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_8
    if-ge v1, v2, :cond_12

    aget-object v3, v0, v1

    .line 2400
    .local v3, "t":Lezvcard/parameter/EmailType;
    invoke-virtual {v4, v3}, Lezvcard/property/Email;->addType(Lezvcard/parameter/EmailType;)V

    .line 2399
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 2402
    .end local v3    # "t":Lezvcard/parameter/EmailType;
    :cond_12
    invoke-virtual {p0, v4}, Lezvcard/VCard;->addEmail(Lezvcard/property/Email;)V

    .line 2403
    return-object v4
.end method

.method public addEmail(Lezvcard/property/Email;)V
    .registers 2
    .param p1, "email"    # Lezvcard/property/Email;

    .prologue
    .line 2381
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 2382
    return-void
.end method

.method public addEmailAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Email;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2423
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Email;>;"
    const-class v0, Lezvcard/property/Email;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 2424
    return-void
.end method

.method public varargs addEmailAlt([Lezvcard/property/Email;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Email;

    .prologue
    .line 2443
    const-class v0, Lezvcard/property/Email;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 2444
    return-void
.end method

.method public addExpertise(Ljava/lang/String;)Lezvcard/property/Expertise;
    .registers 3
    .param p1, "expertise"    # Ljava/lang/String;

    .prologue
    .line 4113
    new-instance v0, Lezvcard/property/Expertise;

    invoke-direct {v0, p1}, Lezvcard/property/Expertise;-><init>(Ljava/lang/String;)V

    .line 4114
    .local v0, "type":Lezvcard/property/Expertise;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addExpertise(Lezvcard/property/Expertise;)V

    .line 4115
    return-object v0
.end method

.method public addExpertise(Lezvcard/property/Expertise;)V
    .registers 2
    .param p1, "expertise"    # Lezvcard/property/Expertise;

    .prologue
    .line 4095
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 4096
    return-void
.end method

.method public addExpertiseAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Expertise;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4135
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Expertise;>;"
    const-class v0, Lezvcard/property/Expertise;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 4136
    return-void
.end method

.method public varargs addExpertiseAlt([Lezvcard/property/Expertise;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Expertise;

    .prologue
    .line 4155
    const-class v0, Lezvcard/property/Expertise;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 4156
    return-void
.end method

.method public addExtendedProperty(Ljava/lang/String;Ljava/lang/String;)Lezvcard/property/RawProperty;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 4577
    new-instance v0, Lezvcard/property/RawProperty;

    invoke-direct {v0, p1, p2}, Lezvcard/property/RawProperty;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4578
    .local v0, "raw":Lezvcard/property/RawProperty;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 4579
    return-object v0
.end method

.method public addFbUrl(Lezvcard/property/FreeBusyUrl;)V
    .registers 2
    .param p1, "fbUrl"    # Lezvcard/property/FreeBusyUrl;

    .prologue
    .line 3923
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 3924
    return-void
.end method

.method public addFbUrlAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/FreeBusyUrl;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3941
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/FreeBusyUrl;>;"
    const-class v0, Lezvcard/property/FreeBusyUrl;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3942
    return-void
.end method

.method public varargs addFbUrlAlt([Lezvcard/property/FreeBusyUrl;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/FreeBusyUrl;

    .prologue
    .line 3959
    const-class v0, Lezvcard/property/FreeBusyUrl;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3960
    return-void
.end method

.method public addFormattedName(Lezvcard/property/FormattedName;)V
    .registers 2
    .param p1, "formattedName"    # Lezvcard/property/FormattedName;

    .prologue
    .line 960
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 961
    return-void
.end method

.method public addFormattedNameAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/FormattedName;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 898
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/FormattedName;>;"
    const-class v0, Lezvcard/property/FormattedName;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 899
    return-void
.end method

.method public varargs addFormattedNameAlt([Lezvcard/property/FormattedName;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/FormattedName;

    .prologue
    .line 918
    const-class v0, Lezvcard/property/FormattedName;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 919
    return-void
.end method

.method public addGeo(Lezvcard/property/Geo;)V
    .registers 2
    .param p1, "geo"    # Lezvcard/property/Geo;

    .prologue
    .line 2951
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 2952
    return-void
.end method

.method public addGeoAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Geo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2897
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Geo;>;"
    const-class v0, Lezvcard/property/Geo;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 2898
    return-void
.end method

.method public varargs addGeoAlt([Lezvcard/property/Geo;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Geo;

    .prologue
    .line 2917
    const-class v0, Lezvcard/property/Geo;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 2918
    return-void
.end method

.method public addHobby(Ljava/lang/String;)Lezvcard/property/Hobby;
    .registers 3
    .param p1, "hobby"    # Ljava/lang/String;

    .prologue
    .line 4202
    new-instance v0, Lezvcard/property/Hobby;

    invoke-direct {v0, p1}, Lezvcard/property/Hobby;-><init>(Ljava/lang/String;)V

    .line 4203
    .local v0, "type":Lezvcard/property/Hobby;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addHobby(Lezvcard/property/Hobby;)V

    .line 4204
    return-object v0
.end method

.method public addHobby(Lezvcard/property/Hobby;)V
    .registers 2
    .param p1, "hobby"    # Lezvcard/property/Hobby;

    .prologue
    .line 4185
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 4186
    return-void
.end method

.method public addHobbyAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Hobby;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4223
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Hobby;>;"
    const-class v0, Lezvcard/property/Hobby;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 4224
    return-void
.end method

.method public varargs addHobbyAlt([Lezvcard/property/Hobby;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Hobby;

    .prologue
    .line 4242
    const-class v0, Lezvcard/property/Hobby;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 4243
    return-void
.end method

.method public addImpp(Lezvcard/property/Impp;)V
    .registers 2
    .param p1, "impp"    # Lezvcard/property/Impp;

    .prologue
    .line 3571
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 3572
    return-void
.end method

.method public addImppAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Impp;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3591
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Impp;>;"
    const-class v0, Lezvcard/property/Impp;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3592
    return-void
.end method

.method public varargs addImppAlt([Lezvcard/property/Impp;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Impp;

    .prologue
    .line 3611
    const-class v0, Lezvcard/property/Impp;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3612
    return-void
.end method

.method public addInterest(Ljava/lang/String;)Lezvcard/property/Interest;
    .registers 3
    .param p1, "interest"    # Ljava/lang/String;

    .prologue
    .line 4289
    new-instance v0, Lezvcard/property/Interest;

    invoke-direct {v0, p1}, Lezvcard/property/Interest;-><init>(Ljava/lang/String;)V

    .line 4290
    .local v0, "type":Lezvcard/property/Interest;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addInterest(Lezvcard/property/Interest;)V

    .line 4291
    return-object v0
.end method

.method public addInterest(Lezvcard/property/Interest;)V
    .registers 2
    .param p1, "interest"    # Lezvcard/property/Interest;

    .prologue
    .line 4272
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 4273
    return-void
.end method

.method public addInterestAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Interest;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4310
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Interest;>;"
    const-class v0, Lezvcard/property/Interest;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 4311
    return-void
.end method

.method public varargs addInterestAlt([Lezvcard/property/Interest;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Interest;

    .prologue
    .line 4329
    const-class v0, Lezvcard/property/Interest;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 4330
    return-void
.end method

.method public addKey(Lezvcard/property/Key;)V
    .registers 2
    .param p1, "key"    # Lezvcard/property/Key;

    .prologue
    .line 3503
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 3504
    return-void
.end method

.method public addKeyAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Key;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3523
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Key;>;"
    const-class v0, Lezvcard/property/Key;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3524
    return-void
.end method

.method public varargs addKeyAlt([Lezvcard/property/Key;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Key;

    .prologue
    .line 3543
    const-class v0, Lezvcard/property/Key;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3544
    return-void
.end method

.method public addLanguage(Ljava/lang/String;)Lezvcard/property/Language;
    .registers 3
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 3721
    new-instance v0, Lezvcard/property/Language;

    invoke-direct {v0, p1}, Lezvcard/property/Language;-><init>(Ljava/lang/String;)V

    .line 3722
    .local v0, "type":Lezvcard/property/Language;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addLanguage(Lezvcard/property/Language;)V

    .line 3723
    return-object v0
.end method

.method public addLanguage(Lezvcard/property/Language;)V
    .registers 2
    .param p1, "language"    # Lezvcard/property/Language;

    .prologue
    .line 3705
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 3706
    return-void
.end method

.method public addLanguageAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Language;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3741
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Language;>;"
    const-class v0, Lezvcard/property/Language;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3742
    return-void
.end method

.method public varargs addLanguageAlt([Lezvcard/property/Language;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Language;

    .prologue
    .line 3759
    const-class v0, Lezvcard/property/Language;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3760
    return-void
.end method

.method public addLogo(Lezvcard/property/Logo;)V
    .registers 2
    .param p1, "logo"    # Lezvcard/property/Logo;

    .prologue
    .line 1588
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 1589
    return-void
.end method

.method public addLogoAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Logo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1608
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Logo;>;"
    const-class v0, Lezvcard/property/Logo;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 1609
    return-void
.end method

.method public varargs addLogoAlt([Lezvcard/property/Logo;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Logo;

    .prologue
    .line 1628
    const-class v0, Lezvcard/property/Logo;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 1629
    return-void
.end method

.method public addMember(Lezvcard/property/Member;)V
    .registers 2
    .param p1, "member"    # Lezvcard/property/Member;

    .prologue
    .line 542
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 543
    return-void
.end method

.method public addMemberAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Member;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 561
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Member;>;"
    const-class v0, Lezvcard/property/Member;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 562
    return-void
.end method

.method public varargs addMemberAlt([Lezvcard/property/Member;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Member;

    .prologue
    .line 580
    const-class v0, Lezvcard/property/Member;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 581
    return-void
.end method

.method public addNickname(Lezvcard/property/Nickname;)V
    .registers 2
    .param p1, "nickname"    # Lezvcard/property/Nickname;

    .prologue
    .line 1225
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 1226
    return-void
.end method

.method public addNicknameAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Nickname;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1169
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Nickname;>;"
    const-class v0, Lezvcard/property/Nickname;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 1170
    return-void
.end method

.method public varargs addNicknameAlt([Lezvcard/property/Nickname;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Nickname;

    .prologue
    .line 1189
    const-class v0, Lezvcard/property/Nickname;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 1190
    return-void
.end method

.method public addNote(Ljava/lang/String;)Lezvcard/property/Note;
    .registers 3
    .param p1, "note"    # Ljava/lang/String;

    .prologue
    .line 3405
    new-instance v0, Lezvcard/property/Note;

    invoke-direct {v0, p1}, Lezvcard/property/Note;-><init>(Ljava/lang/String;)V

    .line 3406
    .local v0, "type":Lezvcard/property/Note;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addNote(Lezvcard/property/Note;)V

    .line 3407
    return-object v0
.end method

.method public addNote(Lezvcard/property/Note;)V
    .registers 2
    .param p1, "note"    # Lezvcard/property/Note;

    .prologue
    .line 3389
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 3390
    return-void
.end method

.method public addNoteAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Note;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3427
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Note;>;"
    const-class v0, Lezvcard/property/Note;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3428
    return-void
.end method

.method public varargs addNoteAlt([Lezvcard/property/Note;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Note;

    .prologue
    .line 3447
    const-class v0, Lezvcard/property/Note;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3448
    return-void
.end method

.method public addOrgDirectory(Ljava/lang/String;)Lezvcard/property/OrgDirectory;
    .registers 3
    .param p1, "orgDirectory"    # Ljava/lang/String;

    .prologue
    .line 4377
    new-instance v0, Lezvcard/property/OrgDirectory;

    invoke-direct {v0, p1}, Lezvcard/property/OrgDirectory;-><init>(Ljava/lang/String;)V

    .line 4378
    .local v0, "type":Lezvcard/property/OrgDirectory;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addOrgDirectory(Lezvcard/property/OrgDirectory;)V

    .line 4379
    return-object v0
.end method

.method public addOrgDirectory(Lezvcard/property/OrgDirectory;)V
    .registers 2
    .param p1, "orgDirectory"    # Lezvcard/property/OrgDirectory;

    .prologue
    .line 4359
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 4360
    return-void
.end method

.method public addOrgDirectoryAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/OrgDirectory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4398
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/OrgDirectory;>;"
    const-class v0, Lezvcard/property/OrgDirectory;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 4399
    return-void
.end method

.method public varargs addOrgDirectoryAlt([Lezvcard/property/OrgDirectory;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/OrgDirectory;

    .prologue
    .line 4417
    const-class v0, Lezvcard/property/OrgDirectory;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 4418
    return-void
.end method

.method public addOrganization(Lezvcard/property/Organization;)V
    .registers 2
    .param p1, "organization"    # Lezvcard/property/Organization;

    .prologue
    .line 3122
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 3123
    return-void
.end method

.method public addOrganizationAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Organization;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3068
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Organization;>;"
    const-class v0, Lezvcard/property/Organization;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3069
    return-void
.end method

.method public varargs addOrganizationAlt([Lezvcard/property/Organization;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Organization;

    .prologue
    .line 3088
    const-class v0, Lezvcard/property/Organization;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3089
    return-void
.end method

.method public addOrphanedLabel(Lezvcard/property/Label;)V
    .registers 2
    .param p1, "label"    # Lezvcard/property/Label;

    .prologue
    .line 2353
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 2354
    return-void
.end method

.method public addPhoto(Lezvcard/property/Photo;)V
    .registers 2
    .param p1, "photo"    # Lezvcard/property/Photo;

    .prologue
    .line 1520
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 1521
    return-void
.end method

.method public addPhotoAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Photo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1540
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Photo;>;"
    const-class v0, Lezvcard/property/Photo;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 1541
    return-void
.end method

.method public varargs addPhotoAlt([Lezvcard/property/Photo;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Photo;

    .prologue
    .line 1560
    const-class v0, Lezvcard/property/Photo;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 1561
    return-void
.end method

.method public addProperty(Lezvcard/property/VCardProperty;)V
    .registers 4
    .param p1, "property"    # Lezvcard/property/VCardProperty;

    .prologue
    .line 4501
    iget-object v0, p0, Lezvcard/VCard;->properties:Lezvcard/util/ListMultimap;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lezvcard/util/ListMultimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4502
    return-void
.end method

.method public addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lezvcard/property/VCardProperty;",
            ":",
            "Lezvcard/property/HasAltId;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/util/Collection",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 4630
    .local p1, "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    invoke-virtual {p0, p1}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lezvcard/VCard;->generateAltId(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v0

    .line 4631
    .local v0, "altId":Ljava/lang/String;
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lezvcard/property/VCardProperty;

    .local v2, "property":Lezvcard/property/VCardProperty;, "TT;"
    move-object v3, v2

    .line 4632
    check-cast v3, Lezvcard/property/HasAltId;

    invoke-interface {v3, v0}, Lezvcard/property/HasAltId;->setAltId(Ljava/lang/String;)V

    .line 4633
    invoke-virtual {p0, v2}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    goto :goto_c

    .line 4635
    .end local v2    # "property":Lezvcard/property/VCardProperty;, "TT;"
    :cond_22
    return-void
.end method

.method public varargs addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lezvcard/property/VCardProperty;",
            ":",
            "Lezvcard/property/HasAltId;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;[TT;)V"
        }
    .end annotation

    .prologue
    .line 4617
    .local p1, "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "altRepresentations":[Lezvcard/property/VCardProperty;, "[TT;"
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 4618
    return-void
.end method

.method public addRelated(Lezvcard/property/Related;)V
    .registers 2
    .param p1, "related"    # Lezvcard/property/Related;

    .prologue
    .line 3639
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 3640
    return-void
.end method

.method public addRelatedAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Related;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3658
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Related;>;"
    const-class v0, Lezvcard/property/Related;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3659
    return-void
.end method

.method public varargs addRelatedAlt([Lezvcard/property/Related;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Related;

    .prologue
    .line 3677
    const-class v0, Lezvcard/property/Related;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3678
    return-void
.end method

.method public addRole(Ljava/lang/String;)Lezvcard/property/Role;
    .registers 3
    .param p1, "role"    # Ljava/lang/String;

    .prologue
    .line 1449
    new-instance v0, Lezvcard/property/Role;

    invoke-direct {v0, p1}, Lezvcard/property/Role;-><init>(Ljava/lang/String;)V

    .line 1450
    .local v0, "type":Lezvcard/property/Role;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addRole(Lezvcard/property/Role;)V

    .line 1451
    return-object v0
.end method

.method public addRole(Lezvcard/property/Role;)V
    .registers 2
    .param p1, "role"    # Lezvcard/property/Role;

    .prologue
    .line 1433
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 1434
    return-void
.end method

.method public addRoleAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Role;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1471
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Role;>;"
    const-class v0, Lezvcard/property/Role;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 1472
    return-void
.end method

.method public varargs addRoleAlt([Lezvcard/property/Role;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Role;

    .prologue
    .line 1491
    const-class v0, Lezvcard/property/Role;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 1492
    return-void
.end method

.method public addSound(Lezvcard/property/Sound;)V
    .registers 2
    .param p1, "sound"    # Lezvcard/property/Sound;

    .prologue
    .line 1657
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 1658
    return-void
.end method

.method public addSoundAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Sound;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1677
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Sound;>;"
    const-class v0, Lezvcard/property/Sound;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 1678
    return-void
.end method

.method public varargs addSoundAlt([Lezvcard/property/Sound;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Sound;

    .prologue
    .line 1697
    const-class v0, Lezvcard/property/Sound;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 1698
    return-void
.end method

.method public addSource(Ljava/lang/String;)Lezvcard/property/Source;
    .registers 3
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    .line 710
    new-instance v0, Lezvcard/property/Source;

    invoke-direct {v0, p1}, Lezvcard/property/Source;-><init>(Ljava/lang/String;)V

    .line 711
    .local v0, "type":Lezvcard/property/Source;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addSource(Lezvcard/property/Source;)V

    .line 712
    return-object v0
.end method

.method public addSource(Lezvcard/property/Source;)V
    .registers 2
    .param p1, "source"    # Lezvcard/property/Source;

    .prologue
    .line 693
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 694
    return-void
.end method

.method public addSourceAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Source;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 732
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Source;>;"
    const-class v0, Lezvcard/property/Source;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 733
    return-void
.end method

.method public varargs addSourceAlt([Lezvcard/property/Source;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Source;

    .prologue
    .line 752
    const-class v0, Lezvcard/property/Source;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 753
    return-void
.end method

.method public varargs addTelephoneNumber(Ljava/lang/String;[Lezvcard/parameter/TelephoneType;)Lezvcard/property/Telephone;
    .registers 8
    .param p1, "telephoneNumber"    # Ljava/lang/String;
    .param p2, "types"    # [Lezvcard/parameter/TelephoneType;

    .prologue
    .line 2490
    new-instance v4, Lezvcard/property/Telephone;

    invoke-direct {v4, p1}, Lezvcard/property/Telephone;-><init>(Ljava/lang/String;)V

    .line 2491
    .local v4, "type":Lezvcard/property/Telephone;
    move-object v0, p2

    .local v0, "arr$":[Lezvcard/parameter/TelephoneType;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_8
    if-ge v1, v2, :cond_12

    aget-object v3, v0, v1

    .line 2492
    .local v3, "t":Lezvcard/parameter/TelephoneType;
    invoke-virtual {v4, v3}, Lezvcard/property/Telephone;->addType(Lezvcard/parameter/TelephoneType;)V

    .line 2491
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 2494
    .end local v3    # "t":Lezvcard/parameter/TelephoneType;
    :cond_12
    invoke-virtual {p0, v4}, Lezvcard/VCard;->addTelephoneNumber(Lezvcard/property/Telephone;)V

    .line 2495
    return-object v4
.end method

.method public addTelephoneNumber(Lezvcard/property/Telephone;)V
    .registers 2
    .param p1, "telephoneNumber"    # Lezvcard/property/Telephone;

    .prologue
    .line 2471
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 2472
    return-void
.end method

.method public addTelephoneNumberAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Telephone;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2515
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Telephone;>;"
    const-class v0, Lezvcard/property/Telephone;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 2516
    return-void
.end method

.method public varargs addTelephoneNumberAlt([Lezvcard/property/Telephone;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Telephone;

    .prologue
    .line 2535
    const-class v0, Lezvcard/property/Telephone;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 2536
    return-void
.end method

.method public addTimezone(Lezvcard/property/Timezone;)V
    .registers 2
    .param p1, "timezone"    # Lezvcard/property/Timezone;

    .prologue
    .line 2821
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 2822
    return-void
.end method

.method public addTimezoneAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Timezone;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2768
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Timezone;>;"
    const-class v0, Lezvcard/property/Timezone;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 2769
    return-void
.end method

.method public varargs addTimezoneAlt([Lezvcard/property/Timezone;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Timezone;

    .prologue
    .line 2788
    const-class v0, Lezvcard/property/Timezone;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 2789
    return-void
.end method

.method public addTitle(Ljava/lang/String;)Lezvcard/property/Title;
    .registers 3
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 1363
    new-instance v0, Lezvcard/property/Title;

    invoke-direct {v0, p1}, Lezvcard/property/Title;-><init>(Ljava/lang/String;)V

    .line 1364
    .local v0, "type":Lezvcard/property/Title;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addTitle(Lezvcard/property/Title;)V

    .line 1365
    return-object v0
.end method

.method public addTitle(Lezvcard/property/Title;)V
    .registers 2
    .param p1, "title"    # Lezvcard/property/Title;

    .prologue
    .line 1347
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 1348
    return-void
.end method

.method public addTitleAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Title;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1385
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Title;>;"
    const-class v0, Lezvcard/property/Title;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 1386
    return-void
.end method

.method public varargs addTitleAlt([Lezvcard/property/Title;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Title;

    .prologue
    .line 1405
    const-class v0, Lezvcard/property/Title;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 1406
    return-void
.end method

.method public addUrl(Ljava/lang/String;)Lezvcard/property/Url;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 2630
    new-instance v0, Lezvcard/property/Url;

    invoke-direct {v0, p1}, Lezvcard/property/Url;-><init>(Ljava/lang/String;)V

    .line 2631
    .local v0, "type":Lezvcard/property/Url;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addUrl(Lezvcard/property/Url;)V

    .line 2632
    return-object v0
.end method

.method public addUrl(Lezvcard/property/Url;)V
    .registers 2
    .param p1, "url"    # Lezvcard/property/Url;

    .prologue
    .line 2614
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 2615
    return-void
.end method

.method public addUrlAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Url;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2652
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Url;>;"
    const-class v0, Lezvcard/property/Url;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 2653
    return-void
.end method

.method public varargs addUrlAlt([Lezvcard/property/Url;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Url;

    .prologue
    .line 2672
    const-class v0, Lezvcard/property/Url;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 2673
    return-void
.end method

.method public addXml(Lezvcard/property/Xml;)V
    .registers 2
    .param p1, "xml"    # Lezvcard/property/Xml;

    .prologue
    .line 4025
    invoke-virtual {p0, p1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 4026
    return-void
.end method

.method public addXmlAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Xml;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4044
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Xml;>;"
    const-class v0, Lezvcard/property/Xml;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 4045
    return-void
.end method

.method public varargs addXmlAlt([Lezvcard/property/Xml;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Xml;

    .prologue
    .line 4063
    const-class v0, Lezvcard/property/Xml;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 4064
    return-void
.end method

.method public getAddresses()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Address;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2267
    const-class v0, Lezvcard/property/Address;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAgent()Lezvcard/property/Agent;
    .registers 2

    .prologue
    .line 3347
    const-class v0, Lezvcard/property/Agent;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Agent;

    return-object v0
.end method

.method public getAnniversaries()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Anniversary;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2083
    const-class v0, Lezvcard/property/Anniversary;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAnniversary()Lezvcard/property/Anniversary;
    .registers 2

    .prologue
    .line 2099
    const-class v0, Lezvcard/property/Anniversary;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Anniversary;

    return-object v0
.end method

.method public getBirthday()Lezvcard/property/Birthday;
    .registers 2

    .prologue
    .line 2009
    const-class v0, Lezvcard/property/Birthday;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Birthday;

    return-object v0
.end method

.method public getBirthdays()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Birthday;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1993
    const-class v0, Lezvcard/property/Birthday;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getBirthplace()Lezvcard/property/Birthplace;
    .registers 2

    .prologue
    .line 1733
    const-class v0, Lezvcard/property/Birthplace;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Birthplace;

    return-object v0
.end method

.method public getBirthplaces()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Birthplace;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1716
    const-class v0, Lezvcard/property/Birthplace;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getCalendarRequestUris()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/CalendarRequestUri;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3774
    const-class v0, Lezvcard/property/CalendarRequestUri;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getCalendarUris()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/CalendarUri;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3841
    const-class v0, Lezvcard/property/CalendarUri;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getCategories()Lezvcard/property/Categories;
    .registers 2

    .prologue
    .line 3187
    const-class v0, Lezvcard/property/Categories;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Categories;

    return-object v0
.end method

.method public getCategoriesList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Categories;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3170
    const-class v0, Lezvcard/property/Categories;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getClassification()Lezvcard/property/Classification;
    .registers 2

    .prologue
    .line 623
    const-class v0, Lezvcard/property/Classification;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Classification;

    return-object v0
.end method

.method public getClientPidMaps()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/ClientPidMap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3975
    const-class v0, Lezvcard/property/ClientPidMap;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDeathdate()Lezvcard/property/Deathdate;
    .registers 2

    .prologue
    .line 1919
    const-class v0, Lezvcard/property/Deathdate;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Deathdate;

    return-object v0
.end method

.method public getDeathdates()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Deathdate;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1902
    const-class v0, Lezvcard/property/Deathdate;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDeathplace()Lezvcard/property/Deathplace;
    .registers 2

    .prologue
    .line 1826
    const-class v0, Lezvcard/property/Deathplace;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Deathplace;

    return-object v0
.end method

.method public getDeathplaces()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Deathplace;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1809
    const-class v0, Lezvcard/property/Deathplace;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getEmails()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Email;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2367
    const-class v0, Lezvcard/property/Email;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getExpertise()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Expertise;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4079
    const-class v0, Lezvcard/property/Expertise;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getExtendedProperties()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/RawProperty;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4567
    const-class v0, Lezvcard/property/RawProperty;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getExtendedProperties(Ljava/lang/String;)Ljava/util/List;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/RawProperty;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4551
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 4553
    .local v1, "props":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/RawProperty;>;"
    const-class v3, Lezvcard/property/RawProperty;

    invoke-virtual {p0, v3}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lezvcard/property/RawProperty;

    .line 4554
    .local v2, "raw":Lezvcard/property/RawProperty;
    invoke-virtual {v2}, Lezvcard/property/RawProperty;->getPropertyName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 4555
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 4559
    .end local v2    # "raw":Lezvcard/property/RawProperty;
    :cond_29
    return-object v1
.end method

.method public getExtendedProperty(Ljava/lang/String;)Lezvcard/property/RawProperty;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 4537
    const-class v2, Lezvcard/property/RawProperty;

    invoke-virtual {p0, v2}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lezvcard/property/RawProperty;

    .line 4538
    .local v1, "raw":Lezvcard/property/RawProperty;
    invoke-virtual {v1}, Lezvcard/property/RawProperty;->getPropertyName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 4542
    .end local v1    # "raw":Lezvcard/property/RawProperty;
    :goto_20
    return-object v1

    :cond_21
    const/4 v1, 0x0

    goto :goto_20
.end method

.method public getFbUrls()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/FreeBusyUrl;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3908
    const-class v0, Lezvcard/property/FreeBusyUrl;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getFormattedName()Lezvcard/property/FormattedName;
    .registers 2

    .prologue
    .line 838
    const-class v0, Lezvcard/property/FormattedName;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/FormattedName;

    return-object v0
.end method

.method public getFormattedNames()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/FormattedName;",
            ">;"
        }
    .end annotation

    .prologue
    .line 822
    const-class v0, Lezvcard/property/FormattedName;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getGender()Lezvcard/property/Gender;
    .registers 2

    .prologue
    .line 472
    const-class v0, Lezvcard/property/Gender;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Gender;

    return-object v0
.end method

.method public getGeo()Lezvcard/property/Geo;
    .registers 2

    .prologue
    .line 2857
    const-class v0, Lezvcard/property/Geo;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Geo;

    return-object v0
.end method

.method public getGeos()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Geo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2841
    const-class v0, Lezvcard/property/Geo;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHobbies()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Hobby;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4170
    const-class v0, Lezvcard/property/Hobby;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getImpps()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Impp;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3557
    const-class v0, Lezvcard/property/Impp;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getInterests()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Interest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4257
    const-class v0, Lezvcard/property/Interest;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getKeys()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Key;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3489
    const-class v0, Lezvcard/property/Key;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getKind()Lezvcard/property/Kind;
    .registers 2

    .prologue
    .line 444
    const-class v0, Lezvcard/property/Kind;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Kind;

    return-object v0
.end method

.method public getLanguages()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Language;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3691
    const-class v0, Lezvcard/property/Language;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getLogos()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Logo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1574
    const-class v0, Lezvcard/property/Logo;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getMailer()Lezvcard/property/Mailer;
    .registers 2

    .prologue
    .line 2549
    const-class v0, Lezvcard/property/Mailer;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Mailer;

    return-object v0
.end method

.method public getMembers()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Member;",
            ">;"
        }
    .end annotation

    .prologue
    .line 516
    const-class v0, Lezvcard/property/Member;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getNickname()Lezvcard/property/Nickname;
    .registers 2

    .prologue
    .line 1109
    const-class v0, Lezvcard/property/Nickname;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Nickname;

    return-object v0
.end method

.method public getNicknames()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Nickname;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1093
    const-class v0, Lezvcard/property/Nickname;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getNotes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Note;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3375
    const-class v0, Lezvcard/property/Note;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getOrgDirectories()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/OrgDirectory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4344
    const-class v0, Lezvcard/property/OrgDirectory;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getOrganization()Lezvcard/property/Organization;
    .registers 2

    .prologue
    .line 3008
    const-class v0, Lezvcard/property/Organization;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Organization;

    return-object v0
.end method

.method public getOrganizations()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Organization;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2992
    const-class v0, Lezvcard/property/Organization;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getOrphanedLabels()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Label;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2337
    const-class v0, Lezvcard/property/Label;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPhotos()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Photo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1506
    const-class v0, Lezvcard/property/Photo;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getProductId()Lezvcard/property/ProductId;
    .registers 2

    .prologue
    .line 2217
    const-class v0, Lezvcard/property/ProductId;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/ProductId;

    return-object v0
.end method

.method public getProfile()Lezvcard/property/Profile;
    .registers 2

    .prologue
    .line 594
    const-class v0, Lezvcard/property/Profile;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Profile;

    return-object v0
.end method

.method public getProperties()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/VCardProperty;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4493
    iget-object v0, p0, Lezvcard/VCard;->properties:Lezvcard/util/ListMultimap;

    invoke-virtual {v0}, Lezvcard/util/ListMultimap;->values()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getProperties(Ljava/lang/Class;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lezvcard/property/VCardProperty;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4444
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v4, p0, Lezvcard/VCard;->properties:Lezvcard/util/ListMultimap;

    invoke-virtual {v4, p1}, Lezvcard/util/ListMultimap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 4447
    .local v2, "props":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/VCardProperty;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 4448
    .local v3, "ret":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lezvcard/property/VCardProperty;

    .line 4449
    .local v1, "property":Lezvcard/property/VCardProperty;
    invoke-virtual {p1, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 4451
    .end local v1    # "property":Lezvcard/property/VCardProperty;
    :cond_27
    return-object v3
.end method

.method public getPropertiesAlt(Ljava/lang/Class;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lezvcard/property/VCardProperty;",
            ":",
            "Lezvcard/property/HasAltId;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 4462
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 4463
    .local v6, "nullAltId":Ljava/util/List;, "Ljava/util/List<TT;>;"
    new-instance v5, Lezvcard/util/ListMultimap;

    invoke-direct {v5}, Lezvcard/util/ListMultimap;-><init>()V

    .line 4464
    .local v5, "map":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<Ljava/lang/String;TT;>;"
    invoke-virtual {p0, p1}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lezvcard/property/VCardProperty;

    .local v7, "property":Lezvcard/property/VCardProperty;, "TT;"
    move-object v8, v7

    .line 4465
    check-cast v8, Lezvcard/property/HasAltId;

    invoke-interface {v8}, Lezvcard/property/HasAltId;->getAltId()Ljava/lang/String;

    move-result-object v0

    .line 4466
    .local v0, "altId":Ljava/lang/String;
    if-nez v0, :cond_2b

    .line 4467
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_12

    .line 4469
    :cond_2b
    invoke-virtual {v5, v0, v7}, Lezvcard/util/ListMultimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_12

    .line 4473
    .end local v0    # "altId":Ljava/lang/String;
    .end local v7    # "property":Lezvcard/property/VCardProperty;, "TT;"
    :cond_2f
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 4474
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<TT;>;>;"
    invoke-virtual {v5}, Lezvcard/util/ListMultimap;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_38
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 4475
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<TT;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_38

    .line 4479
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<TT;>;>;"
    :cond_4c
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_50
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_69

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lezvcard/property/VCardProperty;

    .line 4480
    .restart local v7    # "property":Lezvcard/property/VCardProperty;, "TT;"
    new-instance v3, Ljava/util/ArrayList;

    const/4 v8, 0x1

    invoke-direct {v3, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 4481
    .local v3, "l":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4482
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_50

    .line 4485
    .end local v3    # "l":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .end local v7    # "property":Lezvcard/property/VCardProperty;, "TT;"
    :cond_69
    return-object v4
.end method

.method public getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lezvcard/property/VCardProperty;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 4435
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lezvcard/VCard;->properties:Lezvcard/util/ListMultimap;

    invoke-virtual {v0, p1}, Lezvcard/util/ListMultimap;->first(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/property/VCardProperty;

    return-object v0
.end method

.method public getRelations()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Related;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3625
    const-class v0, Lezvcard/property/Related;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getRevision()Lezvcard/property/Revision;
    .registers 2

    .prologue
    .line 2167
    const-class v0, Lezvcard/property/Revision;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Revision;

    return-object v0
.end method

.method public getRoles()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Role;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1419
    const-class v0, Lezvcard/property/Role;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSortString()Lezvcard/property/SortString;
    .registers 2

    .prologue
    .line 1271
    const-class v0, Lezvcard/property/SortString;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/SortString;

    return-object v0
.end method

.method public getSounds()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Sound;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1643
    const-class v0, Lezvcard/property/Sound;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSourceDisplayText()Lezvcard/property/SourceDisplayText;
    .registers 2

    .prologue
    .line 766
    const-class v0, Lezvcard/property/SourceDisplayText;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/SourceDisplayText;

    return-object v0
.end method

.method public getSources()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Source;",
            ">;"
        }
    .end annotation

    .prologue
    .line 678
    const-class v0, Lezvcard/property/Source;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getStructuredName()Lezvcard/property/StructuredName;
    .registers 2

    .prologue
    .line 1019
    const-class v0, Lezvcard/property/StructuredName;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/StructuredName;

    return-object v0
.end method

.method public getStructuredNames()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/StructuredName;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1003
    const-class v0, Lezvcard/property/StructuredName;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTelephoneNumbers()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Telephone;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2457
    const-class v0, Lezvcard/property/Telephone;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTimezone()Lezvcard/property/Timezone;
    .registers 2

    .prologue
    .line 2708
    const-class v0, Lezvcard/property/Timezone;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Timezone;

    return-object v0
.end method

.method public getTimezones()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Timezone;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2692
    const-class v0, Lezvcard/property/Timezone;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTitles()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Title;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1333
    const-class v0, Lezvcard/property/Title;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getUid()Lezvcard/property/Uid;
    .registers 2

    .prologue
    .line 3461
    const-class v0, Lezvcard/property/Uid;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperty(Ljava/lang/Class;)Lezvcard/property/VCardProperty;

    move-result-object v0

    check-cast v0, Lezvcard/property/Uid;

    return-object v0
.end method

.method public getUrls()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Url;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2599
    const-class v0, Lezvcard/property/Url;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getVersion()Lezvcard/VCardVersion;
    .registers 2

    .prologue
    .line 418
    iget-object v0, p0, Lezvcard/VCard;->version:Lezvcard/VCardVersion;

    return-object v0
.end method

.method public getXmls()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Xml;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4008
    const-class v0, Lezvcard/property/Xml;

    invoke-virtual {p0, v0}, Lezvcard/VCard;->getProperties(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lezvcard/property/VCardProperty;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4426
    iget-object v0, p0, Lezvcard/VCard;->properties:Lezvcard/util/ListMultimap;

    invoke-virtual {v0}, Lezvcard/util/ListMultimap;->values()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public removeExtendedProperty(Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 4601
    invoke-virtual {p0, p1}, Lezvcard/VCard;->getExtendedProperties(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 4602
    .local v1, "xproperties":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/RawProperty;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lezvcard/property/RawProperty;

    .line 4603
    .local v2, "xproperty":Lezvcard/property/RawProperty;
    iget-object v3, p0, Lezvcard/VCard;->properties:Lezvcard/util/ListMultimap;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Lezvcard/util/ListMultimap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_8

    .line 4605
    .end local v2    # "xproperty":Lezvcard/property/RawProperty;
    :cond_1e
    return-void
.end method

.method public removeProperties(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lezvcard/property/VCardProperty;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4528
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lezvcard/property/VCardProperty;>;"
    iget-object v0, p0, Lezvcard/VCard;->properties:Lezvcard/util/ListMultimap;

    invoke-virtual {v0, p1}, Lezvcard/util/ListMultimap;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    .line 4529
    return-void
.end method

.method public removeProperty(Lezvcard/property/VCardProperty;)V
    .registers 4
    .param p1, "property"    # Lezvcard/property/VCardProperty;

    .prologue
    .line 4520
    iget-object v0, p0, Lezvcard/VCard;->properties:Lezvcard/util/ListMultimap;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lezvcard/util/ListMultimap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4521
    return-void
.end method

.method public setAgent(Lezvcard/property/Agent;)V
    .registers 3
    .param p1, "agent"    # Lezvcard/property/Agent;

    .prologue
    .line 3361
    const-class v0, Lezvcard/property/Agent;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 3362
    return-void
.end method

.method public setAnniversary(Lezvcard/property/Anniversary;)V
    .registers 3
    .param p1, "anniversary"    # Lezvcard/property/Anniversary;

    .prologue
    .line 2153
    const-class v0, Lezvcard/property/Anniversary;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 2154
    return-void
.end method

.method public setAnniversaryAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Anniversary;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2118
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Anniversary;>;"
    const-class v0, Lezvcard/property/Anniversary;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 2119
    return-void
.end method

.method public varargs setAnniversaryAlt([Lezvcard/property/Anniversary;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Anniversary;

    .prologue
    .line 2137
    const-class v0, Lezvcard/property/Anniversary;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 2138
    return-void
.end method

.method public setBirthday(Lezvcard/property/Birthday;)V
    .registers 3
    .param p1, "birthday"    # Lezvcard/property/Birthday;

    .prologue
    .line 2065
    const-class v0, Lezvcard/property/Birthday;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 2066
    return-void
.end method

.method public setBirthdayAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Birthday;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2029
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Birthday;>;"
    const-class v0, Lezvcard/property/Birthday;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 2030
    return-void
.end method

.method public varargs setBirthdayAlt([Lezvcard/property/Birthday;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Birthday;

    .prologue
    .line 2049
    const-class v0, Lezvcard/property/Birthday;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 2050
    return-void
.end method

.method public setBirthplace(Lezvcard/property/Birthplace;)V
    .registers 3
    .param p1, "birthplace"    # Lezvcard/property/Birthplace;

    .prologue
    .line 1790
    const-class v0, Lezvcard/property/Birthplace;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 1791
    return-void
.end method

.method public setBirthplaceAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Birthplace;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1753
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Birthplace;>;"
    const-class v0, Lezvcard/property/Birthplace;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 1754
    return-void
.end method

.method public varargs setBirthplaceAlt([Lezvcard/property/Birthplace;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Birthplace;

    .prologue
    .line 1773
    const-class v0, Lezvcard/property/Birthplace;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 1774
    return-void
.end method

.method public varargs setCategories([Ljava/lang/String;)Lezvcard/property/Categories;
    .registers 7
    .param p1, "categories"    # [Ljava/lang/String;

    .prologue
    .line 3325
    const/4 v4, 0x0

    .line 3326
    .local v4, "type":Lezvcard/property/Categories;
    if-eqz p1, :cond_15

    .line 3327
    new-instance v4, Lezvcard/property/Categories;

    .end local v4    # "type":Lezvcard/property/Categories;
    invoke-direct {v4}, Lezvcard/property/Categories;-><init>()V

    .line 3328
    .restart local v4    # "type":Lezvcard/property/Categories;
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_b
    if-ge v2, v3, :cond_15

    aget-object v1, v0, v2

    .line 3329
    .local v1, "category":Ljava/lang/String;
    invoke-virtual {v4, v1}, Lezvcard/property/Categories;->addValue(Ljava/lang/Object;)V

    .line 3328
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 3332
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "category":Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_15
    invoke-virtual {p0, v4}, Lezvcard/VCard;->setCategories(Lezvcard/property/Categories;)V

    .line 3333
    return-object v4
.end method

.method public setCategories(Lezvcard/property/Categories;)V
    .registers 3
    .param p1, "categories"    # Lezvcard/property/Categories;

    .prologue
    .line 3285
    const-class v0, Lezvcard/property/Categories;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 3286
    return-void
.end method

.method public setCategoriesAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Categories;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3207
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Categories;>;"
    const-class v0, Lezvcard/property/Categories;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3208
    return-void
.end method

.method public varargs setCategoriesAlt([Lezvcard/property/Categories;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Categories;

    .prologue
    .line 3227
    const-class v0, Lezvcard/property/Categories;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3228
    return-void
.end method

.method public setClassification(Ljava/lang/String;)Lezvcard/property/Classification;
    .registers 3
    .param p1, "classification"    # Ljava/lang/String;

    .prologue
    .line 658
    const/4 v0, 0x0

    .line 659
    .local v0, "type":Lezvcard/property/Classification;
    if-eqz p1, :cond_8

    .line 660
    new-instance v0, Lezvcard/property/Classification;

    .end local v0    # "type":Lezvcard/property/Classification;
    invoke-direct {v0, p1}, Lezvcard/property/Classification;-><init>(Ljava/lang/String;)V

    .line 662
    .restart local v0    # "type":Lezvcard/property/Classification;
    :cond_8
    invoke-virtual {p0, v0}, Lezvcard/VCard;->setClassification(Lezvcard/property/Classification;)V

    .line 663
    return-object v0
.end method

.method public setClassification(Lezvcard/property/Classification;)V
    .registers 3
    .param p1, "classification"    # Lezvcard/property/Classification;

    .prologue
    .line 638
    const-class v0, Lezvcard/property/Classification;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 639
    return-void
.end method

.method public setDeathdate(Lezvcard/property/Deathdate;)V
    .registers 3
    .param p1, "deathdate"    # Lezvcard/property/Deathdate;

    .prologue
    .line 1974
    const-class v0, Lezvcard/property/Deathdate;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 1975
    return-void
.end method

.method public setDeathdateAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Deathdate;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1938
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Deathdate;>;"
    const-class v0, Lezvcard/property/Deathdate;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 1939
    return-void
.end method

.method public varargs setDeathdateAlt([Lezvcard/property/Deathdate;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Deathdate;

    .prologue
    .line 1957
    const-class v0, Lezvcard/property/Deathdate;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 1958
    return-void
.end method

.method public setDeathplace(Lezvcard/property/Deathplace;)V
    .registers 3
    .param p1, "deathplace"    # Lezvcard/property/Deathplace;

    .prologue
    .line 1883
    const-class v0, Lezvcard/property/Deathplace;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 1884
    return-void
.end method

.method public setDeathplaceAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Deathplace;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1846
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Deathplace;>;"
    const-class v0, Lezvcard/property/Deathplace;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 1847
    return-void
.end method

.method public varargs setDeathplaceAlt([Lezvcard/property/Deathplace;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Deathplace;

    .prologue
    .line 1866
    const-class v0, Lezvcard/property/Deathplace;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 1867
    return-void
.end method

.method public setExtendedProperty(Ljava/lang/String;Ljava/lang/String;)Lezvcard/property/RawProperty;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 4590
    invoke-virtual {p0, p1}, Lezvcard/VCard;->removeExtendedProperty(Ljava/lang/String;)V

    .line 4591
    new-instance v0, Lezvcard/property/RawProperty;

    invoke-direct {v0, p1, p2}, Lezvcard/property/RawProperty;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4592
    .local v0, "raw":Lezvcard/property/RawProperty;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 4593
    return-object v0
.end method

.method public setFormattedName(Ljava/lang/String;)Lezvcard/property/FormattedName;
    .registers 3
    .param p1, "formattedName"    # Ljava/lang/String;

    .prologue
    .line 979
    const/4 v0, 0x0

    .line 980
    .local v0, "type":Lezvcard/property/FormattedName;
    if-eqz p1, :cond_8

    .line 981
    new-instance v0, Lezvcard/property/FormattedName;

    .end local v0    # "type":Lezvcard/property/FormattedName;
    invoke-direct {v0, p1}, Lezvcard/property/FormattedName;-><init>(Ljava/lang/String;)V

    .line 983
    .restart local v0    # "type":Lezvcard/property/FormattedName;
    :cond_8
    invoke-virtual {p0, v0}, Lezvcard/VCard;->setFormattedName(Lezvcard/property/FormattedName;)V

    .line 984
    return-object v0
.end method

.method public setFormattedName(Lezvcard/property/FormattedName;)V
    .registers 3
    .param p1, "formattedName"    # Lezvcard/property/FormattedName;

    .prologue
    .line 942
    const-class v0, Lezvcard/property/FormattedName;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 943
    return-void
.end method

.method public setFormattedNameAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/FormattedName;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 858
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/FormattedName;>;"
    const-class v0, Lezvcard/property/FormattedName;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 859
    return-void
.end method

.method public varargs setFormattedNameAlt([Lezvcard/property/FormattedName;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/FormattedName;

    .prologue
    .line 878
    const-class v0, Lezvcard/property/FormattedName;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 879
    return-void
.end method

.method public setGender(Lezvcard/property/Gender;)V
    .registers 3
    .param p1, "gender"    # Lezvcard/property/Gender;

    .prologue
    .line 486
    const-class v0, Lezvcard/property/Gender;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 487
    return-void
.end method

.method public setGeo(DD)Lezvcard/property/Geo;
    .registers 8
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .prologue
    .line 2970
    new-instance v0, Lezvcard/property/Geo;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lezvcard/property/Geo;-><init>(Ljava/lang/Double;Ljava/lang/Double;)V

    .line 2971
    .local v0, "type":Lezvcard/property/Geo;
    invoke-virtual {p0, v0}, Lezvcard/VCard;->setGeo(Lezvcard/property/Geo;)V

    .line 2972
    return-object v0
.end method

.method public setGeo(Lezvcard/property/Geo;)V
    .registers 3
    .param p1, "geo"    # Lezvcard/property/Geo;

    .prologue
    .line 2933
    const-class v0, Lezvcard/property/Geo;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 2934
    return-void
.end method

.method public setGeoAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Geo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2877
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Geo;>;"
    const-class v0, Lezvcard/property/Geo;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 2878
    return-void
.end method

.method public setKind(Lezvcard/property/Kind;)V
    .registers 3
    .param p1, "kind"    # Lezvcard/property/Kind;

    .prologue
    .line 458
    const-class v0, Lezvcard/property/Kind;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 459
    return-void
.end method

.method public setMailer(Ljava/lang/String;)Lezvcard/property/Mailer;
    .registers 3
    .param p1, "mailer"    # Ljava/lang/String;

    .prologue
    .line 2579
    const/4 v0, 0x0

    .line 2580
    .local v0, "type":Lezvcard/property/Mailer;
    if-eqz p1, :cond_8

    .line 2581
    new-instance v0, Lezvcard/property/Mailer;

    .end local v0    # "type":Lezvcard/property/Mailer;
    invoke-direct {v0, p1}, Lezvcard/property/Mailer;-><init>(Ljava/lang/String;)V

    .line 2583
    .restart local v0    # "type":Lezvcard/property/Mailer;
    :cond_8
    invoke-virtual {p0, v0}, Lezvcard/VCard;->setMailer(Lezvcard/property/Mailer;)V

    .line 2584
    return-object v0
.end method

.method public setMailer(Lezvcard/property/Mailer;)V
    .registers 3
    .param p1, "mailer"    # Lezvcard/property/Mailer;

    .prologue
    .line 2563
    const-class v0, Lezvcard/property/Mailer;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 2564
    return-void
.end method

.method public varargs setNickname([Ljava/lang/String;)Lezvcard/property/Nickname;
    .registers 7
    .param p1, "nicknames"    # [Ljava/lang/String;

    .prologue
    .line 1243
    const/4 v4, 0x0

    .line 1244
    .local v4, "type":Lezvcard/property/Nickname;
    if-eqz p1, :cond_15

    .line 1245
    new-instance v4, Lezvcard/property/Nickname;

    .end local v4    # "type":Lezvcard/property/Nickname;
    invoke-direct {v4}, Lezvcard/property/Nickname;-><init>()V

    .line 1246
    .restart local v4    # "type":Lezvcard/property/Nickname;
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_b
    if-ge v1, v2, :cond_15

    aget-object v3, v0, v1

    .line 1247
    .local v3, "nickname":Ljava/lang/String;
    invoke-virtual {v4, v3}, Lezvcard/property/Nickname;->addValue(Ljava/lang/Object;)V

    .line 1246
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 1250
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "nickname":Ljava/lang/String;
    :cond_15
    invoke-virtual {p0, v4}, Lezvcard/VCard;->setNickname(Lezvcard/property/Nickname;)V

    .line 1251
    return-object v4
.end method

.method public setNickname(Lezvcard/property/Nickname;)V
    .registers 3
    .param p1, "nickname"    # Lezvcard/property/Nickname;

    .prologue
    .line 1206
    const-class v0, Lezvcard/property/Nickname;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 1207
    return-void
.end method

.method public setNicknameAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Nickname;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1129
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Nickname;>;"
    const-class v0, Lezvcard/property/Nickname;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 1130
    return-void
.end method

.method public varargs setNicknameAlt([Lezvcard/property/Nickname;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Nickname;

    .prologue
    .line 1149
    const-class v0, Lezvcard/property/Nickname;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 1150
    return-void
.end method

.method public varargs setOrganization([Ljava/lang/String;)Lezvcard/property/Organization;
    .registers 7
    .param p1, "departments"    # [Ljava/lang/String;

    .prologue
    .line 3142
    const/4 v4, 0x0

    .line 3143
    .local v4, "type":Lezvcard/property/Organization;
    if-eqz p1, :cond_15

    .line 3144
    new-instance v4, Lezvcard/property/Organization;

    .end local v4    # "type":Lezvcard/property/Organization;
    invoke-direct {v4}, Lezvcard/property/Organization;-><init>()V

    .line 3145
    .restart local v4    # "type":Lezvcard/property/Organization;
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_b
    if-ge v2, v3, :cond_15

    aget-object v1, v0, v2

    .line 3146
    .local v1, "department":Ljava/lang/String;
    invoke-virtual {v4, v1}, Lezvcard/property/Organization;->addValue(Ljava/lang/Object;)V

    .line 3145
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 3149
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "department":Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_15
    invoke-virtual {p0, v4}, Lezvcard/VCard;->setOrganization(Lezvcard/property/Organization;)V

    .line 3150
    return-object v4
.end method

.method public setOrganization(Lezvcard/property/Organization;)V
    .registers 3
    .param p1, "organization"    # Lezvcard/property/Organization;

    .prologue
    .line 3104
    const-class v0, Lezvcard/property/Organization;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 3105
    return-void
.end method

.method public setOrganizationAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Organization;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3028
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Organization;>;"
    const-class v0, Lezvcard/property/Organization;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 3029
    return-void
.end method

.method public varargs setOrganizationAlt([Lezvcard/property/Organization;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Organization;

    .prologue
    .line 3048
    const-class v0, Lezvcard/property/Organization;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 3049
    return-void
.end method

.method public setProductId(Ljava/lang/String;)Lezvcard/property/ProductId;
    .registers 3
    .param p1, "productId"    # Ljava/lang/String;

    .prologue
    .line 2248
    const/4 v0, 0x0

    .line 2249
    .local v0, "type":Lezvcard/property/ProductId;
    if-eqz p1, :cond_8

    .line 2250
    new-instance v0, Lezvcard/property/ProductId;

    .end local v0    # "type":Lezvcard/property/ProductId;
    invoke-direct {v0, p1}, Lezvcard/property/ProductId;-><init>(Ljava/lang/String;)V

    .line 2252
    .restart local v0    # "type":Lezvcard/property/ProductId;
    :cond_8
    invoke-virtual {p0, v0}, Lezvcard/VCard;->setProductId(Lezvcard/property/ProductId;)V

    .line 2253
    return-object v0
.end method

.method public setProductId(Lezvcard/property/ProductId;)V
    .registers 3
    .param p1, "productId"    # Lezvcard/property/ProductId;

    .prologue
    .line 2232
    const-class v0, Lezvcard/property/ProductId;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 2233
    return-void
.end method

.method public setProfile(Lezvcard/property/Profile;)V
    .registers 3
    .param p1, "profile"    # Lezvcard/property/Profile;

    .prologue
    .line 608
    const-class v0, Lezvcard/property/Profile;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 609
    return-void
.end method

.method public setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lezvcard/property/VCardProperty;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 4512
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "property":Lezvcard/property/VCardProperty;, "TT;"
    iget-object v0, p0, Lezvcard/VCard;->properties:Lezvcard/util/ListMultimap;

    invoke-virtual {v0, p1, p2}, Lezvcard/util/ListMultimap;->replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;

    .line 4513
    return-void
.end method

.method public setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lezvcard/property/VCardProperty;",
            ":",
            "Lezvcard/property/HasAltId;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/util/Collection",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 4660
    .local p1, "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    invoke-virtual {p0, p1}, Lezvcard/VCard;->removeProperties(Ljava/lang/Class;)V

    .line 4661
    invoke-virtual {p0, p1, p2}, Lezvcard/VCard;->addPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 4662
    return-void
.end method

.method public varargs setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lezvcard/property/VCardProperty;",
            ":",
            "Lezvcard/property/HasAltId;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;[TT;)V"
        }
    .end annotation

    .prologue
    .line 4647
    .local p1, "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "altRepresentations":[Lezvcard/property/VCardProperty;, "[TT;"
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 4648
    return-void
.end method

.method public setRevision(Ljava/util/Date;)Lezvcard/property/Revision;
    .registers 3
    .param p1, "rev"    # Ljava/util/Date;

    .prologue
    .line 2197
    const/4 v0, 0x0

    .line 2198
    .local v0, "type":Lezvcard/property/Revision;
    if-eqz p1, :cond_8

    .line 2199
    new-instance v0, Lezvcard/property/Revision;

    .end local v0    # "type":Lezvcard/property/Revision;
    invoke-direct {v0, p1}, Lezvcard/property/Revision;-><init>(Ljava/util/Date;)V

    .line 2201
    .restart local v0    # "type":Lezvcard/property/Revision;
    :cond_8
    invoke-virtual {p0, v0}, Lezvcard/VCard;->setRevision(Lezvcard/property/Revision;)V

    .line 2202
    return-object v0
.end method

.method public setRevision(Lezvcard/property/Revision;)V
    .registers 3
    .param p1, "rev"    # Lezvcard/property/Revision;

    .prologue
    .line 2181
    const-class v0, Lezvcard/property/Revision;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 2182
    return-void
.end method

.method public setSortString(Ljava/lang/String;)Lezvcard/property/SortString;
    .registers 3
    .param p1, "sortString"    # Ljava/lang/String;

    .prologue
    .line 1314
    const/4 v0, 0x0

    .line 1315
    .local v0, "type":Lezvcard/property/SortString;
    if-eqz p1, :cond_8

    .line 1316
    new-instance v0, Lezvcard/property/SortString;

    .end local v0    # "type":Lezvcard/property/SortString;
    invoke-direct {v0, p1}, Lezvcard/property/SortString;-><init>(Ljava/lang/String;)V

    .line 1318
    .restart local v0    # "type":Lezvcard/property/SortString;
    :cond_8
    invoke-virtual {p0, v0}, Lezvcard/VCard;->setSortString(Lezvcard/property/SortString;)V

    .line 1319
    return-object v0
.end method

.method public setSortString(Lezvcard/property/SortString;)V
    .registers 3
    .param p1, "sortString"    # Lezvcard/property/SortString;

    .prologue
    .line 1291
    const-class v0, Lezvcard/property/SortString;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 1292
    return-void
.end method

.method public setSourceDisplayText(Ljava/lang/String;)Lezvcard/property/SourceDisplayText;
    .registers 3
    .param p1, "sourceDisplayText"    # Ljava/lang/String;

    .prologue
    .line 797
    const/4 v0, 0x0

    .line 798
    .local v0, "type":Lezvcard/property/SourceDisplayText;
    if-eqz p1, :cond_8

    .line 799
    new-instance v0, Lezvcard/property/SourceDisplayText;

    .end local v0    # "type":Lezvcard/property/SourceDisplayText;
    invoke-direct {v0, p1}, Lezvcard/property/SourceDisplayText;-><init>(Ljava/lang/String;)V

    .line 801
    .restart local v0    # "type":Lezvcard/property/SourceDisplayText;
    :cond_8
    invoke-virtual {p0, v0}, Lezvcard/VCard;->setSourceDisplayText(Lezvcard/property/SourceDisplayText;)V

    .line 802
    return-object v0
.end method

.method public setSourceDisplayText(Lezvcard/property/SourceDisplayText;)V
    .registers 3
    .param p1, "sourceDisplayText"    # Lezvcard/property/SourceDisplayText;

    .prologue
    .line 780
    const-class v0, Lezvcard/property/SourceDisplayText;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 781
    return-void
.end method

.method public setStructuredName(Lezvcard/property/StructuredName;)V
    .registers 3
    .param p1, "structuredName"    # Lezvcard/property/StructuredName;

    .prologue
    .line 1074
    const-class v0, Lezvcard/property/StructuredName;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 1075
    return-void
.end method

.method public setStructuredNameAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/StructuredName;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1039
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/StructuredName;>;"
    const-class v0, Lezvcard/property/StructuredName;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 1040
    return-void
.end method

.method public varargs setStructuredNameAlt([Lezvcard/property/StructuredName;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/StructuredName;

    .prologue
    .line 1059
    const-class v0, Lezvcard/property/StructuredName;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 1060
    return-void
.end method

.method public setTimezone(Lezvcard/property/Timezone;)V
    .registers 3
    .param p1, "timezone"    # Lezvcard/property/Timezone;

    .prologue
    .line 2804
    const-class v0, Lezvcard/property/Timezone;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 2805
    return-void
.end method

.method public setTimezoneAlt(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/property/Timezone;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2728
    .local p1, "altRepresentations":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/property/Timezone;>;"
    const-class v0, Lezvcard/property/Timezone;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;Ljava/util/Collection;)V

    .line 2729
    return-void
.end method

.method public varargs setTimezoneAlt([Lezvcard/property/Timezone;)V
    .registers 3
    .param p1, "altRepresentations"    # [Lezvcard/property/Timezone;

    .prologue
    .line 2748
    const-class v0, Lezvcard/property/Timezone;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setPropertyAlt(Ljava/lang/Class;[Lezvcard/property/VCardProperty;)V

    .line 2749
    return-void
.end method

.method public setUid(Lezvcard/property/Uid;)V
    .registers 3
    .param p1, "uid"    # Lezvcard/property/Uid;

    .prologue
    .line 3475
    const-class v0, Lezvcard/property/Uid;

    invoke-virtual {p0, v0, p1}, Lezvcard/VCard;->setProperty(Ljava/lang/Class;Lezvcard/property/VCardProperty;)V

    .line 3476
    return-void
.end method

.method public setVersion(Lezvcard/VCardVersion;)V
    .registers 2
    .param p1, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 430
    iput-object p1, p0, Lezvcard/VCard;->version:Lezvcard/VCardVersion;

    .line 431
    return-void
.end method

.method public validate(Lezvcard/VCardVersion;)Lezvcard/ValidationWarnings;
    .registers 10
    .param p1, "version"    # Lezvcard/VCardVersion;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 4676
    new-instance v3, Lezvcard/ValidationWarnings;

    invoke-direct {v3}, Lezvcard/ValidationWarnings;-><init>()V

    .line 4679
    .local v3, "warnings":Lezvcard/ValidationWarnings;
    invoke-virtual {p0}, Lezvcard/VCard;->getStructuredName()Lezvcard/property/StructuredName;

    move-result-object v4

    if-nez v4, :cond_1f

    sget-object v4, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    if-eq p1, v4, :cond_15

    sget-object v4, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    if-ne p1, v4, :cond_1f

    .line 4680
    :cond_15
    new-instance v4, Lezvcard/Warning;

    new-array v5, v6, [Ljava/lang/Object;

    invoke-direct {v4, v6, v5}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-virtual {v3, v7, v4}, Lezvcard/ValidationWarnings;->add(Lezvcard/property/VCardProperty;Lezvcard/Warning;)V

    .line 4682
    :cond_1f
    invoke-virtual {p0}, Lezvcard/VCard;->getFormattedName()Lezvcard/property/FormattedName;

    move-result-object v4

    if-nez v4, :cond_38

    sget-object v4, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    if-eq p1, v4, :cond_2d

    sget-object v4, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    if-ne p1, v4, :cond_38

    .line 4683
    :cond_2d
    new-instance v4, Lezvcard/Warning;

    const/4 v5, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    invoke-direct {v4, v5, v6}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-virtual {v3, v7, v4}, Lezvcard/ValidationWarnings;->add(Lezvcard/property/VCardProperty;Lezvcard/Warning;)V

    .line 4687
    :cond_38
    invoke-virtual {p0}, Lezvcard/VCard;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_3c
    :goto_3c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_56

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lezvcard/property/VCardProperty;

    .line 4688
    .local v2, "property":Lezvcard/property/VCardProperty;
    invoke-virtual {v2, p1, p0}, Lezvcard/property/VCardProperty;->validate(Lezvcard/VCardVersion;Lezvcard/VCard;)Ljava/util/List;

    move-result-object v1

    .line 4689
    .local v1, "propWarnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3c

    .line 4690
    invoke-virtual {v3, v2, v1}, Lezvcard/ValidationWarnings;->add(Lezvcard/property/VCardProperty;Ljava/util/List;)V

    goto :goto_3c

    .line 4694
    .end local v1    # "propWarnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    .end local v2    # "property":Lezvcard/property/VCardProperty;
    :cond_56
    return-object v3
.end method

.method public write()Ljava/lang/String;
    .registers 3

    .prologue
    .line 135
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->write([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainText;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/Ezvcard$WriterChainText;->go()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljava/io/File;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->write([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainText;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainText;->go(Ljava/io/File;)V

    .line 160
    return-void
.end method

.method public write(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->write([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainText;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainText;->go(Ljava/io/OutputStream;)V

    .line 184
    return-void
.end method

.method public write(Ljava/io/Writer;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->write([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainText;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainText;->go(Ljava/io/Writer;)V

    .line 208
    return-void
.end method

.method public writeHtml()Ljava/lang/String;
    .registers 3

    .prologue
    .line 292
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeHtml([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainHtml;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/Ezvcard$WriterChainHtml;->go()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeHtml(Ljava/io/File;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 309
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeHtml([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainHtml;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainHtml;->go(Ljava/io/File;)V

    .line 310
    return-void
.end method

.method public writeHtml(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeHtml([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainHtml;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainHtml;->go(Ljava/io/OutputStream;)V

    .line 327
    return-void
.end method

.method public writeHtml(Ljava/io/Writer;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 343
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeHtml([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainHtml;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainHtml;->go(Ljava/io/Writer;)V

    .line 344
    return-void
.end method

.method public writeJson()Ljava/lang/String;
    .registers 3

    .prologue
    .line 359
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeJson([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainJson;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/Ezvcard$WriterChainJson;->go()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeJson(Ljava/io/File;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 376
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeJson([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainJson;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainJson;->go(Ljava/io/File;)V

    .line 377
    return-void
.end method

.method public writeJson(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 393
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeJson([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainJson;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainJson;->go(Ljava/io/OutputStream;)V

    .line 394
    return-void
.end method

.method public writeJson(Ljava/io/Writer;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 410
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeJson([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainJson;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainJson;->go(Ljava/io/Writer;)V

    .line 411
    return-void
.end method

.method public writeXml()Ljava/lang/String;
    .registers 3

    .prologue
    .line 223
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeXml([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainXml;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lezvcard/Ezvcard$WriterChainXml;->indent(I)Lezvcard/Ezvcard$WriterChainXml;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/Ezvcard$WriterChainXml;->go()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeXml(Ljava/io/File;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 241
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeXml([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainXml;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lezvcard/Ezvcard$WriterChainXml;->indent(I)Lezvcard/Ezvcard$WriterChainXml;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainXml;->go(Ljava/io/File;)V

    .line 242
    return-void
.end method

.method public writeXml(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 259
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeXml([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainXml;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lezvcard/Ezvcard$WriterChainXml;->indent(I)Lezvcard/Ezvcard$WriterChainXml;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainXml;->go(Ljava/io/OutputStream;)V

    .line 260
    return-void
.end method

.method public writeXml(Ljava/io/Writer;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 276
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/VCard;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0}, Lezvcard/Ezvcard;->writeXml([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainXml;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lezvcard/Ezvcard$WriterChainXml;->indent(I)Lezvcard/Ezvcard$WriterChainXml;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/Ezvcard$WriterChainXml;->go(Ljava/io/Writer;)V

    .line 277
    return-void
.end method
