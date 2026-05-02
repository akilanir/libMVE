.class Lkorex/mail/EventQueue$TerminatorEvent;
.super Lkorex/mail/event/MailEvent;
.source "EventQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/EventQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TerminatorEvent"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 73
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0, v0}, Lkorex/mail/event/MailEvent;-><init>(Ljava/lang/Object;)V

    .line 74
    return-void
.end method


# virtual methods
.method public dispatch(Ljava/lang/Object;)V
    .registers 3
    .param p1, "listener"    # Ljava/lang/Object;

    .prologue
    .line 78
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 79
    return-void
.end method
