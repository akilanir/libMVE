.class public Lkorex/mail/AuthenticationFailedException;
.super Lkorex/mail/MessagingException;
.source "AuthenticationFailedException.java"


# static fields
.field private static final serialVersionUID:J = 0x6d438d6b238969fL


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Lkorex/mail/MessagingException;-><init>()V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 82
    invoke-direct {p0, p1, p2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 83
    return-void
.end method
