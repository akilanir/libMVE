.class Lcom/sun/mail/imap/IMAPFolder$9;
.super Ljava/lang/Object;
.source "IMAPFolder.java"

# interfaces
.implements Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sun/mail/imap/IMAPFolder;->renameTo(Lkorex/mail/Folder;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sun/mail/imap/IMAPFolder;

.field final synthetic val$f:Lkorex/mail/Folder;


# direct methods
.method constructor <init>(Lcom/sun/mail/imap/IMAPFolder;Lkorex/mail/Folder;)V
    .registers 3
    .param p1, "this$0"    # Lcom/sun/mail/imap/IMAPFolder;

    .prologue
    .line 931
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPFolder$9;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    iput-object p2, p0, Lcom/sun/mail/imap/IMAPFolder$9;->val$f:Lkorex/mail/Folder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doCommand(Lcom/sun/mail/imap/protocol/IMAPProtocol;)Ljava/lang/Object;
    .registers 4
    .param p1, "p"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 933
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder$9;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder$9;->val$f:Lkorex/mail/Folder;

    invoke-virtual {v1}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->rename(Ljava/lang/String;Ljava/lang/String;)V

    .line 934
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0
.end method
