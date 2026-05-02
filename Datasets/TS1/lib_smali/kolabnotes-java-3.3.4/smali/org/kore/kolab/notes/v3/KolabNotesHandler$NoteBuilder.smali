.class Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;
.super Ljava/lang/Object;
.source "KolabNotesHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/v3/KolabNotesHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NoteBuilder"
.end annotation


# instance fields
.field private attachments:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/kore/kolab/notes/Attachment;",
            ">;"
        }
    .end annotation
.end field

.field private classification:Lorg/kore/kolab/notes/Note$Classification;

.field private color:Lorg/kore/kolab/notes/Color;

.field private creationDate:Ljava/sql/Timestamp;

.field private description:Ljava/lang/String;

.field private fmttype:Ljava/lang/String;

.field private lastModificationDate:Ljava/sql/Timestamp;

.field private productId:Ljava/lang/String;

.field private summary:Ljava/lang/String;

.field final synthetic this$0:Lorg/kore/kolab/notes/v3/KolabNotesHandler;

.field private uid:Ljava/lang/String;

.field private uri:Ljava/lang/String;

.field private xlabel:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/kore/kolab/notes/v3/KolabNotesHandler;)V
    .registers 3
    .param p1, "this$0"    # Lorg/kore/kolab/notes/v3/KolabNotesHandler;

    .prologue
    .line 59
    iput-object p1, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->this$0:Lorg/kore/kolab/notes/v3/KolabNotesHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->attachments:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method addAttachment()V
    .registers 6

    .prologue
    .line 77
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->attachments:Ljava/util/Set;

    new-instance v1, Lorg/kore/kolab/notes/Attachment;

    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->uri:Ljava/lang/String;

    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->xlabel:Ljava/lang/String;

    iget-object v4, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->fmttype:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lorg/kore/kolab/notes/Attachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 78
    return-void
.end method

.method build()Lorg/kore/kolab/notes/Note;
    .registers 6

    .prologue
    .line 107
    new-instance v1, Lorg/kore/kolab/notes/Identification;

    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->uid:Ljava/lang/String;

    iget-object v4, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->productId:Ljava/lang/String;

    invoke-direct {v1, v3, v4}, Lorg/kore/kolab/notes/Identification;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .local v1, "id":Lorg/kore/kolab/notes/Identification;
    new-instance v0, Lorg/kore/kolab/notes/AuditInformation;

    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->creationDate:Ljava/sql/Timestamp;

    iget-object v4, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->lastModificationDate:Ljava/sql/Timestamp;

    invoke-direct {v0, v3, v4}, Lorg/kore/kolab/notes/AuditInformation;-><init>(Ljava/sql/Timestamp;Ljava/sql/Timestamp;)V

    .line 109
    .local v0, "auditInformation":Lorg/kore/kolab/notes/AuditInformation;
    new-instance v2, Lorg/kore/kolab/notes/Note;

    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->classification:Lorg/kore/kolab/notes/Note$Classification;

    iget-object v4, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->summary:Ljava/lang/String;

    invoke-direct {v2, v1, v0, v3, v4}, Lorg/kore/kolab/notes/Note;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Note$Classification;Ljava/lang/String;)V

    .line 110
    .local v2, "note":Lorg/kore/kolab/notes/Note;
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->description:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/kore/kolab/notes/Note;->setDescription(Ljava/lang/String;)V

    .line 111
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->summary:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/kore/kolab/notes/Note;->setSummary(Ljava/lang/String;)V

    .line 112
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->color:Lorg/kore/kolab/notes/Color;

    invoke-virtual {v2, v3}, Lorg/kore/kolab/notes/Note;->setColor(Lorg/kore/kolab/notes/Color;)V

    .line 113
    iget-object v3, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->attachments:Ljava/util/Set;

    iget-object v4, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->attachments:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    new-array v4, v4, [Lorg/kore/kolab/notes/Attachment;

    invoke-interface {v3, v4}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/kore/kolab/notes/Attachment;

    invoke-virtual {v2, v3}, Lorg/kore/kolab/notes/Note;->addAttachments([Lorg/kore/kolab/notes/Attachment;)V

    .line 115
    return-object v2
.end method

.method convertTimestamp(Ljava/lang/String;)Ljava/sql/Timestamp;
    .registers 11
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x13

    const/16 v7, 0x11

    const/16 v6, 0xb

    const/4 v5, 0x5

    const/16 v4, 0xd

    .line 119
    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 120
    .local v0, "calendar":Ljava/util/Calendar;
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 121
    const/4 v1, 0x2

    const/4 v2, 0x7

    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 122
    const/16 v1, 0x8

    const/16 v2, 0xa

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v5, v1}, Ljava/util/Calendar;->set(II)V

    .line 123
    invoke-virtual {p1, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v6, v1}, Ljava/util/Calendar;->set(II)V

    .line 124
    const/16 v1, 0xc

    const/16 v2, 0xe

    const/16 v3, 0x10

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 125
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v1, v8, :cond_8e

    .line 126
    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v4, v1}, Ljava/util/Calendar;->set(II)V

    .line 131
    :goto_84
    new-instance v1, Ljava/sql/Timestamp;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/sql/Timestamp;-><init>(J)V

    return-object v1

    .line 128
    :cond_8e
    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v4, v1}, Ljava/util/Calendar;->set(II)V

    goto :goto_84
.end method

.method setValue(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 81
    const-string v0, "uid"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 82
    iput-object p2, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->uid:Ljava/lang/String;

    .line 104
    :cond_a
    :goto_a
    return-void

    .line 83
    :cond_b
    const-string v0, "prodid"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 84
    iput-object p2, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->productId:Ljava/lang/String;

    goto :goto_a

    .line 85
    :cond_16
    const-string v0, "creation-date"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 86
    invoke-virtual {p0, p2}, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->convertTimestamp(Ljava/lang/String;)Ljava/sql/Timestamp;

    move-result-object v0

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->creationDate:Ljava/sql/Timestamp;

    goto :goto_a

    .line 87
    :cond_25
    const-string v0, "last-modification-date"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 88
    invoke-virtual {p0, p2}, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->convertTimestamp(Ljava/lang/String;)Ljava/sql/Timestamp;

    move-result-object v0

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->lastModificationDate:Ljava/sql/Timestamp;

    goto :goto_a

    .line 89
    :cond_34
    const-string v0, "classification"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 90
    invoke-virtual {p2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/kore/kolab/notes/Note$Classification;->valueOf(Ljava/lang/String;)Lorg/kore/kolab/notes/Note$Classification;

    move-result-object v0

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->classification:Lorg/kore/kolab/notes/Note$Classification;

    goto :goto_a

    .line 91
    :cond_47
    const-string v0, "summary"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_52

    .line 92
    iput-object p2, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->summary:Ljava/lang/String;

    goto :goto_a

    .line 93
    :cond_52
    const-string v0, "description"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5d

    .line 94
    iput-object p2, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->description:Ljava/lang/String;

    goto :goto_a

    .line 95
    :cond_5d
    const-string v0, "color"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6c

    .line 96
    invoke-static {p2}, Lorg/kore/kolab/notes/Colors;->getColor(Ljava/lang/String;)Lorg/kore/kolab/notes/Color;

    move-result-object v0

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->color:Lorg/kore/kolab/notes/Color;

    goto :goto_a

    .line 97
    :cond_6c
    const-string v0, "fmttype"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7b

    .line 98
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->fmttype:Ljava/lang/String;

    goto :goto_a

    .line 99
    :cond_7b
    const-string v0, "uri"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_93

    .line 100
    const-string v0, ":"

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->uri:Ljava/lang/String;

    goto/16 :goto_a

    .line 101
    :cond_93
    const-string v0, "x-label"

    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 102
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->xlabel:Ljava/lang/String;

    goto/16 :goto_a
.end method
