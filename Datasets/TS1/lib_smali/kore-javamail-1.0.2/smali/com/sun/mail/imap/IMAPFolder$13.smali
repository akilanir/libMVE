.class Lcom/sun/mail/imap/IMAPFolder$13;
.super Ljava/lang/Object;
.source "IMAPFolder.java"

# interfaces
.implements Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sun/mail/imap/IMAPFolder;->setQuota(Lkorex/mail/Quota;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sun/mail/imap/IMAPFolder;

.field final synthetic val$quota:Lkorex/mail/Quota;


# direct methods
.method constructor <init>(Lcom/sun/mail/imap/IMAPFolder;Lkorex/mail/Quota;)V
    .registers 3
    .param p1, "this$0"    # Lcom/sun/mail/imap/IMAPFolder;

    .prologue
    .line 2698
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPFolder$13;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    iput-object p2, p0, Lcom/sun/mail/imap/IMAPFolder$13;->val$quota:Lkorex/mail/Quota;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doCommand(Lcom/sun/mail/imap/protocol/IMAPProtocol;)Ljava/lang/Object;
    .registers 3
    .param p1, "p"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 2701
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder$13;->val$quota:Lkorex/mail/Quota;

    invoke-virtual {p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->setQuota(Lkorex/mail/Quota;)V

    .line 2702
    const/4 v0, 0x0

    return-object v0
.end method
