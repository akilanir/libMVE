.class public Lkorex/mail/event/FolderEvent;
.super Lkorex/mail/event/MailEvent;
.source "FolderEvent.java"


# static fields
.field public static final CREATED:I = 0x1

.field public static final DELETED:I = 0x2

.field public static final RENAMED:I = 0x3

.field private static final serialVersionUID:J = 0x493fb076540416e3L


# instance fields
.field protected transient folder:Lkorex/mail/Folder;

.field protected transient newFolder:Lkorex/mail/Folder;

.field protected type:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lkorex/mail/Folder;I)V
    .registers 4
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "folder"    # Lkorex/mail/Folder;
    .param p3, "type"    # I

    .prologue
    .line 103
    invoke-direct {p0, p1, p2, p2, p3}, Lkorex/mail/event/FolderEvent;-><init>(Ljava/lang/Object;Lkorex/mail/Folder;Lkorex/mail/Folder;I)V

    .line 104
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lkorex/mail/Folder;Lkorex/mail/Folder;I)V
    .registers 5
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "oldFolder"    # Lkorex/mail/Folder;
    .param p3, "newFolder"    # Lkorex/mail/Folder;
    .param p4, "type"    # I

    .prologue
    .line 117
    invoke-direct {p0, p1}, Lkorex/mail/event/MailEvent;-><init>(Ljava/lang/Object;)V

    .line 118
    iput-object p2, p0, Lkorex/mail/event/FolderEvent;->folder:Lkorex/mail/Folder;

    .line 119
    iput-object p3, p0, Lkorex/mail/event/FolderEvent;->newFolder:Lkorex/mail/Folder;

    .line 120
    iput p4, p0, Lkorex/mail/event/FolderEvent;->type:I

    .line 121
    return-void
.end method


# virtual methods
.method public dispatch(Ljava/lang/Object;)V
    .registers 4
    .param p1, "listener"    # Ljava/lang/Object;

    .prologue
    .line 161
    iget v0, p0, Lkorex/mail/event/FolderEvent;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_b

    .line 162
    check-cast p1, Lkorex/mail/event/FolderListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/FolderListener;->folderCreated(Lkorex/mail/event/FolderEvent;)V

    .line 167
    :cond_a
    :goto_a
    return-void

    .line 163
    .restart local p1    # "listener":Ljava/lang/Object;
    :cond_b
    iget v0, p0, Lkorex/mail/event/FolderEvent;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_16

    .line 164
    check-cast p1, Lkorex/mail/event/FolderListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/FolderListener;->folderDeleted(Lkorex/mail/event/FolderEvent;)V

    goto :goto_a

    .line 165
    .restart local p1    # "listener":Ljava/lang/Object;
    :cond_16
    iget v0, p0, Lkorex/mail/event/FolderEvent;->type:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_a

    .line 166
    check-cast p1, Lkorex/mail/event/FolderListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/FolderListener;->folderRenamed(Lkorex/mail/event/FolderEvent;)V

    goto :goto_a
.end method

.method public getFolder()Lkorex/mail/Folder;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lkorex/mail/event/FolderEvent;->folder:Lkorex/mail/Folder;

    return-object v0
.end method

.method public getNewFolder()Lkorex/mail/Folder;
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lkorex/mail/event/FolderEvent;->newFolder:Lkorex/mail/Folder;

    return-object v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 129
    iget v0, p0, Lkorex/mail/event/FolderEvent;->type:I

    return v0
.end method
