.class public Lcom/sun/mail/imap/MessageVanishedEvent;
.super Lkorex/mail/event/MessageCountEvent;
.source "MessageVanishedEvent.java"


# static fields
.field private static final noMessages:[Lkorex/mail/Message;

.field private static final serialVersionUID:J = 0x1dba032059e3b7daL


# instance fields
.field private uids:[J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 64
    const/4 v0, 0x0

    new-array v0, v0, [Lkorex/mail/Message;

    sput-object v0, Lcom/sun/mail/imap/MessageVanishedEvent;->noMessages:[Lkorex/mail/Message;

    return-void
.end method

.method public constructor <init>(Lkorex/mail/Folder;[J)V
    .registers 6
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "uids"    # [J

    .prologue
    .line 75
    const/4 v0, 0x2

    const/4 v1, 0x1

    sget-object v2, Lcom/sun/mail/imap/MessageVanishedEvent;->noMessages:[Lkorex/mail/Message;

    invoke-direct {p0, p1, v0, v1, v2}, Lkorex/mail/event/MessageCountEvent;-><init>(Lkorex/mail/Folder;IZ[Lkorex/mail/Message;)V

    .line 76
    iput-object p2, p0, Lcom/sun/mail/imap/MessageVanishedEvent;->uids:[J

    .line 77
    return-void
.end method


# virtual methods
.method public getUIDs()[J
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/sun/mail/imap/MessageVanishedEvent;->uids:[J

    return-object v0
.end method
