.class public final Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;
.super Ljava/lang/Object;
.source "KolabNotesXMLBuilder.java"


# instance fields
.field private final builder:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "<?xml version=\"1.0\" encoding=\"UTF-8\"?><note xmlns=\"http://kolab.org\" version=\"3.0\">"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    .line 32
    return-void
.end method


# virtual methods
.method public build()Ljava/lang/String;
    .registers 3

    .prologue
    .line 144
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "</note>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method createTimestampString(Ljava/util/Date;)Ljava/lang/String;
    .registers 11
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    const/16 v8, 0x3a

    const/16 v7, 0x2d

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 60
    const-string v2, "UTC"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 61
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 63
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "%1$04d"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    const-string v2, "%1$02d"

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 67
    const-string v2, "%1$02d"

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x5

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    const/16 v2, 0x54

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    const-string v2, "%1$02d"

    new-array v3, v5, [Ljava/lang/Object;

    const/16 v4, 0xb

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 71
    const-string v2, "%1$02d"

    new-array v3, v5, [Ljava/lang/Object;

    const/16 v4, 0xc

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 73
    const-string v2, "%1$02d"

    new-array v3, v5, [Ljava/lang/Object;

    const/16 v4, 0xd

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    const/16 v2, 0x5a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public withAttachments(Ljava/util/Collection;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/kore/kolab/notes/Attachment;",
            ">;)",
            "Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "attachments":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/kore/kolab/notes/Attachment;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_79

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/Attachment;

    .line 100
    .local v0, "attachment":Lorg/kore/kolab/notes/Attachment;
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "<attachment>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "<parameters>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "<fmttype>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Attachment;->getMimeType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "</fmttype>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "<x-label>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Attachment;->getFileName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "</x-label>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "</parameters>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "<uri>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "cid:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Attachment;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "</uri>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "</attachment>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 115
    .end local v0    # "attachment":Lorg/kore/kolab/notes/Attachment;
    :cond_79
    return-object p0
.end method

.method public withAuditInformation(Lorg/kore/kolab/notes/AuditInformation;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;
    .registers 6
    .param p1, "id"    # Lorg/kore/kolab/notes/AuditInformation;

    .prologue
    .line 47
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "<creation-date>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    invoke-virtual {p1}, Lorg/kore/kolab/notes/AuditInformation;->getCreationDate()Ljava/sql/Timestamp;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->createTimestampString(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "creation":Ljava/lang/String;
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "</creation-date>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "<last-modification-date>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    invoke-virtual {p1}, Lorg/kore/kolab/notes/AuditInformation;->getLastModificationDate()Ljava/sql/Timestamp;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->createTimestampString(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 54
    .local v1, "modification":Ljava/lang/String;
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v3, "</last-modification-date>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    return-object p0
.end method

.method public withClassification(Lorg/kore/kolab/notes/Note$Classification;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;
    .registers 4
    .param p1, "classification"    # Lorg/kore/kolab/notes/Note$Classification;

    .prologue
    .line 80
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "<classification>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note$Classification;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "</classification>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    return-object p0
.end method

.method public withColor(Lorg/kore/kolab/notes/Color;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;
    .registers 4
    .param p1, "color"    # Lorg/kore/kolab/notes/Color;

    .prologue
    .line 133
    if-eqz p1, :cond_1a

    .line 134
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "<color>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lorg/kore/kolab/notes/Color;->getHexcode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "</color>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    :goto_19
    return-object p0

    .line 138
    :cond_1a
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "<color/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_19
.end method

.method public withDescription(Ljava/lang/String;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;
    .registers 6
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 119
    if-eqz p1, :cond_2e

    .line 120
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v2, "<description>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    const-string v1, ">"

    const-string v2, "&gt;"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "<"

    const-string v3, "&lt;"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "&nbsp;"

    const-string v3, " "

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 124
    .local v0, "correct":Ljava/lang/String;
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v2, "</description>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .end local v0    # "correct":Ljava/lang/String;
    :goto_2d
    return-object p0

    .line 127
    :cond_2e
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v2, "<description/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2d
.end method

.method public withIdentification(Lorg/kore/kolab/notes/Identification;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;
    .registers 4
    .param p1, "id"    # Lorg/kore/kolab/notes/Identification;

    .prologue
    .line 36
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "<uid>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "</uid>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "<prodid>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Identification;->getProductId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "</prodid>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    return-object p0
.end method

.method public withSummary(Ljava/lang/String;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;
    .registers 4
    .param p1, "summray"    # Ljava/lang/String;

    .prologue
    .line 88
    if-eqz p1, :cond_16

    .line 89
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "<summary>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "</summary>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    :goto_15
    return-object p0

    .line 93
    :cond_16
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->builder:Ljava/lang/StringBuilder;

    const-string v1, "<summary/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_15
.end method
