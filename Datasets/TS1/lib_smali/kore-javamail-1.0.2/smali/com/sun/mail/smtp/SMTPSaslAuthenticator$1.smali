.class Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;
.super Ljava/lang/Object;
.source "SMTPSaslAuthenticator.java"

# interfaces
.implements Ljavax/security/auth/callback/CallbackHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->authenticate([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sun/mail/smtp/SMTPSaslAuthenticator;

.field final synthetic val$p:Ljava/lang/String;

.field final synthetic val$realm:Ljava/lang/String;

.field final synthetic val$u:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/sun/mail/smtp/SMTPSaslAuthenticator;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "this$0"    # Lcom/sun/mail/smtp/SMTPSaslAuthenticator;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->this$0:Lcom/sun/mail/smtp/SMTPSaslAuthenticator;

    iput-object p2, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->val$u:Ljava/lang/String;

    iput-object p3, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->val$p:Ljava/lang/String;

    iput-object p4, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->val$realm:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle([Ljavax/security/auth/callback/Callback;)V
    .registers 11
    .param p1, "callbacks"    # [Ljavax/security/auth/callback/Callback;

    .prologue
    .line 103
    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->this$0:Lcom/sun/mail/smtp/SMTPSaslAuthenticator;

    # getter for: Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v6}, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->access$000(Lcom/sun/mail/smtp/SMTPSaslAuthenticator;)Lcom/sun/mail/util/MailLogger;

    move-result-object v6

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_2b

    .line 104
    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->this$0:Lcom/sun/mail/smtp/SMTPSaslAuthenticator;

    # getter for: Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v6}, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->access$000(Lcom/sun/mail/smtp/SMTPSaslAuthenticator;)Lcom/sun/mail/util/MailLogger;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SASL callback length: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    array-length v8, p1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 105
    :cond_2b
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2c
    array-length v6, p1

    if-ge v1, v6, :cond_d3

    .line 106
    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->this$0:Lcom/sun/mail/smtp/SMTPSaslAuthenticator;

    # getter for: Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v6}, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->access$000(Lcom/sun/mail/smtp/SMTPSaslAuthenticator;)Lcom/sun/mail/util/MailLogger;

    move-result-object v6

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_65

    .line 107
    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->this$0:Lcom/sun/mail/smtp/SMTPSaslAuthenticator;

    # getter for: Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v6}, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->access$000(Lcom/sun/mail/smtp/SMTPSaslAuthenticator;)Lcom/sun/mail/util/MailLogger;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SASL callback "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, p1, v1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 108
    :cond_65
    aget-object v6, p1, v1

    instance-of v6, v6, Ljavax/security/auth/callback/NameCallback;

    if-eqz v6, :cond_77

    .line 109
    aget-object v3, p1, v1

    check-cast v3, Ljavax/security/auth/callback/NameCallback;

    .line 110
    .local v3, "ncb":Ljavax/security/auth/callback/NameCallback;
    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->val$u:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljavax/security/auth/callback/NameCallback;->setName(Ljava/lang/String;)V

    .line 105
    .end local v3    # "ncb":Ljavax/security/auth/callback/NameCallback;
    :cond_74
    :goto_74
    add-int/lit8 v1, v1, 0x1

    goto :goto_2c

    .line 111
    :cond_77
    aget-object v6, p1, v1

    instance-of v6, v6, Ljavax/security/auth/callback/PasswordCallback;

    if-eqz v6, :cond_8b

    .line 112
    aget-object v4, p1, v1

    check-cast v4, Ljavax/security/auth/callback/PasswordCallback;

    .line 113
    .local v4, "pcb":Ljavax/security/auth/callback/PasswordCallback;
    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->val$p:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toCharArray()[C

    move-result-object v6

    invoke-virtual {v4, v6}, Ljavax/security/auth/callback/PasswordCallback;->setPassword([C)V

    goto :goto_74

    .line 114
    .end local v4    # "pcb":Ljavax/security/auth/callback/PasswordCallback;
    :cond_8b
    aget-object v6, p1, v1

    instance-of v6, v6, Ljavax/security/sasl/RealmCallback;

    if-eqz v6, :cond_a4

    .line 115
    aget-object v5, p1, v1

    check-cast v5, Ljavax/security/sasl/RealmCallback;

    .line 116
    .local v5, "rcb":Ljavax/security/sasl/RealmCallback;
    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->val$realm:Ljava/lang/String;

    if-eqz v6, :cond_9f

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->val$realm:Ljava/lang/String;

    :goto_9b
    invoke-virtual {v5, v6}, Ljavax/security/sasl/RealmCallback;->setText(Ljava/lang/String;)V

    goto :goto_74

    .line 117
    :cond_9f
    invoke-virtual {v5}, Ljavax/security/sasl/RealmCallback;->getDefaultText()Ljava/lang/String;

    move-result-object v6

    goto :goto_9b

    .line 118
    .end local v5    # "rcb":Ljavax/security/sasl/RealmCallback;
    :cond_a4
    aget-object v6, p1, v1

    instance-of v6, v6, Ljavax/security/sasl/RealmChoiceCallback;

    if-eqz v6, :cond_74

    .line 119
    aget-object v5, p1, v1

    check-cast v5, Ljavax/security/sasl/RealmChoiceCallback;

    .line 121
    .local v5, "rcb":Ljavax/security/sasl/RealmChoiceCallback;
    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->val$realm:Ljava/lang/String;

    if-nez v6, :cond_ba

    .line 122
    invoke-virtual {v5}, Ljavax/security/sasl/RealmChoiceCallback;->getDefaultChoice()I

    move-result v6

    invoke-virtual {v5, v6}, Ljavax/security/sasl/RealmChoiceCallback;->setSelectedIndex(I)V

    goto :goto_74

    .line 125
    :cond_ba
    invoke-virtual {v5}, Ljavax/security/sasl/RealmChoiceCallback;->getChoices()[Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "choices":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_bf
    array-length v6, v0

    if-ge v2, v6, :cond_74

    .line 127
    aget-object v6, v0, v2

    iget-object v7, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;->val$realm:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d0

    .line 128
    invoke-virtual {v5, v2}, Ljavax/security/sasl/RealmChoiceCallback;->setSelectedIndex(I)V

    goto :goto_74

    .line 126
    :cond_d0
    add-int/lit8 v2, v2, 0x1

    goto :goto_bf

    .line 135
    .end local v0    # "choices":[Ljava/lang/String;
    .end local v2    # "k":I
    .end local v5    # "rcb":Ljavax/security/sasl/RealmChoiceCallback;
    :cond_d3
    return-void
.end method
