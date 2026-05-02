.class public Lnl/siegmann/epublib/domain/Identifier;
.super Ljava/lang/Object;
.source "Identifier.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/siegmann/epublib/domain/Identifier$Scheme;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0xd44376a7d39d882L


# instance fields
.field private bookId:Z

.field private scheme:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 39
    const-string v0, "UUID"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lnl/siegmann/epublib/domain/Identifier;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "scheme"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnl/siegmann/epublib/domain/Identifier;->bookId:Z

    .line 44
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Identifier;->scheme:Ljava/lang/String;

    .line 45
    iput-object p2, p0, Lnl/siegmann/epublib/domain/Identifier;->value:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public static getBookIdIdentifier(Ljava/util/List;)Lnl/siegmann/epublib/domain/Identifier;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Identifier;",
            ">;)",
            "Lnl/siegmann/epublib/domain/Identifier;"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "identifiers":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Identifier;>;"
    if-eqz p0, :cond_8

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 57
    :cond_8
    const/4 v2, 0x0

    .line 72
    :cond_9
    :goto_9
    return-object v2

    .line 60
    :cond_a
    const/4 v2, 0x0

    .line 61
    .local v2, "result":Lnl/siegmann/epublib/domain/Identifier;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/Identifier;

    .line 62
    .local v1, "identifier":Lnl/siegmann/epublib/domain/Identifier;
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Identifier;->isBookId()Z

    move-result v3

    if-eqz v3, :cond_f

    .line 63
    move-object v2, v1

    .line 68
    .end local v1    # "identifier":Lnl/siegmann/epublib/domain/Identifier;
    :cond_22
    if-nez v2, :cond_9

    .line 69
    const/4 v3, 0x0

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "result":Lnl/siegmann/epublib/domain/Identifier;
    check-cast v2, Lnl/siegmann/epublib/domain/Identifier;

    .restart local v2    # "result":Lnl/siegmann/epublib/domain/Identifier;
    goto :goto_9
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "otherIdentifier"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 111
    instance-of v0, p1, Lnl/siegmann/epublib/domain/Identifier;

    if-nez v0, :cond_6

    .line 114
    .end local p1    # "otherIdentifier":Ljava/lang/Object;
    :goto_5
    return v1

    .restart local p1    # "otherIdentifier":Ljava/lang/Object;
    :cond_6
    iget-object v2, p0, Lnl/siegmann/epublib/domain/Identifier;->scheme:Ljava/lang/String;

    move-object v0, p1

    check-cast v0, Lnl/siegmann/epublib/domain/Identifier;

    iget-object v0, v0, Lnl/siegmann/epublib/domain/Identifier;->scheme:Ljava/lang/String;

    invoke-static {v2, v0}, Lnl/siegmann/epublib/util/StringUtil;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lnl/siegmann/epublib/domain/Identifier;->value:Ljava/lang/String;

    check-cast p1, Lnl/siegmann/epublib/domain/Identifier;

    .end local p1    # "otherIdentifier":Ljava/lang/Object;
    iget-object v2, p1, Lnl/siegmann/epublib/domain/Identifier;->value:Ljava/lang/String;

    invoke-static {v0, v2}, Lnl/siegmann/epublib/util/StringUtil;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    const/4 v0, 0x1

    :goto_20
    move v1, v0

    goto :goto_5

    :cond_22
    move v0, v1

    goto :goto_20
.end method

.method public getScheme()Ljava/lang/String;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Identifier;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Identifier;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 107
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Identifier;->scheme:Ljava/lang/String;

    invoke-static {v0}, Lnl/siegmann/epublib/util/StringUtil;->defaultIfNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lnl/siegmann/epublib/domain/Identifier;->value:Ljava/lang/String;

    invoke-static {v1}, Lnl/siegmann/epublib/util/StringUtil;->defaultIfNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public isBookId()Z
    .registers 2

    .prologue
    .line 103
    iget-boolean v0, p0, Lnl/siegmann/epublib/domain/Identifier;->bookId:Z

    return v0
.end method

.method public setBookId(Z)V
    .registers 2
    .param p1, "bookId"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lnl/siegmann/epublib/domain/Identifier;->bookId:Z

    .line 91
    return-void
.end method

.method public setScheme(Ljava/lang/String;)V
    .registers 2
    .param p1, "scheme"    # Ljava/lang/String;

    .prologue
    .line 79
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Identifier;->scheme:Ljava/lang/String;

    .line 80
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Identifier;->value:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 119
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Identifier;->scheme:Ljava/lang/String;

    invoke-static {v0}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnl/siegmann/epublib/domain/Identifier;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 122
    :goto_1d
    return-object v0

    :cond_1e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnl/siegmann/epublib/domain/Identifier;->scheme:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnl/siegmann/epublib/domain/Identifier;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1d
.end method
