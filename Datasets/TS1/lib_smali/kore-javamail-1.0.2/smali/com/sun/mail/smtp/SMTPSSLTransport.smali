.class public Lcom/sun/mail/smtp/SMTPSSLTransport;
.super Lcom/sun/mail/smtp/SMTPTransport;
.source "SMTPSSLTransport.java"


# direct methods
.method public constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V
    .registers 5
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "urlname"    # Lkorex/mail/URLName;

    .prologue
    .line 61
    const-string v0, "smtps"

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/sun/mail/smtp/SMTPTransport;-><init>(Lkorex/mail/Session;Lkorex/mail/URLName;Ljava/lang/String;Z)V

    .line 62
    return-void
.end method
