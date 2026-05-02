.class public Lkorex/mail/NoSuchProviderException;
.super Lkorex/mail/MessagingException;
.source "NoSuchProviderException.java"


# static fields
.field private static final serialVersionUID:J = 0x6fd4e6b3cb29cd5bL


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Lkorex/mail/MessagingException;-><init>()V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 82
    return-void
.end method
