.class public Lorg/kore/kolab/notes/Notebook;
.super Lorg/kore/kolab/notes/Note;
.source "Notebook.java"


# instance fields
.field private final notes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/kore/kolab/notes/Note;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Note$Classification;Ljava/lang/String;)V
    .registers 6
    .param p1, "identification"    # Lorg/kore/kolab/notes/Identification;
    .param p2, "auditInformation"    # Lorg/kore/kolab/notes/AuditInformation;
    .param p3, "classification"    # Lorg/kore/kolab/notes/Note$Classification;
    .param p4, "summary"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/kore/kolab/notes/Note;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Note$Classification;Ljava/lang/String;)V

    .line 39
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/Notebook;->notes:Ljava/util/Map;

    .line 40
    return-void
.end method


# virtual methods
.method public addNote(Lorg/kore/kolab/notes/Note;)V
    .registers 8
    .param p1, "note"    # Lorg/kore/kolab/notes/Note;

    .prologue
    .line 62
    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v0

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "note"

    const/4 v4, 0x0

    move-object v0, p0

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/Notebook;->firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 63
    iget-object v0, p0, Lorg/kore/kolab/notes/Notebook;->notes:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v1

    invoke-virtual {v1}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    return-void
.end method

.method public createNote(Ljava/lang/String;Ljava/lang/String;)Lorg/kore/kolab/notes/Note;
    .registers 10
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "summary"    # Ljava/lang/String;

    .prologue
    .line 51
    new-instance v2, Lorg/kore/kolab/notes/Identification;

    const-string v5, "kolabnotes-java"

    invoke-direct {v2, p1, v5}, Lorg/kore/kolab/notes/Identification;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .local v2, "identification":Lorg/kore/kolab/notes/Identification;
    new-instance v4, Ljava/sql/Timestamp;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-direct {v4, v5, v6}, Ljava/sql/Timestamp;-><init>(J)V

    .line 53
    .local v4, "now":Ljava/sql/Timestamp;
    new-instance v0, Lorg/kore/kolab/notes/AuditInformation;

    invoke-direct {v0, v4, v4}, Lorg/kore/kolab/notes/AuditInformation;-><init>(Ljava/sql/Timestamp;Ljava/sql/Timestamp;)V

    .line 54
    .local v0, "audit":Lorg/kore/kolab/notes/AuditInformation;
    new-instance v3, Lorg/kore/kolab/notes/Note;

    sget-object v5, Lorg/kore/kolab/notes/Note$Classification;->PUBLIC:Lorg/kore/kolab/notes/Note$Classification;

    invoke-direct {v3, v2, v0, v5, p2}, Lorg/kore/kolab/notes/Note;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Note$Classification;Ljava/lang/String;)V

    .line 55
    .local v3, "note":Lorg/kore/kolab/notes/Note;
    invoke-virtual {p0}, Lorg/kore/kolab/notes/Notebook;->getEventListener()Ljava/util/List;

    move-result-object v1

    .line 56
    .local v1, "eventListener":Ljava/util/List;, "Ljava/util/List<Lorg/kore/kolab/notes/event/EventListener;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Lorg/kore/kolab/notes/event/EventListener;

    invoke-interface {v1, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lorg/kore/kolab/notes/event/EventListener;

    invoke-virtual {v3, v5}, Lorg/kore/kolab/notes/Note;->addListener([Lorg/kore/kolab/notes/event/EventListener;)V

    .line 57
    invoke-virtual {p0, v3}, Lorg/kore/kolab/notes/Notebook;->addNote(Lorg/kore/kolab/notes/Note;)V

    .line 58
    return-object v3
.end method

.method public deleteNote(Ljava/lang/String;)V
    .registers 8
    .param p1, "uid"    # Ljava/lang/String;

    .prologue
    .line 67
    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "note"

    invoke-virtual {p0}, Lorg/kore/kolab/notes/Notebook;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v0

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/Notebook;->firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 68
    iget-object v0, p0, Lorg/kore/kolab/notes/Notebook;->notes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    return-void
.end method

.method public getNote(Ljava/lang/String;)Lorg/kore/kolab/notes/Note;
    .registers 3
    .param p1, "uid"    # Ljava/lang/String;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/kore/kolab/notes/Notebook;->notes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/Note;

    return-object v0
.end method

.method public getNotes()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/kore/kolab/notes/Note;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lorg/kore/kolab/notes/Notebook;->notes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public isShared()Z
    .registers 2

    .prologue
    .line 77
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Notebook{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-super {p0}, Lorg/kore/kolab/notes/Note;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "notes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Notebook;->notes:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
