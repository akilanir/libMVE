.class public Lcom/sun/mail/pop3/DefaultFolder;
.super Lkorex/mail/Folder;
.source "DefaultFolder.java"


# direct methods
.method constructor <init>(Lcom/sun/mail/pop3/POP3Store;)V
    .registers 2
    .param p1, "store"    # Lcom/sun/mail/pop3/POP3Store;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lkorex/mail/Folder;-><init>(Lkorex/mail/Store;)V

    .line 54
    return-void
.end method


# virtual methods
.method public appendMessages([Lkorex/mail/Message;)V
    .registers 4
    .param p1, "msgs"    # [Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 139
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "Append not supported"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close(Z)V
    .registers 4
    .param p1, "expunge"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "close"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public create(I)Z
    .registers 3
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 86
    const/4 v0, 0x0

    return v0
.end method

.method public delete(Z)Z
    .registers 4
    .param p1, "recurse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 107
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "delete"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public exists()Z
    .registers 2

    .prologue
    .line 69
    const/4 v0, 0x1

    return v0
.end method

.method public expunge()[Lkorex/mail/Message;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 143
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "expunge"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFolder(Ljava/lang/String;)Lkorex/mail/Folder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 94
    const-string v0, "INBOX"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 95
    new-instance v0, Lkorex/mail/MessagingException;

    const-string v1, "only INBOX supported"

    invoke-direct {v0, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :cond_10
    invoke-virtual {p0}, Lcom/sun/mail/pop3/DefaultFolder;->getInbox()Lkorex/mail/Folder;

    move-result-object v0

    return-object v0
.end method

.method public getFullName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    const-string v0, ""

    return-object v0
.end method

.method protected getInbox()Lkorex/mail/Folder;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/sun/mail/pop3/DefaultFolder;->getStore()Lkorex/mail/Store;

    move-result-object v0

    const-string v1, "INBOX"

    invoke-virtual {v0, v1}, Lkorex/mail/Store;->getFolder(Ljava/lang/String;)Lkorex/mail/Folder;

    move-result-object v0

    return-object v0
.end method

.method public getMessage(I)Lkorex/mail/Message;
    .registers 4
    .param p1, "msgno"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 135
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "getMessage"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMessageCount()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 131
    const/4 v0, 0x0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    const-string v0, ""

    return-object v0
.end method

.method public getParent()Lkorex/mail/Folder;
    .registers 2

    .prologue
    .line 65
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPermanentFlags()Lkorex/mail/Flags;
    .registers 2

    .prologue
    .line 127
    new-instance v0, Lkorex/mail/Flags;

    invoke-direct {v0}, Lkorex/mail/Flags;-><init>()V

    return-object v0
.end method

.method public getSeparator()C
    .registers 2

    .prologue
    .line 78
    const/16 v0, 0x2f

    return v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 82
    const/4 v0, 0x2

    return v0
.end method

.method public hasNewMessages()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 90
    const/4 v0, 0x0

    return v0
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 123
    const/4 v0, 0x0

    return v0
.end method

.method public list(Ljava/lang/String;)[Lkorex/mail/Folder;
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 73
    const/4 v1, 0x1

    new-array v0, v1, [Lkorex/mail/Folder;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/sun/mail/pop3/DefaultFolder;->getInbox()Lkorex/mail/Folder;

    move-result-object v2

    aput-object v2, v0, v1

    .line 74
    .local v0, "f":[Lkorex/mail/Folder;
    return-object v0
.end method

.method public open(I)V
    .registers 4
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 115
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "open"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public renameTo(Lkorex/mail/Folder;)Z
    .registers 4
    .param p1, "f"    # Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 111
    new-instance v0, Lkorex/mail/MethodNotSupportedException;

    const-string v1, "renameTo"

    invoke-direct {v0, v1}, Lkorex/mail/MethodNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
