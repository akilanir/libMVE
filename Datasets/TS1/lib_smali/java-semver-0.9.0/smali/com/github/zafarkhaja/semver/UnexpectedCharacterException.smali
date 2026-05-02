.class public Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;
.super Lcom/github/zafarkhaja/semver/ParseException;
.source "UnexpectedCharacterException.java"


# instance fields
.field private final expected:[Lcom/github/zafarkhaja/semver/VersionParser$CharType;

.field private final position:I

.field private final unexpected:Ljava/lang/Character;


# direct methods
.method constructor <init>(Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;)V
    .registers 3
    .param p1, "cause"    # Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/ParseException;-><init>()V

    .line 62
    invoke-virtual {p1}, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->getPosition()I

    move-result v0

    iput v0, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->position:I

    .line 63
    invoke-virtual {p1}, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->getUnexpectedElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    iput-object v0, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->unexpected:Ljava/lang/Character;

    .line 64
    invoke-virtual {p1}, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->getExpectedElementTypes()[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;

    move-result-object v0

    check-cast v0, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    check-cast v0, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    iput-object v0, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->expected:[Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .line 65
    return-void
.end method

.method varargs constructor <init>(Ljava/lang/Character;I[Lcom/github/zafarkhaja/semver/VersionParser$CharType;)V
    .registers 4
    .param p1, "unexpected"    # Ljava/lang/Character;
    .param p2, "position"    # I
    .param p3, "expected"    # [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/ParseException;-><init>()V

    .line 80
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->unexpected:Ljava/lang/Character;

    .line 81
    iput p2, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->position:I

    .line 82
    iput-object p3, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->expected:[Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .line 83
    return-void
.end method


# virtual methods
.method getExpectedCharTypes()[Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->expected:[Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    return-object v0
.end method

.method getPosition()I
    .registers 2

    .prologue
    .line 100
    iget v0, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->position:I

    return v0
.end method

.method getUnexpectedCharacter()Ljava/lang/Character;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->unexpected:Ljava/lang/Character;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 121
    const-string v1, "Unexpected character \'%s(%s)\' at position \'%d\'"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->unexpected:Ljava/lang/Character;

    .line 123
    invoke-static {v3}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->forCharacter(Ljava/lang/Character;)Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    move-result-object v3

    aput-object v3, v2, v5

    iget-object v3, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->unexpected:Ljava/lang/Character;

    aput-object v3, v2, v6

    const/4 v3, 0x2

    iget v4, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->position:I

    .line 125
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    .line 121
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "message":Ljava/lang/String;
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->expected:[Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    array-length v1, v1

    if-lez v1, :cond_46

    .line 128
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", expecting \'%s\'"

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;->expected:[Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .line 130
    invoke-static {v4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    .line 128
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 133
    :cond_46
    return-object v0
.end method
