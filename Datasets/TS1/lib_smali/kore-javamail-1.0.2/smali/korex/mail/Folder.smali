.class public abstract Lkorex/mail/Folder;
.super Ljava/lang/Object;
.source "Folder.java"


# static fields
.field public static final HOLDS_FOLDERS:I = 0x2

.field public static final HOLDS_MESSAGES:I = 0x1

.field public static final READ_ONLY:I = 0x1

.field public static final READ_WRITE:I = 0x2


# instance fields
.field private volatile connectionListeners:Ljava/util/Vector;

.field private volatile folderListeners:Ljava/util/Vector;

.field private volatile messageChangedListeners:Ljava/util/Vector;

.field private volatile messageCountListeners:Ljava/util/Vector;

.field protected mode:I

.field private final q:Lkorex/mail/EventQueue;

.field protected store:Lkorex/mail/Store;


# direct methods
.method protected constructor <init>(Lkorex/mail/Store;)V
    .registers 8
    .param p1, "store"    # Lkorex/mail/Store;

    .prologue
    const/4 v4, 0x0

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    const/4 v3, -0x1

    iput v3, p0, Lkorex/mail/Folder;->mode:I

    .line 1328
    iput-object v4, p0, Lkorex/mail/Folder;->connectionListeners:Ljava/util/Vector;

    .line 1395
    iput-object v4, p0, Lkorex/mail/Folder;->folderListeners:Ljava/util/Vector;

    .line 1476
    iput-object v4, p0, Lkorex/mail/Folder;->messageCountListeners:Ljava/util/Vector;

    .line 1564
    iput-object v4, p0, Lkorex/mail/Folder;->messageChangedListeners:Ljava/util/Vector;

    .line 145
    iput-object p1, p0, Lkorex/mail/Folder;->store:Lkorex/mail/Store;

    .line 148
    invoke-virtual {p1}, Lkorex/mail/Store;->getSession()Lkorex/mail/Session;

    move-result-object v2

    .line 150
    .local v2, "session":Lkorex/mail/Session;
    invoke-virtual {v2}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v3

    const-string v4, "mail.event.scope"

    const-string v5, "folder"

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 152
    .local v1, "scope":Ljava/lang/String;
    invoke-virtual {v2}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v3

    const-string v4, "mail.event.executor"

    invoke-virtual {v3, v4}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    .line 153
    .local v0, "executor":Ljava/util/concurrent/Executor;
    const-string v3, "application"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 154
    invoke-static {v0}, Lkorex/mail/EventQueue;->getApplicationEventQueue(Ljava/util/concurrent/Executor;)Lkorex/mail/EventQueue;

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/Folder;->q:Lkorex/mail/EventQueue;

    .line 161
    :goto_3b
    return-void

    .line 155
    :cond_3c
    const-string v3, "session"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 156
    invoke-virtual {v2}, Lkorex/mail/Session;->getEventQueue()Lkorex/mail/EventQueue;

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/Folder;->q:Lkorex/mail/EventQueue;

    goto :goto_3b

    .line 157
    :cond_4b
    const-string v3, "store"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5a

    .line 158
    invoke-virtual {p1}, Lkorex/mail/Store;->getEventQueue()Lkorex/mail/EventQueue;

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/Folder;->q:Lkorex/mail/EventQueue;

    goto :goto_3b

    .line 160
    :cond_5a
    new-instance v3, Lkorex/mail/EventQueue;

    invoke-direct {v3, v0}, Lkorex/mail/EventQueue;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v3, p0, Lkorex/mail/Folder;->q:Lkorex/mail/EventQueue;

    goto :goto_3b
.end method

.method private queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V
    .registers 5
    .param p1, "event"    # Lkorex/mail/event/MailEvent;
    .param p2, "vector"    # Ljava/util/Vector;

    .prologue
    .line 1630
    invoke-virtual {p2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Vector;

    .line 1631
    .local v0, "v":Ljava/util/Vector;
    iget-object v1, p0, Lkorex/mail/Folder;->q:Lkorex/mail/EventQueue;

    invoke-virtual {v1, p1, v0}, Lkorex/mail/EventQueue;->enqueue(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    .line 1632
    return-void
.end method


# virtual methods
.method public declared-synchronized addConnectionListener(Lkorex/mail/event/ConnectionListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/ConnectionListener;

    .prologue
    .line 1341
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Folder;->connectionListeners:Ljava/util/Vector;

    if-nez v0, :cond_c

    .line 1342
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/Folder;->connectionListeners:Ljava/util/Vector;

    .line 1343
    :cond_c
    iget-object v0, p0, Lkorex/mail/Folder;->connectionListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_13

    .line 1344
    monitor-exit p0

    return-void

    .line 1341
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addFolderListener(Lkorex/mail/event/FolderListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/FolderListener;

    .prologue
    .line 1407
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Folder;->folderListeners:Ljava/util/Vector;

    if-nez v0, :cond_c

    .line 1408
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/Folder;->folderListeners:Ljava/util/Vector;

    .line 1409
    :cond_c
    iget-object v0, p0, Lkorex/mail/Folder;->folderListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_13

    .line 1410
    monitor-exit p0

    return-void

    .line 1407
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addMessageChangedListener(Lkorex/mail/event/MessageChangedListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/MessageChangedListener;

    .prologue
    .line 1577
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Folder;->messageChangedListeners:Ljava/util/Vector;

    if-nez v0, :cond_c

    .line 1578
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/Folder;->messageChangedListeners:Ljava/util/Vector;

    .line 1579
    :cond_c
    iget-object v0, p0, Lkorex/mail/Folder;->messageChangedListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_13

    .line 1580
    monitor-exit p0

    return-void

    .line 1577
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addMessageCountListener(Lkorex/mail/event/MessageCountListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/MessageCountListener;

    .prologue
    .line 1488
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Folder;->messageCountListeners:Ljava/util/Vector;

    if-nez v0, :cond_c

    .line 1489
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/Folder;->messageCountListeners:Ljava/util/Vector;

    .line 1490
    :cond_c
    iget-object v0, p0, Lkorex/mail/Folder;->messageCountListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_13

    .line 1491
    monitor-exit p0

    return-void

    .line 1488
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public abstract appendMessages([Lkorex/mail/Message;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract close(Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public copyMessages([Lkorex/mail/Message;Lkorex/mail/Folder;)V
    .registers 6
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .param p2, "folder"    # Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1193
    invoke-virtual {p2}, Lkorex/mail/Folder;->exists()Z

    move-result v0

    if-nez v0, :cond_23

    .line 1194
    new-instance v0, Lkorex/mail/FolderNotFoundException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1195
    invoke-virtual {p2}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " does not exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lkorex/mail/FolderNotFoundException;-><init>(Ljava/lang/String;Lkorex/mail/Folder;)V

    throw v0

    .line 1198
    :cond_23
    invoke-virtual {p2, p1}, Lkorex/mail/Folder;->appendMessages([Lkorex/mail/Message;)V

    .line 1199
    return-void
.end method

.method public abstract create(I)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract delete(Z)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract exists()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract expunge()[Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public fetch([Lkorex/mail/Message;Lkorex/mail/FetchProfile;)V
    .registers 3
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .param p2, "fp"    # Lkorex/mail/FetchProfile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1036
    return-void
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 1635
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 1636
    iget-object v0, p0, Lkorex/mail/Folder;->q:Lkorex/mail/EventQueue;

    invoke-virtual {v0}, Lkorex/mail/EventQueue;->terminateQueue()V

    .line 1637
    return-void
.end method

.method public declared-synchronized getDeletedMessageCount()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 830
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/Folder;->isOpen()Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_25

    move-result v4

    if-nez v4, :cond_a

    .line 831
    const/4 v0, -0x1

    .line 844
    :cond_8
    monitor-exit p0

    return v0

    .line 833
    :cond_a
    const/4 v0, 0x0

    .line 834
    .local v0, "deleted":I
    :try_start_b
    invoke-virtual {p0}, Lkorex/mail/Folder;->getMessageCount()I
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_25

    move-result v3

    .line 835
    .local v3, "total":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_10
    if-gt v1, v3, :cond_8

    .line 837
    :try_start_12
    invoke-virtual {p0, v1}, Lkorex/mail/Folder;->getMessage(I)Lkorex/mail/Message;

    move-result-object v4

    sget-object v5, Lkorex/mail/Flags$Flag;->DELETED:Lkorex/mail/Flags$Flag;

    invoke-virtual {v4, v5}, Lkorex/mail/Message;->isSet(Lkorex/mail/Flags$Flag;)Z
    :try_end_1b
    .catch Lkorex/mail/MessageRemovedException; {:try_start_12 .. :try_end_1b} :catch_23
    .catchall {:try_start_12 .. :try_end_1b} :catchall_25

    move-result v4

    if-eqz v4, :cond_20

    .line 838
    add-int/lit8 v0, v0, 0x1

    .line 835
    :cond_20
    :goto_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 839
    :catch_23
    move-exception v2

    .line 841
    .local v2, "me":Lkorex/mail/MessageRemovedException;
    goto :goto_20

    .line 830
    .end local v0    # "deleted":I
    .end local v1    # "i":I
    .end local v2    # "me":Lkorex/mail/MessageRemovedException;
    .end local v3    # "total":I
    :catchall_25
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public abstract getFolder(Ljava/lang/String;)Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract getFullName()Ljava/lang/String;
.end method

.method public abstract getMessage(I)Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract getMessageCount()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public declared-synchronized getMessages()[Lkorex/mail/Message;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 968
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/Folder;->isOpen()Z

    move-result v3

    if-nez v3, :cond_12

    .line 969
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Folder not open"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_f

    .line 968
    :catchall_f
    move-exception v3

    monitor-exit p0

    throw v3

    .line 970
    :cond_12
    :try_start_12
    invoke-virtual {p0}, Lkorex/mail/Folder;->getMessageCount()I

    move-result v2

    .line 971
    .local v2, "total":I
    new-array v1, v2, [Lkorex/mail/Message;

    .line 972
    .local v1, "msgs":[Lkorex/mail/Message;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_19
    if-gt v0, v2, :cond_26

    .line 973
    add-int/lit8 v3, v0, -0x1

    invoke-virtual {p0, v0}, Lkorex/mail/Folder;->getMessage(I)Lkorex/mail/Message;

    move-result-object v4

    aput-object v4, v1, v3
    :try_end_23
    .catchall {:try_start_12 .. :try_end_23} :catchall_f

    .line 972
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 974
    :cond_26
    monitor-exit p0

    return-object v1
.end method

.method public declared-synchronized getMessages(II)[Lkorex/mail/Message;
    .registers 7
    .param p1, "start"    # I
    .param p2, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 908
    monitor-enter p0

    sub-int v2, p2, p1

    add-int/lit8 v2, v2, 0x1

    :try_start_5
    new-array v1, v2, [Lkorex/mail/Message;

    .line 909
    .local v1, "msgs":[Lkorex/mail/Message;
    move v0, p1

    .local v0, "i":I
    :goto_8
    if-gt v0, p2, :cond_15

    .line 910
    sub-int v2, v0, p1

    invoke-virtual {p0, v0}, Lkorex/mail/Folder;->getMessage(I)Lkorex/mail/Message;

    move-result-object v3

    aput-object v3, v1, v2
    :try_end_12
    .catchall {:try_start_5 .. :try_end_12} :catchall_17

    .line 909
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 911
    :cond_15
    monitor-exit p0

    return-object v1

    .line 908
    .end local v0    # "i":I
    .end local v1    # "msgs":[Lkorex/mail/Message;
    :catchall_17
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getMessages([I)[Lkorex/mail/Message;
    .registers 6
    .param p1, "msgnums"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 938
    monitor-enter p0

    :try_start_1
    array-length v1, p1

    .line 939
    .local v1, "len":I
    new-array v2, v1, [Lkorex/mail/Message;

    .line 940
    .local v2, "msgs":[Lkorex/mail/Message;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v1, :cond_12

    .line 941
    aget v3, p1, v0

    invoke-virtual {p0, v3}, Lkorex/mail/Folder;->getMessage(I)Lkorex/mail/Message;

    move-result-object v3

    aput-object v3, v2, v0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_14

    .line 940
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 942
    :cond_12
    monitor-exit p0

    return-object v2

    .line 938
    .end local v0    # "i":I
    .end local v1    # "len":I
    .end local v2    # "msgs":[Lkorex/mail/Message;
    :catchall_14
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized getMode()I
    .registers 3

    .prologue
    .line 667
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/Folder;->isOpen()Z

    move-result v0

    if-nez v0, :cond_12

    .line 668
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Folder not open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_f

    .line 667
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0

    .line 669
    :cond_12
    :try_start_12
    iget v0, p0, Lkorex/mail/Folder;->mode:I
    :try_end_14
    .catchall {:try_start_12 .. :try_end_14} :catchall_f

    monitor-exit p0

    return v0
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public declared-synchronized getNewMessageCount()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 738
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/Folder;->isOpen()Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_25

    move-result v4

    if-nez v4, :cond_a

    .line 739
    const/4 v2, -0x1

    .line 752
    :cond_8
    monitor-exit p0

    return v2

    .line 741
    :cond_a
    const/4 v2, 0x0

    .line 742
    .local v2, "newmsgs":I
    :try_start_b
    invoke-virtual {p0}, Lkorex/mail/Folder;->getMessageCount()I
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_25

    move-result v3

    .line 743
    .local v3, "total":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_10
    if-gt v0, v3, :cond_8

    .line 745
    :try_start_12
    invoke-virtual {p0, v0}, Lkorex/mail/Folder;->getMessage(I)Lkorex/mail/Message;

    move-result-object v4

    sget-object v5, Lkorex/mail/Flags$Flag;->RECENT:Lkorex/mail/Flags$Flag;

    invoke-virtual {v4, v5}, Lkorex/mail/Message;->isSet(Lkorex/mail/Flags$Flag;)Z
    :try_end_1b
    .catch Lkorex/mail/MessageRemovedException; {:try_start_12 .. :try_end_1b} :catch_23
    .catchall {:try_start_12 .. :try_end_1b} :catchall_25

    move-result v4

    if-eqz v4, :cond_20

    .line 746
    add-int/lit8 v2, v2, 0x1

    .line 743
    :cond_20
    :goto_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 747
    :catch_23
    move-exception v1

    .line 749
    .local v1, "me":Lkorex/mail/MessageRemovedException;
    goto :goto_20

    .line 738
    .end local v0    # "i":I
    .end local v1    # "me":Lkorex/mail/MessageRemovedException;
    .end local v2    # "newmsgs":I
    .end local v3    # "total":I
    :catchall_25
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public abstract getParent()Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract getPermanentFlags()Lkorex/mail/Flags;
.end method

.method public abstract getSeparator()C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public getStore()Lkorex/mail/Store;
    .registers 2

    .prologue
    .line 236
    iget-object v0, p0, Lkorex/mail/Folder;->store:Lkorex/mail/Store;

    return-object v0
.end method

.method public abstract getType()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public getURLName()Lkorex/mail/URLName;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 194
    invoke-virtual {p0}, Lkorex/mail/Folder;->getStore()Lkorex/mail/Store;

    move-result-object v0

    invoke-virtual {v0}, Lkorex/mail/Store;->getURLName()Lkorex/mail/URLName;

    move-result-object v9

    .line 195
    .local v9, "storeURL":Lkorex/mail/URLName;
    invoke-virtual {p0}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v8

    .line 196
    .local v8, "fullname":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .line 198
    .local v7, "encodedName":Ljava/lang/StringBuffer;
    if-eqz v8, :cond_16

    .line 216
    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 223
    :cond_16
    new-instance v0, Lkorex/mail/URLName;

    invoke-virtual {v9}, Lkorex/mail/URLName;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9}, Lkorex/mail/URLName;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 224
    invoke-virtual {v9}, Lkorex/mail/URLName;->getPort()I

    move-result v3

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 225
    invoke-virtual {v9}, Lkorex/mail/URLName;->getUsername()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lkorex/mail/URLName;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public declared-synchronized getUnreadMessageCount()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 784
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/Folder;->isOpen()Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_25

    move-result v4

    if-nez v4, :cond_a

    .line 785
    const/4 v3, -0x1

    .line 798
    :cond_8
    monitor-exit p0

    return v3

    .line 787
    :cond_a
    const/4 v3, 0x0

    .line 788
    .local v3, "unread":I
    :try_start_b
    invoke-virtual {p0}, Lkorex/mail/Folder;->getMessageCount()I
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_25

    move-result v2

    .line 789
    .local v2, "total":I
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_10
    if-gt v0, v2, :cond_8

    .line 791
    :try_start_12
    invoke-virtual {p0, v0}, Lkorex/mail/Folder;->getMessage(I)Lkorex/mail/Message;

    move-result-object v4

    sget-object v5, Lkorex/mail/Flags$Flag;->SEEN:Lkorex/mail/Flags$Flag;

    invoke-virtual {v4, v5}, Lkorex/mail/Message;->isSet(Lkorex/mail/Flags$Flag;)Z
    :try_end_1b
    .catch Lkorex/mail/MessageRemovedException; {:try_start_12 .. :try_end_1b} :catch_23
    .catchall {:try_start_12 .. :try_end_1b} :catchall_25

    move-result v4

    if-nez v4, :cond_20

    .line 792
    add-int/lit8 v3, v3, 0x1

    .line 789
    :cond_20
    :goto_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 793
    :catch_23
    move-exception v1

    .line 795
    .local v1, "me":Lkorex/mail/MessageRemovedException;
    goto :goto_20

    .line 784
    .end local v0    # "i":I
    .end local v1    # "me":Lkorex/mail/MessageRemovedException;
    .end local v2    # "total":I
    .end local v3    # "unread":I
    :catchall_25
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public abstract hasNewMessages()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract isOpen()Z
.end method

.method public isSubscribed()Z
    .registers 2

    .prologue
    .line 434
    const/4 v0, 0x1

    return v0
.end method

.method public list()[Lkorex/mail/Folder;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 351
    const-string v0, "%"

    invoke-virtual {p0, v0}, Lkorex/mail/Folder;->list(Ljava/lang/String;)[Lkorex/mail/Folder;

    move-result-object v0

    return-object v0
.end method

.method public abstract list(Ljava/lang/String;)[Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public listSubscribed()[Lkorex/mail/Folder;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 369
    const-string v0, "%"

    invoke-virtual {p0, v0}, Lkorex/mail/Folder;->listSubscribed(Ljava/lang/String;)[Lkorex/mail/Folder;

    move-result-object v0

    return-object v0
.end method

.method public listSubscribed(Ljava/lang/String;)[Lkorex/mail/Folder;
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 333
    invoke-virtual {p0, p1}, Lkorex/mail/Folder;->list(Ljava/lang/String;)[Lkorex/mail/Folder;

    move-result-object v0

    return-object v0
.end method

.method protected notifyConnectionListeners(I)V
    .registers 4
    .param p1, "type"    # I

    .prologue
    .line 1375
    iget-object v1, p0, Lkorex/mail/Folder;->connectionListeners:Ljava/util/Vector;

    if-eqz v1, :cond_e

    .line 1376
    new-instance v0, Lkorex/mail/event/ConnectionEvent;

    invoke-direct {v0, p0, p1}, Lkorex/mail/event/ConnectionEvent;-><init>(Ljava/lang/Object;I)V

    .line 1377
    .local v0, "e":Lkorex/mail/event/ConnectionEvent;
    iget-object v1, p0, Lkorex/mail/Folder;->connectionListeners:Ljava/util/Vector;

    invoke-direct {p0, v0, v1}, Lkorex/mail/Folder;->queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    .line 1390
    .end local v0    # "e":Lkorex/mail/event/ConnectionEvent;
    :cond_e
    const/4 v1, 0x3

    if-ne p1, v1, :cond_16

    .line 1391
    iget-object v1, p0, Lkorex/mail/Folder;->q:Lkorex/mail/EventQueue;

    invoke-virtual {v1}, Lkorex/mail/EventQueue;->terminateQueue()V

    .line 1392
    :cond_16
    return-void
.end method

.method protected notifyFolderListeners(I)V
    .registers 4
    .param p1, "type"    # I

    .prologue
    .line 1442
    iget-object v1, p0, Lkorex/mail/Folder;->folderListeners:Ljava/util/Vector;

    if-eqz v1, :cond_e

    .line 1443
    new-instance v0, Lkorex/mail/event/FolderEvent;

    invoke-direct {v0, p0, p0, p1}, Lkorex/mail/event/FolderEvent;-><init>(Ljava/lang/Object;Lkorex/mail/Folder;I)V

    .line 1444
    .local v0, "e":Lkorex/mail/event/FolderEvent;
    iget-object v1, p0, Lkorex/mail/Folder;->folderListeners:Ljava/util/Vector;

    invoke-direct {p0, v0, v1}, Lkorex/mail/Folder;->queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    .line 1446
    .end local v0    # "e":Lkorex/mail/event/FolderEvent;
    :cond_e
    iget-object v1, p0, Lkorex/mail/Folder;->store:Lkorex/mail/Store;

    invoke-virtual {v1, p1, p0}, Lkorex/mail/Store;->notifyFolderListeners(ILkorex/mail/Folder;)V

    .line 1447
    return-void
.end method

.method protected notifyFolderRenamedListeners(Lkorex/mail/Folder;)V
    .registers 4
    .param p1, "folder"    # Lkorex/mail/Folder;

    .prologue
    .line 1467
    iget-object v1, p0, Lkorex/mail/Folder;->folderListeners:Ljava/util/Vector;

    if-eqz v1, :cond_f

    .line 1468
    new-instance v0, Lkorex/mail/event/FolderEvent;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p0, p1, v1}, Lkorex/mail/event/FolderEvent;-><init>(Ljava/lang/Object;Lkorex/mail/Folder;Lkorex/mail/Folder;I)V

    .line 1470
    .local v0, "e":Lkorex/mail/event/FolderEvent;
    iget-object v1, p0, Lkorex/mail/Folder;->folderListeners:Ljava/util/Vector;

    invoke-direct {p0, v0, v1}, Lkorex/mail/Folder;->queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    .line 1472
    .end local v0    # "e":Lkorex/mail/event/FolderEvent;
    :cond_f
    iget-object v1, p0, Lkorex/mail/Folder;->store:Lkorex/mail/Store;

    invoke-virtual {v1, p0, p1}, Lkorex/mail/Store;->notifyFolderRenamedListeners(Lkorex/mail/Folder;Lkorex/mail/Folder;)V

    .line 1473
    return-void
.end method

.method protected notifyMessageAddedListeners([Lkorex/mail/Message;)V
    .registers 5
    .param p1, "msgs"    # [Lkorex/mail/Message;

    .prologue
    .line 1523
    iget-object v1, p0, Lkorex/mail/Folder;->messageCountListeners:Ljava/util/Vector;

    if-nez v1, :cond_5

    .line 1533
    :goto_4
    return-void

    .line 1526
    :cond_5
    new-instance v0, Lkorex/mail/event/MessageCountEvent;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2, p1}, Lkorex/mail/event/MessageCountEvent;-><init>(Lkorex/mail/Folder;IZ[Lkorex/mail/Message;)V

    .line 1532
    .local v0, "e":Lkorex/mail/event/MessageCountEvent;
    iget-object v1, p0, Lkorex/mail/Folder;->messageCountListeners:Ljava/util/Vector;

    invoke-direct {p0, v0, v1}, Lkorex/mail/Folder;->queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    goto :goto_4
.end method

.method protected notifyMessageChangedListeners(ILkorex/mail/Message;)V
    .registers 5
    .param p1, "type"    # I
    .param p2, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 1611
    iget-object v1, p0, Lkorex/mail/Folder;->messageChangedListeners:Ljava/util/Vector;

    if-nez v1, :cond_5

    .line 1616
    :goto_4
    return-void

    .line 1614
    :cond_5
    new-instance v0, Lkorex/mail/event/MessageChangedEvent;

    invoke-direct {v0, p0, p1, p2}, Lkorex/mail/event/MessageChangedEvent;-><init>(Ljava/lang/Object;ILkorex/mail/Message;)V

    .line 1615
    .local v0, "e":Lkorex/mail/event/MessageChangedEvent;
    iget-object v1, p0, Lkorex/mail/Folder;->messageChangedListeners:Ljava/util/Vector;

    invoke-direct {p0, v0, v1}, Lkorex/mail/Folder;->queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    goto :goto_4
.end method

.method protected notifyMessageRemovedListeners(Z[Lkorex/mail/Message;)V
    .registers 5
    .param p1, "removed"    # Z
    .param p2, "msgs"    # [Lkorex/mail/Message;

    .prologue
    .line 1552
    iget-object v1, p0, Lkorex/mail/Folder;->messageCountListeners:Ljava/util/Vector;

    if-nez v1, :cond_5

    .line 1561
    :goto_4
    return-void

    .line 1555
    :cond_5
    new-instance v0, Lkorex/mail/event/MessageCountEvent;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1, p1, p2}, Lkorex/mail/event/MessageCountEvent;-><init>(Lkorex/mail/Folder;IZ[Lkorex/mail/Message;)V

    .line 1560
    .local v0, "e":Lkorex/mail/event/MessageCountEvent;
    iget-object v1, p0, Lkorex/mail/Folder;->messageCountListeners:Ljava/util/Vector;

    invoke-direct {p0, v0, v1}, Lkorex/mail/Folder;->queueEvent(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V

    goto :goto_4
.end method

.method public abstract open(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public declared-synchronized removeConnectionListener(Lkorex/mail/event/ConnectionListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/ConnectionListener;

    .prologue
    .line 1357
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Folder;->connectionListeners:Ljava/util/Vector;

    if-eqz v0, :cond_a

    .line 1358
    iget-object v0, p0, Lkorex/mail/Folder;->connectionListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 1359
    :cond_a
    monitor-exit p0

    return-void

    .line 1357
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeFolderListener(Lkorex/mail/event/FolderListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/FolderListener;

    .prologue
    .line 1422
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Folder;->folderListeners:Ljava/util/Vector;

    if-eqz v0, :cond_a

    .line 1423
    iget-object v0, p0, Lkorex/mail/Folder;->folderListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 1424
    :cond_a
    monitor-exit p0

    return-void

    .line 1422
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeMessageChangedListener(Lkorex/mail/event/MessageChangedListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/MessageChangedListener;

    .prologue
    .line 1593
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Folder;->messageChangedListeners:Ljava/util/Vector;

    if-eqz v0, :cond_a

    .line 1594
    iget-object v0, p0, Lkorex/mail/Folder;->messageChangedListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 1595
    :cond_a
    monitor-exit p0

    return-void

    .line 1593
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeMessageCountListener(Lkorex/mail/event/MessageCountListener;)V
    .registers 3
    .param p1, "l"    # Lkorex/mail/event/MessageCountListener;

    .prologue
    .line 1504
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Folder;->messageCountListeners:Ljava/util/Vector;

    if-eqz v0, :cond_a

    .line 1505
    iget-object v0, p0, Lkorex/mail/Folder;->messageCountListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 1506
    :cond_a
    monitor-exit p0

    return-void

    .line 1504
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public abstract renameTo(Lkorex/mail/Folder;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public search(Lkorex/mail/search/SearchTerm;)[Lkorex/mail/Message;
    .registers 3
    .param p1, "term"    # Lkorex/mail/search/SearchTerm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1257
    invoke-virtual {p0}, Lkorex/mail/Folder;->getMessages()[Lkorex/mail/Message;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lkorex/mail/Folder;->search(Lkorex/mail/search/SearchTerm;[Lkorex/mail/Message;)[Lkorex/mail/Message;

    move-result-object v0

    return-object v0
.end method

.method public search(Lkorex/mail/search/SearchTerm;[Lkorex/mail/Message;)[Lkorex/mail/Message;
    .registers 7
    .param p1, "term"    # Lkorex/mail/search/SearchTerm;
    .param p2, "msgs"    # [Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1291
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 1294
    .local v2, "matchedMsgs":Ljava/util/Vector;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    array-length v3, p2

    if-ge v0, v3, :cond_19

    .line 1296
    :try_start_9
    aget-object v3, p2, v0

    invoke-virtual {v3, p1}, Lkorex/mail/Message;->match(Lkorex/mail/search/SearchTerm;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 1297
    aget-object v3, p2, v0

    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_16
    .catch Lkorex/mail/MessageRemovedException; {:try_start_9 .. :try_end_16} :catch_23

    .line 1294
    :cond_16
    :goto_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 1301
    :cond_19
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v1, v3, [Lkorex/mail/Message;

    .line 1302
    .local v1, "m":[Lkorex/mail/Message;
    invoke-virtual {v2, v1}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1303
    return-object v1

    .line 1298
    .end local v1    # "m":[Lkorex/mail/Message;
    :catch_23
    move-exception v3

    goto :goto_16
.end method

.method public declared-synchronized setFlags(IILkorex/mail/Flags;Z)V
    .registers 8
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "flag"    # Lkorex/mail/Flags;
    .param p4, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1111
    monitor-enter p0

    move v0, p1

    .local v0, "i":I
    :goto_2
    if-gt v0, p2, :cond_e

    .line 1113
    :try_start_4
    invoke-virtual {p0, v0}, Lkorex/mail/Folder;->getMessage(I)Lkorex/mail/Message;

    move-result-object v1

    .line 1114
    .local v1, "msg":Lkorex/mail/Message;
    invoke-virtual {v1, p3, p4}, Lkorex/mail/Message;->setFlags(Lkorex/mail/Flags;Z)V
    :try_end_b
    .catch Lkorex/mail/MessageRemovedException; {:try_start_4 .. :try_end_b} :catch_13
    .catchall {:try_start_4 .. :try_end_b} :catchall_10

    .line 1111
    .end local v1    # "msg":Lkorex/mail/Message;
    :goto_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1119
    :cond_e
    monitor-exit p0

    return-void

    .line 1111
    :catchall_10
    move-exception v2

    monitor-exit p0

    throw v2

    .line 1115
    :catch_13
    move-exception v2

    goto :goto_b
.end method

.method public declared-synchronized setFlags([ILkorex/mail/Flags;Z)V
    .registers 7
    .param p1, "msgnums"    # [I
    .param p2, "flag"    # Lkorex/mail/Flags;
    .param p3, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1153
    monitor-enter p0

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    :try_start_2
    array-length v2, p1
    :try_end_3
    .catchall {:try_start_2 .. :try_end_3} :catchall_13

    if-ge v0, v2, :cond_11

    .line 1155
    :try_start_5
    aget v2, p1, v0

    invoke-virtual {p0, v2}, Lkorex/mail/Folder;->getMessage(I)Lkorex/mail/Message;

    move-result-object v1

    .line 1156
    .local v1, "msg":Lkorex/mail/Message;
    invoke-virtual {v1, p2, p3}, Lkorex/mail/Message;->setFlags(Lkorex/mail/Flags;Z)V
    :try_end_e
    .catch Lkorex/mail/MessageRemovedException; {:try_start_5 .. :try_end_e} :catch_16
    .catchall {:try_start_5 .. :try_end_e} :catchall_13

    .line 1153
    .end local v1    # "msg":Lkorex/mail/Message;
    :goto_e
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1161
    :cond_11
    monitor-exit p0

    return-void

    .line 1153
    :catchall_13
    move-exception v2

    monitor-exit p0

    throw v2

    .line 1157
    :catch_16
    move-exception v2

    goto :goto_e
.end method

.method public declared-synchronized setFlags([Lkorex/mail/Message;Lkorex/mail/Flags;Z)V
    .registers 6
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .param p2, "flag"    # Lkorex/mail/Flags;
    .param p3, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1068
    monitor-enter p0

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    :try_start_2
    array-length v1, p1
    :try_end_3
    .catchall {:try_start_2 .. :try_end_3} :catchall_f

    if-ge v0, v1, :cond_d

    .line 1070
    :try_start_5
    aget-object v1, p1, v0

    invoke-virtual {v1, p2, p3}, Lkorex/mail/Message;->setFlags(Lkorex/mail/Flags;Z)V
    :try_end_a
    .catch Lkorex/mail/MessageRemovedException; {:try_start_5 .. :try_end_a} :catch_12
    .catchall {:try_start_5 .. :try_end_a} :catchall_f

    .line 1068
    :goto_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1075
    :cond_d
    monitor-exit p0

    return-void

    .line 1068
    :catchall_f
    move-exception v1

    monitor-exit p0

    throw v1

    .line 1071
    :catch_12
    move-exception v1

    goto :goto_a
.end method

.method public setSubscribed(Z)V
    .registers 3
    .param p1, "subscribe"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 455
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    invoke-direct {v0}, Lkorex/mail/MethodNotSupportedException;-><init>()V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1646
    invoke-virtual {p0}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v0

    .line 1647
    .local v0, "s":Ljava/lang/String;
    if-eqz v0, :cond_7

    .line 1650
    .end local v0    # "s":Ljava/lang/String;
    :goto_6
    return-object v0

    .restart local v0    # "s":Ljava/lang/String;
    :cond_7
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
