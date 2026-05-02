.class public Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;
.super Ljava/lang/Object;
.source "GetFolderPermissionsCommand.java"

# interfaces
.implements Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;


# static fields
.field private static final CREATION_RIGHTS:[Ljava/lang/String;

.field private static final MODIFICATION_RIGHTS:[Ljava/lang/String;


# instance fields
.field private final folderName:Ljava/lang/String;

.field private isNoteCreationAllowed:Z

.field private isNoteModificationAllowed:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 32
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "e"

    aput-object v1, v0, v2

    const-string v1, "t"

    aput-object v1, v0, v3

    sput-object v0, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->MODIFICATION_RIGHTS:[Ljava/lang/String;

    .line 33
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "i"

    aput-object v1, v0, v2

    const-string v1, "s"

    aput-object v1, v0, v3

    const-string v1, "w"

    aput-object v1, v0, v4

    sput-object v0, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->CREATION_RIGHTS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "folderName"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->folderName:Ljava/lang/String;

    .line 41
    return-void
.end method


# virtual methods
.method public doCommand(Lcom/sun/mail/imap/protocol/IMAPProtocol;)Ljava/lang/Object;
    .registers 16
    .param p1, "imapp"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 46
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 47
    .local v0, "command":Lcom/sun/mail/iap/Argument;
    invoke-virtual {p0, v0}, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->setFolderName(Lcom/sun/mail/iap/Argument;)V

    .line 49
    const-string v10, "MYRIGHTS"

    invoke-virtual {p1, v10, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v7

    .line 51
    .local v7, "response":[Lcom/sun/mail/iap/Response;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_f
    array-length v10, v7

    if-ge v3, v10, :cond_54

    .line 52
    aget-object v10, v7, v3

    invoke-virtual {v10}, Lcom/sun/mail/iap/Response;->getRest()Ljava/lang/String;

    move-result-object v8

    .line 55
    .local v8, "rest":Ljava/lang/String;
    const-string v10, " "

    invoke-virtual {v8, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 57
    .local v9, "splitted":[Ljava/lang/String;
    array-length v10, v9

    const/4 v11, 0x1

    if-le v10, v11, :cond_56

    .line 60
    array-length v10, v9

    add-int/lit8 v10, v10, -0x1

    aget-object v4, v9, v10

    .line 62
    .local v4, "imapPermissions":Ljava/lang/String;
    const/4 v1, 0x1

    .line 63
    .local v1, "creationPossible":Z
    sget-object v11, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->CREATION_RIGHTS:[Ljava/lang/String;

    array-length v12, v11

    const/4 v10, 0x0

    :goto_2c
    if-ge v10, v12, :cond_3a

    aget-object v2, v11, v10

    .line 64
    .local v2, "creationRight":Ljava/lang/String;
    invoke-virtual {v4, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_37

    .line 65
    const/4 v1, 0x0

    .line 63
    :cond_37
    add-int/lit8 v10, v10, 0x1

    goto :goto_2c

    .line 69
    .end local v2    # "creationRight":Ljava/lang/String;
    :cond_3a
    if-eqz v1, :cond_54

    .line 70
    const/4 v10, 0x1

    iput-boolean v10, p0, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->isNoteCreationAllowed:Z

    .line 72
    const/4 v5, 0x1

    .line 73
    .local v5, "modificationPossible":Z
    sget-object v11, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->MODIFICATION_RIGHTS:[Ljava/lang/String;

    array-length v12, v11

    const/4 v10, 0x0

    :goto_44
    if-ge v10, v12, :cond_52

    aget-object v6, v11, v10

    .line 74
    .local v6, "modificationRight":Ljava/lang/String;
    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_4f

    .line 75
    const/4 v5, 0x0

    .line 73
    :cond_4f
    add-int/lit8 v10, v10, 0x1

    goto :goto_44

    .line 79
    .end local v6    # "modificationRight":Ljava/lang/String;
    :cond_52
    iput-boolean v5, p0, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->isNoteModificationAllowed:Z

    .line 84
    .end local v1    # "creationPossible":Z
    .end local v4    # "imapPermissions":Ljava/lang/String;
    .end local v5    # "modificationPossible":Z
    .end local v8    # "rest":Ljava/lang/String;
    .end local v9    # "splitted":[Ljava/lang/String;
    :cond_54
    const/4 v10, 0x0

    return-object v10

    .line 51
    .restart local v8    # "rest":Ljava/lang/String;
    .restart local v9    # "splitted":[Ljava/lang/String;
    :cond_56
    add-int/lit8 v3, v3, 0x1

    goto :goto_f
.end method

.method public isIsNoteCreationAllowed()Z
    .registers 2

    .prologue
    .line 96
    iget-boolean v0, p0, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->isNoteCreationAllowed:Z

    return v0
.end method

.method public isIsNoteModificationAllowed()Z
    .registers 2

    .prologue
    .line 100
    iget-boolean v0, p0, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->isNoteModificationAllowed:Z

    return v0
.end method

.method setFolderName(Lcom/sun/mail/iap/Argument;)V
    .registers 5
    .param p1, "command"    # Lcom/sun/mail/iap/Argument;

    .prologue
    .line 89
    :try_start_0
    iget-object v1, p0, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->folderName:Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-virtual {p1, v1, v2}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_7} :catch_8

    .line 93
    :goto_7
    return-void

    .line 90
    :catch_8
    move-exception v0

    .line 91
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    iget-object v1, p0, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->folderName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_7
.end method
