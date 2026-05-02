.class public Lorg/kore/kolab/notes/Note;
.super Lorg/kore/kolab/notes/event/AbstractEventSupport;
.source "Note.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/kore/kolab/notes/Note$Classification;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/kore/kolab/notes/event/AbstractEventSupport;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/kore/kolab/notes/Note;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final attachments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/kore/kolab/notes/Attachment;",
            ">;"
        }
    .end annotation
.end field

.field private final auditInformation:Lorg/kore/kolab/notes/AuditInformation;

.field private final categories:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/kore/kolab/notes/Tag;",
            ">;"
        }
    .end annotation
.end field

.field private classification:Lorg/kore/kolab/notes/Note$Classification;

.field private color:Lorg/kore/kolab/notes/Color;

.field private description:Ljava/lang/String;

.field private final identification:Lorg/kore/kolab/notes/Identification;

.field private summary:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Note$Classification;Ljava/lang/String;)V
    .registers 6
    .param p1, "identification"    # Lorg/kore/kolab/notes/Identification;
    .param p2, "auditInformation"    # Lorg/kore/kolab/notes/AuditInformation;
    .param p3, "classification"    # Lorg/kore/kolab/notes/Note$Classification;
    .param p4, "summary"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/kore/kolab/notes/event/AbstractEventSupport;-><init>()V

    .line 55
    iput-object p1, p0, Lorg/kore/kolab/notes/Note;->identification:Lorg/kore/kolab/notes/Identification;

    .line 56
    iput-object p2, p0, Lorg/kore/kolab/notes/Note;->auditInformation:Lorg/kore/kolab/notes/AuditInformation;

    .line 57
    iput-object p3, p0, Lorg/kore/kolab/notes/Note;->classification:Lorg/kore/kolab/notes/Note$Classification;

    .line 58
    iput-object p4, p0, Lorg/kore/kolab/notes/Note;->summary:Ljava/lang/String;

    .line 59
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/Note;->categories:Ljava/util/Set;

    .line 60
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/Note;->attachments:Ljava/util/Map;

    .line 61
    return-void
.end method


# virtual methods
.method public varargs addAttachments([Lorg/kore/kolab/notes/Attachment;)V
    .registers 10
    .param p1, "atts"    # [Lorg/kore/kolab/notes/Attachment;

    .prologue
    .line 93
    array-length v7, p1

    const/4 v0, 0x0

    move v6, v0

    :goto_3
    if-ge v6, v7, :cond_25

    aget-object v5, p1, v6

    .line 94
    .local v5, "att":Lorg/kore/kolab/notes/Attachment;
    invoke-virtual {p0}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v0

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "attachments"

    const/4 v4, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/Note;->firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 95
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->attachments:Ljava/util/Map;

    invoke-virtual {v5}, Lorg/kore/kolab/notes/Attachment;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_3

    .line 97
    .end local v5    # "att":Lorg/kore/kolab/notes/Attachment;
    :cond_25
    return-void
.end method

.method public varargs addCategories([Lorg/kore/kolab/notes/Tag;)V
    .registers 10
    .param p1, "cats"    # [Lorg/kore/kolab/notes/Tag;

    .prologue
    .line 79
    array-length v7, p1

    const/4 v0, 0x0

    move v6, v0

    :goto_3
    if-ge v6, v7, :cond_21

    aget-object v5, p1, v6

    .line 80
    .local v5, "cat":Lorg/kore/kolab/notes/Tag;
    invoke-virtual {p0}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v0

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "categories"

    const/4 v4, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/Note;->firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->categories:Ljava/util/Set;

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 79
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_3

    .line 83
    .end local v5    # "cat":Lorg/kore/kolab/notes/Tag;
    :cond_21
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 37
    check-cast p1, Lorg/kore/kolab/notes/Note;

    invoke-virtual {p0, p1}, Lorg/kore/kolab/notes/Note;->compareTo(Lorg/kore/kolab/notes/Note;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/kore/kolab/notes/Note;)I
    .registers 5
    .param p1, "o"    # Lorg/kore/kolab/notes/Note;

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Lorg/kore/kolab/notes/Note;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 66
    const/4 v0, 0x0

    .line 74
    :cond_7
    :goto_7
    return v0

    .line 69
    :cond_8
    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v1

    invoke-virtual {v1}, Lorg/kore/kolab/notes/AuditInformation;->getLastModificationDate()Ljava/sql/Timestamp;

    move-result-object v1

    invoke-virtual {p0}, Lorg/kore/kolab/notes/Note;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v2

    invoke-virtual {v2}, Lorg/kore/kolab/notes/AuditInformation;->getLastModificationDate()Ljava/sql/Timestamp;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/sql/Timestamp;->compareTo(Ljava/sql/Timestamp;)I

    move-result v0

    .line 71
    .local v0, "ergebnis":I
    if-nez v0, :cond_7

    .line 72
    invoke-virtual {p0}, Lorg/kore/kolab/notes/Note;->getSummary()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getSummary()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_7
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 179
    if-ne p0, p1, :cond_5

    .line 196
    :cond_4
    :goto_4
    return v1

    .line 182
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 183
    goto :goto_4

    .line 185
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 186
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 188
    check-cast v0, Lorg/kore/kolab/notes/Note;

    .line 189
    .local v0, "other":Lorg/kore/kolab/notes/Note;
    iget-object v3, p0, Lorg/kore/kolab/notes/Note;->identification:Lorg/kore/kolab/notes/Identification;

    if-nez v3, :cond_22

    .line 190
    iget-object v3, v0, Lorg/kore/kolab/notes/Note;->identification:Lorg/kore/kolab/notes/Identification;

    if-eqz v3, :cond_4

    move v1, v2

    .line 191
    goto :goto_4

    .line 193
    :cond_22
    iget-object v3, p0, Lorg/kore/kolab/notes/Note;->identification:Lorg/kore/kolab/notes/Identification;

    iget-object v4, v0, Lorg/kore/kolab/notes/Note;->identification:Lorg/kore/kolab/notes/Identification;

    invoke-virtual {v3, v4}, Lorg/kore/kolab/notes/Identification;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 194
    goto :goto_4
.end method

.method public getAttachment(Ljava/lang/String;)Lorg/kore/kolab/notes/Attachment;
    .registers 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 114
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->attachments:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/Attachment;

    return-object v0
.end method

.method public getAttachments()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/kore/kolab/notes/Attachment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->attachments:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->auditInformation:Lorg/kore/kolab/notes/AuditInformation;

    return-object v0
.end method

.method public getCategories()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/kore/kolab/notes/Tag;",
            ">;"
        }
    .end annotation

    .prologue
    .line 166
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->categories:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getClassification()Lorg/kore/kolab/notes/Note$Classification;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->classification:Lorg/kore/kolab/notes/Note$Classification;

    return-object v0
.end method

.method public getColor()Lorg/kore/kolab/notes/Color;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->color:Lorg/kore/kolab/notes/Color;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getIdentification()Lorg/kore/kolab/notes/Identification;
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->identification:Lorg/kore/kolab/notes/Identification;

    return-object v0
.end method

.method public getSummary()Ljava/lang/String;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->summary:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 171
    const/16 v0, 0x1f

    .line 172
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 173
    .local v1, "result":I
    iget-object v2, p0, Lorg/kore/kolab/notes/Note;->identification:Lorg/kore/kolab/notes/Identification;

    if-nez v2, :cond_b

    const/4 v2, 0x0

    :goto_8
    add-int/lit8 v1, v2, 0x1f

    .line 174
    return v1

    .line 173
    :cond_b
    iget-object v2, p0, Lorg/kore/kolab/notes/Note;->identification:Lorg/kore/kolab/notes/Identification;

    invoke-virtual {v2}, Lorg/kore/kolab/notes/Identification;->hashCode()I

    move-result v2

    goto :goto_8
.end method

.method public varargs removeAttachments([Ljava/lang/String;)V
    .registers 10
    .param p1, "attId"    # [Ljava/lang/String;

    .prologue
    .line 100
    array-length v7, p1

    const/4 v0, 0x0

    move v6, v0

    :goto_3
    if-ge v6, v7, :cond_21

    aget-object v4, p1, v6

    .line 101
    .local v4, "att":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v0

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "attachments"

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/Note;->firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 102
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->attachments:Ljava/util/Map;

    invoke-interface {v0, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_3

    .line 104
    .end local v4    # "att":Ljava/lang/String;
    :cond_21
    return-void
.end method

.method public varargs removeAttachments([Lorg/kore/kolab/notes/Attachment;)V
    .registers 11
    .param p1, "atts"    # [Lorg/kore/kolab/notes/Attachment;

    .prologue
    .line 107
    array-length v8, p1

    const/4 v0, 0x0

    move v7, v0

    :goto_3
    if-ge v7, v8, :cond_29

    aget-object v6, p1, v7

    .line 108
    .local v6, "att":Lorg/kore/kolab/notes/Attachment;
    invoke-virtual {p0}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v0

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "attachments"

    invoke-virtual {v6}, Lorg/kore/kolab/notes/Attachment;->getId()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/Note;->firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->attachments:Ljava/util/Map;

    invoke-virtual {v6}, Lorg/kore/kolab/notes/Attachment;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    add-int/lit8 v0, v7, 0x1

    move v7, v0

    goto :goto_3

    .line 111
    .end local v6    # "att":Lorg/kore/kolab/notes/Attachment;
    :cond_29
    return-void
.end method

.method public varargs removeCategories([Lorg/kore/kolab/notes/Tag;)V
    .registers 10
    .param p1, "cats"    # [Lorg/kore/kolab/notes/Tag;

    .prologue
    .line 86
    array-length v7, p1

    const/4 v0, 0x0

    move v6, v0

    :goto_3
    if-ge v6, v7, :cond_21

    aget-object v4, p1, v6

    .line 87
    .local v4, "cat":Lorg/kore/kolab/notes/Tag;
    invoke-virtual {p0}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v0

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "categories"

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/Note;->firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    iget-object v0, p0, Lorg/kore/kolab/notes/Note;->categories:Ljava/util/Set;

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 86
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_3

    .line 90
    .end local v4    # "cat":Lorg/kore/kolab/notes/Tag;
    :cond_21
    return-void
.end method

.method public setClassification(Lorg/kore/kolab/notes/Note$Classification;)V
    .registers 8
    .param p1, "classification"    # Lorg/kore/kolab/notes/Note$Classification;

    .prologue
    .line 126
    invoke-virtual {p0}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v0

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "classification"

    iget-object v4, p0, Lorg/kore/kolab/notes/Note;->classification:Lorg/kore/kolab/notes/Note$Classification;

    move-object v0, p0

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/Note;->firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 127
    iput-object p1, p0, Lorg/kore/kolab/notes/Note;->classification:Lorg/kore/kolab/notes/Note$Classification;

    .line 128
    return-void
.end method

.method public setColor(Lorg/kore/kolab/notes/Color;)V
    .registers 8
    .param p1, "color"    # Lorg/kore/kolab/notes/Color;

    .prologue
    .line 153
    invoke-virtual {p0}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v0

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "color"

    iget-object v4, p0, Lorg/kore/kolab/notes/Note;->color:Lorg/kore/kolab/notes/Color;

    move-object v0, p0

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/Note;->firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 154
    iput-object p1, p0, Lorg/kore/kolab/notes/Note;->color:Lorg/kore/kolab/notes/Color;

    .line 155
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 8
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 144
    invoke-virtual {p0}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v0

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "description"

    iget-object v4, p0, Lorg/kore/kolab/notes/Note;->description:Ljava/lang/String;

    move-object v0, p0

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/Note;->firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 145
    iput-object p1, p0, Lorg/kore/kolab/notes/Note;->description:Ljava/lang/String;

    .line 146
    return-void
.end method

.method public setSummary(Ljava/lang/String;)V
    .registers 8
    .param p1, "summary"    # Ljava/lang/String;

    .prologue
    .line 135
    invoke-virtual {p0}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v0

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "summary"

    iget-object v4, p0, Lorg/kore/kolab/notes/Note;->summary:Ljava/lang/String;

    move-object v0, p0

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/Note;->firePropertyChange(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 136
    iput-object p1, p0, Lorg/kore/kolab/notes/Note;->summary:Ljava/lang/String;

    .line 137
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Note{identification="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Note;->identification:Lorg/kore/kolab/notes/Identification;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", auditInformation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Note;->auditInformation:Lorg/kore/kolab/notes/AuditInformation;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", categories="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Note;->categories:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", classification="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Note;->classification:Lorg/kore/kolab/notes/Note$Classification;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", summary="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Note;->summary:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", description="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Note;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", color="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Note;->color:Lorg/kore/kolab/notes/Color;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", attachments="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Note;->attachments:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
