.class public Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
.super Ljava/lang/Object;
.source "RemoteTags.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/imap/RemoteTags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TagDetails"
.end annotation


# instance fields
.field private final auditInformation:Lorg/kore/kolab/notes/AuditInformation;

.field private final identification:Lorg/kore/kolab/notes/Identification;

.field private final members:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final tag:Lorg/kore/kolab/notes/Tag;


# direct methods
.method public constructor <init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Tag;Ljava/util/Set;)V
    .registers 6
    .param p1, "identification"    # Lorg/kore/kolab/notes/Identification;
    .param p2, "auditInformation"    # Lorg/kore/kolab/notes/AuditInformation;
    .param p3, "tag"    # Lorg/kore/kolab/notes/Tag;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/kore/kolab/notes/Identification;",
            "Lorg/kore/kolab/notes/AuditInformation;",
            "Lorg/kore/kolab/notes/Tag;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 377
    .local p4, "members":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 378
    iput-object p3, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->tag:Lorg/kore/kolab/notes/Tag;

    .line 379
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0, p4}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->members:Ljava/util/Set;

    .line 380
    iput-object p2, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->auditInformation:Lorg/kore/kolab/notes/AuditInformation;

    .line 381
    iput-object p1, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->identification:Lorg/kore/kolab/notes/Identification;

    .line 382
    return-void
.end method


# virtual methods
.method public addMember(Ljava/lang/String;)V
    .registers 3
    .param p1, "uid"    # Ljava/lang/String;

    .prologue
    .line 401
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->members:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 402
    return-void
.end method

.method public containsMember(Ljava/lang/String;)Z
    .registers 3
    .param p1, "uid"    # Ljava/lang/String;

    .prologue
    .line 393
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->members:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 426
    if-nez p1, :cond_4

    .line 436
    :cond_3
    :goto_3
    return v1

    .line 429
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_3

    move-object v0, p1

    .line 432
    check-cast v0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    .line 433
    .local v0, "other":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    iget-object v2, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->tag:Lorg/kore/kolab/notes/Tag;

    iget-object v3, v0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->tag:Lorg/kore/kolab/notes/Tag;

    if-eq v2, v3, :cond_25

    iget-object v2, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->tag:Lorg/kore/kolab/notes/Tag;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->tag:Lorg/kore/kolab/notes/Tag;

    iget-object v3, v0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->tag:Lorg/kore/kolab/notes/Tag;

    invoke-virtual {v2, v3}, Lorg/kore/kolab/notes/Tag;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 436
    :cond_25
    const/4 v1, 0x1

    goto :goto_3
.end method

.method public getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;
    .registers 2

    .prologue
    .line 405
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->auditInformation:Lorg/kore/kolab/notes/AuditInformation;

    return-object v0
.end method

.method public getIdentification()Lorg/kore/kolab/notes/Identification;
    .registers 2

    .prologue
    .line 409
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->identification:Lorg/kore/kolab/notes/Identification;

    return-object v0
.end method

.method public getMembers()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 389
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->members:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Lorg/kore/kolab/notes/Tag;
    .registers 2

    .prologue
    .line 385
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->tag:Lorg/kore/kolab/notes/Tag;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 419
    const/4 v0, 0x7

    .line 420
    .local v0, "hash":I
    iget-object v1, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->tag:Lorg/kore/kolab/notes/Tag;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->tag:Lorg/kore/kolab/notes/Tag;

    invoke-virtual {v1}, Lorg/kore/kolab/notes/Tag;->hashCode()I

    move-result v1

    :goto_b
    add-int/lit16 v0, v1, 0x19d

    .line 421
    return v0

    .line 420
    :cond_e
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public removeMember(Ljava/lang/String;)V
    .registers 3
    .param p1, "uid"    # Ljava/lang/String;

    .prologue
    .line 397
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->members:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 398
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 414
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TagDetails{tag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->tag:Lorg/kore/kolab/notes/Tag;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", members="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->members:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", auditInformation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->auditInformation:Lorg/kore/kolab/notes/AuditInformation;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", identification="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->identification:Lorg/kore/kolab/notes/Identification;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
