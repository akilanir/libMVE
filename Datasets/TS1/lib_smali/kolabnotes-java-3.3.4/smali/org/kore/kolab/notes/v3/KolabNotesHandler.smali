.class public Lorg/kore/kolab/notes/v3/KolabNotesHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "KolabNotesHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;
    }
.end annotation


# instance fields
.field private final builder:Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;

.field private completeValue:Ljava/lang/StringBuilder;

.field private currentValue:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 24
    const-string v0, ""

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler;->currentValue:Ljava/lang/String;

    .line 28
    new-instance v0, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;

    invoke-direct {v0, p0}, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;-><init>(Lorg/kore/kolab/notes/v3/KolabNotesHandler;)V

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler;->builder:Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler;->completeValue:Ljava/lang/StringBuilder;

    .line 30
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .registers 6
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler;->completeValue:Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 45
    :try_start_0
    const-string v1, "attachment"

    invoke-virtual {p3, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 46
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler;->builder:Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;

    invoke-virtual {v1}, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->addAttachment()V

    .line 53
    :goto_d
    return-void

    .line 48
    :cond_e
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler;->builder:Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;

    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler;->completeValue:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p3, v2}, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->setValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_19
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_19} :catch_1a

    goto :goto_d

    .line 50
    :catch_1a
    move-exception v0

    .line 51
    .local v0, "e":Ljava/text/ParseException;
    new-instance v1, Lorg/kore/kolab/notes/v3/KolabParseException;

    invoke-direct {v1, v0}, Lorg/kore/kolab/notes/v3/KolabParseException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getNote()Lorg/kore/kolab/notes/Note;
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler;->builder:Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;

    invoke-virtual {v0}, Lorg/kore/kolab/notes/v3/KolabNotesHandler$NoteBuilder;->build()Lorg/kore/kolab/notes/Note;

    move-result-object v0

    return-object v0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 6
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabNotesHandler;->completeValue:Ljava/lang/StringBuilder;

    .line 35
    return-void
.end method
