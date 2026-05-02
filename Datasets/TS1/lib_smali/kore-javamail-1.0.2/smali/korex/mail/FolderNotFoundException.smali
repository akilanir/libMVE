.class public Lkorex/mail/FolderNotFoundException;
.super Lkorex/mail/MessagingException;
.source "FolderNotFoundException.java"


# static fields
.field private static final serialVersionUID:J = 0x68f0e358302dafbL


# instance fields
.field private transient folder:Lkorex/mail/Folder;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 61
    invoke-direct {p0}, Lkorex/mail/MessagingException;-><init>()V

    .line 62
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lkorex/mail/Folder;)V
    .registers 3
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "folder"    # Lkorex/mail/Folder;

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 112
    iput-object p2, p0, Lkorex/mail/FolderNotFoundException;->folder:Lkorex/mail/Folder;

    .line 113
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Folder;)V
    .registers 2
    .param p1, "folder"    # Lkorex/mail/Folder;

    .prologue
    .line 71
    invoke-direct {p0}, Lkorex/mail/MessagingException;-><init>()V

    .line 72
    iput-object p1, p0, Lkorex/mail/FolderNotFoundException;->folder:Lkorex/mail/Folder;

    .line 73
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Folder;Ljava/lang/String;)V
    .registers 3
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-direct {p0, p2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 85
    iput-object p1, p0, Lkorex/mail/FolderNotFoundException;->folder:Lkorex/mail/Folder;

    .line 86
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Folder;Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 4
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "s"    # Ljava/lang/String;
    .param p3, "e"    # Ljava/lang/Exception;

    .prologue
    .line 99
    invoke-direct {p0, p2, p3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 100
    iput-object p1, p0, Lkorex/mail/FolderNotFoundException;->folder:Lkorex/mail/Folder;

    .line 101
    return-void
.end method


# virtual methods
.method public getFolder()Lkorex/mail/Folder;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lkorex/mail/FolderNotFoundException;->folder:Lkorex/mail/Folder;

    return-object v0
.end method
