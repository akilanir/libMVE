.class Lkorex/mail/EventQueue$QueueElement;
.super Ljava/lang/Object;
.source "EventQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/EventQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "QueueElement"
.end annotation


# instance fields
.field event:Lkorex/mail/event/MailEvent;

.field vector:Ljava/util/Vector;


# direct methods
.method constructor <init>(Lkorex/mail/event/MailEvent;Ljava/util/Vector;)V
    .registers 4
    .param p1, "event"    # Lkorex/mail/event/MailEvent;
    .param p2, "vector"    # Ljava/util/Vector;

    .prologue
    const/4 v0, 0x0

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object v0, p0, Lkorex/mail/EventQueue$QueueElement;->event:Lkorex/mail/event/MailEvent;

    .line 87
    iput-object v0, p0, Lkorex/mail/EventQueue$QueueElement;->vector:Ljava/util/Vector;

    .line 90
    iput-object p1, p0, Lkorex/mail/EventQueue$QueueElement;->event:Lkorex/mail/event/MailEvent;

    .line 91
    iput-object p2, p0, Lkorex/mail/EventQueue$QueueElement;->vector:Ljava/util/Vector;

    .line 92
    return-void
.end method
