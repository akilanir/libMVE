.class final enum Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$5;
.super Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;
.source "LocalNotesRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .prologue
    .line 157
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;-><init>(Ljava/lang/String;ILorg/kore/kolab/notes/local/LocalNotesRepository$1;)V

    return-void
.end method


# virtual methods
.method public performChange(Lorg/kore/kolab/notes/local/LocalNotesRepository;Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 11
    .param p1, "repo"    # Lorg/kore/kolab/notes/local/LocalNotesRepository;
    .param p2, "uid"    # Ljava/lang/String;
    .param p3, "type"    # Lorg/kore/kolab/notes/event/EventListener$Type;
    .param p4, "propertyName"    # Ljava/lang/String;
    .param p5, "oldValue"    # Ljava/lang/Object;
    .param p6, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 161
    invoke-static {p5, p6}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$5;->valueChanged(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 162
    invoke-static {p1, p2, p3}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$5;->putEvent(Lorg/kore/kolab/notes/local/LocalNotesRepository;Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;)V

    .line 163
    invoke-virtual {p1, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->getNote(Ljava/lang/String;)Lorg/kore/kolab/notes/Note;

    move-result-object v0

    .line 165
    .local v0, "note":Lorg/kore/kolab/notes/Note;
    if-nez v0, :cond_13

    .line 166
    invoke-virtual {p1, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->getNotebook(Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;

    move-result-object v0

    .line 169
    :cond_13
    invoke-virtual {v0}, Lorg/kore/kolab/notes/Note;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/kore/kolab/notes/AuditInformation;->setLastModificationDate(J)V

    .line 171
    .end local v0    # "note":Lorg/kore/kolab/notes/Note;
    :cond_1e
    return-void
.end method
