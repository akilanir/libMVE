.class Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;
.super Lcom/sun/mail/smtp/SMTPTransport$Authenticator;
.source "SMTPTransport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/smtp/SMTPTransport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DigestMD5Authenticator"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private md5support:Lcom/sun/mail/smtp/DigestMD5;

.field final synthetic this$0:Lcom/sun/mail/smtp/SMTPTransport;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 970
    const-class v0, Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Lcom/sun/mail/smtp/SMTPTransport;)V
    .registers 3

    .prologue
    .line 973
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 974
    const-string v0, "DIGEST-MD5"

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;-><init>(Lcom/sun/mail/smtp/SMTPTransport;Ljava/lang/String;)V

    .line 975
    return-void
.end method

.method private declared-synchronized getMD5()Lcom/sun/mail/smtp/DigestMD5;
    .registers 3

    .prologue
    .line 978
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->md5support:Lcom/sun/mail/smtp/DigestMD5;

    if-nez v0, :cond_12

    .line 979
    new-instance v0, Lcom/sun/mail/smtp/DigestMD5;

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v1}, Lcom/sun/mail/smtp/SMTPTransport;->access$200(Lcom/sun/mail/smtp/SMTPTransport;)Lcom/sun/mail/util/MailLogger;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/sun/mail/smtp/DigestMD5;-><init>(Lcom/sun/mail/util/MailLogger;)V

    iput-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->md5support:Lcom/sun/mail/smtp/DigestMD5;

    .line 980
    :cond_12
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->md5support:Lcom/sun/mail/smtp/DigestMD5;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    monitor-exit p0

    return-object v0

    .line 978
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method doAuth(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
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
    .line 985
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->getMD5()Lcom/sun/mail/smtp/DigestMD5;

    move-result-object v0

    .line 986
    .local v0, "md5":Lcom/sun/mail/smtp/DigestMD5;
    sget-boolean v1, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->$assertionsDisabled:Z

    if-nez v1, :cond_10

    if-nez v0, :cond_10

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 988
    :cond_10
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v1}, Lcom/sun/mail/smtp/SMTPTransport;->getSASLRealm()Ljava/lang/String;

    move-result-object v4

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 989
    invoke-virtual {v1}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v5

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    .line 988
    invoke-virtual/range {v0 .. v5}, Lcom/sun/mail/smtp/DigestMD5;->authClient(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v6

    .line 990
    .local v6, "b":[B
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v1, v6}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand([B)I

    move-result v1

    iput v1, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->resp:I

    .line 991
    iget v1, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->resp:I

    const/16 v2, 0x14e

    if-ne v1, v2, :cond_40

    .line 992
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v1}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/smtp/DigestMD5;->authServer(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_41

    .line 994
    const/4 v1, -0x1

    iput v1, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->resp:I

    .line 1000
    :cond_40
    :goto_40
    return-void

    .line 997
    :cond_41
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    const/4 v2, 0x0

    new-array v2, v2, [B

    invoke-virtual {v1, v2}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand([B)I

    move-result v1

    iput v1, p0, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;->resp:I

    goto :goto_40
.end method
