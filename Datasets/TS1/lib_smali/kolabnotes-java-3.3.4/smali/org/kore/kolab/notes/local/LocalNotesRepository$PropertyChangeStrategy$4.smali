.class final enum Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$4;
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
    .line 140
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;-><init>(Ljava/lang/String;ILorg/kore/kolab/notes/local/LocalNotesRepository$1;)V

    return-void
.end method


# virtual methods
.method public performChange(Lorg/kore/kolab/notes/local/LocalNotesRepository;Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 9
    .param p1, "repo"    # Lorg/kore/kolab/notes/local/LocalNotesRepository;
    .param p2, "uid"    # Ljava/lang/String;
    .param p3, "type"    # Lorg/kore/kolab/notes/event/EventListener$Type;
    .param p4, "propertyName"    # Ljava/lang/String;
    .param p5, "oldValue"    # Ljava/lang/Object;
    .param p6, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 144
    move-object v0, p3

    .line 145
    .local v0, "correctType":Lorg/kore/kolab/notes/event/EventListener$Type;
    const-string v1, "notebook"

    invoke-virtual {v1, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 146
    check-cast p6, Lorg/kore/kolab/notes/Notebook;

    .end local p6    # "newValue":Ljava/lang/Object;
    invoke-virtual {p1, p2, p6}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->putInNotebookCache(Ljava/lang/String;Lorg/kore/kolab/notes/Notebook;)V

    .line 154
    :cond_e
    :goto_e
    invoke-static {p1, p2, v0}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$4;->putEvent(Lorg/kore/kolab/notes/local/LocalNotesRepository;Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;)V

    .line 155
    return-void

    .line 147
    .restart local p6    # "newValue":Ljava/lang/Object;
    :cond_12
    const-string v1, "note"

    invoke-virtual {v1, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 148
    check-cast p6, Lorg/kore/kolab/notes/Note;

    .end local p6    # "newValue":Ljava/lang/Object;
    invoke-virtual {p1, p2, p6}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->putInNotesCache(Ljava/lang/String;Lorg/kore/kolab/notes/Note;)V

    goto :goto_e

    .line 149
    .restart local p6    # "newValue":Ljava/lang/Object;
    :cond_20
    const-string v1, "categories"

    invoke-virtual {v1, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 150
    sget-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    goto :goto_e

    .line 151
    :cond_2b
    const-string v1, "attachments"

    invoke-virtual {v1, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 152
    sget-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    goto :goto_e
.end method
