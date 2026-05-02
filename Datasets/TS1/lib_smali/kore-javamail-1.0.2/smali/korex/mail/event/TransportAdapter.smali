.class public abstract Lkorex/mail/event/TransportAdapter;
.super Ljava/lang/Object;
.source "TransportAdapter.java"

# interfaces
.implements Lkorex/mail/event/TransportListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public messageDelivered(Lkorex/mail/event/TransportEvent;)V
    .registers 2
    .param p1, "e"    # Lkorex/mail/event/TransportEvent;

    .prologue
    .line 52
    return-void
.end method

.method public messageNotDelivered(Lkorex/mail/event/TransportEvent;)V
    .registers 2
    .param p1, "e"    # Lkorex/mail/event/TransportEvent;

    .prologue
    .line 53
    return-void
.end method

.method public messagePartiallyDelivered(Lkorex/mail/event/TransportEvent;)V
    .registers 2
    .param p1, "e"    # Lkorex/mail/event/TransportEvent;

    .prologue
    .line 54
    return-void
.end method
