.class public interface abstract Lorg/kore/kolab/notes/NotesRepository;
.super Ljava/lang/Object;
.source "NotesRepository.java"


# virtual methods
.method public abstract createNotebook(Ljava/lang/String;Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;
.end method

.method public abstract deleteNotebook(Ljava/lang/String;)Z
.end method

.method public abstract exportNotebook(Lorg/kore/kolab/notes/Notebook;Ljava/io/File;)Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract exportNotebook(Lorg/kore/kolab/notes/Notebook;Lorg/kore/kolab/notes/KolabParser;Ljava/io/File;)Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract exportNotebook(Lorg/kore/kolab/notes/Notebook;Lorg/kore/kolab/notes/KolabParser;Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getNote(Ljava/lang/String;)Lorg/kore/kolab/notes/Note;
.end method

.method public abstract getNotebook(Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;
.end method

.method public abstract getNotebookBySummary(Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;
.end method

.method public abstract getNotebooks()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/kore/kolab/notes/Notebook;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getNotes()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/kore/kolab/notes/Note;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getNotesParser()Lorg/kore/kolab/notes/KolabParser;
.end method

.method public abstract getRootFolder()Ljava/lang/String;
.end method

.method public abstract getTrackedChanges()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/kore/kolab/notes/event/EventListener$Type;",
            ">;"
        }
    .end annotation
.end method

.method public abstract importNotebook(Ljava/io/File;)Lorg/kore/kolab/notes/Notebook;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract importNotebook(Ljava/io/File;Lorg/kore/kolab/notes/KolabParser;)Lorg/kore/kolab/notes/Notebook;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract importNotebook(Ljava/lang/String;Lorg/kore/kolab/notes/KolabParser;Ljava/io/InputStream;)Lorg/kore/kolab/notes/Notebook;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract trackExisitingNotebooks(Ljava/util/Collection;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/kore/kolab/notes/Notebook;",
            ">;)V"
        }
    .end annotation
.end method
