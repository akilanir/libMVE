.class public abstract Lkorex/mail/Store;
.super Lkorex/mail/Service;
.source "Store.java"


# instance fields
.field private volatile folderListeners:Ljava/util/Vector;

.field private volatile storeListeners:Ljava/util/Vector;


# direct methods
.method protected constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V
    .registers 4
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "urlname"    # Lkorex/mail/URLName;

    .prologue
    const/4 v0, 0x0

    .line 75
    invoke-direct {p0, p1, p2}, Lkorex/mail/Service;-><init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V

    .line 195
    iput-object v0, p0, Lkorex/mail/Store;->storeListeners:Ljava/util/Vector;

    .line 248
    iput-object v0, p0, Lkorex/mail/Store;->folderListeners:Ljava/util/Vector;

    .line 76
    return-void
.end method


# virtual methods
.method public declared-synchronized addFolderListener(Lkorex/mail/event/FolderListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/FolderListener;

    .prologue
    .line 263
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Store;->folderListeners:Ljava/util/Vector;

    if-nez v0, :cond_c

    .line 264
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/Store;->folderListeners:Ljava/util/Vector;

    .line 265
    :cond_c
    iget-object v0, p0, Lkorex/mail/Store;->folderListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_13

    .line 266
    monitor-exit p0

    return-void

    .line 263
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addStoreListener(Lkorex/mail/event/StoreListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/StoreListener;

    .prologue
    .line 207
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Store;->storeListeners:Ljava/util/Vector;

    if-nez v0, :cond_c

    .line 208
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/Store;->storeListeners:Ljava/util/Vector;

    .line 209
    :cond_c
    iget-object v0, p0, Lkorex/mail/Store;->storeListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_13

    .line 210
    monitor-exit p0

    return-void

    .line 207
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public abstract getDefaultFolder()Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract getFolder(Ljava/lang/String;)Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract getFolder(Lkorex/mail/URLName;)Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public getPersonalNamespaces()[Lkorex/mail/Folder;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 150
    const/4 v0, 0x1

    new-array v0, v0, [Lkorex/mail/Folder;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lkorex/mail/Store;->getDefaultFolder()Lkorex/mail/Folder;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method public getSharedNamespaces()[Lkorex/mail/Folder;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 191
    const/4 v0, 0x0

    new-array v0, v0, [Lkorex/mail/Folder;

    return-object v0
.end method

.method public getUserNamespaces(Ljava/lang/String;)[Lkorex/mail/Folder;
    .registers 3
    .param p1, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 173
    const/4 v0, 0x0

    new-array v0, v0, [Lkorex/mail/Folder;

    return-object v0
.end method

.method protected notifyFolderListeners(ILkorex/mail/Folder;)V
    .registers 5
    .param p1, "type"    # I
    .param p2, "folder"    # Lkorex/mail/Folder;

    .prologue
    .line 297
    iget-object v1, p0, Lkorex/mail/Store;->folderListeners:Ljava/util/Vector;

    if-nez v1, :cond_5

    .line 302
    :goto_4
    return-void

    .line 300
    :cond_5
    new-instance v0, Lkorex/mail/event/FolderEvent;

    invoke-direct {v0, p0, p2, p1}, Lkorex/mail/event/FolderEvent;-><init>(Ljava/lang/Object;Lkorex/mail/Folder;I)V

    .line 301
    .local v0, "e":Lkorex/mail/event/FolderEvent;
    iget-object v1, p0, Lkorex/mail/Store;->folderListeners:Ljava/util/Vector;

    invoke-virtual {p0, v0, v1}, Lkorex/mail/Store;->queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    goto :goto_4
.end method

.method protected notifyFolderRenamedListeners(Lkorex/mail/Folder;Lkorex/mail/Folder;)V
    .registers 5
    .param p1, "oldF"    # Lkorex/mail/Folder;
    .param p2, "newF"    # Lkorex/mail/Folder;

    .prologue
    .line 320
    iget-object v1, p0, Lkorex/mail/Store;->folderListeners:Ljava/util/Vector;

    if-nez v1, :cond_5

    .line 325
    :goto_4
    return-void

    .line 323
    :cond_5
    new-instance v0, Lkorex/mail/event/FolderEvent;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, p2, v1}, Lkorex/mail/event/FolderEvent;-><init>(Ljava/lang/Object;Lkorex/mail/Folder;Lkorex/mail/Folder;I)V

    .line 324
    .local v0, "e":Lkorex/mail/event/FolderEvent;
    iget-object v1, p0, Lkorex/mail/Store;->folderListeners:Ljava/util/Vector;

    invoke-virtual {p0, v0, v1}, Lkorex/mail/Store;->queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    goto :goto_4
.end method

.method protected notifyStoreListeners(ILjava/lang/String;)V
    .registers 5
    .param p1, "type"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 240
    iget-object v1, p0, Lkorex/mail/Store;->storeListeners:Ljava/util/Vector;

    if-nez v1, :cond_5

    .line 245
    :goto_4
    return-void

    .line 243
    :cond_5
    new-instance v0, Lkorex/mail/event/StoreEvent;

    invoke-direct {v0, p0, p1, p2}, Lkorex/mail/event/StoreEvent;-><init>(Lkorex/mail/Store;ILjava/lang/String;)V

    .line 244
    .local v0, "e":Lkorex/mail/event/StoreEvent;
    iget-object v1, p0, Lkorex/mail/Store;->storeListeners:Ljava/util/Vector;

    invoke-virtual {p0, v0, v1}, Lkorex/mail/Store;->queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    goto :goto_4
.end method

.method public declared-synchronized removeFolderListener(Lkorex/mail/event/FolderListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/FolderListener;

    .prologue
    .line 278
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Store;->folderListeners:Ljava/util/Vector;

    if-eqz v0, :cond_a

    .line 279
    iget-object v0, p0, Lkorex/mail/Store;->folderListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 280
    :cond_a
    monitor-exit p0

    return-void

    .line 278
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeStoreListener(Lkorex/mail/event/StoreListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/StoreListener;

    .prologue
    .line 222
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Store;->storeListeners:Ljava/util/Vector;

    if-eqz v0, :cond_a

    .line 223
    iget-object v0, p0, Lkorex/mail/Store;->storeListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 224
    :cond_a
    monitor-exit p0

    return-void

    .line 222
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method
