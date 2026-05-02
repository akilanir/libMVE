.class Lcom/sun/mail/imap/IMAPFolder$10;
.super Ljava/lang/Object;
.source "IMAPFolder.java"

# interfaces
.implements Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sun/mail/imap/IMAPFolder;->appendMessages([Lkorex/mail/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sun/mail/imap/IMAPFolder;

.field final synthetic val$dd:Ljava/util/Date;

.field final synthetic val$f:Lkorex/mail/Flags;

.field final synthetic val$mos:Lcom/sun/mail/imap/MessageLiteral;


# direct methods
.method constructor <init>(Lcom/sun/mail/imap/IMAPFolder;Lkorex/mail/Flags;Ljava/util/Date;Lcom/sun/mail/imap/MessageLiteral;)V
    .registers 5
    .param p1, "this$0"    # Lcom/sun/mail/imap/IMAPFolder;

    .prologue
    .line 1774
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPFolder$10;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    iput-object p2, p0, Lcom/sun/mail/imap/IMAPFolder$10;->val$f:Lkorex/mail/Flags;

    iput-object p3, p0, Lcom/sun/mail/imap/IMAPFolder$10;->val$dd:Ljava/util/Date;

    iput-object p4, p0, Lcom/sun/mail/imap/IMAPFolder$10;->val$mos:Lcom/sun/mail/imap/MessageLiteral;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doCommand(Lcom/sun/mail/imap/protocol/IMAPProtocol;)Ljava/lang/Object;
    .registers 6
    .param p1, "p"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1777
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder$10;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder$10;->val$f:Lkorex/mail/Flags;

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPFolder$10;->val$dd:Ljava/util/Date;

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPFolder$10;->val$mos:Lcom/sun/mail/imap/MessageLiteral;

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->append(Ljava/lang/String;Lkorex/mail/Flags;Ljava/util/Date;Lcom/sun/mail/iap/Literal;)V

    .line 1778
    const/4 v0, 0x0

    return-object v0
.end method
