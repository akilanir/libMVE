.class final enum Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$3;
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
    .line 119
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;-><init>(Ljava/lang/String;ILorg/kore/kolab/notes/local/LocalNotesRepository$1;)V

    return-void
.end method


# virtual methods
.method public performChange(Lorg/kore/kolab/notes/local/LocalNotesRepository;Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 12
    .param p1, "repo"    # Lorg/kore/kolab/notes/local/LocalNotesRepository;
    .param p2, "uid"    # Ljava/lang/String;
    .param p3, "type"    # Lorg/kore/kolab/notes/event/EventListener$Type;
    .param p4, "propertyName"    # Ljava/lang/String;
    .param p5, "oldValue"    # Ljava/lang/Object;
    .param p6, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 123
    move-object v0, p3

    .line 124
    .local v0, "correctType":Lorg/kore/kolab/notes/event/EventListener$Type;
    const-string v3, "notebook"

    invoke-virtual {v3, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 125
    invoke-virtual {p1, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->removeFromNotebookCache(Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;

    move-result-object v2

    .line 127
    .local v2, "removed":Lorg/kore/kolab/notes/Notebook;
    invoke-virtual {v2}, Lorg/kore/kolab/notes/Notebook;->getNotes()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_15
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/kore/kolab/notes/Note;

    .line 128
    .local v1, "note":Lorg/kore/kolab/notes/Note;
    invoke-virtual {v1}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v4

    invoke-virtual {v4}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, p2, v4}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->removeFromNotesCache(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_15

    .line 130
    .end local v1    # "note":Lorg/kore/kolab/notes/Note;
    .end local v2    # "removed":Lorg/kore/kolab/notes/Notebook;
    :cond_2d
    const-string v3, "note"

    invoke-virtual {v3, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_40

    .line 131
    invoke-virtual {p5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->removeFromNotesCache(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    :cond_3c
    :goto_3c
    invoke-static {p1, p2, v0}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$3;->putEvent(Lorg/kore/kolab/notes/local/LocalNotesRepository;Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;)V

    .line 138
    return-void

    .line 132
    :cond_40
    const-string v3, "categories"

    invoke-virtual {v3, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 133
    sget-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    goto :goto_3c

    .line 134
    :cond_4b
    const-string v3, "attachments"

    invoke-virtual {v3, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 135
    sget-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    goto :goto_3c
.end method
