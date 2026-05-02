.class public Lezvcard/property/Deathdate;
.super Lezvcard/property/DateOrTimeProperty;
.source "Deathdate.java"


# direct methods
.method public constructor <init>(Lezvcard/util/PartialDate;)V
    .registers 2
    .param p1, "partialDate"    # Lezvcard/util/PartialDate;

    .prologue
    .line 128
    invoke-direct {p0, p1}, Lezvcard/property/DateOrTimeProperty;-><init>(Lezvcard/util/PartialDate;)V

    .line 129
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 136
    invoke-direct {p0, p1}, Lezvcard/property/DateOrTimeProperty;-><init>(Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .registers 2
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 110
    invoke-direct {p0, p1}, Lezvcard/property/DateOrTimeProperty;-><init>(Ljava/util/Date;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Z)V
    .registers 3
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "hasTime"    # Z

    .prologue
    .line 120
    invoke-direct {p0, p1, p2}, Lezvcard/property/DateOrTimeProperty;-><init>(Ljava/util/Date;Z)V

    .line 121
    return-void
.end method


# virtual methods
.method public _supportedVersions()Ljava/util/Set;
    .registers 2
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
    .line 141
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 146
    invoke-super {p0}, Lezvcard/property/DateOrTimeProperty;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 151
    invoke-super {p0, p1}, Lezvcard/property/DateOrTimeProperty;->setLanguage(Ljava/lang/String;)V

    .line 152
    return-void
.end method
