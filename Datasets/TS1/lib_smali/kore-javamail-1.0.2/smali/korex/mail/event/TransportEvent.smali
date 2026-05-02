.class public Lkorex/mail/event/TransportEvent;
.super Lkorex/mail/event/MailEvent;
.source "TransportEvent.java"


# static fields
.field public static final MESSAGE_DELIVERED:I = 0x1

.field public static final MESSAGE_NOT_DELIVERED:I = 0x2

.field public static final MESSAGE_PARTIALLY_DELIVERED:I = 0x3

.field private static final serialVersionUID:J = -0x41a3cfaa750c25b1L


# instance fields
.field protected transient invalid:[Lkorex/mail/Address;

.field protected transient msg:Lkorex/mail/Message;

.field protected type:I

.field protected transient validSent:[Lkorex/mail/Address;

.field protected transient validUnsent:[Lkorex/mail/Address;


# direct methods
.method public constructor <init>(Lkorex/mail/Transport;I[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;Lkorex/mail/Message;)V
    .registers 7
    .param p1, "transport"    # Lkorex/mail/Transport;
    .param p2, "type"    # I
    .param p3, "validSent"    # [Lkorex/mail/Address;
    .param p4, "validUnsent"    # [Lkorex/mail/Address;
    .param p5, "invalid"    # [Lkorex/mail/Address;
    .param p6, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 115
    invoke-direct {p0, p1}, Lkorex/mail/event/MailEvent;-><init>(Ljava/lang/Object;)V

    .line 116
    iput p2, p0, Lkorex/mail/event/TransportEvent;->type:I

    .line 117
    iput-object p3, p0, Lkorex/mail/event/TransportEvent;->validSent:[Lkorex/mail/Address;

    .line 118
    iput-object p4, p0, Lkorex/mail/event/TransportEvent;->validUnsent:[Lkorex/mail/Address;

    .line 119
    iput-object p5, p0, Lkorex/mail/event/TransportEvent;->invalid:[Lkorex/mail/Address;

    .line 120
    iput-object p6, p0, Lkorex/mail/event/TransportEvent;->msg:Lkorex/mail/Message;

    .line 121
    return-void
.end method


# virtual methods
.method public dispatch(Ljava/lang/Object;)V
    .registers 4
    .param p1, "listener"    # Ljava/lang/Object;

    .prologue
    .line 171
    iget v0, p0, Lkorex/mail/event/TransportEvent;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_b

    .line 172
    check-cast p1, Lkorex/mail/event/TransportListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/TransportListener;->messageDelivered(Lkorex/mail/event/TransportEvent;)V

    .line 177
    :goto_a
    return-void

    .line 173
    .restart local p1    # "listener":Ljava/lang/Object;
    :cond_b
    iget v0, p0, Lkorex/mail/event/TransportEvent;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_16

    .line 174
    check-cast p1, Lkorex/mail/event/TransportListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/TransportListener;->messageNotDelivered(Lkorex/mail/event/TransportEvent;)V

    goto :goto_a

    .line 176
    .restart local p1    # "listener":Ljava/lang/Object;
    :cond_16
    check-cast p1, Lkorex/mail/event/TransportListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/TransportListener;->messagePartiallyDelivered(Lkorex/mail/event/TransportEvent;)V

    goto :goto_a
.end method

.method public getInvalidAddresses()[Lkorex/mail/Address;
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lkorex/mail/event/TransportEvent;->invalid:[Lkorex/mail/Address;

    return-object v0
.end method

.method public getMessage()Lkorex/mail/Message;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lkorex/mail/event/TransportEvent;->msg:Lkorex/mail/Message;

    return-object v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 128
    iget v0, p0, Lkorex/mail/event/TransportEvent;->type:I

    return v0
.end method

.method public getValidSentAddresses()[Lkorex/mail/Address;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lkorex/mail/event/TransportEvent;->validSent:[Lkorex/mail/Address;

    return-object v0
.end method

.method public getValidUnsentAddresses()[Lkorex/mail/Address;
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lkorex/mail/event/TransportEvent;->validUnsent:[Lkorex/mail/Address;

    return-object v0
.end method
