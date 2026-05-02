.class Lcom/github/zafarkhaja/semver/MetadataVersion;
.super Ljava/lang/Object;
.source "MetadataVersion.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/zafarkhaja/semver/MetadataVersion$NullMetadataVersion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/github/zafarkhaja/semver/MetadataVersion;",
        ">;"
    }
.end annotation


# static fields
.field static final NULL:Lcom/github/zafarkhaja/semver/MetadataVersion;


# instance fields
.field private final idents:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 40
    new-instance v0, Lcom/github/zafarkhaja/semver/MetadataVersion$NullMetadataVersion;

    invoke-direct {v0}, Lcom/github/zafarkhaja/semver/MetadataVersion$NullMetadataVersion;-><init>()V

    sput-object v0, Lcom/github/zafarkhaja/semver/MetadataVersion;->NULL:Lcom/github/zafarkhaja/semver/MetadataVersion;

    return-void
.end method

.method constructor <init>([Ljava/lang/String;)V
    .registers 2
    .param p1, "identifiers"    # [Ljava/lang/String;

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/MetadataVersion;->idents:[Ljava/lang/String;

    .line 113
    return-void
.end method

.method private compareIdentifierArrays([Ljava/lang/String;)I
    .registers 7
    .param p1, "otherIdents"    # [Ljava/lang/String;

    .prologue
    .line 199
    const/4 v2, 0x0

    .line 200
    .local v2, "result":I
    iget-object v3, p0, Lcom/github/zafarkhaja/semver/MetadataVersion;->idents:[Ljava/lang/String;

    invoke-direct {p0, v3, p1}, Lcom/github/zafarkhaja/semver/MetadataVersion;->getLeastCommonArrayLength([Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 201
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_16

    .line 202
    iget-object v3, p0, Lcom/github/zafarkhaja/semver/MetadataVersion;->idents:[Ljava/lang/String;

    aget-object v3, v3, v0

    aget-object v4, p1, v0

    invoke-direct {p0, v3, v4}, Lcom/github/zafarkhaja/semver/MetadataVersion;->compareIdentifiers(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 203
    if-eqz v2, :cond_17

    .line 207
    :cond_16
    return v2

    .line 201
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_8
.end method

.method private compareIdentifiers(Ljava/lang/String;Ljava/lang/String;)I
    .registers 5
    .param p1, "ident1"    # Ljava/lang/String;
    .param p2, "ident2"    # Ljava/lang/String;

    .prologue
    .line 230
    invoke-direct {p0, p1}, Lcom/github/zafarkhaja/semver/MetadataVersion;->isInt(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-direct {p0, p2}, Lcom/github/zafarkhaja/semver/MetadataVersion;->isInt(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 231
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    sub-int/2addr v0, v1

    .line 233
    :goto_15
    return v0

    :cond_16
    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_15
.end method

.method private getLeastCommonArrayLength([Ljava/lang/String;[Ljava/lang/String;)I
    .registers 5
    .param p1, "arr1"    # [Ljava/lang/String;
    .param p2, "arr2"    # [Ljava/lang/String;

    .prologue
    .line 218
    array-length v0, p1

    array-length v1, p2

    if-gt v0, v1, :cond_6

    array-length v0, p1

    :goto_5
    return v0

    :cond_6
    array-length v0, p2

    goto :goto_5
.end method

.method private isInt(Ljava/lang/String;)Z
    .registers 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 246
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_3} :catch_5

    .line 250
    const/4 v1, 0x1

    :goto_4
    return v1

    .line 247
    :catch_5
    move-exception v0

    .line 248
    .local v0, "e":Ljava/lang/NumberFormatException;
    const/4 v1, 0x0

    goto :goto_4
.end method


# virtual methods
.method public compareTo(Lcom/github/zafarkhaja/semver/MetadataVersion;)I
    .registers 5
    .param p1, "other"    # Lcom/github/zafarkhaja/semver/MetadataVersion;

    .prologue
    .line 172
    sget-object v1, Lcom/github/zafarkhaja/semver/MetadataVersion;->NULL:Lcom/github/zafarkhaja/semver/MetadataVersion;

    if-ne p1, v1, :cond_6

    .line 177
    const/4 v0, -0x1

    .line 188
    :cond_5
    :goto_5
    return v0

    .line 179
    :cond_6
    iget-object v1, p1, Lcom/github/zafarkhaja/semver/MetadataVersion;->idents:[Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/MetadataVersion;->compareIdentifierArrays([Ljava/lang/String;)I

    move-result v0

    .line 180
    .local v0, "result":I
    if-nez v0, :cond_5

    .line 186
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/MetadataVersion;->idents:[Ljava/lang/String;

    array-length v1, v1

    iget-object v2, p1, Lcom/github/zafarkhaja/semver/MetadataVersion;->idents:[Ljava/lang/String;

    array-length v2, v2

    sub-int v0, v1, v2

    goto :goto_5
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 35
    check-cast p1, Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/MetadataVersion;->compareTo(Lcom/github/zafarkhaja/semver/MetadataVersion;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 138
    if-ne p0, p1, :cond_5

    .line 144
    .end local p1    # "other":Ljava/lang/Object;
    :cond_4
    :goto_4
    return v0

    .line 141
    .restart local p1    # "other":Ljava/lang/Object;
    :cond_5
    instance-of v2, p1, Lcom/github/zafarkhaja/semver/MetadataVersion;

    if-nez v2, :cond_b

    move v0, v1

    .line 142
    goto :goto_4

    .line 144
    :cond_b
    check-cast p1, Lcom/github/zafarkhaja/semver/MetadataVersion;

    .end local p1    # "other":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/MetadataVersion;->compareTo(Lcom/github/zafarkhaja/semver/MetadataVersion;)I

    move-result v2

    if-eqz v2, :cond_4

    move v0, v1

    goto :goto_4
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/MetadataVersion;->idents:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method increment()Lcom/github/zafarkhaja/semver/MetadataVersion;
    .registers 6

    .prologue
    .line 121
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/MetadataVersion;->idents:[Ljava/lang/String;

    .line 122
    .local v0, "ids":[Ljava/lang/String;
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aget-object v2, v0, v3

    .line 123
    .local v2, "lastId":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/MetadataVersion;->isInt(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_22

    .line 124
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 125
    .local v1, "intId":I
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v3

    .line 130
    .end local v1    # "intId":I
    :goto_1c
    new-instance v3, Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-direct {v3, v0}, Lcom/github/zafarkhaja/semver/MetadataVersion;-><init>([Ljava/lang/String;)V

    return-object v3

    .line 127
    :cond_22
    array-length v3, v0

    add-int/lit8 v3, v3, 0x1

    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "ids":[Ljava/lang/String;
    check-cast v0, [Ljava/lang/String;

    .line 128
    .restart local v0    # "ids":[Ljava/lang/String;
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v3

    goto :goto_1c
.end method

.method public toString()Ljava/lang/String;
    .registers 8

    .prologue
    .line 160
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .local v1, "sb":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lcom/github/zafarkhaja/semver/MetadataVersion;->idents:[Ljava/lang/String;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_9
    if-ge v2, v4, :cond_19

    aget-object v0, v3, v2

    .line 162
    .local v0, "ident":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 164
    .end local v0    # "ident":Ljava/lang/String;
    :cond_19
    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
