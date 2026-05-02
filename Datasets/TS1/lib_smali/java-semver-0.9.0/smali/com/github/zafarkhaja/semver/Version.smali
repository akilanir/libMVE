.class public Lcom/github/zafarkhaja/semver/Version;
.super Ljava/lang/Object;
.source "Version.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/zafarkhaja/semver/Version$1;,
        Lcom/github/zafarkhaja/semver/Version$BuildAwareOrder;,
        Lcom/github/zafarkhaja/semver/Version$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/github/zafarkhaja/semver/Version;",
        ">;"
    }
.end annotation


# static fields
.field public static final BUILD_AWARE_ORDER:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/github/zafarkhaja/semver/Version;",
            ">;"
        }
    .end annotation
.end field

.field private static final BUILD_PREFIX:Ljava/lang/String; = "+"

.field private static final PRE_RELEASE_PREFIX:Ljava/lang/String; = "-"


# instance fields
.field private final build:Lcom/github/zafarkhaja/semver/MetadataVersion;

.field private final normal:Lcom/github/zafarkhaja/semver/NormalVersion;

.field private final preRelease:Lcom/github/zafarkhaja/semver/MetadataVersion;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 175
    new-instance v0, Lcom/github/zafarkhaja/semver/Version$BuildAwareOrder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/Version$BuildAwareOrder;-><init>(Lcom/github/zafarkhaja/semver/Version$1;)V

    sput-object v0, Lcom/github/zafarkhaja/semver/Version;->BUILD_AWARE_ORDER:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>(Lcom/github/zafarkhaja/semver/NormalVersion;)V
    .registers 4
    .param p1, "normal"    # Lcom/github/zafarkhaja/semver/NormalVersion;

    .prologue
    .line 222
    sget-object v0, Lcom/github/zafarkhaja/semver/MetadataVersion;->NULL:Lcom/github/zafarkhaja/semver/MetadataVersion;

    sget-object v1, Lcom/github/zafarkhaja/semver/MetadataVersion;->NULL:Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-direct {p0, p1, v0, v1}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V

    .line 223
    return-void
.end method

.method constructor <init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V
    .registers 4
    .param p1, "normal"    # Lcom/github/zafarkhaja/semver/NormalVersion;
    .param p2, "preRelease"    # Lcom/github/zafarkhaja/semver/MetadataVersion;

    .prologue
    .line 233
    sget-object v0, Lcom/github/zafarkhaja/semver/MetadataVersion;->NULL:Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-direct {p0, p1, p2, v0}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V

    .line 234
    return-void
.end method

.method constructor <init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V
    .registers 4
    .param p1, "normal"    # Lcom/github/zafarkhaja/semver/NormalVersion;
    .param p2, "preRelease"    # Lcom/github/zafarkhaja/semver/MetadataVersion;
    .param p3, "build"    # Lcom/github/zafarkhaja/semver/MetadataVersion;

    .prologue
    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 249
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    .line 250
    iput-object p2, p0, Lcom/github/zafarkhaja/semver/Version;->preRelease:Lcom/github/zafarkhaja/semver/MetadataVersion;

    .line 251
    iput-object p3, p0, Lcom/github/zafarkhaja/semver/Version;->build:Lcom/github/zafarkhaja/semver/MetadataVersion;

    .line 252
    return-void
.end method

.method static synthetic access$100(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/MetadataVersion;
    .registers 2
    .param p0, "x0"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/Version;->build:Lcom/github/zafarkhaja/semver/MetadataVersion;

    return-object v0
.end method

.method public static forIntegers(I)Lcom/github/zafarkhaja/semver/Version;
    .registers 4
    .param p0, "major"    # I

    .prologue
    const/4 v2, 0x0

    .line 278
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    new-instance v1, Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-direct {v1, p0, v2, v2}, Lcom/github/zafarkhaja/semver/NormalVersion;-><init>(III)V

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;)V

    return-object v0
.end method

.method public static forIntegers(II)Lcom/github/zafarkhaja/semver/Version;
    .registers 5
    .param p0, "major"    # I
    .param p1, "minor"    # I

    .prologue
    .line 292
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    new-instance v1, Lcom/github/zafarkhaja/semver/NormalVersion;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/github/zafarkhaja/semver/NormalVersion;-><init>(III)V

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;)V

    return-object v0
.end method

.method public static forIntegers(III)Lcom/github/zafarkhaja/semver/Version;
    .registers 5
    .param p0, "major"    # I
    .param p1, "minor"    # I
    .param p2, "patch"    # I

    .prologue
    .line 307
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    new-instance v1, Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-direct {v1, p0, p1, p2}, Lcom/github/zafarkhaja/semver/NormalVersion;-><init>(III)V

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;)V

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;
    .registers 2
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 265
    invoke-static {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->parseValidSemVer(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public compareTo(Lcom/github/zafarkhaja/semver/Version;)I
    .registers 5
    .param p1, "other"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 626
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    iget-object v2, p1, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-virtual {v1, v2}, Lcom/github/zafarkhaja/semver/NormalVersion;->compareTo(Lcom/github/zafarkhaja/semver/NormalVersion;)I

    move-result v0

    .line 627
    .local v0, "result":I
    if-nez v0, :cond_12

    .line 628
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->preRelease:Lcom/github/zafarkhaja/semver/MetadataVersion;

    iget-object v2, p1, Lcom/github/zafarkhaja/semver/Version;->preRelease:Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-virtual {v1, v2}, Lcom/github/zafarkhaja/semver/MetadataVersion;->compareTo(Lcom/github/zafarkhaja/semver/MetadataVersion;)I

    move-result v0

    .line 630
    :cond_12
    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 41
    check-cast p1, Lcom/github/zafarkhaja/semver/Version;

    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/Version;->compareTo(Lcom/github/zafarkhaja/semver/Version;)I

    move-result v0

    return v0
.end method

.method public compareWithBuildsTo(Lcom/github/zafarkhaja/semver/Version;)I
    .registers 3
    .param p1, "other"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 645
    sget-object v0, Lcom/github/zafarkhaja/semver/Version;->BUILD_AWARE_ORDER:Ljava/util/Comparator;

    invoke-interface {v0, p0, p1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 575
    if-ne p0, p1, :cond_5

    .line 581
    .end local p1    # "other":Ljava/lang/Object;
    :cond_4
    :goto_4
    return v0

    .line 578
    .restart local p1    # "other":Ljava/lang/Object;
    :cond_5
    instance-of v2, p1, Lcom/github/zafarkhaja/semver/Version;

    if-nez v2, :cond_b

    move v0, v1

    .line 579
    goto :goto_4

    .line 581
    :cond_b
    check-cast p1, Lcom/github/zafarkhaja/semver/Version;

    .end local p1    # "other":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/Version;->compareTo(Lcom/github/zafarkhaja/semver/Version;)I

    move-result v2

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_4
.end method

.method public getBuildMetadata()Ljava/lang/String;
    .registers 2

    .prologue
    .line 512
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/Version;->build:Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-virtual {v0}, Lcom/github/zafarkhaja/semver/MetadataVersion;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMajorVersion()I
    .registers 2

    .prologue
    .line 467
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-virtual {v0}, Lcom/github/zafarkhaja/semver/NormalVersion;->getMajor()I

    move-result v0

    return v0
.end method

.method public getMinorVersion()I
    .registers 2

    .prologue
    .line 476
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-virtual {v0}, Lcom/github/zafarkhaja/semver/NormalVersion;->getMinor()I

    move-result v0

    return v0
.end method

.method public getNormalVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 494
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-virtual {v0}, Lcom/github/zafarkhaja/semver/NormalVersion;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPatchVersion()I
    .registers 2

    .prologue
    .line 485
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-virtual {v0}, Lcom/github/zafarkhaja/semver/NormalVersion;->getPatch()I

    move-result v0

    return v0
.end method

.method public getPreReleaseVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 503
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/Version;->preRelease:Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-virtual {v0}, Lcom/github/zafarkhaja/semver/MetadataVersion;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public greaterThan(Lcom/github/zafarkhaja/semver/Version;)Z
    .registers 3
    .param p1, "other"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 524
    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/Version;->compareTo(Lcom/github/zafarkhaja/semver/Version;)I

    move-result v0

    if-lez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public greaterThanOrEqualTo(Lcom/github/zafarkhaja/semver/Version;)Z
    .registers 3
    .param p1, "other"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 536
    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/Version;->compareTo(Lcom/github/zafarkhaja/semver/Version;)I

    move-result v0

    if-ltz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 589
    const/4 v0, 0x5

    .line 590
    .local v0, "hash":I
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-virtual {v1}, Lcom/github/zafarkhaja/semver/NormalVersion;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x1e5

    .line 591
    mul-int/lit8 v1, v0, 0x61

    iget-object v2, p0, Lcom/github/zafarkhaja/semver/Version;->preRelease:Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/MetadataVersion;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 592
    return v0
.end method

.method public incrementBuildMetadata()Lcom/github/zafarkhaja/semver/Version;
    .registers 5

    .prologue
    .line 432
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    iget-object v2, p0, Lcom/github/zafarkhaja/semver/Version;->preRelease:Lcom/github/zafarkhaja/semver/MetadataVersion;

    iget-object v3, p0, Lcom/github/zafarkhaja/semver/Version;->build:Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-virtual {v3}, Lcom/github/zafarkhaja/semver/MetadataVersion;->increment()Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V

    return-object v0
.end method

.method public incrementMajorVersion()Lcom/github/zafarkhaja/semver/Version;
    .registers 3

    .prologue
    .line 348
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-virtual {v1}, Lcom/github/zafarkhaja/semver/NormalVersion;->incrementMajor()Lcom/github/zafarkhaja/semver/NormalVersion;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;)V

    return-object v0
.end method

.method public incrementMajorVersion(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;
    .registers 5
    .param p1, "preRelease"    # Ljava/lang/String;

    .prologue
    .line 361
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    .line 362
    invoke-virtual {v1}, Lcom/github/zafarkhaja/semver/NormalVersion;->incrementMajor()Lcom/github/zafarkhaja/semver/NormalVersion;

    move-result-object v1

    .line 363
    invoke-static {p1}, Lcom/github/zafarkhaja/semver/VersionParser;->parsePreRelease(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V

    return-object v0
.end method

.method public incrementMinorVersion()Lcom/github/zafarkhaja/semver/Version;
    .registers 3

    .prologue
    .line 373
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-virtual {v1}, Lcom/github/zafarkhaja/semver/NormalVersion;->incrementMinor()Lcom/github/zafarkhaja/semver/NormalVersion;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;)V

    return-object v0
.end method

.method public incrementMinorVersion(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;
    .registers 5
    .param p1, "preRelease"    # Ljava/lang/String;

    .prologue
    .line 386
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    .line 387
    invoke-virtual {v1}, Lcom/github/zafarkhaja/semver/NormalVersion;->incrementMinor()Lcom/github/zafarkhaja/semver/NormalVersion;

    move-result-object v1

    .line 388
    invoke-static {p1}, Lcom/github/zafarkhaja/semver/VersionParser;->parsePreRelease(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V

    return-object v0
.end method

.method public incrementPatchVersion()Lcom/github/zafarkhaja/semver/Version;
    .registers 3

    .prologue
    .line 398
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-virtual {v1}, Lcom/github/zafarkhaja/semver/NormalVersion;->incrementPatch()Lcom/github/zafarkhaja/semver/NormalVersion;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;)V

    return-object v0
.end method

.method public incrementPatchVersion(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;
    .registers 5
    .param p1, "preRelease"    # Ljava/lang/String;

    .prologue
    .line 411
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    .line 412
    invoke-virtual {v1}, Lcom/github/zafarkhaja/semver/NormalVersion;->incrementPatch()Lcom/github/zafarkhaja/semver/NormalVersion;

    move-result-object v1

    .line 413
    invoke-static {p1}, Lcom/github/zafarkhaja/semver/VersionParser;->parsePreRelease(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V

    return-object v0
.end method

.method public incrementPreReleaseVersion()Lcom/github/zafarkhaja/semver/Version;
    .registers 4

    .prologue
    .line 423
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    iget-object v2, p0, Lcom/github/zafarkhaja/semver/Version;->preRelease:Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/MetadataVersion;->increment()Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V

    return-object v0
.end method

.method public lessThan(Lcom/github/zafarkhaja/semver/Version;)Z
    .registers 3
    .param p1, "other"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 548
    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/Version;->compareTo(Lcom/github/zafarkhaja/semver/Version;)I

    move-result v0

    if-gez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public lessThanOrEqualTo(Lcom/github/zafarkhaja/semver/Version;)Z
    .registers 3
    .param p1, "other"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 560
    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/Version;->compareTo(Lcom/github/zafarkhaja/semver/Version;)I

    move-result v0

    if-gtz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public satisfies(Lcom/github/zafarkhaja/semver/expr/Expression;)Z
    .registers 3
    .param p1, "expr"    # Lcom/github/zafarkhaja/semver/expr/Expression;

    .prologue
    .line 339
    invoke-interface {p1, p0}, Lcom/github/zafarkhaja/semver/expr/Expression;->interpret(Lcom/github/zafarkhaja/semver/Version;)Z

    move-result v0

    return v0
.end method

.method public satisfies(Ljava/lang/String;)Z
    .registers 4
    .param p1, "expr"    # Ljava/lang/String;

    .prologue
    .line 324
    invoke-static {}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->newInstance()Lcom/github/zafarkhaja/semver/Parser;

    move-result-object v0

    .line 325
    .local v0, "parser":Lcom/github/zafarkhaja/semver/Parser;, "Lcom/github/zafarkhaja/semver/Parser<Lcom/github/zafarkhaja/semver/expr/Expression;>;"
    invoke-interface {v0, p1}, Lcom/github/zafarkhaja/semver/Parser;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/zafarkhaja/semver/expr/Expression;

    invoke-virtual {p0, v1}, Lcom/github/zafarkhaja/semver/Version;->satisfies(Lcom/github/zafarkhaja/semver/expr/Expression;)Z

    move-result v1

    return v1
.end method

.method public setBuildMetadata(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;
    .registers 6
    .param p1, "build"    # Ljava/lang/String;

    .prologue
    .line 458
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    iget-object v2, p0, Lcom/github/zafarkhaja/semver/Version;->preRelease:Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-static {p1}, Lcom/github/zafarkhaja/semver/VersionParser;->parseBuild(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V

    return-object v0
.end method

.method public setPreReleaseVersion(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;
    .registers 5
    .param p1, "preRelease"    # Ljava/lang/String;

    .prologue
    .line 445
    new-instance v0, Lcom/github/zafarkhaja/semver/Version;

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version;->normal:Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-static {p1}, Lcom/github/zafarkhaja/semver/VersionParser;->parsePreRelease(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 600
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/github/zafarkhaja/semver/Version;->getNormalVersion()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 601
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/github/zafarkhaja/semver/Version;->getPreReleaseVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_20

    .line 602
    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/github/zafarkhaja/semver/Version;->getPreReleaseVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 604
    :cond_20
    invoke-virtual {p0}, Lcom/github/zafarkhaja/semver/Version;->getBuildMetadata()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_37

    .line 605
    const-string v1, "+"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/github/zafarkhaja/semver/Version;->getBuildMetadata()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 607
    :cond_37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
