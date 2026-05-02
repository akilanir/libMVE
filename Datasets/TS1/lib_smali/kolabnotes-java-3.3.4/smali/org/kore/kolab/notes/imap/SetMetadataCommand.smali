.class public Lorg/kore/kolab/notes/imap/SetMetadataCommand;
.super Ljava/lang/Object;
.source "SetMetadataCommand.java"

# interfaces
.implements Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;


# instance fields
.field private final folderName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "folderName"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lorg/kore/kolab/notes/imap/SetMetadataCommand;->folderName:Ljava/lang/String;

    .line 36
    return-void
.end method


# virtual methods
.method public doCommand(Lcom/sun/mail/imap/protocol/IMAPProtocol;)Ljava/lang/Object;
    .registers 8
    .param p1, "imapp"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 40
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 41
    .local v0, "command":Lcom/sun/mail/iap/Argument;
    new-instance v1, Lcom/sun/mail/iap/Argument;

    invoke-direct {v1}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 43
    .local v1, "listArguments":Lcom/sun/mail/iap/Argument;
    iget-object v3, p0, Lorg/kore/kolab/notes/imap/SetMetadataCommand;->folderName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 45
    const-string v3, "/vendor/kolab/folder-type"

    invoke-virtual {v0, v3}, Lcom/sun/mail/iap/Argument;->writeNString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 47
    const-string v3, "value.shared"

    invoke-virtual {v1, v3}, Lcom/sun/mail/iap/Argument;->writeNString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 48
    const-string v3, "note"

    invoke-virtual {v1, v3}, Lcom/sun/mail/iap/Argument;->writeNString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 50
    invoke-virtual {v0, v1}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    .line 52
    const-string v3, "SETANNOTATION"

    invoke-virtual {p1, v3, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v2

    .line 54
    .local v2, "response":[Lcom/sun/mail/iap/Response;
    array-length v3, v2

    const/4 v4, 0x1

    if-ne v3, v4, :cond_36

    const/4 v3, 0x0

    aget-object v3, v2, v3

    invoke-virtual {v3}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v3

    if-eqz v3, :cond_36

    .line 55
    const/4 v3, 0x0

    return-object v3

    .line 58
    :cond_36
    new-instance v3, Lcom/sun/mail/iap/ProtocolException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to set folder-type."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/sun/mail/iap/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
