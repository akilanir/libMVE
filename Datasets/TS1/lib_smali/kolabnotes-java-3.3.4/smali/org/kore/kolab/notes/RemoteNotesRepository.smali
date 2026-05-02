.class public interface abstract Lorg/kore/kolab/notes/RemoteNotesRepository;
.super Ljava/lang/Object;
.source "RemoteNotesRepository.java"

# interfaces
.implements Lorg/kore/kolab/notes/NotesRepository;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;,
        Lorg/kore/kolab/notes/RemoteNotesRepository$Base64Coder;
    }
.end annotation


# virtual methods
.method public abstract fillUnloadedNote(Lorg/kore/kolab/notes/Note;)V
.end method

.method public varargs abstract merge(Ljava/util/Map;[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/kore/kolab/notes/event/EventListener$Type;",
            ">;[",
            "Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;",
            ")V"
        }
    .end annotation
.end method

.method public varargs abstract merge([Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V
.end method

.method public abstract noteCompletelyLoaded(Lorg/kore/kolab/notes/Note;)Z
.end method

.method public varargs abstract refresh(Ljava/util/Date;[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V
.end method

.method public varargs abstract refresh([Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V
.end method

.method public abstract setBase64Coder(Lorg/kore/kolab/notes/RemoteNotesRepository$Base64Coder;)V
.end method
