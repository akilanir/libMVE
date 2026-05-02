.class Lcom/sun/mail/imap/IMAPFolder$19;
.super Ljava/lang/Object;
.source "IMAPFolder.java"

# interfaces
.implements Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sun/mail/imap/IMAPFolder;->startIdle(Lcom/sun/mail/imap/IdleManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sun/mail/imap/IMAPFolder;


# direct methods
.method constructor <init>(Lcom/sun/mail/imap/IMAPFolder;)V
    .registers 2
    .param p1, "this$0"    # Lcom/sun/mail/imap/IMAPFolder;

    .prologue
    .line 2960
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPFolder$19;->this$0:Lcom/sun/mail/imap/IMAPFolder;

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
    .line 2963
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder$19;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    # getter for: Lcom/sun/mail/imap/IMAPFolder;->idleState:I
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPFolder;->access$000(Lcom/sun/mail/imap/IMAPFolder;)I

    move-result v0

    if-nez v0, :cond_14

    .line 2964
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->idleStart()V

    .line 2965
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder$19;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    const/4 v1, 0x1

    # setter for: Lcom/sun/mail/imap/IMAPFolder;->idleState:I
    invoke-static {v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->access$002(Lcom/sun/mail/imap/IMAPFolder;I)I

    .line 2966
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2975
    :goto_13
    return-object v0

    .line 2973
    :cond_14
    :try_start_14
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPFolder$19;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPFolder;->messageCacheLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1b
    .catch Ljava/lang/InterruptedException; {:try_start_14 .. :try_end_1b} :catch_1e

    .line 2975
    :goto_1b
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_13

    .line 2974
    :catch_1e
    move-exception v0

    goto :goto_1b
.end method
