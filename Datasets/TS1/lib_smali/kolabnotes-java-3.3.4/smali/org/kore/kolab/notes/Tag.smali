.class public Lorg/kore/kolab/notes/Tag;
.super Ljava/lang/Object;
.source "Tag.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/kore/kolab/notes/Tag;",
        ">;"
    }
.end annotation


# instance fields
.field private final auditInformation:Lorg/kore/kolab/notes/AuditInformation;

.field private color:Lorg/kore/kolab/notes/Color;

.field private final identification:Lorg/kore/kolab/notes/Identification;

.field private name:Ljava/lang/String;

.field private priority:I


# direct methods
.method public constructor <init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;)V
    .registers 3
    .param p1, "identification"    # Lorg/kore/kolab/notes/Identification;
    .param p2, "auditInformation"    # Lorg/kore/kolab/notes/AuditInformation;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/kore/kolab/notes/Tag;->identification:Lorg/kore/kolab/notes/Identification;

    .line 37
    iput-object p2, p0, Lorg/kore/kolab/notes/Tag;->auditInformation:Lorg/kore/kolab/notes/AuditInformation;

    .line 38
    return-void
.end method

.method public static createNewTag(Ljava/lang/String;)Lorg/kore/kolab/notes/Tag;
    .registers 7
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 41
    new-instance v1, Lorg/kore/kolab/notes/Identification;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "kolabnotes-java"

    invoke-direct {v1, v4, v5}, Lorg/kore/kolab/notes/Identification;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .local v1, "identification":Lorg/kore/kolab/notes/Identification;
    new-instance v2, Ljava/sql/Timestamp;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Ljava/sql/Timestamp;-><init>(J)V

    .line 43
    .local v2, "now":Ljava/sql/Timestamp;
    new-instance v0, Lorg/kore/kolab/notes/AuditInformation;

    invoke-direct {v0, v2, v2}, Lorg/kore/kolab/notes/AuditInformation;-><init>(Ljava/sql/Timestamp;Ljava/sql/Timestamp;)V

    .line 45
    .local v0, "audit":Lorg/kore/kolab/notes/AuditInformation;
    new-instance v3, Lorg/kore/kolab/notes/Tag;

    invoke-direct {v3, v1, v0}, Lorg/kore/kolab/notes/Tag;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;)V

    .line 46
    .local v3, "tag":Lorg/kore/kolab/notes/Tag;
    invoke-virtual {v3, p0}, Lorg/kore/kolab/notes/Tag;->setName(Ljava/lang/String;)V

    .line 47
    return-object v3
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 27
    check-cast p1, Lorg/kore/kolab/notes/Tag;

    invoke-virtual {p0, p1}, Lorg/kore/kolab/notes/Tag;->compareTo(Lorg/kore/kolab/notes/Tag;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/kore/kolab/notes/Tag;)I
    .registers 5
    .param p1, "o"    # Lorg/kore/kolab/notes/Tag;

    .prologue
    .line 85
    iget v1, p0, Lorg/kore/kolab/notes/Tag;->priority:I

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Tag;->getPriority()I

    move-result v2

    sub-int v0, v1, v2

    .line 86
    .local v0, "compare":I
    if-nez v0, :cond_14

    .line 87
    iget-object v1, p0, Lorg/kore/kolab/notes/Tag;->name:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Tag;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 89
    :cond_14
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 106
    if-nez p1, :cond_4

    .line 116
    :cond_3
    :goto_3
    return v1

    .line 109
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_3

    move-object v0, p1

    .line 112
    check-cast v0, Lorg/kore/kolab/notes/Tag;

    .line 113
    .local v0, "other":Lorg/kore/kolab/notes/Tag;
    iget-object v2, p0, Lorg/kore/kolab/notes/Tag;->name:Ljava/lang/String;

    if-nez v2, :cond_1b

    iget-object v2, v0, Lorg/kore/kolab/notes/Tag;->name:Ljava/lang/String;

    if-nez v2, :cond_3

    .line 116
    :cond_19
    const/4 v1, 0x1

    goto :goto_3

    .line 113
    :cond_1b
    iget-object v2, p0, Lorg/kore/kolab/notes/Tag;->name:Ljava/lang/String;

    iget-object v3, v0, Lorg/kore/kolab/notes/Tag;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_19

    goto :goto_3
.end method

.method public getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lorg/kore/kolab/notes/Tag;->auditInformation:Lorg/kore/kolab/notes/AuditInformation;

    return-object v0
.end method

.method public getColor()Lorg/kore/kolab/notes/Color;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lorg/kore/kolab/notes/Tag;->color:Lorg/kore/kolab/notes/Color;

    return-object v0
.end method

.method public getIdentification()Lorg/kore/kolab/notes/Identification;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lorg/kore/kolab/notes/Tag;->identification:Lorg/kore/kolab/notes/Identification;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lorg/kore/kolab/notes/Tag;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPriority()I
    .registers 2

    .prologue
    .line 67
    iget v0, p0, Lorg/kore/kolab/notes/Tag;->priority:I

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 99
    const/4 v0, 0x5

    .line 100
    .local v0, "hash":I
    iget-object v1, p0, Lorg/kore/kolab/notes/Tag;->name:Ljava/lang/String;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lorg/kore/kolab/notes/Tag;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_b
    add-int/lit8 v0, v1, 0x73

    .line 101
    return v0

    .line 100
    :cond_e
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public setColor(Lorg/kore/kolab/notes/Color;)V
    .registers 2
    .param p1, "color"    # Lorg/kore/kolab/notes/Color;

    .prologue
    .line 79
    iput-object p1, p0, Lorg/kore/kolab/notes/Tag;->color:Lorg/kore/kolab/notes/Color;

    .line 80
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 59
    iput-object p1, p0, Lorg/kore/kolab/notes/Tag;->name:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public setPriority(I)V
    .registers 2
    .param p1, "priority"    # I

    .prologue
    .line 71
    iput p1, p0, Lorg/kore/kolab/notes/Tag;->priority:I

    .line 72
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Tag{identification="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Tag;->identification:Lorg/kore/kolab/notes/Identification;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", auditInformation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Tag;->auditInformation:Lorg/kore/kolab/notes/AuditInformation;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Tag;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", priority="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/kore/kolab/notes/Tag;->priority:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", color="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Tag;->color:Lorg/kore/kolab/notes/Color;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
