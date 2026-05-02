.class public Lorg/kore/kolab/notes/imap/GetMetadataCommand;
.super Ljava/lang/Object;
.source "GetMetadataCommand.java"

# interfaces
.implements Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;


# instance fields
.field private final folderName:Ljava/lang/String;

.field private isNotesFolder:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "folderName"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/kore/kolab/notes/imap/GetMetadataCommand;->folderName:Ljava/lang/String;

    .line 37
    return-void
.end method


# virtual methods
.method public doCommand(Lcom/sun/mail/imap/protocol/IMAPProtocol;)Ljava/lang/Object;
    .registers 7
    .param p1, "imapp"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 41
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 42
    .local v0, "command":Lcom/sun/mail/iap/Argument;
    invoke-virtual {p0, v0}, Lorg/kore/kolab/notes/imap/GetMetadataCommand;->setFolderName(Lcom/sun/mail/iap/Argument;)V

    .line 44
    const-string v4, "/vendor/kolab/folder-type"

    invoke-virtual {v0, v4}, Lcom/sun/mail/iap/Argument;->writeNString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 45
    const-string v4, "*"

    invoke-virtual {v0, v4}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 47
    const-string v4, "GETANNOTATION"

    invoke-virtual {p1, v4, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v2

    .line 49
    .local v2, "response":[Lcom/sun/mail/iap/Response;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    array-length v4, v2

    if-ge v1, v4, :cond_2d

    .line 50
    aget-object v4, v2, v1

    invoke-virtual {v4}, Lcom/sun/mail/iap/Response;->getRest()Ljava/lang/String;

    move-result-object v3

    .line 52
    .local v3, "rest":Ljava/lang/String;
    const-string v4, "note"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 53
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/kore/kolab/notes/imap/GetMetadataCommand;->isNotesFolder:Z

    .line 58
    .end local v3    # "rest":Ljava/lang/String;
    :cond_2d
    const/4 v4, 0x0

    return-object v4

    .line 49
    .restart local v3    # "rest":Ljava/lang/String;
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_19
.end method

.method public isNotesFolder()Z
    .registers 2

    .prologue
    .line 62
    iget-boolean v0, p0, Lorg/kore/kolab/notes/imap/GetMetadataCommand;->isNotesFolder:Z

    return v0
.end method

.method setFolderName(Lcom/sun/mail/iap/Argument;)V
    .registers 5
    .param p1, "command"    # Lcom/sun/mail/iap/Argument;

    .prologue
    .line 67
    :try_start_0
    iget-object v1, p0, Lorg/kore/kolab/notes/imap/GetMetadataCommand;->folderName:Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-virtual {p1, v1, v2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_7} :catch_8

    .line 71
    :goto_7
    return-void

    .line 68
    :catch_8
    move-exception v0

    .line 69
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    iget-object v1, p0, Lorg/kore/kolab/notes/imap/GetMetadataCommand;->folderName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_7
.end method
