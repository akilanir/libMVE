.class public Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;
.super Ljava/lang/RuntimeException;
.source "UnexpectedElementException.java"


# instance fields
.field private final expected:[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/github/zafarkhaja/semver/util/Stream$ElementType",
            "<*>;"
        }
    .end annotation
.end field

.field private final position:I

.field private final unexpected:Ljava/lang/Object;


# direct methods
.method varargs constructor <init>(Ljava/lang/Object;I[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)V
    .registers 4
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I[",
            "Lcom/github/zafarkhaja/semver/util/Stream$ElementType",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p3, "expected":[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "[Lcom/github/zafarkhaja/semver/util/Stream$ElementType<*>;"
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->unexpected:Ljava/lang/Object;

    .line 67
    iput p2, p0, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->position:I

    .line 68
    iput-object p3, p0, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->expected:[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;

    .line 69
    return-void
.end method


# virtual methods
.method public getExpectedElementTypes()[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Lcom/github/zafarkhaja/semver/util/Stream$ElementType",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 95
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->expected:[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;

    return-object v0
.end method

.method public getPosition()I
    .registers 2

    .prologue
    .line 86
    iget v0, p0, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->position:I

    return v0
.end method

.method public getUnexpectedElement()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->unexpected:Ljava/lang/Object;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 107
    const-string v1, "Unexpected element \'%s\' at position \'%d\'"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->unexpected:Ljava/lang/Object;

    aput-object v3, v2, v5

    iget v3, p0, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->position:I

    .line 110
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    .line 107
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 112
    .local v0, "message":Ljava/lang/String;
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->expected:[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;

    array-length v1, v1

    if-lez v1, :cond_3d

    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", expecting \'%s\'"

    new-array v3, v4, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;->expected:[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;

    .line 115
    invoke-static {v4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    .line 113
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 118
    :cond_3d
    return-object v0
.end method
