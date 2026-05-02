.class public Lcom/sun/mail/pop3/POP3SSLStore;
.super Lcom/sun/mail/pop3/POP3Store;
.source "POP3SSLStore.java"


# direct methods
.method public constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V
    .registers 5
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "url"    # Lkorex/mail/URLName;

    .prologue
    .line 53
    const-string v0, "pop3s"

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/sun/mail/pop3/POP3Store;-><init>(Lkorex/mail/Session;Lkorex/mail/URLName;Ljava/lang/String;Z)V

    .line 54
    return-void
.end method
