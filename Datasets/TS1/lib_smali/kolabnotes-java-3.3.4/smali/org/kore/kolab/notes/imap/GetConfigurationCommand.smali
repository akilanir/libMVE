.class public Lorg/kore/kolab/notes/imap/GetConfigurationCommand;
.super Ljava/lang/Object;
.source "GetConfigurationCommand.java"

# interfaces
.implements Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;


# instance fields
.field private final folderName:Ljava/lang/String;

.field private isConfigurationFolder:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "folderName"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lorg/kore/kolab/notes/imap/GetConfigurationCommand;->folderName:Ljava/lang/String;

    .line 36
    return-void
.end method


# virtual methods
.method public doCommand(Lcom/sun/mail/imap/protocol/IMAPProtocol;)Ljava/lang/Object;
    .registers 7
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
    iget-object v4, p0, Lorg/kore/kolab/notes/imap/GetConfigurationCommand;->folderName:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 43
    const-string v4, "/vendor/kolab/folder-type"

    invoke-virtual {v0, v4}, Lcom/sun/mail/iap/Argument;->writeNString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 44
    const-string v4, "*"

    invoke-virtual {v0, v4}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 46
    const-string v4, "GETANNOTATION"

    invoke-virtual {p1, v4, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v2

    .line 48
    .local v2, "response":[Lcom/sun/mail/iap/Response;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    array-length v4, v2

    if-ge v1, v4, :cond_2f

    .line 49
    aget-object v4, v2, v1

    invoke-virtual {v4}, Lcom/sun/mail/iap/Response;->getRest()Ljava/lang/String;

    move-result-object v3

    .line 51
    .local v3, "rest":Ljava/lang/String;
    const-string v4, "configuration"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_31

    .line 52
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/kore/kolab/notes/imap/GetConfigurationCommand;->isConfigurationFolder:Z

    .line 57
    .end local v3    # "rest":Ljava/lang/String;
    :cond_2f
    const/4 v4, 0x0

    return-object v4

    .line 48
    .restart local v3    # "rest":Ljava/lang/String;
    :cond_31
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b
.end method

.method public isConfigurationFolder()Z
    .registers 2

    .prologue
    .line 61
    iget-boolean v0, p0, Lorg/kore/kolab/notes/imap/GetConfigurationCommand;->isConfigurationFolder:Z

    return v0
.end method
