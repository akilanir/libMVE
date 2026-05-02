.class public Lcom/sun/mail/util/FolderClosedIOException;
.super Ljava/io/IOException;
.source "FolderClosedIOException.java"


# static fields
.field private static final serialVersionUID:J = 0x3b699a4df297b817L


# instance fields
.field private transient folder:Lkorex/mail/Folder;


# direct methods
.method public constructor <init>(Lkorex/mail/Folder;)V
    .registers 3
    .param p1, "folder"    # Lkorex/mail/Folder;

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/util/FolderClosedIOException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Folder;Ljava/lang/String;)V
    .registers 3
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-direct {p0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 75
    iput-object p1, p0, Lcom/sun/mail/util/FolderClosedIOException;->folder:Lkorex/mail/Folder;

    .line 76
    return-void
.end method


# virtual methods
.method public getFolder()Lkorex/mail/Folder;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/sun/mail/util/FolderClosedIOException;->folder:Lkorex/mail/Folder;

    return-object v0
.end method
