.class Lcom/github/zafarkhaja/semver/MetadataVersion$NullMetadataVersion;
.super Lcom/github/zafarkhaja/semver/MetadataVersion;
.source "MetadataVersion.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/zafarkhaja/semver/MetadataVersion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NullMetadataVersion"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/github/zafarkhaja/semver/MetadataVersion;-><init>([Ljava/lang/String;)V

    .line 52
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/github/zafarkhaja/semver/MetadataVersion;)I
    .registers 3
    .param p1, "other"    # Lcom/github/zafarkhaja/semver/MetadataVersion;

    .prologue
    .line 91
    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/MetadataVersion$NullMetadataVersion;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 96
    const/4 v0, 0x1

    .line 98
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 45
    check-cast p1, Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/MetadataVersion$NullMetadataVersion;->compareTo(Lcom/github/zafarkhaja/semver/MetadataVersion;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 83
    instance-of v0, p1, Lcom/github/zafarkhaja/semver/MetadataVersion$NullMetadataVersion;

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 75
    const/4 v0, 0x0

    return v0
.end method

.method increment()Lcom/github/zafarkhaja/semver/MetadataVersion;
    .registers 3

    .prologue
    .line 59
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Metadata version is NULL"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    const-string v0, ""

    return-object v0
.end method
