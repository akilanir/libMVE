.class Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;
.super Lcom/sun/mail/smtp/SMTPTransport$Authenticator;
.source "SMTPTransport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/smtp/SMTPTransport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NtlmAuthenticator"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private flags:I

.field private ntlm:Lcom/sun/mail/auth/Ntlm;

.field final synthetic this$0:Lcom/sun/mail/smtp/SMTPTransport;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1006
    const-class v0, Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Lcom/sun/mail/smtp/SMTPTransport;)V
    .registers 3

    .prologue
    .line 1010
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 1011
    const-string v0, "NTLM"

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;-><init>(Lcom/sun/mail/smtp/SMTPTransport;Ljava/lang/String;)V

    .line 1012
    return-void
.end method


# virtual methods
.method doAuth(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "authzid"    # Ljava/lang/String;
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "passwd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1029
    sget-boolean v1, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->$assertionsDisabled:Z

    if-nez v1, :cond_e

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->ntlm:Lcom/sun/mail/auth/Ntlm;

    if-nez v1, :cond_e

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1030
    :cond_e
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->ntlm:Lcom/sun/mail/auth/Ntlm;

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 1031
    invoke-virtual {v2}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 1030
    invoke-virtual {v1, v2}, Lcom/sun/mail/auth/Ntlm;->generateType3Msg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1033
    .local v0, "type3":Ljava/lang/String;
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v1, v0}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->resp:I

    .line 1034
    return-void
.end method

.method getInitialResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "authzid"    # Ljava/lang/String;
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "passwd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1016
    new-instance v0, Lcom/sun/mail/auth/Ntlm;

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v1}, Lcom/sun/mail/smtp/SMTPTransport;->getNTLMDomain()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v2}, Lcom/sun/mail/smtp/SMTPTransport;->getLocalHost()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 1017
    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v3}, Lcom/sun/mail/smtp/SMTPTransport;->access$200(Lcom/sun/mail/smtp/SMTPTransport;)Lcom/sun/mail/util/MailLogger;

    move-result-object v5

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/sun/mail/auth/Ntlm;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/sun/mail/util/MailLogger;)V

    iput-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->ntlm:Lcom/sun/mail/auth/Ntlm;

    .line 1019
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 1020
    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;
    invoke-static {v0}, Lcom/sun/mail/smtp/SMTPTransport;->access$600(Lcom/sun/mail/smtp/SMTPTransport;)Lkorex/mail/Session;

    move-result-object v0

    invoke-virtual {v0}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mail."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 1021
    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;
    invoke-static {v2}, Lcom/sun/mail/smtp/SMTPTransport;->access$700(Lcom/sun/mail/smtp/SMTPTransport;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".auth.ntlm.flags"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 1019
    invoke-static {v0, v1, v2}, Lcom/sun/mail/util/PropUtil;->getIntProperty(Ljava/util/Properties;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->flags:I

    .line 1023
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->ntlm:Lcom/sun/mail/auth/Ntlm;

    iget v1, p0, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;->flags:I

    invoke-virtual {v0, v1}, Lcom/sun/mail/auth/Ntlm;->generateType1Msg(I)Ljava/lang/String;

    move-result-object v6

    .line 1024
    .local v6, "type1":Ljava/lang/String;
    return-object v6
.end method
