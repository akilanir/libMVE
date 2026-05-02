.class public Lkorex/mail/event/ConnectionEvent;
.super Lkorex/mail/event/MailEvent;
.source "ConnectionEvent.java"


# static fields
.field public static final CLOSED:I = 0x3

.field public static final DISCONNECTED:I = 0x2

.field public static final OPENED:I = 0x1

.field private static final serialVersionUID:J = -0x19bffd629136067dL


# instance fields
.field protected type:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;I)V
    .registers 3
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "type"    # I

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lkorex/mail/event/MailEvent;-><init>(Ljava/lang/Object;)V

    .line 79
    iput p2, p0, Lkorex/mail/event/ConnectionEvent;->type:I

    .line 80
    return-void
.end method


# virtual methods
.method public dispatch(Ljava/lang/Object;)V
    .registers 4
    .param p1, "listener"    # Ljava/lang/Object;

    .prologue
    .line 94
    iget v0, p0, Lkorex/mail/event/ConnectionEvent;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_b

    .line 95
    check-cast p1, Lkorex/mail/event/ConnectionListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/ConnectionListener;->opened(Lkorex/mail/event/ConnectionEvent;)V

    .line 100
    :cond_a
    :goto_a
    return-void

    .line 96
    .restart local p1    # "listener":Ljava/lang/Object;
    :cond_b
    iget v0, p0, Lkorex/mail/event/ConnectionEvent;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_16

    .line 97
    check-cast p1, Lkorex/mail/event/ConnectionListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/ConnectionListener;->disconnected(Lkorex/mail/event/ConnectionEvent;)V

    goto :goto_a

    .line 98
    .restart local p1    # "listener":Ljava/lang/Object;
    :cond_16
    iget v0, p0, Lkorex/mail/event/ConnectionEvent;->type:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_a

    .line 99
    check-cast p1, Lkorex/mail/event/ConnectionListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/ConnectionListener;->closed(Lkorex/mail/event/ConnectionEvent;)V

    goto :goto_a
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 87
    iget v0, p0, Lkorex/mail/event/ConnectionEvent;->type:I

    return v0
.end method
