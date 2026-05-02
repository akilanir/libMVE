.class public abstract Lkorex/mail/event/ConnectionAdapter;
.super Ljava/lang/Object;
.source "ConnectionAdapter.java"

# interfaces
.implements Lkorex/mail/event/ConnectionListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public closed(Lkorex/mail/event/ConnectionEvent;)V
    .registers 2
    .param p1, "e"    # Lkorex/mail/event/ConnectionEvent;

    .prologue
    .line 54
    return-void
.end method

.method public disconnected(Lkorex/mail/event/ConnectionEvent;)V
    .registers 2
    .param p1, "e"    # Lkorex/mail/event/ConnectionEvent;

    .prologue
    .line 53
    return-void
.end method

.method public opened(Lkorex/mail/event/ConnectionEvent;)V
    .registers 2
    .param p1, "e"    # Lkorex/mail/event/ConnectionEvent;

    .prologue
    .line 52
    return-void
.end method
