.class Lcom/github/zafarkhaja/semver/NormalVersion;
.super Ljava/lang/Object;
.source "NormalVersion.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/github/zafarkhaja/semver/NormalVersion;",
        ">;"
    }
.end annotation


# instance fields
.field private final major:I

.field private final minor:I

.field private final patch:I


# direct methods
.method constructor <init>(III)V
    .registers 6
    .param p1, "major"    # I
    .param p2, "minor"    # I
    .param p3, "patch"    # I

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    if-ltz p1, :cond_9

    if-ltz p2, :cond_9

    if-gez p3, :cond_11

    .line 62
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Major, minor and patch versions MUST be non-negative integers."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_11
    iput p1, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->major:I

    .line 67
    iput p2, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->minor:I

    .line 68
    iput p3, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->patch:I

    .line 69
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/github/zafarkhaja/semver/NormalVersion;)I
    .registers 5
    .param p1, "other"    # Lcom/github/zafarkhaja/semver/NormalVersion;

    .prologue
    .line 130
    iget v1, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->major:I

    iget v2, p1, Lcom/github/zafarkhaja/semver/NormalVersion;->major:I

    sub-int v0, v1, v2

    .line 131
    .local v0, "result":I
    if-nez v0, :cond_16

    .line 132
    iget v1, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->minor:I

    iget v2, p1, Lcom/github/zafarkhaja/semver/NormalVersion;->minor:I

    sub-int v0, v1, v2

    .line 133
    if-nez v0, :cond_16

    .line 134
    iget v1, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->patch:I

    iget v2, p1, Lcom/github/zafarkhaja/semver/NormalVersion;->patch:I

    sub-int v0, v1, v2

    .line 137
    :cond_16
    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 34
    check-cast p1, Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/NormalVersion;->compareTo(Lcom/github/zafarkhaja/semver/NormalVersion;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 145
    if-ne p0, p1, :cond_5

    .line 151
    .end local p1    # "other":Ljava/lang/Object;
    :cond_4
    :goto_4
    return v0

    .line 148
    .restart local p1    # "other":Ljava/lang/Object;
    :cond_5
    instance-of v2, p1, Lcom/github/zafarkhaja/semver/NormalVersion;

    if-nez v2, :cond_b

    move v0, v1

    .line 149
    goto :goto_4

    .line 151
    :cond_b
    check-cast p1, Lcom/github/zafarkhaja/semver/NormalVersion;

    .end local p1    # "other":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/NormalVersion;->compareTo(Lcom/github/zafarkhaja/semver/NormalVersion;)I

    move-result v2

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_4
.end method

.method getMajor()I
    .registers 2

    .prologue
    .line 77
    iget v0, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->major:I

    return v0
.end method

.method getMinor()I
    .registers 2

    .prologue
    .line 86
    iget v0, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->minor:I

    return v0
.end method

.method getPatch()I
    .registers 2

    .prologue
    .line 95
    iget v0, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->patch:I

    return v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 159
    const/16 v0, 0x11

    .line 160
    .local v0, "hash":I
    iget v1, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->major:I

    add-int/lit16 v0, v1, 0x20f

    .line 161
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->minor:I

    add-int v0, v1, v2

    .line 162
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->patch:I

    add-int v0, v1, v2

    .line 163
    return v0
.end method

.method incrementMajor()Lcom/github/zafarkhaja/semver/NormalVersion;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 104
    new-instance v0, Lcom/github/zafarkhaja/semver/NormalVersion;

    iget v1, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->major:I

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1, v2, v2}, Lcom/github/zafarkhaja/semver/NormalVersion;-><init>(III)V

    return-object v0
.end method

.method incrementMinor()Lcom/github/zafarkhaja/semver/NormalVersion;
    .registers 5

    .prologue
    .line 113
    new-instance v0, Lcom/github/zafarkhaja/semver/NormalVersion;

    iget v1, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->major:I

    iget v2, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->minor:I

    add-int/lit8 v2, v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/NormalVersion;-><init>(III)V

    return-object v0
.end method

.method incrementPatch()Lcom/github/zafarkhaja/semver/NormalVersion;
    .registers 5

    .prologue
    .line 122
    new-instance v0, Lcom/github/zafarkhaja/semver/NormalVersion;

    iget v1, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->major:I

    iget v2, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->minor:I

    iget v3, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->patch:I

    add-int/lit8 v3, v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/github/zafarkhaja/semver/NormalVersion;-><init>(III)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 177
    const-string v0, "%d.%d.%d"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->major:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->minor:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget v3, p0, Lcom/github/zafarkhaja/semver/NormalVersion;->patch:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
