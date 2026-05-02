.class Lcom/github/zafarkhaja/semver/Version$BuildAwareOrder;
.super Ljava/lang/Object;
.source "Version.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/zafarkhaja/semver/Version;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BuildAwareOrder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/github/zafarkhaja/semver/Version;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/github/zafarkhaja/semver/Version$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/github/zafarkhaja/semver/Version$1;

    .prologue
    .line 180
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/Version$BuildAwareOrder;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/github/zafarkhaja/semver/Version;Lcom/github/zafarkhaja/semver/Version;)I
    .registers 6
    .param p1, "v1"    # Lcom/github/zafarkhaja/semver/Version;
    .param p2, "v2"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 198
    invoke-virtual {p1, p2}, Lcom/github/zafarkhaja/semver/Version;->compareTo(Lcom/github/zafarkhaja/semver/Version;)I

    move-result v0

    .line 199
    .local v0, "result":I
    if-nez v0, :cond_24

    .line 200
    # getter for: Lcom/github/zafarkhaja/semver/Version;->build:Lcom/github/zafarkhaja/semver/MetadataVersion;
    invoke-static {p1}, Lcom/github/zafarkhaja/semver/Version;->access$100(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v1

    # getter for: Lcom/github/zafarkhaja/semver/Version;->build:Lcom/github/zafarkhaja/semver/MetadataVersion;
    invoke-static {p2}, Lcom/github/zafarkhaja/semver/Version;->access$100(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/github/zafarkhaja/semver/MetadataVersion;->compareTo(Lcom/github/zafarkhaja/semver/MetadataVersion;)I

    move-result v0

    .line 201
    # getter for: Lcom/github/zafarkhaja/semver/Version;->build:Lcom/github/zafarkhaja/semver/MetadataVersion;
    invoke-static {p1}, Lcom/github/zafarkhaja/semver/Version;->access$100(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v1

    sget-object v2, Lcom/github/zafarkhaja/semver/MetadataVersion;->NULL:Lcom/github/zafarkhaja/semver/MetadataVersion;

    if-eq v1, v2, :cond_22

    .line 202
    # getter for: Lcom/github/zafarkhaja/semver/Version;->build:Lcom/github/zafarkhaja/semver/MetadataVersion;
    invoke-static {p2}, Lcom/github/zafarkhaja/semver/Version;->access$100(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v1

    sget-object v2, Lcom/github/zafarkhaja/semver/MetadataVersion;->NULL:Lcom/github/zafarkhaja/semver/MetadataVersion;

    if-ne v1, v2, :cond_24

    .line 209
    :cond_22
    mul-int/lit8 v0, v0, -0x1

    .line 212
    :cond_24
    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 180
    check-cast p1, Lcom/github/zafarkhaja/semver/Version;

    check-cast p2, Lcom/github/zafarkhaja/semver/Version;

    invoke-virtual {p0, p1, p2}, Lcom/github/zafarkhaja/semver/Version$BuildAwareOrder;->compare(Lcom/github/zafarkhaja/semver/Version;Lcom/github/zafarkhaja/semver/Version;)I

    move-result v0

    return v0
.end method
