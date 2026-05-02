.class public Lkorex/mail/event/MessageChangedEvent;
.super Lkorex/mail/event/MailEvent;
.source "MessageChangedEvent.java"


# static fields
.field public static final ENVELOPE_CHANGED:I = 0x2

.field public static final FLAGS_CHANGED:I = 0x1

.field private static final serialVersionUID:J = -0x450aa78f41850e84L


# instance fields
.field protected transient msg:Lkorex/mail/Message;

.field protected type:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;ILkorex/mail/Message;)V
    .registers 4
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "type"    # I
    .param p3, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lkorex/mail/event/MailEvent;-><init>(Ljava/lang/Object;)V

    .line 82
    iput-object p3, p0, Lkorex/mail/event/MessageChangedEvent;->msg:Lkorex/mail/Message;

    .line 83
    iput p2, p0, Lkorex/mail/event/MessageChangedEvent;->type:I

    .line 84
    return-void
.end method


# virtual methods
.method public dispatch(Ljava/lang/Object;)V
    .registers 2
    .param p1, "listener"    # Ljava/lang/Object;

    .prologue
    .line 106
    check-cast p1, Lkorex/mail/event/MessageChangedListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/MessageChangedListener;->messageChanged(Lkorex/mail/event/MessageChangedEvent;)V

    .line 107
    return-void
.end method

.method public getMessage()Lkorex/mail/Message;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lkorex/mail/event/MessageChangedEvent;->msg:Lkorex/mail/Message;

    return-object v0
.end method

.method public getMessageChangeType()I
    .registers 2

    .prologue
    .line 91
    iget v0, p0, Lkorex/mail/event/MessageChangedEvent;->type:I

    return v0
.end method
