.class public Lezvcard/property/SourceDisplayText;
.super Lezvcard/property/TextProperty;
.source "SourceDisplayText.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "displayText"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lezvcard/property/TextProperty;-><init>(Ljava/lang/String;)V

    .line 68
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
    .line 72
    sget-object v0, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method
