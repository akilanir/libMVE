.class public Lezvcard/property/Classification;
.super Lezvcard/property/TextProperty;
.source "Classification.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "classValue"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lezvcard/property/TextProperty;-><init>(Ljava/lang/String;)V

    .line 69
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
    .line 73
    sget-object v0, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method
