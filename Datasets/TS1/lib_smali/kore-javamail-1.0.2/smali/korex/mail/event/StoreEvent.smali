.class public Lkorex/mail/event/StoreEvent;
.super Lkorex/mail/event/MailEvent;
.source "StoreEvent.java"


# static fields
.field public static final ALERT:I = 0x1

.field public static final NOTICE:I = 0x2

.field private static final serialVersionUID:J = 0x1ae7a9da6074bb02L


# instance fields
.field protected message:Ljava/lang/String;

.field protected type:I


# direct methods
.method public constructor <init>(Lkorex/mail/Store;ILjava/lang/String;)V
    .registers 4
    .param p1, "store"    # Lkorex/mail/Store;
    .param p2, "type"    # I
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lkorex/mail/event/MailEvent;-><init>(Ljava/lang/Object;)V

    .line 93
    iput p2, p0, Lkorex/mail/event/StoreEvent;->type:I

    .line 94
    iput-object p3, p0, Lkorex/mail/event/StoreEvent;->message:Ljava/lang/String;

    .line 95
    return-void
.end method


# virtual methods
.method public dispatch(Ljava/lang/Object;)V
    .registers 2
    .param p1, "listener"    # Ljava/lang/Object;

    .prologue
    .line 121
    check-cast p1, Lkorex/mail/event/StoreListener;

    .end local p1    # "listener":Ljava/lang/Object;
    invoke-interface {p1, p0}, Lkorex/mail/event/StoreListener;->notification(Lkorex/mail/event/StoreEvent;)V

    .line 122
    return-void
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lkorex/mail/event/StoreEvent;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageType()I
    .registers 2

    .prologue
    .line 105
    iget v0, p0, Lkorex/mail/event/StoreEvent;->type:I

    return v0
.end method
