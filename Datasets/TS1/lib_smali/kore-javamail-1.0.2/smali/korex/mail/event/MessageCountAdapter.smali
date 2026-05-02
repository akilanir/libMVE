.class public abstract Lkorex/mail/event/MessageCountAdapter;
.super Ljava/lang/Object;
.source "MessageCountAdapter.java"

# interfaces
.implements Lkorex/mail/event/MessageCountListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public messagesAdded(Lkorex/mail/event/MessageCountEvent;)V
    .registers 2
    .param p1, "e"    # Lkorex/mail/event/MessageCountEvent;

    .prologue
    .line 52
    return-void
.end method

.method public messagesRemoved(Lkorex/mail/event/MessageCountEvent;)V
    .registers 2
    .param p1, "e"    # Lkorex/mail/event/MessageCountEvent;

    .prologue
    .line 53
    return-void
.end method
