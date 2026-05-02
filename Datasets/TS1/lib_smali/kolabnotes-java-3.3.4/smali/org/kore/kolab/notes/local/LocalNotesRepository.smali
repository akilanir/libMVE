.class public Lorg/kore/kolab/notes/local/LocalNotesRepository;
.super Ljava/lang/Object;
.source "LocalNotesRepository.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lorg/kore/kolab/notes/NotesRepository;
.implements Lorg/kore/kolab/notes/event/EventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;
    }
.end annotation


# instance fields
.field protected final deletedNotebookCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/kore/kolab/notes/Notebook;",
            ">;"
        }
    .end annotation
.end field

.field protected final deletedNotesCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/kore/kolab/notes/Note;",
            ">;>;"
        }
    .end annotation
.end field

.field private disableChangeListening:Z

.field protected final eventCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/kore/kolab/notes/event/EventListener$Type;",
            ">;"
        }
    .end annotation
.end field

.field protected final notebookCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/kore/kolab/notes/Notebook;",
            ">;"
        }
    .end annotation
.end field

.field protected final notesCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/kore/kolab/notes/Note;",
            ">;"
        }
    .end annotation
.end field

.field protected final parser:Lorg/kore/kolab/notes/KolabParser;

.field protected final rootfolder:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/kore/kolab/notes/KolabParser;Ljava/lang/String;)V
    .registers 4
    .param p1, "parser"    # Lorg/kore/kolab/notes/KolabParser;
    .param p2, "rootFolder"    # Ljava/lang/String;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->disableChangeListening:Z

    .line 62
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notebookCache:Ljava/util/Map;

    .line 63
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notesCache:Ljava/util/Map;

    .line 64
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->deletedNotebookCache:Ljava/util/Map;

    .line 65
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->deletedNotesCache:Ljava/util/Map;

    .line 66
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->eventCache:Ljava/util/Map;

    .line 67
    iput-object p1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->parser:Lorg/kore/kolab/notes/KolabParser;

    .line 68
    iput-object p2, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->rootfolder:Ljava/lang/String;

    .line 69
    return-void
.end method

.method private createZIP(Ljava/io/OutputStream;Lorg/kore/kolab/notes/Notebook;Lorg/kore/kolab/notes/KolabParser;)V
    .registers 13
    .param p1, "destination"    # Ljava/io/OutputStream;
    .param p2, "notebook"    # Lorg/kore/kolab/notes/Notebook;
    .param p3, "parser1"    # Lorg/kore/kolab/notes/KolabParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 358
    const-string v1, ".xml"

    .line 359
    .local v1, "fileEnding":Ljava/lang/String;
    new-instance v5, Ljava/util/zip/ZipOutputStream;

    invoke-direct {v5, p1}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 360
    .local v5, "outStream":Ljava/util/zip/ZipOutputStream;
    invoke-virtual {p2}, Lorg/kore/kolab/notes/Notebook;->getNotes()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_f
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_52

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/kore/kolab/notes/Note;

    .line 361
    .local v2, "note":Lorg/kore/kolab/notes/Note;
    new-instance v0, Ljava/util/zip/ZipEntry;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lorg/kore/kolab/notes/Note;->getSummary()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".xml"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 362
    .local v0, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v5, v0}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 363
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 364
    .local v4, "noteStream":Ljava/io/ByteArrayOutputStream;
    invoke-interface {p3, v2, v4}, Lorg/kore/kolab/notes/KolabParser;->write(Ljava/lang/Object;Ljava/io/OutputStream;)V

    .line 365
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 366
    .local v3, "noteBytes":[B
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 367
    const/4 v7, 0x0

    array-length v8, v3

    invoke-virtual {v5, v3, v7, v8}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    .line 368
    invoke-virtual {v5}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    goto :goto_f

    .line 370
    .end local v0    # "entry":Ljava/util/zip/ZipEntry;
    .end local v2    # "note":Lorg/kore/kolab/notes/Note;
    .end local v3    # "noteBytes":[B
    .end local v4    # "noteStream":Ljava/io/ByteArrayOutputStream;
    :cond_52
    invoke-virtual {v5}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 371
    return-void
.end method

.method private replacePossibleIllegalFileCharacters(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 339
    const-string v0, "[^a-zA-Z0-9.-]"

    const-string v1, "_"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected addNote(Ljava/lang/String;Lorg/kore/kolab/notes/Note;)V
    .registers 5
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "note"    # Lorg/kore/kolab/notes/Note;

    .prologue
    .line 282
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notesCache:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/kore/kolab/notes/event/EventListener;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-virtual {p2, v0}, Lorg/kore/kolab/notes/Note;->addListener([Lorg/kore/kolab/notes/event/EventListener;)V

    .line 284
    return-void
.end method

.method protected addNotebook(Ljava/lang/String;Lorg/kore/kolab/notes/Notebook;)V
    .registers 5
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "notebook"    # Lorg/kore/kolab/notes/Notebook;

    .prologue
    .line 277
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notebookCache:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/kore/kolab/notes/event/EventListener;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-virtual {p2, v0}, Lorg/kore/kolab/notes/Notebook;->addListener([Lorg/kore/kolab/notes/event/EventListener;)V

    .line 279
    return-void
.end method

.method public createNotebook(Ljava/lang/String;Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;
    .registers 12
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "summary"    # Ljava/lang/String;

    .prologue
    .line 267
    new-instance v7, Lorg/kore/kolab/notes/Identification;

    const-string v0, "kolabnotes-java"

    invoke-direct {v7, p1, v0}, Lorg/kore/kolab/notes/Identification;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    .local v7, "identification":Lorg/kore/kolab/notes/Identification;
    new-instance v8, Ljava/sql/Timestamp;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {v8, v0, v1}, Ljava/sql/Timestamp;-><init>(J)V

    .line 269
    .local v8, "now":Ljava/sql/Timestamp;
    new-instance v6, Lorg/kore/kolab/notes/AuditInformation;

    invoke-direct {v6, v8, v8}, Lorg/kore/kolab/notes/AuditInformation;-><init>(Ljava/sql/Timestamp;Ljava/sql/Timestamp;)V

    .line 270
    .local v6, "audit":Lorg/kore/kolab/notes/AuditInformation;
    new-instance v5, Lorg/kore/kolab/notes/Notebook;

    sget-object v0, Lorg/kore/kolab/notes/Note$Classification;->PUBLIC:Lorg/kore/kolab/notes/Note$Classification;

    invoke-direct {v5, v7, v6, v0, p2}, Lorg/kore/kolab/notes/Notebook;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Note$Classification;Ljava/lang/String;)V

    .line 271
    .local v5, "notebook":Lorg/kore/kolab/notes/Notebook;
    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "notebook"

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->propertyChanged(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 272
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/kore/kolab/notes/event/EventListener;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-virtual {v5, v0}, Lorg/kore/kolab/notes/Notebook;->addListener([Lorg/kore/kolab/notes/event/EventListener;)V

    .line 273
    return-object v5
.end method

.method public deleteNotebook(Ljava/lang/String;)Z
    .registers 8
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 261
    sget-object v2, Lorg/kore/kolab/notes/event/EventListener$Type;->DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v3, "notebook"

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v4, p1

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->propertyChanged(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 262
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notebookCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_15

    const/4 v0, 0x1

    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method protected disableChangeListening()V
    .registers 2

    .prologue
    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->disableChangeListening:Z

    .line 73
    return-void
.end method

.method protected enableChangeListening()V
    .registers 2

    .prologue
    .line 76
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->disableChangeListening:Z

    .line 77
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 471
    if-nez p1, :cond_4

    .line 481
    :cond_3
    :goto_3
    return v1

    .line 474
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_3

    move-object v0, p1

    .line 477
    check-cast v0, Lorg/kore/kolab/notes/local/LocalNotesRepository;

    .line 478
    .local v0, "other":Lorg/kore/kolab/notes/local/LocalNotesRepository;
    iget-object v2, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->rootfolder:Ljava/lang/String;

    if-nez v2, :cond_1b

    iget-object v2, v0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->rootfolder:Ljava/lang/String;

    if-nez v2, :cond_3

    .line 481
    :cond_19
    const/4 v1, 0x1

    goto :goto_3

    .line 478
    :cond_1b
    iget-object v2, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->rootfolder:Ljava/lang/String;

    iget-object v3, v0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->rootfolder:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_19

    goto :goto_3
.end method

.method public exportNotebook(Lorg/kore/kolab/notes/Notebook;Ljava/io/File;)Ljava/io/File;
    .registers 4
    .param p1, "nb"    # Lorg/kore/kolab/notes/Notebook;
    .param p2, "destination"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 335
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->parser:Lorg/kore/kolab/notes/KolabParser;

    invoke-virtual {p0, p1, v0, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->exportNotebook(Lorg/kore/kolab/notes/Notebook;Lorg/kore/kolab/notes/KolabParser;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public exportNotebook(Lorg/kore/kolab/notes/Notebook;Lorg/kore/kolab/notes/KolabParser;Ljava/io/File;)Ljava/io/File;
    .registers 7
    .param p1, "notebook"    # Lorg/kore/kolab/notes/Notebook;
    .param p2, "parser"    # Lorg/kore/kolab/notes/KolabParser;
    .param p3, "destination"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 345
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Notebook;->getSummary()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->replacePossibleIllegalFileCharacters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".zip"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 346
    .local v0, "zipFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    .line 348
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v1, p1, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->createZIP(Ljava/io/OutputStream;Lorg/kore/kolab/notes/Notebook;Lorg/kore/kolab/notes/KolabParser;)V

    .line 349
    return-object v0
.end method

.method public exportNotebook(Lorg/kore/kolab/notes/Notebook;Lorg/kore/kolab/notes/KolabParser;Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "notebook"    # Lorg/kore/kolab/notes/Notebook;
    .param p2, "parser"    # Lorg/kore/kolab/notes/KolabParser;
    .param p3, "destination"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 354
    invoke-direct {p0, p3, p1, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->createZIP(Ljava/io/OutputStream;Lorg/kore/kolab/notes/Notebook;Lorg/kore/kolab/notes/KolabParser;)V

    .line 355
    return-void
.end method

.method getEntryAsByteArray(Ljava/util/zip/ZipInputStream;)[B
    .registers 6
    .param p1, "zis"    # Ljava/util/zip/ZipInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 410
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 411
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v3, 0x400

    new-array v1, v3, [B

    .line 413
    .local v1, "buffer":[B
    :goto_9
    invoke-virtual {p1, v1}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v2

    .local v2, "count":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_15

    .line 414
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_9

    .line 416
    :cond_15
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method

.method public getEvent(Ljava/lang/String;)Lorg/kore/kolab/notes/event/EventListener$Type;
    .registers 3
    .param p1, "uid"    # Ljava/lang/String;

    .prologue
    .line 217
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->eventCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/event/EventListener$Type;

    return-object v0
.end method

.method public getNote(Ljava/lang/String;)Lorg/kore/kolab/notes/Note;
    .registers 3
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 226
    invoke-virtual {p0}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->initCache()V

    .line 227
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notesCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/Note;

    return-object v0
.end method

.method public getNotebook(Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;
    .registers 3
    .param p1, "uid"    # Ljava/lang/String;

    .prologue
    .line 244
    invoke-virtual {p0}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->initCache()V

    .line 245
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notebookCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/Notebook;

    return-object v0
.end method

.method public getNotebookBySummary(Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;
    .registers 5
    .param p1, "summary"    # Ljava/lang/String;

    .prologue
    .line 250
    invoke-virtual {p0}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->initCache()V

    .line 251
    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notebookCache:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/Notebook;

    .line 252
    .local v0, "nb":Lorg/kore/kolab/notes/Notebook;
    invoke-virtual {v0}, Lorg/kore/kolab/notes/Notebook;->getSummary()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 256
    .end local v0    # "nb":Lorg/kore/kolab/notes/Notebook;
    :goto_23
    return-object v0

    :cond_24
    const/4 v0, 0x0

    goto :goto_23
.end method

.method public getNotebooks()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/kore/kolab/notes/Notebook;",
            ">;"
        }
    .end annotation

    .prologue
    .line 238
    invoke-virtual {p0}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->initCache()V

    .line 239
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notebookCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getNotes()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/kore/kolab/notes/Note;",
            ">;"
        }
    .end annotation

    .prologue
    .line 232
    invoke-virtual {p0}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->initCache()V

    .line 233
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notesCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getNotesParser()Lorg/kore/kolab/notes/KolabParser;
    .registers 2

    .prologue
    .line 325
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->parser:Lorg/kore/kolab/notes/KolabParser;

    return-object v0
.end method

.method public getRootFolder()Ljava/lang/String;
    .registers 2

    .prologue
    .line 330
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->rootfolder:Ljava/lang/String;

    return-object v0
.end method

.method public getTrackedChanges()Ljava/util/Map;
    .registers 2
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

    .prologue
    .line 85
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->eventCache:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 464
    const/4 v0, 0x7

    .line 465
    .local v0, "hash":I
    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->rootfolder:Ljava/lang/String;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->rootfolder:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_b
    add-int/lit16 v0, v1, 0x229

    .line 466
    return v0

    .line 465
    :cond_e
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public importNotebook(Ljava/io/File;)Lorg/kore/kolab/notes/Notebook;
    .registers 3
    .param p1, "zipFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 458
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->parser:Lorg/kore/kolab/notes/KolabParser;

    invoke-virtual {p0, p1, v0}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->importNotebook(Ljava/io/File;Lorg/kore/kolab/notes/KolabParser;)Lorg/kore/kolab/notes/Notebook;

    move-result-object v0

    return-object v0
.end method

.method public importNotebook(Ljava/io/File;Lorg/kore/kolab/notes/KolabParser;)Lorg/kore/kolab/notes/Notebook;
    .registers 15
    .param p1, "zipFile"    # Ljava/io/File;
    .param p2, "parser"    # Lorg/kore/kolab/notes/KolabParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 422
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    .line 423
    .local v6, "notebookName":Ljava/lang/String;
    const-string v3, ".ZIP"

    .line 424
    .local v3, "fileExtension":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1e

    .line 425
    const/4 v9, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v11

    sub-int/2addr v10, v11

    invoke-virtual {v6, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 429
    :cond_1e
    invoke-virtual {p0, v6}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->getNotebookBySummary(Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;

    move-result-object v2

    .line 430
    .local v2, "existingBook":Lorg/kore/kolab/notes/Notebook;
    if-nez v2, :cond_64

    .line 431
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9, v6}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->createNotebook(Ljava/lang/String;Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;

    move-result-object v0

    .line 436
    .local v0, "book":Lorg/kore/kolab/notes/Notebook;
    :goto_30
    new-instance v8, Ljava/util/zip/ZipFile;

    invoke-direct {v8, p1}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    .line 437
    .local v8, "zip":Ljava/util/zip/ZipFile;
    invoke-virtual {v8}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v1

    .line 439
    .local v1, "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    :goto_39
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_66

    .line 440
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/zip/ZipEntry;

    .line 442
    .local v5, "nextElement":Ljava/util/zip/ZipEntry;
    invoke-virtual {v8, v5}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v4

    .line 444
    .local v4, "inputStream":Ljava/io/InputStream;
    invoke-interface {p2, v4}, Lorg/kore/kolab/notes/KolabParser;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/kore/kolab/notes/Note;

    .line 446
    .local v7, "parse":Lorg/kore/kolab/notes/Note;
    invoke-virtual {v7}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v9

    invoke-virtual {v9}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Lorg/kore/kolab/notes/Notebook;->getNote(Ljava/lang/String;)Lorg/kore/kolab/notes/Note;

    move-result-object v9

    if-nez v9, :cond_60

    .line 447
    invoke-virtual {v0, v7}, Lorg/kore/kolab/notes/Notebook;->addNote(Lorg/kore/kolab/notes/Note;)V

    .line 450
    :cond_60
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    goto :goto_39

    .line 433
    .end local v0    # "book":Lorg/kore/kolab/notes/Notebook;
    .end local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v4    # "inputStream":Ljava/io/InputStream;
    .end local v5    # "nextElement":Ljava/util/zip/ZipEntry;
    .end local v7    # "parse":Lorg/kore/kolab/notes/Note;
    .end local v8    # "zip":Ljava/util/zip/ZipFile;
    :cond_64
    move-object v0, v2

    .restart local v0    # "book":Lorg/kore/kolab/notes/Notebook;
    goto :goto_30

    .line 453
    .restart local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v8    # "zip":Ljava/util/zip/ZipFile;
    :cond_66
    return-object v0
.end method

.method public importNotebook(Ljava/lang/String;Lorg/kore/kolab/notes/KolabParser;Ljava/io/InputStream;)Lorg/kore/kolab/notes/Notebook;
    .registers 15
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "parser"    # Lorg/kore/kolab/notes/KolabParser;
    .param p3, "zipFile"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 375
    move-object v5, p1

    .line 376
    .local v5, "notebookName":Ljava/lang/String;
    const-string v3, ".ZIP"

    .line 377
    .local v3, "fileExtension":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1b

    .line 378
    const/4 v8, 0x0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v10

    sub-int/2addr v9, v10

    invoke-virtual {v5, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 382
    :cond_1b
    invoke-virtual {p0, v5}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->getNotebookBySummary(Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;

    move-result-object v2

    .line 383
    .local v2, "existingBook":Lorg/kore/kolab/notes/Notebook;
    if-nez v2, :cond_5c

    .line 384
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v5}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->createNotebook(Ljava/lang/String;Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;

    move-result-object v0

    .line 389
    .local v0, "book":Lorg/kore/kolab/notes/Notebook;
    :goto_2d
    new-instance v7, Ljava/util/zip/ZipInputStream;

    invoke-direct {v7, p3}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 391
    .local v7, "zipStream":Ljava/util/zip/ZipInputStream;
    :goto_32
    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v4

    .local v4, "nextElement":Ljava/util/zip/ZipEntry;
    if-eqz v4, :cond_5e

    .line 394
    invoke-virtual {p0, v7}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->getEntryAsByteArray(Ljava/util/zip/ZipInputStream;)[B

    move-result-object v1

    .line 396
    .local v1, "entryAsByteArray":[B
    new-instance v8, Ljava/io/ByteArrayInputStream;

    invoke-direct {v8, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-interface {p2, v8}, Lorg/kore/kolab/notes/KolabParser;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/kore/kolab/notes/Note;

    .line 398
    .local v6, "parse":Lorg/kore/kolab/notes/Note;
    invoke-virtual {v6}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v8

    invoke-virtual {v8}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Lorg/kore/kolab/notes/Notebook;->getNote(Ljava/lang/String;)Lorg/kore/kolab/notes/Note;

    move-result-object v8

    if-nez v8, :cond_58

    .line 399
    invoke-virtual {v0, v6}, Lorg/kore/kolab/notes/Notebook;->addNote(Lorg/kore/kolab/notes/Note;)V

    .line 402
    :cond_58
    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    goto :goto_32

    .line 386
    .end local v0    # "book":Lorg/kore/kolab/notes/Notebook;
    .end local v1    # "entryAsByteArray":[B
    .end local v4    # "nextElement":Ljava/util/zip/ZipEntry;
    .end local v6    # "parse":Lorg/kore/kolab/notes/Note;
    .end local v7    # "zipStream":Ljava/util/zip/ZipInputStream;
    :cond_5c
    move-object v0, v2

    .restart local v0    # "book":Lorg/kore/kolab/notes/Notebook;
    goto :goto_2d

    .line 404
    .restart local v4    # "nextElement":Ljava/util/zip/ZipEntry;
    .restart local v7    # "zipStream":Ljava/util/zip/ZipInputStream;
    :cond_5e
    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->close()V

    .line 406
    return-object v0
.end method

.method protected initCache()V
    .registers 1

    .prologue
    .line 222
    return-void
.end method

.method protected isChangeListeningDisabled()Z
    .registers 2

    .prologue
    .line 80
    iget-boolean v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->disableChangeListening:Z

    return v0
.end method

.method public propertyChanged(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 14
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "type"    # Lorg/kore/kolab/notes/event/EventListener$Type;
    .param p3, "propertyName"    # Ljava/lang/String;
    .param p4, "oldValue"    # Ljava/lang/Object;
    .param p5, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 207
    iget-boolean v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->disableChangeListening:Z

    if-eqz v0, :cond_5

    .line 214
    :goto_4
    return-void

    .line 211
    :cond_5
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->eventCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/kore/kolab/notes/event/EventListener$Type;

    .line 213
    .local v7, "eventType":Lorg/kore/kolab/notes/event/EventListener$Type;
    invoke-static {v7, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->valueOf(Lorg/kore/kolab/notes/event/EventListener$Type;Lorg/kore/kolab/notes/event/EventListener$Type;)Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    move-result-object v0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->performChange(Lorg/kore/kolab/notes/local/LocalNotesRepository;Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4
.end method

.method protected putEvent(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;)V
    .registers 4
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "type"    # Lorg/kore/kolab/notes/event/EventListener$Type;

    .prologue
    .line 320
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->eventCache:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    return-void
.end method

.method protected putInNotebookCache(Ljava/lang/String;Lorg/kore/kolab/notes/Notebook;)V
    .registers 4
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "value"    # Lorg/kore/kolab/notes/Notebook;

    .prologue
    .line 308
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notebookCache:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    return-void
.end method

.method protected putInNotesCache(Ljava/lang/String;Lorg/kore/kolab/notes/Note;)V
    .registers 4
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "value"    # Lorg/kore/kolab/notes/Note;

    .prologue
    .line 312
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notesCache:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    return-void
.end method

.method protected removeEvent(Ljava/lang/String;)V
    .registers 3
    .param p1, "uid"    # Ljava/lang/String;

    .prologue
    .line 316
    iget-object v0, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->eventCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    return-void
.end method

.method protected removeFromNotebookCache(Ljava/lang/String;)Lorg/kore/kolab/notes/Notebook;
    .registers 4
    .param p1, "uid"    # Ljava/lang/String;

    .prologue
    .line 287
    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notebookCache:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/Notebook;

    .line 288
    .local v0, "remove":Lorg/kore/kolab/notes/Notebook;
    if-eqz v0, :cond_f

    .line 289
    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->deletedNotebookCache:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    :cond_f
    return-object v0
.end method

.method protected removeFromNotesCache(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "uidNotebook"    # Ljava/lang/String;
    .param p2, "uidNote"    # Ljava/lang/String;

    .prologue
    .line 295
    iget-object v2, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notesCache:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/kore/kolab/notes/Note;

    .line 296
    .local v1, "remove":Lorg/kore/kolab/notes/Note;
    if-eqz v1, :cond_21

    .line 297
    iget-object v2, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->deletedNotesCache:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 299
    .local v0, "book":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/kore/kolab/notes/Note;>;"
    if-nez v0, :cond_1e

    .line 300
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .end local v0    # "book":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/kore/kolab/notes/Note;>;"
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 301
    .restart local v0    # "book":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/kore/kolab/notes/Note;>;"
    iget-object v2, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->deletedNotesCache:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    :cond_1e
    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    .end local v0    # "book":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/kore/kolab/notes/Note;>;"
    :cond_21
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 486
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "LocalNotesRepository{eventCache="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->eventCache:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", notebookCache="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notebookCache:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", notesCache="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->notesCache:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", deletedNotebookCache="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->deletedNotebookCache:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", deletedNotesCache="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->deletedNotesCache:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", parser="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->parser:Lorg/kore/kolab/notes/KolabParser;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", rootfolder="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->rootfolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", disableChangeListening="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lorg/kore/kolab/notes/local/LocalNotesRepository;->disableChangeListening:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trackExisitingNotebooks(Ljava/util/Collection;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/kore/kolab/notes/Notebook;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "existing":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/kore/kolab/notes/Notebook;>;"
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 90
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/Notebook;

    .line 91
    .local v0, "nb":Lorg/kore/kolab/notes/Notebook;
    new-array v3, v6, [Lorg/kore/kolab/notes/event/EventListener;

    aput-object p0, v3, v5

    invoke-virtual {v0, v3}, Lorg/kore/kolab/notes/Notebook;->addListener([Lorg/kore/kolab/notes/event/EventListener;)V

    .line 92
    invoke-virtual {v0}, Lorg/kore/kolab/notes/Notebook;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v3

    invoke-virtual {v3}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v0}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->putInNotebookCache(Ljava/lang/String;Lorg/kore/kolab/notes/Notebook;)V

    .line 94
    invoke-virtual {v0}, Lorg/kore/kolab/notes/Notebook;->getNotes()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/kore/kolab/notes/Note;

    .line 95
    .local v1, "note":Lorg/kore/kolab/notes/Note;
    new-array v4, v6, [Lorg/kore/kolab/notes/event/EventListener;

    aput-object p0, v4, v5

    invoke-virtual {v1, v4}, Lorg/kore/kolab/notes/Note;->addListener([Lorg/kore/kolab/notes/event/EventListener;)V

    .line 96
    invoke-virtual {v1}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v4

    invoke-virtual {v4}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v1}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->putInNotesCache(Ljava/lang/String;Lorg/kore/kolab/notes/Note;)V

    goto :goto_2c

    .line 99
    .end local v0    # "nb":Lorg/kore/kolab/notes/Notebook;
    .end local v1    # "note":Lorg/kore/kolab/notes/Note;
    :cond_4b
    return-void
.end method
