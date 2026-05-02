.class public Lkorex/mail/MessageRemovedException;
.super Lkorex/mail/MessagingException;
.source "MessageRemovedException.java"


# static fields
.field private static final serialVersionUID:J = 0x1b14623c881e84f2L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 61
    invoke-direct {p0}, Lkorex/mail/MessagingException;-><init>()V

    .line 62
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 3
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 84
    invoke-direct {p0, p1, p2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 85
    return-void
.end method
