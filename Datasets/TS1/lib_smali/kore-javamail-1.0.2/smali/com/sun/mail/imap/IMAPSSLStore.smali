.class public Lcom/sun/mail/imap/IMAPSSLStore;
.super Lcom/sun/mail/imap/IMAPStore;
.source "IMAPSSLStore.java"


# direct methods
.method public constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V
    .registers 5
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "url"    # Lkorex/mail/URLName;

    .prologue
    .line 59
    const-string v0, "imaps"

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/sun/mail/imap/IMAPStore;-><init>(Lkorex/mail/Session;Lkorex/mail/URLName;Ljava/lang/String;Z)V

    .line 60
    return-void
.end method
