.class public Lcom/github/zafarkhaja/semver/Version$Builder;
.super Ljava/lang/Object;
.source "Version.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/zafarkhaja/semver/Version;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private build:Ljava/lang/String;

.field private normal:Ljava/lang/String;

.field private preRelease:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "normal"    # Ljava/lang/String;

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/Version$Builder;->normal:Ljava/lang/String;

    .line 105
    return-void
.end method

.method private isFilled(Ljava/lang/String;)Z
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 168
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method


# virtual methods
.method public build()Lcom/github/zafarkhaja/semver/Version;
    .registers 4

    .prologue
    .line 148
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 149
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version$Builder;->normal:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/Version$Builder;->isFilled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 150
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version$Builder;->normal:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    :cond_12
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version$Builder;->preRelease:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/Version$Builder;->isFilled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 153
    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/github/zafarkhaja/semver/Version$Builder;->preRelease:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    :cond_25
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/Version$Builder;->build:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/Version$Builder;->isFilled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_38

    .line 156
    const-string v1, "+"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/github/zafarkhaja/semver/Version$Builder;->build:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    :cond_38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/zafarkhaja/semver/VersionParser;->parseValidSemVer(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v1

    return-object v1
.end method

.method public setBuildMetadata(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version$Builder;
    .registers 2
    .param p1, "build"    # Ljava/lang/String;

    .prologue
    .line 136
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/Version$Builder;->build:Ljava/lang/String;

    .line 137
    return-object p0
.end method

.method public setNormalVersion(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version$Builder;
    .registers 2
    .param p1, "normal"    # Ljava/lang/String;

    .prologue
    .line 114
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/Version$Builder;->normal:Ljava/lang/String;

    .line 115
    return-object p0
.end method

.method public setPreReleaseVersion(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version$Builder;
    .registers 2
    .param p1, "preRelease"    # Ljava/lang/String;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/Version$Builder;->preRelease:Ljava/lang/String;

    .line 126
    return-object p0
.end method
