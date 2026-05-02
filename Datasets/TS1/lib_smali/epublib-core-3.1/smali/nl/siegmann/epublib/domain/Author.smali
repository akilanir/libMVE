.class public Lnl/siegmann/epublib/domain/Author;
.super Ljava/lang/Object;
.source "Author.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x5c792eba5040bcf8L


# instance fields
.field private firstname:Ljava/lang/String;

.field private lastname:Ljava/lang/String;

.field private relator:Lnl/siegmann/epublib/domain/Relator;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "singleName"    # Ljava/lang/String;

    .prologue
    .line 22
    const-string v0, ""

    invoke-direct {p0, v0, p1}, Lnl/siegmann/epublib/domain/Author;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "firstname"    # Ljava/lang/String;
    .param p2, "lastname"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    sget-object v0, Lnl/siegmann/epublib/domain/Relator;->AUTHOR:Lnl/siegmann/epublib/domain/Relator;

    iput-object v0, p0, Lnl/siegmann/epublib/domain/Author;->relator:Lnl/siegmann/epublib/domain/Relator;

    .line 27
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Author;->firstname:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lnl/siegmann/epublib/domain/Author;->lastname:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "authorObject"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 54
    instance-of v2, p1, Lnl/siegmann/epublib/domain/Author;

    if-nez v2, :cond_6

    .line 58
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 57
    check-cast v0, Lnl/siegmann/epublib/domain/Author;

    .line 58
    .local v0, "other":Lnl/siegmann/epublib/domain/Author;
    iget-object v2, p0, Lnl/siegmann/epublib/domain/Author;->firstname:Ljava/lang/String;

    iget-object v3, v0, Lnl/siegmann/epublib/domain/Author;->firstname:Ljava/lang/String;

    invoke-static {v2, v3}, Lnl/siegmann/epublib/util/StringUtil;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lnl/siegmann/epublib/domain/Author;->lastname:Ljava/lang/String;

    iget-object v3, v0, Lnl/siegmann/epublib/domain/Author;->lastname:Ljava/lang/String;

    invoke-static {v2, v3}, Lnl/siegmann/epublib/util/StringUtil;->equals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getFirstname()Ljava/lang/String;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Author;->firstname:Ljava/lang/String;

    return-object v0
.end method

.method public getLastname()Ljava/lang/String;
    .registers 2

    .prologue
    .line 38
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Author;->lastname:Ljava/lang/String;

    return-object v0
.end method

.method public getRelator()Lnl/siegmann/epublib/domain/Relator;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Author;->relator:Lnl/siegmann/epublib/domain/Relator;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 49
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lnl/siegmann/epublib/domain/Author;->firstname:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lnl/siegmann/epublib/domain/Author;->lastname:Ljava/lang/String;

    aput-object v2, v0, v1

    invoke-static {v0}, Lnl/siegmann/epublib/util/StringUtil;->hashCode([Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public setFirstname(Ljava/lang/String;)V
    .registers 2
    .param p1, "firstname"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Author;->firstname:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public setLastname(Ljava/lang/String;)V
    .registers 2
    .param p1, "lastname"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Author;->lastname:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public setRelator(Lnl/siegmann/epublib/domain/Relator;)V
    .registers 2
    .param p1, "relator"    # Lnl/siegmann/epublib/domain/Relator;

    .prologue
    .line 78
    iput-object p1, p0, Lnl/siegmann/epublib/domain/Author;->relator:Lnl/siegmann/epublib/domain/Relator;

    .line 79
    return-void
.end method

.method public setRole(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Relator;
    .registers 3
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {p1}, Lnl/siegmann/epublib/domain/Relator;->byCode(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Relator;

    move-result-object v0

    .line 64
    .local v0, "result":Lnl/siegmann/epublib/domain/Relator;
    if-nez v0, :cond_8

    .line 65
    sget-object v0, Lnl/siegmann/epublib/domain/Relator;->AUTHOR:Lnl/siegmann/epublib/domain/Relator;

    .line 67
    :cond_8
    iput-object v0, p0, Lnl/siegmann/epublib/domain/Author;->relator:Lnl/siegmann/epublib/domain/Relator;

    .line 68
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lnl/siegmann/epublib/domain/Author;->lastname:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnl/siegmann/epublib/domain/Author;->firstname:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
