.class public Lkorex/mail/FolderClosedException;
.super Lkorex/mail/MessagingException;
.source "FolderClosedException.java"


# static fields
.field private static final serialVersionUID:J = 0x176c8d33ac752d2bL


# instance fields
.field private transient folder:Lkorex/mail/Folder;


# direct methods
.method public constructor <init>(Lkorex/mail/Folder;)V
    .registers 3
    .param p1, "folder"    # Lkorex/mail/Folder;

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Folder;Ljava/lang/String;)V
    .registers 3
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0, p2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 81
    iput-object p1, p0, Lkorex/mail/FolderClosedException;->folder:Lkorex/mail/Folder;

    .line 82
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Folder;Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 4
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "e"    # Ljava/lang/Exception;

    .prologue
    .line 95
    invoke-direct {p0, p2, p3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 96
    iput-object p1, p0, Lkorex/mail/FolderClosedException;->folder:Lkorex/mail/Folder;

    .line 97
    return-void
.end method


# virtual methods
.method public getFolder()Lkorex/mail/Folder;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lkorex/mail/FolderClosedException;->folder:Lkorex/mail/Folder;

    return-object v0
.end method
