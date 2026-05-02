.class abstract Lcom/sun/mail/smtp/SMTPTransport$Authenticator;
.super Ljava/lang/Object;
.source "SMTPTransport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/smtp/SMTPTransport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "Authenticator"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mech:Ljava/lang/String;

.field protected resp:I

.field final synthetic this$0:Lcom/sun/mail/smtp/SMTPTransport;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 826
    const-class v0, Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Lcom/sun/mail/smtp/SMTPTransport;Ljava/lang/String;)V
    .registers 4
    .param p2, "mech"    # Ljava/lang/String;

    .prologue
    .line 830
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 831
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p2, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    .line 832
    return-void
.end method


# virtual methods
.method authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 14
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "authzid"    # Ljava/lang/String;
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "passwd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/16 v8, 0xeb

    .line 845
    const/4 v3, 0x0

    .line 848
    .local v3, "thrown":Ljava/lang/Throwable;
    :try_start_3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->getInitialResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 849
    .local v1, "ir":Ljava/lang/String;
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->noauthdebug:Z
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$000(Lcom/sun/mail/smtp/SMTPTransport;)Z

    move-result v4

    if-eqz v4, :cond_40

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->isTracing()Z
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$100(Lcom/sun/mail/smtp/SMTPTransport;)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 850
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$200(Lcom/sun/mail/smtp/SMTPTransport;)Lcom/sun/mail/util/MailLogger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " command trace suppressed"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 851
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->suspendTracing()V
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$300(Lcom/sun/mail/smtp/SMTPTransport;)V

    .line 853
    :cond_40
    if-eqz v1, :cond_106

    .line 854
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 855
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_103

    const-string v4, "="

    :goto_63
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 854
    invoke-virtual {v5, v4}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    .line 863
    :goto_71
    iget v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    const/16 v5, 0x212

    if-ne v4, v5, :cond_a5

    .line 864
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v4}, Lcom/sun/mail/smtp/SMTPTransport;->startTLS()V

    .line 865
    if-eqz v1, :cond_1a1

    .line 866
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    .line 870
    :cond_a5
    :goto_a5
    iget v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    const/16 v5, 0x14e

    if-ne v4, v5, :cond_ae

    .line 871
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->doAuth(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_ae
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_ae} :catch_125
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_ae} :catch_1c0
    .catchall {:try_start_3 .. :try_end_ae} :catchall_2c6

    .line 878
    :cond_ae
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->noauthdebug:Z
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$000(Lcom/sun/mail/smtp/SMTPTransport;)Z

    move-result v4

    if-eqz v4, :cond_ec

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->isTracing()Z
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$100(Lcom/sun/mail/smtp/SMTPTransport;)Z

    move-result v4

    if-eqz v4, :cond_ec

    .line 879
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$200(Lcom/sun/mail/smtp/SMTPTransport;)Lcom/sun/mail/util/MailLogger;

    move-result-object v5

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    if-ne v4, v8, :cond_23d

    const-string v4, "succeeded"

    :goto_e1
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 881
    :cond_ec
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->resumeTracing()V
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$400(Lcom/sun/mail/smtp/SMTPTransport;)V

    .line 882
    iget v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    if-eq v4, v8, :cond_34b

    .line 883
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$500(Lcom/sun/mail/smtp/SMTPTransport;)V

    .line 884
    if-eqz v3, :cond_25f

    .line 885
    instance-of v4, v3, Ljava/lang/Error;

    if-eqz v4, :cond_241

    .line 886
    check-cast v3, Ljava/lang/Error;

    .end local v3    # "thrown":Ljava/lang/Throwable;
    throw v3

    .restart local v3    # "thrown":Ljava/lang/Throwable;
    :cond_103
    move-object v4, v1

    .line 855
    goto/16 :goto_63

    .line 857
    :cond_106
    :try_start_106
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I
    :try_end_123
    .catch Ljava/io/IOException; {:try_start_106 .. :try_end_123} :catch_125
    .catch Ljava/lang/Throwable; {:try_start_106 .. :try_end_123} :catch_1c0
    .catchall {:try_start_106 .. :try_end_123} :catchall_2c6

    goto/16 :goto_71

    .line 872
    .end local v1    # "ir":Ljava/lang/String;
    :catch_125
    move-exception v0

    .line 873
    .local v0, "ex":Ljava/io/IOException;
    :try_start_126
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$200(Lcom/sun/mail/smtp/SMTPTransport;)Lcom/sun/mail/util/MailLogger;

    move-result-object v4

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "AUTH "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " failed"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_14c
    .catchall {:try_start_126 .. :try_end_14c} :catchall_2c6

    .line 878
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->noauthdebug:Z
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$000(Lcom/sun/mail/smtp/SMTPTransport;)Z

    move-result v4

    if-eqz v4, :cond_18a

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->isTracing()Z
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$100(Lcom/sun/mail/smtp/SMTPTransport;)Z

    move-result v4

    if-eqz v4, :cond_18a

    .line 879
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$200(Lcom/sun/mail/smtp/SMTPTransport;)Lcom/sun/mail/util/MailLogger;

    move-result-object v5

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    if-ne v4, v8, :cond_26b

    const-string v4, "succeeded"

    :goto_17f
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 881
    :cond_18a
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->resumeTracing()V
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$400(Lcom/sun/mail/smtp/SMTPTransport;)V

    .line 882
    iget v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    if-eq v4, v8, :cond_34b

    .line 883
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$500(Lcom/sun/mail/smtp/SMTPTransport;)V

    .line 884
    if-eqz v3, :cond_28d

    .line 885
    instance-of v4, v3, Ljava/lang/Error;

    if-eqz v4, :cond_26f

    .line 886
    check-cast v3, Ljava/lang/Error;

    .end local v3    # "thrown":Ljava/lang/Throwable;
    throw v3

    .line 868
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v1    # "ir":Ljava/lang/String;
    .restart local v3    # "thrown":Ljava/lang/Throwable;
    :cond_1a1
    :try_start_1a1
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I
    :try_end_1be
    .catch Ljava/io/IOException; {:try_start_1a1 .. :try_end_1be} :catch_125
    .catch Ljava/lang/Throwable; {:try_start_1a1 .. :try_end_1be} :catch_1c0
    .catchall {:try_start_1a1 .. :try_end_1be} :catchall_2c6

    goto/16 :goto_a5

    .line 874
    .end local v1    # "ir":Ljava/lang/String;
    :catch_1c0
    move-exception v2

    .line 875
    .local v2, "t":Ljava/lang/Throwable;
    :try_start_1c1
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$200(Lcom/sun/mail/smtp/SMTPTransport;)Lcom/sun/mail/util/MailLogger;

    move-result-object v4

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "AUTH "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " failed"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6, v2}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1e7
    .catchall {:try_start_1c1 .. :try_end_1e7} :catchall_2c6

    .line 876
    move-object v3, v2

    .line 878
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->noauthdebug:Z
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$000(Lcom/sun/mail/smtp/SMTPTransport;)Z

    move-result v4

    if-eqz v4, :cond_226

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->isTracing()Z
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$100(Lcom/sun/mail/smtp/SMTPTransport;)Z

    move-result v4

    if-eqz v4, :cond_226

    .line 879
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$200(Lcom/sun/mail/smtp/SMTPTransport;)Lcom/sun/mail/util/MailLogger;

    move-result-object v5

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    if-ne v4, v8, :cond_299

    const-string v4, "succeeded"

    :goto_21b
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 881
    :cond_226
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->resumeTracing()V
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$400(Lcom/sun/mail/smtp/SMTPTransport;)V

    .line 882
    iget v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    if-eq v4, v8, :cond_34b

    .line 883
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$500(Lcom/sun/mail/smtp/SMTPTransport;)V

    .line 884
    if-eqz v3, :cond_2ba

    .line 885
    instance-of v4, v3, Ljava/lang/Error;

    if-eqz v4, :cond_29c

    .line 886
    check-cast v3, Ljava/lang/Error;

    .end local v3    # "thrown":Ljava/lang/Throwable;
    throw v3

    .line 879
    .end local v2    # "t":Ljava/lang/Throwable;
    .restart local v1    # "ir":Ljava/lang/String;
    .restart local v3    # "thrown":Ljava/lang/Throwable;
    :cond_23d
    const-string v4, "failed"

    goto/16 :goto_e1

    .line 887
    :cond_241
    instance-of v4, v3, Ljava/lang/Exception;

    if-eqz v4, :cond_253

    .line 888
    new-instance v4, Lkorex/mail/AuthenticationFailedException;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 889
    invoke-virtual {v5}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v5

    check-cast v3, Ljava/lang/Exception;

    .end local v3    # "thrown":Ljava/lang/Throwable;
    invoke-direct {v4, v5, v3}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4

    .line 891
    .restart local v3    # "thrown":Ljava/lang/Throwable;
    :cond_253
    sget-boolean v4, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->$assertionsDisabled:Z

    if-nez v4, :cond_25f

    new-instance v4, Ljava/lang/AssertionError;

    const-string v5, "unknown Throwable"

    invoke-direct {v4, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4

    .line 893
    :cond_25f
    new-instance v4, Lkorex/mail/AuthenticationFailedException;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 894
    invoke-virtual {v5}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 879
    .end local v1    # "ir":Ljava/lang/String;
    .restart local v0    # "ex":Ljava/io/IOException;
    :cond_26b
    const-string v4, "failed"

    goto/16 :goto_17f

    .line 887
    :cond_26f
    instance-of v4, v3, Ljava/lang/Exception;

    if-eqz v4, :cond_281

    .line 888
    new-instance v4, Lkorex/mail/AuthenticationFailedException;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 889
    invoke-virtual {v5}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v5

    check-cast v3, Ljava/lang/Exception;

    .end local v3    # "thrown":Ljava/lang/Throwable;
    invoke-direct {v4, v5, v3}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4

    .line 891
    .restart local v3    # "thrown":Ljava/lang/Throwable;
    :cond_281
    sget-boolean v4, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->$assertionsDisabled:Z

    if-nez v4, :cond_28d

    new-instance v4, Ljava/lang/AssertionError;

    const-string v5, "unknown Throwable"

    invoke-direct {v4, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4

    .line 893
    :cond_28d
    new-instance v4, Lkorex/mail/AuthenticationFailedException;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 894
    invoke-virtual {v5}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 879
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v2    # "t":Ljava/lang/Throwable;
    :cond_299
    const-string v4, "failed"

    goto :goto_21b

    .line 887
    :cond_29c
    instance-of v4, v3, Ljava/lang/Exception;

    if-eqz v4, :cond_2ae

    .line 888
    new-instance v4, Lkorex/mail/AuthenticationFailedException;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 889
    invoke-virtual {v5}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v5

    check-cast v3, Ljava/lang/Exception;

    .end local v3    # "thrown":Ljava/lang/Throwable;
    invoke-direct {v4, v5, v3}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4

    .line 891
    .restart local v3    # "thrown":Ljava/lang/Throwable;
    :cond_2ae
    sget-boolean v4, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->$assertionsDisabled:Z

    if-nez v4, :cond_2ba

    new-instance v4, Ljava/lang/AssertionError;

    const-string v5, "unknown Throwable"

    invoke-direct {v4, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4

    .line 893
    :cond_2ba
    new-instance v4, Lkorex/mail/AuthenticationFailedException;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 894
    invoke-virtual {v5}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 878
    .end local v2    # "t":Ljava/lang/Throwable;
    :catchall_2c6
    move-exception v4

    move-object v5, v4

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->noauthdebug:Z
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$000(Lcom/sun/mail/smtp/SMTPTransport;)Z

    move-result v4

    if-eqz v4, :cond_306

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->isTracing()Z
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$100(Lcom/sun/mail/smtp/SMTPTransport;)Z

    move-result v4

    if-eqz v4, :cond_306

    .line 879
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # getter for: Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$200(Lcom/sun/mail/smtp/SMTPTransport;)Lcom/sun/mail/util/MailLogger;

    move-result-object v6

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "AUTH "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v7, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    if-ne v4, v8, :cond_31d

    const-string v4, "succeeded"

    :goto_2fb
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 881
    :cond_306
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->resumeTracing()V
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$400(Lcom/sun/mail/smtp/SMTPTransport;)V

    .line 882
    iget v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->resp:I

    if-eq v4, v8, :cond_34a

    .line 883
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    # invokes: Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPTransport;->access$500(Lcom/sun/mail/smtp/SMTPTransport;)V

    .line 884
    if-eqz v3, :cond_33e

    .line 885
    instance-of v4, v3, Ljava/lang/Error;

    if-eqz v4, :cond_320

    .line 886
    check-cast v3, Ljava/lang/Error;

    .end local v3    # "thrown":Ljava/lang/Throwable;
    throw v3

    .line 879
    .restart local v3    # "thrown":Ljava/lang/Throwable;
    :cond_31d
    const-string v4, "failed"

    goto :goto_2fb

    .line 887
    :cond_320
    instance-of v4, v3, Ljava/lang/Exception;

    if-eqz v4, :cond_332

    .line 888
    new-instance v4, Lkorex/mail/AuthenticationFailedException;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 889
    invoke-virtual {v5}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v5

    check-cast v3, Ljava/lang/Exception;

    .end local v3    # "thrown":Ljava/lang/Throwable;
    invoke-direct {v4, v5, v3}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4

    .line 891
    .restart local v3    # "thrown":Ljava/lang/Throwable;
    :cond_332
    sget-boolean v4, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->$assertionsDisabled:Z

    if-nez v4, :cond_33e

    new-instance v4, Ljava/lang/AssertionError;

    const-string v5, "unknown Throwable"

    invoke-direct {v4, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4

    .line 893
    :cond_33e
    new-instance v4, Lkorex/mail/AuthenticationFailedException;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 894
    invoke-virtual {v5}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_34a
    throw v5

    .line 897
    :cond_34b
    const/4 v4, 0x1

    return v4
.end method

.method abstract doAuth(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method getInitialResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
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
    .line 907
    const/4 v0, 0x0

    return-object v0
.end method

.method getMechanism()Ljava/lang/String;
    .registers 2

    .prologue
    .line 835
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->mech:Ljava/lang/String;

    return-object v0
.end method
