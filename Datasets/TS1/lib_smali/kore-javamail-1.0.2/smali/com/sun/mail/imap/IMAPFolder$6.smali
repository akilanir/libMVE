.class Lcom/sun/mail/imap/IMAPFolder$6;
.super Ljava/lang/Object;
.source "IMAPFolder.java"

# interfaces
.implements Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sun/mail/imap/IMAPFolder;->create(I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sun/mail/imap/IMAPFolder;

.field final synthetic val$sep:C

.field final synthetic val$type:I


# direct methods
.method constructor <init>(Lcom/sun/mail/imap/IMAPFolder;IC)V
    .registers 4
    .param p1, "this$0"    # Lcom/sun/mail/imap/IMAPFolder;

    .prologue
    .line 769
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPFolder$6;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    iput p2, p0, Lcom/sun/mail/imap/IMAPFolder$6;->val$type:I

    iput-char p3, p0, Lcom/sun/mail/imap/IMAPFolder$6;->val$sep:C

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doCommand(Lcom/sun/mail/imap/protocol/IMAPProtocol;)Ljava/lang/Object;
    .registers 5
    .param p1, "p"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 772
    iget v1, p0, Lcom/sun/mail/imap/IMAPFolder$6;->val$type:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_23

    .line 773
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPFolder$6;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    iget-object v2, v2, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-char v2, p0, Lcom/sun/mail/imap/IMAPFolder$6;->val$sep:C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->create(Ljava/lang/String;)V

    .line 793
    :cond_20
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v1

    .line 775
    :cond_23
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder$6;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    iget-object v1, v1, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->create(Ljava/lang/String;)V

    .line 781
    iget v1, p0, Lcom/sun/mail/imap/IMAPFolder$6;->val$type:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_20

    .line 784
    const-string v1, ""

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPFolder$6;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    iget-object v2, v2, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->list(Ljava/lang/String;Ljava/lang/String;)[Lcom/sun/mail/imap/protocol/ListInfo;

    move-result-object v0

    .line 785
    .local v0, "li":[Lcom/sun/mail/imap/protocol/ListInfo;
    if-eqz v0, :cond_20

    const/4 v1, 0x0

    aget-object v1, v0, v1

    iget-boolean v1, v1, Lcom/sun/mail/imap/protocol/ListInfo;->hasInferiors:Z

    if-nez v1, :cond_20

    .line 788
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPFolder$6;->this$0:Lcom/sun/mail/imap/IMAPFolder;

    iget-object v1, v1, Lcom/sun/mail/imap/IMAPFolder;->fullName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->delete(Ljava/lang/String;)V

    .line 789
    new-instance v1, Lcom/sun/mail/iap/ProtocolException;

    const-string v2, "Unsupported type"

    invoke-direct {v1, v2}, Lcom/sun/mail/iap/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
