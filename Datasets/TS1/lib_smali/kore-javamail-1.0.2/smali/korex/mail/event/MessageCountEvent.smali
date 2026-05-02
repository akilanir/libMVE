.class public Lkorex/mail/event/MessageCountEvent;
.super Lkorex/mail/event/MailEvent;
.source "MessageCountEvent.java"


# static fields
.field public static final ADDED:I = 0x1

.field public static final REMOVED:I = 0x2

.field private static final serialVersionUID:J = -0x6759235cec0a7499L


# instance fields
.field protected transient msgs:[Lkorex/mail/Message;

.field protected removed:Z

.field protected type:I


# direct methods
.method public constructor <init>(Lkorex/mail/Folder;IZ[Lkorex/mail/Message;)V
    .registers 5
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "type"    # I
    .param p3, "removed"    # Z
    .param p4, "msgs"    # [Lkorex/mail/Message;

    .prologue
    .line 110
    invoke-direct {p0, p1}, Lkorex/mail/event/MailEvent;-><init>(Ljava/lang/Object;)V

    .line 111
    iput p2, p0, Lkorex/mail/event/MessageCountEvent;->type:I

    .line 112
    iput-boolean p3, p0, Lkorex/mail/event/MessageCountEvent;->removed:Z

    .line 113
    iput-object p4, p0, Lkorex/mail/event/MessageCountEvent;->msgs:[Lkorex/mail/Message;

    .line 114
    return-void
.end method


# virtual methods
.method public dispatch(Ljava/lang/Object;)V
    .registers 4
    .param p1, "listener"    # Ljava/lang/Object;

    .prologue
    .line 153
    iget v0, p0, Lkorex/mail/event/MessageCountEvent;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_b

    .line 154
    check-cast p1, Lkorex/mail/event/MessageCountListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/MessageCountListener;->messagesAdded(Lkorex/mail/event/MessageCountEvent;)V

    .line 157
    :goto_a
    return-void

    .line 156
    .restart local p1    # "listener":Ljava/lang/Object;
    :cond_b
    check-cast p1, Lkorex/mail/event/MessageCountListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/MessageCountListener;->messagesRemoved(Lkorex/mail/event/MessageCountEvent;)V

    goto :goto_a
.end method

.method public getMessages()[Lkorex/mail/Message;
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lkorex/mail/event/MessageCountEvent;->msgs:[Lkorex/mail/Message;

    return-object v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 121
    iget v0, p0, Lkorex/mail/event/MessageCountEvent;->type:I

    return v0
.end method

.method public isRemoved()Z
    .registers 2

    .prologue
    .line 138
    iget-boolean v0, p0, Lkorex/mail/event/MessageCountEvent;->removed:Z

    return v0
.end method
