.class public Lkorex/mail/ReadOnlyFolderException;
.super Lkorex/mail/MessagingException;
.source "ReadOnlyFolderException.java"


# static fields
.field private static final serialVersionUID:J = 0x4f447e8d4f54375dL


# instance fields
.field private transient folder:Lkorex/mail/Folder;


# direct methods
.method public constructor <init>(Lkorex/mail/Folder;)V
    .registers 3
    .param p1, "folder"    # Lkorex/mail/Folder;

    .prologue
    .line 66
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lkorex/mail/ReadOnlyFolderException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Folder;Ljava/lang/String;)V
    .registers 3
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0, p2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 79
    iput-object p1, p0, Lkorex/mail/ReadOnlyFolderException;->folder:Lkorex/mail/Folder;

    .line 80
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Folder;Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 4
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "e"    # Ljava/lang/Exception;

    .prologue
    .line 93
    invoke-direct {p0, p2, p3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 94
    iput-object p1, p0, Lkorex/mail/ReadOnlyFolderException;->folder:Lkorex/mail/Folder;

    .line 95
    return-void
.end method


# virtual methods
.method public getFolder()Lkorex/mail/Folder;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lkorex/mail/ReadOnlyFolderException;->folder:Lkorex/mail/Folder;

    return-object v0
.end method
