.class final enum Lcom/github/zafarkhaja/semver/VersionParser$CharType$7;
.super Lcom/github/zafarkhaja/semver/VersionParser$CharType;
.source "VersionParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/zafarkhaja/semver/VersionParser$CharType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .prologue
    .line 116
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;-><init>(Ljava/lang/String;ILcom/github/zafarkhaja/semver/VersionParser$1;)V

    return-void
.end method


# virtual methods
.method public isMatchedBy(Ljava/lang/Character;)Z
    .registers 6
    .param p1, "chr"    # Ljava/lang/Character;

    .prologue
    .line 122
    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType$7;->ILLEGAL:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    invoke-static {v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    .line 123
    .local v0, "itself":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/github/zafarkhaja/semver/VersionParser$CharType;>;"
    invoke-static {v0}, Ljava/util/EnumSet;->complementOf(Ljava/util/EnumSet;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/EnumSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .line 124
    .local v1, "type":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    invoke-virtual {v1, p1}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 125
    const/4 v2, 0x0

    .line 128
    .end local v1    # "type":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    :goto_21
    return v2

    :cond_22
    const/4 v2, 0x1

    goto :goto_21
.end method

.method public bridge synthetic isMatchedBy(Ljava/lang/Object;)Z
    .registers 3

    .prologue
    .line 116
    check-cast p1, Ljava/lang/Character;

    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/VersionParser$CharType$7;->isMatchedBy(Ljava/lang/Character;)Z

    move-result v0

    return v0
.end method
