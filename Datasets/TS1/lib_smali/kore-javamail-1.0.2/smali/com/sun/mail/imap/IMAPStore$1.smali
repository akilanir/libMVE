.class Lcom/sun/mail/imap/IMAPStore$1;
.super Ljava/lang/Object;
.source "IMAPStore.java"

# interfaces
.implements Lcom/sun/mail/iap/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/imap/IMAPStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sun/mail/imap/IMAPStore;


# direct methods
.method constructor <init>(Lcom/sun/mail/imap/IMAPStore;)V
    .registers 2
    .param p1, "this$0"    # Lcom/sun/mail/imap/IMAPStore;

    .prologue
    .line 407
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPStore$1;->this$0:Lcom/sun/mail/imap/IMAPStore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lcom/sun/mail/iap/Response;)V
    .registers 4
    .param p1, "r"    # Lcom/sun/mail/iap/Response;

    .prologue
    .line 410
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isNO()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isBAD()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 411
    :cond_18
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore$1;->this$0:Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v0, p1}, Lcom/sun/mail/imap/IMAPStore;->handleResponseCode(Lcom/sun/mail/iap/Response;)V

    .line 412
    :cond_1d
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 413
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore$1;->this$0:Lcom/sun/mail/imap/IMAPStore;

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "IMAPStore non-store connection dead"

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 414
    :cond_2c
    return-void
.end method
