.class final enum Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$2;
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
    .line 111
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;-><init>(Ljava/lang/String;ILorg/kore/kolab/notes/local/LocalNotesRepository$1;)V

    return-void
.end method


# virtual methods
.method public performChange(Lorg/kore/kolab/notes/local/LocalNotesRepository;Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p1, "repo"    # Lorg/kore/kolab/notes/local/LocalNotesRepository;
    .param p2, "uid"    # Ljava/lang/String;
    .param p3, "type"    # Lorg/kore/kolab/notes/event/EventListener$Type;
    .param p4, "propertyName"    # Ljava/lang/String;
    .param p5, "oldValue"    # Ljava/lang/Object;
    .param p6, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 116
    invoke-virtual {p1, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->removeEvent(Ljava/lang/String;)V

    .line 117
    return-void
.end method
