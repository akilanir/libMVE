.class public Lorg/kore/kolab/notes/SharedNotebook;
.super Lorg/kore/kolab/notes/Notebook;
.source "SharedNotebook.java"


# instance fields
.field private noteCreationAllowed:Z

.field private noteModificationAllowed:Z

.field private shortName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Note$Classification;Ljava/lang/String;)V
    .registers 5
    .param p1, "identification"    # Lorg/kore/kolab/notes/Identification;
    .param p2, "auditInformation"    # Lorg/kore/kolab/notes/AuditInformation;
    .param p3, "classification"    # Lorg/kore/kolab/notes/Note$Classification;
    .param p4, "summary"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/kore/kolab/notes/Notebook;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Note$Classification;Ljava/lang/String;)V

    .line 31
    return-void
.end method


# virtual methods
.method public getShortName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 34
    iget-object v0, p0, Lorg/kore/kolab/notes/SharedNotebook;->shortName:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .registers 6

    .prologue
    .line 74
    invoke-virtual {p0}, Lorg/kore/kolab/notes/SharedNotebook;->isGlobalShared()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 75
    const/4 v3, 0x0

    .line 81
    :goto_7
    return-object v3

    .line 78
    :cond_8
    invoke-virtual {p0}, Lorg/kore/kolab/notes/SharedNotebook;->getSummary()Ljava/lang/String;

    move-result-object v2

    .line 79
    .local v2, "summary":Ljava/lang/String;
    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 80
    .local v0, "indexOfFirstSlash":I
    const-string v3, "/"

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 81
    .local v1, "indexOfSecondSlash":I
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_7
.end method

.method public isGlobalShared()Z
    .registers 3

    .prologue
    .line 90
    invoke-virtual {p0}, Lorg/kore/kolab/notes/SharedNotebook;->getSummary()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Shared Folders"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isNoteCreationAllowed()Z
    .registers 2

    .prologue
    .line 42
    iget-boolean v0, p0, Lorg/kore/kolab/notes/SharedNotebook;->noteCreationAllowed:Z

    return v0
.end method

.method public isNoteModificationAllowed()Z
    .registers 2

    .prologue
    .line 50
    iget-boolean v0, p0, Lorg/kore/kolab/notes/SharedNotebook;->noteModificationAllowed:Z

    return v0
.end method

.method public isShared()Z
    .registers 2

    .prologue
    .line 64
    const/4 v0, 0x1

    return v0
.end method

.method public setNoteCreationAllowed(Z)V
    .registers 2
    .param p1, "noteCreationAllowed"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lorg/kore/kolab/notes/SharedNotebook;->noteCreationAllowed:Z

    .line 47
    return-void
.end method

.method public setNoteModificationAllowed(Z)V
    .registers 2
    .param p1, "noteModificationAllowed"    # Z

    .prologue
    .line 54
    iput-boolean p1, p0, Lorg/kore/kolab/notes/SharedNotebook;->noteModificationAllowed:Z

    .line 55
    return-void
.end method

.method public setShortName(Ljava/lang/String;)V
    .registers 2
    .param p1, "shortName"    # Ljava/lang/String;

    .prologue
    .line 38
    iput-object p1, p0, Lorg/kore/kolab/notes/SharedNotebook;->shortName:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SharedNotebook{shortName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/SharedNotebook;->shortName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", noteCreationAllowed="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lorg/kore/kolab/notes/SharedNotebook;->noteCreationAllowed:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", noteModificationAllowed="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lorg/kore/kolab/notes/SharedNotebook;->noteModificationAllowed:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
